// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) {
  return _RoleModel.fromJson(json);
}

/// @nodoc
mixin _$RoleModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_system_role')
  bool get isSystemRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'users_count')
  int? get usersCount => throw _privateConstructorUsedError;

  /// Serializes this RoleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleModelCopyWith<RoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleModelCopyWith<$Res> {
  factory $RoleModelCopyWith(RoleModel value, $Res Function(RoleModel) then) =
      _$RoleModelCopyWithImpl<$Res, RoleModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    Map<String, dynamic> permissions,
    @JsonKey(name: 'is_system_role') bool isSystemRole,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'users_count') int? usersCount,
  });
}

/// @nodoc
class _$RoleModelCopyWithImpl<$Res, $Val extends RoleModel>
    implements $RoleModelCopyWith<$Res> {
  _$RoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
    Object? isSystemRole = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? usersCount = freezed,
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
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            isSystemRole: null == isSystemRole
                ? _value.isSystemRole
                : isSystemRole // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            usersCount: freezed == usersCount
                ? _value.usersCount
                : usersCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoleModelImplCopyWith<$Res>
    implements $RoleModelCopyWith<$Res> {
  factory _$$RoleModelImplCopyWith(
    _$RoleModelImpl value,
    $Res Function(_$RoleModelImpl) then,
  ) = __$$RoleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    Map<String, dynamic> permissions,
    @JsonKey(name: 'is_system_role') bool isSystemRole,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'users_count') int? usersCount,
  });
}

/// @nodoc
class __$$RoleModelImplCopyWithImpl<$Res>
    extends _$RoleModelCopyWithImpl<$Res, _$RoleModelImpl>
    implements _$$RoleModelImplCopyWith<$Res> {
  __$$RoleModelImplCopyWithImpl(
    _$RoleModelImpl _value,
    $Res Function(_$RoleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
    Object? isSystemRole = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? usersCount = freezed,
  }) {
    return _then(
      _$RoleModelImpl(
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
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        isSystemRole: null == isSystemRole
            ? _value.isSystemRole
            : isSystemRole // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        usersCount: freezed == usersCount
            ? _value.usersCount
            : usersCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleModelImpl implements _RoleModel {
  const _$RoleModelImpl({
    required this.id,
    required this.name,
    this.description,
    required final Map<String, dynamic> permissions,
    @JsonKey(name: 'is_system_role') required this.isSystemRole,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'users_count') this.usersCount,
  }) : _permissions = permissions;

  factory _$RoleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  final Map<String, dynamic> _permissions;
  @override
  Map<String, dynamic> get permissions {
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissions);
  }

  @override
  @JsonKey(name: 'is_system_role')
  final bool isSystemRole;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'users_count')
  final int? usersCount;

  @override
  String toString() {
    return 'RoleModel(id: $id, name: $name, description: $description, permissions: $permissions, isSystemRole: $isSystemRole, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, usersCount: $usersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.isSystemRole, isSystemRole) ||
                other.isSystemRole == isSystemRole) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_permissions),
    isSystemRole,
    isActive,
    createdAt,
    updatedAt,
    usersCount,
  );

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleModelImplCopyWith<_$RoleModelImpl> get copyWith =>
      __$$RoleModelImplCopyWithImpl<_$RoleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleModelImplToJson(this);
  }
}

abstract class _RoleModel implements RoleModel {
  const factory _RoleModel({
    required final String id,
    required final String name,
    final String? description,
    required final Map<String, dynamic> permissions,
    @JsonKey(name: 'is_system_role') required final bool isSystemRole,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    @JsonKey(name: 'users_count') final int? usersCount,
  }) = _$RoleModelImpl;

  factory _RoleModel.fromJson(Map<String, dynamic> json) =
      _$RoleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  Map<String, dynamic> get permissions;
  @override
  @JsonKey(name: 'is_system_role')
  bool get isSystemRole;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'users_count')
  int? get usersCount;

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleModelImplCopyWith<_$RoleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateRoleModel _$CreateRoleModelFromJson(Map<String, dynamic> json) {
  return _CreateRoleModel.fromJson(json);
}

/// @nodoc
mixin _$CreateRoleModel {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;

  /// Serializes this CreateRoleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRoleModelCopyWith<CreateRoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoleModelCopyWith<$Res> {
  factory $CreateRoleModelCopyWith(
    CreateRoleModel value,
    $Res Function(CreateRoleModel) then,
  ) = _$CreateRoleModelCopyWithImpl<$Res, CreateRoleModel>;
  @useResult
  $Res call({
    String name,
    String? description,
    Map<String, dynamic> permissions,
  });
}

/// @nodoc
class _$CreateRoleModelCopyWithImpl<$Res, $Val extends CreateRoleModel>
    implements $CreateRoleModelCopyWith<$Res> {
  _$CreateRoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateRoleModelImplCopyWith<$Res>
    implements $CreateRoleModelCopyWith<$Res> {
  factory _$$CreateRoleModelImplCopyWith(
    _$CreateRoleModelImpl value,
    $Res Function(_$CreateRoleModelImpl) then,
  ) = __$$CreateRoleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? description,
    Map<String, dynamic> permissions,
  });
}

/// @nodoc
class __$$CreateRoleModelImplCopyWithImpl<$Res>
    extends _$CreateRoleModelCopyWithImpl<$Res, _$CreateRoleModelImpl>
    implements _$$CreateRoleModelImplCopyWith<$Res> {
  __$$CreateRoleModelImplCopyWithImpl(
    _$CreateRoleModelImpl _value,
    $Res Function(_$CreateRoleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
  }) {
    return _then(
      _$CreateRoleModelImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRoleModelImpl implements _CreateRoleModel {
  const _$CreateRoleModelImpl({
    required this.name,
    this.description,
    required final Map<String, dynamic> permissions,
  }) : _permissions = permissions;

  factory _$CreateRoleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRoleModelImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  final Map<String, dynamic> _permissions;
  @override
  Map<String, dynamic> get permissions {
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissions);
  }

  @override
  String toString() {
    return 'CreateRoleModel(name: $name, description: $description, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoleModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_permissions),
  );

  /// Create a copy of CreateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoleModelImplCopyWith<_$CreateRoleModelImpl> get copyWith =>
      __$$CreateRoleModelImplCopyWithImpl<_$CreateRoleModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRoleModelImplToJson(this);
  }
}

abstract class _CreateRoleModel implements CreateRoleModel {
  const factory _CreateRoleModel({
    required final String name,
    final String? description,
    required final Map<String, dynamic> permissions,
  }) = _$CreateRoleModelImpl;

  factory _CreateRoleModel.fromJson(Map<String, dynamic> json) =
      _$CreateRoleModelImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  Map<String, dynamic> get permissions;

  /// Create a copy of CreateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRoleModelImplCopyWith<_$CreateRoleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateRoleModel _$UpdateRoleModelFromJson(Map<String, dynamic> json) {
  return _UpdateRoleModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateRoleModel {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get permissions => throw _privateConstructorUsedError;

  /// Serializes this UpdateRoleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRoleModelCopyWith<UpdateRoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRoleModelCopyWith<$Res> {
  factory $UpdateRoleModelCopyWith(
    UpdateRoleModel value,
    $Res Function(UpdateRoleModel) then,
  ) = _$UpdateRoleModelCopyWithImpl<$Res, UpdateRoleModel>;
  @useResult
  $Res call({
    String? name,
    String? description,
    Map<String, dynamic>? permissions,
  });
}

/// @nodoc
class _$UpdateRoleModelCopyWithImpl<$Res, $Val extends UpdateRoleModel>
    implements $UpdateRoleModelCopyWith<$Res> {
  _$UpdateRoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? permissions = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UpdateRoleModelImplCopyWith<$Res>
    implements $UpdateRoleModelCopyWith<$Res> {
  factory _$$UpdateRoleModelImplCopyWith(
    _$UpdateRoleModelImpl value,
    $Res Function(_$UpdateRoleModelImpl) then,
  ) = __$$UpdateRoleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? name,
    String? description,
    Map<String, dynamic>? permissions,
  });
}

/// @nodoc
class __$$UpdateRoleModelImplCopyWithImpl<$Res>
    extends _$UpdateRoleModelCopyWithImpl<$Res, _$UpdateRoleModelImpl>
    implements _$$UpdateRoleModelImplCopyWith<$Res> {
  __$$UpdateRoleModelImplCopyWithImpl(
    _$UpdateRoleModelImpl _value,
    $Res Function(_$UpdateRoleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? permissions = freezed,
  }) {
    return _then(
      _$UpdateRoleModelImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
class _$UpdateRoleModelImpl implements _UpdateRoleModel {
  const _$UpdateRoleModelImpl({
    this.name,
    this.description,
    final Map<String, dynamic>? permissions,
  }) : _permissions = permissions;

  factory _$UpdateRoleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateRoleModelImplFromJson(json);

  @override
  final String? name;
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
  String toString() {
    return 'UpdateRoleModel(name: $name, description: $description, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRoleModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_permissions),
  );

  /// Create a copy of UpdateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRoleModelImplCopyWith<_$UpdateRoleModelImpl> get copyWith =>
      __$$UpdateRoleModelImplCopyWithImpl<_$UpdateRoleModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateRoleModelImplToJson(this);
  }
}

abstract class _UpdateRoleModel implements UpdateRoleModel {
  const factory _UpdateRoleModel({
    final String? name,
    final String? description,
    final Map<String, dynamic>? permissions,
  }) = _$UpdateRoleModelImpl;

  factory _UpdateRoleModel.fromJson(Map<String, dynamic> json) =
      _$UpdateRoleModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get permissions;

  /// Create a copy of UpdateRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRoleModelImplCopyWith<_$UpdateRoleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateRolePermissionsModel _$UpdateRolePermissionsModelFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateRolePermissionsModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateRolePermissionsModel {
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;

  /// Serializes this UpdateRolePermissionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRolePermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRolePermissionsModelCopyWith<UpdateRolePermissionsModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRolePermissionsModelCopyWith<$Res> {
  factory $UpdateRolePermissionsModelCopyWith(
    UpdateRolePermissionsModel value,
    $Res Function(UpdateRolePermissionsModel) then,
  ) =
      _$UpdateRolePermissionsModelCopyWithImpl<
        $Res,
        UpdateRolePermissionsModel
      >;
  @useResult
  $Res call({Map<String, dynamic> permissions});
}

/// @nodoc
class _$UpdateRolePermissionsModelCopyWithImpl<
  $Res,
  $Val extends UpdateRolePermissionsModel
>
    implements $UpdateRolePermissionsModelCopyWith<$Res> {
  _$UpdateRolePermissionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRolePermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? permissions = null}) {
    return _then(
      _value.copyWith(
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateRolePermissionsModelImplCopyWith<$Res>
    implements $UpdateRolePermissionsModelCopyWith<$Res> {
  factory _$$UpdateRolePermissionsModelImplCopyWith(
    _$UpdateRolePermissionsModelImpl value,
    $Res Function(_$UpdateRolePermissionsModelImpl) then,
  ) = __$$UpdateRolePermissionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> permissions});
}

/// @nodoc
class __$$UpdateRolePermissionsModelImplCopyWithImpl<$Res>
    extends
        _$UpdateRolePermissionsModelCopyWithImpl<
          $Res,
          _$UpdateRolePermissionsModelImpl
        >
    implements _$$UpdateRolePermissionsModelImplCopyWith<$Res> {
  __$$UpdateRolePermissionsModelImplCopyWithImpl(
    _$UpdateRolePermissionsModelImpl _value,
    $Res Function(_$UpdateRolePermissionsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateRolePermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? permissions = null}) {
    return _then(
      _$UpdateRolePermissionsModelImpl(
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateRolePermissionsModelImpl implements _UpdateRolePermissionsModel {
  const _$UpdateRolePermissionsModelImpl({
    required final Map<String, dynamic> permissions,
  }) : _permissions = permissions;

  factory _$UpdateRolePermissionsModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdateRolePermissionsModelImplFromJson(json);

  final Map<String, dynamic> _permissions;
  @override
  Map<String, dynamic> get permissions {
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissions);
  }

  @override
  String toString() {
    return 'UpdateRolePermissionsModel(permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRolePermissionsModelImpl &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_permissions),
  );

  /// Create a copy of UpdateRolePermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRolePermissionsModelImplCopyWith<_$UpdateRolePermissionsModelImpl>
  get copyWith =>
      __$$UpdateRolePermissionsModelImplCopyWithImpl<
        _$UpdateRolePermissionsModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateRolePermissionsModelImplToJson(this);
  }
}

abstract class _UpdateRolePermissionsModel
    implements UpdateRolePermissionsModel {
  const factory _UpdateRolePermissionsModel({
    required final Map<String, dynamic> permissions,
  }) = _$UpdateRolePermissionsModelImpl;

  factory _UpdateRolePermissionsModel.fromJson(Map<String, dynamic> json) =
      _$UpdateRolePermissionsModelImpl.fromJson;

  @override
  Map<String, dynamic> get permissions;

  /// Create a copy of UpdateRolePermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRolePermissionsModelImplCopyWith<_$UpdateRolePermissionsModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PermissionTemplate _$PermissionTemplateFromJson(Map<String, dynamic> json) {
  return _PermissionTemplate.fromJson(json);
}

/// @nodoc
mixin _$PermissionTemplate {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;

  /// Serializes this PermissionTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionTemplateCopyWith<PermissionTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionTemplateCopyWith<$Res> {
  factory $PermissionTemplateCopyWith(
    PermissionTemplate value,
    $Res Function(PermissionTemplate) then,
  ) = _$PermissionTemplateCopyWithImpl<$Res, PermissionTemplate>;
  @useResult
  $Res call({
    String name,
    String description,
    Map<String, dynamic> permissions,
  });
}

/// @nodoc
class _$PermissionTemplateCopyWithImpl<$Res, $Val extends PermissionTemplate>
    implements $PermissionTemplateCopyWith<$Res> {
  _$PermissionTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? permissions = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PermissionTemplateImplCopyWith<$Res>
    implements $PermissionTemplateCopyWith<$Res> {
  factory _$$PermissionTemplateImplCopyWith(
    _$PermissionTemplateImpl value,
    $Res Function(_$PermissionTemplateImpl) then,
  ) = __$$PermissionTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    Map<String, dynamic> permissions,
  });
}

/// @nodoc
class __$$PermissionTemplateImplCopyWithImpl<$Res>
    extends _$PermissionTemplateCopyWithImpl<$Res, _$PermissionTemplateImpl>
    implements _$$PermissionTemplateImplCopyWith<$Res> {
  __$$PermissionTemplateImplCopyWithImpl(
    _$PermissionTemplateImpl _value,
    $Res Function(_$PermissionTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PermissionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? permissions = null,
  }) {
    return _then(
      _$PermissionTemplateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionTemplateImpl implements _PermissionTemplate {
  const _$PermissionTemplateImpl({
    required this.name,
    required this.description,
    required final Map<String, dynamic> permissions,
  }) : _permissions = permissions;

  factory _$PermissionTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionTemplateImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  final Map<String, dynamic> _permissions;
  @override
  Map<String, dynamic> get permissions {
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissions);
  }

  @override
  String toString() {
    return 'PermissionTemplate(name: $name, description: $description, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionTemplateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_permissions),
  );

  /// Create a copy of PermissionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionTemplateImplCopyWith<_$PermissionTemplateImpl> get copyWith =>
      __$$PermissionTemplateImplCopyWithImpl<_$PermissionTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionTemplateImplToJson(this);
  }
}

abstract class _PermissionTemplate implements PermissionTemplate {
  const factory _PermissionTemplate({
    required final String name,
    required final String description,
    required final Map<String, dynamic> permissions,
  }) = _$PermissionTemplateImpl;

  factory _PermissionTemplate.fromJson(Map<String, dynamic> json) =
      _$PermissionTemplateImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  Map<String, dynamic> get permissions;

  /// Create a copy of PermissionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionTemplateImplCopyWith<_$PermissionTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PermissionTemplatesResponse _$PermissionTemplatesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PermissionTemplatesResponse.fromJson(json);
}

/// @nodoc
mixin _$PermissionTemplatesResponse {
  List<PermissionTemplate> get templates => throw _privateConstructorUsedError;

  /// Serializes this PermissionTemplatesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionTemplatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionTemplatesResponseCopyWith<PermissionTemplatesResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionTemplatesResponseCopyWith<$Res> {
  factory $PermissionTemplatesResponseCopyWith(
    PermissionTemplatesResponse value,
    $Res Function(PermissionTemplatesResponse) then,
  ) =
      _$PermissionTemplatesResponseCopyWithImpl<
        $Res,
        PermissionTemplatesResponse
      >;
  @useResult
  $Res call({List<PermissionTemplate> templates});
}

/// @nodoc
class _$PermissionTemplatesResponseCopyWithImpl<
  $Res,
  $Val extends PermissionTemplatesResponse
>
    implements $PermissionTemplatesResponseCopyWith<$Res> {
  _$PermissionTemplatesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionTemplatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? templates = null}) {
    return _then(
      _value.copyWith(
            templates: null == templates
                ? _value.templates
                : templates // ignore: cast_nullable_to_non_nullable
                      as List<PermissionTemplate>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PermissionTemplatesResponseImplCopyWith<$Res>
    implements $PermissionTemplatesResponseCopyWith<$Res> {
  factory _$$PermissionTemplatesResponseImplCopyWith(
    _$PermissionTemplatesResponseImpl value,
    $Res Function(_$PermissionTemplatesResponseImpl) then,
  ) = __$$PermissionTemplatesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PermissionTemplate> templates});
}

/// @nodoc
class __$$PermissionTemplatesResponseImplCopyWithImpl<$Res>
    extends
        _$PermissionTemplatesResponseCopyWithImpl<
          $Res,
          _$PermissionTemplatesResponseImpl
        >
    implements _$$PermissionTemplatesResponseImplCopyWith<$Res> {
  __$$PermissionTemplatesResponseImplCopyWithImpl(
    _$PermissionTemplatesResponseImpl _value,
    $Res Function(_$PermissionTemplatesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PermissionTemplatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? templates = null}) {
    return _then(
      _$PermissionTemplatesResponseImpl(
        templates: null == templates
            ? _value._templates
            : templates // ignore: cast_nullable_to_non_nullable
                  as List<PermissionTemplate>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionTemplatesResponseImpl
    implements _PermissionTemplatesResponse {
  const _$PermissionTemplatesResponseImpl({
    required final List<PermissionTemplate> templates,
  }) : _templates = templates;

  factory _$PermissionTemplatesResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$PermissionTemplatesResponseImplFromJson(json);

  final List<PermissionTemplate> _templates;
  @override
  List<PermissionTemplate> get templates {
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templates);
  }

  @override
  String toString() {
    return 'PermissionTemplatesResponse(templates: $templates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionTemplatesResponseImpl &&
            const DeepCollectionEquality().equals(
              other._templates,
              _templates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_templates));

  /// Create a copy of PermissionTemplatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionTemplatesResponseImplCopyWith<_$PermissionTemplatesResponseImpl>
  get copyWith =>
      __$$PermissionTemplatesResponseImplCopyWithImpl<
        _$PermissionTemplatesResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionTemplatesResponseImplToJson(this);
  }
}

abstract class _PermissionTemplatesResponse
    implements PermissionTemplatesResponse {
  const factory _PermissionTemplatesResponse({
    required final List<PermissionTemplate> templates,
  }) = _$PermissionTemplatesResponseImpl;

  factory _PermissionTemplatesResponse.fromJson(Map<String, dynamic> json) =
      _$PermissionTemplatesResponseImpl.fromJson;

  @override
  List<PermissionTemplate> get templates;

  /// Create a copy of PermissionTemplatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionTemplatesResponseImplCopyWith<_$PermissionTemplatesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RoleUserModel _$RoleUserModelFromJson(Map<String, dynamic> json) {
  return _RoleUserModel.fromJson(json);
}

/// @nodoc
mixin _$RoleUserModel {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login')
  String? get lastLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_at')
  String? get assignedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String? get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  String? get serviceId => throw _privateConstructorUsedError;

  /// Serializes this RoleUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleUserModelCopyWith<RoleUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleUserModelCopyWith<$Res> {
  factory $RoleUserModelCopyWith(
    RoleUserModel value,
    $Res Function(RoleUserModel) then,
  ) = _$RoleUserModelCopyWithImpl<$Res, RoleUserModel>;
  @useResult
  $Res call({
    String id,
    String? email,
    String username,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? phone,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'is_blocked') bool isBlocked,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'assigned_at') String? assignedAt,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  });
}

/// @nodoc
class _$RoleUserModelCopyWithImpl<$Res, $Val extends RoleUserModel>
    implements $RoleUserModelCopyWith<$Res> {
  _$RoleUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleUserModel
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
    Object? isActive = null,
    Object? isBlocked = null,
    Object? lastLogin = freezed,
    Object? createdAt = freezed,
    Object? assignedAt = freezed,
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
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBlocked: null == isBlocked
                ? _value.isBlocked
                : isBlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastLogin: freezed == lastLogin
                ? _value.lastLogin
                : lastLogin // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedAt: freezed == assignedAt
                ? _value.assignedAt
                : assignedAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RoleUserModelImplCopyWith<$Res>
    implements $RoleUserModelCopyWith<$Res> {
  factory _$$RoleUserModelImplCopyWith(
    _$RoleUserModelImpl value,
    $Res Function(_$RoleUserModelImpl) then,
  ) = __$$RoleUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? email,
    String username,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? phone,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'is_blocked') bool isBlocked,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'assigned_at') String? assignedAt,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  });
}

/// @nodoc
class __$$RoleUserModelImplCopyWithImpl<$Res>
    extends _$RoleUserModelCopyWithImpl<$Res, _$RoleUserModelImpl>
    implements _$$RoleUserModelImplCopyWith<$Res> {
  __$$RoleUserModelImplCopyWithImpl(
    _$RoleUserModelImpl _value,
    $Res Function(_$RoleUserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoleUserModel
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
    Object? isActive = null,
    Object? isBlocked = null,
    Object? lastLogin = freezed,
    Object? createdAt = freezed,
    Object? assignedAt = freezed,
    Object? organizationId = freezed,
    Object? clinicId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(
      _$RoleUserModelImpl(
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
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBlocked: null == isBlocked
            ? _value.isBlocked
            : isBlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastLogin: freezed == lastLogin
            ? _value.lastLogin
            : lastLogin // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedAt: freezed == assignedAt
            ? _value.assignedAt
            : assignedAt // ignore: cast_nullable_to_non_nullable
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
class _$RoleUserModelImpl implements _RoleUserModel {
  const _$RoleUserModelImpl({
    required this.id,
    this.email,
    required this.username,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    this.phone,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'is_blocked') required this.isBlocked,
    @JsonKey(name: 'last_login') this.lastLogin,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'assigned_at') this.assignedAt,
    @JsonKey(name: 'organization_id') this.organizationId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'service_id') this.serviceId,
  });

  factory _$RoleUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleUserModelImplFromJson(json);

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
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @override
  @JsonKey(name: 'last_login')
  final String? lastLogin;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'assigned_at')
  final String? assignedAt;
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
    return 'RoleUserModel(id: $id, email: $email, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, isActive: $isActive, isBlocked: $isBlocked, lastLogin: $lastLogin, createdAt: $createdAt, assignedAt: $assignedAt, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.assignedAt, assignedAt) ||
                other.assignedAt == assignedAt) &&
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
    email,
    username,
    firstName,
    lastName,
    phone,
    isActive,
    isBlocked,
    lastLogin,
    createdAt,
    assignedAt,
    organizationId,
    clinicId,
    serviceId,
  );

  /// Create a copy of RoleUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleUserModelImplCopyWith<_$RoleUserModelImpl> get copyWith =>
      __$$RoleUserModelImplCopyWithImpl<_$RoleUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleUserModelImplToJson(this);
  }
}

abstract class _RoleUserModel implements RoleUserModel {
  const factory _RoleUserModel({
    required final String id,
    final String? email,
    required final String username,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    final String? phone,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'is_blocked') required final bool isBlocked,
    @JsonKey(name: 'last_login') final String? lastLogin,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'assigned_at') final String? assignedAt,
    @JsonKey(name: 'organization_id') final String? organizationId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'service_id') final String? serviceId,
  }) = _$RoleUserModelImpl;

  factory _RoleUserModel.fromJson(Map<String, dynamic> json) =
      _$RoleUserModelImpl.fromJson;

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
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;
  @override
  @JsonKey(name: 'last_login')
  String? get lastLogin;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'assigned_at')
  String? get assignedAt;
  @override
  @JsonKey(name: 'organization_id')
  String? get organizationId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'service_id')
  String? get serviceId;

  /// Create a copy of RoleUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleUserModelImplCopyWith<_$RoleUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RolePagination _$RolePaginationFromJson(Map<String, dynamic> json) {
  return _RolePagination.fromJson(json);
}

/// @nodoc
mixin _$RolePagination {
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this RolePagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RolePagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RolePaginationCopyWith<RolePagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolePaginationCopyWith<$Res> {
  factory $RolePaginationCopyWith(
    RolePagination value,
    $Res Function(RolePagination) then,
  ) = _$RolePaginationCopyWithImpl<$Res, RolePagination>;
  @useResult
  $Res call({
    int page,
    @JsonKey(name: 'page_size') int pageSize,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'total_pages') int totalPages,
  });
}

/// @nodoc
class _$RolePaginationCopyWithImpl<$Res, $Val extends RolePagination>
    implements $RolePaginationCopyWith<$Res> {
  _$RolePaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RolePagination
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
abstract class _$$RolePaginationImplCopyWith<$Res>
    implements $RolePaginationCopyWith<$Res> {
  factory _$$RolePaginationImplCopyWith(
    _$RolePaginationImpl value,
    $Res Function(_$RolePaginationImpl) then,
  ) = __$$RolePaginationImplCopyWithImpl<$Res>;
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
class __$$RolePaginationImplCopyWithImpl<$Res>
    extends _$RolePaginationCopyWithImpl<$Res, _$RolePaginationImpl>
    implements _$$RolePaginationImplCopyWith<$Res> {
  __$$RolePaginationImplCopyWithImpl(
    _$RolePaginationImpl _value,
    $Res Function(_$RolePaginationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RolePagination
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
      _$RolePaginationImpl(
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
class _$RolePaginationImpl implements _RolePagination {
  const _$RolePaginationImpl({
    required this.page,
    @JsonKey(name: 'page_size') required this.pageSize,
    @JsonKey(name: 'total_count') required this.totalCount,
    @JsonKey(name: 'total_pages') required this.totalPages,
  });

  factory _$RolePaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolePaginationImplFromJson(json);

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
    return 'RolePagination(page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolePaginationImpl &&
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

  /// Create a copy of RolePagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RolePaginationImplCopyWith<_$RolePaginationImpl> get copyWith =>
      __$$RolePaginationImplCopyWithImpl<_$RolePaginationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RolePaginationImplToJson(this);
  }
}

abstract class _RolePagination implements RolePagination {
  const factory _RolePagination({
    required final int page,
    @JsonKey(name: 'page_size') required final int pageSize,
    @JsonKey(name: 'total_count') required final int totalCount,
    @JsonKey(name: 'total_pages') required final int totalPages,
  }) = _$RolePaginationImpl;

  factory _RolePagination.fromJson(Map<String, dynamic> json) =
      _$RolePaginationImpl.fromJson;

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

  /// Create a copy of RolePagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RolePaginationImplCopyWith<_$RolePaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RolesListResponse _$RolesListResponseFromJson(Map<String, dynamic> json) {
  return _RolesListResponse.fromJson(json);
}

/// @nodoc
mixin _$RolesListResponse {
  List<RoleModel> get roles => throw _privateConstructorUsedError;
  RolePagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this RolesListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RolesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RolesListResponseCopyWith<RolesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesListResponseCopyWith<$Res> {
  factory $RolesListResponseCopyWith(
    RolesListResponse value,
    $Res Function(RolesListResponse) then,
  ) = _$RolesListResponseCopyWithImpl<$Res, RolesListResponse>;
  @useResult
  $Res call({List<RoleModel> roles, RolePagination pagination});

  $RolePaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$RolesListResponseCopyWithImpl<$Res, $Val extends RolesListResponse>
    implements $RolesListResponseCopyWith<$Res> {
  _$RolesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RolesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roles = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            roles: null == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<RoleModel>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as RolePagination,
          )
          as $Val,
    );
  }

  /// Create a copy of RolesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RolePaginationCopyWith<$Res> get pagination {
    return $RolePaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RolesListResponseImplCopyWith<$Res>
    implements $RolesListResponseCopyWith<$Res> {
  factory _$$RolesListResponseImplCopyWith(
    _$RolesListResponseImpl value,
    $Res Function(_$RolesListResponseImpl) then,
  ) = __$$RolesListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoleModel> roles, RolePagination pagination});

  @override
  $RolePaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$RolesListResponseImplCopyWithImpl<$Res>
    extends _$RolesListResponseCopyWithImpl<$Res, _$RolesListResponseImpl>
    implements _$$RolesListResponseImplCopyWith<$Res> {
  __$$RolesListResponseImplCopyWithImpl(
    _$RolesListResponseImpl _value,
    $Res Function(_$RolesListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RolesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roles = null, Object? pagination = null}) {
    return _then(
      _$RolesListResponseImpl(
        roles: null == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<RoleModel>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as RolePagination,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RolesListResponseImpl implements _RolesListResponse {
  const _$RolesListResponseImpl({
    required final List<RoleModel> roles,
    required this.pagination,
  }) : _roles = roles;

  factory _$RolesListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolesListResponseImplFromJson(json);

  final List<RoleModel> _roles;
  @override
  List<RoleModel> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final RolePagination pagination;

  @override
  String toString() {
    return 'RolesListResponse(roles: $roles, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolesListResponseImpl &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_roles),
    pagination,
  );

  /// Create a copy of RolesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RolesListResponseImplCopyWith<_$RolesListResponseImpl> get copyWith =>
      __$$RolesListResponseImplCopyWithImpl<_$RolesListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RolesListResponseImplToJson(this);
  }
}

abstract class _RolesListResponse implements RolesListResponse {
  const factory _RolesListResponse({
    required final List<RoleModel> roles,
    required final RolePagination pagination,
  }) = _$RolesListResponseImpl;

  factory _RolesListResponse.fromJson(Map<String, dynamic> json) =
      _$RolesListResponseImpl.fromJson;

  @override
  List<RoleModel> get roles;
  @override
  RolePagination get pagination;

  /// Create a copy of RolesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RolesListResponseImplCopyWith<_$RolesListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoleUsersResponse _$RoleUsersResponseFromJson(Map<String, dynamic> json) {
  return _RoleUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$RoleUsersResponse {
  List<RoleUserModel> get users => throw _privateConstructorUsedError;
  RolePagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this RoleUsersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleUsersResponseCopyWith<RoleUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleUsersResponseCopyWith<$Res> {
  factory $RoleUsersResponseCopyWith(
    RoleUsersResponse value,
    $Res Function(RoleUsersResponse) then,
  ) = _$RoleUsersResponseCopyWithImpl<$Res, RoleUsersResponse>;
  @useResult
  $Res call({List<RoleUserModel> users, RolePagination pagination});

  $RolePaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$RoleUsersResponseCopyWithImpl<$Res, $Val extends RoleUsersResponse>
    implements $RoleUsersResponseCopyWith<$Res> {
  _$RoleUsersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            users: null == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as List<RoleUserModel>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as RolePagination,
          )
          as $Val,
    );
  }

  /// Create a copy of RoleUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RolePaginationCopyWith<$Res> get pagination {
    return $RolePaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoleUsersResponseImplCopyWith<$Res>
    implements $RoleUsersResponseCopyWith<$Res> {
  factory _$$RoleUsersResponseImplCopyWith(
    _$RoleUsersResponseImpl value,
    $Res Function(_$RoleUsersResponseImpl) then,
  ) = __$$RoleUsersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoleUserModel> users, RolePagination pagination});

  @override
  $RolePaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$RoleUsersResponseImplCopyWithImpl<$Res>
    extends _$RoleUsersResponseCopyWithImpl<$Res, _$RoleUsersResponseImpl>
    implements _$$RoleUsersResponseImplCopyWith<$Res> {
  __$$RoleUsersResponseImplCopyWithImpl(
    _$RoleUsersResponseImpl _value,
    $Res Function(_$RoleUsersResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoleUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null, Object? pagination = null}) {
    return _then(
      _$RoleUsersResponseImpl(
        users: null == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<RoleUserModel>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as RolePagination,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleUsersResponseImpl implements _RoleUsersResponse {
  const _$RoleUsersResponseImpl({
    required final List<RoleUserModel> users,
    required this.pagination,
  }) : _users = users;

  factory _$RoleUsersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleUsersResponseImplFromJson(json);

  final List<RoleUserModel> _users;
  @override
  List<RoleUserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final RolePagination pagination;

  @override
  String toString() {
    return 'RoleUsersResponse(users: $users, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleUsersResponseImpl &&
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

  /// Create a copy of RoleUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleUsersResponseImplCopyWith<_$RoleUsersResponseImpl> get copyWith =>
      __$$RoleUsersResponseImplCopyWithImpl<_$RoleUsersResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleUsersResponseImplToJson(this);
  }
}

abstract class _RoleUsersResponse implements RoleUsersResponse {
  const factory _RoleUsersResponse({
    required final List<RoleUserModel> users,
    required final RolePagination pagination,
  }) = _$RoleUsersResponseImpl;

  factory _RoleUsersResponse.fromJson(Map<String, dynamic> json) =
      _$RoleUsersResponseImpl.fromJson;

  @override
  List<RoleUserModel> get users;
  @override
  RolePagination get pagination;

  /// Create a copy of RoleUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleUsersResponseImplCopyWith<_$RoleUsersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
