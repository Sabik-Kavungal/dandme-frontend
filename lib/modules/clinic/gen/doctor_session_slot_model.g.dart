// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_session_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndividualSlotImpl _$$IndividualSlotImplFromJson(Map<String, dynamic> json) =>
    _$IndividualSlotImpl(
      id: json['id'] as String,
      sessionId: json['session_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      slotStart: json['slot_start'] as String?,
      slotEnd: json['slot_end'] as String?,
      maxPatients: (json['max_patients'] as num?)?.toInt() ?? 1,
      availableCount: (json['available_count'] as num?)?.toInt() ?? 1,
      bookedCount: (json['booked_count'] as num?)?.toInt() ?? 0,
      isBooked: json['is_booked'] as bool? ?? false,
      isBookable: json['is_bookable'] as bool? ?? true,
      bookedPatientId: json['booked_patient_id'] as String?,
      bookedAppointmentId: json['booked_appointment_id'] as String?,
      status: json['status'] as String? ?? 'available',
      displayMessage: json['display_message'] as String? ?? 'Available',
      notes: json['notes'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$IndividualSlotImplToJson(
  _$IndividualSlotImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.sessionId case final value?) 'session_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.slotStart case final value?) 'slot_start': value,
  if (instance.slotEnd case final value?) 'slot_end': value,
  'max_patients': instance.maxPatients,
  'available_count': instance.availableCount,
  'booked_count': instance.bookedCount,
  'is_booked': instance.isBooked,
  'is_bookable': instance.isBookable,
  if (instance.bookedPatientId case final value?) 'booked_patient_id': value,
  if (instance.bookedAppointmentId case final value?)
    'booked_appointment_id': value,
  'status': instance.status,
  'display_message': instance.displayMessage,
  if (instance.notes case final value?) 'notes': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};

_$SessionDefinitionImpl _$$SessionDefinitionImplFromJson(
  Map<String, dynamic> json,
) => _$SessionDefinitionImpl(
  sessionName: json['session_name'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  maxPatients: (json['max_patients'] as num).toInt(),
  slotIntervalMinutes: (json['slot_interval_minutes'] as num?)?.toInt() ?? 5,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$SessionDefinitionImplToJson(
  _$SessionDefinitionImpl instance,
) => <String, dynamic>{
  'session_name': instance.sessionName,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'max_patients': instance.maxPatients,
  'slot_interval_minutes': instance.slotIntervalMinutes,
  if (instance.notes case final value?) 'notes': value,
};

_$DoctorSlotSessionImpl _$$DoctorSlotSessionImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorSlotSessionImpl(
  id: json['id'] as String,
  timeSlotId: json['time_slot_id'] as String?,
  clinicId: json['clinic_id'] as String?,
  sessionName: json['session_name'] as String?,
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
  maxPatients: (json['max_patients'] as num?)?.toInt() ?? 0,
  slotIntervalMinutes: (json['slot_interval_minutes'] as num?)?.toInt() ?? 5,
  generatedSlots: (json['generated_slots'] as num?)?.toInt() ?? 0,
  availableSlots: (json['available_slots'] as num?)?.toInt() ?? 0,
  bookedSlots: (json['booked_slots'] as num?)?.toInt() ?? 0,
  notes: json['notes'] as String?,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map((e) => IndividualSlot.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$$DoctorSlotSessionImplToJson(
  _$DoctorSlotSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.timeSlotId case final value?) 'time_slot_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.sessionName case final value?) 'session_name': value,
  if (instance.startTime case final value?) 'start_time': value,
  if (instance.endTime case final value?) 'end_time': value,
  'max_patients': instance.maxPatients,
  'slot_interval_minutes': instance.slotIntervalMinutes,
  'generated_slots': instance.generatedSlots,
  'available_slots': instance.availableSlots,
  'booked_slots': instance.bookedSlots,
  if (instance.notes case final value?) 'notes': value,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};

_$DoctorSessionSlotImpl _$$DoctorSessionSlotImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorSessionSlotImpl(
  id: json['id'] as String,
  doctorId: json['doctor_id'] as String?,
  clinicId: json['clinic_id'] as String?,
  date: json['date'] as String?,
  dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
  slotType: json['slot_type'] as String?,
  slotDuration: (json['slot_duration'] as num?)?.toInt() ?? 5,
  isAvailable: json['is_available'] as bool? ?? true,
  notes: json['notes'] as String?,
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => DoctorSlotSession.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$$DoctorSessionSlotImplToJson(
  _$DoctorSessionSlotImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.doctorId case final value?) 'doctor_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.date case final value?) 'date': value,
  if (instance.dayOfWeek case final value?) 'day_of_week': value,
  if (instance.slotType case final value?) 'slot_type': value,
  'slot_duration': instance.slotDuration,
  'is_available': instance.isAvailable,
  if (instance.notes case final value?) 'notes': value,
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};

_$CreateSessionSlotsInputImpl _$$CreateSessionSlotsInputImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSessionSlotsInputImpl(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  slotType: json['slot_type'] as String,
  slotDuration: (json['slot_duration'] as num?)?.toInt() ?? 5,
  date: json['date'] as String,
  isAvailable: json['is_available'] as bool? ?? true,
  notes: json['notes'] as String?,
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => SessionDefinition.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateSessionSlotsInputImplToJson(
  _$CreateSessionSlotsInputImpl instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'slot_type': instance.slotType,
  'slot_duration': instance.slotDuration,
  'date': instance.date,
  'is_available': instance.isAvailable,
  if (instance.notes case final value?) 'notes': value,
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
};

_$CreateSessionSlotsResponseImpl _$$CreateSessionSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSessionSlotsResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: DoctorSessionSlot.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreateSessionSlotsResponseImplToJson(
  _$CreateSessionSlotsResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data.toJson(),
};

_$ListSessionSlotsResponseImpl _$$ListSessionSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ListSessionSlotsResponseImpl(
  doctorId: json['doctor_id'] as String?,
  clinicId: json['clinic_id'] as String?,
  date: json['date'] as String?,
  slotType: json['slot_type'] as String?,
  total: (json['total'] as num?)?.toInt() ?? 0,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map((e) => DoctorSessionSlot.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ListSessionSlotsResponseImplToJson(
  _$ListSessionSlotsResponseImpl instance,
) => <String, dynamic>{
  if (instance.doctorId case final value?) 'doctor_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.date case final value?) 'date': value,
  if (instance.slotType case final value?) 'slot_type': value,
  'total': instance.total,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
};
