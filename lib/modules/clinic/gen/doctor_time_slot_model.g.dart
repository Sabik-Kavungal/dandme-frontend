// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_time_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorTimeSlotResponse _$DoctorTimeSlotResponseFromJson(
  Map<String, dynamic> json,
) => _DoctorTimeSlotResponse(
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
  startDateTime: json['start_datetime'] as String?,
  endDateTime: json['end_datetime'] as String?,
  notes: json['notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DoctorTimeSlotResponseToJson(
  _DoctorTimeSlotResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor_id': instance.doctorId,
  'doctor_name': ?instance.doctorName,
  'clinic_id': instance.clinicId,
  'clinic_name': ?instance.clinicName,
  'date': instance.date,
  'day_of_week': ?instance.dayOfWeek,
  'day_name': ?instance.dayName,
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
  'start_datetime': ?instance.startDateTime,
  'end_datetime': ?instance.endDateTime,
  'notes': ?instance.notes,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};

_TimeSlotDefinition _$TimeSlotDefinitionFromJson(Map<String, dynamic> json) =>
    _TimeSlotDefinition(
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      maxPatients: (json['max_patients'] as num?)?.toInt() ?? 1,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$TimeSlotDefinitionToJson(_TimeSlotDefinition instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'max_patients': instance.maxPatients,
      'notes': ?instance.notes,
    };

_CreateDoctorTimeSlotInput _$CreateDoctorTimeSlotInputFromJson(
  Map<String, dynamic> json,
) => _CreateDoctorTimeSlotInput(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  slotType: json['slot_type'] as String,
  date: json['date'] as String,
  slots: (json['slots'] as List<dynamic>)
      .map((e) => TimeSlotDefinition.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateDoctorTimeSlotInputToJson(
  _CreateDoctorTimeSlotInput instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'slot_type': instance.slotType,
  'date': instance.date,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
};

_BulkCreateDoctorTimeSlotsResponse _$BulkCreateDoctorTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) => _BulkCreateDoctorTimeSlotsResponse(
  message: json['message'] as String,
  createdSlots:
      (json['created_slots'] as List<dynamic>?)
          ?.map(
            (e) => DoctorTimeSlotResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  failedSlots: json['failed_slots'] as List<dynamic>? ?? const [],
  totalCreated: (json['total_created'] as num).toInt(),
  totalFailed: (json['total_failed'] as num).toInt(),
);

Map<String, dynamic> _$BulkCreateDoctorTimeSlotsResponseToJson(
  _BulkCreateDoctorTimeSlotsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'created_slots': instance.createdSlots.map((e) => e.toJson()).toList(),
  'failed_slots': instance.failedSlots,
  'total_created': instance.totalCreated,
  'total_failed': instance.totalFailed,
};

_AvailableSlot _$AvailableSlotFromJson(Map<String, dynamic> json) =>
    _AvailableSlot(
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

Map<String, dynamic> _$AvailableSlotToJson(_AvailableSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_id': instance.clinicId,
      'clinic_name': ?instance.clinicName,
      'day_of_week': instance.dayOfWeek,
      'day_name': instance.dayName,
      'slot_type': instance.slotType,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'max_patients': instance.maxPatients,
      'notes': ?instance.notes,
    };

_DoctorTimeSlotsResponse _$DoctorTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) => _DoctorTimeSlotsResponse(
  availableSlots: (json['available_slots'] as List<dynamic>)
      .map((e) => AvailableSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DoctorTimeSlotsResponseToJson(
  _DoctorTimeSlotsResponse instance,
) => <String, dynamic>{
  'available_slots': instance.availableSlots.map((e) => e.toJson()).toList(),
};

_DaySlotGroup _$DaySlotGroupFromJson(Map<String, dynamic> json) =>
    _DaySlotGroup(
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

Map<String, dynamic> _$DaySlotGroupToJson(_DaySlotGroup instance) =>
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

_GroupedTimeSlotsResponse _$GroupedTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) => _GroupedTimeSlotsResponse(
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

Map<String, dynamic> _$GroupedTimeSlotsResponseToJson(
  _GroupedTimeSlotsResponse instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': ?instance.clinicId,
  'slot_type': ?instance.slotType,
  'date': ?instance.date,
  'days': instance.days.map((e) => e.toJson()).toList(),
};

_ListTimeSlotsResponse _$ListTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) => _ListTimeSlotsResponse(
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

Map<String, dynamic> _$ListTimeSlotsResponseToJson(
  _ListTimeSlotsResponse instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': ?instance.clinicId,
  'slot_type': ?instance.slotType,
  'date': ?instance.date,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

_CreateDateSpecificSlotsInput _$CreateDateSpecificSlotsInputFromJson(
  Map<String, dynamic> json,
) => _CreateDateSpecificSlotsInput(
  doctorId: json['doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  slotType: json['slot_type'] as String,
  date: json['date'] as String?,
  dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
  slots: (json['slots'] as List<dynamic>)
      .map((e) => SimpleTimeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateDateSpecificSlotsInputToJson(
  _CreateDateSpecificSlotsInput instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'slot_type': instance.slotType,
  'date': ?instance.date,
  'day_of_week': ?instance.dayOfWeek,
  'slots': instance.slots.map((e) => e.toJson()).toList(),
};

_SimpleTimeSlot _$SimpleTimeSlotFromJson(Map<String, dynamic> json) =>
    _SimpleTimeSlot(
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      maxPatients: (json['max_patients'] as num?)?.toInt(),
      dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$SimpleTimeSlotToJson(_SimpleTimeSlot instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'max_patients': ?instance.maxPatients,
      'day_of_week': ?instance.dayOfWeek,
      'notes': ?instance.notes,
    };

_DateSpecificSlotResponse _$DateSpecificSlotResponseFromJson(
  Map<String, dynamic> json,
) => _DateSpecificSlotResponse(
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

Map<String, dynamic> _$DateSpecificSlotResponseToJson(
  _DateSpecificSlotResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor_id': instance.doctorId,
  'clinic_id': instance.clinicId,
  'date': instance.date,
  'slot_type': instance.slotType,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'max_patients': instance.maxPatients,
  'booked_patients': ?instance.bookedPatients,
  'available_spots': ?instance.availableSpots,
  'is_available': ?instance.isAvailable,
  'status': ?instance.status,
  'notes': ?instance.notes,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_CreateSlotsResponse _$CreateSlotsResponseFromJson(Map<String, dynamic> json) =>
    _CreateSlotsResponse(
      message: json['message'] as String,
      createdSlots:
          (json['created_slots'] as List<dynamic>?)
              ?.map(
                (e) => DateSpecificSlotResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
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

Map<String, dynamic> _$CreateSlotsResponseToJson(
  _CreateSlotsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'created_slots': instance.createdSlots.map((e) => e.toJson()).toList(),
  'failed_slots': instance.failedSlots,
  'total_created': instance.totalCreated,
  'total_failed': instance.totalFailed,
};

_ListSlotsResponse _$ListSlotsResponseFromJson(Map<String, dynamic> json) =>
    _ListSlotsResponse(
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map(
                (e) => DateSpecificSlotResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      doctorId: json['doctor_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      slotType: json['slot_type'] as String?,
      date: json['date'] as String?,
      walkinAvailable: json['walkin_available'] as bool? ?? false,
      walkinReason: json['walkin_reason'] as String?,
    );

Map<String, dynamic> _$ListSlotsResponseToJson(_ListSlotsResponse instance) =>
    <String, dynamic>{
      'slots': instance.slots.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'doctor_id': ?instance.doctorId,
      'clinic_id': ?instance.clinicId,
      'slot_type': ?instance.slotType,
      'date': ?instance.date,
      'walkin_available': instance.walkinAvailable,
      'walkin_reason': ?instance.walkinReason,
    };
