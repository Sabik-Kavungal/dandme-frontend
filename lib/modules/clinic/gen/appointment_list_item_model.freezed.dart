// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/appointment_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppointmentListItem _$AppointmentListItemFromJson(Map<String, dynamic> json) {
  return _AppointmentListItem.fromJson(json);
}

/// @nodoc
mixin _$AppointmentListItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int? get tokenNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'mo_id')
  String? get moId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_name')
  String get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String get doctorName => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'consultation_type')
  String get consultationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_date_time')
  String get appointmentDateTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_status')
  String get feeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount')
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_number')
  String get bookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppointmentListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentListItemCopyWith<AppointmentListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentListItemCopyWith<$Res> {
  factory $AppointmentListItemCopyWith(
    AppointmentListItem value,
    $Res Function(AppointmentListItem) then,
  ) = _$AppointmentListItemCopyWithImpl<$Res, AppointmentListItem>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'token_number') int? tokenNumber,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'patient_name') String patientName,
    @JsonKey(name: 'doctor_name') String doctorName,
    String? department,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'consultation_type') String consultationType,
    @JsonKey(name: 'appointment_date_time') String appointmentDateTime,
    String status,
    @JsonKey(name: 'fee_status') String feeStatus,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'booking_number') String bookingNumber,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$AppointmentListItemCopyWithImpl<$Res, $Val extends AppointmentListItem>
    implements $AppointmentListItemCopyWith<$Res> {
  _$AppointmentListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tokenNumber = freezed,
    Object? moId = freezed,
    Object? patientName = null,
    Object? doctorName = null,
    Object? department = freezed,
    Object? clinicPatientId = freezed,
    Object? consultationType = null,
    Object? appointmentDateTime = null,
    Object? status = null,
    Object? feeStatus = null,
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
            tokenNumber: freezed == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            moId: freezed == moId
                ? _value.moId
                : moId // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientName: null == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicPatientId: freezed == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationType: null == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentDateTime: null == appointmentDateTime
                ? _value.appointmentDateTime
                : appointmentDateTime // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            feeStatus: null == feeStatus
                ? _value.feeStatus
                : feeStatus // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AppointmentListItemImplCopyWith<$Res>
    implements $AppointmentListItemCopyWith<$Res> {
  factory _$$AppointmentListItemImplCopyWith(
    _$AppointmentListItemImpl value,
    $Res Function(_$AppointmentListItemImpl) then,
  ) = __$$AppointmentListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'token_number') int? tokenNumber,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'patient_name') String patientName,
    @JsonKey(name: 'doctor_name') String doctorName,
    String? department,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'consultation_type') String consultationType,
    @JsonKey(name: 'appointment_date_time') String appointmentDateTime,
    String status,
    @JsonKey(name: 'fee_status') String feeStatus,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'booking_number') String bookingNumber,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$AppointmentListItemImplCopyWithImpl<$Res>
    extends _$AppointmentListItemCopyWithImpl<$Res, _$AppointmentListItemImpl>
    implements _$$AppointmentListItemImplCopyWith<$Res> {
  __$$AppointmentListItemImplCopyWithImpl(
    _$AppointmentListItemImpl _value,
    $Res Function(_$AppointmentListItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tokenNumber = freezed,
    Object? moId = freezed,
    Object? patientName = null,
    Object? doctorName = null,
    Object? department = freezed,
    Object? clinicPatientId = freezed,
    Object? consultationType = null,
    Object? appointmentDateTime = null,
    Object? status = null,
    Object? feeStatus = null,
    Object? feeAmount = freezed,
    Object? paymentStatus = null,
    Object? bookingNumber = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$AppointmentListItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenNumber: freezed == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        moId: freezed == moId
            ? _value.moId
            : moId // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientName: null == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicPatientId: freezed == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationType: null == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentDateTime: null == appointmentDateTime
            ? _value.appointmentDateTime
            : appointmentDateTime // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        feeStatus: null == feeStatus
            ? _value.feeStatus
            : feeStatus // ignore: cast_nullable_to_non_nullable
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
class _$AppointmentListItemImpl implements _AppointmentListItem {
  const _$AppointmentListItemImpl({
    required this.id,
    @JsonKey(name: 'token_number') this.tokenNumber,
    @JsonKey(name: 'mo_id') this.moId,
    @JsonKey(name: 'patient_name') required this.patientName,
    @JsonKey(name: 'doctor_name') required this.doctorName,
    this.department,
    @JsonKey(name: 'clinic_patient_id') this.clinicPatientId,
    @JsonKey(name: 'consultation_type') required this.consultationType,
    @JsonKey(name: 'appointment_date_time') required this.appointmentDateTime,
    required this.status,
    @JsonKey(name: 'fee_status') required this.feeStatus,
    @JsonKey(name: 'fee_amount') this.feeAmount,
    @JsonKey(name: 'payment_status') required this.paymentStatus,
    @JsonKey(name: 'booking_number') required this.bookingNumber,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$AppointmentListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentListItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'token_number')
  final int? tokenNumber;
  @override
  @JsonKey(name: 'mo_id')
  final String? moId;
  @override
  @JsonKey(name: 'patient_name')
  final String patientName;
  @override
  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @override
  final String? department;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String? clinicPatientId;
  @override
  @JsonKey(name: 'consultation_type')
  final String consultationType;
  @override
  @JsonKey(name: 'appointment_date_time')
  final String appointmentDateTime;
  @override
  final String status;
  @override
  @JsonKey(name: 'fee_status')
  final String feeStatus;
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
    return 'AppointmentListItem(id: $id, tokenNumber: $tokenNumber, moId: $moId, patientName: $patientName, doctorName: $doctorName, department: $department, clinicPatientId: $clinicPatientId, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, status: $status, feeStatus: $feeStatus, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.moId, moId) || other.moId == moId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.appointmentDateTime, appointmentDateTime) ||
                other.appointmentDateTime == appointmentDateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeStatus, feeStatus) ||
                other.feeStatus == feeStatus) &&
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
    tokenNumber,
    moId,
    patientName,
    doctorName,
    department,
    clinicPatientId,
    consultationType,
    appointmentDateTime,
    status,
    feeStatus,
    feeAmount,
    paymentStatus,
    bookingNumber,
    createdAt,
  );

  /// Create a copy of AppointmentListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentListItemImplCopyWith<_$AppointmentListItemImpl> get copyWith =>
      __$$AppointmentListItemImplCopyWithImpl<_$AppointmentListItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentListItemImplToJson(this);
  }
}

abstract class _AppointmentListItem implements AppointmentListItem {
  const factory _AppointmentListItem({
    required final String id,
    @JsonKey(name: 'token_number') final int? tokenNumber,
    @JsonKey(name: 'mo_id') final String? moId,
    @JsonKey(name: 'patient_name') required final String patientName,
    @JsonKey(name: 'doctor_name') required final String doctorName,
    final String? department,
    @JsonKey(name: 'clinic_patient_id') final String? clinicPatientId,
    @JsonKey(name: 'consultation_type') required final String consultationType,
    @JsonKey(name: 'appointment_date_time')
    required final String appointmentDateTime,
    required final String status,
    @JsonKey(name: 'fee_status') required final String feeStatus,
    @JsonKey(name: 'fee_amount') final double? feeAmount,
    @JsonKey(name: 'payment_status') required final String paymentStatus,
    @JsonKey(name: 'booking_number') required final String bookingNumber,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$AppointmentListItemImpl;

  factory _AppointmentListItem.fromJson(Map<String, dynamic> json) =
      _$AppointmentListItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'token_number')
  int? get tokenNumber;
  @override
  @JsonKey(name: 'mo_id')
  String? get moId;
  @override
  @JsonKey(name: 'patient_name')
  String get patientName;
  @override
  @JsonKey(name: 'doctor_name')
  String get doctorName;
  @override
  String? get department;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId;
  @override
  @JsonKey(name: 'consultation_type')
  String get consultationType;
  @override
  @JsonKey(name: 'appointment_date_time')
  String get appointmentDateTime;
  @override
  String get status;
  @override
  @JsonKey(name: 'fee_status')
  String get feeStatus;
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

  /// Create a copy of AppointmentListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentListItemImplCopyWith<_$AppointmentListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleAppointmentListResponse _$SimpleAppointmentListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SimpleAppointmentListResponse.fromJson(json);
}

/// @nodoc
mixin _$SimpleAppointmentListResponse {
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<AppointmentListItem> get appointments =>
      throw _privateConstructorUsedError;

  /// Serializes this SimpleAppointmentListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleAppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleAppointmentListResponseCopyWith<SimpleAppointmentListResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleAppointmentListResponseCopyWith<$Res> {
  factory $SimpleAppointmentListResponseCopyWith(
    SimpleAppointmentListResponse value,
    $Res Function(SimpleAppointmentListResponse) then,
  ) =
      _$SimpleAppointmentListResponseCopyWithImpl<
        $Res,
        SimpleAppointmentListResponse
      >;
  @useResult
  $Res call({
    bool success,
    @JsonKey(name: 'clinic_id') String clinicId,
    String? date,
    int total,
    List<AppointmentListItem> appointments,
  });
}

/// @nodoc
class _$SimpleAppointmentListResponseCopyWithImpl<
  $Res,
  $Val extends SimpleAppointmentListResponse
>
    implements $SimpleAppointmentListResponseCopyWith<$Res> {
  _$SimpleAppointmentListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleAppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? clinicId = null,
    Object? date = freezed,
    Object? total = null,
    Object? appointments = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentListItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleAppointmentListResponseImplCopyWith<$Res>
    implements $SimpleAppointmentListResponseCopyWith<$Res> {
  factory _$$SimpleAppointmentListResponseImplCopyWith(
    _$SimpleAppointmentListResponseImpl value,
    $Res Function(_$SimpleAppointmentListResponseImpl) then,
  ) = __$$SimpleAppointmentListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    @JsonKey(name: 'clinic_id') String clinicId,
    String? date,
    int total,
    List<AppointmentListItem> appointments,
  });
}

/// @nodoc
class __$$SimpleAppointmentListResponseImplCopyWithImpl<$Res>
    extends
        _$SimpleAppointmentListResponseCopyWithImpl<
          $Res,
          _$SimpleAppointmentListResponseImpl
        >
    implements _$$SimpleAppointmentListResponseImplCopyWith<$Res> {
  __$$SimpleAppointmentListResponseImplCopyWithImpl(
    _$SimpleAppointmentListResponseImpl _value,
    $Res Function(_$SimpleAppointmentListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleAppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? clinicId = null,
    Object? date = freezed,
    Object? total = null,
    Object? appointments = null,
  }) {
    return _then(
      _$SimpleAppointmentListResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentListItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleAppointmentListResponseImpl
    implements _SimpleAppointmentListResponse {
  const _$SimpleAppointmentListResponseImpl({
    required this.success,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    this.date,
    required this.total,
    required final List<AppointmentListItem> appointments,
  }) : _appointments = appointments;

  factory _$SimpleAppointmentListResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SimpleAppointmentListResponseImplFromJson(json);

  @override
  final bool success;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  final String? date;
  @override
  final int total;
  final List<AppointmentListItem> _appointments;
  @override
  List<AppointmentListItem> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  String toString() {
    return 'SimpleAppointmentListResponse(success: $success, clinicId: $clinicId, date: $date, total: $total, appointments: $appointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleAppointmentListResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.date, date) || other.date == date) &&
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
    clinicId,
    date,
    total,
    const DeepCollectionEquality().hash(_appointments),
  );

  /// Create a copy of SimpleAppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleAppointmentListResponseImplCopyWith<
    _$SimpleAppointmentListResponseImpl
  >
  get copyWith =>
      __$$SimpleAppointmentListResponseImplCopyWithImpl<
        _$SimpleAppointmentListResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleAppointmentListResponseImplToJson(this);
  }
}

abstract class _SimpleAppointmentListResponse
    implements SimpleAppointmentListResponse {
  const factory _SimpleAppointmentListResponse({
    required final bool success,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    final String? date,
    required final int total,
    required final List<AppointmentListItem> appointments,
  }) = _$SimpleAppointmentListResponseImpl;

  factory _SimpleAppointmentListResponse.fromJson(Map<String, dynamic> json) =
      _$SimpleAppointmentListResponseImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  String? get date;
  @override
  int get total;
  @override
  List<AppointmentListItem> get appointments;

  /// Create a copy of SimpleAppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleAppointmentListResponseImplCopyWith<
    _$SimpleAppointmentListResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
