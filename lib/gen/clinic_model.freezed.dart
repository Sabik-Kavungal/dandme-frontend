// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClinicModel _$ClinicModelFromJson(Map<String, dynamic> json) {
  return _ClinicModel.fromJson(json);
}

/// @nodoc
mixin _$ClinicModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_code')
  String get clinicCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError; // Admin details - these are optional for display, required for creation
  @JsonKey(name: 'admin_first_name')
  String? get adminFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_last_name')
  String? get adminLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_email')
  String? get adminEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_username')
  String? get adminUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_phone')
  String? get adminPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_password')
  String? get adminPassword => throw _privateConstructorUsedError;

  /// Serializes this ClinicModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicModelCopyWith<ClinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicModelCopyWith<$Res> {
  factory $ClinicModelCopyWith(
    ClinicModel value,
    $Res Function(ClinicModel) then,
  ) = _$ClinicModelCopyWithImpl<$Res, ClinicModel>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'organization_id') String organizationId,
    @JsonKey(name: 'clinic_code') String clinicCode,
    String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'admin_first_name') String? adminFirstName,
    @JsonKey(name: 'admin_last_name') String? adminLastName,
    @JsonKey(name: 'admin_email') String? adminEmail,
    @JsonKey(name: 'admin_username') String? adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String? adminPassword,
  });
}

/// @nodoc
class _$ClinicModelCopyWithImpl<$Res, $Val extends ClinicModel>
    implements $ClinicModelCopyWith<$Res> {
  _$ClinicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? organizationId = null,
    Object? clinicCode = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? licenseNumber = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? adminFirstName = freezed,
    Object? adminLastName = freezed,
    Object? adminEmail = freezed,
    Object? adminUsername = freezed,
    Object? adminPhone = freezed,
    Object? adminPassword = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            organizationId: null == organizationId
                ? _value.organizationId
                : organizationId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicCode: null == clinicCode
                ? _value.clinicCode
                : clinicCode // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            licenseNumber: freezed == licenseNumber
                ? _value.licenseNumber
                : licenseNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminFirstName: freezed == adminFirstName
                ? _value.adminFirstName
                : adminFirstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminLastName: freezed == adminLastName
                ? _value.adminLastName
                : adminLastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminEmail: freezed == adminEmail
                ? _value.adminEmail
                : adminEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminUsername: freezed == adminUsername
                ? _value.adminUsername
                : adminUsername // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminPhone: freezed == adminPhone
                ? _value.adminPhone
                : adminPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminPassword: freezed == adminPassword
                ? _value.adminPassword
                : adminPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicModelImplCopyWith<$Res>
    implements $ClinicModelCopyWith<$Res> {
  factory _$$ClinicModelImplCopyWith(
    _$ClinicModelImpl value,
    $Res Function(_$ClinicModelImpl) then,
  ) = __$$ClinicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'organization_id') String organizationId,
    @JsonKey(name: 'clinic_code') String clinicCode,
    String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'admin_first_name') String? adminFirstName,
    @JsonKey(name: 'admin_last_name') String? adminLastName,
    @JsonKey(name: 'admin_email') String? adminEmail,
    @JsonKey(name: 'admin_username') String? adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String? adminPassword,
  });
}

/// @nodoc
class __$$ClinicModelImplCopyWithImpl<$Res>
    extends _$ClinicModelCopyWithImpl<$Res, _$ClinicModelImpl>
    implements _$$ClinicModelImplCopyWith<$Res> {
  __$$ClinicModelImplCopyWithImpl(
    _$ClinicModelImpl _value,
    $Res Function(_$ClinicModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? organizationId = null,
    Object? clinicCode = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? licenseNumber = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? adminFirstName = freezed,
    Object? adminLastName = freezed,
    Object? adminEmail = freezed,
    Object? adminUsername = freezed,
    Object? adminPhone = freezed,
    Object? adminPassword = freezed,
  }) {
    return _then(
      _$ClinicModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationId: null == organizationId
            ? _value.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicCode: null == clinicCode
            ? _value.clinicCode
            : clinicCode // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        licenseNumber: freezed == licenseNumber
            ? _value.licenseNumber
            : licenseNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminFirstName: freezed == adminFirstName
            ? _value.adminFirstName
            : adminFirstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminLastName: freezed == adminLastName
            ? _value.adminLastName
            : adminLastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminEmail: freezed == adminEmail
            ? _value.adminEmail
            : adminEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminUsername: freezed == adminUsername
            ? _value.adminUsername
            : adminUsername // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminPhone: freezed == adminPhone
            ? _value.adminPhone
            : adminPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminPassword: freezed == adminPassword
            ? _value.adminPassword
            : adminPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicModelImpl implements _ClinicModel {
  const _$ClinicModelImpl({
    this.id,
    @JsonKey(name: 'organization_id') required this.organizationId,
    @JsonKey(name: 'clinic_code') required this.clinicCode,
    required this.name,
    this.email,
    this.phone,
    this.address,
    @JsonKey(name: 'license_number') this.licenseNumber,
    @JsonKey(name: 'is_active') this.isActive,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'admin_first_name') this.adminFirstName,
    @JsonKey(name: 'admin_last_name') this.adminLastName,
    @JsonKey(name: 'admin_email') this.adminEmail,
    @JsonKey(name: 'admin_username') this.adminUsername,
    @JsonKey(name: 'admin_phone') this.adminPhone,
    @JsonKey(name: 'admin_password') this.adminPassword,
  });

  factory _$ClinicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'clinic_code')
  final String clinicCode;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  @JsonKey(name: 'license_number')
  final String? licenseNumber;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  // Admin details - these are optional for display, required for creation
  @override
  @JsonKey(name: 'admin_first_name')
  final String? adminFirstName;
  @override
  @JsonKey(name: 'admin_last_name')
  final String? adminLastName;
  @override
  @JsonKey(name: 'admin_email')
  final String? adminEmail;
  @override
  @JsonKey(name: 'admin_username')
  final String? adminUsername;
  @override
  @JsonKey(name: 'admin_phone')
  final String? adminPhone;
  @override
  @JsonKey(name: 'admin_password')
  final String? adminPassword;

  @override
  String toString() {
    return 'ClinicModel(id: $id, organizationId: $organizationId, clinicCode: $clinicCode, name: $name, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, isActive: $isActive, createdAt: $createdAt, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.clinicCode, clinicCode) ||
                other.clinicCode == clinicCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.adminFirstName, adminFirstName) ||
                other.adminFirstName == adminFirstName) &&
            (identical(other.adminLastName, adminLastName) ||
                other.adminLastName == adminLastName) &&
            (identical(other.adminEmail, adminEmail) ||
                other.adminEmail == adminEmail) &&
            (identical(other.adminUsername, adminUsername) ||
                other.adminUsername == adminUsername) &&
            (identical(other.adminPhone, adminPhone) ||
                other.adminPhone == adminPhone) &&
            (identical(other.adminPassword, adminPassword) ||
                other.adminPassword == adminPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    clinicCode,
    name,
    email,
    phone,
    address,
    licenseNumber,
    isActive,
    createdAt,
    adminFirstName,
    adminLastName,
    adminEmail,
    adminUsername,
    adminPhone,
    adminPassword,
  );

  /// Create a copy of ClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicModelImplCopyWith<_$ClinicModelImpl> get copyWith =>
      __$$ClinicModelImplCopyWithImpl<_$ClinicModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicModelImplToJson(this);
  }
}

abstract class _ClinicModel implements ClinicModel {
  const factory _ClinicModel({
    final String? id,
    @JsonKey(name: 'organization_id') required final String organizationId,
    @JsonKey(name: 'clinic_code') required final String clinicCode,
    required final String name,
    final String? email,
    final String? phone,
    final String? address,
    @JsonKey(name: 'license_number') final String? licenseNumber,
    @JsonKey(name: 'is_active') final bool? isActive,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'admin_first_name') final String? adminFirstName,
    @JsonKey(name: 'admin_last_name') final String? adminLastName,
    @JsonKey(name: 'admin_email') final String? adminEmail,
    @JsonKey(name: 'admin_username') final String? adminUsername,
    @JsonKey(name: 'admin_phone') final String? adminPhone,
    @JsonKey(name: 'admin_password') final String? adminPassword,
  }) = _$ClinicModelImpl;

  factory _ClinicModel.fromJson(Map<String, dynamic> json) =
      _$ClinicModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'clinic_code')
  String get clinicCode;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  @JsonKey(name: 'license_number')
  String? get licenseNumber;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt; // Admin details - these are optional for display, required for creation
  @override
  @JsonKey(name: 'admin_first_name')
  String? get adminFirstName;
  @override
  @JsonKey(name: 'admin_last_name')
  String? get adminLastName;
  @override
  @JsonKey(name: 'admin_email')
  String? get adminEmail;
  @override
  @JsonKey(name: 'admin_username')
  String? get adminUsername;
  @override
  @JsonKey(name: 'admin_phone')
  String? get adminPhone;
  @override
  @JsonKey(name: 'admin_password')
  String? get adminPassword;

  /// Create a copy of ClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicModelImplCopyWith<_$ClinicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateClinicModel _$CreateClinicModelFromJson(Map<String, dynamic> json) {
  return _CreateClinicModel.fromJson(json);
}

/// @nodoc
mixin _$CreateClinicModel {
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_code')
  String get clinicCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String? get licenseNumber => throw _privateConstructorUsedError; // Admin details - required for creation
  @JsonKey(name: 'admin_first_name')
  String get adminFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_last_name')
  String get adminLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_email')
  String get adminEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_username')
  String get adminUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_phone')
  String? get adminPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_password')
  String get adminPassword => throw _privateConstructorUsedError;

  /// Serializes this CreateClinicModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateClinicModelCopyWith<CreateClinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateClinicModelCopyWith<$Res> {
  factory $CreateClinicModelCopyWith(
    CreateClinicModel value,
    $Res Function(CreateClinicModel) then,
  ) = _$CreateClinicModelCopyWithImpl<$Res, CreateClinicModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'organization_id') String organizationId,
    @JsonKey(name: 'clinic_code') String clinicCode,
    String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'admin_first_name') String adminFirstName,
    @JsonKey(name: 'admin_last_name') String adminLastName,
    @JsonKey(name: 'admin_email') String adminEmail,
    @JsonKey(name: 'admin_username') String adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String adminPassword,
  });
}

/// @nodoc
class _$CreateClinicModelCopyWithImpl<$Res, $Val extends CreateClinicModel>
    implements $CreateClinicModelCopyWith<$Res> {
  _$CreateClinicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? clinicCode = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? licenseNumber = freezed,
    Object? adminFirstName = null,
    Object? adminLastName = null,
    Object? adminEmail = null,
    Object? adminUsername = null,
    Object? adminPhone = freezed,
    Object? adminPassword = null,
  }) {
    return _then(
      _value.copyWith(
            organizationId: null == organizationId
                ? _value.organizationId
                : organizationId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicCode: null == clinicCode
                ? _value.clinicCode
                : clinicCode // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            licenseNumber: freezed == licenseNumber
                ? _value.licenseNumber
                : licenseNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminFirstName: null == adminFirstName
                ? _value.adminFirstName
                : adminFirstName // ignore: cast_nullable_to_non_nullable
                      as String,
            adminLastName: null == adminLastName
                ? _value.adminLastName
                : adminLastName // ignore: cast_nullable_to_non_nullable
                      as String,
            adminEmail: null == adminEmail
                ? _value.adminEmail
                : adminEmail // ignore: cast_nullable_to_non_nullable
                      as String,
            adminUsername: null == adminUsername
                ? _value.adminUsername
                : adminUsername // ignore: cast_nullable_to_non_nullable
                      as String,
            adminPhone: freezed == adminPhone
                ? _value.adminPhone
                : adminPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminPassword: null == adminPassword
                ? _value.adminPassword
                : adminPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateClinicModelImplCopyWith<$Res>
    implements $CreateClinicModelCopyWith<$Res> {
  factory _$$CreateClinicModelImplCopyWith(
    _$CreateClinicModelImpl value,
    $Res Function(_$CreateClinicModelImpl) then,
  ) = __$$CreateClinicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'organization_id') String organizationId,
    @JsonKey(name: 'clinic_code') String clinicCode,
    String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'admin_first_name') String adminFirstName,
    @JsonKey(name: 'admin_last_name') String adminLastName,
    @JsonKey(name: 'admin_email') String adminEmail,
    @JsonKey(name: 'admin_username') String adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String adminPassword,
  });
}

/// @nodoc
class __$$CreateClinicModelImplCopyWithImpl<$Res>
    extends _$CreateClinicModelCopyWithImpl<$Res, _$CreateClinicModelImpl>
    implements _$$CreateClinicModelImplCopyWith<$Res> {
  __$$CreateClinicModelImplCopyWithImpl(
    _$CreateClinicModelImpl _value,
    $Res Function(_$CreateClinicModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? clinicCode = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? licenseNumber = freezed,
    Object? adminFirstName = null,
    Object? adminLastName = null,
    Object? adminEmail = null,
    Object? adminUsername = null,
    Object? adminPhone = freezed,
    Object? adminPassword = null,
  }) {
    return _then(
      _$CreateClinicModelImpl(
        organizationId: null == organizationId
            ? _value.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicCode: null == clinicCode
            ? _value.clinicCode
            : clinicCode // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        licenseNumber: freezed == licenseNumber
            ? _value.licenseNumber
            : licenseNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminFirstName: null == adminFirstName
            ? _value.adminFirstName
            : adminFirstName // ignore: cast_nullable_to_non_nullable
                  as String,
        adminLastName: null == adminLastName
            ? _value.adminLastName
            : adminLastName // ignore: cast_nullable_to_non_nullable
                  as String,
        adminEmail: null == adminEmail
            ? _value.adminEmail
            : adminEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        adminUsername: null == adminUsername
            ? _value.adminUsername
            : adminUsername // ignore: cast_nullable_to_non_nullable
                  as String,
        adminPhone: freezed == adminPhone
            ? _value.adminPhone
            : adminPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminPassword: null == adminPassword
            ? _value.adminPassword
            : adminPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateClinicModelImpl implements _CreateClinicModel {
  const _$CreateClinicModelImpl({
    @JsonKey(name: 'organization_id') required this.organizationId,
    @JsonKey(name: 'clinic_code') required this.clinicCode,
    required this.name,
    this.email,
    this.phone,
    this.address,
    @JsonKey(name: 'license_number') this.licenseNumber,
    @JsonKey(name: 'admin_first_name') required this.adminFirstName,
    @JsonKey(name: 'admin_last_name') required this.adminLastName,
    @JsonKey(name: 'admin_email') required this.adminEmail,
    @JsonKey(name: 'admin_username') required this.adminUsername,
    @JsonKey(name: 'admin_phone') this.adminPhone,
    @JsonKey(name: 'admin_password') required this.adminPassword,
  });

  factory _$CreateClinicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateClinicModelImplFromJson(json);

  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'clinic_code')
  final String clinicCode;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  @JsonKey(name: 'license_number')
  final String? licenseNumber;
  // Admin details - required for creation
  @override
  @JsonKey(name: 'admin_first_name')
  final String adminFirstName;
  @override
  @JsonKey(name: 'admin_last_name')
  final String adminLastName;
  @override
  @JsonKey(name: 'admin_email')
  final String adminEmail;
  @override
  @JsonKey(name: 'admin_username')
  final String adminUsername;
  @override
  @JsonKey(name: 'admin_phone')
  final String? adminPhone;
  @override
  @JsonKey(name: 'admin_password')
  final String adminPassword;

  @override
  String toString() {
    return 'CreateClinicModel(organizationId: $organizationId, clinicCode: $clinicCode, name: $name, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateClinicModelImpl &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.clinicCode, clinicCode) ||
                other.clinicCode == clinicCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.adminFirstName, adminFirstName) ||
                other.adminFirstName == adminFirstName) &&
            (identical(other.adminLastName, adminLastName) ||
                other.adminLastName == adminLastName) &&
            (identical(other.adminEmail, adminEmail) ||
                other.adminEmail == adminEmail) &&
            (identical(other.adminUsername, adminUsername) ||
                other.adminUsername == adminUsername) &&
            (identical(other.adminPhone, adminPhone) ||
                other.adminPhone == adminPhone) &&
            (identical(other.adminPassword, adminPassword) ||
                other.adminPassword == adminPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    organizationId,
    clinicCode,
    name,
    email,
    phone,
    address,
    licenseNumber,
    adminFirstName,
    adminLastName,
    adminEmail,
    adminUsername,
    adminPhone,
    adminPassword,
  );

  /// Create a copy of CreateClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateClinicModelImplCopyWith<_$CreateClinicModelImpl> get copyWith =>
      __$$CreateClinicModelImplCopyWithImpl<_$CreateClinicModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateClinicModelImplToJson(this);
  }
}

abstract class _CreateClinicModel implements CreateClinicModel {
  const factory _CreateClinicModel({
    @JsonKey(name: 'organization_id') required final String organizationId,
    @JsonKey(name: 'clinic_code') required final String clinicCode,
    required final String name,
    final String? email,
    final String? phone,
    final String? address,
    @JsonKey(name: 'license_number') final String? licenseNumber,
    @JsonKey(name: 'admin_first_name') required final String adminFirstName,
    @JsonKey(name: 'admin_last_name') required final String adminLastName,
    @JsonKey(name: 'admin_email') required final String adminEmail,
    @JsonKey(name: 'admin_username') required final String adminUsername,
    @JsonKey(name: 'admin_phone') final String? adminPhone,
    @JsonKey(name: 'admin_password') required final String adminPassword,
  }) = _$CreateClinicModelImpl;

  factory _CreateClinicModel.fromJson(Map<String, dynamic> json) =
      _$CreateClinicModelImpl.fromJson;

  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'clinic_code')
  String get clinicCode;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  @JsonKey(name: 'license_number')
  String? get licenseNumber; // Admin details - required for creation
  @override
  @JsonKey(name: 'admin_first_name')
  String get adminFirstName;
  @override
  @JsonKey(name: 'admin_last_name')
  String get adminLastName;
  @override
  @JsonKey(name: 'admin_email')
  String get adminEmail;
  @override
  @JsonKey(name: 'admin_username')
  String get adminUsername;
  @override
  @JsonKey(name: 'admin_phone')
  String? get adminPhone;
  @override
  @JsonKey(name: 'admin_password')
  String get adminPassword;

  /// Create a copy of CreateClinicModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateClinicModelImplCopyWith<_$CreateClinicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
