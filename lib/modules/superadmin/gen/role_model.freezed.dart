// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleModel {

 String get id; String get name; String? get description; Map<String, dynamic> get permissions;@JsonKey(name: 'is_system_role') bool get isSystemRole;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'users_count') int? get usersCount;
/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleModelCopyWith<RoleModel> get copyWith => _$RoleModelCopyWithImpl<RoleModel>(this as RoleModel, _$identity);

  /// Serializes this RoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.isSystemRole, isSystemRole) || other.isSystemRole == isSystemRole)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(permissions),isSystemRole,isActive,createdAt,updatedAt,usersCount);

@override
String toString() {
  return 'RoleModel(id: $id, name: $name, description: $description, permissions: $permissions, isSystemRole: $isSystemRole, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, usersCount: $usersCount)';
}


}

/// @nodoc
abstract mixin class $RoleModelCopyWith<$Res>  {
  factory $RoleModelCopyWith(RoleModel value, $Res Function(RoleModel) _then) = _$RoleModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, Map<String, dynamic> permissions,@JsonKey(name: 'is_system_role') bool isSystemRole,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'users_count') int? usersCount
});




}
/// @nodoc
class _$RoleModelCopyWithImpl<$Res>
    implements $RoleModelCopyWith<$Res> {
  _$RoleModelCopyWithImpl(this._self, this._then);

  final RoleModel _self;
  final $Res Function(RoleModel) _then;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? permissions = null,Object? isSystemRole = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? usersCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isSystemRole: null == isSystemRole ? _self.isSystemRole : isSystemRole // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,usersCount: freezed == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleModel].
extension RoleModelPatterns on RoleModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  Map<String, dynamic> permissions, @JsonKey(name: 'is_system_role')  bool isSystemRole, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'users_count')  int? usersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.permissions,_that.isSystemRole,_that.isActive,_that.createdAt,_that.updatedAt,_that.usersCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  Map<String, dynamic> permissions, @JsonKey(name: 'is_system_role')  bool isSystemRole, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'users_count')  int? usersCount)  $default,) {final _that = this;
switch (_that) {
case _RoleModel():
return $default(_that.id,_that.name,_that.description,_that.permissions,_that.isSystemRole,_that.isActive,_that.createdAt,_that.updatedAt,_that.usersCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  Map<String, dynamic> permissions, @JsonKey(name: 'is_system_role')  bool isSystemRole, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'users_count')  int? usersCount)?  $default,) {final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.permissions,_that.isSystemRole,_that.isActive,_that.createdAt,_that.updatedAt,_that.usersCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleModel implements RoleModel {
  const _RoleModel({required this.id, required this.name, this.description, required final  Map<String, dynamic> permissions, @JsonKey(name: 'is_system_role') required this.isSystemRole, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'users_count') this.usersCount}): _permissions = permissions;
  factory _RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
 final  Map<String, dynamic> _permissions;
@override Map<String, dynamic> get permissions {
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_permissions);
}

@override@JsonKey(name: 'is_system_role') final  bool isSystemRole;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'users_count') final  int? usersCount;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleModelCopyWith<_RoleModel> get copyWith => __$RoleModelCopyWithImpl<_RoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.isSystemRole, isSystemRole) || other.isSystemRole == isSystemRole)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_permissions),isSystemRole,isActive,createdAt,updatedAt,usersCount);

@override
String toString() {
  return 'RoleModel(id: $id, name: $name, description: $description, permissions: $permissions, isSystemRole: $isSystemRole, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, usersCount: $usersCount)';
}


}

/// @nodoc
abstract mixin class _$RoleModelCopyWith<$Res> implements $RoleModelCopyWith<$Res> {
  factory _$RoleModelCopyWith(_RoleModel value, $Res Function(_RoleModel) _then) = __$RoleModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, Map<String, dynamic> permissions,@JsonKey(name: 'is_system_role') bool isSystemRole,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'users_count') int? usersCount
});




}
/// @nodoc
class __$RoleModelCopyWithImpl<$Res>
    implements _$RoleModelCopyWith<$Res> {
  __$RoleModelCopyWithImpl(this._self, this._then);

  final _RoleModel _self;
  final $Res Function(_RoleModel) _then;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? permissions = null,Object? isSystemRole = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? usersCount = freezed,}) {
  return _then(_RoleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isSystemRole: null == isSystemRole ? _self.isSystemRole : isSystemRole // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,usersCount: freezed == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CreateRoleModel {

 String get name; String? get description; Map<String, dynamic> get permissions;
/// Create a copy of CreateRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateRoleModelCopyWith<CreateRoleModel> get copyWith => _$CreateRoleModelCopyWithImpl<CreateRoleModel>(this as CreateRoleModel, _$identity);

  /// Serializes this CreateRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateRoleModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'CreateRoleModel(name: $name, description: $description, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $CreateRoleModelCopyWith<$Res>  {
  factory $CreateRoleModelCopyWith(CreateRoleModel value, $Res Function(CreateRoleModel) _then) = _$CreateRoleModelCopyWithImpl;
@useResult
$Res call({
 String name, String? description, Map<String, dynamic> permissions
});




}
/// @nodoc
class _$CreateRoleModelCopyWithImpl<$Res>
    implements $CreateRoleModelCopyWith<$Res> {
  _$CreateRoleModelCopyWithImpl(this._self, this._then);

  final CreateRoleModel _self;
  final $Res Function(CreateRoleModel) _then;

/// Create a copy of CreateRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? permissions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateRoleModel].
extension CreateRoleModelPatterns on CreateRoleModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateRoleModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateRoleModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateRoleModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  Map<String, dynamic> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateRoleModel() when $default != null:
return $default(_that.name,_that.description,_that.permissions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  Map<String, dynamic> permissions)  $default,) {final _that = this;
switch (_that) {
case _CreateRoleModel():
return $default(_that.name,_that.description,_that.permissions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  Map<String, dynamic> permissions)?  $default,) {final _that = this;
switch (_that) {
case _CreateRoleModel() when $default != null:
return $default(_that.name,_that.description,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateRoleModel implements CreateRoleModel {
  const _CreateRoleModel({required this.name, this.description, required final  Map<String, dynamic> permissions}): _permissions = permissions;
  factory _CreateRoleModel.fromJson(Map<String, dynamic> json) => _$CreateRoleModelFromJson(json);

@override final  String name;
@override final  String? description;
 final  Map<String, dynamic> _permissions;
@override Map<String, dynamic> get permissions {
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_permissions);
}


/// Create a copy of CreateRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateRoleModelCopyWith<_CreateRoleModel> get copyWith => __$CreateRoleModelCopyWithImpl<_CreateRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRoleModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'CreateRoleModel(name: $name, description: $description, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$CreateRoleModelCopyWith<$Res> implements $CreateRoleModelCopyWith<$Res> {
  factory _$CreateRoleModelCopyWith(_CreateRoleModel value, $Res Function(_CreateRoleModel) _then) = __$CreateRoleModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, Map<String, dynamic> permissions
});




}
/// @nodoc
class __$CreateRoleModelCopyWithImpl<$Res>
    implements _$CreateRoleModelCopyWith<$Res> {
  __$CreateRoleModelCopyWithImpl(this._self, this._then);

  final _CreateRoleModel _self;
  final $Res Function(_CreateRoleModel) _then;

/// Create a copy of CreateRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? permissions = null,}) {
  return _then(_CreateRoleModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$UpdateRoleModel {

 String? get name; String? get description; Map<String, dynamic>? get permissions;
/// Create a copy of UpdateRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateRoleModelCopyWith<UpdateRoleModel> get copyWith => _$UpdateRoleModelCopyWithImpl<UpdateRoleModel>(this as UpdateRoleModel, _$identity);

  /// Serializes this UpdateRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRoleModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'UpdateRoleModel(name: $name, description: $description, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $UpdateRoleModelCopyWith<$Res>  {
  factory $UpdateRoleModelCopyWith(UpdateRoleModel value, $Res Function(UpdateRoleModel) _then) = _$UpdateRoleModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? description, Map<String, dynamic>? permissions
});




}
/// @nodoc
class _$UpdateRoleModelCopyWithImpl<$Res>
    implements $UpdateRoleModelCopyWith<$Res> {
  _$UpdateRoleModelCopyWithImpl(this._self, this._then);

  final UpdateRoleModel _self;
  final $Res Function(UpdateRoleModel) _then;

/// Create a copy of UpdateRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? description = freezed,Object? permissions = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateRoleModel].
extension UpdateRoleModelPatterns on UpdateRoleModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateRoleModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateRoleModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateRoleModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? description,  Map<String, dynamic>? permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateRoleModel() when $default != null:
return $default(_that.name,_that.description,_that.permissions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? description,  Map<String, dynamic>? permissions)  $default,) {final _that = this;
switch (_that) {
case _UpdateRoleModel():
return $default(_that.name,_that.description,_that.permissions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? description,  Map<String, dynamic>? permissions)?  $default,) {final _that = this;
switch (_that) {
case _UpdateRoleModel() when $default != null:
return $default(_that.name,_that.description,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateRoleModel implements UpdateRoleModel {
  const _UpdateRoleModel({this.name, this.description, final  Map<String, dynamic>? permissions}): _permissions = permissions;
  factory _UpdateRoleModel.fromJson(Map<String, dynamic> json) => _$UpdateRoleModelFromJson(json);

@override final  String? name;
@override final  String? description;
 final  Map<String, dynamic>? _permissions;
@override Map<String, dynamic>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UpdateRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateRoleModelCopyWith<_UpdateRoleModel> get copyWith => __$UpdateRoleModelCopyWithImpl<_UpdateRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateRoleModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'UpdateRoleModel(name: $name, description: $description, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$UpdateRoleModelCopyWith<$Res> implements $UpdateRoleModelCopyWith<$Res> {
  factory _$UpdateRoleModelCopyWith(_UpdateRoleModel value, $Res Function(_UpdateRoleModel) _then) = __$UpdateRoleModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? description, Map<String, dynamic>? permissions
});




}
/// @nodoc
class __$UpdateRoleModelCopyWithImpl<$Res>
    implements _$UpdateRoleModelCopyWith<$Res> {
  __$UpdateRoleModelCopyWithImpl(this._self, this._then);

  final _UpdateRoleModel _self;
  final $Res Function(_UpdateRoleModel) _then;

/// Create a copy of UpdateRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? description = freezed,Object? permissions = freezed,}) {
  return _then(_UpdateRoleModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$UpdateRolePermissionsModel {

 Map<String, dynamic> get permissions;
/// Create a copy of UpdateRolePermissionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateRolePermissionsModelCopyWith<UpdateRolePermissionsModel> get copyWith => _$UpdateRolePermissionsModelCopyWithImpl<UpdateRolePermissionsModel>(this as UpdateRolePermissionsModel, _$identity);

  /// Serializes this UpdateRolePermissionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRolePermissionsModel&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'UpdateRolePermissionsModel(permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $UpdateRolePermissionsModelCopyWith<$Res>  {
  factory $UpdateRolePermissionsModelCopyWith(UpdateRolePermissionsModel value, $Res Function(UpdateRolePermissionsModel) _then) = _$UpdateRolePermissionsModelCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> permissions
});




}
/// @nodoc
class _$UpdateRolePermissionsModelCopyWithImpl<$Res>
    implements $UpdateRolePermissionsModelCopyWith<$Res> {
  _$UpdateRolePermissionsModelCopyWithImpl(this._self, this._then);

  final UpdateRolePermissionsModel _self;
  final $Res Function(UpdateRolePermissionsModel) _then;

/// Create a copy of UpdateRolePermissionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permissions = null,}) {
  return _then(_self.copyWith(
permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateRolePermissionsModel].
extension UpdateRolePermissionsModelPatterns on UpdateRolePermissionsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateRolePermissionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateRolePermissionsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateRolePermissionsModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateRolePermissionsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateRolePermissionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateRolePermissionsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateRolePermissionsModel() when $default != null:
return $default(_that.permissions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> permissions)  $default,) {final _that = this;
switch (_that) {
case _UpdateRolePermissionsModel():
return $default(_that.permissions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> permissions)?  $default,) {final _that = this;
switch (_that) {
case _UpdateRolePermissionsModel() when $default != null:
return $default(_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateRolePermissionsModel implements UpdateRolePermissionsModel {
  const _UpdateRolePermissionsModel({required final  Map<String, dynamic> permissions}): _permissions = permissions;
  factory _UpdateRolePermissionsModel.fromJson(Map<String, dynamic> json) => _$UpdateRolePermissionsModelFromJson(json);

 final  Map<String, dynamic> _permissions;
@override Map<String, dynamic> get permissions {
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_permissions);
}


/// Create a copy of UpdateRolePermissionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateRolePermissionsModelCopyWith<_UpdateRolePermissionsModel> get copyWith => __$UpdateRolePermissionsModelCopyWithImpl<_UpdateRolePermissionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateRolePermissionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateRolePermissionsModel&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'UpdateRolePermissionsModel(permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$UpdateRolePermissionsModelCopyWith<$Res> implements $UpdateRolePermissionsModelCopyWith<$Res> {
  factory _$UpdateRolePermissionsModelCopyWith(_UpdateRolePermissionsModel value, $Res Function(_UpdateRolePermissionsModel) _then) = __$UpdateRolePermissionsModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> permissions
});




}
/// @nodoc
class __$UpdateRolePermissionsModelCopyWithImpl<$Res>
    implements _$UpdateRolePermissionsModelCopyWith<$Res> {
  __$UpdateRolePermissionsModelCopyWithImpl(this._self, this._then);

  final _UpdateRolePermissionsModel _self;
  final $Res Function(_UpdateRolePermissionsModel) _then;

/// Create a copy of UpdateRolePermissionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permissions = null,}) {
  return _then(_UpdateRolePermissionsModel(
permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$PermissionTemplate {

 String get name; String get description; Map<String, dynamic> get permissions;
/// Create a copy of PermissionTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionTemplateCopyWith<PermissionTemplate> get copyWith => _$PermissionTemplateCopyWithImpl<PermissionTemplate>(this as PermissionTemplate, _$identity);

  /// Serializes this PermissionTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'PermissionTemplate(name: $name, description: $description, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $PermissionTemplateCopyWith<$Res>  {
  factory $PermissionTemplateCopyWith(PermissionTemplate value, $Res Function(PermissionTemplate) _then) = _$PermissionTemplateCopyWithImpl;
@useResult
$Res call({
 String name, String description, Map<String, dynamic> permissions
});




}
/// @nodoc
class _$PermissionTemplateCopyWithImpl<$Res>
    implements $PermissionTemplateCopyWith<$Res> {
  _$PermissionTemplateCopyWithImpl(this._self, this._then);

  final PermissionTemplate _self;
  final $Res Function(PermissionTemplate) _then;

/// Create a copy of PermissionTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? permissions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionTemplate].
extension PermissionTemplatePatterns on PermissionTemplate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionTemplate() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionTemplate value)  $default,){
final _that = this;
switch (_that) {
case _PermissionTemplate():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionTemplate() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  Map<String, dynamic> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionTemplate() when $default != null:
return $default(_that.name,_that.description,_that.permissions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  Map<String, dynamic> permissions)  $default,) {final _that = this;
switch (_that) {
case _PermissionTemplate():
return $default(_that.name,_that.description,_that.permissions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  Map<String, dynamic> permissions)?  $default,) {final _that = this;
switch (_that) {
case _PermissionTemplate() when $default != null:
return $default(_that.name,_that.description,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PermissionTemplate implements PermissionTemplate {
  const _PermissionTemplate({required this.name, required this.description, required final  Map<String, dynamic> permissions}): _permissions = permissions;
  factory _PermissionTemplate.fromJson(Map<String, dynamic> json) => _$PermissionTemplateFromJson(json);

@override final  String name;
@override final  String description;
 final  Map<String, dynamic> _permissions;
@override Map<String, dynamic> get permissions {
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_permissions);
}


/// Create a copy of PermissionTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionTemplateCopyWith<_PermissionTemplate> get copyWith => __$PermissionTemplateCopyWithImpl<_PermissionTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermissionTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'PermissionTemplate(name: $name, description: $description, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$PermissionTemplateCopyWith<$Res> implements $PermissionTemplateCopyWith<$Res> {
  factory _$PermissionTemplateCopyWith(_PermissionTemplate value, $Res Function(_PermissionTemplate) _then) = __$PermissionTemplateCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, Map<String, dynamic> permissions
});




}
/// @nodoc
class __$PermissionTemplateCopyWithImpl<$Res>
    implements _$PermissionTemplateCopyWith<$Res> {
  __$PermissionTemplateCopyWithImpl(this._self, this._then);

  final _PermissionTemplate _self;
  final $Res Function(_PermissionTemplate) _then;

/// Create a copy of PermissionTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? permissions = null,}) {
  return _then(_PermissionTemplate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$PermissionTemplatesResponse {

 List<PermissionTemplate> get templates;
/// Create a copy of PermissionTemplatesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionTemplatesResponseCopyWith<PermissionTemplatesResponse> get copyWith => _$PermissionTemplatesResponseCopyWithImpl<PermissionTemplatesResponse>(this as PermissionTemplatesResponse, _$identity);

  /// Serializes this PermissionTemplatesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionTemplatesResponse&&const DeepCollectionEquality().equals(other.templates, templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(templates));

@override
String toString() {
  return 'PermissionTemplatesResponse(templates: $templates)';
}


}

/// @nodoc
abstract mixin class $PermissionTemplatesResponseCopyWith<$Res>  {
  factory $PermissionTemplatesResponseCopyWith(PermissionTemplatesResponse value, $Res Function(PermissionTemplatesResponse) _then) = _$PermissionTemplatesResponseCopyWithImpl;
@useResult
$Res call({
 List<PermissionTemplate> templates
});




}
/// @nodoc
class _$PermissionTemplatesResponseCopyWithImpl<$Res>
    implements $PermissionTemplatesResponseCopyWith<$Res> {
  _$PermissionTemplatesResponseCopyWithImpl(this._self, this._then);

  final PermissionTemplatesResponse _self;
  final $Res Function(PermissionTemplatesResponse) _then;

/// Create a copy of PermissionTemplatesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templates = null,}) {
  return _then(_self.copyWith(
templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<PermissionTemplate>,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionTemplatesResponse].
extension PermissionTemplatesResponsePatterns on PermissionTemplatesResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionTemplatesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionTemplatesResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionTemplatesResponse value)  $default,){
final _that = this;
switch (_that) {
case _PermissionTemplatesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionTemplatesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionTemplatesResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PermissionTemplate> templates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionTemplatesResponse() when $default != null:
return $default(_that.templates);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PermissionTemplate> templates)  $default,) {final _that = this;
switch (_that) {
case _PermissionTemplatesResponse():
return $default(_that.templates);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PermissionTemplate> templates)?  $default,) {final _that = this;
switch (_that) {
case _PermissionTemplatesResponse() when $default != null:
return $default(_that.templates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PermissionTemplatesResponse implements PermissionTemplatesResponse {
  const _PermissionTemplatesResponse({required final  List<PermissionTemplate> templates}): _templates = templates;
  factory _PermissionTemplatesResponse.fromJson(Map<String, dynamic> json) => _$PermissionTemplatesResponseFromJson(json);

 final  List<PermissionTemplate> _templates;
@override List<PermissionTemplate> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}


/// Create a copy of PermissionTemplatesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionTemplatesResponseCopyWith<_PermissionTemplatesResponse> get copyWith => __$PermissionTemplatesResponseCopyWithImpl<_PermissionTemplatesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermissionTemplatesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionTemplatesResponse&&const DeepCollectionEquality().equals(other._templates, _templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_templates));

@override
String toString() {
  return 'PermissionTemplatesResponse(templates: $templates)';
}


}

/// @nodoc
abstract mixin class _$PermissionTemplatesResponseCopyWith<$Res> implements $PermissionTemplatesResponseCopyWith<$Res> {
  factory _$PermissionTemplatesResponseCopyWith(_PermissionTemplatesResponse value, $Res Function(_PermissionTemplatesResponse) _then) = __$PermissionTemplatesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PermissionTemplate> templates
});




}
/// @nodoc
class __$PermissionTemplatesResponseCopyWithImpl<$Res>
    implements _$PermissionTemplatesResponseCopyWith<$Res> {
  __$PermissionTemplatesResponseCopyWithImpl(this._self, this._then);

  final _PermissionTemplatesResponse _self;
  final $Res Function(_PermissionTemplatesResponse) _then;

/// Create a copy of PermissionTemplatesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templates = null,}) {
  return _then(_PermissionTemplatesResponse(
templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<PermissionTemplate>,
  ));
}


}


/// @nodoc
mixin _$RoleUserModel {

 String get id; String? get email; String get username;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String? get phone;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_blocked') bool get isBlocked;@JsonKey(name: 'last_login') String? get lastLogin;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'assigned_at') String? get assignedAt;@JsonKey(name: 'organization_id') String? get organizationId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'service_id') String? get serviceId;
/// Create a copy of RoleUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleUserModelCopyWith<RoleUserModel> get copyWith => _$RoleUserModelCopyWithImpl<RoleUserModel>(this as RoleUserModel, _$identity);

  /// Serializes this RoleUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,firstName,lastName,phone,isActive,isBlocked,lastLogin,createdAt,assignedAt,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'RoleUserModel(id: $id, email: $email, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, isActive: $isActive, isBlocked: $isBlocked, lastLogin: $lastLogin, createdAt: $createdAt, assignedAt: $assignedAt, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $RoleUserModelCopyWith<$Res>  {
  factory $RoleUserModelCopyWith(RoleUserModel value, $Res Function(RoleUserModel) _then) = _$RoleUserModelCopyWithImpl;
@useResult
$Res call({
 String id, String? email, String username,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? phone,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_blocked') bool isBlocked,@JsonKey(name: 'last_login') String? lastLogin,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'assigned_at') String? assignedAt,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'service_id') String? serviceId
});




}
/// @nodoc
class _$RoleUserModelCopyWithImpl<$Res>
    implements $RoleUserModelCopyWith<$Res> {
  _$RoleUserModelCopyWithImpl(this._self, this._then);

  final RoleUserModel _self;
  final $Res Function(RoleUserModel) _then;

/// Create a copy of RoleUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = freezed,Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = freezed,Object? isActive = null,Object? isBlocked = null,Object? lastLogin = freezed,Object? createdAt = freezed,Object? assignedAt = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: freezed == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleUserModel].
extension RoleUserModelPatterns on RoleUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleUserModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? email,  String username, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? phone, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'assigned_at')  String? assignedAt, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleUserModel() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.firstName,_that.lastName,_that.phone,_that.isActive,_that.isBlocked,_that.lastLogin,_that.createdAt,_that.assignedAt,_that.organizationId,_that.clinicId,_that.serviceId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? email,  String username, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? phone, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'assigned_at')  String? assignedAt, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)  $default,) {final _that = this;
switch (_that) {
case _RoleUserModel():
return $default(_that.id,_that.email,_that.username,_that.firstName,_that.lastName,_that.phone,_that.isActive,_that.isBlocked,_that.lastLogin,_that.createdAt,_that.assignedAt,_that.organizationId,_that.clinicId,_that.serviceId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? email,  String username, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? phone, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'assigned_at')  String? assignedAt, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)?  $default,) {final _that = this;
switch (_that) {
case _RoleUserModel() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.firstName,_that.lastName,_that.phone,_that.isActive,_that.isBlocked,_that.lastLogin,_that.createdAt,_that.assignedAt,_that.organizationId,_that.clinicId,_that.serviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleUserModel implements RoleUserModel {
  const _RoleUserModel({required this.id, this.email, required this.username, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, this.phone, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'is_blocked') required this.isBlocked, @JsonKey(name: 'last_login') this.lastLogin, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'assigned_at') this.assignedAt, @JsonKey(name: 'organization_id') this.organizationId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'service_id') this.serviceId});
  factory _RoleUserModel.fromJson(Map<String, dynamic> json) => _$RoleUserModelFromJson(json);

@override final  String id;
@override final  String? email;
@override final  String username;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String? phone;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_blocked') final  bool isBlocked;
@override@JsonKey(name: 'last_login') final  String? lastLogin;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'assigned_at') final  String? assignedAt;
@override@JsonKey(name: 'organization_id') final  String? organizationId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'service_id') final  String? serviceId;

/// Create a copy of RoleUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleUserModelCopyWith<_RoleUserModel> get copyWith => __$RoleUserModelCopyWithImpl<_RoleUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,firstName,lastName,phone,isActive,isBlocked,lastLogin,createdAt,assignedAt,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'RoleUserModel(id: $id, email: $email, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, isActive: $isActive, isBlocked: $isBlocked, lastLogin: $lastLogin, createdAt: $createdAt, assignedAt: $assignedAt, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class _$RoleUserModelCopyWith<$Res> implements $RoleUserModelCopyWith<$Res> {
  factory _$RoleUserModelCopyWith(_RoleUserModel value, $Res Function(_RoleUserModel) _then) = __$RoleUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? email, String username,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? phone,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_blocked') bool isBlocked,@JsonKey(name: 'last_login') String? lastLogin,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'assigned_at') String? assignedAt,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'service_id') String? serviceId
});




}
/// @nodoc
class __$RoleUserModelCopyWithImpl<$Res>
    implements _$RoleUserModelCopyWith<$Res> {
  __$RoleUserModelCopyWithImpl(this._self, this._then);

  final _RoleUserModel _self;
  final $Res Function(_RoleUserModel) _then;

/// Create a copy of RoleUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = freezed,Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = freezed,Object? isActive = null,Object? isBlocked = null,Object? lastLogin = freezed,Object? createdAt = freezed,Object? assignedAt = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_RoleUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: freezed == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RolePagination {

 int get page;@JsonKey(name: 'page_size') int get pageSize;@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'total_pages') int get totalPages;
/// Create a copy of RolePagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolePaginationCopyWith<RolePagination> get copyWith => _$RolePaginationCopyWithImpl<RolePagination>(this as RolePagination, _$identity);

  /// Serializes this RolePagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolePagination&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,totalCount,totalPages);

@override
String toString() {
  return 'RolePagination(page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $RolePaginationCopyWith<$Res>  {
  factory $RolePaginationCopyWith(RolePagination value, $Res Function(RolePagination) _then) = _$RolePaginationCopyWithImpl;
@useResult
$Res call({
 int page,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class _$RolePaginationCopyWithImpl<$Res>
    implements $RolePaginationCopyWith<$Res> {
  _$RolePaginationCopyWithImpl(this._self, this._then);

  final RolePagination _self;
  final $Res Function(RolePagination) _then;

/// Create a copy of RolePagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RolePagination].
extension RolePaginationPatterns on RolePagination {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolePagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolePagination() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolePagination value)  $default,){
final _that = this;
switch (_that) {
case _RolePagination():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolePagination value)?  $default,){
final _that = this;
switch (_that) {
case _RolePagination() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'total_pages')  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolePagination() when $default != null:
return $default(_that.page,_that.pageSize,_that.totalCount,_that.totalPages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'total_pages')  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _RolePagination():
return $default(_that.page,_that.pageSize,_that.totalCount,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'total_pages')  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _RolePagination() when $default != null:
return $default(_that.page,_that.pageSize,_that.totalCount,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RolePagination implements RolePagination {
  const _RolePagination({required this.page, @JsonKey(name: 'page_size') required this.pageSize, @JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'total_pages') required this.totalPages});
  factory _RolePagination.fromJson(Map<String, dynamic> json) => _$RolePaginationFromJson(json);

@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;
@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'total_pages') final  int totalPages;

/// Create a copy of RolePagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolePaginationCopyWith<_RolePagination> get copyWith => __$RolePaginationCopyWithImpl<_RolePagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RolePaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolePagination&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,totalCount,totalPages);

@override
String toString() {
  return 'RolePagination(page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$RolePaginationCopyWith<$Res> implements $RolePaginationCopyWith<$Res> {
  factory _$RolePaginationCopyWith(_RolePagination value, $Res Function(_RolePagination) _then) = __$RolePaginationCopyWithImpl;
@override @useResult
$Res call({
 int page,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class __$RolePaginationCopyWithImpl<$Res>
    implements _$RolePaginationCopyWith<$Res> {
  __$RolePaginationCopyWithImpl(this._self, this._then);

  final _RolePagination _self;
  final $Res Function(_RolePagination) _then;

/// Create a copy of RolePagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = null,}) {
  return _then(_RolePagination(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RolesListResponse {

 List<RoleModel> get roles; RolePagination get pagination;
/// Create a copy of RolesListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesListResponseCopyWith<RolesListResponse> get copyWith => _$RolesListResponseCopyWithImpl<RolesListResponse>(this as RolesListResponse, _$identity);

  /// Serializes this RolesListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesListResponse&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(roles),pagination);

@override
String toString() {
  return 'RolesListResponse(roles: $roles, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $RolesListResponseCopyWith<$Res>  {
  factory $RolesListResponseCopyWith(RolesListResponse value, $Res Function(RolesListResponse) _then) = _$RolesListResponseCopyWithImpl;
@useResult
$Res call({
 List<RoleModel> roles, RolePagination pagination
});


$RolePaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$RolesListResponseCopyWithImpl<$Res>
    implements $RolesListResponseCopyWith<$Res> {
  _$RolesListResponseCopyWithImpl(this._self, this._then);

  final RolesListResponse _self;
  final $Res Function(RolesListResponse) _then;

/// Create a copy of RolesListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roles = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RolePagination,
  ));
}
/// Create a copy of RolesListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RolePaginationCopyWith<$Res> get pagination {
  
  return $RolePaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [RolesListResponse].
extension RolesListResponsePatterns on RolesListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolesListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolesListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolesListResponse value)  $default,){
final _that = this;
switch (_that) {
case _RolesListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolesListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RolesListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RoleModel> roles,  RolePagination pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolesListResponse() when $default != null:
return $default(_that.roles,_that.pagination);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RoleModel> roles,  RolePagination pagination)  $default,) {final _that = this;
switch (_that) {
case _RolesListResponse():
return $default(_that.roles,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RoleModel> roles,  RolePagination pagination)?  $default,) {final _that = this;
switch (_that) {
case _RolesListResponse() when $default != null:
return $default(_that.roles,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RolesListResponse implements RolesListResponse {
  const _RolesListResponse({required final  List<RoleModel> roles, required this.pagination}): _roles = roles;
  factory _RolesListResponse.fromJson(Map<String, dynamic> json) => _$RolesListResponseFromJson(json);

 final  List<RoleModel> _roles;
@override List<RoleModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  RolePagination pagination;

/// Create a copy of RolesListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolesListResponseCopyWith<_RolesListResponse> get copyWith => __$RolesListResponseCopyWithImpl<_RolesListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RolesListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolesListResponse&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roles),pagination);

@override
String toString() {
  return 'RolesListResponse(roles: $roles, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$RolesListResponseCopyWith<$Res> implements $RolesListResponseCopyWith<$Res> {
  factory _$RolesListResponseCopyWith(_RolesListResponse value, $Res Function(_RolesListResponse) _then) = __$RolesListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RoleModel> roles, RolePagination pagination
});


@override $RolePaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$RolesListResponseCopyWithImpl<$Res>
    implements _$RolesListResponseCopyWith<$Res> {
  __$RolesListResponseCopyWithImpl(this._self, this._then);

  final _RolesListResponse _self;
  final $Res Function(_RolesListResponse) _then;

/// Create a copy of RolesListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roles = null,Object? pagination = null,}) {
  return _then(_RolesListResponse(
roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RolePagination,
  ));
}

/// Create a copy of RolesListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RolePaginationCopyWith<$Res> get pagination {
  
  return $RolePaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$RoleUsersResponse {

 List<RoleUserModel> get users; RolePagination get pagination;
/// Create a copy of RoleUsersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleUsersResponseCopyWith<RoleUsersResponse> get copyWith => _$RoleUsersResponseCopyWithImpl<RoleUsersResponse>(this as RoleUsersResponse, _$identity);

  /// Serializes this RoleUsersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleUsersResponse&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),pagination);

@override
String toString() {
  return 'RoleUsersResponse(users: $users, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $RoleUsersResponseCopyWith<$Res>  {
  factory $RoleUsersResponseCopyWith(RoleUsersResponse value, $Res Function(RoleUsersResponse) _then) = _$RoleUsersResponseCopyWithImpl;
@useResult
$Res call({
 List<RoleUserModel> users, RolePagination pagination
});


$RolePaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$RoleUsersResponseCopyWithImpl<$Res>
    implements $RoleUsersResponseCopyWith<$Res> {
  _$RoleUsersResponseCopyWithImpl(this._self, this._then);

  final RoleUsersResponse _self;
  final $Res Function(RoleUsersResponse) _then;

/// Create a copy of RoleUsersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<RoleUserModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RolePagination,
  ));
}
/// Create a copy of RoleUsersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RolePaginationCopyWith<$Res> get pagination {
  
  return $RolePaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoleUsersResponse].
extension RoleUsersResponsePatterns on RoleUsersResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleUsersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleUsersResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleUsersResponse value)  $default,){
final _that = this;
switch (_that) {
case _RoleUsersResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleUsersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RoleUsersResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RoleUserModel> users,  RolePagination pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleUsersResponse() when $default != null:
return $default(_that.users,_that.pagination);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RoleUserModel> users,  RolePagination pagination)  $default,) {final _that = this;
switch (_that) {
case _RoleUsersResponse():
return $default(_that.users,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RoleUserModel> users,  RolePagination pagination)?  $default,) {final _that = this;
switch (_that) {
case _RoleUsersResponse() when $default != null:
return $default(_that.users,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleUsersResponse implements RoleUsersResponse {
  const _RoleUsersResponse({required final  List<RoleUserModel> users, required this.pagination}): _users = users;
  factory _RoleUsersResponse.fromJson(Map<String, dynamic> json) => _$RoleUsersResponseFromJson(json);

 final  List<RoleUserModel> _users;
@override List<RoleUserModel> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  RolePagination pagination;

/// Create a copy of RoleUsersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleUsersResponseCopyWith<_RoleUsersResponse> get copyWith => __$RoleUsersResponseCopyWithImpl<_RoleUsersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleUsersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleUsersResponse&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),pagination);

@override
String toString() {
  return 'RoleUsersResponse(users: $users, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$RoleUsersResponseCopyWith<$Res> implements $RoleUsersResponseCopyWith<$Res> {
  factory _$RoleUsersResponseCopyWith(_RoleUsersResponse value, $Res Function(_RoleUsersResponse) _then) = __$RoleUsersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RoleUserModel> users, RolePagination pagination
});


@override $RolePaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$RoleUsersResponseCopyWithImpl<$Res>
    implements _$RoleUsersResponseCopyWith<$Res> {
  __$RoleUsersResponseCopyWithImpl(this._self, this._then);

  final _RoleUsersResponse _self;
  final $Res Function(_RoleUsersResponse) _then;

/// Create a copy of RoleUsersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? pagination = null,}) {
  return _then(_RoleUsersResponse(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<RoleUserModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RolePagination,
  ));
}

/// Create a copy of RoleUsersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RolePaginationCopyWith<$Res> get pagination {
  
  return $RolePaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
