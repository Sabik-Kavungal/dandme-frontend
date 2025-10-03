// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String? get licenseNumber => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get createdAt =>
      throw _privateConstructorUsedError; // Admin details (for creating new organizations)
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

  /// Serializes this OrganizationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
    OrganizationModel value,
    $Res Function(OrganizationModel) then,
  ) = _$OrganizationModelCopyWithImpl<$Res, OrganizationModel>;
  @useResult
  $Res call({
    String? id,
    String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    bool? isActive,
    String? createdAt,
    @JsonKey(name: 'admin_first_name') String? adminFirstName,
    @JsonKey(name: 'admin_last_name') String? adminLastName,
    @JsonKey(name: 'admin_email') String? adminEmail,
    @JsonKey(name: 'admin_username') String? adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String? adminPassword,
  });
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res, $Val extends OrganizationModel>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
abstract class _$$OrganizationModelImplCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$$OrganizationModelImplCopyWith(
    _$OrganizationModelImpl value,
    $Res Function(_$OrganizationModelImpl) then,
  ) = __$$OrganizationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    bool? isActive,
    String? createdAt,
    @JsonKey(name: 'admin_first_name') String? adminFirstName,
    @JsonKey(name: 'admin_last_name') String? adminLastName,
    @JsonKey(name: 'admin_email') String? adminEmail,
    @JsonKey(name: 'admin_username') String? adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String? adminPassword,
  });
}

/// @nodoc
class __$$OrganizationModelImplCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res, _$OrganizationModelImpl>
    implements _$$OrganizationModelImplCopyWith<$Res> {
  __$$OrganizationModelImplCopyWithImpl(
    _$OrganizationModelImpl _value,
    $Res Function(_$OrganizationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
      _$OrganizationModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$OrganizationModelImpl implements _OrganizationModel {
  const _$OrganizationModelImpl({
    this.id,
    required this.name,
    this.email,
    this.phone,
    this.address,
    @JsonKey(name: 'license_number') this.licenseNumber,
    this.isActive,
    this.createdAt,
    @JsonKey(name: 'admin_first_name') this.adminFirstName,
    @JsonKey(name: 'admin_last_name') this.adminLastName,
    @JsonKey(name: 'admin_email') this.adminEmail,
    @JsonKey(name: 'admin_username') this.adminUsername,
    @JsonKey(name: 'admin_phone') this.adminPhone,
    @JsonKey(name: 'admin_password') this.adminPassword,
  });

  factory _$OrganizationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationModelImplFromJson(json);

  @override
  final String? id;
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
  final bool? isActive;
  @override
  final String? createdAt;
  // Admin details (for creating new organizations)
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
    return 'OrganizationModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, isActive: $isActive, createdAt: $createdAt, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationModelImplCopyWith<_$OrganizationModelImpl> get copyWith =>
      __$$OrganizationModelImplCopyWithImpl<_$OrganizationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationModelImplToJson(this);
  }
}

abstract class _OrganizationModel implements OrganizationModel {
  const factory _OrganizationModel({
    final String? id,
    required final String name,
    final String? email,
    final String? phone,
    final String? address,
    @JsonKey(name: 'license_number') final String? licenseNumber,
    final bool? isActive,
    final String? createdAt,
    @JsonKey(name: 'admin_first_name') final String? adminFirstName,
    @JsonKey(name: 'admin_last_name') final String? adminLastName,
    @JsonKey(name: 'admin_email') final String? adminEmail,
    @JsonKey(name: 'admin_username') final String? adminUsername,
    @JsonKey(name: 'admin_phone') final String? adminPhone,
    @JsonKey(name: 'admin_password') final String? adminPassword,
  }) = _$OrganizationModelImpl;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$OrganizationModelImpl.fromJson;

  @override
  String? get id;
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
  bool? get isActive;
  @override
  String? get createdAt; // Admin details (for creating new organizations)
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

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizationModelImplCopyWith<_$OrganizationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
