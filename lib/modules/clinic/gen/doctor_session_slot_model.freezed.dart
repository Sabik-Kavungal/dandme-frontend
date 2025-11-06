// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_session_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IndividualSlot _$IndividualSlotFromJson(Map<String, dynamic> json) {
  return _IndividualSlot.fromJson(json);
}

/// @nodoc
mixin _$IndividualSlot {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String? get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_start')
  String? get slotStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_end')
  String? get slotEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_count')
  int get availableCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'booked_count')
  int get bookedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_booked')
  bool get isBooked => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookable')
  bool get isBookable => throw _privateConstructorUsedError;
  @JsonKey(name: 'booked_patient_id')
  String? get bookedPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'booked_appointment_id')
  String? get bookedAppointmentId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_message')
  String get displayMessage => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this IndividualSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IndividualSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IndividualSlotCopyWith<IndividualSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualSlotCopyWith<$Res> {
  factory $IndividualSlotCopyWith(
    IndividualSlot value,
    $Res Function(IndividualSlot) then,
  ) = _$IndividualSlotCopyWithImpl<$Res, IndividualSlot>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'session_id') String? sessionId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_start') String? slotStart,
    @JsonKey(name: 'slot_end') String? slotEnd,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'available_count') int availableCount,
    @JsonKey(name: 'booked_count') int bookedCount,
    @JsonKey(name: 'is_booked') bool isBooked,
    @JsonKey(name: 'is_bookable') bool isBookable,
    @JsonKey(name: 'booked_patient_id') String? bookedPatientId,
    @JsonKey(name: 'booked_appointment_id') String? bookedAppointmentId,
    String status,
    @JsonKey(name: 'display_message') String displayMessage,
    String? notes,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$IndividualSlotCopyWithImpl<$Res, $Val extends IndividualSlot>
    implements $IndividualSlotCopyWith<$Res> {
  _$IndividualSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IndividualSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? clinicId = freezed,
    Object? slotStart = freezed,
    Object? slotEnd = freezed,
    Object? maxPatients = null,
    Object? availableCount = null,
    Object? bookedCount = null,
    Object? isBooked = null,
    Object? isBookable = null,
    Object? bookedPatientId = freezed,
    Object? bookedAppointmentId = freezed,
    Object? status = null,
    Object? displayMessage = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionId: freezed == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotStart: freezed == slotStart
                ? _value.slotStart
                : slotStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotEnd: freezed == slotEnd
                ? _value.slotEnd
                : slotEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxPatients: null == maxPatients
                ? _value.maxPatients
                : maxPatients // ignore: cast_nullable_to_non_nullable
                      as int,
            availableCount: null == availableCount
                ? _value.availableCount
                : availableCount // ignore: cast_nullable_to_non_nullable
                      as int,
            bookedCount: null == bookedCount
                ? _value.bookedCount
                : bookedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isBooked: null == isBooked
                ? _value.isBooked
                : isBooked // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBookable: null == isBookable
                ? _value.isBookable
                : isBookable // ignore: cast_nullable_to_non_nullable
                      as bool,
            bookedPatientId: freezed == bookedPatientId
                ? _value.bookedPatientId
                : bookedPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookedAppointmentId: freezed == bookedAppointmentId
                ? _value.bookedAppointmentId
                : bookedAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            displayMessage: null == displayMessage
                ? _value.displayMessage
                : displayMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IndividualSlotImplCopyWith<$Res>
    implements $IndividualSlotCopyWith<$Res> {
  factory _$$IndividualSlotImplCopyWith(
    _$IndividualSlotImpl value,
    $Res Function(_$IndividualSlotImpl) then,
  ) = __$$IndividualSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'session_id') String? sessionId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_start') String? slotStart,
    @JsonKey(name: 'slot_end') String? slotEnd,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'available_count') int availableCount,
    @JsonKey(name: 'booked_count') int bookedCount,
    @JsonKey(name: 'is_booked') bool isBooked,
    @JsonKey(name: 'is_bookable') bool isBookable,
    @JsonKey(name: 'booked_patient_id') String? bookedPatientId,
    @JsonKey(name: 'booked_appointment_id') String? bookedAppointmentId,
    String status,
    @JsonKey(name: 'display_message') String displayMessage,
    String? notes,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$IndividualSlotImplCopyWithImpl<$Res>
    extends _$IndividualSlotCopyWithImpl<$Res, _$IndividualSlotImpl>
    implements _$$IndividualSlotImplCopyWith<$Res> {
  __$$IndividualSlotImplCopyWithImpl(
    _$IndividualSlotImpl _value,
    $Res Function(_$IndividualSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IndividualSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? clinicId = freezed,
    Object? slotStart = freezed,
    Object? slotEnd = freezed,
    Object? maxPatients = null,
    Object? availableCount = null,
    Object? bookedCount = null,
    Object? isBooked = null,
    Object? isBookable = null,
    Object? bookedPatientId = freezed,
    Object? bookedAppointmentId = freezed,
    Object? status = null,
    Object? displayMessage = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$IndividualSlotImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotStart: freezed == slotStart
            ? _value.slotStart
            : slotStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotEnd: freezed == slotEnd
            ? _value.slotEnd
            : slotEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxPatients: null == maxPatients
            ? _value.maxPatients
            : maxPatients // ignore: cast_nullable_to_non_nullable
                  as int,
        availableCount: null == availableCount
            ? _value.availableCount
            : availableCount // ignore: cast_nullable_to_non_nullable
                  as int,
        bookedCount: null == bookedCount
            ? _value.bookedCount
            : bookedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isBooked: null == isBooked
            ? _value.isBooked
            : isBooked // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBookable: null == isBookable
            ? _value.isBookable
            : isBookable // ignore: cast_nullable_to_non_nullable
                  as bool,
        bookedPatientId: freezed == bookedPatientId
            ? _value.bookedPatientId
            : bookedPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookedAppointmentId: freezed == bookedAppointmentId
            ? _value.bookedAppointmentId
            : bookedAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        displayMessage: null == displayMessage
            ? _value.displayMessage
            : displayMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IndividualSlotImpl implements _IndividualSlot {
  const _$IndividualSlotImpl({
    required this.id,
    @JsonKey(name: 'session_id') this.sessionId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'slot_start') this.slotStart,
    @JsonKey(name: 'slot_end') this.slotEnd,
    @JsonKey(name: 'max_patients') this.maxPatients = 1,
    @JsonKey(name: 'available_count') this.availableCount = 1,
    @JsonKey(name: 'booked_count') this.bookedCount = 0,
    @JsonKey(name: 'is_booked') this.isBooked = false,
    @JsonKey(name: 'is_bookable') this.isBookable = true,
    @JsonKey(name: 'booked_patient_id') this.bookedPatientId,
    @JsonKey(name: 'booked_appointment_id') this.bookedAppointmentId,
    this.status = 'available',
    @JsonKey(name: 'display_message') this.displayMessage = 'Available',
    this.notes,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$IndividualSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndividualSlotImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'session_id')
  final String? sessionId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'slot_start')
  final String? slotStart;
  @override
  @JsonKey(name: 'slot_end')
  final String? slotEnd;
  @override
  @JsonKey(name: 'max_patients')
  final int maxPatients;
  @override
  @JsonKey(name: 'available_count')
  final int availableCount;
  @override
  @JsonKey(name: 'booked_count')
  final int bookedCount;
  @override
  @JsonKey(name: 'is_booked')
  final bool isBooked;
  @override
  @JsonKey(name: 'is_bookable')
  final bool isBookable;
  @override
  @JsonKey(name: 'booked_patient_id')
  final String? bookedPatientId;
  @override
  @JsonKey(name: 'booked_appointment_id')
  final String? bookedAppointmentId;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'display_message')
  final String displayMessage;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'IndividualSlot(id: $id, sessionId: $sessionId, clinicId: $clinicId, slotStart: $slotStart, slotEnd: $slotEnd, maxPatients: $maxPatients, availableCount: $availableCount, bookedCount: $bookedCount, isBooked: $isBooked, isBookable: $isBookable, bookedPatientId: $bookedPatientId, bookedAppointmentId: $bookedAppointmentId, status: $status, displayMessage: $displayMessage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotStart, slotStart) ||
                other.slotStart == slotStart) &&
            (identical(other.slotEnd, slotEnd) || other.slotEnd == slotEnd) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.availableCount, availableCount) ||
                other.availableCount == availableCount) &&
            (identical(other.bookedCount, bookedCount) ||
                other.bookedCount == bookedCount) &&
            (identical(other.isBooked, isBooked) ||
                other.isBooked == isBooked) &&
            (identical(other.isBookable, isBookable) ||
                other.isBookable == isBookable) &&
            (identical(other.bookedPatientId, bookedPatientId) ||
                other.bookedPatientId == bookedPatientId) &&
            (identical(other.bookedAppointmentId, bookedAppointmentId) ||
                other.bookedAppointmentId == bookedAppointmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.displayMessage, displayMessage) ||
                other.displayMessage == displayMessage) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    clinicId,
    slotStart,
    slotEnd,
    maxPatients,
    availableCount,
    bookedCount,
    isBooked,
    isBookable,
    bookedPatientId,
    bookedAppointmentId,
    status,
    displayMessage,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of IndividualSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IndividualSlotImplCopyWith<_$IndividualSlotImpl> get copyWith =>
      __$$IndividualSlotImplCopyWithImpl<_$IndividualSlotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IndividualSlotImplToJson(this);
  }
}

abstract class _IndividualSlot implements IndividualSlot {
  const factory _IndividualSlot({
    required final String id,
    @JsonKey(name: 'session_id') final String? sessionId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'slot_start') final String? slotStart,
    @JsonKey(name: 'slot_end') final String? slotEnd,
    @JsonKey(name: 'max_patients') final int maxPatients,
    @JsonKey(name: 'available_count') final int availableCount,
    @JsonKey(name: 'booked_count') final int bookedCount,
    @JsonKey(name: 'is_booked') final bool isBooked,
    @JsonKey(name: 'is_bookable') final bool isBookable,
    @JsonKey(name: 'booked_patient_id') final String? bookedPatientId,
    @JsonKey(name: 'booked_appointment_id') final String? bookedAppointmentId,
    final String status,
    @JsonKey(name: 'display_message') final String displayMessage,
    final String? notes,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$IndividualSlotImpl;

  factory _IndividualSlot.fromJson(Map<String, dynamic> json) =
      _$IndividualSlotImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'session_id')
  String? get sessionId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'slot_start')
  String? get slotStart;
  @override
  @JsonKey(name: 'slot_end')
  String? get slotEnd;
  @override
  @JsonKey(name: 'max_patients')
  int get maxPatients;
  @override
  @JsonKey(name: 'available_count')
  int get availableCount;
  @override
  @JsonKey(name: 'booked_count')
  int get bookedCount;
  @override
  @JsonKey(name: 'is_booked')
  bool get isBooked;
  @override
  @JsonKey(name: 'is_bookable')
  bool get isBookable;
  @override
  @JsonKey(name: 'booked_patient_id')
  String? get bookedPatientId;
  @override
  @JsonKey(name: 'booked_appointment_id')
  String? get bookedAppointmentId;
  @override
  String get status;
  @override
  @JsonKey(name: 'display_message')
  String get displayMessage;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of IndividualSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndividualSlotImplCopyWith<_$IndividualSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionDefinition _$SessionDefinitionFromJson(Map<String, dynamic> json) {
  return _SessionDefinition.fromJson(json);
}

/// @nodoc
mixin _$SessionDefinition {
  @JsonKey(name: 'session_name')
  String get sessionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_interval_minutes')
  int get slotIntervalMinutes => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this SessionDefinition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionDefinitionCopyWith<SessionDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDefinitionCopyWith<$Res> {
  factory $SessionDefinitionCopyWith(
    SessionDefinition value,
    $Res Function(SessionDefinition) then,
  ) = _$SessionDefinitionCopyWithImpl<$Res, SessionDefinition>;
  @useResult
  $Res call({
    @JsonKey(name: 'session_name') String sessionName,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes,
    String? notes,
  });
}

/// @nodoc
class _$SessionDefinitionCopyWithImpl<$Res, $Val extends SessionDefinition>
    implements $SessionDefinitionCopyWith<$Res> {
  _$SessionDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? slotIntervalMinutes = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            sessionName: null == sessionName
                ? _value.sessionName
                : sessionName // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            maxPatients: null == maxPatients
                ? _value.maxPatients
                : maxPatients // ignore: cast_nullable_to_non_nullable
                      as int,
            slotIntervalMinutes: null == slotIntervalMinutes
                ? _value.slotIntervalMinutes
                : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionDefinitionImplCopyWith<$Res>
    implements $SessionDefinitionCopyWith<$Res> {
  factory _$$SessionDefinitionImplCopyWith(
    _$SessionDefinitionImpl value,
    $Res Function(_$SessionDefinitionImpl) then,
  ) = __$$SessionDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'session_name') String sessionName,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes,
    String? notes,
  });
}

/// @nodoc
class __$$SessionDefinitionImplCopyWithImpl<$Res>
    extends _$SessionDefinitionCopyWithImpl<$Res, _$SessionDefinitionImpl>
    implements _$$SessionDefinitionImplCopyWith<$Res> {
  __$$SessionDefinitionImplCopyWithImpl(
    _$SessionDefinitionImpl _value,
    $Res Function(_$SessionDefinitionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? slotIntervalMinutes = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$SessionDefinitionImpl(
        sessionName: null == sessionName
            ? _value.sessionName
            : sessionName // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        maxPatients: null == maxPatients
            ? _value.maxPatients
            : maxPatients // ignore: cast_nullable_to_non_nullable
                  as int,
        slotIntervalMinutes: null == slotIntervalMinutes
            ? _value.slotIntervalMinutes
            : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDefinitionImpl implements _SessionDefinition {
  const _$SessionDefinitionImpl({
    @JsonKey(name: 'session_name') required this.sessionName,
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    @JsonKey(name: 'max_patients') required this.maxPatients,
    @JsonKey(name: 'slot_interval_minutes') this.slotIntervalMinutes = 5,
    this.notes,
  });

  factory _$SessionDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionDefinitionImplFromJson(json);

  @override
  @JsonKey(name: 'session_name')
  final String sessionName;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  @JsonKey(name: 'max_patients')
  final int maxPatients;
  @override
  @JsonKey(name: 'slot_interval_minutes')
  final int slotIntervalMinutes;
  @override
  final String? notes;

  @override
  String toString() {
    return 'SessionDefinition(sessionName: $sessionName, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, slotIntervalMinutes: $slotIntervalMinutes, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDefinitionImpl &&
            (identical(other.sessionName, sessionName) ||
                other.sessionName == sessionName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.slotIntervalMinutes, slotIntervalMinutes) ||
                other.slotIntervalMinutes == slotIntervalMinutes) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionName,
    startTime,
    endTime,
    maxPatients,
    slotIntervalMinutes,
    notes,
  );

  /// Create a copy of SessionDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDefinitionImplCopyWith<_$SessionDefinitionImpl> get copyWith =>
      __$$SessionDefinitionImplCopyWithImpl<_$SessionDefinitionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDefinitionImplToJson(this);
  }
}

abstract class _SessionDefinition implements SessionDefinition {
  const factory _SessionDefinition({
    @JsonKey(name: 'session_name') required final String sessionName,
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    @JsonKey(name: 'max_patients') required final int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') final int slotIntervalMinutes,
    final String? notes,
  }) = _$SessionDefinitionImpl;

  factory _SessionDefinition.fromJson(Map<String, dynamic> json) =
      _$SessionDefinitionImpl.fromJson;

  @override
  @JsonKey(name: 'session_name')
  String get sessionName;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(name: 'max_patients')
  int get maxPatients;
  @override
  @JsonKey(name: 'slot_interval_minutes')
  int get slotIntervalMinutes;
  @override
  String? get notes;

  /// Create a copy of SessionDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionDefinitionImplCopyWith<_$SessionDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorSlotSession _$DoctorSlotSessionFromJson(Map<String, dynamic> json) {
  return _DoctorSlotSession.fromJson(json);
}

/// @nodoc
mixin _$DoctorSlotSession {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_slot_id')
  String? get timeSlotId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_name')
  String? get sessionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_interval_minutes')
  int get slotIntervalMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_slots')
  int get generatedSlots => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_slots')
  int get availableSlots => throw _privateConstructorUsedError;
  @JsonKey(name: 'booked_slots')
  int get bookedSlots => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<IndividualSlot> get slots => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoctorSlotSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorSlotSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorSlotSessionCopyWith<DoctorSlotSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorSlotSessionCopyWith<$Res> {
  factory $DoctorSlotSessionCopyWith(
    DoctorSlotSession value,
    $Res Function(DoctorSlotSession) then,
  ) = _$DoctorSlotSessionCopyWithImpl<$Res, DoctorSlotSession>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'time_slot_id') String? timeSlotId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'session_name') String? sessionName,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes,
    @JsonKey(name: 'generated_slots') int generatedSlots,
    @JsonKey(name: 'available_slots') int availableSlots,
    @JsonKey(name: 'booked_slots') int bookedSlots,
    String? notes,
    List<IndividualSlot> slots,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$DoctorSlotSessionCopyWithImpl<$Res, $Val extends DoctorSlotSession>
    implements $DoctorSlotSessionCopyWith<$Res> {
  _$DoctorSlotSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorSlotSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeSlotId = freezed,
    Object? clinicId = freezed,
    Object? sessionName = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? maxPatients = null,
    Object? slotIntervalMinutes = null,
    Object? generatedSlots = null,
    Object? availableSlots = null,
    Object? bookedSlots = null,
    Object? notes = freezed,
    Object? slots = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            timeSlotId: freezed == timeSlotId
                ? _value.timeSlotId
                : timeSlotId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionName: freezed == sessionName
                ? _value.sessionName
                : sessionName // ignore: cast_nullable_to_non_nullable
                      as String?,
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxPatients: null == maxPatients
                ? _value.maxPatients
                : maxPatients // ignore: cast_nullable_to_non_nullable
                      as int,
            slotIntervalMinutes: null == slotIntervalMinutes
                ? _value.slotIntervalMinutes
                : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            generatedSlots: null == generatedSlots
                ? _value.generatedSlots
                : generatedSlots // ignore: cast_nullable_to_non_nullable
                      as int,
            availableSlots: null == availableSlots
                ? _value.availableSlots
                : availableSlots // ignore: cast_nullable_to_non_nullable
                      as int,
            bookedSlots: null == bookedSlots
                ? _value.bookedSlots
                : bookedSlots // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<IndividualSlot>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorSlotSessionImplCopyWith<$Res>
    implements $DoctorSlotSessionCopyWith<$Res> {
  factory _$$DoctorSlotSessionImplCopyWith(
    _$DoctorSlotSessionImpl value,
    $Res Function(_$DoctorSlotSessionImpl) then,
  ) = __$$DoctorSlotSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'time_slot_id') String? timeSlotId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'session_name') String? sessionName,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes,
    @JsonKey(name: 'generated_slots') int generatedSlots,
    @JsonKey(name: 'available_slots') int availableSlots,
    @JsonKey(name: 'booked_slots') int bookedSlots,
    String? notes,
    List<IndividualSlot> slots,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$DoctorSlotSessionImplCopyWithImpl<$Res>
    extends _$DoctorSlotSessionCopyWithImpl<$Res, _$DoctorSlotSessionImpl>
    implements _$$DoctorSlotSessionImplCopyWith<$Res> {
  __$$DoctorSlotSessionImplCopyWithImpl(
    _$DoctorSlotSessionImpl _value,
    $Res Function(_$DoctorSlotSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorSlotSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeSlotId = freezed,
    Object? clinicId = freezed,
    Object? sessionName = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? maxPatients = null,
    Object? slotIntervalMinutes = null,
    Object? generatedSlots = null,
    Object? availableSlots = null,
    Object? bookedSlots = null,
    Object? notes = freezed,
    Object? slots = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DoctorSlotSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        timeSlotId: freezed == timeSlotId
            ? _value.timeSlotId
            : timeSlotId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionName: freezed == sessionName
            ? _value.sessionName
            : sessionName // ignore: cast_nullable_to_non_nullable
                  as String?,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxPatients: null == maxPatients
            ? _value.maxPatients
            : maxPatients // ignore: cast_nullable_to_non_nullable
                  as int,
        slotIntervalMinutes: null == slotIntervalMinutes
            ? _value.slotIntervalMinutes
            : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        generatedSlots: null == generatedSlots
            ? _value.generatedSlots
            : generatedSlots // ignore: cast_nullable_to_non_nullable
                  as int,
        availableSlots: null == availableSlots
            ? _value.availableSlots
            : availableSlots // ignore: cast_nullable_to_non_nullable
                  as int,
        bookedSlots: null == bookedSlots
            ? _value.bookedSlots
            : bookedSlots // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<IndividualSlot>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorSlotSessionImpl implements _DoctorSlotSession {
  const _$DoctorSlotSessionImpl({
    required this.id,
    @JsonKey(name: 'time_slot_id') this.timeSlotId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'session_name') this.sessionName,
    @JsonKey(name: 'start_time') this.startTime,
    @JsonKey(name: 'end_time') this.endTime,
    @JsonKey(name: 'max_patients') this.maxPatients = 0,
    @JsonKey(name: 'slot_interval_minutes') this.slotIntervalMinutes = 5,
    @JsonKey(name: 'generated_slots') this.generatedSlots = 0,
    @JsonKey(name: 'available_slots') this.availableSlots = 0,
    @JsonKey(name: 'booked_slots') this.bookedSlots = 0,
    this.notes,
    final List<IndividualSlot> slots = const [],
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  }) : _slots = slots;

  factory _$DoctorSlotSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorSlotSessionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'time_slot_id')
  final String? timeSlotId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'session_name')
  final String? sessionName;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'max_patients')
  final int maxPatients;
  @override
  @JsonKey(name: 'slot_interval_minutes')
  final int slotIntervalMinutes;
  @override
  @JsonKey(name: 'generated_slots')
  final int generatedSlots;
  @override
  @JsonKey(name: 'available_slots')
  final int availableSlots;
  @override
  @JsonKey(name: 'booked_slots')
  final int bookedSlots;
  @override
  final String? notes;
  final List<IndividualSlot> _slots;
  @override
  @JsonKey()
  List<IndividualSlot> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DoctorSlotSession(id: $id, timeSlotId: $timeSlotId, clinicId: $clinicId, sessionName: $sessionName, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, slotIntervalMinutes: $slotIntervalMinutes, generatedSlots: $generatedSlots, availableSlots: $availableSlots, bookedSlots: $bookedSlots, notes: $notes, slots: $slots, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorSlotSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timeSlotId, timeSlotId) ||
                other.timeSlotId == timeSlotId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.sessionName, sessionName) ||
                other.sessionName == sessionName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.slotIntervalMinutes, slotIntervalMinutes) ||
                other.slotIntervalMinutes == slotIntervalMinutes) &&
            (identical(other.generatedSlots, generatedSlots) ||
                other.generatedSlots == generatedSlots) &&
            (identical(other.availableSlots, availableSlots) ||
                other.availableSlots == availableSlots) &&
            (identical(other.bookedSlots, bookedSlots) ||
                other.bookedSlots == bookedSlots) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    timeSlotId,
    clinicId,
    sessionName,
    startTime,
    endTime,
    maxPatients,
    slotIntervalMinutes,
    generatedSlots,
    availableSlots,
    bookedSlots,
    notes,
    const DeepCollectionEquality().hash(_slots),
    createdAt,
    updatedAt,
  );

  /// Create a copy of DoctorSlotSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorSlotSessionImplCopyWith<_$DoctorSlotSessionImpl> get copyWith =>
      __$$DoctorSlotSessionImplCopyWithImpl<_$DoctorSlotSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorSlotSessionImplToJson(this);
  }
}

abstract class _DoctorSlotSession implements DoctorSlotSession {
  const factory _DoctorSlotSession({
    required final String id,
    @JsonKey(name: 'time_slot_id') final String? timeSlotId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'session_name') final String? sessionName,
    @JsonKey(name: 'start_time') final String? startTime,
    @JsonKey(name: 'end_time') final String? endTime,
    @JsonKey(name: 'max_patients') final int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') final int slotIntervalMinutes,
    @JsonKey(name: 'generated_slots') final int generatedSlots,
    @JsonKey(name: 'available_slots') final int availableSlots,
    @JsonKey(name: 'booked_slots') final int bookedSlots,
    final String? notes,
    final List<IndividualSlot> slots,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$DoctorSlotSessionImpl;

  factory _DoctorSlotSession.fromJson(Map<String, dynamic> json) =
      _$DoctorSlotSessionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'time_slot_id')
  String? get timeSlotId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'session_name')
  String? get sessionName;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'max_patients')
  int get maxPatients;
  @override
  @JsonKey(name: 'slot_interval_minutes')
  int get slotIntervalMinutes;
  @override
  @JsonKey(name: 'generated_slots')
  int get generatedSlots;
  @override
  @JsonKey(name: 'available_slots')
  int get availableSlots;
  @override
  @JsonKey(name: 'booked_slots')
  int get bookedSlots;
  @override
  String? get notes;
  @override
  List<IndividualSlot> get slots;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of DoctorSlotSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorSlotSessionImplCopyWith<_$DoctorSlotSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorSessionSlot _$DoctorSessionSlotFromJson(Map<String, dynamic> json) {
  return _DoctorSessionSlot.fromJson(json);
}

/// @nodoc
mixin _$DoctorSessionSlot {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String? get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_duration')
  int get slotDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<DoctorSlotSession> get sessions => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoctorSessionSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorSessionSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorSessionSlotCopyWith<DoctorSessionSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorSessionSlotCopyWith<$Res> {
  factory $DoctorSessionSlotCopyWith(
    DoctorSessionSlot value,
    $Res Function(DoctorSessionSlot) then,
  ) = _$DoctorSessionSlotCopyWithImpl<$Res, DoctorSessionSlot>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'slot_type') String? slotType,
    @JsonKey(name: 'slot_duration') int slotDuration,
    @JsonKey(name: 'is_available') bool isAvailable,
    String? notes,
    List<DoctorSlotSession> sessions,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$DoctorSessionSlotCopyWithImpl<$Res, $Val extends DoctorSessionSlot>
    implements $DoctorSessionSlotCopyWith<$Res> {
  _$DoctorSessionSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorSessionSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? date = freezed,
    Object? dayOfWeek = freezed,
    Object? slotType = freezed,
    Object? slotDuration = null,
    Object? isAvailable = null,
    Object? notes = freezed,
    Object? sessions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            dayOfWeek: freezed == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int?,
            slotType: freezed == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotDuration: null == slotDuration
                ? _value.slotDuration
                : slotDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessions: null == sessions
                ? _value.sessions
                : sessions // ignore: cast_nullable_to_non_nullable
                      as List<DoctorSlotSession>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorSessionSlotImplCopyWith<$Res>
    implements $DoctorSessionSlotCopyWith<$Res> {
  factory _$$DoctorSessionSlotImplCopyWith(
    _$DoctorSessionSlotImpl value,
    $Res Function(_$DoctorSessionSlotImpl) then,
  ) = __$$DoctorSessionSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'slot_type') String? slotType,
    @JsonKey(name: 'slot_duration') int slotDuration,
    @JsonKey(name: 'is_available') bool isAvailable,
    String? notes,
    List<DoctorSlotSession> sessions,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$DoctorSessionSlotImplCopyWithImpl<$Res>
    extends _$DoctorSessionSlotCopyWithImpl<$Res, _$DoctorSessionSlotImpl>
    implements _$$DoctorSessionSlotImplCopyWith<$Res> {
  __$$DoctorSessionSlotImplCopyWithImpl(
    _$DoctorSessionSlotImpl _value,
    $Res Function(_$DoctorSessionSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorSessionSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? date = freezed,
    Object? dayOfWeek = freezed,
    Object? slotType = freezed,
    Object? slotDuration = null,
    Object? isAvailable = null,
    Object? notes = freezed,
    Object? sessions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DoctorSessionSlotImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        dayOfWeek: freezed == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int?,
        slotType: freezed == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotDuration: null == slotDuration
            ? _value.slotDuration
            : slotDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessions: null == sessions
            ? _value._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<DoctorSlotSession>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorSessionSlotImpl implements _DoctorSessionSlot {
  const _$DoctorSessionSlotImpl({
    required this.id,
    @JsonKey(name: 'doctor_id') this.doctorId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    this.date,
    @JsonKey(name: 'day_of_week') this.dayOfWeek,
    @JsonKey(name: 'slot_type') this.slotType,
    @JsonKey(name: 'slot_duration') this.slotDuration = 5,
    @JsonKey(name: 'is_available') this.isAvailable = true,
    this.notes,
    final List<DoctorSlotSession> sessions = const [],
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  }) : _sessions = sessions;

  factory _$DoctorSessionSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorSessionSlotImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'doctor_id')
  final String? doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  final String? date;
  @override
  @JsonKey(name: 'day_of_week')
  final int? dayOfWeek;
  @override
  @JsonKey(name: 'slot_type')
  final String? slotType;
  @override
  @JsonKey(name: 'slot_duration')
  final int slotDuration;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  final String? notes;
  final List<DoctorSlotSession> _sessions;
  @override
  @JsonKey()
  List<DoctorSlotSession> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DoctorSessionSlot(id: $id, doctorId: $doctorId, clinicId: $clinicId, date: $date, dayOfWeek: $dayOfWeek, slotType: $slotType, slotDuration: $slotDuration, isAvailable: $isAvailable, notes: $notes, sessions: $sessions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorSessionSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.slotDuration, slotDuration) ||
                other.slotDuration == slotDuration) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    doctorId,
    clinicId,
    date,
    dayOfWeek,
    slotType,
    slotDuration,
    isAvailable,
    notes,
    const DeepCollectionEquality().hash(_sessions),
    createdAt,
    updatedAt,
  );

  /// Create a copy of DoctorSessionSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorSessionSlotImplCopyWith<_$DoctorSessionSlotImpl> get copyWith =>
      __$$DoctorSessionSlotImplCopyWithImpl<_$DoctorSessionSlotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorSessionSlotImplToJson(this);
  }
}

abstract class _DoctorSessionSlot implements DoctorSessionSlot {
  const factory _DoctorSessionSlot({
    required final String id,
    @JsonKey(name: 'doctor_id') final String? doctorId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    final String? date,
    @JsonKey(name: 'day_of_week') final int? dayOfWeek,
    @JsonKey(name: 'slot_type') final String? slotType,
    @JsonKey(name: 'slot_duration') final int slotDuration,
    @JsonKey(name: 'is_available') final bool isAvailable,
    final String? notes,
    final List<DoctorSlotSession> sessions,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$DoctorSessionSlotImpl;

  factory _DoctorSessionSlot.fromJson(Map<String, dynamic> json) =
      _$DoctorSessionSlotImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'doctor_id')
  String? get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  String? get date;
  @override
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek;
  @override
  @JsonKey(name: 'slot_type')
  String? get slotType;
  @override
  @JsonKey(name: 'slot_duration')
  int get slotDuration;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  String? get notes;
  @override
  List<DoctorSlotSession> get sessions;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of DoctorSessionSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorSessionSlotImplCopyWith<_$DoctorSessionSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateSessionSlotsInput _$CreateSessionSlotsInputFromJson(
  Map<String, dynamic> json,
) {
  return _CreateSessionSlotsInput.fromJson(json);
}

/// @nodoc
mixin _$CreateSessionSlotsInput {
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_duration')
  int get slotDuration => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<SessionDefinition> get sessions => throw _privateConstructorUsedError;

  /// Serializes this CreateSessionSlotsInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSessionSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSessionSlotsInputCopyWith<CreateSessionSlotsInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSessionSlotsInputCopyWith<$Res> {
  factory $CreateSessionSlotsInputCopyWith(
    CreateSessionSlotsInput value,
    $Res Function(CreateSessionSlotsInput) then,
  ) = _$CreateSessionSlotsInputCopyWithImpl<$Res, CreateSessionSlotsInput>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'slot_duration') int slotDuration,
    String date,
    @JsonKey(name: 'is_available') bool isAvailable,
    String? notes,
    List<SessionDefinition> sessions,
  });
}

/// @nodoc
class _$CreateSessionSlotsInputCopyWithImpl<
  $Res,
  $Val extends CreateSessionSlotsInput
>
    implements $CreateSessionSlotsInputCopyWith<$Res> {
  _$CreateSessionSlotsInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSessionSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = null,
    Object? slotType = null,
    Object? slotDuration = null,
    Object? date = null,
    Object? isAvailable = null,
    Object? notes = freezed,
    Object? sessions = null,
  }) {
    return _then(
      _value.copyWith(
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            slotType: null == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String,
            slotDuration: null == slotDuration
                ? _value.slotDuration
                : slotDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessions: null == sessions
                ? _value.sessions
                : sessions // ignore: cast_nullable_to_non_nullable
                      as List<SessionDefinition>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateSessionSlotsInputImplCopyWith<$Res>
    implements $CreateSessionSlotsInputCopyWith<$Res> {
  factory _$$CreateSessionSlotsInputImplCopyWith(
    _$CreateSessionSlotsInputImpl value,
    $Res Function(_$CreateSessionSlotsInputImpl) then,
  ) = __$$CreateSessionSlotsInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'slot_duration') int slotDuration,
    String date,
    @JsonKey(name: 'is_available') bool isAvailable,
    String? notes,
    List<SessionDefinition> sessions,
  });
}

/// @nodoc
class __$$CreateSessionSlotsInputImplCopyWithImpl<$Res>
    extends
        _$CreateSessionSlotsInputCopyWithImpl<
          $Res,
          _$CreateSessionSlotsInputImpl
        >
    implements _$$CreateSessionSlotsInputImplCopyWith<$Res> {
  __$$CreateSessionSlotsInputImplCopyWithImpl(
    _$CreateSessionSlotsInputImpl _value,
    $Res Function(_$CreateSessionSlotsInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSessionSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = null,
    Object? slotType = null,
    Object? slotDuration = null,
    Object? date = null,
    Object? isAvailable = null,
    Object? notes = freezed,
    Object? sessions = null,
  }) {
    return _then(
      _$CreateSessionSlotsInputImpl(
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        slotType: null == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String,
        slotDuration: null == slotDuration
            ? _value.slotDuration
            : slotDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessions: null == sessions
            ? _value._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<SessionDefinition>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSessionSlotsInputImpl implements _CreateSessionSlotsInput {
  const _$CreateSessionSlotsInputImpl({
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'slot_type') required this.slotType,
    @JsonKey(name: 'slot_duration') this.slotDuration = 5,
    required this.date,
    @JsonKey(name: 'is_available') this.isAvailable = true,
    this.notes,
    required final List<SessionDefinition> sessions,
  }) : _sessions = sessions;

  factory _$CreateSessionSlotsInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSessionSlotsInputImplFromJson(json);

  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'slot_type')
  final String slotType;
  @override
  @JsonKey(name: 'slot_duration')
  final int slotDuration;
  @override
  final String date;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  final String? notes;
  final List<SessionDefinition> _sessions;
  @override
  List<SessionDefinition> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString() {
    return 'CreateSessionSlotsInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, slotDuration: $slotDuration, date: $date, isAvailable: $isAvailable, notes: $notes, sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionSlotsInputImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.slotDuration, slotDuration) ||
                other.slotDuration == slotDuration) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    clinicId,
    slotType,
    slotDuration,
    date,
    isAvailable,
    notes,
    const DeepCollectionEquality().hash(_sessions),
  );

  /// Create a copy of CreateSessionSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSessionSlotsInputImplCopyWith<_$CreateSessionSlotsInputImpl>
  get copyWith =>
      __$$CreateSessionSlotsInputImplCopyWithImpl<
        _$CreateSessionSlotsInputImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSessionSlotsInputImplToJson(this);
  }
}

abstract class _CreateSessionSlotsInput implements CreateSessionSlotsInput {
  const factory _CreateSessionSlotsInput({
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'slot_type') required final String slotType,
    @JsonKey(name: 'slot_duration') final int slotDuration,
    required final String date,
    @JsonKey(name: 'is_available') final bool isAvailable,
    final String? notes,
    required final List<SessionDefinition> sessions,
  }) = _$CreateSessionSlotsInputImpl;

  factory _CreateSessionSlotsInput.fromJson(Map<String, dynamic> json) =
      _$CreateSessionSlotsInputImpl.fromJson;

  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'slot_type')
  String get slotType;
  @override
  @JsonKey(name: 'slot_duration')
  int get slotDuration;
  @override
  String get date;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  String? get notes;
  @override
  List<SessionDefinition> get sessions;

  /// Create a copy of CreateSessionSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSessionSlotsInputImplCopyWith<_$CreateSessionSlotsInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateSessionSlotsResponse _$CreateSessionSlotsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateSessionSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateSessionSlotsResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DoctorSessionSlot get data => throw _privateConstructorUsedError;

  /// Serializes this CreateSessionSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSessionSlotsResponseCopyWith<CreateSessionSlotsResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSessionSlotsResponseCopyWith<$Res> {
  factory $CreateSessionSlotsResponseCopyWith(
    CreateSessionSlotsResponse value,
    $Res Function(CreateSessionSlotsResponse) then,
  ) =
      _$CreateSessionSlotsResponseCopyWithImpl<
        $Res,
        CreateSessionSlotsResponse
      >;
  @useResult
  $Res call({bool success, String message, DoctorSessionSlot data});

  $DoctorSessionSlotCopyWith<$Res> get data;
}

/// @nodoc
class _$CreateSessionSlotsResponseCopyWithImpl<
  $Res,
  $Val extends CreateSessionSlotsResponse
>
    implements $CreateSessionSlotsResponseCopyWith<$Res> {
  _$CreateSessionSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as DoctorSessionSlot,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorSessionSlotCopyWith<$Res> get data {
    return $DoctorSessionSlotCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateSessionSlotsResponseImplCopyWith<$Res>
    implements $CreateSessionSlotsResponseCopyWith<$Res> {
  factory _$$CreateSessionSlotsResponseImplCopyWith(
    _$CreateSessionSlotsResponseImpl value,
    $Res Function(_$CreateSessionSlotsResponseImpl) then,
  ) = __$$CreateSessionSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DoctorSessionSlot data});

  @override
  $DoctorSessionSlotCopyWith<$Res> get data;
}

/// @nodoc
class __$$CreateSessionSlotsResponseImplCopyWithImpl<$Res>
    extends
        _$CreateSessionSlotsResponseCopyWithImpl<
          $Res,
          _$CreateSessionSlotsResponseImpl
        >
    implements _$$CreateSessionSlotsResponseImplCopyWith<$Res> {
  __$$CreateSessionSlotsResponseImplCopyWithImpl(
    _$CreateSessionSlotsResponseImpl _value,
    $Res Function(_$CreateSessionSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _$CreateSessionSlotsResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as DoctorSessionSlot,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSessionSlotsResponseImpl implements _CreateSessionSlotsResponse {
  const _$CreateSessionSlotsResponseImpl({
    required this.success,
    required this.message,
    required this.data,
  });

  factory _$CreateSessionSlotsResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateSessionSlotsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DoctorSessionSlot data;

  @override
  String toString() {
    return 'CreateSessionSlotsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionSlotsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of CreateSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSessionSlotsResponseImplCopyWith<_$CreateSessionSlotsResponseImpl>
  get copyWith =>
      __$$CreateSessionSlotsResponseImplCopyWithImpl<
        _$CreateSessionSlotsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSessionSlotsResponseImplToJson(this);
  }
}

abstract class _CreateSessionSlotsResponse
    implements CreateSessionSlotsResponse {
  const factory _CreateSessionSlotsResponse({
    required final bool success,
    required final String message,
    required final DoctorSessionSlot data,
  }) = _$CreateSessionSlotsResponseImpl;

  factory _CreateSessionSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$CreateSessionSlotsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DoctorSessionSlot get data;

  /// Create a copy of CreateSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSessionSlotsResponseImplCopyWith<_$CreateSessionSlotsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ListSessionSlotsResponse _$ListSessionSlotsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ListSessionSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListSessionSlotsResponse {
  @JsonKey(name: 'doctor_id')
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String? get slotType => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<DoctorSessionSlot> get slots => throw _privateConstructorUsedError;

  /// Serializes this ListSessionSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListSessionSlotsResponseCopyWith<ListSessionSlotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSessionSlotsResponseCopyWith<$Res> {
  factory $ListSessionSlotsResponseCopyWith(
    ListSessionSlotsResponse value,
    $Res Function(ListSessionSlotsResponse) then,
  ) = _$ListSessionSlotsResponseCopyWithImpl<$Res, ListSessionSlotsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'slot_type') String? slotType,
    int total,
    List<DoctorSessionSlot> slots,
  });
}

/// @nodoc
class _$ListSessionSlotsResponseCopyWithImpl<
  $Res,
  $Val extends ListSessionSlotsResponse
>
    implements $ListSessionSlotsResponseCopyWith<$Res> {
  _$ListSessionSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? date = freezed,
    Object? slotType = freezed,
    Object? total = null,
    Object? slots = null,
  }) {
    return _then(
      _value.copyWith(
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotType: freezed == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String?,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<DoctorSessionSlot>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListSessionSlotsResponseImplCopyWith<$Res>
    implements $ListSessionSlotsResponseCopyWith<$Res> {
  factory _$$ListSessionSlotsResponseImplCopyWith(
    _$ListSessionSlotsResponseImpl value,
    $Res Function(_$ListSessionSlotsResponseImpl) then,
  ) = __$$ListSessionSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'slot_type') String? slotType,
    int total,
    List<DoctorSessionSlot> slots,
  });
}

/// @nodoc
class __$$ListSessionSlotsResponseImplCopyWithImpl<$Res>
    extends
        _$ListSessionSlotsResponseCopyWithImpl<
          $Res,
          _$ListSessionSlotsResponseImpl
        >
    implements _$$ListSessionSlotsResponseImplCopyWith<$Res> {
  __$$ListSessionSlotsResponseImplCopyWithImpl(
    _$ListSessionSlotsResponseImpl _value,
    $Res Function(_$ListSessionSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? date = freezed,
    Object? slotType = freezed,
    Object? total = null,
    Object? slots = null,
  }) {
    return _then(
      _$ListSessionSlotsResponseImpl(
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotType: freezed == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String?,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<DoctorSessionSlot>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ListSessionSlotsResponseImpl implements _ListSessionSlotsResponse {
  const _$ListSessionSlotsResponseImpl({
    @JsonKey(name: 'doctor_id') this.doctorId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    this.date,
    @JsonKey(name: 'slot_type') this.slotType,
    this.total = 0,
    final List<DoctorSessionSlot> slots = const [],
  }) : _slots = slots;

  factory _$ListSessionSlotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListSessionSlotsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'doctor_id')
  final String? doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  final String? date;
  @override
  @JsonKey(name: 'slot_type')
  final String? slotType;
  @override
  @JsonKey()
  final int total;
  final List<DoctorSessionSlot> _slots;
  @override
  @JsonKey()
  List<DoctorSessionSlot> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  String toString() {
    return 'ListSessionSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, date: $date, slotType: $slotType, total: $total, slots: $slots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSessionSlotsResponseImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._slots, _slots));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    clinicId,
    date,
    slotType,
    total,
    const DeepCollectionEquality().hash(_slots),
  );

  /// Create a copy of ListSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSessionSlotsResponseImplCopyWith<_$ListSessionSlotsResponseImpl>
  get copyWith =>
      __$$ListSessionSlotsResponseImplCopyWithImpl<
        _$ListSessionSlotsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListSessionSlotsResponseImplToJson(this);
  }
}

abstract class _ListSessionSlotsResponse implements ListSessionSlotsResponse {
  const factory _ListSessionSlotsResponse({
    @JsonKey(name: 'doctor_id') final String? doctorId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    final String? date,
    @JsonKey(name: 'slot_type') final String? slotType,
    final int total,
    final List<DoctorSessionSlot> slots,
  }) = _$ListSessionSlotsResponseImpl;

  factory _ListSessionSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$ListSessionSlotsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'doctor_id')
  String? get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  String? get date;
  @override
  @JsonKey(name: 'slot_type')
  String? get slotType;
  @override
  int get total;
  @override
  List<DoctorSessionSlot> get slots;

  /// Create a copy of ListSessionSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListSessionSlotsResponseImplCopyWith<_$ListSessionSlotsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
