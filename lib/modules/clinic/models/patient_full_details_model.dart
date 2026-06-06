class PatientFullDetailsResponse {
  final PatientInfo patientInfo;
  final double totalSpent;
  final int totalAppointments;
  final List<DoctorVisitSummary> doctorVisits;
  final List<VitalSignSummary> recentVitals;
  final List<TimelineEventSummary> visitTimeline;

  PatientFullDetailsResponse({
    required this.patientInfo,
    required this.totalSpent,
    required this.totalAppointments,
    required this.doctorVisits,
    required this.recentVitals,
    required this.visitTimeline,
  });

  factory PatientFullDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PatientFullDetailsResponse(
      patientInfo: PatientInfo.fromJson(json['patient_info'] ?? {}),
      totalSpent: (json['total_spent'] ?? 0).toDouble(),
      totalAppointments: json['total_appointments'] ?? 0,
      doctorVisits: (json['doctor_visits'] as List? ?? [])
          .map((e) => DoctorVisitSummary.fromJson(e))
          .toList(),
      recentVitals: (json['recent_vitals'] as List? ?? [])
          .map((e) => VitalSignSummary.fromJson(e))
          .toList(),
      visitTimeline: (json['visit_timeline'] as List? ?? [])
          .map((e) => TimelineEventSummary.fromJson(e))
          .toList(),
    );
  }
}

class PatientInfo {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String dateOfBirth;
  final int age;
  final String gender;
  final String bloodGroup;
  final String moid;
  final String medicalHistory;
  final String allergies;
  final String address;

  PatientInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.bloodGroup,
    required this.moid,
    required this.medicalHistory,
    required this.allergies,
    required this.address,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) {
    return PatientInfo(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      bloodGroup: json['blood_group'] ?? '',
      moid: json['mo_id'] ?? '',
      medicalHistory: json['medical_history'] ?? '',
      allergies: json['allergies'] ?? '',
      address: json['address'] ?? '',
    );
  }

  String get fullName => '$firstName $lastName'.trim();
}

class DoctorVisitSummary {
  final String doctorId;
  final String doctorName;
  final String departmentName;
  final int totalVisits;
  final int normalVisits;
  final int walkinVisits;
  final double totalPaid;
  final String lastVisitDate;
  final List<DetailAppointment> appointments;

  DoctorVisitSummary({
    required this.doctorId,
    required this.doctorName,
    required this.departmentName,
    required this.totalVisits,
    required this.normalVisits,
    required this.walkinVisits,
    required this.totalPaid,
    required this.lastVisitDate,
    required this.appointments,
  });

  factory DoctorVisitSummary.fromJson(Map<String, dynamic> json) {
    return DoctorVisitSummary(
      doctorId: json['doctor_id'] ?? '',
      doctorName: json['doctor_name'] ?? '',
      departmentName: json['department_name'] ?? '',
      totalVisits: json['total_visits'] ?? 0,
      normalVisits: json['normal_visits'] ?? 0,
      walkinVisits: json['walkin_visits'] ?? 0,
      totalPaid: (json['total_paid'] ?? 0).toDouble(),
      lastVisitDate: json['last_visit_date'] ?? '',
      appointments: (json['appointments'] as List? ?? [])
          .map((e) => DetailAppointment.fromJson(e))
          .toList(),
    );
  }
}

class DetailAppointment {
  final String appointmentId;
  final String date;
  final String time;
  final String type;
  final String status;
  final double feeAmount;
  final String paymentStatus;
  final String diagnosis;
  final String followupStatus;
  final String followupValidTill;

  DetailAppointment({
    required this.appointmentId,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
    required this.feeAmount,
    required this.paymentStatus,
    required this.diagnosis,
    required this.followupStatus,
    required this.followupValidTill,
  });

  factory DetailAppointment.fromJson(Map<String, dynamic> json) {
    return DetailAppointment(
      appointmentId: json['appointment_id'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      feeAmount: (json['fee_amount'] ?? 0).toDouble(),
      paymentStatus: json['payment_status'] ?? '',
      diagnosis: json['diagnosis'] ?? '',
      followupStatus: json['followup_status'] ?? '',
      followupValidTill: json['followup_valid_till'] ?? '',
    );
  }
}

class VitalSignSummary {
  final String id;
  final String recordedAt;
  final String bloodPressure;
  final int pulseRate;
  final double temperature;
  final double weightKg;
  final int spo2;

  VitalSignSummary({
    required this.id,
    required this.recordedAt,
    required this.bloodPressure,
    required this.pulseRate,
    required this.temperature,
    required this.weightKg,
    required this.spo2,
  });

  factory VitalSignSummary.fromJson(Map<String, dynamic> json) {
    return VitalSignSummary(
      id: json['id']?.toString() ?? '',
      recordedAt: json['recorded_at'] ?? '',
      bloodPressure: json['blood_pressure'] ?? '',
      pulseRate: json['pulse_rate'] ?? 0,
      temperature: (json['temperature'] ?? 0).toDouble(),
      weightKg: (json['weight_kg'] ?? 0).toDouble(),
      spo2: json['spo2'] ?? 0,
    );
  }
}

class TimelineEventSummary {
  final String date;
  final String type;
  final String description;

  TimelineEventSummary({
    required this.date,
    required this.type,
    required this.description,
  });

  factory TimelineEventSummary.fromJson(Map<String, dynamic> json) {
    return TimelineEventSummary(
      date: json['date'] ?? '',
      type: json['type'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

// Request model for editing vitals
class UpdateVitalsInput {
  final int? systolicBp;
  final int? diastolicBp;
  final String? bloodPressure;
  final double? temperature;
  final int? pulseRate;
  final int? spo2Percent;
  final double? weightKg;
  final String? notes;

  UpdateVitalsInput({
    this.systolicBp,
    this.diastolicBp,
    this.bloodPressure,
    this.temperature,
    this.pulseRate,
    this.spo2Percent,
    this.weightKg,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (systolicBp != null) data['systolic_bp'] = systolicBp;
    if (diastolicBp != null) data['diastolic_bp'] = diastolicBp;
    if (bloodPressure != null) data['blood_pressure'] = bloodPressure;
    if (temperature != null) data['temperature'] = temperature;
    if (pulseRate != null) data['pulse_rate'] = pulseRate;
    if (spo2Percent != null) data['spo2_percent'] = spo2Percent;
    if (weightKg != null) data['weight_kg'] = weightKg;
    if (notes != null) data['notes'] = notes;
    return data;
  }
}

class UpdatePatientInput {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? medicalHistory;
  final String? allergies;
  final String? bloodGroup;
  final int? age;
  final String? gender;
  final int? heightCm;
  final int? weightKg;
  final String? smokingStatus;
  final String? alcoholUse;
  final bool? isActive;
  final String? address;

  UpdatePatientInput({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.medicalHistory,
    this.allergies,
    this.bloodGroup,
    this.age,
    this.gender,
    this.heightCm,
    this.weightKg,
    this.smokingStatus,
    this.alcoholUse,
    this.isActive,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (firstName != null) data['first_name'] = firstName;
    if (lastName != null) data['last_name'] = lastName;
    if (phone != null) data['phone'] = phone;
    if (email != null) data['email'] = email;
    if (medicalHistory != null) data['medical_history'] = medicalHistory;
    if (allergies != null) data['allergies'] = allergies;
    if (bloodGroup != null) data['blood_group'] = bloodGroup;
    if (age != null) data['age'] = age;
    if (gender != null) data['gender'] = gender;
    if (heightCm != null) data['height_cm'] = heightCm;
    if (weightKg != null) data['weight_kg'] = weightKg;
    if (smokingStatus != null) data['smoking_status'] = smokingStatus;
    if (alcoholUse != null) data['alcohol_use'] = alcoholUse;
    if (isActive != null) data['is_active'] = isActive;
    if (address != null) data['address'] = address;
    return data;
  }
}
