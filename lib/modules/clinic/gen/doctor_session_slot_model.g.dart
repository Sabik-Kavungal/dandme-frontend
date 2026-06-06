// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_session_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IndividualSlot _$IndividualSlotFromJson(Map<String, dynamic> json) =>
    _IndividualSlot(
      id: json['id'] as String,
      sessionId: json['session_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      slotStart: json['slot_start'] as String?,
      slotEnd: json['slot_end'] as String?,
      startDatetime: json['start_datetime'] as String?,
      endDatetime: json['end_datetime'] as String?,
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

Map<String, dynamic> _$IndividualSlotToJson(_IndividualSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': ?instance.sessionId,
      'clinic_id': ?instance.clinicId,
      'slot_start': ?instance.slotStart,
      'slot_end': ?instance.slotEnd,
      'start_datetime': ?instance.startDatetime,
      'end_datetime': ?instance.endDatetime,
      'max_patients': instance.maxPatients,
      'available_count': instance.availableCount,
      'booked_count': instance.bookedCount,
      'is_booked': instance.isBooked,
      'is_bookable': instance.isBookable,
      'booked_patient_id': ?instance.bookedPatientId,
      'booked_appointment_id': ?instance.bookedAppointmentId,
      'status': instance.status,
      'display_message': instance.displayMessage,
      'notes': ?instance.notes,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_SessionDefinition _$SessionDefinitionFromJson(Map<String, dynamic> json) =>
    _SessionDefinition(
      sessionName: json['session_name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      maxPatients: (json['max_patients'] as num).toInt(),
      slotIntervalMinutes:
          (json['slot_interval_minutes'] as num?)?.toInt() ?? 5,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$SessionDefinitionToJson(_SessionDefinition instance) =>
    <String, dynamic>{
      'session_name': instance.sessionName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'max_patients': instance.maxPatients,
      'slot_interval_minutes': instance.slotIntervalMinutes,
      'notes': ?instance.notes,
    };

_DoctorSlotSession _$DoctorSlotSessionFromJson(Map<String, dynamic> json) =>
    _DoctorSlotSession(
      id: json['id'] as String,
      timeSlotId: json['time_slot_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      sessionName: json['session_name'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      startDatetime: json['start_datetime'] as String?,
      endDatetime: json['end_datetime'] as String?,
      maxPatients: (json['max_patients'] as num?)?.toInt() ?? 0,
      slotIntervalMinutes:
          (json['slot_interval_minutes'] as num?)?.toInt() ?? 5,
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

Map<String, dynamic> _$DoctorSlotSessionToJson(_DoctorSlotSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time_slot_id': ?instance.timeSlotId,
      'clinic_id': ?instance.clinicId,
      'session_name': ?instance.sessionName,
      'start_time': ?instance.startTime,
      'end_time': ?instance.endTime,
      'start_datetime': ?instance.startDatetime,
      'end_datetime': ?instance.endDatetime,
      'max_patients': instance.maxPatients,
      'slot_interval_minutes': instance.slotIntervalMinutes,
      'generated_slots': instance.generatedSlots,
      'available_slots': instance.availableSlots,
      'booked_slots': instance.bookedSlots,
      'notes': ?instance.notes,
      'slots': instance.slots.map((e) => e.toJson()).toList(),
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_DoctorSessionSlot _$DoctorSessionSlotFromJson(Map<String, dynamic> json) =>
    _DoctorSessionSlot(
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
              ?.map(
                (e) => DoctorSlotSession.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DoctorSessionSlotToJson(_DoctorSessionSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': ?instance.doctorId,
      'clinic_id': ?instance.clinicId,
      'date': ?instance.date,
      'day_of_week': ?instance.dayOfWeek,
      'slot_type': ?instance.slotType,
      'slot_duration': instance.slotDuration,
      'is_available': instance.isAvailable,
      'notes': ?instance.notes,
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_CreateSessionSlotsInput _$CreateSessionSlotsInputFromJson(
  Map<String, dynamic> json,
) => _CreateSessionSlotsInput(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  slotType: json['slot_type'] as String,
  slotDuration: (json['slot_duration'] as num?)?.toInt() ?? 5,
  date: json['date'] as String?,
  weekdays:
      (json['weekdays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  isAvailable: json['is_available'] as bool? ?? true,
  notes: json['notes'] as String?,
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => SessionDefinition.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateSessionSlotsInputToJson(
  _CreateSessionSlotsInput instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'slot_type': instance.slotType,
  'slot_duration': instance.slotDuration,
  'date': ?instance.date,
  'weekdays': instance.weekdays,
  'is_available': instance.isAvailable,
  'notes': ?instance.notes,
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
};

_ListSessionSlotsResponse _$ListSessionSlotsResponseFromJson(
  Map<String, dynamic> json,
) => _ListSessionSlotsResponse(
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
  walkinAvailable: json['walkin_available'] as bool? ?? false,
  walkinReason: json['walkin_reason'] as String?,
);

Map<String, dynamic> _$ListSessionSlotsResponseToJson(
  _ListSessionSlotsResponse instance,
) => <String, dynamic>{
  'doctor_id': ?instance.doctorId,
  'clinic_id': ?instance.clinicId,
  'date': ?instance.date,
  'slot_type': ?instance.slotType,
  'total': instance.total,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
  'walkin_available': instance.walkinAvailable,
  'walkin_reason': ?instance.walkinReason,
};
