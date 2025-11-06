// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowUpEligibilityResponseImpl _$$FollowUpEligibilityResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FollowUpEligibilityResponseImpl(
  isFree: json['is_free'] as bool,
  isEligible: json['is_eligible'] as bool,
  message: json['message'] as String,
  followupDetails: json['followup_details'] == null
      ? null
      : FollowUpDetails.fromJson(
          json['followup_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$FollowUpEligibilityResponseImplToJson(
  _$FollowUpEligibilityResponseImpl instance,
) => <String, dynamic>{
  'is_free': instance.isFree,
  'is_eligible': instance.isEligible,
  'message': instance.message,
  if (instance.followupDetails?.toJson() case final value?)
    'followup_details': value,
};

_$FollowUpDetailsImpl _$$FollowUpDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$FollowUpDetailsImpl(
  followupId: json['followup_id'] as String?,
  validUntil: json['valid_until'] as String?,
  daysRemaining: (json['days_remaining'] as num?)?.toInt(),
  doctorId: json['doctor_id'] as String?,
  departmentId: json['department_id'] as String?,
);

Map<String, dynamic> _$$FollowUpDetailsImplToJson(
  _$FollowUpDetailsImpl instance,
) => <String, dynamic>{
  if (instance.followupId case final value?) 'followup_id': value,
  if (instance.validUntil case final value?) 'valid_until': value,
  if (instance.daysRemaining case final value?) 'days_remaining': value,
  if (instance.doctorId case final value?) 'doctor_id': value,
  if (instance.departmentId case final value?) 'department_id': value,
};

_$ActiveFollowUpsResponseImpl _$$ActiveFollowUpsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ActiveFollowUpsResponseImpl(
  activeFollowups: (json['active_followups'] as List<dynamic>)
      .map((e) => ActiveFollowUp.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$$ActiveFollowUpsResponseImplToJson(
  _$ActiveFollowUpsResponseImpl instance,
) => <String, dynamic>{
  'active_followups': instance.activeFollowups.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};

_$ActiveFollowUpImpl _$$ActiveFollowUpImplFromJson(Map<String, dynamic> json) =>
    _$ActiveFollowUpImpl(
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

Map<String, dynamic> _$$ActiveFollowUpImplToJson(
  _$ActiveFollowUpImpl instance,
) => <String, dynamic>{
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

_$ClinicPatientImpl _$$ClinicPatientImplFromJson(Map<String, dynamic> json) =>
    _$ClinicPatientImpl(
      id: json['id'] as String,
      clinicId: json['clinic_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
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

Map<String, dynamic> _$$ClinicPatientImplToJson(
  _$ClinicPatientImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_id': instance.clinicId,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  if (instance.email case final value?) 'email': value,
  if (instance.dateOfBirth case final value?) 'date_of_birth': value,
  if (instance.age case final value?) 'age': value,
  if (instance.gender case final value?) 'gender': value,
  if (instance.address1 case final value?) 'address1': value,
  if (instance.address2 case final value?) 'address2': value,
  if (instance.district case final value?) 'district': value,
  if (instance.state case final value?) 'state': value,
  if (instance.moId case final value?) 'mo_id': value,
  if (instance.medicalHistory case final value?) 'medical_history': value,
  if (instance.allergies case final value?) 'allergies': value,
  if (instance.bloodGroup case final value?) 'blood_group': value,
  if (instance.smokingStatus case final value?) 'smoking_status': value,
  if (instance.alcoholUse case final value?) 'alcohol_use': value,
  if (instance.heightCm case final value?) 'height_cm': value,
  if (instance.weightKg case final value?) 'weight_kg': value,
  'is_active': instance.isActive,
  if (instance.globalPatientId case final value?) 'global_patient_id': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
  if (instance.currentFollowupStatus case final value?)
    'current_followup_status': value,
  if (instance.lastAppointmentId case final value?)
    'last_appointment_id': value,
  if (instance.lastFollowupId case final value?) 'last_followup_id': value,
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
  'follow_ups': instance.followUps.map((e) => e.toJson()).toList(),
  if (instance.lastAppointment?.toJson() case final value?)
    'last_appointment': value,
  if (instance.followUpEligibility?.toJson() case final value?)
    'follow_up_eligibility': value,
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

_$LastAppointmentInfoImpl _$$LastAppointmentInfoImplFromJson(
  Map<String, dynamic> json,
) => _$LastAppointmentInfoImpl(
  id: json['id'] as String,
  doctorId: json['doctor_id'] as String,
  doctorName: json['doctor_name'] as String,
  departmentId: json['department_id'] as String?,
  department: json['department'] as String?,
  date: json['date'] as String,
  status: json['status'] as String?,
  daysSince: (json['days_since'] as num).toInt(),
);

Map<String, dynamic> _$$LastAppointmentInfoImplToJson(
  _$LastAppointmentInfoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor_id': instance.doctorId,
  'doctor_name': instance.doctorName,
  if (instance.departmentId case final value?) 'department_id': value,
  if (instance.department case final value?) 'department': value,
  'date': instance.date,
  if (instance.status case final value?) 'status': value,
  'days_since': instance.daysSince,
};

_$FollowUpEligibilityImpl _$$FollowUpEligibilityImplFromJson(
  Map<String, dynamic> json,
) => _$FollowUpEligibilityImpl(
  eligible: json['eligible'] as bool,
  isFree: json['is_free'] as bool? ?? false,
  reason: json['reason'] as String?,
  daysRemaining: (json['days_remaining'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$FollowUpEligibilityImplToJson(
  _$FollowUpEligibilityImpl instance,
) => <String, dynamic>{
  'eligible': instance.eligible,
  'is_free': instance.isFree,
  if (instance.reason case final value?) 'reason': value,
  if (instance.daysRemaining case final value?) 'days_remaining': value,
  if (instance.message case final value?) 'message': value,
};

_$AppointmentHistoryItemImpl _$$AppointmentHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentHistoryItemImpl(
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

Map<String, dynamic> _$$AppointmentHistoryItemImplToJson(
  _$AppointmentHistoryItemImpl instance,
) => <String, dynamic>{
  'appointment_id': instance.appointmentId,
  'doctor_id': instance.doctorId,
  'doctor_name': instance.doctorName,
  if (instance.departmentId case final value?) 'department_id': value,
  'department': instance.department,
  'appointment_date': instance.appointmentDate,
  'days_since': instance.daysSince,
  'validity_days': instance.validityDays,
  if (instance.remainingDays case final value?) 'remaining_days': value,
  'status': instance.status,
  'follow_up_eligible': instance.followUpEligible,
  'free_follow_up_used': instance.freeFollowUpUsed,
  if (instance.followUpStatus case final value?) 'follow_up_status': value,
  if (instance.renewalStatus case final value?) 'renewal_status': value,
  if (instance.nextFollowupExpiry case final value?)
    'next_followup_expiry': value,
  if (instance.note case final value?) 'note': value,
};

_$EligibleFollowUpImpl _$$EligibleFollowUpImplFromJson(
  Map<String, dynamic> json,
) => _$EligibleFollowUpImpl(
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

Map<String, dynamic> _$$EligibleFollowUpImplToJson(
  _$EligibleFollowUpImpl instance,
) => <String, dynamic>{
  if (instance.followupId case final value?) 'followup_id': value,
  if (instance.appointmentId case final value?) 'appointment_id': value,
  'doctor_id': instance.doctorId,
  'doctor_name': instance.doctorName,
  if (instance.departmentId case final value?) 'department_id': value,
  'department': instance.department,
  if (instance.validFrom case final value?) 'valid_from': value,
  if (instance.validUntil case final value?) 'valid_until': value,
  if (instance.appointmentDate case final value?) 'appointment_date': value,
  if (instance.remainingDays case final value?) 'remaining_days': value,
  if (instance.daysRemaining case final value?) 'days_remaining': value,
  if (instance.status case final value?) 'status': value,
  if (instance.isFree case final value?) 'is_free': value,
  if (instance.nextFollowupExpiry case final value?)
    'next_followup_expiry': value,
  if (instance.note case final value?) 'note': value,
  if (instance.message case final value?) 'message': value,
};

_$ExpiredFollowUpImpl _$$ExpiredFollowUpImplFromJson(
  Map<String, dynamic> json,
) => _$ExpiredFollowUpImpl(
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

Map<String, dynamic> _$$ExpiredFollowUpImplToJson(
  _$ExpiredFollowUpImpl instance,
) => <String, dynamic>{
  if (instance.followupId case final value?) 'followup_id': value,
  if (instance.appointmentId case final value?) 'appointment_id': value,
  'doctor_id': instance.doctorId,
  'doctor_name': instance.doctorName,
  if (instance.departmentId case final value?) 'department_id': value,
  if (instance.departmentName case final value?) 'department_name': value,
  'department': instance.department,
  if (instance.validUntil case final value?) 'valid_until': value,
  if (instance.expiredOn case final value?) 'expired_on': value,
  if (instance.status case final value?) 'status': value,
  if (instance.note case final value?) 'note': value,
};

_$CreateClinicPatientInputImpl _$$CreateClinicPatientInputImplFromJson(
  Map<String, dynamic> json,
) => _$CreateClinicPatientInputImpl(
  clinicId: json['clinic_id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  age: (json['age'] as num?)?.toInt(),
  gender: json['gender'] as String?,
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

Map<String, dynamic> _$$CreateClinicPatientInputImplToJson(
  _$CreateClinicPatientInputImpl instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  if (instance.email case final value?) 'email': value,
  if (instance.dateOfBirth case final value?) 'date_of_birth': value,
  if (instance.age case final value?) 'age': value,
  if (instance.gender case final value?) 'gender': value,
  if (instance.address1 case final value?) 'address1': value,
  if (instance.address2 case final value?) 'address2': value,
  if (instance.district case final value?) 'district': value,
  if (instance.state case final value?) 'state': value,
  if (instance.moId case final value?) 'mo_id': value,
  if (instance.medicalHistory case final value?) 'medical_history': value,
  if (instance.allergies case final value?) 'allergies': value,
  if (instance.bloodGroup case final value?) 'blood_group': value,
  if (instance.smokingStatus case final value?) 'smoking_status': value,
  if (instance.alcoholUse case final value?) 'alcohol_use': value,
  if (instance.heightCm case final value?) 'height_cm': value,
  if (instance.weightKg case final value?) 'weight_kg': value,
};

_$CreateClinicPatientResponseImpl _$$CreateClinicPatientResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateClinicPatientResponseImpl(
  message: json['message'] as String,
  patient: ClinicPatient.fromJson(json['patient'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreateClinicPatientResponseImplToJson(
  _$CreateClinicPatientResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'patient': instance.patient.toJson(),
};

_$ListClinicPatientsResponseImpl _$$ListClinicPatientsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ListClinicPatientsResponseImpl(
  clinicId: json['clinic_id'] as String,
  total: (json['total'] as num).toInt(),
  patients: (json['patients'] as List<dynamic>)
      .map((e) => ClinicPatient.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ListClinicPatientsResponseImplToJson(
  _$ListClinicPatientsResponseImpl instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'total': instance.total,
  'patients': instance.patients.map((e) => e.toJson()).toList(),
};

_$AppointmentDetailImpl _$$AppointmentDetailImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentDetailImpl(
  appointmentId: json['appointment_id'] as String,
  doctorId: json['doctor_id'] as String,
  departmentId: json['department_id'] as String,
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

Map<String, dynamic> _$$AppointmentDetailImplToJson(
  _$AppointmentDetailImpl instance,
) => <String, dynamic>{
  'appointment_id': instance.appointmentId,
  'doctor_id': instance.doctorId,
  'department_id': instance.departmentId,
  'appointment_time': instance.appointmentTime,
  'slot_type': instance.slotType,
  'consultation_type': instance.consultationType,
  'status': instance.status,
  'fee_amount': instance.feeAmount,
  'payment_status': instance.paymentStatus,
  if (instance.paymentMode case final value?) 'payment_mode': value,
  'is_priority': instance.isPriority,
  if (instance.createdAt case final value?) 'created_at': value,
};

_$FollowUpDetailImpl _$$FollowUpDetailImplFromJson(Map<String, dynamic> json) =>
    _$FollowUpDetailImpl(
      followUpId: json['follow_up_id'] as String,
      sourceAppointmentId: json['source_appointment_id'] as String,
      doctorId: json['doctor_id'] as String,
      departmentId: json['department_id'] as String,
      status: json['status'] as String,
      isFree: json['is_free'] as bool? ?? true,
      validFrom: json['valid_from'] as String,
      validUntil: json['valid_until'] as String,
      usedAppointmentId: json['used_appointment_id'] as String?,
      renewedByAppointmentId: json['renewed_by_appointment_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$FollowUpDetailImplToJson(
  _$FollowUpDetailImpl instance,
) => <String, dynamic>{
  'follow_up_id': instance.followUpId,
  'source_appointment_id': instance.sourceAppointmentId,
  'doctor_id': instance.doctorId,
  'department_id': instance.departmentId,
  'status': instance.status,
  'is_free': instance.isFree,
  'valid_from': instance.validFrom,
  'valid_until': instance.validUntil,
  if (instance.usedAppointmentId case final value?)
    'used_appointment_id': value,
  if (instance.renewedByAppointmentId case final value?)
    'renewed_by_appointment_id': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};
