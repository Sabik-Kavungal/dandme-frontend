import 'package:a/core/config/service.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';

class ClinicAppointmentRepository {
  final ServiceRepo _serviceRepo = ServiceRepo();

  // Get appointment summary statistics
  Future<AppointmentSummary?> getAppointmentSummary(String token) async {
    final response = await _serviceRepo.requist(
      'appointments/summary',
      method: 'GET',
      token: token,
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

    final response = await _serviceRepo.requist(
      'appointments?$queryString',
      method: 'GET',
      token: token,
    );

    if (response != null && response['appointments'] != null) {
      final List<dynamic> appointmentsJson = response['appointments'];
      return appointmentsJson
          .map((json) => Appointment.fromJson(json))
          .toList();
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
    );

    if (response != null && response is List) {
      return response
          .map((json) => Appointment.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Get appointment by ID
  Future<Appointment?> getAppointmentById(String token, String id) async {
    final response = await _serviceRepo.requist(
      'appointments/$id',
      method: 'GET',
      token: token,
    );

    if (response != null && response is Map<String, dynamic>) {
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
    final appointmentData = {
      'patientId': patientId,
      'doctorId': doctorId,
      'department': department,
      'consultationType': consultationType,
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
    );

    if (response != null && response is Map<String, dynamic>) {
      return Appointment.fromJson(response);
    }
    return null;
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
    );

    return response != null;
  }

  // Reschedule appointment
  Future<Appointment?> rescheduleAppointment({
    required String token,
    required String appointmentId,
    required String newDate,
    required String newTime,
    String? reason,
  }) async {
    final rescheduleData = {
      'newDate': newDate,
      'newTime': newTime,
      if (reason != null) 'reason': reason,
    };

    final response = await _serviceRepo.requist(
      'appointments/$appointmentId/reschedule',
      method: 'PUT',
      body: rescheduleData,
      token: token,
    );

    if (response != null && response is Map<String, dynamic>) {
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Cancel appointment
  Future<bool> cancelAppointment(String token, String appointmentId) async {
    final response = await _serviceRepo.requist(
      'appointments/$appointmentId/cancel',
      method: 'PUT',
      token: token,
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
}
