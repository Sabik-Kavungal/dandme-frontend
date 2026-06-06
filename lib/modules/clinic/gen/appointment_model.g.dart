// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentDetails _$AppointmentDetailsFromJson(Map<String, dynamic> json) =>
    _AppointmentDetails(
      id: json['id'] as String?,
      tokenNumber: _tokenNumberFromJson(json['token_number']),
      moId: json['mo_id'] as String?,
      bookingNumber: json['booking_number'] as String?,
      consultationType: json['consultation_type'] as String?,
      appointmentDateTime: json['appointment_date_time'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      sessionType: json['session_type'] as String?,
      status: json['status'] as String?,
      feeAmount: (json['fee_amount'] as num?)?.toDouble(),
      feeStatus: json['fee_status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      paymentMethod: json['payment_method'] as String?,
      notes: json['notes'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      slotDetails: json['slot_details'] == null
          ? null
          : SlotDetails.fromJson(json['slot_details'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      patientName: json['patient_name'] as String?,
      doctorName: json['doctor_name'] as String?,
      department: json['department'] as String?,
      clinicPatientId: json['clinic_patient_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      displayToken: json['display_token'] as String?,
      bookingMode: json['booking_mode'] as String?,
      queuePosition: (json['queue_position'] as num?)?.toInt(),
      patient: json['patient'] == null
          ? null
          : PatientDetails.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : DoctorDetails.fromJson(json['doctor'] as Map<String, dynamic>),
      clinic: json['clinic'] == null
          ? null
          : ClinicDetails.fromJson(json['clinic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentDetailsToJson(_AppointmentDetails instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'token_number': ?instance.tokenNumber,
      'mo_id': ?instance.moId,
      'booking_number': ?instance.bookingNumber,
      'consultation_type': ?instance.consultationType,
      'appointment_date_time': ?instance.appointmentDateTime,
      'duration_minutes': ?instance.durationMinutes,
      'session_type': ?instance.sessionType,
      'status': ?instance.status,
      'fee_amount': ?instance.feeAmount,
      'fee_status': ?instance.feeStatus,
      'payment_status': ?instance.paymentStatus,
      'payment_method': ?instance.paymentMethod,
      'notes': ?instance.notes,
      'cancellation_reason': ?instance.cancellationReason,
      'slot_details': ?instance.slotDetails?.toJson(),
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
      'patient_name': ?instance.patientName,
      'doctor_name': ?instance.doctorName,
      'department': ?instance.department,
      'clinic_patient_id': ?instance.clinicPatientId,
      'clinic_id': ?instance.clinicId,
      'display_token': ?instance.displayToken,
      'booking_mode': ?instance.bookingMode,
      'queue_position': ?instance.queuePosition,
      'patient': ?instance.patient?.toJson(),
      'doctor': ?instance.doctor?.toJson(),
      'clinic': ?instance.clinic?.toJson(),
    };

_PatientDetails _$PatientDetailsFromJson(Map<String, dynamic> json) =>
    _PatientDetails(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$PatientDetailsToJson(_PatientDetails instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'phone': ?instance.phone,
      'email': ?instance.email,
      'age': ?instance.age,
      'gender': ?instance.gender,
    };

_DoctorDetails _$DoctorDetailsFromJson(Map<String, dynamic> json) =>
    _DoctorDetails(id: json['id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$DoctorDetailsToJson(_DoctorDetails instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};

_DepartmentDetails _$DepartmentDetailsFromJson(Map<String, dynamic> json) =>
    _DepartmentDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DepartmentDetailsToJson(_DepartmentDetails instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};

_ClinicDetails _$ClinicDetailsFromJson(Map<String, dynamic> json) =>
    _ClinicDetails(id: json['id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$ClinicDetailsToJson(_ClinicDetails instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};

_SlotDetails _$SlotDetailsFromJson(Map<String, dynamic> json) => _SlotDetails(
  slotId: json['slot_id'] as String?,
  slotStatus: json['slot_status'] as String?,
  slotStartTime: json['slot_start_time'] as String?,
  slotEndTime: json['slot_end_time'] as String?,
  slotDate: json['slot_date'] as String?,
  slotFullTime: json['slot_full_time'] as String?,
  sessionName: json['session_name'] as String?,
);

Map<String, dynamic> _$SlotDetailsToJson(_SlotDetails instance) =>
    <String, dynamic>{
      'slot_id': ?instance.slotId,
      'slot_status': ?instance.slotStatus,
      'slot_start_time': ?instance.slotStartTime,
      'slot_end_time': ?instance.slotEndTime,
      'slot_date': ?instance.slotDate,
      'slot_full_time': ?instance.slotFullTime,
      'session_name': ?instance.sessionName,
    };

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
  id: json['id'] as String?,
  tokenNumber: (json['token_number'] as num?)?.toInt(),
  moId: json['mo_id'] as String?,
  patientName: json['patient_name'] as String?,
  doctorName: json['doctor_name'] as String?,
  department: json['department'] as String?,
  consultationType: json['consultation_type'] as String?,
  appointmentDateTime: json['appointment_date_time'] as String?,
  status: json['status'] as String?,
  feeStatus: json['fee_status'] as String?,
  feeAmount: (json['fee_amount'] as num?)?.toDouble(),
  paymentStatus: json['payment_status'] as String?,
  bookingNumber: json['booking_number'] as String?,
  createdAt: json['created_at'] as String?,
  appointmentId: json['appointmentId'] as String?,
  patientId: json['patientId'] as String?,
  doctorId: json['doctorId'] as String?,
  appointmentDate: json['appointmentDate'] as String?,
  appointmentTime: json['appointmentTime'] as String?,
  bookedOn: json['bookedOn'] as String?,
  reasonForVisit: json['reasonForVisit'] as String?,
  notes: json['notes'] as String?,
  fee: (json['fee'] as num?)?.toDouble(),
  paymentMethod: json['paymentMethod'] as String?,
  patient: json['patient'] == null
      ? null
      : Patient.fromJson(json['patient'] as Map<String, dynamic>),
  doctor: json['doctor'] == null
      ? null
      : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'token_number': ?instance.tokenNumber,
      'mo_id': ?instance.moId,
      'patient_name': ?instance.patientName,
      'doctor_name': ?instance.doctorName,
      'department': ?instance.department,
      'consultation_type': ?instance.consultationType,
      'appointment_date_time': ?instance.appointmentDateTime,
      'status': ?instance.status,
      'fee_status': ?instance.feeStatus,
      'fee_amount': ?instance.feeAmount,
      'payment_status': ?instance.paymentStatus,
      'booking_number': ?instance.bookingNumber,
      'created_at': ?instance.createdAt,
      'appointmentId': ?instance.appointmentId,
      'patientId': ?instance.patientId,
      'doctorId': ?instance.doctorId,
      'appointmentDate': ?instance.appointmentDate,
      'appointmentTime': ?instance.appointmentTime,
      'bookedOn': ?instance.bookedOn,
      'reasonForVisit': ?instance.reasonForVisit,
      'notes': ?instance.notes,
      'fee': ?instance.fee,
      'paymentMethod': ?instance.paymentMethod,
      'patient': ?instance.patient?.toJson(),
      'doctor': ?instance.doctor?.toJson(),
    };

_AppointmentListResponse _$AppointmentListResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentListResponse(
  appointments: (json['appointments'] as List<dynamic>)
      .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppointmentListResponseToJson(
  _AppointmentListResponse instance,
) => <String, dynamic>{
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
  'total_count': ?instance.totalCount,
};

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  mobileId: json['mobileId'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  gender: json['gender'] as String?,
  bloodGroup: json['bloodGroup'] as String?,
  address1: json['address1'] as String?,
  address2: json['address2'] as String?,
  district: json['district'] as String?,
  state: json['state'] as String?,
  height: json['height'] as String?,
  weight: json['weight'] as String?,
  smokingStatus: json['smokingStatus'] as String?,
  alcoholUse: json['alcoholUse'] as String?,
  vitalSigns: json['vitalSigns'] == null
      ? null
      : VitalSigns.fromJson(json['vitalSigns'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': ?instance.id,
  'firstName': ?instance.firstName,
  'lastName': ?instance.lastName,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'mobileId': ?instance.mobileId,
  'dateOfBirth': ?instance.dateOfBirth,
  'gender': ?instance.gender,
  'bloodGroup': ?instance.bloodGroup,
  'address1': ?instance.address1,
  'address2': ?instance.address2,
  'district': ?instance.district,
  'state': ?instance.state,
  'height': ?instance.height,
  'weight': ?instance.weight,
  'smokingStatus': ?instance.smokingStatus,
  'alcoholUse': ?instance.alcoholUse,
  'vitalSigns': ?instance.vitalSigns?.toJson(),
};

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  department: json['department'] as String?,
  specialization: json['specialization'] as String?,
  qualification: json['qualification'] as String?,
  experience: json['experience'] as String?,
  consultationFee: json['consultationFee'] as String?,
  isAvailable: json['isAvailable'] as bool?,
  availableSlots: (json['availableSlots'] as List<dynamic>?)
      ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
  'id': ?instance.id,
  'firstName': ?instance.firstName,
  'lastName': ?instance.lastName,
  'fullName': ?instance.fullName,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'department': ?instance.department,
  'specialization': ?instance.specialization,
  'qualification': ?instance.qualification,
  'experience': ?instance.experience,
  'consultationFee': ?instance.consultationFee,
  'isAvailable': ?instance.isAvailable,
  'availableSlots': ?instance.availableSlots?.map((e) => e.toJson()).toList(),
};

_TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => _TimeSlot(
  id: json['id'] as String?,
  time: json['time'] as String?,
  date: json['date'] as String?,
  isAvailable: json['isAvailable'] as bool?,
  isBooked: json['isBooked'] as bool?,
  doctorId: json['doctorId'] as String?,
);

Map<String, dynamic> _$TimeSlotToJson(_TimeSlot instance) => <String, dynamic>{
  'id': ?instance.id,
  'time': ?instance.time,
  'date': ?instance.date,
  'isAvailable': ?instance.isAvailable,
  'isBooked': ?instance.isBooked,
  'doctorId': ?instance.doctorId,
};

_VitalSigns _$VitalSignsFromJson(Map<String, dynamic> json) => _VitalSigns(
  bloodPressure: json['bloodPressure'] as String?,
  temperature: json['temperature'] as String?,
  pulse: json['pulse'] as String?,
  respiratoryRate: json['respiratoryRate'] as String?,
  oxygenSaturation: json['oxygenSaturation'] as String?,
);

Map<String, dynamic> _$VitalSignsToJson(_VitalSigns instance) =>
    <String, dynamic>{
      'bloodPressure': ?instance.bloodPressure,
      'temperature': ?instance.temperature,
      'pulse': ?instance.pulse,
      'respiratoryRate': ?instance.respiratoryRate,
      'oxygenSaturation': ?instance.oxygenSaturation,
    };

_AppointmentSummaryCounts _$AppointmentSummaryCountsFromJson(
  Map<String, dynamic> json,
) => _AppointmentSummaryCounts(
  total: (json['total'] as num?)?.toInt(),
  confirmed: (json['confirmed'] as num?)?.toInt(),
  arrived: (json['arrived'] as num?)?.toInt(),
  completed: (json['completed'] as num?)?.toInt(),
  cancelled: (json['cancelled'] as num?)?.toInt(),
  noShow: (json['no_show'] as num?)?.toInt(),
  pending: (json['pending'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppointmentSummaryCountsToJson(
  _AppointmentSummaryCounts instance,
) => <String, dynamic>{
  'total': ?instance.total,
  'confirmed': ?instance.confirmed,
  'arrived': ?instance.arrived,
  'completed': ?instance.completed,
  'cancelled': ?instance.cancelled,
  'no_show': ?instance.noShow,
  'pending': ?instance.pending,
};

_AppointmentSummary _$AppointmentSummaryFromJson(Map<String, dynamic> json) =>
    _AppointmentSummary(
      success: json['success'] as bool?,
      clinicId: json['clinic_id'] as String?,
      date: json['date'] as String?,
      doctorId: json['doctor_id'] as String?,
      status: json['status'] as String?,
      counts: json['summary'] == null
          ? null
          : AppointmentSummaryCounts.fromJson(
              json['summary'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AppointmentSummaryToJson(_AppointmentSummary instance) =>
    <String, dynamic>{
      'success': ?instance.success,
      'clinic_id': ?instance.clinicId,
      'date': ?instance.date,
      'doctor_id': ?instance.doctorId,
      'status': ?instance.status,
      'summary': ?instance.counts?.toJson(),
    };

_SimpleAppointment _$SimpleAppointmentFromJson(Map<String, dynamic> json) =>
    _SimpleAppointment(
      id: json['id'] as String,
      clinicPatientId: json['clinic_patient_id'] as String,
      clinicId: json['clinic_id'] as String,
      doctorId: json['doctor_id'] as String,
      bookingNumber: json['booking_number'] as String,
      tokenNumber: (json['token_number'] as num).toInt(),
      appointmentDate: json['appointment_date'] as String,
      appointmentTime: json['appointment_time'] as String,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      consultationType: json['consultation_type'] as String,
      reason: json['reason'] as String?,
      status: json['status'] as String,
      feeAmount: (json['fee_amount'] as num?)?.toDouble(),
      paymentStatus: json['payment_status'] as String?,
      paymentMode: json['payment_mode'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SimpleAppointmentToJson(_SimpleAppointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_patient_id': instance.clinicPatientId,
      'clinic_id': instance.clinicId,
      'doctor_id': instance.doctorId,
      'booking_number': instance.bookingNumber,
      'token_number': instance.tokenNumber,
      'appointment_date': instance.appointmentDate,
      'appointment_time': instance.appointmentTime,
      'duration_minutes': ?instance.durationMinutes,
      'consultation_type': instance.consultationType,
      'reason': ?instance.reason,
      'status': instance.status,
      'fee_amount': ?instance.feeAmount,
      'payment_status': ?instance.paymentStatus,
      'payment_mode': ?instance.paymentMode,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_SimpleAppointmentResponse _$SimpleAppointmentResponseFromJson(
  Map<String, dynamic> json,
) => _SimpleAppointmentResponse(
  message: json['message'] as String,
  appointment: SimpleAppointment.fromJson(
    json['appointment'] as Map<String, dynamic>,
  ),
  followUp: json['followUp'] == null
      ? null
      : FollowUpInfo.fromJson(json['followUp'] as Map<String, dynamic>),
  clinicPatientUpdate: json['clinic_patient_update'] == null
      ? null
      : ClinicPatientUpdate.fromJson(
          json['clinic_patient_update'] as Map<String, dynamic>,
        ),
  isRegularAppointment: json['is_regular_appointment'] as bool?,
  followupGranted: json['followup_granted'] as bool?,
  followupMessage: json['followup_message'] as String?,
  followupValidUntil: json['followup_valid_until'] as String?,
  isFreeFollowup: json['is_free_followup'] as bool?,
  followupType: json['followup_type'] as String?,
  followUpInfo: json['follow_up_info'] == null
      ? null
      : FollowUpInfo.fromJson(json['follow_up_info'] as Map<String, dynamic>),
  renewalOptions: json['renewalOptions'] == null
      ? null
      : RenewalOptions.fromJson(json['renewalOptions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SimpleAppointmentResponseToJson(
  _SimpleAppointmentResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'appointment': instance.appointment.toJson(),
  'followUp': ?instance.followUp?.toJson(),
  'clinic_patient_update': ?instance.clinicPatientUpdate?.toJson(),
  'is_regular_appointment': ?instance.isRegularAppointment,
  'followup_granted': ?instance.followupGranted,
  'followup_message': ?instance.followupMessage,
  'followup_valid_until': ?instance.followupValidUntil,
  'is_free_followup': ?instance.isFreeFollowup,
  'followup_type': ?instance.followupType,
  'follow_up_info': ?instance.followUpInfo?.toJson(),
  'renewalOptions': ?instance.renewalOptions?.toJson(),
};

_FollowUpInfo _$FollowUpInfoFromJson(Map<String, dynamic> json) =>
    _FollowUpInfo(
      id: json['id'] as String?,
      clinicPatientId: json['clinic_patient_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      patientName: json['patient_name'] as String?,
      doctorId: json['doctor_id'] as String?,
      doctorName: json['doctor_name'] as String?,
      departmentId: json['department_id'] as String?,
      departmentName: json['department_name'] as String?,
      sourceAppointmentId: json['source_appointment_id'] as String?,
      followUpStatus: json['follow_up_status'] as String?,
      isFree: json['is_free'] as bool?,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      daysRemaining: (json['days_remaining'] as num?)?.toInt(),
      usedAppointmentId: json['used_appointment_id'] as String?,
      usedAt: json['used_at'] as String?,
      renewedAt: json['renewed_at'] as String?,
      renewedByAppointmentId: json['renewed_by_appointment_id'] as String?,
      appointmentSlotType: json['appointment_slot_type'] as String?,
      followUpType: json['follow_up_type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FollowUpInfoToJson(_FollowUpInfo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'clinic_patient_id': ?instance.clinicPatientId,
      'clinic_id': ?instance.clinicId,
      'patient_name': ?instance.patientName,
      'doctor_id': ?instance.doctorId,
      'doctor_name': ?instance.doctorName,
      'department_id': ?instance.departmentId,
      'department_name': ?instance.departmentName,
      'source_appointment_id': ?instance.sourceAppointmentId,
      'follow_up_status': ?instance.followUpStatus,
      'is_free': ?instance.isFree,
      'valid_from': ?instance.validFrom,
      'valid_until': ?instance.validUntil,
      'days_remaining': ?instance.daysRemaining,
      'used_appointment_id': ?instance.usedAppointmentId,
      'used_at': ?instance.usedAt,
      'renewed_at': ?instance.renewedAt,
      'renewed_by_appointment_id': ?instance.renewedByAppointmentId,
      'appointment_slot_type': ?instance.appointmentSlotType,
      'follow_up_type': ?instance.followUpType,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_ClinicPatientUpdate _$ClinicPatientUpdateFromJson(Map<String, dynamic> json) =>
    _ClinicPatientUpdate(
      currentFollowupStatus: json['current_followup_status'] as String?,
      lastAppointmentId: json['last_appointment_id'] as String?,
      lastFollowupId: json['last_followup_id'] as String?,
    );

Map<String, dynamic> _$ClinicPatientUpdateToJson(
  _ClinicPatientUpdate instance,
) => <String, dynamic>{
  'current_followup_status': ?instance.currentFollowupStatus,
  'last_appointment_id': ?instance.lastAppointmentId,
  'last_followup_id': ?instance.lastFollowupId,
};

_RenewalOptions _$RenewalOptionsFromJson(Map<String, dynamic> json) =>
    _RenewalOptions(
      canRenew: json['can_renew'] as bool?,
      message: json['message'] as String?,
      previousFollowupId: json['previous_followup_id'] as String?,
    );

Map<String, dynamic> _$RenewalOptionsToJson(_RenewalOptions instance) =>
    <String, dynamic>{
      'can_renew': ?instance.canRenew,
      'message': ?instance.message,
      'previous_followup_id': ?instance.previousFollowupId,
    };

_Department _$DepartmentFromJson(Map<String, dynamic> json) => _Department(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  doctors: (json['doctors'] as List<dynamic>?)
      ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DepartmentToJson(_Department instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'description': ?instance.description,
      'doctors': ?instance.doctors?.map((e) => e.toJson()).toList(),
    };

_ConsultationType _$ConsultationTypeFromJson(Map<String, dynamic> json) =>
    _ConsultationType(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      baseFee: (json['baseFee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConsultationTypeToJson(_ConsultationType instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'description': ?instance.description,
      'baseFee': ?instance.baseFee,
    };

_PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    _PaymentMethod(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$PaymentMethodToJson(_PaymentMethod instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'type': ?instance.type,
      'isActive': ?instance.isActive,
    };

_MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    _MedicalRecord(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      appointmentId: json['appointmentId'] as String?,
      recordType: json['recordType'] as String?,
      fileName: json['fileName'] as String?,
      fileUrl: json['fileUrl'] as String?,
      uploadDate: json['uploadDate'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MedicalRecordToJson(_MedicalRecord instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'patientId': ?instance.patientId,
      'appointmentId': ?instance.appointmentId,
      'recordType': ?instance.recordType,
      'fileName': ?instance.fileName,
      'fileUrl': ?instance.fileUrl,
      'uploadDate': ?instance.uploadDate,
      'description': ?instance.description,
    };

_Prescription _$PrescriptionFromJson(Map<String, dynamic> json) =>
    _Prescription(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      appointmentId: json['appointmentId'] as String?,
      medication: json['medication'] as String?,
      dosage: json['dosage'] as String?,
      frequency: json['frequency'] as String?,
      duration: json['duration'] as String?,
      instructions: json['instructions'] as String?,
      prescribedDate: json['prescribedDate'] as String?,
    );

Map<String, dynamic> _$PrescriptionToJson(_Prescription instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'patientId': ?instance.patientId,
      'appointmentId': ?instance.appointmentId,
      'medication': ?instance.medication,
      'dosage': ?instance.dosage,
      'frequency': ?instance.frequency,
      'duration': ?instance.duration,
      'instructions': ?instance.instructions,
      'prescribedDate': ?instance.prescribedDate,
    };
