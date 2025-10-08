import 'package:a/core/config/service.dart';
import 'package:a/modules/appointment/models/appointment_model.dart';

class AppointmentRepository {
  final ServiceRepo _serviceRepo = ServiceRepo();

  // Get appointment summary statistics
  Future<AppointmentSummary?> getAppointmentSummary(String token) async {
    final response = await _serviceRepo.requist(
      'appointments/summary',
      method: 'GET',
      token: token,
    );

    if (response != null) {
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

  // Get single appointment details
  Future<Appointment?> getAppointmentById(
    String appointmentId,
    String token,
  ) async {
    final response = await _serviceRepo.requist(
      'appointments/$appointmentId',
      method: 'GET',
      token: token,
    );

    if (response != null) {
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
    final body = {
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
      body: body,
      token: token,
    );

    if (response != null) {
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Update appointment
  Future<Appointment?> updateAppointment({
    required String appointmentId,
    required String token,
    String? status,
    String? appointmentDate,
    String? appointmentTime,
    String? reasonForVisit,
    String? notes,
    String? paymentMethod,
  }) async {
    final body = <String, dynamic>{};

    if (status != null) body['status'] = status;
    if (appointmentDate != null) body['appointmentDate'] = appointmentDate;
    if (appointmentTime != null) body['appointmentTime'] = appointmentTime;
    if (reasonForVisit != null) body['reasonForVisit'] = reasonForVisit;
    if (notes != null) body['notes'] = notes;
    if (paymentMethod != null) body['paymentMethod'] = paymentMethod;

    final response = await _serviceRepo.requist(
      'appointments/$appointmentId',
      method: 'PUT',
      body: body,
      token: token,
    );

    if (response != null) {
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Cancel appointment
  Future<bool> cancelAppointment(String appointmentId, String token) async {
    final response = await _serviceRepo.requist(
      'appointments/$appointmentId/cancel',
      method: 'PUT',
      token: token,
    );

    return response != null;
  }

  // Reschedule appointment
  Future<Appointment?> rescheduleAppointment({
    required String appointmentId,
    required String token,
    required String newDate,
    required String newTime,
    String? reason,
  }) async {
    final body = {
      'appointmentDate': newDate,
      'appointmentTime': newTime,
      if (reason != null) 'reason': reason,
    };

    final response = await _serviceRepo.requist(
      'appointments/$appointmentId/reschedule',
      method: 'PUT',
      body: body,
      token: token,
    );

    if (response != null) {
      return Appointment.fromJson(response);
    }
    return null;
  }

  // Get available doctors by department
  Future<List<Doctor>?> getDoctorsByDepartment(
    String department,
    String token,
  ) async {
    final response = await _serviceRepo.requist(
      'doctors/department/$department',
      method: 'GET',
      token: token,
    );

    if (response != null && response['doctors'] != null) {
      final List<dynamic> doctorsJson = response['doctors'];
      return doctorsJson.map((json) => Doctor.fromJson(json)).toList();
    }
    return null;
  }

  // Get available time slots for a doctor on a specific date
  Future<List<TimeSlot>?> getAvailableTimeSlots({
    required String doctorId,
    required String date,
    required String token,
  }) async {
    final response = await _serviceRepo.requist(
      'doctors/$doctorId/available-slots?date=$date',
      method: 'GET',
      token: token,
    );

    if (response != null && response['timeSlots'] != null) {
      final List<dynamic> slotsJson = response['timeSlots'];
      return slotsJson.map((json) => TimeSlot.fromJson(json)).toList();
    }
    return null;
  }

  // Get all departments
  Future<List<Department>?> getDepartments(String token) async {
    final response = await _serviceRepo.requist(
      'departments',
      method: 'GET',
      token: token,
    );

    if (response != null && response['departments'] != null) {
      final List<dynamic> departmentsJson = response['departments'];
      return departmentsJson.map((json) => Department.fromJson(json)).toList();
    }
    return null;
  }

  // Get consultation types
  Future<List<ConsultationType>?> getConsultationTypes(String token) async {
    final response = await _serviceRepo.requist(
      'consultation-types',
      method: 'GET',
      token: token,
    );

    if (response != null && response['consultationTypes'] != null) {
      final List<dynamic> typesJson = response['consultationTypes'];
      return typesJson.map((json) => ConsultationType.fromJson(json)).toList();
    }
    return null;
  }

  // Search patients by mobile or ID
  Future<List<Patient>?> searchPatients({
    required String query,
    required String searchType, // 'mobile' or 'id'
    required String token,
  }) async {
    final response = await _serviceRepo.requist(
      'patients/search?query=$query&type=$searchType',
      method: 'GET',
      token: token,
    );

    if (response != null && response['patients'] != null) {
      final List<dynamic> patientsJson = response['patients'];
      return patientsJson.map((json) => Patient.fromJson(json)).toList();
    }
    return null;
  }

  // Get patient by ID
  Future<Patient?> getPatientById(String patientId, String token) async {
    final response = await _serviceRepo.requist(
      'patients/$patientId',
      method: 'GET',
      token: token,
    );

    if (response != null) {
      return Patient.fromJson(response);
    }
    return null;
  }

  // Get medical records for a patient
  Future<List<MedicalRecord>?> getMedicalRecords(
    String patientId,
    String token,
  ) async {
    final response = await _serviceRepo.requist(
      'patients/$patientId/medical-records',
      method: 'GET',
      token: token,
    );

    if (response != null && response['medicalRecords'] != null) {
      final List<dynamic> recordsJson = response['medicalRecords'];
      return recordsJson.map((json) => MedicalRecord.fromJson(json)).toList();
    }
    return null;
  }

  // Get prescriptions for a patient
  Future<List<Prescription>?> getPrescriptions(
    String patientId,
    String token,
  ) async {
    final response = await _serviceRepo.requist(
      'patients/$patientId/prescriptions',
      method: 'GET',
      token: token,
    );

    if (response != null && response['prescriptions'] != null) {
      final List<dynamic> prescriptionsJson = response['prescriptions'];
      return prescriptionsJson
          .map((json) => Prescription.fromJson(json))
          .toList();
    }
    return null;
  }

  // Get appointment history for a patient
  Future<List<Appointment>?> getAppointmentHistory(
    String patientId,
    String token,
  ) async {
    final response = await _serviceRepo.requist(
      'patients/$patientId/appointment-history',
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

  // Process payment for appointment
  Future<Map<String, dynamic>?> processPayment({
    required String appointmentId,
    required String paymentMethod,
    required double amount,
    required String token,
  }) async {
    final body = {
      'appointmentId': appointmentId,
      'paymentMethod': paymentMethod,
      'amount': amount,
    };

    final response = await _serviceRepo.requist(
      'payments/process',
      method: 'POST',
      body: body,
      token: token,
    );

    return response;
  }
}
