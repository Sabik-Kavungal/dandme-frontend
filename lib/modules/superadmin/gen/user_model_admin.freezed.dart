// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/user_model_admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserRoleAdmin _$UserRoleAdminFromJson(Map<String, dynamic> json) {
  return _UserRoleAdmin.fromJson(json);
}

/// @nodoc
mixin _$UserRoleAdmin {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String? get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  String? get serviceId => throw _privateConstructorUsedError;

  /// Serializes this UserRoleAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoleAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoleAdminCopyWith<UserRoleAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleAdminCopyWith<$Res> {
  factory $UserRoleAdminCopyWith(
    UserRoleAdmin value,
    $Res Function(UserRoleAdmin) then,
  ) = _$UserRoleAdminCopyWithImpl<$Res, UserRoleAdmin>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    Map<String, dynamic>? permissions,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  });
}

/// @nodoc
class _$UserRoleAdminCopyWithImpl<$Res, $Val extends UserRoleAdmin>
    implements $UserRoleAdminCopyWith<$Res> {
  _$UserRoleAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoleAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? permissions = freezed,
    Object? isActive = freezed,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            permissions: freezed == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
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
abstract class _$$UserRoleAdminImplCopyWith<$Res>
    implements $UserRoleAdminCopyWith<$Res> {
  factory _$$UserRoleAdminImplCopyWith(
    _$UserRoleAdminImpl value,
    $Res Function(_$UserRoleAdminImpl) then,
  ) = __$$UserRoleAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    Map<String, dynamic>? permissions,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  });
}

/// @nodoc
class __$$UserRoleAdminImplCopyWithImpl<$Res>
    extends _$UserRoleAdminCopyWithImpl<$Res, _$UserRoleAdminImpl>
    implements _$$UserRoleAdminImplCopyWith<$Res> {
  __$$UserRoleAdminImplCopyWithImpl(
    _$UserRoleAdminImpl _value,
    $Res Function(_$UserRoleAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserRoleAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? permissions = freezed,
    Object? isActive = freezed,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _$UserRoleAdminImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        permissions: freezed == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
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
class _$UserRoleAdminImpl implements _UserRoleAdmin {
  const _$UserRoleAdminImpl({
    required this.id,
    required this.name,
    this.description,
    final Map<String, dynamic>? permissions,
    @JsonKey(name: 'is_active') this.isActive,
    @JsonKey(name: 'organization_id') this.organizationId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'service_id') this.serviceId,
  }) : _permissions = permissions;

  factory _$UserRoleAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleAdminImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
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
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'service_id')
  final String? serviceId;

  @override
  String toString() {
    return 'UserRoleAdmin(id: $id, name: $name, description: $description, permissions: $permissions, isActive: $isActive, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleAdminImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    name,
    description,
    const DeepCollectionEquality().hash(_permissions),
    isActive,
    organizationId,
    clinicId,
    serviceId,
  );

  /// Create a copy of UserRoleAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleAdminImplCopyWith<_$UserRoleAdminImpl> get copyWith =>
      __$$UserRoleAdminImplCopyWithImpl<_$UserRoleAdminImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleAdminImplToJson(this);
  }
}

abstract class _UserRoleAdmin implements UserRoleAdmin {
  const factory _UserRoleAdmin({
    required final String id,
    required final String name,
    final String? description,
    final Map<String, dynamic>? permissions,
    @JsonKey(name: 'is_active') final bool? isActive,
    @JsonKey(name: 'organization_id') final String? organizationId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'service_id') final String? serviceId,
  }) = _$UserRoleAdminImpl;

  factory _UserRoleAdmin.fromJson(Map<String, dynamic> json) =
      _$UserRoleAdminImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get permissions;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'organization_id')
  String? get organizationId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'service_id')
  String? get serviceId;

  /// Create a copy of UserRoleAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleAdminImplCopyWith<_$UserRoleAdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModelAdmin _$UserModelAdminFromJson(Map<String, dynamic> json) {
  return _UserModelAdmin.fromJson(json);
}

/// @nodoc
mixin _$UserModelAdmin {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_at')
  String? get blockedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_reason')
  String? get blockedReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login')
  String? get lastLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  List<UserRoleAdmin>? get roles => throw _privateConstructorUsedError;

  /// Serializes this UserModelAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelAdminCopyWith<UserModelAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelAdminCopyWith<$Res> {
  factory $UserModelAdminCopyWith(
    UserModelAdmin value,
    $Res Function(UserModelAdmin) then,
  ) = _$UserModelAdminCopyWithImpl<$Res, UserModelAdmin>;
  @useResult
  $Res call({
    String id,
    String? email,
    String username,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'is_blocked') bool isBlocked,
    @JsonKey(name: 'blocked_at') String? blockedAt,
    @JsonKey(name: 'blocked_reason') String? blockedReason,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<UserRoleAdmin>? roles,
  });
}

/// @nodoc
class _$UserModelAdminCopyWithImpl<$Res, $Val extends UserModelAdmin>
    implements $UserModelAdminCopyWith<$Res> {
  _$UserModelAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? username = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isActive = null,
    Object? isBlocked = null,
    Object? blockedAt = freezed,
    Object? blockedReason = freezed,
    Object? lastLogin = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? roles = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
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
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBlocked: null == isBlocked
                ? _value.isBlocked
                : isBlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            blockedAt: freezed == blockedAt
                ? _value.blockedAt
                : blockedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            blockedReason: freezed == blockedReason
                ? _value.blockedReason
                : blockedReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastLogin: freezed == lastLogin
                ? _value.lastLogin
                : lastLogin // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            roles: freezed == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<UserRoleAdmin>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelAdminImplCopyWith<$Res>
    implements $UserModelAdminCopyWith<$Res> {
  factory _$$UserModelAdminImplCopyWith(
    _$UserModelAdminImpl value,
    $Res Function(_$UserModelAdminImpl) then,
  ) = __$$UserModelAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? email,
    String username,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'is_blocked') bool isBlocked,
    @JsonKey(name: 'blocked_at') String? blockedAt,
    @JsonKey(name: 'blocked_reason') String? blockedReason,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<UserRoleAdmin>? roles,
  });
}

/// @nodoc
class __$$UserModelAdminImplCopyWithImpl<$Res>
    extends _$UserModelAdminCopyWithImpl<$Res, _$UserModelAdminImpl>
    implements _$$UserModelAdminImplCopyWith<$Res> {
  __$$UserModelAdminImplCopyWithImpl(
    _$UserModelAdminImpl _value,
    $Res Function(_$UserModelAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? username = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isActive = null,
    Object? isBlocked = null,
    Object? blockedAt = freezed,
    Object? blockedReason = freezed,
    Object? lastLogin = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? roles = freezed,
  }) {
    return _then(
      _$UserModelAdminImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
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
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBlocked: null == isBlocked
            ? _value.isBlocked
            : isBlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        blockedAt: freezed == blockedAt
            ? _value.blockedAt
            : blockedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        blockedReason: freezed == blockedReason
            ? _value.blockedReason
            : blockedReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastLogin: freezed == lastLogin
            ? _value.lastLogin
            : lastLogin // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        roles: freezed == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<UserRoleAdmin>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelAdminImpl implements _UserModelAdmin {
  const _$UserModelAdminImpl({
    required this.id,
    this.email,
    required this.username,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    this.phone,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.gender,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'is_blocked') required this.isBlocked,
    @JsonKey(name: 'blocked_at') this.blockedAt,
    @JsonKey(name: 'blocked_reason') this.blockedReason,
    @JsonKey(name: 'last_login') this.lastLogin,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    final List<UserRoleAdmin>? roles,
  }) : _roles = roles;

  factory _$UserModelAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelAdminImplFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String username;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @override
  @JsonKey(name: 'blocked_at')
  final String? blockedAt;
  @override
  @JsonKey(name: 'blocked_reason')
  final String? blockedReason;
  @override
  @JsonKey(name: 'last_login')
  final String? lastLogin;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<UserRoleAdmin>? _roles;
  @override
  List<UserRoleAdmin>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModelAdmin(id: $id, email: $email, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, isBlocked: $isBlocked, blockedAt: $blockedAt, blockedReason: $blockedReason, lastLogin: $lastLogin, createdAt: $createdAt, updatedAt: $updatedAt, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelAdminImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.blockedAt, blockedAt) ||
                other.blockedAt == blockedAt) &&
            (identical(other.blockedReason, blockedReason) ||
                other.blockedReason == blockedReason) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    username,
    firstName,
    lastName,
    phone,
    dateOfBirth,
    gender,
    isActive,
    isBlocked,
    blockedAt,
    blockedReason,
    lastLogin,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_roles),
  );

  /// Create a copy of UserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelAdminImplCopyWith<_$UserModelAdminImpl> get copyWith =>
      __$$UserModelAdminImplCopyWithImpl<_$UserModelAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelAdminImplToJson(this);
  }
}

abstract class _UserModelAdmin implements UserModelAdmin {
  const factory _UserModelAdmin({
    required final String id,
    final String? email,
    required final String username,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    final String? phone,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final String? gender,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'is_blocked') required final bool isBlocked,
    @JsonKey(name: 'blocked_at') final String? blockedAt,
    @JsonKey(name: 'blocked_reason') final String? blockedReason,
    @JsonKey(name: 'last_login') final String? lastLogin,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    final List<UserRoleAdmin>? roles,
  }) = _$UserModelAdminImpl;

  factory _UserModelAdmin.fromJson(Map<String, dynamic> json) =
      _$UserModelAdminImpl.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String get username;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;
  @override
  @JsonKey(name: 'blocked_at')
  String? get blockedAt;
  @override
  @JsonKey(name: 'blocked_reason')
  String? get blockedReason;
  @override
  @JsonKey(name: 'last_login')
  String? get lastLogin;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  List<UserRoleAdmin>? get roles;

  /// Create a copy of UserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelAdminImplCopyWith<_$UserModelAdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateUserModelAdmin _$CreateUserModelAdminFromJson(Map<String, dynamic> json) {
  return _CreateUserModelAdmin.fromJson(json);
}

/// @nodoc
mixin _$CreateUserModelAdmin {
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_ids')
  List<String>? get roleIds => throw _privateConstructorUsedError;

  /// Serializes this CreateUserModelAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserModelAdminCopyWith<CreateUserModelAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserModelAdminCopyWith<$Res> {
  factory $CreateUserModelAdminCopyWith(
    CreateUserModelAdmin value,
    $Res Function(CreateUserModelAdmin) then,
  ) = _$CreateUserModelAdminCopyWithImpl<$Res, CreateUserModelAdmin>;
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? email,
    String username,
    String? phone,
    String password,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'role_ids') List<String>? roleIds,
  });
}

/// @nodoc
class _$CreateUserModelAdminCopyWithImpl<
  $Res,
  $Val extends CreateUserModelAdmin
>
    implements $CreateUserModelAdminCopyWith<$Res> {
  _$CreateUserModelAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? username = null,
    Object? phone = freezed,
    Object? password = null,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isActive = freezed,
    Object? roleIds = freezed,
  }) {
    return _then(
      _value.copyWith(
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
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
            roleIds: freezed == roleIds
                ? _value.roleIds
                : roleIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateUserModelAdminImplCopyWith<$Res>
    implements $CreateUserModelAdminCopyWith<$Res> {
  factory _$$CreateUserModelAdminImplCopyWith(
    _$CreateUserModelAdminImpl value,
    $Res Function(_$CreateUserModelAdminImpl) then,
  ) = __$$CreateUserModelAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? email,
    String username,
    String? phone,
    String password,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'role_ids') List<String>? roleIds,
  });
}

/// @nodoc
class __$$CreateUserModelAdminImplCopyWithImpl<$Res>
    extends _$CreateUserModelAdminCopyWithImpl<$Res, _$CreateUserModelAdminImpl>
    implements _$$CreateUserModelAdminImplCopyWith<$Res> {
  __$$CreateUserModelAdminImplCopyWithImpl(
    _$CreateUserModelAdminImpl _value,
    $Res Function(_$CreateUserModelAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? username = null,
    Object? phone = freezed,
    Object? password = null,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isActive = freezed,
    Object? roleIds = freezed,
  }) {
    return _then(
      _$CreateUserModelAdminImpl(
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
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
        roleIds: freezed == roleIds
            ? _value._roleIds
            : roleIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserModelAdminImpl implements _CreateUserModelAdmin {
  const _$CreateUserModelAdminImpl({
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    this.email,
    required this.username,
    this.phone,
    required this.password,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.gender,
    @JsonKey(name: 'is_active') this.isActive,
    @JsonKey(name: 'role_ids') final List<String>? roleIds,
  }) : _roleIds = roleIds;

  factory _$CreateUserModelAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserModelAdminImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String? email;
  @override
  final String username;
  @override
  final String? phone;
  @override
  final String password;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  final List<String>? _roleIds;
  @override
  @JsonKey(name: 'role_ids')
  List<String>? get roleIds {
    final value = _roleIds;
    if (value == null) return null;
    if (_roleIds is EqualUnmodifiableListView) return _roleIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateUserModelAdmin(firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, password: $password, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, roleIds: $roleIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserModelAdminImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._roleIds, _roleIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstName,
    lastName,
    email,
    username,
    phone,
    password,
    dateOfBirth,
    gender,
    isActive,
    const DeepCollectionEquality().hash(_roleIds),
  );

  /// Create a copy of CreateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserModelAdminImplCopyWith<_$CreateUserModelAdminImpl>
  get copyWith =>
      __$$CreateUserModelAdminImplCopyWithImpl<_$CreateUserModelAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserModelAdminImplToJson(this);
  }
}

abstract class _CreateUserModelAdmin implements CreateUserModelAdmin {
  const factory _CreateUserModelAdmin({
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    final String? email,
    required final String username,
    final String? phone,
    required final String password,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final String? gender,
    @JsonKey(name: 'is_active') final bool? isActive,
    @JsonKey(name: 'role_ids') final List<String>? roleIds,
  }) = _$CreateUserModelAdminImpl;

  factory _CreateUserModelAdmin.fromJson(Map<String, dynamic> json) =
      _$CreateUserModelAdminImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String? get email;
  @override
  String get username;
  @override
  String? get phone;
  @override
  String get password;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'role_ids')
  List<String>? get roleIds;

  /// Create a copy of CreateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserModelAdminImplCopyWith<_$CreateUserModelAdminImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdateUserModelAdmin _$UpdateUserModelAdminFromJson(Map<String, dynamic> json) {
  return _UpdateUserModelAdmin.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserModelAdmin {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserModelAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserModelAdminCopyWith<UpdateUserModelAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserModelAdminCopyWith<$Res> {
  factory $UpdateUserModelAdminCopyWith(
    UpdateUserModelAdmin value,
    $Res Function(UpdateUserModelAdmin) then,
  ) = _$UpdateUserModelAdminCopyWithImpl<$Res, UpdateUserModelAdmin>;
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
  });
}

/// @nodoc
class _$UpdateUserModelAdminCopyWithImpl<
  $Res,
  $Val extends UpdateUserModelAdmin
>
    implements $UpdateUserModelAdminCopyWith<$Res> {
  _$UpdateUserModelAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateUserModelAdminImplCopyWith<$Res>
    implements $UpdateUserModelAdminCopyWith<$Res> {
  factory _$$UpdateUserModelAdminImplCopyWith(
    _$UpdateUserModelAdminImpl value,
    $Res Function(_$UpdateUserModelAdminImpl) then,
  ) = __$$UpdateUserModelAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
  });
}

/// @nodoc
class __$$UpdateUserModelAdminImplCopyWithImpl<$Res>
    extends _$UpdateUserModelAdminCopyWithImpl<$Res, _$UpdateUserModelAdminImpl>
    implements _$$UpdateUserModelAdminImplCopyWith<$Res> {
  __$$UpdateUserModelAdminImplCopyWithImpl(
    _$UpdateUserModelAdminImpl _value,
    $Res Function(_$UpdateUserModelAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$UpdateUserModelAdminImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserModelAdminImpl implements _UpdateUserModelAdmin {
  const _$UpdateUserModelAdminImpl({
    @JsonKey(name: 'first_name') this.firstName,
    @JsonKey(name: 'last_name') this.lastName,
    this.email,
    this.phone,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.gender,
  });

  factory _$UpdateUserModelAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserModelAdminImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final String? gender;

  @override
  String toString() {
    return 'UpdateUserModelAdmin(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserModelAdminImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstName,
    lastName,
    email,
    phone,
    dateOfBirth,
    gender,
  );

  /// Create a copy of UpdateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserModelAdminImplCopyWith<_$UpdateUserModelAdminImpl>
  get copyWith =>
      __$$UpdateUserModelAdminImplCopyWithImpl<_$UpdateUserModelAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserModelAdminImplToJson(this);
  }
}

abstract class _UpdateUserModelAdmin implements UpdateUserModelAdmin {
  const factory _UpdateUserModelAdmin({
    @JsonKey(name: 'first_name') final String? firstName,
    @JsonKey(name: 'last_name') final String? lastName,
    final String? email,
    final String? phone,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final String? gender,
  }) = _$UpdateUserModelAdminImpl;

  factory _UpdateUserModelAdmin.fromJson(Map<String, dynamic> json) =
      _$UpdateUserModelAdminImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  String? get gender;

  /// Create a copy of UpdateUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserModelAdminImplCopyWith<_$UpdateUserModelAdminImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BlockUserModelAdmin _$BlockUserModelAdminFromJson(Map<String, dynamic> json) {
  return _BlockUserModelAdmin.fromJson(json);
}

/// @nodoc
mixin _$BlockUserModelAdmin {
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this BlockUserModelAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockUserModelAdminCopyWith<BlockUserModelAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockUserModelAdminCopyWith<$Res> {
  factory $BlockUserModelAdminCopyWith(
    BlockUserModelAdmin value,
    $Res Function(BlockUserModelAdmin) then,
  ) = _$BlockUserModelAdminCopyWithImpl<$Res, BlockUserModelAdmin>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$BlockUserModelAdminCopyWithImpl<$Res, $Val extends BlockUserModelAdmin>
    implements $BlockUserModelAdminCopyWith<$Res> {
  _$BlockUserModelAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _value.copyWith(
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BlockUserModelAdminImplCopyWith<$Res>
    implements $BlockUserModelAdminCopyWith<$Res> {
  factory _$$BlockUserModelAdminImplCopyWith(
    _$BlockUserModelAdminImpl value,
    $Res Function(_$BlockUserModelAdminImpl) then,
  ) = __$$BlockUserModelAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$BlockUserModelAdminImplCopyWithImpl<$Res>
    extends _$BlockUserModelAdminCopyWithImpl<$Res, _$BlockUserModelAdminImpl>
    implements _$$BlockUserModelAdminImplCopyWith<$Res> {
  __$$BlockUserModelAdminImplCopyWithImpl(
    _$BlockUserModelAdminImpl _value,
    $Res Function(_$BlockUserModelAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BlockUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _$BlockUserModelAdminImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockUserModelAdminImpl implements _BlockUserModelAdmin {
  const _$BlockUserModelAdminImpl({required this.reason});

  factory _$BlockUserModelAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockUserModelAdminImplFromJson(json);

  @override
  final String reason;

  @override
  String toString() {
    return 'BlockUserModelAdmin(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockUserModelAdminImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of BlockUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockUserModelAdminImplCopyWith<_$BlockUserModelAdminImpl> get copyWith =>
      __$$BlockUserModelAdminImplCopyWithImpl<_$BlockUserModelAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockUserModelAdminImplToJson(this);
  }
}

abstract class _BlockUserModelAdmin implements BlockUserModelAdmin {
  const factory _BlockUserModelAdmin({required final String reason}) =
      _$BlockUserModelAdminImpl;

  factory _BlockUserModelAdmin.fromJson(Map<String, dynamic> json) =
      _$BlockUserModelAdminImpl.fromJson;

  @override
  String get reason;

  /// Create a copy of BlockUserModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockUserModelAdminImplCopyWith<_$BlockUserModelAdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminChangePasswordModelAdmin _$AdminChangePasswordModelAdminFromJson(
  Map<String, dynamic> json,
) {
  return _AdminChangePasswordModelAdmin.fromJson(json);
}

/// @nodoc
mixin _$AdminChangePasswordModelAdmin {
  @JsonKey(name: 'new_password')
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this AdminChangePasswordModelAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminChangePasswordModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminChangePasswordModelAdminCopyWith<AdminChangePasswordModelAdmin>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminChangePasswordModelAdminCopyWith<$Res> {
  factory $AdminChangePasswordModelAdminCopyWith(
    AdminChangePasswordModelAdmin value,
    $Res Function(AdminChangePasswordModelAdmin) then,
  ) =
      _$AdminChangePasswordModelAdminCopyWithImpl<
        $Res,
        AdminChangePasswordModelAdmin
      >;
  @useResult
  $Res call({@JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class _$AdminChangePasswordModelAdminCopyWithImpl<
  $Res,
  $Val extends AdminChangePasswordModelAdmin
>
    implements $AdminChangePasswordModelAdminCopyWith<$Res> {
  _$AdminChangePasswordModelAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminChangePasswordModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newPassword = null}) {
    return _then(
      _value.copyWith(
            newPassword: null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminChangePasswordModelAdminImplCopyWith<$Res>
    implements $AdminChangePasswordModelAdminCopyWith<$Res> {
  factory _$$AdminChangePasswordModelAdminImplCopyWith(
    _$AdminChangePasswordModelAdminImpl value,
    $Res Function(_$AdminChangePasswordModelAdminImpl) then,
  ) = __$$AdminChangePasswordModelAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class __$$AdminChangePasswordModelAdminImplCopyWithImpl<$Res>
    extends
        _$AdminChangePasswordModelAdminCopyWithImpl<
          $Res,
          _$AdminChangePasswordModelAdminImpl
        >
    implements _$$AdminChangePasswordModelAdminImplCopyWith<$Res> {
  __$$AdminChangePasswordModelAdminImplCopyWithImpl(
    _$AdminChangePasswordModelAdminImpl _value,
    $Res Function(_$AdminChangePasswordModelAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminChangePasswordModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newPassword = null}) {
    return _then(
      _$AdminChangePasswordModelAdminImpl(
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminChangePasswordModelAdminImpl
    implements _AdminChangePasswordModelAdmin {
  const _$AdminChangePasswordModelAdminImpl({
    @JsonKey(name: 'new_password') required this.newPassword,
  });

  factory _$AdminChangePasswordModelAdminImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AdminChangePasswordModelAdminImplFromJson(json);

  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  @override
  String toString() {
    return 'AdminChangePasswordModelAdmin(newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminChangePasswordModelAdminImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  /// Create a copy of AdminChangePasswordModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminChangePasswordModelAdminImplCopyWith<
    _$AdminChangePasswordModelAdminImpl
  >
  get copyWith =>
      __$$AdminChangePasswordModelAdminImplCopyWithImpl<
        _$AdminChangePasswordModelAdminImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminChangePasswordModelAdminImplToJson(this);
  }
}

abstract class _AdminChangePasswordModelAdmin
    implements AdminChangePasswordModelAdmin {
  const factory _AdminChangePasswordModelAdmin({
    @JsonKey(name: 'new_password') required final String newPassword,
  }) = _$AdminChangePasswordModelAdminImpl;

  factory _AdminChangePasswordModelAdmin.fromJson(Map<String, dynamic> json) =
      _$AdminChangePasswordModelAdminImpl.fromJson;

  @override
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Create a copy of AdminChangePasswordModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminChangePasswordModelAdminImplCopyWith<
    _$AdminChangePasswordModelAdminImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

AssignRoleModelAdmin _$AssignRoleModelAdminFromJson(Map<String, dynamic> json) {
  return _AssignRoleModelAdmin.fromJson(json);
}

/// @nodoc
mixin _$AssignRoleModelAdmin {
  @JsonKey(name: 'role_id')
  String get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String? get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  String? get serviceId => throw _privateConstructorUsedError;

  /// Serializes this AssignRoleModelAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssignRoleModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssignRoleModelAdminCopyWith<AssignRoleModelAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignRoleModelAdminCopyWith<$Res> {
  factory $AssignRoleModelAdminCopyWith(
    AssignRoleModelAdmin value,
    $Res Function(AssignRoleModelAdmin) then,
  ) = _$AssignRoleModelAdminCopyWithImpl<$Res, AssignRoleModelAdmin>;
  @useResult
  $Res call({
    @JsonKey(name: 'role_id') String roleId,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  });
}

/// @nodoc
class _$AssignRoleModelAdminCopyWithImpl<
  $Res,
  $Val extends AssignRoleModelAdmin
>
    implements $AssignRoleModelAdminCopyWith<$Res> {
  _$AssignRoleModelAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssignRoleModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _value.copyWith(
            roleId: null == roleId
                ? _value.roleId
                : roleId // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$AssignRoleModelAdminImplCopyWith<$Res>
    implements $AssignRoleModelAdminCopyWith<$Res> {
  factory _$$AssignRoleModelAdminImplCopyWith(
    _$AssignRoleModelAdminImpl value,
    $Res Function(_$AssignRoleModelAdminImpl) then,
  ) = __$$AssignRoleModelAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'role_id') String roleId,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  });
}

/// @nodoc
class __$$AssignRoleModelAdminImplCopyWithImpl<$Res>
    extends _$AssignRoleModelAdminCopyWithImpl<$Res, _$AssignRoleModelAdminImpl>
    implements _$$AssignRoleModelAdminImplCopyWith<$Res> {
  __$$AssignRoleModelAdminImplCopyWithImpl(
    _$AssignRoleModelAdminImpl _value,
    $Res Function(_$AssignRoleModelAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssignRoleModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _$AssignRoleModelAdminImpl(
        roleId: null == roleId
            ? _value.roleId
            : roleId // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$AssignRoleModelAdminImpl implements _AssignRoleModelAdmin {
  const _$AssignRoleModelAdminImpl({
    @JsonKey(name: 'role_id') required this.roleId,
    @JsonKey(name: 'organization_id') this.organizationId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'service_id') this.serviceId,
  });

  factory _$AssignRoleModelAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignRoleModelAdminImplFromJson(json);

  @override
  @JsonKey(name: 'role_id')
  final String roleId;
  @override
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'service_id')
  final String? serviceId;

  @override
  String toString() {
    return 'AssignRoleModelAdmin(roleId: $roleId, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignRoleModelAdminImpl &&
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
  int get hashCode =>
      Object.hash(runtimeType, roleId, organizationId, clinicId, serviceId);

  /// Create a copy of AssignRoleModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignRoleModelAdminImplCopyWith<_$AssignRoleModelAdminImpl>
  get copyWith =>
      __$$AssignRoleModelAdminImplCopyWithImpl<_$AssignRoleModelAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignRoleModelAdminImplToJson(this);
  }
}

abstract class _AssignRoleModelAdmin implements AssignRoleModelAdmin {
  const factory _AssignRoleModelAdmin({
    @JsonKey(name: 'role_id') required final String roleId,
    @JsonKey(name: 'organization_id') final String? organizationId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'service_id') final String? serviceId,
  }) = _$AssignRoleModelAdminImpl;

  factory _AssignRoleModelAdmin.fromJson(Map<String, dynamic> json) =
      _$AssignRoleModelAdminImpl.fromJson;

  @override
  @JsonKey(name: 'role_id')
  String get roleId;
  @override
  @JsonKey(name: 'organization_id')
  String? get organizationId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'service_id')
  String? get serviceId;

  /// Create a copy of AssignRoleModelAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignRoleModelAdminImplCopyWith<_$AssignRoleModelAdminImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserActivityLogAdmin _$UserActivityLogAdminFromJson(Map<String, dynamic> json) {
  return _UserActivityLogAdmin.fromJson(json);
}

/// @nodoc
mixin _$UserActivityLogAdmin {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'performed_by')
  String? get performedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'performed_by_name')
  String? get performedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_type')
  String get actionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_description')
  String get actionDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_address')
  String? get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_agent')
  String? get userAgent => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserActivityLogAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserActivityLogAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActivityLogAdminCopyWith<UserActivityLogAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityLogAdminCopyWith<$Res> {
  factory $UserActivityLogAdminCopyWith(
    UserActivityLogAdmin value,
    $Res Function(UserActivityLogAdmin) then,
  ) = _$UserActivityLogAdminCopyWithImpl<$Res, UserActivityLogAdmin>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'performed_by') String? performedBy,
    @JsonKey(name: 'performed_by_name') String? performedByName,
    @JsonKey(name: 'action_type') String actionType,
    @JsonKey(name: 'action_description') String actionDescription,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'user_agent') String? userAgent,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$UserActivityLogAdminCopyWithImpl<
  $Res,
  $Val extends UserActivityLogAdmin
>
    implements $UserActivityLogAdminCopyWith<$Res> {
  _$UserActivityLogAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserActivityLogAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? performedBy = freezed,
    Object? performedByName = freezed,
    Object? actionType = null,
    Object? actionDescription = null,
    Object? ipAddress = freezed,
    Object? userAgent = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            performedBy: freezed == performedBy
                ? _value.performedBy
                : performedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            performedByName: freezed == performedByName
                ? _value.performedByName
                : performedByName // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionType: null == actionType
                ? _value.actionType
                : actionType // ignore: cast_nullable_to_non_nullable
                      as String,
            actionDescription: null == actionDescription
                ? _value.actionDescription
                : actionDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            ipAddress: freezed == ipAddress
                ? _value.ipAddress
                : ipAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            userAgent: freezed == userAgent
                ? _value.userAgent
                : userAgent // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
abstract class _$$UserActivityLogAdminImplCopyWith<$Res>
    implements $UserActivityLogAdminCopyWith<$Res> {
  factory _$$UserActivityLogAdminImplCopyWith(
    _$UserActivityLogAdminImpl value,
    $Res Function(_$UserActivityLogAdminImpl) then,
  ) = __$$UserActivityLogAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'performed_by') String? performedBy,
    @JsonKey(name: 'performed_by_name') String? performedByName,
    @JsonKey(name: 'action_type') String actionType,
    @JsonKey(name: 'action_description') String actionDescription,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'user_agent') String? userAgent,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$UserActivityLogAdminImplCopyWithImpl<$Res>
    extends _$UserActivityLogAdminCopyWithImpl<$Res, _$UserActivityLogAdminImpl>
    implements _$$UserActivityLogAdminImplCopyWith<$Res> {
  __$$UserActivityLogAdminImplCopyWithImpl(
    _$UserActivityLogAdminImpl _value,
    $Res Function(_$UserActivityLogAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserActivityLogAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? performedBy = freezed,
    Object? performedByName = freezed,
    Object? actionType = null,
    Object? actionDescription = null,
    Object? ipAddress = freezed,
    Object? userAgent = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$UserActivityLogAdminImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        performedBy: freezed == performedBy
            ? _value.performedBy
            : performedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        performedByName: freezed == performedByName
            ? _value.performedByName
            : performedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionType: null == actionType
            ? _value.actionType
            : actionType // ignore: cast_nullable_to_non_nullable
                  as String,
        actionDescription: null == actionDescription
            ? _value.actionDescription
            : actionDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        ipAddress: freezed == ipAddress
            ? _value.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAgent: freezed == userAgent
            ? _value.userAgent
            : userAgent // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$UserActivityLogAdminImpl implements _UserActivityLogAdmin {
  const _$UserActivityLogAdminImpl({
    required this.id,
    @JsonKey(name: 'performed_by') this.performedBy,
    @JsonKey(name: 'performed_by_name') this.performedByName,
    @JsonKey(name: 'action_type') required this.actionType,
    @JsonKey(name: 'action_description') required this.actionDescription,
    @JsonKey(name: 'ip_address') this.ipAddress,
    @JsonKey(name: 'user_agent') this.userAgent,
    final Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') required this.createdAt,
  }) : _metadata = metadata;

  factory _$UserActivityLogAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActivityLogAdminImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'performed_by')
  final String? performedBy;
  @override
  @JsonKey(name: 'performed_by_name')
  final String? performedByName;
  @override
  @JsonKey(name: 'action_type')
  final String actionType;
  @override
  @JsonKey(name: 'action_description')
  final String actionDescription;
  @override
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  @override
  @JsonKey(name: 'user_agent')
  final String? userAgent;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'UserActivityLogAdmin(id: $id, performedBy: $performedBy, performedByName: $performedByName, actionType: $actionType, actionDescription: $actionDescription, ipAddress: $ipAddress, userAgent: $userAgent, metadata: $metadata, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivityLogAdminImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.performedByName, performedByName) ||
                other.performedByName == performedByName) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.actionDescription, actionDescription) ||
                other.actionDescription == actionDescription) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    performedBy,
    performedByName,
    actionType,
    actionDescription,
    ipAddress,
    userAgent,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
  );

  /// Create a copy of UserActivityLogAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivityLogAdminImplCopyWith<_$UserActivityLogAdminImpl>
  get copyWith =>
      __$$UserActivityLogAdminImplCopyWithImpl<_$UserActivityLogAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActivityLogAdminImplToJson(this);
  }
}

abstract class _UserActivityLogAdmin implements UserActivityLogAdmin {
  const factory _UserActivityLogAdmin({
    required final String id,
    @JsonKey(name: 'performed_by') final String? performedBy,
    @JsonKey(name: 'performed_by_name') final String? performedByName,
    @JsonKey(name: 'action_type') required final String actionType,
    @JsonKey(name: 'action_description')
    required final String actionDescription,
    @JsonKey(name: 'ip_address') final String? ipAddress,
    @JsonKey(name: 'user_agent') final String? userAgent,
    final Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$UserActivityLogAdminImpl;

  factory _UserActivityLogAdmin.fromJson(Map<String, dynamic> json) =
      _$UserActivityLogAdminImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'performed_by')
  String? get performedBy;
  @override
  @JsonKey(name: 'performed_by_name')
  String? get performedByName;
  @override
  @JsonKey(name: 'action_type')
  String get actionType;
  @override
  @JsonKey(name: 'action_description')
  String get actionDescription;
  @override
  @JsonKey(name: 'ip_address')
  String? get ipAddress;
  @override
  @JsonKey(name: 'user_agent')
  String? get userAgent;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of UserActivityLogAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActivityLogAdminImplCopyWith<_$UserActivityLogAdminImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserPaginationAdmin _$UserPaginationAdminFromJson(Map<String, dynamic> json) {
  return _UserPaginationAdmin.fromJson(json);
}

/// @nodoc
mixin _$UserPaginationAdmin {
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this UserPaginationAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPaginationAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPaginationAdminCopyWith<UserPaginationAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPaginationAdminCopyWith<$Res> {
  factory $UserPaginationAdminCopyWith(
    UserPaginationAdmin value,
    $Res Function(UserPaginationAdmin) then,
  ) = _$UserPaginationAdminCopyWithImpl<$Res, UserPaginationAdmin>;
  @useResult
  $Res call({
    int page,
    @JsonKey(name: 'page_size') int pageSize,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'total_pages') int totalPages,
  });
}

/// @nodoc
class _$UserPaginationAdminCopyWithImpl<$Res, $Val extends UserPaginationAdmin>
    implements $UserPaginationAdminCopyWith<$Res> {
  _$UserPaginationAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPaginationAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            pageSize: null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserPaginationAdminImplCopyWith<$Res>
    implements $UserPaginationAdminCopyWith<$Res> {
  factory _$$UserPaginationAdminImplCopyWith(
    _$UserPaginationAdminImpl value,
    $Res Function(_$UserPaginationAdminImpl) then,
  ) = __$$UserPaginationAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    @JsonKey(name: 'page_size') int pageSize,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'total_pages') int totalPages,
  });
}

/// @nodoc
class __$$UserPaginationAdminImplCopyWithImpl<$Res>
    extends _$UserPaginationAdminCopyWithImpl<$Res, _$UserPaginationAdminImpl>
    implements _$$UserPaginationAdminImplCopyWith<$Res> {
  __$$UserPaginationAdminImplCopyWithImpl(
    _$UserPaginationAdminImpl _value,
    $Res Function(_$UserPaginationAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPaginationAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _$UserPaginationAdminImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPaginationAdminImpl implements _UserPaginationAdmin {
  const _$UserPaginationAdminImpl({
    required this.page,
    @JsonKey(name: 'page_size') required this.pageSize,
    @JsonKey(name: 'total_count') required this.totalCount,
    @JsonKey(name: 'total_pages') required this.totalPages,
  });

  factory _$UserPaginationAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPaginationAdminImplFromJson(json);

  @override
  final int page;
  @override
  @JsonKey(name: 'page_size')
  final int pageSize;
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @override
  String toString() {
    return 'UserPaginationAdmin(page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPaginationAdminImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, totalCount, totalPages);

  /// Create a copy of UserPaginationAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPaginationAdminImplCopyWith<_$UserPaginationAdminImpl> get copyWith =>
      __$$UserPaginationAdminImplCopyWithImpl<_$UserPaginationAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPaginationAdminImplToJson(this);
  }
}

abstract class _UserPaginationAdmin implements UserPaginationAdmin {
  const factory _UserPaginationAdmin({
    required final int page,
    @JsonKey(name: 'page_size') required final int pageSize,
    @JsonKey(name: 'total_count') required final int totalCount,
    @JsonKey(name: 'total_pages') required final int totalPages,
  }) = _$UserPaginationAdminImpl;

  factory _UserPaginationAdmin.fromJson(Map<String, dynamic> json) =
      _$UserPaginationAdminImpl.fromJson;

  @override
  int get page;
  @override
  @JsonKey(name: 'page_size')
  int get pageSize;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;

  /// Create a copy of UserPaginationAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPaginationAdminImplCopyWith<_$UserPaginationAdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsersListResponseAdmin _$UsersListResponseAdminFromJson(
  Map<String, dynamic> json,
) {
  return _UsersListResponseAdmin.fromJson(json);
}

/// @nodoc
mixin _$UsersListResponseAdmin {
  List<UserModelAdmin> get users => throw _privateConstructorUsedError;
  UserPaginationAdmin get pagination => throw _privateConstructorUsedError;

  /// Serializes this UsersListResponseAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersListResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersListResponseAdminCopyWith<UsersListResponseAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListResponseAdminCopyWith<$Res> {
  factory $UsersListResponseAdminCopyWith(
    UsersListResponseAdmin value,
    $Res Function(UsersListResponseAdmin) then,
  ) = _$UsersListResponseAdminCopyWithImpl<$Res, UsersListResponseAdmin>;
  @useResult
  $Res call({List<UserModelAdmin> users, UserPaginationAdmin pagination});

  $UserPaginationAdminCopyWith<$Res> get pagination;
}

/// @nodoc
class _$UsersListResponseAdminCopyWithImpl<
  $Res,
  $Val extends UsersListResponseAdmin
>
    implements $UsersListResponseAdminCopyWith<$Res> {
  _$UsersListResponseAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersListResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            users: null == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as List<UserModelAdmin>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as UserPaginationAdmin,
          )
          as $Val,
    );
  }

  /// Create a copy of UsersListResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPaginationAdminCopyWith<$Res> get pagination {
    return $UserPaginationAdminCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UsersListResponseAdminImplCopyWith<$Res>
    implements $UsersListResponseAdminCopyWith<$Res> {
  factory _$$UsersListResponseAdminImplCopyWith(
    _$UsersListResponseAdminImpl value,
    $Res Function(_$UsersListResponseAdminImpl) then,
  ) = __$$UsersListResponseAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserModelAdmin> users, UserPaginationAdmin pagination});

  @override
  $UserPaginationAdminCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$UsersListResponseAdminImplCopyWithImpl<$Res>
    extends
        _$UsersListResponseAdminCopyWithImpl<$Res, _$UsersListResponseAdminImpl>
    implements _$$UsersListResponseAdminImplCopyWith<$Res> {
  __$$UsersListResponseAdminImplCopyWithImpl(
    _$UsersListResponseAdminImpl _value,
    $Res Function(_$UsersListResponseAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersListResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null, Object? pagination = null}) {
    return _then(
      _$UsersListResponseAdminImpl(
        users: null == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<UserModelAdmin>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as UserPaginationAdmin,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersListResponseAdminImpl implements _UsersListResponseAdmin {
  const _$UsersListResponseAdminImpl({
    required final List<UserModelAdmin> users,
    required this.pagination,
  }) : _users = users;

  factory _$UsersListResponseAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersListResponseAdminImplFromJson(json);

  final List<UserModelAdmin> _users;
  @override
  List<UserModelAdmin> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final UserPaginationAdmin pagination;

  @override
  String toString() {
    return 'UsersListResponseAdmin(users: $users, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersListResponseAdminImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_users),
    pagination,
  );

  /// Create a copy of UsersListResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersListResponseAdminImplCopyWith<_$UsersListResponseAdminImpl>
  get copyWith =>
      __$$UsersListResponseAdminImplCopyWithImpl<_$UsersListResponseAdminImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersListResponseAdminImplToJson(this);
  }
}

abstract class _UsersListResponseAdmin implements UsersListResponseAdmin {
  const factory _UsersListResponseAdmin({
    required final List<UserModelAdmin> users,
    required final UserPaginationAdmin pagination,
  }) = _$UsersListResponseAdminImpl;

  factory _UsersListResponseAdmin.fromJson(Map<String, dynamic> json) =
      _$UsersListResponseAdminImpl.fromJson;

  @override
  List<UserModelAdmin> get users;
  @override
  UserPaginationAdmin get pagination;

  /// Create a copy of UsersListResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersListResponseAdminImplCopyWith<_$UsersListResponseAdminImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ActivityLogsResponseAdmin _$ActivityLogsResponseAdminFromJson(
  Map<String, dynamic> json,
) {
  return _ActivityLogsResponseAdmin.fromJson(json);
}

/// @nodoc
mixin _$ActivityLogsResponseAdmin {
  List<UserActivityLogAdmin> get logs => throw _privateConstructorUsedError;
  UserPaginationAdmin get pagination => throw _privateConstructorUsedError;

  /// Serializes this ActivityLogsResponseAdmin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityLogsResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityLogsResponseAdminCopyWith<ActivityLogsResponseAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityLogsResponseAdminCopyWith<$Res> {
  factory $ActivityLogsResponseAdminCopyWith(
    ActivityLogsResponseAdmin value,
    $Res Function(ActivityLogsResponseAdmin) then,
  ) = _$ActivityLogsResponseAdminCopyWithImpl<$Res, ActivityLogsResponseAdmin>;
  @useResult
  $Res call({List<UserActivityLogAdmin> logs, UserPaginationAdmin pagination});

  $UserPaginationAdminCopyWith<$Res> get pagination;
}

/// @nodoc
class _$ActivityLogsResponseAdminCopyWithImpl<
  $Res,
  $Val extends ActivityLogsResponseAdmin
>
    implements $ActivityLogsResponseAdminCopyWith<$Res> {
  _$ActivityLogsResponseAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityLogsResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logs = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            logs: null == logs
                ? _value.logs
                : logs // ignore: cast_nullable_to_non_nullable
                      as List<UserActivityLogAdmin>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as UserPaginationAdmin,
          )
          as $Val,
    );
  }

  /// Create a copy of ActivityLogsResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPaginationAdminCopyWith<$Res> get pagination {
    return $UserPaginationAdminCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityLogsResponseAdminImplCopyWith<$Res>
    implements $ActivityLogsResponseAdminCopyWith<$Res> {
  factory _$$ActivityLogsResponseAdminImplCopyWith(
    _$ActivityLogsResponseAdminImpl value,
    $Res Function(_$ActivityLogsResponseAdminImpl) then,
  ) = __$$ActivityLogsResponseAdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserActivityLogAdmin> logs, UserPaginationAdmin pagination});

  @override
  $UserPaginationAdminCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$ActivityLogsResponseAdminImplCopyWithImpl<$Res>
    extends
        _$ActivityLogsResponseAdminCopyWithImpl<
          $Res,
          _$ActivityLogsResponseAdminImpl
        >
    implements _$$ActivityLogsResponseAdminImplCopyWith<$Res> {
  __$$ActivityLogsResponseAdminImplCopyWithImpl(
    _$ActivityLogsResponseAdminImpl _value,
    $Res Function(_$ActivityLogsResponseAdminImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActivityLogsResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logs = null, Object? pagination = null}) {
    return _then(
      _$ActivityLogsResponseAdminImpl(
        logs: null == logs
            ? _value._logs
            : logs // ignore: cast_nullable_to_non_nullable
                  as List<UserActivityLogAdmin>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as UserPaginationAdmin,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityLogsResponseAdminImpl implements _ActivityLogsResponseAdmin {
  const _$ActivityLogsResponseAdminImpl({
    required final List<UserActivityLogAdmin> logs,
    required this.pagination,
  }) : _logs = logs;

  factory _$ActivityLogsResponseAdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityLogsResponseAdminImplFromJson(json);

  final List<UserActivityLogAdmin> _logs;
  @override
  List<UserActivityLogAdmin> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  final UserPaginationAdmin pagination;

  @override
  String toString() {
    return 'ActivityLogsResponseAdmin(logs: $logs, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityLogsResponseAdminImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_logs),
    pagination,
  );

  /// Create a copy of ActivityLogsResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityLogsResponseAdminImplCopyWith<_$ActivityLogsResponseAdminImpl>
  get copyWith =>
      __$$ActivityLogsResponseAdminImplCopyWithImpl<
        _$ActivityLogsResponseAdminImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityLogsResponseAdminImplToJson(this);
  }
}

abstract class _ActivityLogsResponseAdmin implements ActivityLogsResponseAdmin {
  const factory _ActivityLogsResponseAdmin({
    required final List<UserActivityLogAdmin> logs,
    required final UserPaginationAdmin pagination,
  }) = _$ActivityLogsResponseAdminImpl;

  factory _ActivityLogsResponseAdmin.fromJson(Map<String, dynamic> json) =
      _$ActivityLogsResponseAdminImpl.fromJson;

  @override
  List<UserActivityLogAdmin> get logs;
  @override
  UserPaginationAdmin get pagination;

  /// Create a copy of ActivityLogsResponseAdmin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityLogsResponseAdminImplCopyWith<_$ActivityLogsResponseAdminImpl>
  get copyWith => throw _privateConstructorUsedError;
}
