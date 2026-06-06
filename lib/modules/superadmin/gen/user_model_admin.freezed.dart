// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/user_model_admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRoleAdmin {

 String get id; String get name; String? get description; Map<String, dynamic>? get permissions;@JsonKey(name: 'is_active') bool? get isActive;@JsonKey(name: 'organization_id') String? get organizationId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'service_id') String? get serviceId;
/// Create a copy of UserRoleAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRoleAdminCopyWith<UserRoleAdmin> get copyWith => _$UserRoleAdminCopyWithImpl<UserRoleAdmin>(this as UserRoleAdmin, _$identity);

  /// Serializes this UserRoleAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRoleAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(permissions),isActive,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'UserRoleAdmin(id: $id, name: $name, description: $description, permissions: $permissions, isActive: $isActive, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $UserRoleAdminCopyWith<$Res>  {
  factory $UserRoleAdminCopyWith(UserRoleAdmin value, $Res Function(UserRoleAdmin) _then) = _$UserRoleAdminCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, Map<String, dynamic>? permissions,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'service_id') String? serviceId
});




}
/// @nodoc
class _$UserRoleAdminCopyWithImpl<$Res>
    implements $UserRoleAdminCopyWith<$Res> {
  _$UserRoleAdminCopyWithImpl(this._self, this._then);

  final UserRoleAdmin _self;
  final $Res Function(UserRoleAdmin) _then;

/// Create a copy of UserRoleAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? permissions = freezed,Object? isActive = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRoleAdmin].
extension UserRoleAdminPatterns on UserRoleAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRoleAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRoleAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRoleAdmin value)  $default,){
final _that = this;
switch (_that) {
case _UserRoleAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRoleAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _UserRoleAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  Map<String, dynamic>? permissions, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRoleAdmin() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.permissions,_that.isActive,_that.organizationId,_that.clinicId,_that.serviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  Map<String, dynamic>? permissions, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)  $default,) {final _that = this;
switch (_that) {
case _UserRoleAdmin():
return $default(_that.id,_that.name,_that.description,_that.permissions,_that.isActive,_that.organizationId,_that.clinicId,_that.serviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  Map<String, dynamic>? permissions, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)?  $default,) {final _that = this;
switch (_that) {
case _UserRoleAdmin() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.permissions,_that.isActive,_that.organizationId,_that.clinicId,_that.serviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRoleAdmin implements UserRoleAdmin {
  const _UserRoleAdmin({required this.id, required this.name, this.description, final  Map<String, dynamic>? permissions, @JsonKey(name: 'is_active') this.isActive, @JsonKey(name: 'organization_id') this.organizationId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'service_id') this.serviceId}): _permissions = permissions;
  factory _UserRoleAdmin.fromJson(Map<String, dynamic> json) => _$UserRoleAdminFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
 final  Map<String, dynamic>? _permissions;
@override Map<String, dynamic>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'is_active') final  bool? isActive;
@override@JsonKey(name: 'organization_id') final  String? organizationId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'service_id') final  String? serviceId;

/// Create a copy of UserRoleAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRoleAdminCopyWith<_UserRoleAdmin> get copyWith => __$UserRoleAdminCopyWithImpl<_UserRoleAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRoleAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRoleAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_permissions),isActive,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'UserRoleAdmin(id: $id, name: $name, description: $description, permissions: $permissions, isActive: $isActive, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class _$UserRoleAdminCopyWith<$Res> implements $UserRoleAdminCopyWith<$Res> {
  factory _$UserRoleAdminCopyWith(_UserRoleAdmin value, $Res Function(_UserRoleAdmin) _then) = __$UserRoleAdminCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, Map<String, dynamic>? permissions,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'service_id') String? serviceId
});




}
/// @nodoc
class __$UserRoleAdminCopyWithImpl<$Res>
    implements _$UserRoleAdminCopyWith<$Res> {
  __$UserRoleAdminCopyWithImpl(this._self, this._then);

  final _UserRoleAdmin _self;
  final $Res Function(_UserRoleAdmin) _then;

/// Create a copy of UserRoleAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? permissions = freezed,Object? isActive = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_UserRoleAdmin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserModelAdmin {

 String get id; String? get email; String get username;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get phone;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; String? get gender;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_blocked') bool get isBlocked;@JsonKey(name: 'blocked_at') String? get blockedAt;@JsonKey(name: 'blocked_reason') String? get blockedReason;@JsonKey(name: 'last_login') String? get lastLogin;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; List<UserRoleAdmin>? get roles;
/// Create a copy of UserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelAdminCopyWith<UserModelAdmin> get copyWith => _$UserModelAdminCopyWithImpl<UserModelAdmin>(this as UserModelAdmin, _$identity);

  /// Serializes this UserModelAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModelAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt)&&(identical(other.blockedReason, blockedReason) || other.blockedReason == blockedReason)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,firstName,lastName,phone,dateOfBirth,gender,isActive,isBlocked,blockedAt,blockedReason,lastLogin,createdAt,updatedAt,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserModelAdmin(id: $id, email: $email, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, isBlocked: $isBlocked, blockedAt: $blockedAt, blockedReason: $blockedReason, lastLogin: $lastLogin, createdAt: $createdAt, updatedAt: $updatedAt, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserModelAdminCopyWith<$Res>  {
  factory $UserModelAdminCopyWith(UserModelAdmin value, $Res Function(UserModelAdmin) _then) = _$UserModelAdminCopyWithImpl;
@useResult
$Res call({
 String id, String? email, String username,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? phone,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? gender,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_blocked') bool isBlocked,@JsonKey(name: 'blocked_at') String? blockedAt,@JsonKey(name: 'blocked_reason') String? blockedReason,@JsonKey(name: 'last_login') String? lastLogin,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String? updatedAt, List<UserRoleAdmin>? roles
});




}
/// @nodoc
class _$UserModelAdminCopyWithImpl<$Res>
    implements $UserModelAdminCopyWith<$Res> {
  _$UserModelAdminCopyWithImpl(this._self, this._then);

  final UserModelAdmin _self;
  final $Res Function(UserModelAdmin) _then;

/// Create a copy of UserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = freezed,Object? username = null,Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? isActive = null,Object? isBlocked = null,Object? blockedAt = freezed,Object? blockedReason = freezed,Object? lastLogin = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? roles = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,blockedAt: freezed == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as String?,blockedReason: freezed == blockedReason ? _self.blockedReason : blockedReason // ignore: cast_nullable_to_non_nullable
as String?,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRoleAdmin>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModelAdmin].
extension UserModelAdminPatterns on UserModelAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModelAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModelAdmin value)  $default,){
final _that = this;
switch (_that) {
case _UserModelAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModelAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _UserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? email,  String username, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'blocked_at')  String? blockedAt, @JsonKey(name: 'blocked_reason')  String? blockedReason, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  List<UserRoleAdmin>? roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModelAdmin() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.firstName,_that.lastName,_that.phone,_that.dateOfBirth,_that.gender,_that.isActive,_that.isBlocked,_that.blockedAt,_that.blockedReason,_that.lastLogin,_that.createdAt,_that.updatedAt,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? email,  String username, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'blocked_at')  String? blockedAt, @JsonKey(name: 'blocked_reason')  String? blockedReason, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  List<UserRoleAdmin>? roles)  $default,) {final _that = this;
switch (_that) {
case _UserModelAdmin():
return $default(_that.id,_that.email,_that.username,_that.firstName,_that.lastName,_that.phone,_that.dateOfBirth,_that.gender,_that.isActive,_that.isBlocked,_that.blockedAt,_that.blockedReason,_that.lastLogin,_that.createdAt,_that.updatedAt,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? email,  String username, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'blocked_at')  String? blockedAt, @JsonKey(name: 'blocked_reason')  String? blockedReason, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  List<UserRoleAdmin>? roles)?  $default,) {final _that = this;
switch (_that) {
case _UserModelAdmin() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.firstName,_that.lastName,_that.phone,_that.dateOfBirth,_that.gender,_that.isActive,_that.isBlocked,_that.blockedAt,_that.blockedReason,_that.lastLogin,_that.createdAt,_that.updatedAt,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModelAdmin implements UserModelAdmin {
  const _UserModelAdmin({required this.id, this.email, required this.username, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.phone, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.gender, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'is_blocked') required this.isBlocked, @JsonKey(name: 'blocked_at') this.blockedAt, @JsonKey(name: 'blocked_reason') this.blockedReason, @JsonKey(name: 'last_login') this.lastLogin, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  List<UserRoleAdmin>? roles}): _roles = roles;
  factory _UserModelAdmin.fromJson(Map<String, dynamic> json) => _$UserModelAdminFromJson(json);

@override final  String id;
@override final  String? email;
@override final  String username;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? phone;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override final  String? gender;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_blocked') final  bool isBlocked;
@override@JsonKey(name: 'blocked_at') final  String? blockedAt;
@override@JsonKey(name: 'blocked_reason') final  String? blockedReason;
@override@JsonKey(name: 'last_login') final  String? lastLogin;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
 final  List<UserRoleAdmin>? _roles;
@override List<UserRoleAdmin>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelAdminCopyWith<_UserModelAdmin> get copyWith => __$UserModelAdminCopyWithImpl<_UserModelAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModelAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt)&&(identical(other.blockedReason, blockedReason) || other.blockedReason == blockedReason)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,firstName,lastName,phone,dateOfBirth,gender,isActive,isBlocked,blockedAt,blockedReason,lastLogin,createdAt,updatedAt,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserModelAdmin(id: $id, email: $email, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, isBlocked: $isBlocked, blockedAt: $blockedAt, blockedReason: $blockedReason, lastLogin: $lastLogin, createdAt: $createdAt, updatedAt: $updatedAt, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserModelAdminCopyWith<$Res> implements $UserModelAdminCopyWith<$Res> {
  factory _$UserModelAdminCopyWith(_UserModelAdmin value, $Res Function(_UserModelAdmin) _then) = __$UserModelAdminCopyWithImpl;
@override @useResult
$Res call({
 String id, String? email, String username,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? phone,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? gender,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_blocked') bool isBlocked,@JsonKey(name: 'blocked_at') String? blockedAt,@JsonKey(name: 'blocked_reason') String? blockedReason,@JsonKey(name: 'last_login') String? lastLogin,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String? updatedAt, List<UserRoleAdmin>? roles
});




}
/// @nodoc
class __$UserModelAdminCopyWithImpl<$Res>
    implements _$UserModelAdminCopyWith<$Res> {
  __$UserModelAdminCopyWithImpl(this._self, this._then);

  final _UserModelAdmin _self;
  final $Res Function(_UserModelAdmin) _then;

/// Create a copy of UserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = freezed,Object? username = null,Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? isActive = null,Object? isBlocked = null,Object? blockedAt = freezed,Object? blockedReason = freezed,Object? lastLogin = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? roles = freezed,}) {
  return _then(_UserModelAdmin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,blockedAt: freezed == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as String?,blockedReason: freezed == blockedReason ? _self.blockedReason : blockedReason // ignore: cast_nullable_to_non_nullable
as String?,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRoleAdmin>?,
  ));
}


}


/// @nodoc
mixin _$CreateUserModelAdmin {

@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get email; String get username; String? get phone; String get password;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; String? get gender;@JsonKey(name: 'is_active') bool? get isActive;@JsonKey(name: 'role_ids') List<String>? get roleIds;
/// Create a copy of CreateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserModelAdminCopyWith<CreateUserModelAdmin> get copyWith => _$CreateUserModelAdminCopyWithImpl<CreateUserModelAdmin>(this as CreateUserModelAdmin, _$identity);

  /// Serializes this CreateUserModelAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserModelAdmin&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.roleIds, roleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,username,phone,password,dateOfBirth,gender,isActive,const DeepCollectionEquality().hash(roleIds));

@override
String toString() {
  return 'CreateUserModelAdmin(firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, password: $password, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, roleIds: $roleIds)';
}


}

/// @nodoc
abstract mixin class $CreateUserModelAdminCopyWith<$Res>  {
  factory $CreateUserModelAdminCopyWith(CreateUserModelAdmin value, $Res Function(CreateUserModelAdmin) _then) = _$CreateUserModelAdminCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String username, String? phone, String password,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? gender,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'role_ids') List<String>? roleIds
});




}
/// @nodoc
class _$CreateUserModelAdminCopyWithImpl<$Res>
    implements $CreateUserModelAdminCopyWith<$Res> {
  _$CreateUserModelAdminCopyWithImpl(this._self, this._then);

  final CreateUserModelAdmin _self;
  final $Res Function(CreateUserModelAdmin) _then;

/// Create a copy of CreateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? username = null,Object? phone = freezed,Object? password = null,Object? dateOfBirth = freezed,Object? gender = freezed,Object? isActive = freezed,Object? roleIds = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,roleIds: freezed == roleIds ? _self.roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUserModelAdmin].
extension CreateUserModelAdminPatterns on CreateUserModelAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUserModelAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUserModelAdmin value)  $default,){
final _that = this;
switch (_that) {
case _CreateUserModelAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUserModelAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String username,  String? phone,  String password, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'role_ids')  List<String>? roleIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUserModelAdmin() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.password,_that.dateOfBirth,_that.gender,_that.isActive,_that.roleIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String username,  String? phone,  String password, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'role_ids')  List<String>? roleIds)  $default,) {final _that = this;
switch (_that) {
case _CreateUserModelAdmin():
return $default(_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.password,_that.dateOfBirth,_that.gender,_that.isActive,_that.roleIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String username,  String? phone,  String password, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'role_ids')  List<String>? roleIds)?  $default,) {final _that = this;
switch (_that) {
case _CreateUserModelAdmin() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.password,_that.dateOfBirth,_that.gender,_that.isActive,_that.roleIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateUserModelAdmin implements CreateUserModelAdmin {
  const _CreateUserModelAdmin({@JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.email, required this.username, this.phone, required this.password, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.gender, @JsonKey(name: 'is_active') this.isActive, @JsonKey(name: 'role_ids') final  List<String>? roleIds}): _roleIds = roleIds;
  factory _CreateUserModelAdmin.fromJson(Map<String, dynamic> json) => _$CreateUserModelAdminFromJson(json);

@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? email;
@override final  String username;
@override final  String? phone;
@override final  String password;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override final  String? gender;
@override@JsonKey(name: 'is_active') final  bool? isActive;
 final  List<String>? _roleIds;
@override@JsonKey(name: 'role_ids') List<String>? get roleIds {
  final value = _roleIds;
  if (value == null) return null;
  if (_roleIds is EqualUnmodifiableListView) return _roleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUserModelAdminCopyWith<_CreateUserModelAdmin> get copyWith => __$CreateUserModelAdminCopyWithImpl<_CreateUserModelAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateUserModelAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUserModelAdmin&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._roleIds, _roleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,username,phone,password,dateOfBirth,gender,isActive,const DeepCollectionEquality().hash(_roleIds));

@override
String toString() {
  return 'CreateUserModelAdmin(firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, password: $password, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, roleIds: $roleIds)';
}


}

/// @nodoc
abstract mixin class _$CreateUserModelAdminCopyWith<$Res> implements $CreateUserModelAdminCopyWith<$Res> {
  factory _$CreateUserModelAdminCopyWith(_CreateUserModelAdmin value, $Res Function(_CreateUserModelAdmin) _then) = __$CreateUserModelAdminCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String username, String? phone, String password,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? gender,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'role_ids') List<String>? roleIds
});




}
/// @nodoc
class __$CreateUserModelAdminCopyWithImpl<$Res>
    implements _$CreateUserModelAdminCopyWith<$Res> {
  __$CreateUserModelAdminCopyWithImpl(this._self, this._then);

  final _CreateUserModelAdmin _self;
  final $Res Function(_CreateUserModelAdmin) _then;

/// Create a copy of CreateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? username = null,Object? phone = freezed,Object? password = null,Object? dateOfBirth = freezed,Object? gender = freezed,Object? isActive = freezed,Object? roleIds = freezed,}) {
  return _then(_CreateUserModelAdmin(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,roleIds: freezed == roleIds ? _self._roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$UpdateUserModelAdmin {

@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get email; String? get phone;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; String? get gender;
/// Create a copy of UpdateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserModelAdminCopyWith<UpdateUserModelAdmin> get copyWith => _$UpdateUserModelAdminCopyWithImpl<UpdateUserModelAdmin>(this as UpdateUserModelAdmin, _$identity);

  /// Serializes this UpdateUserModelAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserModelAdmin&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,phone,dateOfBirth,gender);

@override
String toString() {
  return 'UpdateUserModelAdmin(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $UpdateUserModelAdminCopyWith<$Res>  {
  factory $UpdateUserModelAdminCopyWith(UpdateUserModelAdmin value, $Res Function(UpdateUserModelAdmin) _then) = _$UpdateUserModelAdminCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String? phone,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? gender
});




}
/// @nodoc
class _$UpdateUserModelAdminCopyWithImpl<$Res>
    implements $UpdateUserModelAdminCopyWith<$Res> {
  _$UpdateUserModelAdminCopyWithImpl(this._self, this._then);

  final UpdateUserModelAdmin _self;
  final $Res Function(UpdateUserModelAdmin) _then;

/// Create a copy of UpdateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? phone = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserModelAdmin].
extension UpdateUserModelAdminPatterns on UpdateUserModelAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserModelAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserModelAdmin value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserModelAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserModelAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserModelAdmin() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.phone,_that.dateOfBirth,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserModelAdmin():
return $default(_that.firstName,_that.lastName,_that.email,_that.phone,_that.dateOfBirth,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? gender)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserModelAdmin() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.phone,_that.dateOfBirth,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserModelAdmin implements UpdateUserModelAdmin {
  const _UpdateUserModelAdmin({@JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.email, this.phone, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.gender});
  factory _UpdateUserModelAdmin.fromJson(Map<String, dynamic> json) => _$UpdateUserModelAdminFromJson(json);

@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? email;
@override final  String? phone;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override final  String? gender;

/// Create a copy of UpdateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserModelAdminCopyWith<_UpdateUserModelAdmin> get copyWith => __$UpdateUserModelAdminCopyWithImpl<_UpdateUserModelAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserModelAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserModelAdmin&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,phone,dateOfBirth,gender);

@override
String toString() {
  return 'UpdateUserModelAdmin(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserModelAdminCopyWith<$Res> implements $UpdateUserModelAdminCopyWith<$Res> {
  factory _$UpdateUserModelAdminCopyWith(_UpdateUserModelAdmin value, $Res Function(_UpdateUserModelAdmin) _then) = __$UpdateUserModelAdminCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String? phone,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? gender
});




}
/// @nodoc
class __$UpdateUserModelAdminCopyWithImpl<$Res>
    implements _$UpdateUserModelAdminCopyWith<$Res> {
  __$UpdateUserModelAdminCopyWithImpl(this._self, this._then);

  final _UpdateUserModelAdmin _self;
  final $Res Function(_UpdateUserModelAdmin) _then;

/// Create a copy of UpdateUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? phone = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,}) {
  return _then(_UpdateUserModelAdmin(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BlockUserModelAdmin {

 String get reason;
/// Create a copy of BlockUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockUserModelAdminCopyWith<BlockUserModelAdmin> get copyWith => _$BlockUserModelAdminCopyWithImpl<BlockUserModelAdmin>(this as BlockUserModelAdmin, _$identity);

  /// Serializes this BlockUserModelAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockUserModelAdmin&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'BlockUserModelAdmin(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $BlockUserModelAdminCopyWith<$Res>  {
  factory $BlockUserModelAdminCopyWith(BlockUserModelAdmin value, $Res Function(BlockUserModelAdmin) _then) = _$BlockUserModelAdminCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$BlockUserModelAdminCopyWithImpl<$Res>
    implements $BlockUserModelAdminCopyWith<$Res> {
  _$BlockUserModelAdminCopyWithImpl(this._self, this._then);

  final BlockUserModelAdmin _self;
  final $Res Function(BlockUserModelAdmin) _then;

/// Create a copy of BlockUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockUserModelAdmin].
extension BlockUserModelAdminPatterns on BlockUserModelAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockUserModelAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockUserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockUserModelAdmin value)  $default,){
final _that = this;
switch (_that) {
case _BlockUserModelAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockUserModelAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _BlockUserModelAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockUserModelAdmin() when $default != null:
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason)  $default,) {final _that = this;
switch (_that) {
case _BlockUserModelAdmin():
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason)?  $default,) {final _that = this;
switch (_that) {
case _BlockUserModelAdmin() when $default != null:
return $default(_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlockUserModelAdmin implements BlockUserModelAdmin {
  const _BlockUserModelAdmin({required this.reason});
  factory _BlockUserModelAdmin.fromJson(Map<String, dynamic> json) => _$BlockUserModelAdminFromJson(json);

@override final  String reason;

/// Create a copy of BlockUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockUserModelAdminCopyWith<_BlockUserModelAdmin> get copyWith => __$BlockUserModelAdminCopyWithImpl<_BlockUserModelAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockUserModelAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockUserModelAdmin&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'BlockUserModelAdmin(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BlockUserModelAdminCopyWith<$Res> implements $BlockUserModelAdminCopyWith<$Res> {
  factory _$BlockUserModelAdminCopyWith(_BlockUserModelAdmin value, $Res Function(_BlockUserModelAdmin) _then) = __$BlockUserModelAdminCopyWithImpl;
@override @useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$BlockUserModelAdminCopyWithImpl<$Res>
    implements _$BlockUserModelAdminCopyWith<$Res> {
  __$BlockUserModelAdminCopyWithImpl(this._self, this._then);

  final _BlockUserModelAdmin _self;
  final $Res Function(_BlockUserModelAdmin) _then;

/// Create a copy of BlockUserModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_BlockUserModelAdmin(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AdminChangePasswordModelAdmin {

@JsonKey(name: 'new_password') String get newPassword;
/// Create a copy of AdminChangePasswordModelAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminChangePasswordModelAdminCopyWith<AdminChangePasswordModelAdmin> get copyWith => _$AdminChangePasswordModelAdminCopyWithImpl<AdminChangePasswordModelAdmin>(this as AdminChangePasswordModelAdmin, _$identity);

  /// Serializes this AdminChangePasswordModelAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminChangePasswordModelAdmin&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'AdminChangePasswordModelAdmin(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $AdminChangePasswordModelAdminCopyWith<$Res>  {
  factory $AdminChangePasswordModelAdminCopyWith(AdminChangePasswordModelAdmin value, $Res Function(AdminChangePasswordModelAdmin) _then) = _$AdminChangePasswordModelAdminCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'new_password') String newPassword
});




}
/// @nodoc
class _$AdminChangePasswordModelAdminCopyWithImpl<$Res>
    implements $AdminChangePasswordModelAdminCopyWith<$Res> {
  _$AdminChangePasswordModelAdminCopyWithImpl(this._self, this._then);

  final AdminChangePasswordModelAdmin _self;
  final $Res Function(AdminChangePasswordModelAdmin) _then;

/// Create a copy of AdminChangePasswordModelAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newPassword = null,}) {
  return _then(_self.copyWith(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminChangePasswordModelAdmin].
extension AdminChangePasswordModelAdminPatterns on AdminChangePasswordModelAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminChangePasswordModelAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminChangePasswordModelAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminChangePasswordModelAdmin value)  $default,){
final _that = this;
switch (_that) {
case _AdminChangePasswordModelAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminChangePasswordModelAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _AdminChangePasswordModelAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_password')  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminChangePasswordModelAdmin() when $default != null:
return $default(_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_password')  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _AdminChangePasswordModelAdmin():
return $default(_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'new_password')  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _AdminChangePasswordModelAdmin() when $default != null:
return $default(_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminChangePasswordModelAdmin implements AdminChangePasswordModelAdmin {
  const _AdminChangePasswordModelAdmin({@JsonKey(name: 'new_password') required this.newPassword});
  factory _AdminChangePasswordModelAdmin.fromJson(Map<String, dynamic> json) => _$AdminChangePasswordModelAdminFromJson(json);

@override@JsonKey(name: 'new_password') final  String newPassword;

/// Create a copy of AdminChangePasswordModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminChangePasswordModelAdminCopyWith<_AdminChangePasswordModelAdmin> get copyWith => __$AdminChangePasswordModelAdminCopyWithImpl<_AdminChangePasswordModelAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminChangePasswordModelAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminChangePasswordModelAdmin&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'AdminChangePasswordModelAdmin(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$AdminChangePasswordModelAdminCopyWith<$Res> implements $AdminChangePasswordModelAdminCopyWith<$Res> {
  factory _$AdminChangePasswordModelAdminCopyWith(_AdminChangePasswordModelAdmin value, $Res Function(_AdminChangePasswordModelAdmin) _then) = __$AdminChangePasswordModelAdminCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'new_password') String newPassword
});




}
/// @nodoc
class __$AdminChangePasswordModelAdminCopyWithImpl<$Res>
    implements _$AdminChangePasswordModelAdminCopyWith<$Res> {
  __$AdminChangePasswordModelAdminCopyWithImpl(this._self, this._then);

  final _AdminChangePasswordModelAdmin _self;
  final $Res Function(_AdminChangePasswordModelAdmin) _then;

/// Create a copy of AdminChangePasswordModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newPassword = null,}) {
  return _then(_AdminChangePasswordModelAdmin(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AssignRoleModelAdmin {

@JsonKey(name: 'role_id') String get roleId;@JsonKey(name: 'organization_id') String? get organizationId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'service_id') String? get serviceId;
/// Create a copy of AssignRoleModelAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignRoleModelAdminCopyWith<AssignRoleModelAdmin> get copyWith => _$AssignRoleModelAdminCopyWithImpl<AssignRoleModelAdmin>(this as AssignRoleModelAdmin, _$identity);

  /// Serializes this AssignRoleModelAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignRoleModelAdmin&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleId,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'AssignRoleModelAdmin(roleId: $roleId, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $AssignRoleModelAdminCopyWith<$Res>  {
  factory $AssignRoleModelAdminCopyWith(AssignRoleModelAdmin value, $Res Function(AssignRoleModelAdmin) _then) = _$AssignRoleModelAdminCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'role_id') String roleId,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'service_id') String? serviceId
});




}
/// @nodoc
class _$AssignRoleModelAdminCopyWithImpl<$Res>
    implements $AssignRoleModelAdminCopyWith<$Res> {
  _$AssignRoleModelAdminCopyWithImpl(this._self, this._then);

  final AssignRoleModelAdmin _self;
  final $Res Function(AssignRoleModelAdmin) _then;

/// Create a copy of AssignRoleModelAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleId = null,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_self.copyWith(
roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignRoleModelAdmin].
extension AssignRoleModelAdminPatterns on AssignRoleModelAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignRoleModelAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignRoleModelAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignRoleModelAdmin value)  $default,){
final _that = this;
switch (_that) {
case _AssignRoleModelAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignRoleModelAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _AssignRoleModelAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'role_id')  String roleId, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignRoleModelAdmin() when $default != null:
return $default(_that.roleId,_that.organizationId,_that.clinicId,_that.serviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'role_id')  String roleId, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)  $default,) {final _that = this;
switch (_that) {
case _AssignRoleModelAdmin():
return $default(_that.roleId,_that.organizationId,_that.clinicId,_that.serviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'role_id')  String roleId, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'service_id')  String? serviceId)?  $default,) {final _that = this;
switch (_that) {
case _AssignRoleModelAdmin() when $default != null:
return $default(_that.roleId,_that.organizationId,_that.clinicId,_that.serviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignRoleModelAdmin implements AssignRoleModelAdmin {
  const _AssignRoleModelAdmin({@JsonKey(name: 'role_id') required this.roleId, @JsonKey(name: 'organization_id') this.organizationId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'service_id') this.serviceId});
  factory _AssignRoleModelAdmin.fromJson(Map<String, dynamic> json) => _$AssignRoleModelAdminFromJson(json);

@override@JsonKey(name: 'role_id') final  String roleId;
@override@JsonKey(name: 'organization_id') final  String? organizationId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'service_id') final  String? serviceId;

/// Create a copy of AssignRoleModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignRoleModelAdminCopyWith<_AssignRoleModelAdmin> get copyWith => __$AssignRoleModelAdminCopyWithImpl<_AssignRoleModelAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignRoleModelAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignRoleModelAdmin&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleId,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'AssignRoleModelAdmin(roleId: $roleId, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class _$AssignRoleModelAdminCopyWith<$Res> implements $AssignRoleModelAdminCopyWith<$Res> {
  factory _$AssignRoleModelAdminCopyWith(_AssignRoleModelAdmin value, $Res Function(_AssignRoleModelAdmin) _then) = __$AssignRoleModelAdminCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'role_id') String roleId,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'service_id') String? serviceId
});




}
/// @nodoc
class __$AssignRoleModelAdminCopyWithImpl<$Res>
    implements _$AssignRoleModelAdminCopyWith<$Res> {
  __$AssignRoleModelAdminCopyWithImpl(this._self, this._then);

  final _AssignRoleModelAdmin _self;
  final $Res Function(_AssignRoleModelAdmin) _then;

/// Create a copy of AssignRoleModelAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleId = null,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_AssignRoleModelAdmin(
roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserActivityLogAdmin {

 String get id;@JsonKey(name: 'performed_by') String? get performedBy;@JsonKey(name: 'performed_by_name') String? get performedByName;@JsonKey(name: 'action_type') String get actionType;@JsonKey(name: 'action_description') String get actionDescription;@JsonKey(name: 'ip_address') String? get ipAddress;@JsonKey(name: 'user_agent') String? get userAgent; Map<String, dynamic>? get metadata;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of UserActivityLogAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserActivityLogAdminCopyWith<UserActivityLogAdmin> get copyWith => _$UserActivityLogAdminCopyWithImpl<UserActivityLogAdmin>(this as UserActivityLogAdmin, _$identity);

  /// Serializes this UserActivityLogAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserActivityLogAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.performedBy, performedBy) || other.performedBy == performedBy)&&(identical(other.performedByName, performedByName) || other.performedByName == performedByName)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.actionDescription, actionDescription) || other.actionDescription == actionDescription)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,performedBy,performedByName,actionType,actionDescription,ipAddress,userAgent,const DeepCollectionEquality().hash(metadata),createdAt);

@override
String toString() {
  return 'UserActivityLogAdmin(id: $id, performedBy: $performedBy, performedByName: $performedByName, actionType: $actionType, actionDescription: $actionDescription, ipAddress: $ipAddress, userAgent: $userAgent, metadata: $metadata, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserActivityLogAdminCopyWith<$Res>  {
  factory $UserActivityLogAdminCopyWith(UserActivityLogAdmin value, $Res Function(UserActivityLogAdmin) _then) = _$UserActivityLogAdminCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'performed_by') String? performedBy,@JsonKey(name: 'performed_by_name') String? performedByName,@JsonKey(name: 'action_type') String actionType,@JsonKey(name: 'action_description') String actionDescription,@JsonKey(name: 'ip_address') String? ipAddress,@JsonKey(name: 'user_agent') String? userAgent, Map<String, dynamic>? metadata,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$UserActivityLogAdminCopyWithImpl<$Res>
    implements $UserActivityLogAdminCopyWith<$Res> {
  _$UserActivityLogAdminCopyWithImpl(this._self, this._then);

  final UserActivityLogAdmin _self;
  final $Res Function(UserActivityLogAdmin) _then;

/// Create a copy of UserActivityLogAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? performedBy = freezed,Object? performedByName = freezed,Object? actionType = null,Object? actionDescription = null,Object? ipAddress = freezed,Object? userAgent = freezed,Object? metadata = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,performedBy: freezed == performedBy ? _self.performedBy : performedBy // ignore: cast_nullable_to_non_nullable
as String?,performedByName: freezed == performedByName ? _self.performedByName : performedByName // ignore: cast_nullable_to_non_nullable
as String?,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,actionDescription: null == actionDescription ? _self.actionDescription : actionDescription // ignore: cast_nullable_to_non_nullable
as String,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserActivityLogAdmin].
extension UserActivityLogAdminPatterns on UserActivityLogAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserActivityLogAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserActivityLogAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserActivityLogAdmin value)  $default,){
final _that = this;
switch (_that) {
case _UserActivityLogAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserActivityLogAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _UserActivityLogAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'performed_by')  String? performedBy, @JsonKey(name: 'performed_by_name')  String? performedByName, @JsonKey(name: 'action_type')  String actionType, @JsonKey(name: 'action_description')  String actionDescription, @JsonKey(name: 'ip_address')  String? ipAddress, @JsonKey(name: 'user_agent')  String? userAgent,  Map<String, dynamic>? metadata, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserActivityLogAdmin() when $default != null:
return $default(_that.id,_that.performedBy,_that.performedByName,_that.actionType,_that.actionDescription,_that.ipAddress,_that.userAgent,_that.metadata,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'performed_by')  String? performedBy, @JsonKey(name: 'performed_by_name')  String? performedByName, @JsonKey(name: 'action_type')  String actionType, @JsonKey(name: 'action_description')  String actionDescription, @JsonKey(name: 'ip_address')  String? ipAddress, @JsonKey(name: 'user_agent')  String? userAgent,  Map<String, dynamic>? metadata, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserActivityLogAdmin():
return $default(_that.id,_that.performedBy,_that.performedByName,_that.actionType,_that.actionDescription,_that.ipAddress,_that.userAgent,_that.metadata,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'performed_by')  String? performedBy, @JsonKey(name: 'performed_by_name')  String? performedByName, @JsonKey(name: 'action_type')  String actionType, @JsonKey(name: 'action_description')  String actionDescription, @JsonKey(name: 'ip_address')  String? ipAddress, @JsonKey(name: 'user_agent')  String? userAgent,  Map<String, dynamic>? metadata, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserActivityLogAdmin() when $default != null:
return $default(_that.id,_that.performedBy,_that.performedByName,_that.actionType,_that.actionDescription,_that.ipAddress,_that.userAgent,_that.metadata,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserActivityLogAdmin implements UserActivityLogAdmin {
  const _UserActivityLogAdmin({required this.id, @JsonKey(name: 'performed_by') this.performedBy, @JsonKey(name: 'performed_by_name') this.performedByName, @JsonKey(name: 'action_type') required this.actionType, @JsonKey(name: 'action_description') required this.actionDescription, @JsonKey(name: 'ip_address') this.ipAddress, @JsonKey(name: 'user_agent') this.userAgent, final  Map<String, dynamic>? metadata, @JsonKey(name: 'created_at') required this.createdAt}): _metadata = metadata;
  factory _UserActivityLogAdmin.fromJson(Map<String, dynamic> json) => _$UserActivityLogAdminFromJson(json);

@override final  String id;
@override@JsonKey(name: 'performed_by') final  String? performedBy;
@override@JsonKey(name: 'performed_by_name') final  String? performedByName;
@override@JsonKey(name: 'action_type') final  String actionType;
@override@JsonKey(name: 'action_description') final  String actionDescription;
@override@JsonKey(name: 'ip_address') final  String? ipAddress;
@override@JsonKey(name: 'user_agent') final  String? userAgent;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of UserActivityLogAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserActivityLogAdminCopyWith<_UserActivityLogAdmin> get copyWith => __$UserActivityLogAdminCopyWithImpl<_UserActivityLogAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserActivityLogAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserActivityLogAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.performedBy, performedBy) || other.performedBy == performedBy)&&(identical(other.performedByName, performedByName) || other.performedByName == performedByName)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.actionDescription, actionDescription) || other.actionDescription == actionDescription)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,performedBy,performedByName,actionType,actionDescription,ipAddress,userAgent,const DeepCollectionEquality().hash(_metadata),createdAt);

@override
String toString() {
  return 'UserActivityLogAdmin(id: $id, performedBy: $performedBy, performedByName: $performedByName, actionType: $actionType, actionDescription: $actionDescription, ipAddress: $ipAddress, userAgent: $userAgent, metadata: $metadata, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserActivityLogAdminCopyWith<$Res> implements $UserActivityLogAdminCopyWith<$Res> {
  factory _$UserActivityLogAdminCopyWith(_UserActivityLogAdmin value, $Res Function(_UserActivityLogAdmin) _then) = __$UserActivityLogAdminCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'performed_by') String? performedBy,@JsonKey(name: 'performed_by_name') String? performedByName,@JsonKey(name: 'action_type') String actionType,@JsonKey(name: 'action_description') String actionDescription,@JsonKey(name: 'ip_address') String? ipAddress,@JsonKey(name: 'user_agent') String? userAgent, Map<String, dynamic>? metadata,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$UserActivityLogAdminCopyWithImpl<$Res>
    implements _$UserActivityLogAdminCopyWith<$Res> {
  __$UserActivityLogAdminCopyWithImpl(this._self, this._then);

  final _UserActivityLogAdmin _self;
  final $Res Function(_UserActivityLogAdmin) _then;

/// Create a copy of UserActivityLogAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? performedBy = freezed,Object? performedByName = freezed,Object? actionType = null,Object? actionDescription = null,Object? ipAddress = freezed,Object? userAgent = freezed,Object? metadata = freezed,Object? createdAt = null,}) {
  return _then(_UserActivityLogAdmin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,performedBy: freezed == performedBy ? _self.performedBy : performedBy // ignore: cast_nullable_to_non_nullable
as String?,performedByName: freezed == performedByName ? _self.performedByName : performedByName // ignore: cast_nullable_to_non_nullable
as String?,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,actionDescription: null == actionDescription ? _self.actionDescription : actionDescription // ignore: cast_nullable_to_non_nullable
as String,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserPaginationAdmin {

 int get page;@JsonKey(name: 'page_size') int get pageSize;@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'total_pages') int get totalPages;
/// Create a copy of UserPaginationAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPaginationAdminCopyWith<UserPaginationAdmin> get copyWith => _$UserPaginationAdminCopyWithImpl<UserPaginationAdmin>(this as UserPaginationAdmin, _$identity);

  /// Serializes this UserPaginationAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPaginationAdmin&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,totalCount,totalPages);

@override
String toString() {
  return 'UserPaginationAdmin(page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $UserPaginationAdminCopyWith<$Res>  {
  factory $UserPaginationAdminCopyWith(UserPaginationAdmin value, $Res Function(UserPaginationAdmin) _then) = _$UserPaginationAdminCopyWithImpl;
@useResult
$Res call({
 int page,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class _$UserPaginationAdminCopyWithImpl<$Res>
    implements $UserPaginationAdminCopyWith<$Res> {
  _$UserPaginationAdminCopyWithImpl(this._self, this._then);

  final UserPaginationAdmin _self;
  final $Res Function(UserPaginationAdmin) _then;

/// Create a copy of UserPaginationAdmin
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


/// Adds pattern-matching-related methods to [UserPaginationAdmin].
extension UserPaginationAdminPatterns on UserPaginationAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPaginationAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPaginationAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPaginationAdmin value)  $default,){
final _that = this;
switch (_that) {
case _UserPaginationAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPaginationAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _UserPaginationAdmin() when $default != null:
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
case _UserPaginationAdmin() when $default != null:
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
case _UserPaginationAdmin():
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
case _UserPaginationAdmin() when $default != null:
return $default(_that.page,_that.pageSize,_that.totalCount,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPaginationAdmin implements UserPaginationAdmin {
  const _UserPaginationAdmin({required this.page, @JsonKey(name: 'page_size') required this.pageSize, @JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'total_pages') required this.totalPages});
  factory _UserPaginationAdmin.fromJson(Map<String, dynamic> json) => _$UserPaginationAdminFromJson(json);

@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;
@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'total_pages') final  int totalPages;

/// Create a copy of UserPaginationAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPaginationAdminCopyWith<_UserPaginationAdmin> get copyWith => __$UserPaginationAdminCopyWithImpl<_UserPaginationAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPaginationAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPaginationAdmin&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,totalCount,totalPages);

@override
String toString() {
  return 'UserPaginationAdmin(page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UserPaginationAdminCopyWith<$Res> implements $UserPaginationAdminCopyWith<$Res> {
  factory _$UserPaginationAdminCopyWith(_UserPaginationAdmin value, $Res Function(_UserPaginationAdmin) _then) = __$UserPaginationAdminCopyWithImpl;
@override @useResult
$Res call({
 int page,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class __$UserPaginationAdminCopyWithImpl<$Res>
    implements _$UserPaginationAdminCopyWith<$Res> {
  __$UserPaginationAdminCopyWithImpl(this._self, this._then);

  final _UserPaginationAdmin _self;
  final $Res Function(_UserPaginationAdmin) _then;

/// Create a copy of UserPaginationAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = null,}) {
  return _then(_UserPaginationAdmin(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UsersListResponseAdmin {

 List<UserModelAdmin> get users; UserPaginationAdmin get pagination;
/// Create a copy of UsersListResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListResponseAdminCopyWith<UsersListResponseAdmin> get copyWith => _$UsersListResponseAdminCopyWithImpl<UsersListResponseAdmin>(this as UsersListResponseAdmin, _$identity);

  /// Serializes this UsersListResponseAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListResponseAdmin&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),pagination);

@override
String toString() {
  return 'UsersListResponseAdmin(users: $users, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $UsersListResponseAdminCopyWith<$Res>  {
  factory $UsersListResponseAdminCopyWith(UsersListResponseAdmin value, $Res Function(UsersListResponseAdmin) _then) = _$UsersListResponseAdminCopyWithImpl;
@useResult
$Res call({
 List<UserModelAdmin> users, UserPaginationAdmin pagination
});


$UserPaginationAdminCopyWith<$Res> get pagination;

}
/// @nodoc
class _$UsersListResponseAdminCopyWithImpl<$Res>
    implements $UsersListResponseAdminCopyWith<$Res> {
  _$UsersListResponseAdminCopyWithImpl(this._self, this._then);

  final UsersListResponseAdmin _self;
  final $Res Function(UsersListResponseAdmin) _then;

/// Create a copy of UsersListResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserModelAdmin>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as UserPaginationAdmin,
  ));
}
/// Create a copy of UsersListResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPaginationAdminCopyWith<$Res> get pagination {
  
  return $UserPaginationAdminCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [UsersListResponseAdmin].
extension UsersListResponseAdminPatterns on UsersListResponseAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersListResponseAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersListResponseAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersListResponseAdmin value)  $default,){
final _that = this;
switch (_that) {
case _UsersListResponseAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersListResponseAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _UsersListResponseAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserModelAdmin> users,  UserPaginationAdmin pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersListResponseAdmin() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserModelAdmin> users,  UserPaginationAdmin pagination)  $default,) {final _that = this;
switch (_that) {
case _UsersListResponseAdmin():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserModelAdmin> users,  UserPaginationAdmin pagination)?  $default,) {final _that = this;
switch (_that) {
case _UsersListResponseAdmin() when $default != null:
return $default(_that.users,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsersListResponseAdmin implements UsersListResponseAdmin {
  const _UsersListResponseAdmin({required final  List<UserModelAdmin> users, required this.pagination}): _users = users;
  factory _UsersListResponseAdmin.fromJson(Map<String, dynamic> json) => _$UsersListResponseAdminFromJson(json);

 final  List<UserModelAdmin> _users;
@override List<UserModelAdmin> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  UserPaginationAdmin pagination;

/// Create a copy of UsersListResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersListResponseAdminCopyWith<_UsersListResponseAdmin> get copyWith => __$UsersListResponseAdminCopyWithImpl<_UsersListResponseAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersListResponseAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersListResponseAdmin&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),pagination);

@override
String toString() {
  return 'UsersListResponseAdmin(users: $users, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$UsersListResponseAdminCopyWith<$Res> implements $UsersListResponseAdminCopyWith<$Res> {
  factory _$UsersListResponseAdminCopyWith(_UsersListResponseAdmin value, $Res Function(_UsersListResponseAdmin) _then) = __$UsersListResponseAdminCopyWithImpl;
@override @useResult
$Res call({
 List<UserModelAdmin> users, UserPaginationAdmin pagination
});


@override $UserPaginationAdminCopyWith<$Res> get pagination;

}
/// @nodoc
class __$UsersListResponseAdminCopyWithImpl<$Res>
    implements _$UsersListResponseAdminCopyWith<$Res> {
  __$UsersListResponseAdminCopyWithImpl(this._self, this._then);

  final _UsersListResponseAdmin _self;
  final $Res Function(_UsersListResponseAdmin) _then;

/// Create a copy of UsersListResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? pagination = null,}) {
  return _then(_UsersListResponseAdmin(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserModelAdmin>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as UserPaginationAdmin,
  ));
}

/// Create a copy of UsersListResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPaginationAdminCopyWith<$Res> get pagination {
  
  return $UserPaginationAdminCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$ActivityLogsResponseAdmin {

 List<UserActivityLogAdmin> get logs; UserPaginationAdmin get pagination;
/// Create a copy of ActivityLogsResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityLogsResponseAdminCopyWith<ActivityLogsResponseAdmin> get copyWith => _$ActivityLogsResponseAdminCopyWithImpl<ActivityLogsResponseAdmin>(this as ActivityLogsResponseAdmin, _$identity);

  /// Serializes this ActivityLogsResponseAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLogsResponseAdmin&&const DeepCollectionEquality().equals(other.logs, logs)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logs),pagination);

@override
String toString() {
  return 'ActivityLogsResponseAdmin(logs: $logs, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $ActivityLogsResponseAdminCopyWith<$Res>  {
  factory $ActivityLogsResponseAdminCopyWith(ActivityLogsResponseAdmin value, $Res Function(ActivityLogsResponseAdmin) _then) = _$ActivityLogsResponseAdminCopyWithImpl;
@useResult
$Res call({
 List<UserActivityLogAdmin> logs, UserPaginationAdmin pagination
});


$UserPaginationAdminCopyWith<$Res> get pagination;

}
/// @nodoc
class _$ActivityLogsResponseAdminCopyWithImpl<$Res>
    implements $ActivityLogsResponseAdminCopyWith<$Res> {
  _$ActivityLogsResponseAdminCopyWithImpl(this._self, this._then);

  final ActivityLogsResponseAdmin _self;
  final $Res Function(ActivityLogsResponseAdmin) _then;

/// Create a copy of ActivityLogsResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<UserActivityLogAdmin>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as UserPaginationAdmin,
  ));
}
/// Create a copy of ActivityLogsResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPaginationAdminCopyWith<$Res> get pagination {
  
  return $UserPaginationAdminCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivityLogsResponseAdmin].
extension ActivityLogsResponseAdminPatterns on ActivityLogsResponseAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityLogsResponseAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityLogsResponseAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityLogsResponseAdmin value)  $default,){
final _that = this;
switch (_that) {
case _ActivityLogsResponseAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityLogsResponseAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityLogsResponseAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserActivityLogAdmin> logs,  UserPaginationAdmin pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityLogsResponseAdmin() when $default != null:
return $default(_that.logs,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserActivityLogAdmin> logs,  UserPaginationAdmin pagination)  $default,) {final _that = this;
switch (_that) {
case _ActivityLogsResponseAdmin():
return $default(_that.logs,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserActivityLogAdmin> logs,  UserPaginationAdmin pagination)?  $default,) {final _that = this;
switch (_that) {
case _ActivityLogsResponseAdmin() when $default != null:
return $default(_that.logs,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityLogsResponseAdmin implements ActivityLogsResponseAdmin {
  const _ActivityLogsResponseAdmin({required final  List<UserActivityLogAdmin> logs, required this.pagination}): _logs = logs;
  factory _ActivityLogsResponseAdmin.fromJson(Map<String, dynamic> json) => _$ActivityLogsResponseAdminFromJson(json);

 final  List<UserActivityLogAdmin> _logs;
@override List<UserActivityLogAdmin> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

@override final  UserPaginationAdmin pagination;

/// Create a copy of ActivityLogsResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityLogsResponseAdminCopyWith<_ActivityLogsResponseAdmin> get copyWith => __$ActivityLogsResponseAdminCopyWithImpl<_ActivityLogsResponseAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityLogsResponseAdminToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityLogsResponseAdmin&&const DeepCollectionEquality().equals(other._logs, _logs)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs),pagination);

@override
String toString() {
  return 'ActivityLogsResponseAdmin(logs: $logs, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$ActivityLogsResponseAdminCopyWith<$Res> implements $ActivityLogsResponseAdminCopyWith<$Res> {
  factory _$ActivityLogsResponseAdminCopyWith(_ActivityLogsResponseAdmin value, $Res Function(_ActivityLogsResponseAdmin) _then) = __$ActivityLogsResponseAdminCopyWithImpl;
@override @useResult
$Res call({
 List<UserActivityLogAdmin> logs, UserPaginationAdmin pagination
});


@override $UserPaginationAdminCopyWith<$Res> get pagination;

}
/// @nodoc
class __$ActivityLogsResponseAdminCopyWithImpl<$Res>
    implements _$ActivityLogsResponseAdminCopyWith<$Res> {
  __$ActivityLogsResponseAdminCopyWithImpl(this._self, this._then);

  final _ActivityLogsResponseAdmin _self;
  final $Res Function(_ActivityLogsResponseAdmin) _then;

/// Create a copy of ActivityLogsResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,Object? pagination = null,}) {
  return _then(_ActivityLogsResponseAdmin(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<UserActivityLogAdmin>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as UserPaginationAdmin,
  ));
}

/// Create a copy of ActivityLogsResponseAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPaginationAdminCopyWith<$Res> get pagination {
  
  return $UserPaginationAdminCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
