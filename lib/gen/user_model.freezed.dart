// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get lastLogin => throw _privateConstructorUsedError;
  String? get createdAt =>
      throw _privateConstructorUsedError; // Role-based fields
  String? get role => throw _privateConstructorUsedError;
  String? get roleId => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get clinicId => throw _privateConstructorUsedError;
  String? get serviceId => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? phone,
    String? dateOfBirth,
    String? gender,
    bool? isActive,
    String? lastLogin,
    String? createdAt,
    String? role,
    String? roleId,
    String? organizationId,
    String? clinicId,
    String? serviceId,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isActive = freezed,
    Object? lastLogin = freezed,
    Object? createdAt = freezed,
    Object? role = freezed,
    Object? roleId = freezed,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            lastLogin: freezed == lastLogin
                ? _value.lastLogin
                : lastLogin // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            roleId: freezed == roleId
                ? _value.roleId
                : roleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            organizationId: freezed == organizationId
                ? _value.organizationId
                : organizationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            serviceId: freezed == serviceId
                ? _value.serviceId
                : serviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? phone,
    String? dateOfBirth,
    String? gender,
    bool? isActive,
    String? lastLogin,
    String? createdAt,
    String? role,
    String? roleId,
    String? organizationId,
    String? clinicId,
    String? serviceId,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isActive = freezed,
    Object? lastLogin = freezed,
    Object? createdAt = freezed,
    Object? role = freezed,
    Object? roleId = freezed,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        lastLogin: freezed == lastLogin
            ? _value.lastLogin
            : lastLogin // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        roleId: freezed == roleId
            ? _value.roleId
            : roleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationId: freezed == organizationId
            ? _value.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        serviceId: freezed == serviceId
            ? _value.serviceId
            : serviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.isActive,
    this.lastLogin,
    this.createdAt,
    this.role,
    this.roleId,
    this.organizationId,
    this.clinicId,
    this.serviceId,
  }) : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? phone;
  @override
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  final bool? isActive;
  @override
  final String? lastLogin;
  @override
  final String? createdAt;
  // Role-based fields
  @override
  final String? role;
  @override
  final String? roleId;
  @override
  final String? organizationId;
  @override
  final String? clinicId;
  @override
  final String? serviceId;

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, lastLogin: $lastLogin, createdAt: $createdAt, role: $role, roleId: $roleId, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    email,
    username,
    phone,
    dateOfBirth,
    gender,
    isActive,
    lastLogin,
    createdAt,
    role,
    roleId,
    organizationId,
    clinicId,
    serviceId,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? username,
    final String? phone,
    final String? dateOfBirth,
    final String? gender,
    final bool? isActive,
    final String? lastLogin,
    final String? createdAt,
    final String? role,
    final String? roleId,
    final String? organizationId,
    final String? clinicId,
    final String? serviceId,
  }) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get username;
  @override
  String? get phone;
  @override
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  bool? get isActive;
  @override
  String? get lastLogin;
  @override
  String? get createdAt; // Role-based fields
  @override
  String? get role;
  @override
  String? get roleId;
  @override
  String? get organizationId;
  @override
  String? get clinicId;
  @override
  String? get serviceId;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRole _$UserRoleFromJson(Map<String, dynamic> json) {
  return _UserRole.fromJson(json);
}

/// @nodoc
mixin _$UserRole {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Map<String, dynamic>? get permissions => throw _privateConstructorUsedError;

  /// Serializes this UserRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoleCopyWith<UserRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleCopyWith<$Res> {
  factory $UserRoleCopyWith(UserRole value, $Res Function(UserRole) then) =
      _$UserRoleCopyWithImpl<$Res, UserRole>;
  @useResult
  $Res call({String? id, String? name, Map<String, dynamic>? permissions});
}

/// @nodoc
class _$UserRoleCopyWithImpl<$Res, $Val extends UserRole>
    implements $UserRoleCopyWith<$Res> {
  _$UserRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? permissions = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            permissions: freezed == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserRoleImplCopyWith<$Res>
    implements $UserRoleCopyWith<$Res> {
  factory _$$UserRoleImplCopyWith(
    _$UserRoleImpl value,
    $Res Function(_$UserRoleImpl) then,
  ) = __$$UserRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, Map<String, dynamic>? permissions});
}

/// @nodoc
class __$$UserRoleImplCopyWithImpl<$Res>
    extends _$UserRoleCopyWithImpl<$Res, _$UserRoleImpl>
    implements _$$UserRoleImplCopyWith<$Res> {
  __$$UserRoleImplCopyWithImpl(
    _$UserRoleImpl _value,
    $Res Function(_$UserRoleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? permissions = freezed,
  }) {
    return _then(
      _$UserRoleImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        permissions: freezed == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoleImpl extends _UserRole {
  const _$UserRoleImpl({
    this.id,
    this.name,
    final Map<String, dynamic>? permissions,
  }) : _permissions = permissions,
       super._();

  factory _$UserRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  final Map<String, dynamic>? _permissions;
  @override
  Map<String, dynamic>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserRole(id: $id, name: $name, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_permissions),
  );

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleImplCopyWith<_$UserRoleImpl> get copyWith =>
      __$$UserRoleImplCopyWithImpl<_$UserRoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleImplToJson(this);
  }
}

abstract class _UserRole extends UserRole {
  const factory _UserRole({
    final String? id,
    final String? name,
    final Map<String, dynamic>? permissions,
  }) = _$UserRoleImpl;
  const _UserRole._() : super._();

  factory _UserRole.fromJson(Map<String, dynamic> json) =
      _$UserRoleImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  Map<String, dynamic>? get permissions;

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleImplCopyWith<_$UserRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get expiresIn => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  List<UserRole>? get roles => throw _privateConstructorUsedError;
  String? get tokenType => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
    LoginResponse value,
    $Res Function(LoginResponse) then,
  ) = _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({
    String? accessToken,
    String? email,
    int? expiresIn,
    String? firstName,
    String? id,
    String? lastName,
    String? phone,
    String? refreshToken,
    List<UserRole>? roles,
    String? tokenType,
    String? username,
  });
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? email = freezed,
    Object? expiresIn = freezed,
    Object? firstName = freezed,
    Object? id = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? refreshToken = freezed,
    Object? roles = freezed,
    Object? tokenType = freezed,
    Object? username = freezed,
  }) {
    return _then(
      _value.copyWith(
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiresIn: freezed == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            refreshToken: freezed == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            roles: freezed == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<UserRole>?,
            tokenType: freezed == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
    _$LoginResponseImpl value,
    $Res Function(_$LoginResponseImpl) then,
  ) = __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? accessToken,
    String? email,
    int? expiresIn,
    String? firstName,
    String? id,
    String? lastName,
    String? phone,
    String? refreshToken,
    List<UserRole>? roles,
    String? tokenType,
    String? username,
  });
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
    _$LoginResponseImpl _value,
    $Res Function(_$LoginResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? email = freezed,
    Object? expiresIn = freezed,
    Object? firstName = freezed,
    Object? id = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? refreshToken = freezed,
    Object? roles = freezed,
    Object? tokenType = freezed,
    Object? username = freezed,
  }) {
    return _then(
      _$LoginResponseImpl(
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresIn: freezed == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        refreshToken: freezed == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        roles: freezed == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<UserRole>?,
        tokenType: freezed == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl extends _LoginResponse {
  const _$LoginResponseImpl({
    this.accessToken,
    this.email,
    this.expiresIn,
    this.firstName,
    this.id,
    this.lastName,
    this.phone,
    this.refreshToken,
    final List<UserRole>? roles,
    this.tokenType,
    this.username,
  }) : _roles = roles,
       super._();

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? email;
  @override
  final int? expiresIn;
  @override
  final String? firstName;
  @override
  final String? id;
  @override
  final String? lastName;
  @override
  final String? phone;
  @override
  final String? refreshToken;
  final List<UserRole>? _roles;
  @override
  List<UserRole>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tokenType;
  @override
  final String? username;

  @override
  String toString() {
    return 'LoginResponse(accessToken: $accessToken, email: $email, expiresIn: $expiresIn, firstName: $firstName, id: $id, lastName: $lastName, phone: $phone, refreshToken: $refreshToken, roles: $roles, tokenType: $tokenType, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accessToken,
    email,
    expiresIn,
    firstName,
    id,
    lastName,
    phone,
    refreshToken,
    const DeepCollectionEquality().hash(_roles),
    tokenType,
    username,
  );

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(this);
  }
}

abstract class _LoginResponse extends LoginResponse {
  const factory _LoginResponse({
    final String? accessToken,
    final String? email,
    final int? expiresIn,
    final String? firstName,
    final String? id,
    final String? lastName,
    final String? phone,
    final String? refreshToken,
    final List<UserRole>? roles,
    final String? tokenType,
    final String? username,
  }) = _$LoginResponseImpl;
  const _LoginResponse._() : super._();

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String? get accessToken;
  @override
  String? get email;
  @override
  int? get expiresIn;
  @override
  String? get firstName;
  @override
  String? get id;
  @override
  String? get lastName;
  @override
  String? get phone;
  @override
  String? get refreshToken;
  @override
  List<UserRole>? get roles;
  @override
  String? get tokenType;
  @override
  String? get username;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return _TokenModel.fromJson(json);
}

/// @nodoc
mixin _$TokenModel {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this TokenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenModelCopyWith<TokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenModelCopyWith<$Res> {
  factory $TokenModelCopyWith(
    TokenModel value,
    $Res Function(TokenModel) then,
  ) = _$TokenModelCopyWithImpl<$Res, TokenModel>;
  @useResult
  $Res call({String? accessToken, String? refreshToken, String? userId});
}

/// @nodoc
class _$TokenModelCopyWithImpl<$Res, $Val extends TokenModel>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(
      _value.copyWith(
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            refreshToken: freezed == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TokenModelImplCopyWith<$Res>
    implements $TokenModelCopyWith<$Res> {
  factory _$$TokenModelImplCopyWith(
    _$TokenModelImpl value,
    $Res Function(_$TokenModelImpl) then,
  ) = __$$TokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accessToken, String? refreshToken, String? userId});
}

/// @nodoc
class __$$TokenModelImplCopyWithImpl<$Res>
    extends _$TokenModelCopyWithImpl<$Res, _$TokenModelImpl>
    implements _$$TokenModelImplCopyWith<$Res> {
  __$$TokenModelImplCopyWithImpl(
    _$TokenModelImpl _value,
    $Res Function(_$TokenModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(
      _$TokenModelImpl(
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        refreshToken: freezed == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenModelImpl extends _TokenModel {
  const _$TokenModelImpl({this.accessToken, this.refreshToken, this.userId})
    : super._();

  factory _$TokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenModelImplFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? userId;

  @override
  String toString() {
    return 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, userId);

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenModelImplCopyWith<_$TokenModelImpl> get copyWith =>
      __$$TokenModelImplCopyWithImpl<_$TokenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenModelImplToJson(this);
  }
}

abstract class _TokenModel extends TokenModel {
  const factory _TokenModel({
    final String? accessToken,
    final String? refreshToken,
    final String? userId,
  }) = _$TokenModelImpl;
  const _TokenModel._() : super._();

  factory _TokenModel.fromJson(Map<String, dynamic> json) =
      _$TokenModelImpl.fromJson;

  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  String? get userId;

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenModelImplCopyWith<_$TokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  UserModel? get user => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
    AuthResponse value,
    $Res Function(AuthResponse) then,
  ) = _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({UserModel? user, String? accessToken, String? refreshToken});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(
      _value.copyWith(
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel?,
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            refreshToken: freezed == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
    _$AuthResponseImpl value,
    $Res Function(_$AuthResponseImpl) then,
  ) = __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel? user, String? accessToken, String? refreshToken});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
    _$AuthResponseImpl _value,
    $Res Function(_$AuthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(
      _$AuthResponseImpl(
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel?,
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        refreshToken: freezed == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl extends _AuthResponse {
  const _$AuthResponseImpl({this.user, this.accessToken, this.refreshToken})
    : super._();

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  final UserModel? user;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'AuthResponse(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(this);
  }
}

abstract class _AuthResponse extends AuthResponse {
  const factory _AuthResponse({
    final UserModel? user,
    final String? accessToken,
    final String? refreshToken,
  }) = _$AuthResponseImpl;
  const _AuthResponse._() : super._();

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  UserModel? get user;
  @override
  String? get accessToken;
  @override
  String? get refreshToken;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
