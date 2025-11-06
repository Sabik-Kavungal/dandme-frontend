import 'package:a/core/config/service.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/models/appointment_list_item_model.dart';
import 'package:a/modules/clinic/models/appointment_history_model.dart';

class ClinicAppointmentRepository {
  final ServiceRepo _serviceRepo = ServiceRepo();

  // Get appointment summary statistics
  Future<AppointmentSummary?> getAppointmentSummary(String token) async {
    final response = await _serviceRepo.requist(
      'appointments/summary',
      method: 'GET',
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      return AppointmentSummary.fromJson(response);
    }
    return null;
  }

  // Get all appointments with pagination and filters
  Future<List<Appointment>?> getAppointments({
    required String token,
    int page = 1,
    int limit = 10,
    String? status,
    String? department,
    String? doctorId,
    String? patientId,
    String? searchQuery,
  }) async {
    final queryParams = <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
    };

    if (status != null) queryParams['status'] = status;
    if (department != null) queryParams['department'] = department;
    if (doctorId != null) queryParams['doctorId'] = doctorId;
    if (patientId != null) queryParams['patientId'] = patientId;
    if (searchQuery != null) queryParams['search'] = searchQuery;

    final queryString = queryParams.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');

    try {
      final response = await _serviceRepo.requist(
        'appointments/list?$queryString',
        method: 'GET',
        token: token,
        useAppointmentsApi: true, // Use the appointments microservice
      );

      print('=== Appointments API Response ===');
      print('Response: $response');
      print('Response type: ${response.runtimeType}');

      if (response != null && response is Map<String, dynamic>) {
        if (response['appointments'] != null) {
          final List<dynamic> appointmentsJson = response['appointments'];
          print('Found ${appointmentsJson.length} appointments');

          final appointments = appointmentsJson
              .map((json) {
                try {
                  return Appointment.fromJson(json as Map<String, dynamic>);
                } catch (e) {
                  print('Error parsing appointment: $e');
                  print('Appointment JSON: $json');
                  return null;
                }
              })
              .whereType<Appointment>()
              .toList();

          print('Successfully parsed ${appointments.length} appointments');
          return appointments;
        }
      }
    } catch (e) {
      print('Error fetching appointments: $e');
    }

    return null;
  }

  // Get appointments by status
  Future<List<Appointment>> getAppointmentsByStatus(
    String token,
    String status,
  ) async {
    final response = await _serviceRepo.requist(
      'appointments?status=$status',
      method: 'GET',
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is List) {
      return response
          .map((json) => Appointment.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Get appointment details by ID using the simple appointments API
  Future<AppointmentDetails?> getAppointmentDetails(
    String token,
    String id,
  ) async {
    final response = await _serviceRepo.requist(
      'appointments/simple/$id',
      method: 'GET',
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      // Handle the API response structure with nested appointment object
      if (response['appointment'] != null) {
        return AppointmentDetails.fromJson(response['appointment']);
      }
      return AppointmentDetails.fromJson(response);
    }
    return null;
  }

  // Get appointment by ID using the simple appointments API
  Future<Appointment?> getAppointmentById(String token, String id) async {
    final response = await _serviceRepo.requist(
      'appointments/simple/$id',
      method: 'GET',
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      // Handle the API response structure with nested appointment object
      if (response['appointment'] != null) {
        return Appointment.fromJson(response['appointment']);
      }
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Create new appointment
  Future<Appointment?> createAppointment({
    required String token,
    required String patientId,
    required String doctorId,
    required String department,
    required String consultationType,
    required String appointmentDate,
    required String appointmentTime,
    required String reasonForVisit,
    String? notes,
    String? paymentMethod,
  }) async {
    // Determine slot type based on consultation type
    String slotType;
    if (consultationType == "video" || consultationType == "online") {
      slotType = "online";
    } else {
      slotType = "offline";
    }

    final appointmentData = {
      'patientId': patientId,
      'doctorId': doctorId,
      'department': department,
      'consultationType': consultationType,
      'slotType': slotType,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'reasonForVisit': reasonForVisit,
      if (notes != null) 'notes': notes,
      if (paymentMethod != null) 'paymentMethod': paymentMethod,
    };

    final response = await _serviceRepo.requist(
      'appointments',
      method: 'POST',
      body: appointmentData,
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Create appointment using simple API (for clinic patients)
  Future<SimpleAppointmentResponse?> createSimpleAppointment({
    required String token,
    required String clinicPatientId,
    required String doctorId,
    required String clinicId,
    required String individualSlotId,
    required String appointmentDate,
    required String appointmentTime,
    required String
    consultationType, // ✅ Can be: clinic_visit, video_consultation, follow-up-via-clinic, follow-up-via-video
    String? departmentId,
    String? reason,
    String? notes,
    String? paymentMethod, // ✅ Optional for follow-ups
    String? paymentType,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CREATING SIMPLE APPOINTMENT                                ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👤 Clinic Patient ID: $clinicPatientId');
      print('👨‍⚕️ Doctor ID: $doctorId');
      print('🏥 Clinic ID: $clinicId');
      if (departmentId != null) print('🏢 Department ID: $departmentId');
      print('🎫 Slot ID: $individualSlotId');
      print('📅 Date: $appointmentDate');
      print('🕐 Time: $appointmentTime');
      print('💻 Type: $consultationType');
      final isFollowUp = consultationType.startsWith('follow-up');
      print('🔄 Is Follow-Up: $isFollowUp (auto-detected from type)');
      if (paymentMethod != null) {
        print('💳 Payment Method: $paymentMethod');
        print('💳 Payment Type: ${paymentType ?? 'N/A'}');
      } else if (isFollowUp) {
        print('💰 Payment: FREE (Follow-up)');
      } else {
        print('💳 Payment: N/A');
      }
      print('');

      final appointmentData = {
        'clinic_patient_id': clinicPatientId,
        'doctor_id': doctorId,
        'clinic_id': clinicId,
        if (departmentId != null && departmentId.isNotEmpty)
          'department_id': departmentId,
        'individual_slot_id': individualSlotId,
        'appointment_date': appointmentDate,
        'appointment_time': appointmentTime,
        'consultation_type':
            consultationType, // ✅ Backend auto-detects is_follow_up from this
        if (reason != null && reason.isNotEmpty) 'reason': reason,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
        if (paymentMethod != null) 'payment_method': paymentMethod,
        if (paymentType != null) 'payment_type': paymentType,
      };

      print('📤 Request Body:');
      print('   ${appointmentData.toString()}');
      print('');

      final response = await _serviceRepo.requist(
        'appointments/simple',
        method: 'POST',
        body: appointmentData,
        token: token,
        useAppointmentsApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        // Check if response contains an error
        if (response['error'] != null) {
          final errorMsg = response['error'].toString();
          print('❌ API Error: $errorMsg');
          print('');
          throw Exception(errorMsg);
        }

        // Check if response has appointment data
        if (response['appointment'] == null) {
          print('❌ No appointment data in response');
          print('');
          return null;
        }

        print('✅ Appointment Created Successfully!');

        // Parse response using model
        final appointmentResponse = SimpleAppointmentResponse.fromJson(
          response,
        );

        print(
          '   Booking Number: ${appointmentResponse.appointment.bookingNumber}',
        );
        print(
          '   Token Number: #${appointmentResponse.appointment.tokenNumber}',
        );
        print('   Status: ${appointmentResponse.appointment.status}');
        print('   Fee: ${appointmentResponse.appointment.feeAmount}');
        print('');

        return appointmentResponse;
      }

      print('❌ No response from server');
      print('');
      return null;
    } catch (e) {
      print('❌ Error creating simple appointment: $e');
      print('');
      rethrow;
    }
  }

  // Update appointment
  Future<Appointment?> updateAppointment({
    required String token,
    required String appointmentId,
    required String appointmentDate,
    required String appointmentTime,
    String? reasonForVisit,
    String? notes,
  }) async {
    final appointmentData = {
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      if (reasonForVisit != null) 'reasonForVisit': reasonForVisit,
      if (notes != null) 'notes': notes,
    };

    final response = await _serviceRepo.requist(
      'appointments/$appointmentId',
      method: 'PUT',
      body: appointmentData,
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Delete appointment
  Future<bool> deleteAppointment(String token, String id) async {
    final response = await _serviceRepo.requist(
      'appointments/$id',
      method: 'DELETE',
      token: token,
      useAppointmentsApi: true,
    );

    return response != null;
  }

  // Get departments
  Future<List<Department>> getDepartments(String token) async {
    final response = await _serviceRepo.requist(
      'departments',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map((json) => Department.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Get doctors
  Future<List<Doctor>> getDoctors(String token) async {
    final response = await _serviceRepo.requist(
      'doctors',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map((json) => Doctor.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Get patients
  Future<List<Patient>> getPatients(String token) async {
    final response = await _serviceRepo.requist(
      'patients',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map((json) => Patient.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Get consultation types
  Future<List<ConsultationType>> getConsultationTypes(String token) async {
    final response = await _serviceRepo.requist(
      'consultation-types',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map(
            (json) => ConsultationType.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    }
    return [];
  }

  // Get time slots
  Future<List<TimeSlot>> getTimeSlots(
    String token,
    String doctorId,
    String date,
  ) async {
    final response = await _serviceRepo.requist(
      'time-slots?doctor_id=$doctorId&date=$date',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map((json) => TimeSlot.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Confirm payment
  Future<bool> confirmPayment(
    String token,
    String appointmentId,
    Map<String, dynamic> paymentData,
  ) async {
    final response = await _serviceRepo.requist(
      'appointments/$appointmentId/payment',
      method: 'POST',
      body: paymentData,
      token: token,
      useAppointmentsApi: true,
    );

    return response != null;
  }

  // Reschedule simple appointment
  Future<AppointmentDetails?> rescheduleSimpleAppointment({
    required String token,
    required String appointmentId,
    required String doctorId,
    required String individualSlotId,
    required String appointmentDate,
    required String appointmentTime,
    String? departmentId,
    String? reason,
    String? notes,
  }) async {
    final rescheduleData = {
      'doctor_id': doctorId,
      'individual_slot_id': individualSlotId,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
      if (departmentId != null) 'department_id': departmentId,
      if (reason != null) 'reason': reason,
      if (notes != null) 'notes': notes,
    };

    final response = await _serviceRepo.requist(
      'appointments/simple/$appointmentId/reschedule',
      method: 'POST',
      body: rescheduleData,
      token: token,
      useAppointmentsApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      if (response['appointment'] != null) {
        return AppointmentDetails.fromJson(response['appointment']);
      }
    }
    return null;
  }

  // Cancel appointment
  Future<bool> cancelAppointment(String token, String appointmentId) async {
    final response = await _serviceRepo.requist(
      'appointments/$appointmentId/cancel',
      method: 'PUT',
      token: token,
      useAppointmentsApi: true,
    );

    return response != null;
  }

  // Get doctors by department
  Future<List<Doctor>> getDoctorsByDepartment(
    String token,
    String departmentId,
  ) async {
    final response = await _serviceRepo.requist(
      'doctors?department_id=$departmentId',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map((json) => Doctor.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Get available time slots
  Future<List<TimeSlot>> getAvailableTimeSlots(
    String token,
    String doctorId,
    String date,
  ) async {
    return getTimeSlots(token, doctorId, date);
  }

  // Search patients
  Future<List<Patient>> searchPatients(String token, String query) async {
    final response = await _serviceRepo.requist(
      'patients/search?q=$query',
      method: 'GET',
      token: token,
    );

    if (response != null && response is List) {
      return response
          .map((json) => Patient.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Process payment
  Future<bool> processPayment(
    String token,
    String appointmentId,
    Map<String, dynamic> paymentData,
  ) async {
    return confirmPayment(token, appointmentId, paymentData);
  }

  /// Get simple appointment list optimized for table display
  /// Uses the /api/appointments/simple-list endpoint
  Future<SimpleAppointmentListResponse?> getSimpleAppointmentList({
    required String token,
    required String clinicId,
    String? date,
    String? doctorId, // ✅ NEW: Doctor filter parameter
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     FETCHING SIMPLE APPOINTMENT LIST                          ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Clinic ID: $clinicId');
      if (date != null) print('📅 Date Filter: $date');
      if (doctorId != null && doctorId != 'all') {
        print('👨‍⚕️ Doctor Filter: $doctorId');
      } else {
        print('👨‍⚕️ Doctor Filter: All Doctors');
      }
      print('');

      final queryParams = <String, String>{'clinic_id': clinicId};

      if (date != null && date.isNotEmpty) {
        queryParams['date'] = date;
      }

      // ✅ Add doctor_id filter if provided and not "all"
      if (doctorId != null && doctorId.isNotEmpty && doctorId != 'all') {
        queryParams['doctor_id'] = doctorId;
      }

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');

      final response = await _serviceRepo.requist(
        'appointments/simple-list?$queryString',
        method: 'GET',
        token: token,
        useAppointmentsApi: true, // Uses port 8082
      );

      if (response != null) {
        print('📥 Response received with ${response['total']} appointments');
        final result = SimpleAppointmentListResponse.fromJson(response);

        // Log appointments summary
        print('✅ Loaded ${result.appointments.length} appointments:');
        for (var i = 0; i < result.appointments.length && i < 5; i++) {
          final apt = result.appointments[i];
          print(
            '   ${i + 1}. Token: ${apt.tokenNumber} | ${apt.patientName} | ${apt.doctorName}',
          );
        }
        if (result.appointments.length > 5) {
          print('   ... and ${result.appointments.length - 5} more');
        }
        print('');

        return result;
      }

      print('❌ No response from API');
      print('');
      return null;
    } catch (e) {
      print('❌ Error fetching simple appointment list: $e');
      print('');
      rethrow;
    }
  }

  /// Get simple appointment list for today
  Future<SimpleAppointmentListResponse?> getTodayAppointments({
    required String token,
    required String clinicId,
  }) async {
    final today = DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD
    return getSimpleAppointmentList(
      token: token,
      clinicId: clinicId,
      date: today,
    );
  }

  /// Get appointment history for a clinic patient
  /// GET /api/v1/appointments/history/:clinic_patient_id
  Future<AppointmentHistoryResponse?> getAppointmentHistory({
    required String token,
    required String clinicPatientId,
    String? clinicId,
    int limit = 50,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print('║         GET APPOINTMENT HISTORY API CALL                     ║');
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 GET /appointments/history/$clinicPatientId');
      print('   clinic_patient_id: $clinicPatientId');
      if (clinicId != null) {
        print('   clinic_id: $clinicId');
      }
      if (limit != 50) {
        print('   limit: $limit');
      }
      print('');

      final queryParams = <String, String>{};
      if (clinicId != null && clinicId.isNotEmpty) {
        queryParams['clinic_id'] = clinicId;
      }
      if (limit != 50 && limit > 0) {
        queryParams['limit'] = limit.toString();
      }

      final queryString = queryParams.isNotEmpty
          ? '?${Uri(queryParameters: queryParams).query}'
          : '';

      final response = await _serviceRepo.requist(
        'appointments/history/$clinicPatientId$queryString',
        method: 'GET',
        token: token,
        useAppointmentsApi: true,
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null) {
        // Check if response contains an error
        if (response is Map<String, dynamic> && response.containsKey('error')) {
          final errorMsg = response['error']?.toString() ?? 'Unknown error';
          print('❌ API Error: $errorMsg');
          print('');
          return null;
        }

        try {
          print('✅ SUCCESS: Appointment history fetched successfully');
          print('');
          return AppointmentHistoryResponse.fromJson(response);
        } catch (e) {
          print('❌ Error parsing appointment history response: $e');
          print('');
          return null;
        }
      }

      print('⚠️ WARNING: Response is null');
      print('');
      return null;
    } catch (e) {
      print('❌ Error getting appointment history: $e');
      print('');
      return null;
    }
  }

  /// Update appointment status
  /// PATCH /api/v1/appointments/simple/:id/status
  Future<Map<String, dynamic>?> updateAppointmentStatus({
    required String token,
    required String appointmentId,
    required String clinicPatientId,
    required String status,
    String? notes,
    String? clinicId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print('║         UPDATE APPOINTMENT STATUS API CALL                ║');
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 PATCH /appointments/simple/$appointmentId/status');
      print('   appointment_id: $appointmentId');
      print('   clinic_patient_id: $clinicPatientId');
      print('   status: $status');
      if (clinicId != null) {
        print('   clinic_id: $clinicId');
      }
      if (notes != null && notes.isNotEmpty) {
        print('   notes: $notes');
      }
      print('');

      final queryParams = <String, String>{
        'clinic_patient_id': clinicPatientId,
      };
      if (clinicId != null && clinicId.isNotEmpty) {
        queryParams['clinic_id'] = clinicId;
      }

      final queryString = Uri(queryParameters: queryParams).query;

      final requestBody = <String, dynamic>{'status': status};
      if (notes != null && notes.isNotEmpty) {
        requestBody['notes'] = notes;
      }

      final response = await _serviceRepo.requist(
        'appointments/simple/$appointmentId/status?$queryString',
        method: 'PATCH',
        token: token,
        useAppointmentsApi: true,
        body: requestBody,
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null) {
        // Check if response contains an error (for 400, 500, etc.)
        if (response is Map<String, dynamic>) {
          if (response.containsKey('error')) {
            final errorMsg = response['error']?.toString() ?? 'Unknown error';
            final details = response['details']?.toString();
            final fullError = details != null && details.isNotEmpty
                ? '$errorMsg: $details'
                : errorMsg;
            print('❌ API Error: $fullError');
            print('');
            // Return error response so ViewModel can extract the error message
            return response;
          }

          // Check for success response
          if (response.containsKey('success') && response['success'] == true) {
            print('✅ SUCCESS: Appointment status updated successfully');
            print('');
            return response;
          }
        }

        // If response is not a map or doesn't have expected structure, try to return it
        try {
          print('✅ SUCCESS: Appointment status updated successfully');
          print('');
          return response as Map<String, dynamic>;
        } catch (e) {
          print('❌ Error parsing status update response: $e');
          print('');
          return null;
        }
      }

      print('⚠️ WARNING: Response is null');
      print('');
      return null;
    } catch (e) {
      print('❌ Error updating appointment status: $e');
      print('');
      return null;
    }
  }
}
