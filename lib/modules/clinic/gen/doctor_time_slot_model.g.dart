// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_time_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorTimeSlotResponseImpl _$$DoctorTimeSlotResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorTimeSlotResponseImpl(
  id: json['id'] as String,
  doctorId: json['doctor_id'] as String,
  doctorName: json['doctor_name'] as String?,
  clinicId: json['clinic_id'] as String,
  clinicName: json['clinic_name'] as String?,
  date: json['date'] as String,
  dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
  dayName: json['day_name'] as String?,
  slotType: json['slot_type'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  isActive: json['is_active'] as bool,
  maxPatients: (json['max_patients'] as num).toInt(),
  bookedPatients: (json['booked_patients'] as num?)?.toInt() ?? 0,
  availableSpots: (json['available_spots'] as num?)?.toInt() ?? 0,
  isAvailable: json['is_available'] as bool? ?? true,
  isBookable: json['is_bookable'] as bool? ?? true,
  status: json['status'] as String? ?? 'available',
  displayMessage: json['display_message'] as String? ?? 'Available',
  notes: json['notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$DoctorTimeSlotResponseImplToJson(
  _$DoctorTimeSlotResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor_id': instance.doctorId,
  if (instance.doctorName case final value?) 'doctor_name': value,
  'clinic_id': instance.clinicId,
  if (instance.clinicName case final value?) 'clinic_name': value,
  'date': instance.date,
  if (instance.dayOfWeek case final value?) 'day_of_week': value,
  if (instance.dayName case final value?) 'day_name': value,
  'slot_type': instance.slotType,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'is_active': instance.isActive,
  'max_patients': instance.maxPatients,
  'booked_patients': instance.bookedPatients,
  'available_spots': instance.availableSpots,
  'is_available': instance.isAvailable,
  'is_bookable': instance.isBookable,
  'status': instance.status,
  'display_message': instance.displayMessage,
  if (instance.notes case final value?) 'notes': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'created_at': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updated_at': value,
};

_$TimeSlotDefinitionImpl _$$TimeSlotDefinitionImplFromJson(
  Map<String, dynamic> json,
) => _$TimeSlotDefinitionImpl(
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  maxPatients: (json['max_patients'] as num?)?.toInt() ?? 1,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$TimeSlotDefinitionImplToJson(
  _$TimeSlotDefinitionImpl instance,
) => <String, dynamic>{
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'max_patients': instance.maxPatients,
  if (instance.notes case final value?) 'notes': value,
};

_$CreateDoctorTimeSlotInputImpl _$$CreateDoctorTimeSlotInputImplFromJson(
  Map<String, dynamic> json,
) => _$CreateDoctorTimeSlotInputImpl(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  slotType: json['slot_type'] as String,
  date: json['date'] as String,
  slots: (json['slots'] as List<dynamic>)
      .map((e) => TimeSlotDefinition.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateDoctorTimeSlotInputImplToJson(
  _$CreateDoctorTimeSlotInputImpl instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'slot_type': instance.slotType,
  'date': instance.date,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
};

_$BulkCreateDoctorTimeSlotsResponseImpl
_$$BulkCreateDoctorTimeSlotsResponseImplFromJson(Map<String, dynamic> json) =>
    _$BulkCreateDoctorTimeSlotsResponseImpl(
      message: json['message'] as String,
      createdSlots:
          (json['created_slots'] as List<dynamic>?)
              ?.map(
                (e) =>
                    DoctorTimeSlotResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      failedSlots: json['failed_slots'] as List<dynamic>? ?? const [],
      totalCreated: (json['total_created'] as num).toInt(),
      totalFailed: (json['total_failed'] as num).toInt(),
    );

Map<String, dynamic> _$$BulkCreateDoctorTimeSlotsResponseImplToJson(
  _$BulkCreateDoctorTimeSlotsResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'created_slots': instance.createdSlots.map((e) => e.toJson()).toList(),
  'failed_slots': instance.failedSlots,
  'total_created': instance.totalCreated,
  'total_failed': instance.totalFailed,
};

_$AvailableSlotImpl _$$AvailableSlotImplFromJson(Map<String, dynamic> json) =>
    _$AvailableSlotImpl(
      id: json['id'] as String,
      clinicId: json['clinic_id'] as String,
      clinicName: json['clinic_name'] as String?,
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      dayName: json['day_name'] as String,
      slotType: json['slot_type'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      maxPatients: (json['max_patients'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AvailableSlotImplToJson(_$AvailableSlotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_id': instance.clinicId,
      if (instance.clinicName case final value?) 'clinic_name': value,
      'day_of_week': instance.dayOfWeek,
      'day_name': instance.dayName,
      'slot_type': instance.slotType,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'max_patients': instance.maxPatients,
      if (instance.notes case final value?) 'notes': value,
    };

_$DoctorTimeSlotsResponseImpl _$$DoctorTimeSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorTimeSlotsResponseImpl(
  availableSlots: (json['available_slots'] as List<dynamic>)
      .map((e) => AvailableSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$DoctorTimeSlotsResponseImplToJson(
  _$DoctorTimeSlotsResponseImpl instance,
) => <String, dynamic>{
  'available_slots': instance.availableSlots.map((e) => e.toJson()).toList(),
};

_$DaySlotGroupImpl _$$DaySlotGroupImplFromJson(Map<String, dynamic> json) =>
    _$DaySlotGroupImpl(
      dayName: json['day_name'] as String,
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map(
                (e) =>
                    DoctorTimeSlotResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      hasSlots: json['has_slots'] as bool? ?? false,
      totalSlots: (json['total_slots'] as num?)?.toInt() ?? 0,
      availableSlots: (json['available_slots'] as num?)?.toInt() ?? 0,
      isAvailable: json['is_available'] as bool? ?? false,
      status: json['status'] as String? ?? 'unavailable',
    );

Map<String, dynamic> _$$DaySlotGroupImplToJson(_$DaySlotGroupImpl instance) =>
    <String, dynamic>{
      'day_name': instance.dayName,
      'day_of_week': instance.dayOfWeek,
      'slots': instance.slots.map((e) => e.toJson()).toList(),
      'has_slots': instance.hasSlots,
      'total_slots': instance.totalSlots,
      'available_slots': instance.availableSlots,
      'is_available': instance.isAvailable,
      'status': instance.status,
    };

_$GroupedTimeSlotsResponseImpl _$$GroupedTimeSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GroupedTimeSlotsResponseImpl(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String?,
  slotType: json['slot_type'] as String?,
  date: json['date'] as String?,
  days:
      (json['days'] as List<dynamic>?)
          ?.map((e) => DaySlotGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$GroupedTimeSlotsResponseImplToJson(
  _$GroupedTimeSlotsResponseImpl instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.slotType case final value?) 'slot_type': value,
  if (instance.date case final value?) 'date': value,
  'days': instance.days.map((e) => e.toJson()).toList(),
};

_$ListTimeSlotsResponseImpl _$$ListTimeSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ListTimeSlotsResponseImpl(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String?,
  slotType: json['slot_type'] as String?,
  date: json['date'] as String?,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map(
            (e) => DoctorTimeSlotResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ListTimeSlotsResponseImplToJson(
  _$ListTimeSlotsResponseImpl instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.slotType case final value?) 'slot_type': value,
  if (instance.date case final value?) 'date': value,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

_$CreateDateSpecificSlotsInputImpl _$$CreateDateSpecificSlotsInputImplFromJson(
  Map<String, dynamic> json,
) => _$CreateDateSpecificSlotsInputImpl(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  slotType: json['slot_type'] as String,
  date: json['date'] as String?,
  dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
  slots: (json['slots'] as List<dynamic>)
      .map((e) => SimpleTimeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateDateSpecificSlotsInputImplToJson(
  _$CreateDateSpecificSlotsInputImpl instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'slot_type': instance.slotType,
  if (instance.date case final value?) 'date': value,
  if (instance.dayOfWeek case final value?) 'day_of_week': value,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
};

_$SimpleTimeSlotImpl _$$SimpleTimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$SimpleTimeSlotImpl(
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      maxPatients: (json['max_patients'] as num?)?.toInt(),
      dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$SimpleTimeSlotImplToJson(
  _$SimpleTimeSlotImpl instance,
) => <String, dynamic>{
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  if (instance.maxPatients case final value?) 'max_patients': value,
  if (instance.dayOfWeek case final value?) 'day_of_week': value,
  if (instance.notes case final value?) 'notes': value,
};

_$DateSpecificSlotResponseImpl _$$DateSpecificSlotResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DateSpecificSlotResponseImpl(
  id: json['id'] as String,
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  date: json['date'] as String,
  slotType: json['slot_type'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  maxPatients: (json['max_patients'] as num).toInt(),
  bookedPatients: (json['booked_patients'] as num?)?.toInt(),
  availableSpots: (json['available_spots'] as num?)?.toInt(),
  isAvailable: json['is_available'] as bool?,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$DateSpecificSlotResponseImplToJson(
  _$DateSpecificSlotResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'date': instance.date,
  'slot_type': instance.slotType,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'max_patients': instance.maxPatients,
  if (instance.bookedPatients case final value?) 'booked_patients': value,
  if (instance.availableSpots case final value?) 'available_spots': value,
  if (instance.isAvailable case final value?) 'is_available': value,
  if (instance.status case final value?) 'status': value,
  if (instance.notes case final value?) 'notes': value,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_$CreateSlotsResponseImpl _$$CreateSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSlotsResponseImpl(
  message: json['message'] as String,
  createdSlots:
      (json['created_slots'] as List<dynamic>?)
          ?.map(
            (e) => DateSpecificSlotResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  failedSlots:
      (json['failed_slots'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  totalCreated: (json['total_created'] as num).toInt(),
  totalFailed: (json['total_failed'] as num).toInt(),
);

Map<String, dynamic> _$$CreateSlotsResponseImplToJson(
  _$CreateSlotsResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'created_slots': instance.createdSlots.map((e) => e.toJson()).toList(),
  'failed_slots': instance.failedSlots,
  'total_created': instance.totalCreated,
  'total_failed': instance.totalFailed,
};

_$ListSlotsResponseImpl _$$ListSlotsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ListSlotsResponseImpl(
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map(
            (e) => DateSpecificSlotResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  doctorId: json['doctor_id'] as String?,
  clinicId: json['clinic_id'] as String?,
  slotType: json['slot_type'] as String?,
  date: json['date'] as String?,
);

Map<String, dynamic> _$$ListSlotsResponseImplToJson(
  _$ListSlotsResponseImpl instance,
) => <String, dynamic>{
  'slots': instance.slots.map((e) => e.toJson()).toList(),
  'total': instance.total,
  if (instance.doctorId case final value?) 'doctor_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.slotType case final value?) 'slot_type': value,
  if (instance.date case final value?) 'date': value,
};
