// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentDetailsImpl _$$AppointmentDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentDetailsImpl(
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

Map<String, dynamic> _$$AppointmentDetailsImplToJson(
  _$AppointmentDetailsImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.tokenNumber case final value?) 'token_number': value,
  if (instance.moId case final value?) 'mo_id': value,
  if (instance.bookingNumber case final value?) 'booking_number': value,
  if (instance.consultationType case final value?) 'consultation_type': value,
  if (instance.appointmentDateTime case final value?)
    'appointment_date_time': value,
  if (instance.durationMinutes case final value?) 'duration_minutes': value,
  if (instance.sessionType case final value?) 'session_type': value,
  if (instance.status case final value?) 'status': value,
  if (instance.feeAmount case final value?) 'fee_amount': value,
  if (instance.feeStatus case final value?) 'fee_status': value,
  if (instance.paymentStatus case final value?) 'payment_status': value,
  if (instance.paymentMethod case final value?) 'payment_method': value,
  if (instance.notes case final value?) 'notes': value,
  if (instance.cancellationReason case final value?)
    'cancellation_reason': value,
  if (instance.slotDetails?.toJson() case final value?) 'slot_details': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
  if (instance.patientName case final value?) 'patient_name': value,
  if (instance.doctorName case final value?) 'doctor_name': value,
  if (instance.department case final value?) 'department': value,
  if (instance.clinicPatientId case final value?) 'clinic_patient_id': value,
  if (instance.patient?.toJson() case final value?) 'patient': value,
  if (instance.doctor?.toJson() case final value?) 'doctor': value,
  if (instance.clinic?.toJson() case final value?) 'clinic': value,
};

_$PatientDetailsImpl _$$PatientDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PatientDetailsImpl(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$PatientDetailsImplToJson(
  _$PatientDetailsImpl instance,
) => <String, dynamic>{
  if (instance.name case final value?) 'name': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.email case final value?) 'email': value,
  if (instance.age case final value?) 'age': value,
  if (instance.gender case final value?) 'gender': value,
};

_$DoctorDetailsImpl _$$DoctorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DoctorDetailsImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$DoctorDetailsImplToJson(_$DoctorDetailsImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };

_$DepartmentDetailsImpl _$$DepartmentDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$DepartmentDetailsImpl(
  id: json['id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$DepartmentDetailsImplToJson(
  _$DepartmentDetailsImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.name case final value?) 'name': value,
};

_$ClinicDetailsImpl _$$ClinicDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ClinicDetailsImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ClinicDetailsImplToJson(_$ClinicDetailsImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };

_$SlotDetailsImpl _$$SlotDetailsImplFromJson(Map<String, dynamic> json) =>
    _$SlotDetailsImpl(
      slotId: json['slot_id'] as String?,
      slotStatus: json['slot_status'] as String?,
      slotStartTime: json['slot_start_time'] as String?,
      slotEndTime: json['slot_end_time'] as String?,
      slotDate: json['slot_date'] as String?,
      slotFullTime: json['slot_full_time'] as String?,
      sessionName: json['session_name'] as String?,
    );

Map<String, dynamic> _$$SlotDetailsImplToJson(_$SlotDetailsImpl instance) =>
    <String, dynamic>{
      if (instance.slotId case final value?) 'slot_id': value,
      if (instance.slotStatus case final value?) 'slot_status': value,
      if (instance.slotStartTime case final value?) 'slot_start_time': value,
      if (instance.slotEndTime case final value?) 'slot_end_time': value,
      if (instance.slotDate case final value?) 'slot_date': value,
      if (instance.slotFullTime case final value?) 'slot_full_time': value,
      if (instance.sessionName case final value?) 'session_name': value,
    };

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
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

Map<String, dynamic> _$$AppointmentImplToJson(
  _$AppointmentImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.tokenNumber case final value?) 'token_number': value,
  if (instance.moId case final value?) 'mo_id': value,
  if (instance.patientName case final value?) 'patient_name': value,
  if (instance.doctorName case final value?) 'doctor_name': value,
  if (instance.department case final value?) 'department': value,
  if (instance.consultationType case final value?) 'consultation_type': value,
  if (instance.appointmentDateTime case final value?)
    'appointment_date_time': value,
  if (instance.status case final value?) 'status': value,
  if (instance.feeStatus case final value?) 'fee_status': value,
  if (instance.feeAmount case final value?) 'fee_amount': value,
  if (instance.paymentStatus case final value?) 'payment_status': value,
  if (instance.bookingNumber case final value?) 'booking_number': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.appointmentId case final value?) 'appointmentId': value,
  if (instance.patientId case final value?) 'patientId': value,
  if (instance.doctorId case final value?) 'doctorId': value,
  if (instance.appointmentDate case final value?) 'appointmentDate': value,
  if (instance.appointmentTime case final value?) 'appointmentTime': value,
  if (instance.bookedOn case final value?) 'bookedOn': value,
  if (instance.reasonForVisit case final value?) 'reasonForVisit': value,
  if (instance.notes case final value?) 'notes': value,
  if (instance.fee case final value?) 'fee': value,
  if (instance.paymentMethod case final value?) 'paymentMethod': value,
  if (instance.patient?.toJson() case final value?) 'patient': value,
  if (instance.doctor?.toJson() case final value?) 'doctor': value,
};

_$AppointmentListResponseImpl _$$AppointmentListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentListResponseImpl(
  appointments: (json['appointments'] as List<dynamic>)
      .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AppointmentListResponseImplToJson(
  _$AppointmentListResponseImpl instance,
) => <String, dynamic>{
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
  if (instance.totalCount case final value?) 'total_count': value,
};

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
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

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.mobileId case final value?) 'mobileId': value,
      if (instance.dateOfBirth case final value?) 'dateOfBirth': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.bloodGroup case final value?) 'bloodGroup': value,
      if (instance.address1 case final value?) 'address1': value,
      if (instance.address2 case final value?) 'address2': value,
      if (instance.district case final value?) 'district': value,
      if (instance.state case final value?) 'state': value,
      if (instance.height case final value?) 'height': value,
      if (instance.weight case final value?) 'weight': value,
      if (instance.smokingStatus case final value?) 'smokingStatus': value,
      if (instance.alcoholUse case final value?) 'alcoholUse': value,
      if (instance.vitalSigns?.toJson() case final value?) 'vitalSigns': value,
    };

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
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

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.fullName case final value?) 'fullName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.department case final value?) 'department': value,
      if (instance.specialization case final value?) 'specialization': value,
      if (instance.qualification case final value?) 'qualification': value,
      if (instance.experience case final value?) 'experience': value,
      if (instance.consultationFee case final value?) 'consultationFee': value,
      if (instance.isAvailable case final value?) 'isAvailable': value,
      if (instance.availableSlots?.map((e) => e.toJson()).toList()
          case final value?)
        'availableSlots': value,
    };

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      id: json['id'] as String?,
      time: json['time'] as String?,
      date: json['date'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      isBooked: json['isBooked'] as bool?,
      doctorId: json['doctorId'] as String?,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.time case final value?) 'time': value,
      if (instance.date case final value?) 'date': value,
      if (instance.isAvailable case final value?) 'isAvailable': value,
      if (instance.isBooked case final value?) 'isBooked': value,
      if (instance.doctorId case final value?) 'doctorId': value,
    };

_$VitalSignsImpl _$$VitalSignsImplFromJson(Map<String, dynamic> json) =>
    _$VitalSignsImpl(
      bloodPressure: json['bloodPressure'] as String?,
      temperature: json['temperature'] as String?,
      pulse: json['pulse'] as String?,
      respiratoryRate: json['respiratoryRate'] as String?,
      oxygenSaturation: json['oxygenSaturation'] as String?,
    );

Map<String, dynamic> _$$VitalSignsImplToJson(
  _$VitalSignsImpl instance,
) => <String, dynamic>{
  if (instance.bloodPressure case final value?) 'bloodPressure': value,
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.pulse case final value?) 'pulse': value,
  if (instance.respiratoryRate case final value?) 'respiratoryRate': value,
  if (instance.oxygenSaturation case final value?) 'oxygenSaturation': value,
};

_$AppointmentSummaryImpl _$$AppointmentSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentSummaryImpl(
  todayAppointments: (json['todayAppointments'] as num?)?.toInt(),
  upcomingAppointments: (json['upcomingAppointments'] as num?)?.toInt(),
  completedAppointments: (json['completedAppointments'] as num?)?.toInt(),
  cancelledAppointments: (json['cancelledAppointments'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AppointmentSummaryImplToJson(
  _$AppointmentSummaryImpl instance,
) => <String, dynamic>{
  if (instance.todayAppointments case final value?) 'todayAppointments': value,
  if (instance.upcomingAppointments case final value?)
    'upcomingAppointments': value,
  if (instance.completedAppointments case final value?)
    'completedAppointments': value,
  if (instance.cancelledAppointments case final value?)
    'cancelledAppointments': value,
};

_$SimpleAppointmentImpl _$$SimpleAppointmentImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleAppointmentImpl(
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

Map<String, dynamic> _$$SimpleAppointmentImplToJson(
  _$SimpleAppointmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_patient_id': instance.clinicPatientId,
  'clinic_id': instance.clinicId,
  'doctor_id': instance.doctorId,
  'booking_number': instance.bookingNumber,
  'token_number': instance.tokenNumber,
  'appointment_date': instance.appointmentDate,
  'appointment_time': instance.appointmentTime,
  if (instance.durationMinutes case final value?) 'duration_minutes': value,
  'consultation_type': instance.consultationType,
  if (instance.reason case final value?) 'reason': value,
  'status': instance.status,
  if (instance.feeAmount case final value?) 'fee_amount': value,
  if (instance.paymentStatus case final value?) 'payment_status': value,
  if (instance.paymentMode case final value?) 'payment_mode': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};

_$SimpleAppointmentResponseImpl _$$SimpleAppointmentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleAppointmentResponseImpl(
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

Map<String, dynamic> _$$SimpleAppointmentResponseImplToJson(
  _$SimpleAppointmentResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'appointment': instance.appointment.toJson(),
  if (instance.followUp?.toJson() case final value?) 'followUp': value,
  if (instance.clinicPatientUpdate?.toJson() case final value?)
    'clinic_patient_update': value,
  if (instance.isRegularAppointment case final value?)
    'is_regular_appointment': value,
  if (instance.followupGranted case final value?) 'followup_granted': value,
  if (instance.followupMessage case final value?) 'followup_message': value,
  if (instance.followupValidUntil case final value?)
    'followup_valid_until': value,
  if (instance.isFreeFollowup case final value?) 'is_free_followup': value,
  if (instance.followupType case final value?) 'followup_type': value,
  if (instance.followUpInfo?.toJson() case final value?)
    'follow_up_info': value,
  if (instance.renewalOptions?.toJson() case final value?)
    'renewalOptions': value,
};

_$FollowUpInfoImpl _$$FollowUpInfoImplFromJson(Map<String, dynamic> json) =>
    _$FollowUpInfoImpl(
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

Map<String, dynamic> _$$FollowUpInfoImplToJson(
  _$FollowUpInfoImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.clinicPatientId case final value?) 'clinic_patient_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.patientName case final value?) 'patient_name': value,
  if (instance.doctorId case final value?) 'doctor_id': value,
  if (instance.doctorName case final value?) 'doctor_name': value,
  if (instance.departmentId case final value?) 'department_id': value,
  if (instance.departmentName case final value?) 'department_name': value,
  if (instance.sourceAppointmentId case final value?)
    'source_appointment_id': value,
  if (instance.followUpStatus case final value?) 'follow_up_status': value,
  if (instance.isFree case final value?) 'is_free': value,
  if (instance.validFrom case final value?) 'valid_from': value,
  if (instance.validUntil case final value?) 'valid_until': value,
  if (instance.daysRemaining case final value?) 'days_remaining': value,
  if (instance.usedAppointmentId case final value?)
    'used_appointment_id': value,
  if (instance.usedAt case final value?) 'used_at': value,
  if (instance.renewedAt case final value?) 'renewed_at': value,
  if (instance.renewedByAppointmentId case final value?)
    'renewed_by_appointment_id': value,
  if (instance.appointmentSlotType case final value?)
    'appointment_slot_type': value,
  if (instance.followUpType case final value?) 'follow_up_type': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};

_$ClinicPatientUpdateImpl _$$ClinicPatientUpdateImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicPatientUpdateImpl(
  currentFollowupStatus: json['current_followup_status'] as String?,
  lastAppointmentId: json['last_appointment_id'] as String?,
  lastFollowupId: json['last_followup_id'] as String?,
);

Map<String, dynamic> _$$ClinicPatientUpdateImplToJson(
  _$ClinicPatientUpdateImpl instance,
) => <String, dynamic>{
  if (instance.currentFollowupStatus case final value?)
    'current_followup_status': value,
  if (instance.lastAppointmentId case final value?)
    'last_appointment_id': value,
  if (instance.lastFollowupId case final value?) 'last_followup_id': value,
};

_$RenewalOptionsImpl _$$RenewalOptionsImplFromJson(Map<String, dynamic> json) =>
    _$RenewalOptionsImpl(
      canRenew: json['can_renew'] as bool?,
      message: json['message'] as String?,
      previousFollowupId: json['previous_followup_id'] as String?,
    );

Map<String, dynamic> _$$RenewalOptionsImplToJson(
  _$RenewalOptionsImpl instance,
) => <String, dynamic>{
  if (instance.canRenew case final value?) 'can_renew': value,
  if (instance.message case final value?) 'message': value,
  if (instance.previousFollowupId case final value?)
    'previous_followup_id': value,
};

_$DepartmentImpl _$$DepartmentImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DepartmentImplToJson(_$DepartmentImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.doctors?.map((e) => e.toJson()).toList() case final value?)
        'doctors': value,
    };

_$ConsultationTypeImpl _$$ConsultationTypeImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationTypeImpl(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  baseFee: (json['baseFee'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$ConsultationTypeImplToJson(
  _$ConsultationTypeImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.name case final value?) 'name': value,
  if (instance.description case final value?) 'description': value,
  if (instance.baseFee case final value?) 'baseFee': value,
};

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.type case final value?) 'type': value,
      if (instance.isActive case final value?) 'isActive': value,
    };

_$MedicalRecordImpl _$$MedicalRecordImplFromJson(Map<String, dynamic> json) =>
    _$MedicalRecordImpl(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      appointmentId: json['appointmentId'] as String?,
      recordType: json['recordType'] as String?,
      fileName: json['fileName'] as String?,
      fileUrl: json['fileUrl'] as String?,
      uploadDate: json['uploadDate'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$MedicalRecordImplToJson(_$MedicalRecordImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.patientId case final value?) 'patientId': value,
      if (instance.appointmentId case final value?) 'appointmentId': value,
      if (instance.recordType case final value?) 'recordType': value,
      if (instance.fileName case final value?) 'fileName': value,
      if (instance.fileUrl case final value?) 'fileUrl': value,
      if (instance.uploadDate case final value?) 'uploadDate': value,
      if (instance.description case final value?) 'description': value,
    };

_$PrescriptionImpl _$$PrescriptionImplFromJson(Map<String, dynamic> json) =>
    _$PrescriptionImpl(
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

Map<String, dynamic> _$$PrescriptionImplToJson(_$PrescriptionImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.patientId case final value?) 'patientId': value,
      if (instance.appointmentId case final value?) 'appointmentId': value,
      if (instance.medication case final value?) 'medication': value,
      if (instance.dosage case final value?) 'dosage': value,
      if (instance.frequency case final value?) 'frequency': value,
      if (instance.duration case final value?) 'duration': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (instance.prescribedDate case final value?) 'prescribedDate': value,
    };
