// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_time_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DoctorTimeSlotResponse _$DoctorTimeSlotResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DoctorTimeSlotResponse.fromJson(json);
}

/// @nodoc
mixin _$DoctorTimeSlotResponse {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String? get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_name')
  String? get clinicName => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError; // YYYY-MM-DD format - NEW
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek => throw _privateConstructorUsedError; // Optional for backward compatibility
  @JsonKey(name: 'day_name')
  String? get dayName => throw _privateConstructorUsedError; // Optional for backward compatibility
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'booked_patients')
  int get bookedPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_spots')
  int get availableSpots => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookable')
  bool get isBookable => throw _privateConstructorUsedError; // NEW: for past slots
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_message')
  String get displayMessage => throw _privateConstructorUsedError; // NEW: for past slots message
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoctorTimeSlotResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorTimeSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorTimeSlotResponseCopyWith<DoctorTimeSlotResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorTimeSlotResponseCopyWith<$Res> {
  factory $DoctorTimeSlotResponseCopyWith(
    DoctorTimeSlotResponse value,
    $Res Function(DoctorTimeSlotResponse) then,
  ) = _$DoctorTimeSlotResponseCopyWithImpl<$Res, DoctorTimeSlotResponse>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'day_name') String? dayName,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'booked_patients') int bookedPatients,
    @JsonKey(name: 'available_spots') int availableSpots,
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'is_bookable') bool isBookable,
    String status,
    @JsonKey(name: 'display_message') String displayMessage,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class _$DoctorTimeSlotResponseCopyWithImpl<
  $Res,
  $Val extends DoctorTimeSlotResponse
>
    implements $DoctorTimeSlotResponseCopyWith<$Res> {
  _$DoctorTimeSlotResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorTimeSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorName = freezed,
    Object? clinicId = null,
    Object? clinicName = freezed,
    Object? date = null,
    Object? dayOfWeek = freezed,
    Object? dayName = freezed,
    Object? slotType = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isActive = null,
    Object? maxPatients = null,
    Object? bookedPatients = null,
    Object? availableSpots = null,
    Object? isAvailable = null,
    Object? isBookable = null,
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
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicName: freezed == clinicName
                ? _value.clinicName
                : clinicName // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            dayOfWeek: freezed == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int?,
            dayName: freezed == dayName
                ? _value.dayName
                : dayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotType: null == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxPatients: null == maxPatients
                ? _value.maxPatients
                : maxPatients // ignore: cast_nullable_to_non_nullable
                      as int,
            bookedPatients: null == bookedPatients
                ? _value.bookedPatients
                : bookedPatients // ignore: cast_nullable_to_non_nullable
                      as int,
            availableSpots: null == availableSpots
                ? _value.availableSpots
                : availableSpots // ignore: cast_nullable_to_non_nullable
                      as int,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBookable: null == isBookable
                ? _value.isBookable
                : isBookable // ignore: cast_nullable_to_non_nullable
                      as bool,
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
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorTimeSlotResponseImplCopyWith<$Res>
    implements $DoctorTimeSlotResponseCopyWith<$Res> {
  factory _$$DoctorTimeSlotResponseImplCopyWith(
    _$DoctorTimeSlotResponseImpl value,
    $Res Function(_$DoctorTimeSlotResponseImpl) then,
  ) = __$$DoctorTimeSlotResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'day_name') String? dayName,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'booked_patients') int bookedPatients,
    @JsonKey(name: 'available_spots') int availableSpots,
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'is_bookable') bool isBookable,
    String status,
    @JsonKey(name: 'display_message') String displayMessage,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$DoctorTimeSlotResponseImplCopyWithImpl<$Res>
    extends
        _$DoctorTimeSlotResponseCopyWithImpl<$Res, _$DoctorTimeSlotResponseImpl>
    implements _$$DoctorTimeSlotResponseImplCopyWith<$Res> {
  __$$DoctorTimeSlotResponseImplCopyWithImpl(
    _$DoctorTimeSlotResponseImpl _value,
    $Res Function(_$DoctorTimeSlotResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorTimeSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorName = freezed,
    Object? clinicId = null,
    Object? clinicName = freezed,
    Object? date = null,
    Object? dayOfWeek = freezed,
    Object? dayName = freezed,
    Object? slotType = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isActive = null,
    Object? maxPatients = null,
    Object? bookedPatients = null,
    Object? availableSpots = null,
    Object? isAvailable = null,
    Object? isBookable = null,
    Object? status = null,
    Object? displayMessage = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DoctorTimeSlotResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicName: freezed == clinicName
            ? _value.clinicName
            : clinicName // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        dayOfWeek: freezed == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int?,
        dayName: freezed == dayName
            ? _value.dayName
            : dayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotType: null == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxPatients: null == maxPatients
            ? _value.maxPatients
            : maxPatients // ignore: cast_nullable_to_non_nullable
                  as int,
        bookedPatients: null == bookedPatients
            ? _value.bookedPatients
            : bookedPatients // ignore: cast_nullable_to_non_nullable
                  as int,
        availableSpots: null == availableSpots
            ? _value.availableSpots
            : availableSpots // ignore: cast_nullable_to_non_nullable
                  as int,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBookable: null == isBookable
            ? _value.isBookable
            : isBookable // ignore: cast_nullable_to_non_nullable
                  as bool,
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
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorTimeSlotResponseImpl implements _DoctorTimeSlotResponse {
  const _$DoctorTimeSlotResponseImpl({
    required this.id,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_name') this.doctorName,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'clinic_name') this.clinicName,
    @JsonKey(name: 'date') required this.date,
    @JsonKey(name: 'day_of_week') this.dayOfWeek,
    @JsonKey(name: 'day_name') this.dayName,
    @JsonKey(name: 'slot_type') required this.slotType,
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'max_patients') required this.maxPatients,
    @JsonKey(name: 'booked_patients') this.bookedPatients = 0,
    @JsonKey(name: 'available_spots') this.availableSpots = 0,
    @JsonKey(name: 'is_available') this.isAvailable = true,
    @JsonKey(name: 'is_bookable') this.isBookable = true,
    this.status = 'available',
    @JsonKey(name: 'display_message') this.displayMessage = 'Available',
    this.notes,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$DoctorTimeSlotResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorTimeSlotResponseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String? doctorName;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'clinic_name')
  final String? clinicName;
  @override
  @JsonKey(name: 'date')
  final String date;
  // YYYY-MM-DD format - NEW
  @override
  @JsonKey(name: 'day_of_week')
  final int? dayOfWeek;
  // Optional for backward compatibility
  @override
  @JsonKey(name: 'day_name')
  final String? dayName;
  // Optional for backward compatibility
  @override
  @JsonKey(name: 'slot_type')
  final String slotType;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'max_patients')
  final int maxPatients;
  @override
  @JsonKey(name: 'booked_patients')
  final int bookedPatients;
  @override
  @JsonKey(name: 'available_spots')
  final int availableSpots;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'is_bookable')
  final bool isBookable;
  // NEW: for past slots
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'display_message')
  final String displayMessage;
  // NEW: for past slots message
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DoctorTimeSlotResponse(id: $id, doctorId: $doctorId, doctorName: $doctorName, clinicId: $clinicId, clinicName: $clinicName, date: $date, dayOfWeek: $dayOfWeek, dayName: $dayName, slotType: $slotType, startTime: $startTime, endTime: $endTime, isActive: $isActive, maxPatients: $maxPatients, bookedPatients: $bookedPatients, availableSpots: $availableSpots, isAvailable: $isAvailable, isBookable: $isBookable, status: $status, displayMessage: $displayMessage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorTimeSlotResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.bookedPatients, bookedPatients) ||
                other.bookedPatients == bookedPatients) &&
            (identical(other.availableSpots, availableSpots) ||
                other.availableSpots == availableSpots) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isBookable, isBookable) ||
                other.isBookable == isBookable) &&
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
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    doctorId,
    doctorName,
    clinicId,
    clinicName,
    date,
    dayOfWeek,
    dayName,
    slotType,
    startTime,
    endTime,
    isActive,
    maxPatients,
    bookedPatients,
    availableSpots,
    isAvailable,
    isBookable,
    status,
    displayMessage,
    notes,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of DoctorTimeSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorTimeSlotResponseImplCopyWith<_$DoctorTimeSlotResponseImpl>
  get copyWith =>
      __$$DoctorTimeSlotResponseImplCopyWithImpl<_$DoctorTimeSlotResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorTimeSlotResponseImplToJson(this);
  }
}

abstract class _DoctorTimeSlotResponse implements DoctorTimeSlotResponse {
  const factory _DoctorTimeSlotResponse({
    required final String id,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_name') final String? doctorName,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'clinic_name') final String? clinicName,
    @JsonKey(name: 'date') required final String date,
    @JsonKey(name: 'day_of_week') final int? dayOfWeek,
    @JsonKey(name: 'day_name') final String? dayName,
    @JsonKey(name: 'slot_type') required final String slotType,
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'max_patients') required final int maxPatients,
    @JsonKey(name: 'booked_patients') final int bookedPatients,
    @JsonKey(name: 'available_spots') final int availableSpots,
    @JsonKey(name: 'is_available') final bool isAvailable,
    @JsonKey(name: 'is_bookable') final bool isBookable,
    final String status,
    @JsonKey(name: 'display_message') final String displayMessage,
    final String? notes,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
  }) = _$DoctorTimeSlotResponseImpl;

  factory _DoctorTimeSlotResponse.fromJson(Map<String, dynamic> json) =
      _$DoctorTimeSlotResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String? get doctorName;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'clinic_name')
  String? get clinicName;
  @override
  @JsonKey(name: 'date')
  String get date; // YYYY-MM-DD format - NEW
  @override
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek; // Optional for backward compatibility
  @override
  @JsonKey(name: 'day_name')
  String? get dayName; // Optional for backward compatibility
  @override
  @JsonKey(name: 'slot_type')
  String get slotType;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'max_patients')
  int get maxPatients;
  @override
  @JsonKey(name: 'booked_patients')
  int get bookedPatients;
  @override
  @JsonKey(name: 'available_spots')
  int get availableSpots;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'is_bookable')
  bool get isBookable; // NEW: for past slots
  @override
  String get status;
  @override
  @JsonKey(name: 'display_message')
  String get displayMessage; // NEW: for past slots message
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of DoctorTimeSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorTimeSlotResponseImplCopyWith<_$DoctorTimeSlotResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TimeSlotDefinition _$TimeSlotDefinitionFromJson(Map<String, dynamic> json) {
  return _TimeSlotDefinition.fromJson(json);
}

/// @nodoc
mixin _$TimeSlotDefinition {
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this TimeSlotDefinition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlotDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotDefinitionCopyWith<TimeSlotDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotDefinitionCopyWith<$Res> {
  factory $TimeSlotDefinitionCopyWith(
    TimeSlotDefinition value,
    $Res Function(TimeSlotDefinition) then,
  ) = _$TimeSlotDefinitionCopyWithImpl<$Res, TimeSlotDefinition>;
  @useResult
  $Res call({
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    String? notes,
  });
}

/// @nodoc
class _$TimeSlotDefinitionCopyWithImpl<$Res, $Val extends TimeSlotDefinition>
    implements $TimeSlotDefinitionCopyWith<$Res> {
  _$TimeSlotDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlotDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
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
abstract class _$$TimeSlotDefinitionImplCopyWith<$Res>
    implements $TimeSlotDefinitionCopyWith<$Res> {
  factory _$$TimeSlotDefinitionImplCopyWith(
    _$TimeSlotDefinitionImpl value,
    $Res Function(_$TimeSlotDefinitionImpl) then,
  ) = __$$TimeSlotDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    String? notes,
  });
}

/// @nodoc
class __$$TimeSlotDefinitionImplCopyWithImpl<$Res>
    extends _$TimeSlotDefinitionCopyWithImpl<$Res, _$TimeSlotDefinitionImpl>
    implements _$$TimeSlotDefinitionImplCopyWith<$Res> {
  __$$TimeSlotDefinitionImplCopyWithImpl(
    _$TimeSlotDefinitionImpl _value,
    $Res Function(_$TimeSlotDefinitionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeSlotDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$TimeSlotDefinitionImpl(
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
class _$TimeSlotDefinitionImpl implements _TimeSlotDefinition {
  const _$TimeSlotDefinitionImpl({
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    @JsonKey(name: 'max_patients') this.maxPatients = 1,
    this.notes,
  });

  factory _$TimeSlotDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotDefinitionImplFromJson(json);

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
  final String? notes;

  @override
  String toString() {
    return 'TimeSlotDefinition(startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotDefinitionImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, maxPatients, notes);

  /// Create a copy of TimeSlotDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotDefinitionImplCopyWith<_$TimeSlotDefinitionImpl> get copyWith =>
      __$$TimeSlotDefinitionImplCopyWithImpl<_$TimeSlotDefinitionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotDefinitionImplToJson(this);
  }
}

abstract class _TimeSlotDefinition implements TimeSlotDefinition {
  const factory _TimeSlotDefinition({
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    @JsonKey(name: 'max_patients') final int maxPatients,
    final String? notes,
  }) = _$TimeSlotDefinitionImpl;

  factory _TimeSlotDefinition.fromJson(Map<String, dynamic> json) =
      _$TimeSlotDefinitionImpl.fromJson;

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
  String? get notes;

  /// Create a copy of TimeSlotDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotDefinitionImplCopyWith<_$TimeSlotDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateDoctorTimeSlotInput _$CreateDoctorTimeSlotInputFromJson(
  Map<String, dynamic> json,
) {
  return _CreateDoctorTimeSlotInput.fromJson(json);
}

/// @nodoc
mixin _$CreateDoctorTimeSlotInput {
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError; // YYYY-MM-DD format - NEW
  List<TimeSlotDefinition> get slots => throw _privateConstructorUsedError;

  /// Serializes this CreateDoctorTimeSlotInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDoctorTimeSlotInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDoctorTimeSlotInputCopyWith<CreateDoctorTimeSlotInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDoctorTimeSlotInputCopyWith<$Res> {
  factory $CreateDoctorTimeSlotInputCopyWith(
    CreateDoctorTimeSlotInput value,
    $Res Function(CreateDoctorTimeSlotInput) then,
  ) = _$CreateDoctorTimeSlotInputCopyWithImpl<$Res, CreateDoctorTimeSlotInput>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'date') String date,
    List<TimeSlotDefinition> slots,
  });
}

/// @nodoc
class _$CreateDoctorTimeSlotInputCopyWithImpl<
  $Res,
  $Val extends CreateDoctorTimeSlotInput
>
    implements $CreateDoctorTimeSlotInputCopyWith<$Res> {
  _$CreateDoctorTimeSlotInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDoctorTimeSlotInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = null,
    Object? slotType = null,
    Object? date = null,
    Object? slots = null,
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
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<TimeSlotDefinition>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateDoctorTimeSlotInputImplCopyWith<$Res>
    implements $CreateDoctorTimeSlotInputCopyWith<$Res> {
  factory _$$CreateDoctorTimeSlotInputImplCopyWith(
    _$CreateDoctorTimeSlotInputImpl value,
    $Res Function(_$CreateDoctorTimeSlotInputImpl) then,
  ) = __$$CreateDoctorTimeSlotInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'date') String date,
    List<TimeSlotDefinition> slots,
  });
}

/// @nodoc
class __$$CreateDoctorTimeSlotInputImplCopyWithImpl<$Res>
    extends
        _$CreateDoctorTimeSlotInputCopyWithImpl<
          $Res,
          _$CreateDoctorTimeSlotInputImpl
        >
    implements _$$CreateDoctorTimeSlotInputImplCopyWith<$Res> {
  __$$CreateDoctorTimeSlotInputImplCopyWithImpl(
    _$CreateDoctorTimeSlotInputImpl _value,
    $Res Function(_$CreateDoctorTimeSlotInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateDoctorTimeSlotInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = null,
    Object? slotType = null,
    Object? date = null,
    Object? slots = null,
  }) {
    return _then(
      _$CreateDoctorTimeSlotInputImpl(
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
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<TimeSlotDefinition>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDoctorTimeSlotInputImpl implements _CreateDoctorTimeSlotInput {
  const _$CreateDoctorTimeSlotInputImpl({
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'slot_type') required this.slotType,
    @JsonKey(name: 'date') required this.date,
    required final List<TimeSlotDefinition> slots,
  }) : _slots = slots;

  factory _$CreateDoctorTimeSlotInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDoctorTimeSlotInputImplFromJson(json);

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
  @JsonKey(name: 'date')
  final String date;
  // YYYY-MM-DD format - NEW
  final List<TimeSlotDefinition> _slots;
  // YYYY-MM-DD format - NEW
  @override
  List<TimeSlotDefinition> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  String toString() {
    return 'CreateDoctorTimeSlotInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, slots: $slots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDoctorTimeSlotInputImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._slots, _slots));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    clinicId,
    slotType,
    date,
    const DeepCollectionEquality().hash(_slots),
  );

  /// Create a copy of CreateDoctorTimeSlotInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDoctorTimeSlotInputImplCopyWith<_$CreateDoctorTimeSlotInputImpl>
  get copyWith =>
      __$$CreateDoctorTimeSlotInputImplCopyWithImpl<
        _$CreateDoctorTimeSlotInputImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDoctorTimeSlotInputImplToJson(this);
  }
}

abstract class _CreateDoctorTimeSlotInput implements CreateDoctorTimeSlotInput {
  const factory _CreateDoctorTimeSlotInput({
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'slot_type') required final String slotType,
    @JsonKey(name: 'date') required final String date,
    required final List<TimeSlotDefinition> slots,
  }) = _$CreateDoctorTimeSlotInputImpl;

  factory _CreateDoctorTimeSlotInput.fromJson(Map<String, dynamic> json) =
      _$CreateDoctorTimeSlotInputImpl.fromJson;

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
  @JsonKey(name: 'date')
  String get date; // YYYY-MM-DD format - NEW
  @override
  List<TimeSlotDefinition> get slots;

  /// Create a copy of CreateDoctorTimeSlotInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDoctorTimeSlotInputImplCopyWith<_$CreateDoctorTimeSlotInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BulkCreateDoctorTimeSlotsResponse _$BulkCreateDoctorTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BulkCreateDoctorTimeSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$BulkCreateDoctorTimeSlotsResponse {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_slots')
  List<DoctorTimeSlotResponse> get createdSlots =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'failed_slots')
  List<dynamic> get failedSlots => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_created')
  int get totalCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_failed')
  int get totalFailed => throw _privateConstructorUsedError;

  /// Serializes this BulkCreateDoctorTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BulkCreateDoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkCreateDoctorTimeSlotsResponseCopyWith<BulkCreateDoctorTimeSlotsResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> {
  factory $BulkCreateDoctorTimeSlotsResponseCopyWith(
    BulkCreateDoctorTimeSlotsResponse value,
    $Res Function(BulkCreateDoctorTimeSlotsResponse) then,
  ) =
      _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<
        $Res,
        BulkCreateDoctorTimeSlotsResponse
      >;
  @useResult
  $Res call({
    String message,
    @JsonKey(name: 'created_slots') List<DoctorTimeSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') List<dynamic> failedSlots,
    @JsonKey(name: 'total_created') int totalCreated,
    @JsonKey(name: 'total_failed') int totalFailed,
  });
}

/// @nodoc
class _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<
  $Res,
  $Val extends BulkCreateDoctorTimeSlotsResponse
>
    implements $BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> {
  _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkCreateDoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? createdSlots = null,
    Object? failedSlots = null,
    Object? totalCreated = null,
    Object? totalFailed = null,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            createdSlots: null == createdSlots
                ? _value.createdSlots
                : createdSlots // ignore: cast_nullable_to_non_nullable
                      as List<DoctorTimeSlotResponse>,
            failedSlots: null == failedSlots
                ? _value.failedSlots
                : failedSlots // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            totalCreated: null == totalCreated
                ? _value.totalCreated
                : totalCreated // ignore: cast_nullable_to_non_nullable
                      as int,
            totalFailed: null == totalFailed
                ? _value.totalFailed
                : totalFailed // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BulkCreateDoctorTimeSlotsResponseImplCopyWith<$Res>
    implements $BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> {
  factory _$$BulkCreateDoctorTimeSlotsResponseImplCopyWith(
    _$BulkCreateDoctorTimeSlotsResponseImpl value,
    $Res Function(_$BulkCreateDoctorTimeSlotsResponseImpl) then,
  ) = __$$BulkCreateDoctorTimeSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    @JsonKey(name: 'created_slots') List<DoctorTimeSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') List<dynamic> failedSlots,
    @JsonKey(name: 'total_created') int totalCreated,
    @JsonKey(name: 'total_failed') int totalFailed,
  });
}

/// @nodoc
class __$$BulkCreateDoctorTimeSlotsResponseImplCopyWithImpl<$Res>
    extends
        _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<
          $Res,
          _$BulkCreateDoctorTimeSlotsResponseImpl
        >
    implements _$$BulkCreateDoctorTimeSlotsResponseImplCopyWith<$Res> {
  __$$BulkCreateDoctorTimeSlotsResponseImplCopyWithImpl(
    _$BulkCreateDoctorTimeSlotsResponseImpl _value,
    $Res Function(_$BulkCreateDoctorTimeSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BulkCreateDoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? createdSlots = null,
    Object? failedSlots = null,
    Object? totalCreated = null,
    Object? totalFailed = null,
  }) {
    return _then(
      _$BulkCreateDoctorTimeSlotsResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        createdSlots: null == createdSlots
            ? _value._createdSlots
            : createdSlots // ignore: cast_nullable_to_non_nullable
                  as List<DoctorTimeSlotResponse>,
        failedSlots: null == failedSlots
            ? _value._failedSlots
            : failedSlots // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        totalCreated: null == totalCreated
            ? _value.totalCreated
            : totalCreated // ignore: cast_nullable_to_non_nullable
                  as int,
        totalFailed: null == totalFailed
            ? _value.totalFailed
            : totalFailed // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BulkCreateDoctorTimeSlotsResponseImpl
    implements _BulkCreateDoctorTimeSlotsResponse {
  const _$BulkCreateDoctorTimeSlotsResponseImpl({
    required this.message,
    @JsonKey(name: 'created_slots')
    final List<DoctorTimeSlotResponse> createdSlots = const [],
    @JsonKey(name: 'failed_slots') final List<dynamic> failedSlots = const [],
    @JsonKey(name: 'total_created') required this.totalCreated,
    @JsonKey(name: 'total_failed') required this.totalFailed,
  }) : _createdSlots = createdSlots,
       _failedSlots = failedSlots;

  factory _$BulkCreateDoctorTimeSlotsResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$BulkCreateDoctorTimeSlotsResponseImplFromJson(json);

  @override
  final String message;
  final List<DoctorTimeSlotResponse> _createdSlots;
  @override
  @JsonKey(name: 'created_slots')
  List<DoctorTimeSlotResponse> get createdSlots {
    if (_createdSlots is EqualUnmodifiableListView) return _createdSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdSlots);
  }

  final List<dynamic> _failedSlots;
  @override
  @JsonKey(name: 'failed_slots')
  List<dynamic> get failedSlots {
    if (_failedSlots is EqualUnmodifiableListView) return _failedSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_failedSlots);
  }

  @override
  @JsonKey(name: 'total_created')
  final int totalCreated;
  @override
  @JsonKey(name: 'total_failed')
  final int totalFailed;

  @override
  String toString() {
    return 'BulkCreateDoctorTimeSlotsResponse(message: $message, createdSlots: $createdSlots, failedSlots: $failedSlots, totalCreated: $totalCreated, totalFailed: $totalFailed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkCreateDoctorTimeSlotsResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._createdSlots,
              _createdSlots,
            ) &&
            const DeepCollectionEquality().equals(
              other._failedSlots,
              _failedSlots,
            ) &&
            (identical(other.totalCreated, totalCreated) ||
                other.totalCreated == totalCreated) &&
            (identical(other.totalFailed, totalFailed) ||
                other.totalFailed == totalFailed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_createdSlots),
    const DeepCollectionEquality().hash(_failedSlots),
    totalCreated,
    totalFailed,
  );

  /// Create a copy of BulkCreateDoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkCreateDoctorTimeSlotsResponseImplCopyWith<
    _$BulkCreateDoctorTimeSlotsResponseImpl
  >
  get copyWith =>
      __$$BulkCreateDoctorTimeSlotsResponseImplCopyWithImpl<
        _$BulkCreateDoctorTimeSlotsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BulkCreateDoctorTimeSlotsResponseImplToJson(this);
  }
}

abstract class _BulkCreateDoctorTimeSlotsResponse
    implements BulkCreateDoctorTimeSlotsResponse {
  const factory _BulkCreateDoctorTimeSlotsResponse({
    required final String message,
    @JsonKey(name: 'created_slots')
    final List<DoctorTimeSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') final List<dynamic> failedSlots,
    @JsonKey(name: 'total_created') required final int totalCreated,
    @JsonKey(name: 'total_failed') required final int totalFailed,
  }) = _$BulkCreateDoctorTimeSlotsResponseImpl;

  factory _BulkCreateDoctorTimeSlotsResponse.fromJson(
    Map<String, dynamic> json,
  ) = _$BulkCreateDoctorTimeSlotsResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: 'created_slots')
  List<DoctorTimeSlotResponse> get createdSlots;
  @override
  @JsonKey(name: 'failed_slots')
  List<dynamic> get failedSlots;
  @override
  @JsonKey(name: 'total_created')
  int get totalCreated;
  @override
  @JsonKey(name: 'total_failed')
  int get totalFailed;

  /// Create a copy of BulkCreateDoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BulkCreateDoctorTimeSlotsResponseImplCopyWith<
    _$BulkCreateDoctorTimeSlotsResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

AvailableSlot _$AvailableSlotFromJson(Map<String, dynamic> json) {
  return _AvailableSlot.fromJson(json);
}

/// @nodoc
mixin _$AvailableSlot {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_name')
  String? get clinicName => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_name')
  String get dayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this AvailableSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableSlotCopyWith<AvailableSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableSlotCopyWith<$Res> {
  factory $AvailableSlotCopyWith(
    AvailableSlot value,
    $Res Function(AvailableSlot) then,
  ) = _$AvailableSlotCopyWithImpl<$Res, AvailableSlot>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    @JsonKey(name: 'day_name') String dayName,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    String? notes,
  });
}

/// @nodoc
class _$AvailableSlotCopyWithImpl<$Res, $Val extends AvailableSlot>
    implements $AvailableSlotCopyWith<$Res> {
  _$AvailableSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? clinicName = freezed,
    Object? dayOfWeek = null,
    Object? dayName = null,
    Object? slotType = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicName: freezed == clinicName
                ? _value.clinicName
                : clinicName // ignore: cast_nullable_to_non_nullable
                      as String?,
            dayOfWeek: null == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            dayName: null == dayName
                ? _value.dayName
                : dayName // ignore: cast_nullable_to_non_nullable
                      as String,
            slotType: null == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AvailableSlotImplCopyWith<$Res>
    implements $AvailableSlotCopyWith<$Res> {
  factory _$$AvailableSlotImplCopyWith(
    _$AvailableSlotImpl value,
    $Res Function(_$AvailableSlotImpl) then,
  ) = __$$AvailableSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    @JsonKey(name: 'day_name') String dayName,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    String? notes,
  });
}

/// @nodoc
class __$$AvailableSlotImplCopyWithImpl<$Res>
    extends _$AvailableSlotCopyWithImpl<$Res, _$AvailableSlotImpl>
    implements _$$AvailableSlotImplCopyWith<$Res> {
  __$$AvailableSlotImplCopyWithImpl(
    _$AvailableSlotImpl _value,
    $Res Function(_$AvailableSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailableSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? clinicName = freezed,
    Object? dayOfWeek = null,
    Object? dayName = null,
    Object? slotType = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$AvailableSlotImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicName: freezed == clinicName
            ? _value.clinicName
            : clinicName // ignore: cast_nullable_to_non_nullable
                  as String?,
        dayOfWeek: null == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        dayName: null == dayName
            ? _value.dayName
            : dayName // ignore: cast_nullable_to_non_nullable
                  as String,
        slotType: null == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
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
class _$AvailableSlotImpl implements _AvailableSlot {
  const _$AvailableSlotImpl({
    required this.id,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'clinic_name') this.clinicName,
    @JsonKey(name: 'day_of_week') required this.dayOfWeek,
    @JsonKey(name: 'day_name') required this.dayName,
    @JsonKey(name: 'slot_type') required this.slotType,
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    @JsonKey(name: 'max_patients') required this.maxPatients,
    this.notes,
  });

  factory _$AvailableSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableSlotImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'clinic_name')
  final String? clinicName;
  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @override
  @JsonKey(name: 'day_name')
  final String dayName;
  @override
  @JsonKey(name: 'slot_type')
  final String slotType;
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
  final String? notes;

  @override
  String toString() {
    return 'AvailableSlot(id: $id, clinicId: $clinicId, clinicName: $clinicName, dayOfWeek: $dayOfWeek, dayName: $dayName, slotType: $slotType, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    clinicId,
    clinicName,
    dayOfWeek,
    dayName,
    slotType,
    startTime,
    endTime,
    maxPatients,
    notes,
  );

  /// Create a copy of AvailableSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableSlotImplCopyWith<_$AvailableSlotImpl> get copyWith =>
      __$$AvailableSlotImplCopyWithImpl<_$AvailableSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableSlotImplToJson(this);
  }
}

abstract class _AvailableSlot implements AvailableSlot {
  const factory _AvailableSlot({
    required final String id,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'clinic_name') final String? clinicName,
    @JsonKey(name: 'day_of_week') required final int dayOfWeek,
    @JsonKey(name: 'day_name') required final String dayName,
    @JsonKey(name: 'slot_type') required final String slotType,
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    @JsonKey(name: 'max_patients') required final int maxPatients,
    final String? notes,
  }) = _$AvailableSlotImpl;

  factory _AvailableSlot.fromJson(Map<String, dynamic> json) =
      _$AvailableSlotImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'clinic_name')
  String? get clinicName;
  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  @JsonKey(name: 'day_name')
  String get dayName;
  @override
  @JsonKey(name: 'slot_type')
  String get slotType;
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
  String? get notes;

  /// Create a copy of AvailableSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableSlotImplCopyWith<_$AvailableSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorTimeSlotsResponse _$DoctorTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DoctorTimeSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$DoctorTimeSlotsResponse {
  @JsonKey(name: 'available_slots')
  List<AvailableSlot> get availableSlots => throw _privateConstructorUsedError;

  /// Serializes this DoctorTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorTimeSlotsResponseCopyWith<DoctorTimeSlotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorTimeSlotsResponseCopyWith<$Res> {
  factory $DoctorTimeSlotsResponseCopyWith(
    DoctorTimeSlotsResponse value,
    $Res Function(DoctorTimeSlotsResponse) then,
  ) = _$DoctorTimeSlotsResponseCopyWithImpl<$Res, DoctorTimeSlotsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'available_slots') List<AvailableSlot> availableSlots,
  });
}

/// @nodoc
class _$DoctorTimeSlotsResponseCopyWithImpl<
  $Res,
  $Val extends DoctorTimeSlotsResponse
>
    implements $DoctorTimeSlotsResponseCopyWith<$Res> {
  _$DoctorTimeSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? availableSlots = null}) {
    return _then(
      _value.copyWith(
            availableSlots: null == availableSlots
                ? _value.availableSlots
                : availableSlots // ignore: cast_nullable_to_non_nullable
                      as List<AvailableSlot>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorTimeSlotsResponseImplCopyWith<$Res>
    implements $DoctorTimeSlotsResponseCopyWith<$Res> {
  factory _$$DoctorTimeSlotsResponseImplCopyWith(
    _$DoctorTimeSlotsResponseImpl value,
    $Res Function(_$DoctorTimeSlotsResponseImpl) then,
  ) = __$$DoctorTimeSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'available_slots') List<AvailableSlot> availableSlots,
  });
}

/// @nodoc
class __$$DoctorTimeSlotsResponseImplCopyWithImpl<$Res>
    extends
        _$DoctorTimeSlotsResponseCopyWithImpl<
          $Res,
          _$DoctorTimeSlotsResponseImpl
        >
    implements _$$DoctorTimeSlotsResponseImplCopyWith<$Res> {
  __$$DoctorTimeSlotsResponseImplCopyWithImpl(
    _$DoctorTimeSlotsResponseImpl _value,
    $Res Function(_$DoctorTimeSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? availableSlots = null}) {
    return _then(
      _$DoctorTimeSlotsResponseImpl(
        availableSlots: null == availableSlots
            ? _value._availableSlots
            : availableSlots // ignore: cast_nullable_to_non_nullable
                  as List<AvailableSlot>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorTimeSlotsResponseImpl implements _DoctorTimeSlotsResponse {
  const _$DoctorTimeSlotsResponseImpl({
    @JsonKey(name: 'available_slots')
    required final List<AvailableSlot> availableSlots,
  }) : _availableSlots = availableSlots;

  factory _$DoctorTimeSlotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorTimeSlotsResponseImplFromJson(json);

  final List<AvailableSlot> _availableSlots;
  @override
  @JsonKey(name: 'available_slots')
  List<AvailableSlot> get availableSlots {
    if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableSlots);
  }

  @override
  String toString() {
    return 'DoctorTimeSlotsResponse(availableSlots: $availableSlots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorTimeSlotsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._availableSlots,
              _availableSlots,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_availableSlots),
  );

  /// Create a copy of DoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorTimeSlotsResponseImplCopyWith<_$DoctorTimeSlotsResponseImpl>
  get copyWith =>
      __$$DoctorTimeSlotsResponseImplCopyWithImpl<
        _$DoctorTimeSlotsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorTimeSlotsResponseImplToJson(this);
  }
}

abstract class _DoctorTimeSlotsResponse implements DoctorTimeSlotsResponse {
  const factory _DoctorTimeSlotsResponse({
    @JsonKey(name: 'available_slots')
    required final List<AvailableSlot> availableSlots,
  }) = _$DoctorTimeSlotsResponseImpl;

  factory _DoctorTimeSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$DoctorTimeSlotsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'available_slots')
  List<AvailableSlot> get availableSlots;

  /// Create a copy of DoctorTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorTimeSlotsResponseImplCopyWith<_$DoctorTimeSlotsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DaySlotGroup _$DaySlotGroupFromJson(Map<String, dynamic> json) {
  return _DaySlotGroup.fromJson(json);
}

/// @nodoc
mixin _$DaySlotGroup {
  @JsonKey(name: 'day_name')
  String get dayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek => throw _privateConstructorUsedError;
  List<DoctorTimeSlotResponse> get slots => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_slots')
  bool get hasSlots => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_slots')
  int get totalSlots => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_slots')
  int get availableSlots => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this DaySlotGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DaySlotGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DaySlotGroupCopyWith<DaySlotGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaySlotGroupCopyWith<$Res> {
  factory $DaySlotGroupCopyWith(
    DaySlotGroup value,
    $Res Function(DaySlotGroup) then,
  ) = _$DaySlotGroupCopyWithImpl<$Res, DaySlotGroup>;
  @useResult
  $Res call({
    @JsonKey(name: 'day_name') String dayName,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    List<DoctorTimeSlotResponse> slots,
    @JsonKey(name: 'has_slots') bool hasSlots,
    @JsonKey(name: 'total_slots') int totalSlots,
    @JsonKey(name: 'available_slots') int availableSlots,
    @JsonKey(name: 'is_available') bool isAvailable,
    String status,
  });
}

/// @nodoc
class _$DaySlotGroupCopyWithImpl<$Res, $Val extends DaySlotGroup>
    implements $DaySlotGroupCopyWith<$Res> {
  _$DaySlotGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DaySlotGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayName = null,
    Object? dayOfWeek = null,
    Object? slots = null,
    Object? hasSlots = null,
    Object? totalSlots = null,
    Object? availableSlots = null,
    Object? isAvailable = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            dayName: null == dayName
                ? _value.dayName
                : dayName // ignore: cast_nullable_to_non_nullable
                      as String,
            dayOfWeek: null == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<DoctorTimeSlotResponse>,
            hasSlots: null == hasSlots
                ? _value.hasSlots
                : hasSlots // ignore: cast_nullable_to_non_nullable
                      as bool,
            totalSlots: null == totalSlots
                ? _value.totalSlots
                : totalSlots // ignore: cast_nullable_to_non_nullable
                      as int,
            availableSlots: null == availableSlots
                ? _value.availableSlots
                : availableSlots // ignore: cast_nullable_to_non_nullable
                      as int,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DaySlotGroupImplCopyWith<$Res>
    implements $DaySlotGroupCopyWith<$Res> {
  factory _$$DaySlotGroupImplCopyWith(
    _$DaySlotGroupImpl value,
    $Res Function(_$DaySlotGroupImpl) then,
  ) = __$$DaySlotGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'day_name') String dayName,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    List<DoctorTimeSlotResponse> slots,
    @JsonKey(name: 'has_slots') bool hasSlots,
    @JsonKey(name: 'total_slots') int totalSlots,
    @JsonKey(name: 'available_slots') int availableSlots,
    @JsonKey(name: 'is_available') bool isAvailable,
    String status,
  });
}

/// @nodoc
class __$$DaySlotGroupImplCopyWithImpl<$Res>
    extends _$DaySlotGroupCopyWithImpl<$Res, _$DaySlotGroupImpl>
    implements _$$DaySlotGroupImplCopyWith<$Res> {
  __$$DaySlotGroupImplCopyWithImpl(
    _$DaySlotGroupImpl _value,
    $Res Function(_$DaySlotGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DaySlotGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayName = null,
    Object? dayOfWeek = null,
    Object? slots = null,
    Object? hasSlots = null,
    Object? totalSlots = null,
    Object? availableSlots = null,
    Object? isAvailable = null,
    Object? status = null,
  }) {
    return _then(
      _$DaySlotGroupImpl(
        dayName: null == dayName
            ? _value.dayName
            : dayName // ignore: cast_nullable_to_non_nullable
                  as String,
        dayOfWeek: null == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<DoctorTimeSlotResponse>,
        hasSlots: null == hasSlots
            ? _value.hasSlots
            : hasSlots // ignore: cast_nullable_to_non_nullable
                  as bool,
        totalSlots: null == totalSlots
            ? _value.totalSlots
            : totalSlots // ignore: cast_nullable_to_non_nullable
                  as int,
        availableSlots: null == availableSlots
            ? _value.availableSlots
            : availableSlots // ignore: cast_nullable_to_non_nullable
                  as int,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DaySlotGroupImpl implements _DaySlotGroup {
  const _$DaySlotGroupImpl({
    @JsonKey(name: 'day_name') required this.dayName,
    @JsonKey(name: 'day_of_week') required this.dayOfWeek,
    final List<DoctorTimeSlotResponse> slots = const [],
    @JsonKey(name: 'has_slots') this.hasSlots = false,
    @JsonKey(name: 'total_slots') this.totalSlots = 0,
    @JsonKey(name: 'available_slots') this.availableSlots = 0,
    @JsonKey(name: 'is_available') this.isAvailable = false,
    this.status = 'unavailable',
  }) : _slots = slots;

  factory _$DaySlotGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$DaySlotGroupImplFromJson(json);

  @override
  @JsonKey(name: 'day_name')
  final String dayName;
  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  final List<DoctorTimeSlotResponse> _slots;
  @override
  @JsonKey()
  List<DoctorTimeSlotResponse> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  @JsonKey(name: 'has_slots')
  final bool hasSlots;
  @override
  @JsonKey(name: 'total_slots')
  final int totalSlots;
  @override
  @JsonKey(name: 'available_slots')
  final int availableSlots;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'DaySlotGroup(dayName: $dayName, dayOfWeek: $dayOfWeek, slots: $slots, hasSlots: $hasSlots, totalSlots: $totalSlots, availableSlots: $availableSlots, isAvailable: $isAvailable, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaySlotGroupImpl &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.hasSlots, hasSlots) ||
                other.hasSlots == hasSlots) &&
            (identical(other.totalSlots, totalSlots) ||
                other.totalSlots == totalSlots) &&
            (identical(other.availableSlots, availableSlots) ||
                other.availableSlots == availableSlots) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dayName,
    dayOfWeek,
    const DeepCollectionEquality().hash(_slots),
    hasSlots,
    totalSlots,
    availableSlots,
    isAvailable,
    status,
  );

  /// Create a copy of DaySlotGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DaySlotGroupImplCopyWith<_$DaySlotGroupImpl> get copyWith =>
      __$$DaySlotGroupImplCopyWithImpl<_$DaySlotGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DaySlotGroupImplToJson(this);
  }
}

abstract class _DaySlotGroup implements DaySlotGroup {
  const factory _DaySlotGroup({
    @JsonKey(name: 'day_name') required final String dayName,
    @JsonKey(name: 'day_of_week') required final int dayOfWeek,
    final List<DoctorTimeSlotResponse> slots,
    @JsonKey(name: 'has_slots') final bool hasSlots,
    @JsonKey(name: 'total_slots') final int totalSlots,
    @JsonKey(name: 'available_slots') final int availableSlots,
    @JsonKey(name: 'is_available') final bool isAvailable,
    final String status,
  }) = _$DaySlotGroupImpl;

  factory _DaySlotGroup.fromJson(Map<String, dynamic> json) =
      _$DaySlotGroupImpl.fromJson;

  @override
  @JsonKey(name: 'day_name')
  String get dayName;
  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  List<DoctorTimeSlotResponse> get slots;
  @override
  @JsonKey(name: 'has_slots')
  bool get hasSlots;
  @override
  @JsonKey(name: 'total_slots')
  int get totalSlots;
  @override
  @JsonKey(name: 'available_slots')
  int get availableSlots;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  String get status;

  /// Create a copy of DaySlotGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DaySlotGroupImplCopyWith<_$DaySlotGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupedTimeSlotsResponse _$GroupedTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _GroupedTimeSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$GroupedTimeSlotsResponse {
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String? get slotType => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  List<DaySlotGroup> get days => throw _privateConstructorUsedError;

  /// Serializes this GroupedTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupedTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupedTimeSlotsResponseCopyWith<GroupedTimeSlotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedTimeSlotsResponseCopyWith<$Res> {
  factory $GroupedTimeSlotsResponseCopyWith(
    GroupedTimeSlotsResponse value,
    $Res Function(GroupedTimeSlotsResponse) then,
  ) = _$GroupedTimeSlotsResponseCopyWithImpl<$Res, GroupedTimeSlotsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
    List<DaySlotGroup> days,
  });
}

/// @nodoc
class _$GroupedTimeSlotsResponseCopyWithImpl<
  $Res,
  $Val extends GroupedTimeSlotsResponse
>
    implements $GroupedTimeSlotsResponseCopyWith<$Res> {
  _$GroupedTimeSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupedTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = freezed,
    Object? slotType = freezed,
    Object? date = freezed,
    Object? days = null,
  }) {
    return _then(
      _value.copyWith(
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotType: freezed == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            days: null == days
                ? _value.days
                : days // ignore: cast_nullable_to_non_nullable
                      as List<DaySlotGroup>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GroupedTimeSlotsResponseImplCopyWith<$Res>
    implements $GroupedTimeSlotsResponseCopyWith<$Res> {
  factory _$$GroupedTimeSlotsResponseImplCopyWith(
    _$GroupedTimeSlotsResponseImpl value,
    $Res Function(_$GroupedTimeSlotsResponseImpl) then,
  ) = __$$GroupedTimeSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
    List<DaySlotGroup> days,
  });
}

/// @nodoc
class __$$GroupedTimeSlotsResponseImplCopyWithImpl<$Res>
    extends
        _$GroupedTimeSlotsResponseCopyWithImpl<
          $Res,
          _$GroupedTimeSlotsResponseImpl
        >
    implements _$$GroupedTimeSlotsResponseImplCopyWith<$Res> {
  __$$GroupedTimeSlotsResponseImplCopyWithImpl(
    _$GroupedTimeSlotsResponseImpl _value,
    $Res Function(_$GroupedTimeSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupedTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = freezed,
    Object? slotType = freezed,
    Object? date = freezed,
    Object? days = null,
  }) {
    return _then(
      _$GroupedTimeSlotsResponseImpl(
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotType: freezed == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        days: null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<DaySlotGroup>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupedTimeSlotsResponseImpl implements _GroupedTimeSlotsResponse {
  const _$GroupedTimeSlotsResponseImpl({
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'slot_type') this.slotType,
    this.date,
    final List<DaySlotGroup> days = const [],
  }) : _days = days;

  factory _$GroupedTimeSlotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupedTimeSlotsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'slot_type')
  final String? slotType;
  @override
  final String? date;
  final List<DaySlotGroup> _days;
  @override
  @JsonKey()
  List<DaySlotGroup> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'GroupedTimeSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedTimeSlotsResponseImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    clinicId,
    slotType,
    date,
    const DeepCollectionEquality().hash(_days),
  );

  /// Create a copy of GroupedTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedTimeSlotsResponseImplCopyWith<_$GroupedTimeSlotsResponseImpl>
  get copyWith =>
      __$$GroupedTimeSlotsResponseImplCopyWithImpl<
        _$GroupedTimeSlotsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupedTimeSlotsResponseImplToJson(this);
  }
}

abstract class _GroupedTimeSlotsResponse implements GroupedTimeSlotsResponse {
  const factory _GroupedTimeSlotsResponse({
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'slot_type') final String? slotType,
    final String? date,
    final List<DaySlotGroup> days,
  }) = _$GroupedTimeSlotsResponseImpl;

  factory _GroupedTimeSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$GroupedTimeSlotsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'slot_type')
  String? get slotType;
  @override
  String? get date;
  @override
  List<DaySlotGroup> get days;

  /// Create a copy of GroupedTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedTimeSlotsResponseImplCopyWith<_$GroupedTimeSlotsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ListTimeSlotsResponse _$ListTimeSlotsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ListTimeSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListTimeSlotsResponse {
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String? get slotType => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  List<DoctorTimeSlotResponse> get slots => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this ListTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListTimeSlotsResponseCopyWith<ListTimeSlotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTimeSlotsResponseCopyWith<$Res> {
  factory $ListTimeSlotsResponseCopyWith(
    ListTimeSlotsResponse value,
    $Res Function(ListTimeSlotsResponse) then,
  ) = _$ListTimeSlotsResponseCopyWithImpl<$Res, ListTimeSlotsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
    List<DoctorTimeSlotResponse> slots,
    int total,
  });
}

/// @nodoc
class _$ListTimeSlotsResponseCopyWithImpl<
  $Res,
  $Val extends ListTimeSlotsResponse
>
    implements $ListTimeSlotsResponseCopyWith<$Res> {
  _$ListTimeSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = freezed,
    Object? slotType = freezed,
    Object? date = freezed,
    Object? slots = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotType: freezed == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<DoctorTimeSlotResponse>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListTimeSlotsResponseImplCopyWith<$Res>
    implements $ListTimeSlotsResponseCopyWith<$Res> {
  factory _$$ListTimeSlotsResponseImplCopyWith(
    _$ListTimeSlotsResponseImpl value,
    $Res Function(_$ListTimeSlotsResponseImpl) then,
  ) = __$$ListTimeSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
    List<DoctorTimeSlotResponse> slots,
    int total,
  });
}

/// @nodoc
class __$$ListTimeSlotsResponseImplCopyWithImpl<$Res>
    extends
        _$ListTimeSlotsResponseCopyWithImpl<$Res, _$ListTimeSlotsResponseImpl>
    implements _$$ListTimeSlotsResponseImplCopyWith<$Res> {
  __$$ListTimeSlotsResponseImplCopyWithImpl(
    _$ListTimeSlotsResponseImpl _value,
    $Res Function(_$ListTimeSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = freezed,
    Object? slotType = freezed,
    Object? date = freezed,
    Object? slots = null,
    Object? total = null,
  }) {
    return _then(
      _$ListTimeSlotsResponseImpl(
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotType: freezed == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<DoctorTimeSlotResponse>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ListTimeSlotsResponseImpl implements _ListTimeSlotsResponse {
  const _$ListTimeSlotsResponseImpl({
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'slot_type') this.slotType,
    this.date,
    final List<DoctorTimeSlotResponse> slots = const [],
    this.total = 0,
  }) : _slots = slots;

  factory _$ListTimeSlotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListTimeSlotsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'slot_type')
  final String? slotType;
  @override
  final String? date;
  final List<DoctorTimeSlotResponse> _slots;
  @override
  @JsonKey()
  List<DoctorTimeSlotResponse> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'ListTimeSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, slots: $slots, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTimeSlotsResponseImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    clinicId,
    slotType,
    date,
    const DeepCollectionEquality().hash(_slots),
    total,
  );

  /// Create a copy of ListTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTimeSlotsResponseImplCopyWith<_$ListTimeSlotsResponseImpl>
  get copyWith =>
      __$$ListTimeSlotsResponseImplCopyWithImpl<_$ListTimeSlotsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ListTimeSlotsResponseImplToJson(this);
  }
}

abstract class _ListTimeSlotsResponse implements ListTimeSlotsResponse {
  const factory _ListTimeSlotsResponse({
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'slot_type') final String? slotType,
    final String? date,
    final List<DoctorTimeSlotResponse> slots,
    final int total,
  }) = _$ListTimeSlotsResponseImpl;

  factory _ListTimeSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$ListTimeSlotsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'slot_type')
  String? get slotType;
  @override
  String? get date;
  @override
  List<DoctorTimeSlotResponse> get slots;
  @override
  int get total;

  /// Create a copy of ListTimeSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListTimeSlotsResponseImplCopyWith<_$ListTimeSlotsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateDateSpecificSlotsInput _$CreateDateSpecificSlotsInputFromJson(
  Map<String, dynamic> json,
) {
  return _CreateDateSpecificSlotsInput.fromJson(json);
}

/// @nodoc
mixin _$CreateDateSpecificSlotsInput {
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  String? get date =>
      throw _privateConstructorUsedError; // Optional: for specific date slots (YYYY-MM-DD)
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek => throw _privateConstructorUsedError; // Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
  List<SimpleTimeSlot> get slots => throw _privateConstructorUsedError;

  /// Serializes this CreateDateSpecificSlotsInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDateSpecificSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDateSpecificSlotsInputCopyWith<CreateDateSpecificSlotsInput>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDateSpecificSlotsInputCopyWith<$Res> {
  factory $CreateDateSpecificSlotsInputCopyWith(
    CreateDateSpecificSlotsInput value,
    $Res Function(CreateDateSpecificSlotsInput) then,
  ) =
      _$CreateDateSpecificSlotsInputCopyWithImpl<
        $Res,
        CreateDateSpecificSlotsInput
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'slot_type') String slotType,
    String? date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    List<SimpleTimeSlot> slots,
  });
}

/// @nodoc
class _$CreateDateSpecificSlotsInputCopyWithImpl<
  $Res,
  $Val extends CreateDateSpecificSlotsInput
>
    implements $CreateDateSpecificSlotsInputCopyWith<$Res> {
  _$CreateDateSpecificSlotsInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDateSpecificSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = null,
    Object? slotType = null,
    Object? date = freezed,
    Object? dayOfWeek = freezed,
    Object? slots = null,
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
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            dayOfWeek: freezed == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int?,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<SimpleTimeSlot>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateDateSpecificSlotsInputImplCopyWith<$Res>
    implements $CreateDateSpecificSlotsInputCopyWith<$Res> {
  factory _$$CreateDateSpecificSlotsInputImplCopyWith(
    _$CreateDateSpecificSlotsInputImpl value,
    $Res Function(_$CreateDateSpecificSlotsInputImpl) then,
  ) = __$$CreateDateSpecificSlotsInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'slot_type') String slotType,
    String? date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    List<SimpleTimeSlot> slots,
  });
}

/// @nodoc
class __$$CreateDateSpecificSlotsInputImplCopyWithImpl<$Res>
    extends
        _$CreateDateSpecificSlotsInputCopyWithImpl<
          $Res,
          _$CreateDateSpecificSlotsInputImpl
        >
    implements _$$CreateDateSpecificSlotsInputImplCopyWith<$Res> {
  __$$CreateDateSpecificSlotsInputImplCopyWithImpl(
    _$CreateDateSpecificSlotsInputImpl _value,
    $Res Function(_$CreateDateSpecificSlotsInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateDateSpecificSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? clinicId = null,
    Object? slotType = null,
    Object? date = freezed,
    Object? dayOfWeek = freezed,
    Object? slots = null,
  }) {
    return _then(
      _$CreateDateSpecificSlotsInputImpl(
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
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        dayOfWeek: freezed == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int?,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<SimpleTimeSlot>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDateSpecificSlotsInputImpl
    implements _CreateDateSpecificSlotsInput {
  const _$CreateDateSpecificSlotsInputImpl({
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'slot_type') required this.slotType,
    this.date,
    @JsonKey(name: 'day_of_week') this.dayOfWeek,
    required final List<SimpleTimeSlot> slots,
  }) : _slots = slots;

  factory _$CreateDateSpecificSlotsInputImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateDateSpecificSlotsInputImplFromJson(json);

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
  final String? date;
  // Optional: for specific date slots (YYYY-MM-DD)
  @override
  @JsonKey(name: 'day_of_week')
  final int? dayOfWeek;
  // Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
  final List<SimpleTimeSlot> _slots;
  // Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
  @override
  List<SimpleTimeSlot> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  String toString() {
    return 'CreateDateSpecificSlotsInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, dayOfWeek: $dayOfWeek, slots: $slots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDateSpecificSlotsInputImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(other._slots, _slots));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    clinicId,
    slotType,
    date,
    dayOfWeek,
    const DeepCollectionEquality().hash(_slots),
  );

  /// Create a copy of CreateDateSpecificSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDateSpecificSlotsInputImplCopyWith<
    _$CreateDateSpecificSlotsInputImpl
  >
  get copyWith =>
      __$$CreateDateSpecificSlotsInputImplCopyWithImpl<
        _$CreateDateSpecificSlotsInputImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDateSpecificSlotsInputImplToJson(this);
  }
}

abstract class _CreateDateSpecificSlotsInput
    implements CreateDateSpecificSlotsInput {
  const factory _CreateDateSpecificSlotsInput({
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'slot_type') required final String slotType,
    final String? date,
    @JsonKey(name: 'day_of_week') final int? dayOfWeek,
    required final List<SimpleTimeSlot> slots,
  }) = _$CreateDateSpecificSlotsInputImpl;

  factory _CreateDateSpecificSlotsInput.fromJson(Map<String, dynamic> json) =
      _$CreateDateSpecificSlotsInputImpl.fromJson;

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
  String? get date; // Optional: for specific date slots (YYYY-MM-DD)
  @override
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek; // Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
  @override
  List<SimpleTimeSlot> get slots;

  /// Create a copy of CreateDateSpecificSlotsInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDateSpecificSlotsInputImplCopyWith<
    _$CreateDateSpecificSlotsInputImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

SimpleTimeSlot _$SimpleTimeSlotFromJson(Map<String, dynamic> json) {
  return _SimpleTimeSlot.fromJson(json);
}

/// @nodoc
mixin _$SimpleTimeSlot {
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int? get maxPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this SimpleTimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleTimeSlotCopyWith<SimpleTimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleTimeSlotCopyWith<$Res> {
  factory $SimpleTimeSlotCopyWith(
    SimpleTimeSlot value,
    $Res Function(SimpleTimeSlot) then,
  ) = _$SimpleTimeSlotCopyWithImpl<$Res, SimpleTimeSlot>;
  @useResult
  $Res call({
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int? maxPatients,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    String? notes,
  });
}

/// @nodoc
class _$SimpleTimeSlotCopyWithImpl<$Res, $Val extends SimpleTimeSlot>
    implements $SimpleTimeSlotCopyWith<$Res> {
  _$SimpleTimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = freezed,
    Object? dayOfWeek = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            maxPatients: freezed == maxPatients
                ? _value.maxPatients
                : maxPatients // ignore: cast_nullable_to_non_nullable
                      as int?,
            dayOfWeek: freezed == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int?,
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
abstract class _$$SimpleTimeSlotImplCopyWith<$Res>
    implements $SimpleTimeSlotCopyWith<$Res> {
  factory _$$SimpleTimeSlotImplCopyWith(
    _$SimpleTimeSlotImpl value,
    $Res Function(_$SimpleTimeSlotImpl) then,
  ) = __$$SimpleTimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int? maxPatients,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    String? notes,
  });
}

/// @nodoc
class __$$SimpleTimeSlotImplCopyWithImpl<$Res>
    extends _$SimpleTimeSlotCopyWithImpl<$Res, _$SimpleTimeSlotImpl>
    implements _$$SimpleTimeSlotImplCopyWith<$Res> {
  __$$SimpleTimeSlotImplCopyWithImpl(
    _$SimpleTimeSlotImpl _value,
    $Res Function(_$SimpleTimeSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = freezed,
    Object? dayOfWeek = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$SimpleTimeSlotImpl(
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        maxPatients: freezed == maxPatients
            ? _value.maxPatients
            : maxPatients // ignore: cast_nullable_to_non_nullable
                  as int?,
        dayOfWeek: freezed == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int?,
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
class _$SimpleTimeSlotImpl implements _SimpleTimeSlot {
  const _$SimpleTimeSlotImpl({
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    @JsonKey(name: 'max_patients') this.maxPatients,
    @JsonKey(name: 'day_of_week') this.dayOfWeek,
    this.notes,
  });

  factory _$SimpleTimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleTimeSlotImplFromJson(json);

  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  @JsonKey(name: 'max_patients')
  final int? maxPatients;
  @override
  @JsonKey(name: 'day_of_week')
  final int? dayOfWeek;
  @override
  final String? notes;

  @override
  String toString() {
    return 'SimpleTimeSlot(startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, dayOfWeek: $dayOfWeek, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleTimeSlotImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    startTime,
    endTime,
    maxPatients,
    dayOfWeek,
    notes,
  );

  /// Create a copy of SimpleTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleTimeSlotImplCopyWith<_$SimpleTimeSlotImpl> get copyWith =>
      __$$SimpleTimeSlotImplCopyWithImpl<_$SimpleTimeSlotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleTimeSlotImplToJson(this);
  }
}

abstract class _SimpleTimeSlot implements SimpleTimeSlot {
  const factory _SimpleTimeSlot({
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    @JsonKey(name: 'max_patients') final int? maxPatients,
    @JsonKey(name: 'day_of_week') final int? dayOfWeek,
    final String? notes,
  }) = _$SimpleTimeSlotImpl;

  factory _SimpleTimeSlot.fromJson(Map<String, dynamic> json) =
      _$SimpleTimeSlotImpl.fromJson;

  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(name: 'max_patients')
  int? get maxPatients;
  @override
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek;
  @override
  String? get notes;

  /// Create a copy of SimpleTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleTimeSlotImplCopyWith<_$SimpleTimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DateSpecificSlotResponse _$DateSpecificSlotResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DateSpecificSlotResponse.fromJson(json);
}

/// @nodoc
mixin _$DateSpecificSlotResponse {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_patients')
  int get maxPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'booked_patients')
  int? get bookedPatients => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_spots')
  int? get availableSpots => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DateSpecificSlotResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DateSpecificSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateSpecificSlotResponseCopyWith<DateSpecificSlotResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateSpecificSlotResponseCopyWith<$Res> {
  factory $DateSpecificSlotResponseCopyWith(
    DateSpecificSlotResponse value,
    $Res Function(DateSpecificSlotResponse) then,
  ) = _$DateSpecificSlotResponseCopyWithImpl<$Res, DateSpecificSlotResponse>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    String date,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'booked_patients') int? bookedPatients,
    @JsonKey(name: 'available_spots') int? availableSpots,
    @JsonKey(name: 'is_available') bool? isAvailable,
    String? status,
    String? notes,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class _$DateSpecificSlotResponseCopyWithImpl<
  $Res,
  $Val extends DateSpecificSlotResponse
>
    implements $DateSpecificSlotResponseCopyWith<$Res> {
  _$DateSpecificSlotResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateSpecificSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? clinicId = null,
    Object? date = null,
    Object? slotType = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? bookedPatients = freezed,
    Object? availableSpots = freezed,
    Object? isAvailable = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            slotType: null == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
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
            bookedPatients: freezed == bookedPatients
                ? _value.bookedPatients
                : bookedPatients // ignore: cast_nullable_to_non_nullable
                      as int?,
            availableSpots: freezed == availableSpots
                ? _value.availableSpots
                : availableSpots // ignore: cast_nullable_to_non_nullable
                      as int?,
            isAvailable: freezed == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DateSpecificSlotResponseImplCopyWith<$Res>
    implements $DateSpecificSlotResponseCopyWith<$Res> {
  factory _$$DateSpecificSlotResponseImplCopyWith(
    _$DateSpecificSlotResponseImpl value,
    $Res Function(_$DateSpecificSlotResponseImpl) then,
  ) = __$$DateSpecificSlotResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'clinic_id') String clinicId,
    String date,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'max_patients') int maxPatients,
    @JsonKey(name: 'booked_patients') int? bookedPatients,
    @JsonKey(name: 'available_spots') int? availableSpots,
    @JsonKey(name: 'is_available') bool? isAvailable,
    String? status,
    String? notes,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class __$$DateSpecificSlotResponseImplCopyWithImpl<$Res>
    extends
        _$DateSpecificSlotResponseCopyWithImpl<
          $Res,
          _$DateSpecificSlotResponseImpl
        >
    implements _$$DateSpecificSlotResponseImplCopyWith<$Res> {
  __$$DateSpecificSlotResponseImplCopyWithImpl(
    _$DateSpecificSlotResponseImpl _value,
    $Res Function(_$DateSpecificSlotResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DateSpecificSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? clinicId = null,
    Object? date = null,
    Object? slotType = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxPatients = null,
    Object? bookedPatients = freezed,
    Object? availableSpots = freezed,
    Object? isAvailable = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$DateSpecificSlotResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        slotType: null == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
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
        bookedPatients: freezed == bookedPatients
            ? _value.bookedPatients
            : bookedPatients // ignore: cast_nullable_to_non_nullable
                  as int?,
        availableSpots: freezed == availableSpots
            ? _value.availableSpots
            : availableSpots // ignore: cast_nullable_to_non_nullable
                  as int?,
        isAvailable: freezed == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DateSpecificSlotResponseImpl implements _DateSpecificSlotResponse {
  const _$DateSpecificSlotResponseImpl({
    required this.id,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    required this.date,
    @JsonKey(name: 'slot_type') required this.slotType,
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    @JsonKey(name: 'max_patients') required this.maxPatients,
    @JsonKey(name: 'booked_patients') this.bookedPatients,
    @JsonKey(name: 'available_spots') this.availableSpots,
    @JsonKey(name: 'is_available') this.isAvailable,
    this.status,
    this.notes,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$DateSpecificSlotResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateSpecificSlotResponseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  final String date;
  @override
  @JsonKey(name: 'slot_type')
  final String slotType;
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
  @JsonKey(name: 'booked_patients')
  final int? bookedPatients;
  @override
  @JsonKey(name: 'available_spots')
  final int? availableSpots;
  @override
  @JsonKey(name: 'is_available')
  final bool? isAvailable;
  @override
  final String? status;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'DateSpecificSlotResponse(id: $id, doctorId: $doctorId, clinicId: $clinicId, date: $date, slotType: $slotType, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, bookedPatients: $bookedPatients, availableSpots: $availableSpots, isAvailable: $isAvailable, status: $status, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateSpecificSlotResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxPatients, maxPatients) ||
                other.maxPatients == maxPatients) &&
            (identical(other.bookedPatients, bookedPatients) ||
                other.bookedPatients == bookedPatients) &&
            (identical(other.availableSpots, availableSpots) ||
                other.availableSpots == availableSpots) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    slotType,
    startTime,
    endTime,
    maxPatients,
    bookedPatients,
    availableSpots,
    isAvailable,
    status,
    notes,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of DateSpecificSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateSpecificSlotResponseImplCopyWith<_$DateSpecificSlotResponseImpl>
  get copyWith =>
      __$$DateSpecificSlotResponseImplCopyWithImpl<
        _$DateSpecificSlotResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateSpecificSlotResponseImplToJson(this);
  }
}

abstract class _DateSpecificSlotResponse implements DateSpecificSlotResponse {
  const factory _DateSpecificSlotResponse({
    required final String id,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    required final String date,
    @JsonKey(name: 'slot_type') required final String slotType,
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    @JsonKey(name: 'max_patients') required final int maxPatients,
    @JsonKey(name: 'booked_patients') final int? bookedPatients,
    @JsonKey(name: 'available_spots') final int? availableSpots,
    @JsonKey(name: 'is_available') final bool? isAvailable,
    final String? status,
    final String? notes,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _$DateSpecificSlotResponseImpl;

  factory _DateSpecificSlotResponse.fromJson(Map<String, dynamic> json) =
      _$DateSpecificSlotResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  String get date;
  @override
  @JsonKey(name: 'slot_type')
  String get slotType;
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
  @JsonKey(name: 'booked_patients')
  int? get bookedPatients;
  @override
  @JsonKey(name: 'available_spots')
  int? get availableSpots;
  @override
  @JsonKey(name: 'is_available')
  bool? get isAvailable;
  @override
  String? get status;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of DateSpecificSlotResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateSpecificSlotResponseImplCopyWith<_$DateSpecificSlotResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateSlotsResponse _$CreateSlotsResponseFromJson(Map<String, dynamic> json) {
  return _CreateSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateSlotsResponse {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_slots')
  List<DateSpecificSlotResponse> get createdSlots =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'failed_slots')
  List<Map<String, dynamic>> get failedSlots =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_created')
  int get totalCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_failed')
  int get totalFailed => throw _privateConstructorUsedError;

  /// Serializes this CreateSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSlotsResponseCopyWith<CreateSlotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSlotsResponseCopyWith<$Res> {
  factory $CreateSlotsResponseCopyWith(
    CreateSlotsResponse value,
    $Res Function(CreateSlotsResponse) then,
  ) = _$CreateSlotsResponseCopyWithImpl<$Res, CreateSlotsResponse>;
  @useResult
  $Res call({
    String message,
    @JsonKey(name: 'created_slots') List<DateSpecificSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') List<Map<String, dynamic>> failedSlots,
    @JsonKey(name: 'total_created') int totalCreated,
    @JsonKey(name: 'total_failed') int totalFailed,
  });
}

/// @nodoc
class _$CreateSlotsResponseCopyWithImpl<$Res, $Val extends CreateSlotsResponse>
    implements $CreateSlotsResponseCopyWith<$Res> {
  _$CreateSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? createdSlots = null,
    Object? failedSlots = null,
    Object? totalCreated = null,
    Object? totalFailed = null,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            createdSlots: null == createdSlots
                ? _value.createdSlots
                : createdSlots // ignore: cast_nullable_to_non_nullable
                      as List<DateSpecificSlotResponse>,
            failedSlots: null == failedSlots
                ? _value.failedSlots
                : failedSlots // ignore: cast_nullable_to_non_nullable
                      as List<Map<String, dynamic>>,
            totalCreated: null == totalCreated
                ? _value.totalCreated
                : totalCreated // ignore: cast_nullable_to_non_nullable
                      as int,
            totalFailed: null == totalFailed
                ? _value.totalFailed
                : totalFailed // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateSlotsResponseImplCopyWith<$Res>
    implements $CreateSlotsResponseCopyWith<$Res> {
  factory _$$CreateSlotsResponseImplCopyWith(
    _$CreateSlotsResponseImpl value,
    $Res Function(_$CreateSlotsResponseImpl) then,
  ) = __$$CreateSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    @JsonKey(name: 'created_slots') List<DateSpecificSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') List<Map<String, dynamic>> failedSlots,
    @JsonKey(name: 'total_created') int totalCreated,
    @JsonKey(name: 'total_failed') int totalFailed,
  });
}

/// @nodoc
class __$$CreateSlotsResponseImplCopyWithImpl<$Res>
    extends _$CreateSlotsResponseCopyWithImpl<$Res, _$CreateSlotsResponseImpl>
    implements _$$CreateSlotsResponseImplCopyWith<$Res> {
  __$$CreateSlotsResponseImplCopyWithImpl(
    _$CreateSlotsResponseImpl _value,
    $Res Function(_$CreateSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? createdSlots = null,
    Object? failedSlots = null,
    Object? totalCreated = null,
    Object? totalFailed = null,
  }) {
    return _then(
      _$CreateSlotsResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        createdSlots: null == createdSlots
            ? _value._createdSlots
            : createdSlots // ignore: cast_nullable_to_non_nullable
                  as List<DateSpecificSlotResponse>,
        failedSlots: null == failedSlots
            ? _value._failedSlots
            : failedSlots // ignore: cast_nullable_to_non_nullable
                  as List<Map<String, dynamic>>,
        totalCreated: null == totalCreated
            ? _value.totalCreated
            : totalCreated // ignore: cast_nullable_to_non_nullable
                  as int,
        totalFailed: null == totalFailed
            ? _value.totalFailed
            : totalFailed // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSlotsResponseImpl implements _CreateSlotsResponse {
  const _$CreateSlotsResponseImpl({
    required this.message,
    @JsonKey(name: 'created_slots')
    final List<DateSpecificSlotResponse> createdSlots = const [],
    @JsonKey(name: 'failed_slots')
    final List<Map<String, dynamic>> failedSlots = const [],
    @JsonKey(name: 'total_created') required this.totalCreated,
    @JsonKey(name: 'total_failed') required this.totalFailed,
  }) : _createdSlots = createdSlots,
       _failedSlots = failedSlots;

  factory _$CreateSlotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSlotsResponseImplFromJson(json);

  @override
  final String message;
  final List<DateSpecificSlotResponse> _createdSlots;
  @override
  @JsonKey(name: 'created_slots')
  List<DateSpecificSlotResponse> get createdSlots {
    if (_createdSlots is EqualUnmodifiableListView) return _createdSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdSlots);
  }

  final List<Map<String, dynamic>> _failedSlots;
  @override
  @JsonKey(name: 'failed_slots')
  List<Map<String, dynamic>> get failedSlots {
    if (_failedSlots is EqualUnmodifiableListView) return _failedSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_failedSlots);
  }

  @override
  @JsonKey(name: 'total_created')
  final int totalCreated;
  @override
  @JsonKey(name: 'total_failed')
  final int totalFailed;

  @override
  String toString() {
    return 'CreateSlotsResponse(message: $message, createdSlots: $createdSlots, failedSlots: $failedSlots, totalCreated: $totalCreated, totalFailed: $totalFailed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSlotsResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._createdSlots,
              _createdSlots,
            ) &&
            const DeepCollectionEquality().equals(
              other._failedSlots,
              _failedSlots,
            ) &&
            (identical(other.totalCreated, totalCreated) ||
                other.totalCreated == totalCreated) &&
            (identical(other.totalFailed, totalFailed) ||
                other.totalFailed == totalFailed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_createdSlots),
    const DeepCollectionEquality().hash(_failedSlots),
    totalCreated,
    totalFailed,
  );

  /// Create a copy of CreateSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSlotsResponseImplCopyWith<_$CreateSlotsResponseImpl> get copyWith =>
      __$$CreateSlotsResponseImplCopyWithImpl<_$CreateSlotsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSlotsResponseImplToJson(this);
  }
}

abstract class _CreateSlotsResponse implements CreateSlotsResponse {
  const factory _CreateSlotsResponse({
    required final String message,
    @JsonKey(name: 'created_slots')
    final List<DateSpecificSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') final List<Map<String, dynamic>> failedSlots,
    @JsonKey(name: 'total_created') required final int totalCreated,
    @JsonKey(name: 'total_failed') required final int totalFailed,
  }) = _$CreateSlotsResponseImpl;

  factory _CreateSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$CreateSlotsResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: 'created_slots')
  List<DateSpecificSlotResponse> get createdSlots;
  @override
  @JsonKey(name: 'failed_slots')
  List<Map<String, dynamic>> get failedSlots;
  @override
  @JsonKey(name: 'total_created')
  int get totalCreated;
  @override
  @JsonKey(name: 'total_failed')
  int get totalFailed;

  /// Create a copy of CreateSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSlotsResponseImplCopyWith<_$CreateSlotsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListSlotsResponse _$ListSlotsResponseFromJson(Map<String, dynamic> json) {
  return _ListSlotsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListSlotsResponse {
  List<DateSpecificSlotResponse> get slots =>
      throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String? get slotType => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this ListSlotsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListSlotsResponseCopyWith<ListSlotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSlotsResponseCopyWith<$Res> {
  factory $ListSlotsResponseCopyWith(
    ListSlotsResponse value,
    $Res Function(ListSlotsResponse) then,
  ) = _$ListSlotsResponseCopyWithImpl<$Res, ListSlotsResponse>;
  @useResult
  $Res call({
    List<DateSpecificSlotResponse> slots,
    int total,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
  });
}

/// @nodoc
class _$ListSlotsResponseCopyWithImpl<$Res, $Val extends ListSlotsResponse>
    implements $ListSlotsResponseCopyWith<$Res> {
  _$ListSlotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slots = null,
    Object? total = null,
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? slotType = freezed,
    Object? date = freezed,
  }) {
    return _then(
      _value.copyWith(
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<DateSpecificSlotResponse>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotType: freezed == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListSlotsResponseImplCopyWith<$Res>
    implements $ListSlotsResponseCopyWith<$Res> {
  factory _$$ListSlotsResponseImplCopyWith(
    _$ListSlotsResponseImpl value,
    $Res Function(_$ListSlotsResponseImpl) then,
  ) = __$$ListSlotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DateSpecificSlotResponse> slots,
    int total,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
  });
}

/// @nodoc
class __$$ListSlotsResponseImplCopyWithImpl<$Res>
    extends _$ListSlotsResponseCopyWithImpl<$Res, _$ListSlotsResponseImpl>
    implements _$$ListSlotsResponseImplCopyWith<$Res> {
  __$$ListSlotsResponseImplCopyWithImpl(
    _$ListSlotsResponseImpl _value,
    $Res Function(_$ListSlotsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slots = null,
    Object? total = null,
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? slotType = freezed,
    Object? date = freezed,
  }) {
    return _then(
      _$ListSlotsResponseImpl(
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<DateSpecificSlotResponse>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotType: freezed == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ListSlotsResponseImpl implements _ListSlotsResponse {
  const _$ListSlotsResponseImpl({
    final List<DateSpecificSlotResponse> slots = const [],
    this.total = 0,
    @JsonKey(name: 'doctor_id') this.doctorId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'slot_type') this.slotType,
    this.date,
  }) : _slots = slots;

  factory _$ListSlotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListSlotsResponseImplFromJson(json);

  final List<DateSpecificSlotResponse> _slots;
  @override
  @JsonKey()
  List<DateSpecificSlotResponse> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'doctor_id')
  final String? doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'slot_type')
  final String? slotType;
  @override
  final String? date;

  @override
  String toString() {
    return 'ListSlotsResponse(slots: $slots, total: $total, doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSlotsResponseImpl &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_slots),
    total,
    doctorId,
    clinicId,
    slotType,
    date,
  );

  /// Create a copy of ListSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSlotsResponseImplCopyWith<_$ListSlotsResponseImpl> get copyWith =>
      __$$ListSlotsResponseImplCopyWithImpl<_$ListSlotsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ListSlotsResponseImplToJson(this);
  }
}

abstract class _ListSlotsResponse implements ListSlotsResponse {
  const factory _ListSlotsResponse({
    final List<DateSpecificSlotResponse> slots,
    final int total,
    @JsonKey(name: 'doctor_id') final String? doctorId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'slot_type') final String? slotType,
    final String? date,
  }) = _$ListSlotsResponseImpl;

  factory _ListSlotsResponse.fromJson(Map<String, dynamic> json) =
      _$ListSlotsResponseImpl.fromJson;

  @override
  List<DateSpecificSlotResponse> get slots;
  @override
  int get total;
  @override
  @JsonKey(name: 'doctor_id')
  String? get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'slot_type')
  String? get slotType;
  @override
  String? get date;

  /// Create a copy of ListSlotsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListSlotsResponseImplCopyWith<_$ListSlotsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
