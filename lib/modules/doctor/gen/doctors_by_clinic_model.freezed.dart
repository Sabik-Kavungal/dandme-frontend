// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctors_by_clinic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClinicInfoModel _$ClinicInfoModelFromJson(Map<String, dynamic> json) {
  return _ClinicInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ClinicInfoModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "clinic_code")
  String get clinicCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this ClinicInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicInfoModelCopyWith<ClinicInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicInfoModelCopyWith<$Res> {
  factory $ClinicInfoModelCopyWith(
    ClinicInfoModel value,
    $Res Function(ClinicInfoModel) then,
  ) = _$ClinicInfoModelCopyWithImpl<$Res, ClinicInfoModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "clinic_code") String clinicCode,
    String name,
    String address,
  });
}

/// @nodoc
class _$ClinicInfoModelCopyWithImpl<$Res, $Val extends ClinicInfoModel>
    implements $ClinicInfoModelCopyWith<$Res> {
  _$ClinicInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicCode = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicCode: null == clinicCode
                ? _value.clinicCode
                : clinicCode // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicInfoModelImplCopyWith<$Res>
    implements $ClinicInfoModelCopyWith<$Res> {
  factory _$$ClinicInfoModelImplCopyWith(
    _$ClinicInfoModelImpl value,
    $Res Function(_$ClinicInfoModelImpl) then,
  ) = __$$ClinicInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "clinic_code") String clinicCode,
    String name,
    String address,
  });
}

/// @nodoc
class __$$ClinicInfoModelImplCopyWithImpl<$Res>
    extends _$ClinicInfoModelCopyWithImpl<$Res, _$ClinicInfoModelImpl>
    implements _$$ClinicInfoModelImplCopyWith<$Res> {
  __$$ClinicInfoModelImplCopyWithImpl(
    _$ClinicInfoModelImpl _value,
    $Res Function(_$ClinicInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicCode = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(
      _$ClinicInfoModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicCode: null == clinicCode
            ? _value.clinicCode
            : clinicCode // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicInfoModelImpl implements _ClinicInfoModel {
  const _$ClinicInfoModelImpl({
    required this.id,
    @JsonKey(name: "clinic_code") required this.clinicCode,
    required this.name,
    required this.address,
  });

  factory _$ClinicInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicInfoModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "clinic_code")
  final String clinicCode;
  @override
  final String name;
  @override
  final String address;

  @override
  String toString() {
    return 'ClinicInfoModel(id: $id, clinicCode: $clinicCode, name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicCode, clinicCode) ||
                other.clinicCode == clinicCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, clinicCode, name, address);

  /// Create a copy of ClinicInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicInfoModelImplCopyWith<_$ClinicInfoModelImpl> get copyWith =>
      __$$ClinicInfoModelImplCopyWithImpl<_$ClinicInfoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicInfoModelImplToJson(this);
  }
}

abstract class _ClinicInfoModel implements ClinicInfoModel {
  const factory _ClinicInfoModel({
    required final String id,
    @JsonKey(name: "clinic_code") required final String clinicCode,
    required final String name,
    required final String address,
  }) = _$ClinicInfoModelImpl;

  factory _ClinicInfoModel.fromJson(Map<String, dynamic> json) =
      _$ClinicInfoModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "clinic_code")
  String get clinicCode;
  @override
  String get name;
  @override
  String get address;

  /// Create a copy of ClinicInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicInfoModelImplCopyWith<_$ClinicInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorInClinicModel _$DoctorInClinicModelFromJson(Map<String, dynamic> json) {
  return _DoctorInClinicModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorInClinicModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_code")
  String get doctorCode => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "is_main_doctor")
  bool get isMainDoctor => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DoctorInClinicModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorInClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorInClinicModelCopyWith<DoctorInClinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorInClinicModelCopyWith<$Res> {
  factory $DoctorInClinicModelCopyWith(
    DoctorInClinicModel value,
    $Res Function(DoctorInClinicModel) then,
  ) = _$DoctorInClinicModelCopyWithImpl<$Res, DoctorInClinicModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "user_id") String userId,
    @JsonKey(name: "doctor_code") String doctorCode,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String email,
    String phone,
    String specialization,
    @JsonKey(name: "license_number") String licenseNumber,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "is_main_doctor") bool isMainDoctor,
    @JsonKey(name: "created_at") String? createdAt,
  });
}

/// @nodoc
class _$DoctorInClinicModelCopyWithImpl<$Res, $Val extends DoctorInClinicModel>
    implements $DoctorInClinicModelCopyWith<$Res> {
  _$DoctorInClinicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorInClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? doctorCode = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? specialization = null,
    Object? licenseNumber = null,
    Object? isActive = null,
    Object? isMainDoctor = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorCode: null == doctorCode
                ? _value.doctorCode
                : doctorCode // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            specialization: null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String,
            licenseNumber: null == licenseNumber
                ? _value.licenseNumber
                : licenseNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMainDoctor: null == isMainDoctor
                ? _value.isMainDoctor
                : isMainDoctor // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorInClinicModelImplCopyWith<$Res>
    implements $DoctorInClinicModelCopyWith<$Res> {
  factory _$$DoctorInClinicModelImplCopyWith(
    _$DoctorInClinicModelImpl value,
    $Res Function(_$DoctorInClinicModelImpl) then,
  ) = __$$DoctorInClinicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "user_id") String userId,
    @JsonKey(name: "doctor_code") String doctorCode,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String email,
    String phone,
    String specialization,
    @JsonKey(name: "license_number") String licenseNumber,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "is_main_doctor") bool isMainDoctor,
    @JsonKey(name: "created_at") String? createdAt,
  });
}

/// @nodoc
class __$$DoctorInClinicModelImplCopyWithImpl<$Res>
    extends _$DoctorInClinicModelCopyWithImpl<$Res, _$DoctorInClinicModelImpl>
    implements _$$DoctorInClinicModelImplCopyWith<$Res> {
  __$$DoctorInClinicModelImplCopyWithImpl(
    _$DoctorInClinicModelImpl _value,
    $Res Function(_$DoctorInClinicModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorInClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? doctorCode = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? specialization = null,
    Object? licenseNumber = null,
    Object? isActive = null,
    Object? isMainDoctor = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$DoctorInClinicModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorCode: null == doctorCode
            ? _value.doctorCode
            : doctorCode // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        specialization: null == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String,
        licenseNumber: null == licenseNumber
            ? _value.licenseNumber
            : licenseNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMainDoctor: null == isMainDoctor
            ? _value.isMainDoctor
            : isMainDoctor // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorInClinicModelImpl implements _DoctorInClinicModel {
  const _$DoctorInClinicModelImpl({
    required this.id,
    @JsonKey(name: "user_id") required this.userId,
    @JsonKey(name: "doctor_code") required this.doctorCode,
    @JsonKey(name: "first_name") required this.firstName,
    @JsonKey(name: "last_name") required this.lastName,
    required this.email,
    required this.phone,
    required this.specialization,
    @JsonKey(name: "license_number") required this.licenseNumber,
    @JsonKey(name: "is_active") this.isActive = true,
    @JsonKey(name: "is_main_doctor") this.isMainDoctor = false,
    @JsonKey(name: "created_at") this.createdAt,
  });

  factory _$DoctorInClinicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorInClinicModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "doctor_code")
  final String doctorCode;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String specialization;
  @override
  @JsonKey(name: "license_number")
  final String licenseNumber;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  @override
  @JsonKey(name: "is_main_doctor")
  final bool isMainDoctor;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;

  @override
  String toString() {
    return 'DoctorInClinicModel(id: $id, userId: $userId, doctorCode: $doctorCode, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, specialization: $specialization, licenseNumber: $licenseNumber, isActive: $isActive, isMainDoctor: $isMainDoctor, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorInClinicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.doctorCode, doctorCode) ||
                other.doctorCode == doctorCode) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isMainDoctor, isMainDoctor) ||
                other.isMainDoctor == isMainDoctor) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    doctorCode,
    firstName,
    lastName,
    email,
    phone,
    specialization,
    licenseNumber,
    isActive,
    isMainDoctor,
    createdAt,
  );

  /// Create a copy of DoctorInClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorInClinicModelImplCopyWith<_$DoctorInClinicModelImpl> get copyWith =>
      __$$DoctorInClinicModelImplCopyWithImpl<_$DoctorInClinicModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorInClinicModelImplToJson(this);
  }
}

abstract class _DoctorInClinicModel implements DoctorInClinicModel {
  const factory _DoctorInClinicModel({
    required final String id,
    @JsonKey(name: "user_id") required final String userId,
    @JsonKey(name: "doctor_code") required final String doctorCode,
    @JsonKey(name: "first_name") required final String firstName,
    @JsonKey(name: "last_name") required final String lastName,
    required final String email,
    required final String phone,
    required final String specialization,
    @JsonKey(name: "license_number") required final String licenseNumber,
    @JsonKey(name: "is_active") final bool isActive,
    @JsonKey(name: "is_main_doctor") final bool isMainDoctor,
    @JsonKey(name: "created_at") final String? createdAt,
  }) = _$DoctorInClinicModelImpl;

  factory _DoctorInClinicModel.fromJson(Map<String, dynamic> json) =
      _$DoctorInClinicModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "doctor_code")
  String get doctorCode;
  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get specialization;
  @override
  @JsonKey(name: "license_number")
  String get licenseNumber;
  @override
  @JsonKey(name: "is_active")
  bool get isActive;
  @override
  @JsonKey(name: "is_main_doctor")
  bool get isMainDoctor;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;

  /// Create a copy of DoctorInClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorInClinicModelImplCopyWith<_$DoctorInClinicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorsByClinicResponse _$DoctorsByClinicResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DoctorsByClinicResponse.fromJson(json);
}

/// @nodoc
mixin _$DoctorsByClinicResponse {
  ClinicInfoModel get clinic => throw _privateConstructorUsedError;
  List<DoctorInClinicModel> get doctors => throw _privateConstructorUsedError;
  @JsonKey(name: "total_count")
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this DoctorsByClinicResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorsByClinicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorsByClinicResponseCopyWith<DoctorsByClinicResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorsByClinicResponseCopyWith<$Res> {
  factory $DoctorsByClinicResponseCopyWith(
    DoctorsByClinicResponse value,
    $Res Function(DoctorsByClinicResponse) then,
  ) = _$DoctorsByClinicResponseCopyWithImpl<$Res, DoctorsByClinicResponse>;
  @useResult
  $Res call({
    ClinicInfoModel clinic,
    List<DoctorInClinicModel> doctors,
    @JsonKey(name: "total_count") int totalCount,
  });

  $ClinicInfoModelCopyWith<$Res> get clinic;
}

/// @nodoc
class _$DoctorsByClinicResponseCopyWithImpl<
  $Res,
  $Val extends DoctorsByClinicResponse
>
    implements $DoctorsByClinicResponseCopyWith<$Res> {
  _$DoctorsByClinicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorsByClinicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinic = null,
    Object? doctors = null,
    Object? totalCount = null,
  }) {
    return _then(
      _value.copyWith(
            clinic: null == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as ClinicInfoModel,
            doctors: null == doctors
                ? _value.doctors
                : doctors // ignore: cast_nullable_to_non_nullable
                      as List<DoctorInClinicModel>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of DoctorsByClinicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicInfoModelCopyWith<$Res> get clinic {
    return $ClinicInfoModelCopyWith<$Res>(_value.clinic, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorsByClinicResponseImplCopyWith<$Res>
    implements $DoctorsByClinicResponseCopyWith<$Res> {
  factory _$$DoctorsByClinicResponseImplCopyWith(
    _$DoctorsByClinicResponseImpl value,
    $Res Function(_$DoctorsByClinicResponseImpl) then,
  ) = __$$DoctorsByClinicResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ClinicInfoModel clinic,
    List<DoctorInClinicModel> doctors,
    @JsonKey(name: "total_count") int totalCount,
  });

  @override
  $ClinicInfoModelCopyWith<$Res> get clinic;
}

/// @nodoc
class __$$DoctorsByClinicResponseImplCopyWithImpl<$Res>
    extends
        _$DoctorsByClinicResponseCopyWithImpl<
          $Res,
          _$DoctorsByClinicResponseImpl
        >
    implements _$$DoctorsByClinicResponseImplCopyWith<$Res> {
  __$$DoctorsByClinicResponseImplCopyWithImpl(
    _$DoctorsByClinicResponseImpl _value,
    $Res Function(_$DoctorsByClinicResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorsByClinicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinic = null,
    Object? doctors = null,
    Object? totalCount = null,
  }) {
    return _then(
      _$DoctorsByClinicResponseImpl(
        clinic: null == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as ClinicInfoModel,
        doctors: null == doctors
            ? _value._doctors
            : doctors // ignore: cast_nullable_to_non_nullable
                  as List<DoctorInClinicModel>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorsByClinicResponseImpl implements _DoctorsByClinicResponse {
  const _$DoctorsByClinicResponseImpl({
    required this.clinic,
    required final List<DoctorInClinicModel> doctors,
    @JsonKey(name: "total_count") required this.totalCount,
  }) : _doctors = doctors;

  factory _$DoctorsByClinicResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorsByClinicResponseImplFromJson(json);

  @override
  final ClinicInfoModel clinic;
  final List<DoctorInClinicModel> _doctors;
  @override
  List<DoctorInClinicModel> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey(name: "total_count")
  final int totalCount;

  @override
  String toString() {
    return 'DoctorsByClinicResponse(clinic: $clinic, doctors: $doctors, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorsByClinicResponseImpl &&
            (identical(other.clinic, clinic) || other.clinic == clinic) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinic,
    const DeepCollectionEquality().hash(_doctors),
    totalCount,
  );

  /// Create a copy of DoctorsByClinicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorsByClinicResponseImplCopyWith<_$DoctorsByClinicResponseImpl>
  get copyWith =>
      __$$DoctorsByClinicResponseImplCopyWithImpl<
        _$DoctorsByClinicResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorsByClinicResponseImplToJson(this);
  }
}

abstract class _DoctorsByClinicResponse implements DoctorsByClinicResponse {
  const factory _DoctorsByClinicResponse({
    required final ClinicInfoModel clinic,
    required final List<DoctorInClinicModel> doctors,
    @JsonKey(name: "total_count") required final int totalCount,
  }) = _$DoctorsByClinicResponseImpl;

  factory _DoctorsByClinicResponse.fromJson(Map<String, dynamic> json) =
      _$DoctorsByClinicResponseImpl.fromJson;

  @override
  ClinicInfoModel get clinic;
  @override
  List<DoctorInClinicModel> get doctors;
  @override
  @JsonKey(name: "total_count")
  int get totalCount;

  /// Create a copy of DoctorsByClinicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorsByClinicResponseImplCopyWith<_$DoctorsByClinicResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
