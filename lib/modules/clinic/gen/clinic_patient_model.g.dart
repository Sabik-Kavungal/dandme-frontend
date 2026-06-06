// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowUpEligibilityResponse _$FollowUpEligibilityResponseFromJson(
  Map<String, dynamic> json,
) => _FollowUpEligibilityResponse(
  isFree: json['is_free'] as bool,
  isEligible: json['is_eligible'] as bool,
  message: json['message'] as String,
  followupDetails: json['followup_details'] == null
      ? null
      : FollowUpDetails.fromJson(
          json['followup_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FollowUpEligibilityResponseToJson(
  _FollowUpEligibilityResponse instance,
) => <String, dynamic>{
  'is_free': instance.isFree,
  'is_eligible': instance.isEligible,
  'message': instance.message,
  'followup_details': ?instance.followupDetails?.toJson(),
};

_FollowUpDetails _$FollowUpDetailsFromJson(Map<String, dynamic> json) =>
    _FollowUpDetails(
      followupId: json['followup_id'] as String?,
      validUntil: json['valid_until'] as String?,
      daysRemaining: (json['days_remaining'] as num?)?.toInt(),
      doctorId: json['doctor_id'] as String?,
      departmentId: json['department_id'] as String?,
    );

Map<String, dynamic> _$FollowUpDetailsToJson(_FollowUpDetails instance) =>
    <String, dynamic>{
      'followup_id': ?instance.followupId,
      'valid_until': ?instance.validUntil,
      'days_remaining': ?instance.daysRemaining,
      'doctor_id': ?instance.doctorId,
      'department_id': ?instance.departmentId,
    };

_ActiveFollowUpsResponse _$ActiveFollowUpsResponseFromJson(
  Map<String, dynamic> json,
) => _ActiveFollowUpsResponse(
  activeFollowups: (json['active_followups'] as List<dynamic>)
      .map((e) => ActiveFollowUp.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$ActiveFollowUpsResponseToJson(
  _ActiveFollowUpsResponse instance,
) => <String, dynamic>{
  'active_followups': instance.activeFollowups.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};

_ActiveFollowUp _$ActiveFollowUpFromJson(Map<String, dynamic> json) =>
    _ActiveFollowUp(
      followupId: json['followup_id'] as String,
      doctorId: json['doctor_id'] as String,
      doctorName: json['doctor_name'] as String,
      departmentId: json['department_id'] as String,
      departmentName: json['department_name'] as String,
      appointmentId: json['appointment_id'] as String,
      appointmentDate: json['appointment_date'] as String,
      validUntil: json['valid_until'] as String,
      daysRemaining: (json['days_remaining'] as num).toInt(),
      isFree: json['is_free'] as bool,
    );

Map<String, dynamic> _$ActiveFollowUpToJson(_ActiveFollowUp instance) =>
    <String, dynamic>{
      'followup_id': instance.followupId,
      'doctor_id': instance.doctorId,
      'doctor_name': instance.doctorName,
      'department_id': instance.departmentId,
      'department_name': instance.departmentName,
      'appointment_id': instance.appointmentId,
      'appointment_date': instance.appointmentDate,
      'valid_until': instance.validUntil,
      'days_remaining': instance.daysRemaining,
      'is_free': instance.isFree,
    };

_ClinicPatient _$ClinicPatientFromJson(Map<String, dynamic> json) =>
    _ClinicPatient(
      id: json['id'] as String,
      clinicId: json['clinic_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      moId: json['mo_id'] as String?,
      medicalHistory: json['medical_history'] as String?,
      allergies: json['allergies'] as String?,
      bloodGroup: json['blood_group'] as String?,
      smokingStatus: json['smoking_status'] as String?,
      alcoholUse: json['alcohol_use'] as String?,
      heightCm: (json['height_cm'] as num?)?.toInt(),
      weightKg: (json['weight_kg'] as num?)?.toInt(),
      isActive: json['is_active'] as bool? ?? true,
      globalPatientId: json['global_patient_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      currentFollowupStatus: json['current_followup_status'] as String?,
      lastAppointmentId: json['last_appointment_id'] as String?,
      lastFollowupId: json['last_followup_id'] as String?,
      appointments:
          (json['appointments'] as List<dynamic>?)
              ?.map(
                (e) => AppointmentDetail.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      followUps:
          (json['follow_ups'] as List<dynamic>?)
              ?.map((e) => FollowUpDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastAppointment: json['last_appointment'] == null
          ? null
          : LastAppointmentInfo.fromJson(
              json['last_appointment'] as Map<String, dynamic>,
            ),
      followUpEligibility: json['follow_up_eligibility'] == null
          ? null
          : FollowUpEligibility.fromJson(
              json['follow_up_eligibility'] as Map<String, dynamic>,
            ),
      totalAppointments: (json['total_appointments'] as num?)?.toInt() ?? 0,
      appointmentsHistory:
          (json['appointments_history'] as List<dynamic>?)
              ?.map(
                (e) =>
                    AppointmentHistoryItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      eligibleFollowUps:
          (json['eligible_follow_ups'] as List<dynamic>?)
              ?.map((e) => EligibleFollowUp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      expiredFollowups:
          (json['expired_followups'] as List<dynamic>?)
              ?.map((e) => ExpiredFollowUp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ClinicPatientToJson(_ClinicPatient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_id': instance.clinicId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'email': ?instance.email,
      'date_of_birth': ?instance.dateOfBirth,
      'age': ?instance.age,
      'gender': ?instance.gender,
      'address': ?instance.address,
      'address1': ?instance.address1,
      'address2': ?instance.address2,
      'district': ?instance.district,
      'state': ?instance.state,
      'mo_id': ?instance.moId,
      'medical_history': ?instance.medicalHistory,
      'allergies': ?instance.allergies,
      'blood_group': ?instance.bloodGroup,
      'smoking_status': ?instance.smokingStatus,
      'alcohol_use': ?instance.alcoholUse,
      'height_cm': ?instance.heightCm,
      'weight_kg': ?instance.weightKg,
      'is_active': instance.isActive,
      'global_patient_id': ?instance.globalPatientId,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
      'current_followup_status': ?instance.currentFollowupStatus,
      'last_appointment_id': ?instance.lastAppointmentId,
      'last_followup_id': ?instance.lastFollowupId,
      'appointments': instance.appointments.map((e) => e.toJson()).toList(),
      'follow_ups': instance.followUps.map((e) => e.toJson()).toList(),
      'last_appointment': ?instance.lastAppointment?.toJson(),
      'follow_up_eligibility': ?instance.followUpEligibility?.toJson(),
      'total_appointments': instance.totalAppointments,
      'appointments_history': instance.appointmentsHistory
          .map((e) => e.toJson())
          .toList(),
      'eligible_follow_ups': instance.eligibleFollowUps
          .map((e) => e.toJson())
          .toList(),
      'expired_followups': instance.expiredFollowups
          .map((e) => e.toJson())
          .toList(),
    };

_LastAppointmentInfo _$LastAppointmentInfoFromJson(Map<String, dynamic> json) =>
    _LastAppointmentInfo(
      id: json['id'] as String,
      doctorId: json['doctor_id'] as String,
      doctorName: json['doctor_name'] as String,
      departmentId: json['department_id'] as String?,
      department: json['department'] as String?,
      date: json['date'] as String,
      status: json['status'] as String?,
      daysSince: (json['days_since'] as num).toInt(),
    );

Map<String, dynamic> _$LastAppointmentInfoToJson(
  _LastAppointmentInfo instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor_id': instance.doctorId,
  'doctor_name': instance.doctorName,
  'department_id': ?instance.departmentId,
  'department': ?instance.department,
  'date': instance.date,
  'status': ?instance.status,
  'days_since': instance.daysSince,
};

_FollowUpEligibility _$FollowUpEligibilityFromJson(Map<String, dynamic> json) =>
    _FollowUpEligibility(
      eligible: json['eligible'] as bool,
      isFree: json['is_free'] as bool? ?? false,
      reason: json['reason'] as String?,
      daysRemaining: (json['days_remaining'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FollowUpEligibilityToJson(
  _FollowUpEligibility instance,
) => <String, dynamic>{
  'eligible': instance.eligible,
  'is_free': instance.isFree,
  'reason': ?instance.reason,
  'days_remaining': ?instance.daysRemaining,
  'message': ?instance.message,
};

_AppointmentHistoryItem _$AppointmentHistoryItemFromJson(
  Map<String, dynamic> json,
) => _AppointmentHistoryItem(
  appointmentId: json['appointment_id'] as String,
  doctorId: json['doctor_id'] as String,
  doctorName: json['doctor_name'] as String,
  departmentId: json['department_id'] as String?,
  department: json['department'] as String,
  appointmentDate: json['appointment_date'] as String,
  daysSince: (json['days_since'] as num).toInt(),
  validityDays: (json['validity_days'] as num?)?.toInt() ?? 5,
  remainingDays: (json['remaining_days'] as num?)?.toInt(),
  status: json['status'] as String,
  followUpEligible: json['follow_up_eligible'] as bool? ?? false,
  freeFollowUpUsed: json['free_follow_up_used'] as bool? ?? false,
  followUpStatus: json['follow_up_status'] as String?,
  renewalStatus: json['renewal_status'] as String?,
  nextFollowupExpiry: json['next_followup_expiry'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$AppointmentHistoryItemToJson(
  _AppointmentHistoryItem instance,
) => <String, dynamic>{
  'appointment_id': instance.appointmentId,
  'doctor_id': instance.doctorId,
  'doctor_name': instance.doctorName,
  'department_id': ?instance.departmentId,
  'department': instance.department,
  'appointment_date': instance.appointmentDate,
  'days_since': instance.daysSince,
  'validity_days': instance.validityDays,
  'remaining_days': ?instance.remainingDays,
  'status': instance.status,
  'follow_up_eligible': instance.followUpEligible,
  'free_follow_up_used': instance.freeFollowUpUsed,
  'follow_up_status': ?instance.followUpStatus,
  'renewal_status': ?instance.renewalStatus,
  'next_followup_expiry': ?instance.nextFollowupExpiry,
  'note': ?instance.note,
};

_EligibleFollowUp _$EligibleFollowUpFromJson(Map<String, dynamic> json) =>
    _EligibleFollowUp(
      followupId: json['followup_id'] as String?,
      appointmentId: json['appointment_id'] as String?,
      doctorId: json['doctor_id'] as String,
      doctorName: json['doctor_name'] as String,
      departmentId: json['department_id'] as String?,
      department: json['department'] as String,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      appointmentDate: json['appointment_date'] as String?,
      remainingDays: (json['remaining_days'] as num?)?.toInt(),
      daysRemaining: (json['days_remaining'] as num?)?.toInt(),
      status: json['status'] as String?,
      isFree: json['is_free'] as bool?,
      nextFollowupExpiry: json['next_followup_expiry'] as String?,
      note: json['note'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EligibleFollowUpToJson(_EligibleFollowUp instance) =>
    <String, dynamic>{
      'followup_id': ?instance.followupId,
      'appointment_id': ?instance.appointmentId,
      'doctor_id': instance.doctorId,
      'doctor_name': instance.doctorName,
      'department_id': ?instance.departmentId,
      'department': instance.department,
      'valid_from': ?instance.validFrom,
      'valid_until': ?instance.validUntil,
      'appointment_date': ?instance.appointmentDate,
      'remaining_days': ?instance.remainingDays,
      'days_remaining': ?instance.daysRemaining,
      'status': ?instance.status,
      'is_free': ?instance.isFree,
      'next_followup_expiry': ?instance.nextFollowupExpiry,
      'note': ?instance.note,
      'message': ?instance.message,
    };

_ExpiredFollowUp _$ExpiredFollowUpFromJson(Map<String, dynamic> json) =>
    _ExpiredFollowUp(
      followupId: json['followup_id'] as String?,
      appointmentId: json['appointment_id'] as String?,
      doctorId: json['doctor_id'] as String,
      doctorName: json['doctor_name'] as String,
      departmentId: json['department_id'] as String?,
      departmentName: json['department_name'] as String?,
      department: json['department'] as String,
      validUntil: json['valid_until'] as String?,
      expiredOn: json['expired_on'] as String?,
      status: json['status'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ExpiredFollowUpToJson(_ExpiredFollowUp instance) =>
    <String, dynamic>{
      'followup_id': ?instance.followupId,
      'appointment_id': ?instance.appointmentId,
      'doctor_id': instance.doctorId,
      'doctor_name': instance.doctorName,
      'department_id': ?instance.departmentId,
      'department_name': ?instance.departmentName,
      'department': instance.department,
      'valid_until': ?instance.validUntil,
      'expired_on': ?instance.expiredOn,
      'status': ?instance.status,
      'note': ?instance.note,
    };

_CreateClinicPatientInput _$CreateClinicPatientInputFromJson(
  Map<String, dynamic> json,
) => _CreateClinicPatientInput(
  clinicId: json['clinic_id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  age: (json['age'] as num?)?.toInt(),
  gender: json['gender'] as String?,
  address: json['address'] as String?,
  address1: json['address1'] as String?,
  address2: json['address2'] as String?,
  district: json['district'] as String?,
  state: json['state'] as String?,
  moId: json['mo_id'] as String?,
  medicalHistory: json['medical_history'] as String?,
  allergies: json['allergies'] as String?,
  bloodGroup: json['blood_group'] as String?,
  smokingStatus: json['smoking_status'] as String?,
  alcoholUse: json['alcohol_use'] as String?,
  heightCm: (json['height_cm'] as num?)?.toInt(),
  weightKg: (json['weight_kg'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateClinicPatientInputToJson(
  _CreateClinicPatientInput instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'email': ?instance.email,
  'date_of_birth': ?instance.dateOfBirth,
  'age': ?instance.age,
  'gender': ?instance.gender,
  'address': ?instance.address,
  'address1': ?instance.address1,
  'address2': ?instance.address2,
  'district': ?instance.district,
  'state': ?instance.state,
  'mo_id': ?instance.moId,
  'medical_history': ?instance.medicalHistory,
  'allergies': ?instance.allergies,
  'blood_group': ?instance.bloodGroup,
  'smoking_status': ?instance.smokingStatus,
  'alcohol_use': ?instance.alcoholUse,
  'height_cm': ?instance.heightCm,
  'weight_kg': ?instance.weightKg,
};

_CreateClinicPatientResponse _$CreateClinicPatientResponseFromJson(
  Map<String, dynamic> json,
) => _CreateClinicPatientResponse(
  message: json['message'] as String,
  patient: ClinicPatient.fromJson(json['patient'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateClinicPatientResponseToJson(
  _CreateClinicPatientResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'patient': instance.patient.toJson(),
};

_ListClinicPatientsResponse _$ListClinicPatientsResponseFromJson(
  Map<String, dynamic> json,
) => _ListClinicPatientsResponse(
  clinicId: json['clinic_id'] as String,
  total: (json['total'] as num).toInt(),
  patients: (json['patients'] as List<dynamic>)
      .map((e) => ClinicPatient.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ListClinicPatientsResponseToJson(
  _ListClinicPatientsResponse instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'total': instance.total,
  'patients': instance.patients.map((e) => e.toJson()).toList(),
};

_AppointmentDetail _$AppointmentDetailFromJson(Map<String, dynamic> json) =>
    _AppointmentDetail(
      appointmentId: json['appointment_id'] as String,
      doctorId: json['doctor_id'] as String,
      departmentId: json['department_id'] as String?,
      appointmentTime: json['appointment_time'] as String,
      slotType: json['slot_type'] as String,
      consultationType: json['consultation_type'] as String,
      status: json['status'] as String,
      feeAmount: (json['fee_amount'] as num?)?.toDouble() ?? 0.0,
      paymentStatus: json['payment_status'] as String? ?? 'pending',
      paymentMode: json['payment_mode'] as String?,
      isPriority: json['is_priority'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AppointmentDetailToJson(_AppointmentDetail instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'doctor_id': instance.doctorId,
      'department_id': ?instance.departmentId,
      'appointment_time': instance.appointmentTime,
      'slot_type': instance.slotType,
      'consultation_type': instance.consultationType,
      'status': instance.status,
      'fee_amount': instance.feeAmount,
      'payment_status': instance.paymentStatus,
      'payment_mode': ?instance.paymentMode,
      'is_priority': instance.isPriority,
      'created_at': ?instance.createdAt,
    };

_FollowUpDetail _$FollowUpDetailFromJson(Map<String, dynamic> json) =>
    _FollowUpDetail(
      followUpId: json['follow_up_id'] as String,
      sourceAppointmentId: json['source_appointment_id'] as String,
      doctorId: json['doctor_id'] as String,
      departmentId: json['department_id'] as String?,
      status: json['status'] as String,
      isFree: json['is_free'] as bool? ?? true,
      validFrom: json['valid_from'] as String,
      validUntil: json['valid_until'] as String,
      usedAppointmentId: json['used_appointment_id'] as String?,
      renewedByAppointmentId: json['renewed_by_appointment_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FollowUpDetailToJson(_FollowUpDetail instance) =>
    <String, dynamic>{
      'follow_up_id': instance.followUpId,
      'source_appointment_id': instance.sourceAppointmentId,
      'doctor_id': instance.doctorId,
      'department_id': ?instance.departmentId,
      'status': instance.status,
      'is_free': instance.isFree,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'used_appointment_id': ?instance.usedAppointmentId,
      'renewed_by_appointment_id': ?instance.renewedByAppointmentId,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };
