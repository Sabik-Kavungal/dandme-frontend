// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/appointment_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppointmentHistoryItem _$AppointmentHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _AppointmentHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$AppointmentHistoryItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_date')
  String get appointmentDate => throw _privateConstructorUsedError; // DD/MM/YYYY format
  @JsonKey(name: 'appointment_time')
  String get appointmentTime => throw _privateConstructorUsedError; // HH:MM AM/PM format
  @JsonKey(name: 'consultation_type')
  String get consultationType => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount')
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_number')
  String get bookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppointmentHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentHistoryItemCopyWith<AppointmentHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentHistoryItemCopyWith<$Res> {
  factory $AppointmentHistoryItemCopyWith(
    AppointmentHistoryItem value,
    $Res Function(AppointmentHistoryItem) then,
  ) = _$AppointmentHistoryItemCopyWithImpl<$Res, AppointmentHistoryItem>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'appointment_time') String appointmentTime,
    @JsonKey(name: 'consultation_type') String consultationType,
    String? reason,
    String? notes,
    String status,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'booking_number') String bookingNumber,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$AppointmentHistoryItemCopyWithImpl<
  $Res,
  $Val extends AppointmentHistoryItem
>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  _$AppointmentHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? clinicPatientId = freezed,
    Object? appointmentDate = null,
    Object? appointmentTime = null,
    Object? consultationType = null,
    Object? reason = freezed,
    Object? notes = freezed,
    Object? status = null,
    Object? feeAmount = freezed,
    Object? paymentStatus = null,
    Object? bookingNumber = null,
    Object? createdAt = null,
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
            clinicPatientId: freezed == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentDate: null == appointmentDate
                ? _value.appointmentDate
                : appointmentDate // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentTime: null == appointmentTime
                ? _value.appointmentTime
                : appointmentTime // ignore: cast_nullable_to_non_nullable
                      as String,
            consultationType: null == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            feeAmount: freezed == feeAmount
                ? _value.feeAmount
                : feeAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            paymentStatus: null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            bookingNumber: null == bookingNumber
                ? _value.bookingNumber
                : bookingNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentHistoryItemImplCopyWith<$Res>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  factory _$$AppointmentHistoryItemImplCopyWith(
    _$AppointmentHistoryItemImpl value,
    $Res Function(_$AppointmentHistoryItemImpl) then,
  ) = __$$AppointmentHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'appointment_time') String appointmentTime,
    @JsonKey(name: 'consultation_type') String consultationType,
    String? reason,
    String? notes,
    String status,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'booking_number') String bookingNumber,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$AppointmentHistoryItemImplCopyWithImpl<$Res>
    extends
        _$AppointmentHistoryItemCopyWithImpl<$Res, _$AppointmentHistoryItemImpl>
    implements _$$AppointmentHistoryItemImplCopyWith<$Res> {
  __$$AppointmentHistoryItemImplCopyWithImpl(
    _$AppointmentHistoryItemImpl _value,
    $Res Function(_$AppointmentHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? clinicPatientId = freezed,
    Object? appointmentDate = null,
    Object? appointmentTime = null,
    Object? consultationType = null,
    Object? reason = freezed,
    Object? notes = freezed,
    Object? status = null,
    Object? feeAmount = freezed,
    Object? paymentStatus = null,
    Object? bookingNumber = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$AppointmentHistoryItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicPatientId: freezed == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentDate: null == appointmentDate
            ? _value.appointmentDate
            : appointmentDate // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentTime: null == appointmentTime
            ? _value.appointmentTime
            : appointmentTime // ignore: cast_nullable_to_non_nullable
                  as String,
        consultationType: null == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        feeAmount: freezed == feeAmount
            ? _value.feeAmount
            : feeAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        paymentStatus: null == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        bookingNumber: null == bookingNumber
            ? _value.bookingNumber
            : bookingNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentHistoryItemImpl implements _AppointmentHistoryItem {
  const _$AppointmentHistoryItemImpl({
    required this.id,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'clinic_patient_id') this.clinicPatientId,
    @JsonKey(name: 'appointment_date') required this.appointmentDate,
    @JsonKey(name: 'appointment_time') required this.appointmentTime,
    @JsonKey(name: 'consultation_type') required this.consultationType,
    this.reason,
    this.notes,
    required this.status,
    @JsonKey(name: 'fee_amount') this.feeAmount,
    @JsonKey(name: 'payment_status') required this.paymentStatus,
    @JsonKey(name: 'booking_number') required this.bookingNumber,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$AppointmentHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentHistoryItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String? clinicPatientId;
  @override
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  // DD/MM/YYYY format
  @override
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  // HH:MM AM/PM format
  @override
  @JsonKey(name: 'consultation_type')
  final String consultationType;
  @override
  final String? reason;
  @override
  final String? notes;
  @override
  final String status;
  @override
  @JsonKey(name: 'fee_amount')
  final double? feeAmount;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @JsonKey(name: 'booking_number')
  final String bookingNumber;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'AppointmentHistoryItem(id: $id, clinicId: $clinicId, clinicPatientId: $clinicPatientId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, consultationType: $consultationType, reason: $reason, notes: $notes, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.bookingNumber, bookingNumber) ||
                other.bookingNumber == bookingNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    clinicId,
    clinicPatientId,
    appointmentDate,
    appointmentTime,
    consultationType,
    reason,
    notes,
    status,
    feeAmount,
    paymentStatus,
    bookingNumber,
    createdAt,
  );

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentHistoryItemImplCopyWith<_$AppointmentHistoryItemImpl>
  get copyWith =>
      __$$AppointmentHistoryItemImplCopyWithImpl<_$AppointmentHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentHistoryItemImplToJson(this);
  }
}

abstract class _AppointmentHistoryItem implements AppointmentHistoryItem {
  const factory _AppointmentHistoryItem({
    required final String id,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'clinic_patient_id') final String? clinicPatientId,
    @JsonKey(name: 'appointment_date') required final String appointmentDate,
    @JsonKey(name: 'appointment_time') required final String appointmentTime,
    @JsonKey(name: 'consultation_type') required final String consultationType,
    final String? reason,
    final String? notes,
    required final String status,
    @JsonKey(name: 'fee_amount') final double? feeAmount,
    @JsonKey(name: 'payment_status') required final String paymentStatus,
    @JsonKey(name: 'booking_number') required final String bookingNumber,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$AppointmentHistoryItemImpl;

  factory _AppointmentHistoryItem.fromJson(Map<String, dynamic> json) =
      _$AppointmentHistoryItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId;
  @override
  @JsonKey(name: 'appointment_date')
  String get appointmentDate; // DD/MM/YYYY format
  @override
  @JsonKey(name: 'appointment_time')
  String get appointmentTime; // HH:MM AM/PM format
  @override
  @JsonKey(name: 'consultation_type')
  String get consultationType;
  @override
  String? get reason;
  @override
  String? get notes;
  @override
  String get status;
  @override
  @JsonKey(name: 'fee_amount')
  double? get feeAmount;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @JsonKey(name: 'booking_number')
  String get bookingNumber;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentHistoryItemImplCopyWith<_$AppointmentHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AppointmentHistoryResponse _$AppointmentHistoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AppointmentHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$AppointmentHistoryResponse {
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<AppointmentHistoryItem> get appointments =>
      throw _privateConstructorUsedError;

  /// Serializes this AppointmentHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentHistoryResponseCopyWith<AppointmentHistoryResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentHistoryResponseCopyWith<$Res> {
  factory $AppointmentHistoryResponseCopyWith(
    AppointmentHistoryResponse value,
    $Res Function(AppointmentHistoryResponse) then,
  ) =
      _$AppointmentHistoryResponseCopyWithImpl<
        $Res,
        AppointmentHistoryResponse
      >;
  @useResult
  $Res call({
    bool success,
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    int total,
    List<AppointmentHistoryItem> appointments,
  });
}

/// @nodoc
class _$AppointmentHistoryResponseCopyWithImpl<
  $Res,
  $Val extends AppointmentHistoryResponse
>
    implements $AppointmentHistoryResponseCopyWith<$Res> {
  _$AppointmentHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? clinicPatientId = null,
    Object? clinicId = freezed,
    Object? total = null,
    Object? appointments = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            clinicPatientId: null == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentHistoryItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentHistoryResponseImplCopyWith<$Res>
    implements $AppointmentHistoryResponseCopyWith<$Res> {
  factory _$$AppointmentHistoryResponseImplCopyWith(
    _$AppointmentHistoryResponseImpl value,
    $Res Function(_$AppointmentHistoryResponseImpl) then,
  ) = __$$AppointmentHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    int total,
    List<AppointmentHistoryItem> appointments,
  });
}

/// @nodoc
class __$$AppointmentHistoryResponseImplCopyWithImpl<$Res>
    extends
        _$AppointmentHistoryResponseCopyWithImpl<
          $Res,
          _$AppointmentHistoryResponseImpl
        >
    implements _$$AppointmentHistoryResponseImplCopyWith<$Res> {
  __$$AppointmentHistoryResponseImplCopyWithImpl(
    _$AppointmentHistoryResponseImpl _value,
    $Res Function(_$AppointmentHistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? clinicPatientId = null,
    Object? clinicId = freezed,
    Object? total = null,
    Object? appointments = null,
  }) {
    return _then(
      _$AppointmentHistoryResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        clinicPatientId: null == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentHistoryItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentHistoryResponseImpl implements _AppointmentHistoryResponse {
  const _$AppointmentHistoryResponseImpl({
    required this.success,
    @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    required this.total,
    required final List<AppointmentHistoryItem> appointments,
  }) : _appointments = appointments;

  factory _$AppointmentHistoryResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AppointmentHistoryResponseImplFromJson(json);

  @override
  final bool success;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  final int total;
  final List<AppointmentHistoryItem> _appointments;
  @override
  List<AppointmentHistoryItem> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  String toString() {
    return 'AppointmentHistoryResponse(success: $success, clinicPatientId: $clinicPatientId, clinicId: $clinicId, total: $total, appointments: $appointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentHistoryResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    clinicPatientId,
    clinicId,
    total,
    const DeepCollectionEquality().hash(_appointments),
  );

  /// Create a copy of AppointmentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentHistoryResponseImplCopyWith<_$AppointmentHistoryResponseImpl>
  get copyWith =>
      __$$AppointmentHistoryResponseImplCopyWithImpl<
        _$AppointmentHistoryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentHistoryResponseImplToJson(this);
  }
}

abstract class _AppointmentHistoryResponse
    implements AppointmentHistoryResponse {
  const factory _AppointmentHistoryResponse({
    required final bool success,
    @JsonKey(name: 'clinic_patient_id') required final String clinicPatientId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    required final int total,
    required final List<AppointmentHistoryItem> appointments,
  }) = _$AppointmentHistoryResponseImpl;

  factory _AppointmentHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$AppointmentHistoryResponseImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  int get total;
  @override
  List<AppointmentHistoryItem> get appointments;

  /// Create a copy of AppointmentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentHistoryResponseImplCopyWith<_$AppointmentHistoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
