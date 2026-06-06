// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String? get id; String? get firstName; String? get lastName; String? get email; String? get username; String? get phone; String? get dateOfBirth; String? get gender; bool? get isActive; String? get lastLogin; String? get createdAt;// Role-based fields
 String? get role; String? get roleId; String? get organizationId; String? get clinicId; String? get serviceId; String? get logo;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,username,phone,dateOfBirth,gender,isActive,lastLogin,createdAt,role,roleId,organizationId,clinicId,serviceId,logo);

@override
String toString() {
  return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, lastLogin: $lastLogin, createdAt: $createdAt, role: $role, roleId: $roleId, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId, logo: $logo)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? firstName, String? lastName, String? email, String? username, String? phone, String? dateOfBirth, String? gender, bool? isActive, String? lastLogin, String? createdAt, String? role, String? roleId, String? organizationId, String? clinicId, String? serviceId, String? logo
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? username = freezed,Object? phone = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? isActive = freezed,Object? lastLogin = freezed,Object? createdAt = freezed,Object? role = freezed,Object? roleId = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,Object? logo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,roleId: freezed == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? firstName,  String? lastName,  String? email,  String? username,  String? phone,  String? dateOfBirth,  String? gender,  bool? isActive,  String? lastLogin,  String? createdAt,  String? role,  String? roleId,  String? organizationId,  String? clinicId,  String? serviceId,  String? logo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.dateOfBirth,_that.gender,_that.isActive,_that.lastLogin,_that.createdAt,_that.role,_that.roleId,_that.organizationId,_that.clinicId,_that.serviceId,_that.logo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? firstName,  String? lastName,  String? email,  String? username,  String? phone,  String? dateOfBirth,  String? gender,  bool? isActive,  String? lastLogin,  String? createdAt,  String? role,  String? roleId,  String? organizationId,  String? clinicId,  String? serviceId,  String? logo)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.dateOfBirth,_that.gender,_that.isActive,_that.lastLogin,_that.createdAt,_that.role,_that.roleId,_that.organizationId,_that.clinicId,_that.serviceId,_that.logo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? firstName,  String? lastName,  String? email,  String? username,  String? phone,  String? dateOfBirth,  String? gender,  bool? isActive,  String? lastLogin,  String? createdAt,  String? role,  String? roleId,  String? organizationId,  String? clinicId,  String? serviceId,  String? logo)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.dateOfBirth,_that.gender,_that.isActive,_that.lastLogin,_that.createdAt,_that.role,_that.roleId,_that.organizationId,_that.clinicId,_that.serviceId,_that.logo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({this.id, this.firstName, this.lastName, this.email, this.username, this.phone, this.dateOfBirth, this.gender, this.isActive, this.lastLogin, this.createdAt, this.role, this.roleId, this.organizationId, this.clinicId, this.serviceId, this.logo}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String? id;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? email;
@override final  String? username;
@override final  String? phone;
@override final  String? dateOfBirth;
@override final  String? gender;
@override final  bool? isActive;
@override final  String? lastLogin;
@override final  String? createdAt;
// Role-based fields
@override final  String? role;
@override final  String? roleId;
@override final  String? organizationId;
@override final  String? clinicId;
@override final  String? serviceId;
@override final  String? logo;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,username,phone,dateOfBirth,gender,isActive,lastLogin,createdAt,role,roleId,organizationId,clinicId,serviceId,logo);

@override
String toString() {
  return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, dateOfBirth: $dateOfBirth, gender: $gender, isActive: $isActive, lastLogin: $lastLogin, createdAt: $createdAt, role: $role, roleId: $roleId, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? firstName, String? lastName, String? email, String? username, String? phone, String? dateOfBirth, String? gender, bool? isActive, String? lastLogin, String? createdAt, String? role, String? roleId, String? organizationId, String? clinicId, String? serviceId, String? logo
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? username = freezed,Object? phone = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? isActive = freezed,Object? lastLogin = freezed,Object? createdAt = freezed,Object? role = freezed,Object? roleId = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,Object? logo = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,roleId: freezed == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserRole {

 String? get id; String? get name; Map<String, dynamic>? get permissions;// Add role-based IDs from backend
@JsonKey(name: "clinic_id") String? get clinicId;@JsonKey(name: "organization_id") String? get organizationId;@JsonKey(name: "service_id") String? get serviceId;
/// Create a copy of UserRole
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRoleCopyWith<UserRole> get copyWith => _$UserRoleCopyWithImpl<UserRole>(this as UserRole, _$identity);

  /// Serializes this UserRole to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRole&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(permissions),clinicId,organizationId,serviceId);

@override
String toString() {
  return 'UserRole(id: $id, name: $name, permissions: $permissions, clinicId: $clinicId, organizationId: $organizationId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $UserRoleCopyWith<$Res>  {
  factory $UserRoleCopyWith(UserRole value, $Res Function(UserRole) _then) = _$UserRoleCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, Map<String, dynamic>? permissions,@JsonKey(name: "clinic_id") String? clinicId,@JsonKey(name: "organization_id") String? organizationId,@JsonKey(name: "service_id") String? serviceId
});




}
/// @nodoc
class _$UserRoleCopyWithImpl<$Res>
    implements $UserRoleCopyWith<$Res> {
  _$UserRoleCopyWithImpl(this._self, this._then);

  final UserRole _self;
  final $Res Function(UserRole) _then;

/// Create a copy of UserRole
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? permissions = freezed,Object? clinicId = freezed,Object? organizationId = freezed,Object? serviceId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRole].
extension UserRolePatterns on UserRole {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRole value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRole() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRole value)  $default,){
final _that = this;
switch (_that) {
case _UserRole():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRole value)?  $default,){
final _that = this;
switch (_that) {
case _UserRole() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  Map<String, dynamic>? permissions, @JsonKey(name: "clinic_id")  String? clinicId, @JsonKey(name: "organization_id")  String? organizationId, @JsonKey(name: "service_id")  String? serviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRole() when $default != null:
return $default(_that.id,_that.name,_that.permissions,_that.clinicId,_that.organizationId,_that.serviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  Map<String, dynamic>? permissions, @JsonKey(name: "clinic_id")  String? clinicId, @JsonKey(name: "organization_id")  String? organizationId, @JsonKey(name: "service_id")  String? serviceId)  $default,) {final _that = this;
switch (_that) {
case _UserRole():
return $default(_that.id,_that.name,_that.permissions,_that.clinicId,_that.organizationId,_that.serviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  Map<String, dynamic>? permissions, @JsonKey(name: "clinic_id")  String? clinicId, @JsonKey(name: "organization_id")  String? organizationId, @JsonKey(name: "service_id")  String? serviceId)?  $default,) {final _that = this;
switch (_that) {
case _UserRole() when $default != null:
return $default(_that.id,_that.name,_that.permissions,_that.clinicId,_that.organizationId,_that.serviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRole extends UserRole {
  const _UserRole({this.id, this.name, final  Map<String, dynamic>? permissions, @JsonKey(name: "clinic_id") this.clinicId, @JsonKey(name: "organization_id") this.organizationId, @JsonKey(name: "service_id") this.serviceId}): _permissions = permissions,super._();
  factory _UserRole.fromJson(Map<String, dynamic> json) => _$UserRoleFromJson(json);

@override final  String? id;
@override final  String? name;
 final  Map<String, dynamic>? _permissions;
@override Map<String, dynamic>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableMapView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

// Add role-based IDs from backend
@override@JsonKey(name: "clinic_id") final  String? clinicId;
@override@JsonKey(name: "organization_id") final  String? organizationId;
@override@JsonKey(name: "service_id") final  String? serviceId;

/// Create a copy of UserRole
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRoleCopyWith<_UserRole> get copyWith => __$UserRoleCopyWithImpl<_UserRole>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRoleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRole&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_permissions),clinicId,organizationId,serviceId);

@override
String toString() {
  return 'UserRole(id: $id, name: $name, permissions: $permissions, clinicId: $clinicId, organizationId: $organizationId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class _$UserRoleCopyWith<$Res> implements $UserRoleCopyWith<$Res> {
  factory _$UserRoleCopyWith(_UserRole value, $Res Function(_UserRole) _then) = __$UserRoleCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, Map<String, dynamic>? permissions,@JsonKey(name: "clinic_id") String? clinicId,@JsonKey(name: "organization_id") String? organizationId,@JsonKey(name: "service_id") String? serviceId
});




}
/// @nodoc
class __$UserRoleCopyWithImpl<$Res>
    implements _$UserRoleCopyWith<$Res> {
  __$UserRoleCopyWithImpl(this._self, this._then);

  final _UserRole _self;
  final $Res Function(_UserRole) _then;

/// Create a copy of UserRole
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? permissions = freezed,Object? clinicId = freezed,Object? organizationId = freezed,Object? serviceId = freezed,}) {
  return _then(_UserRole(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginResponse {

 String? get accessToken; String? get email; int? get expiresIn; String? get firstName; String? get id; String? get lastName; String? get phone; String? get refreshToken; List<UserRole>? get roles; String? get tokenType; String? get username;// Add role-based IDs
 String? get organizationId; String? get clinicId; String? get serviceId;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.id, id) || other.id == id)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.username, username) || other.username == username)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,email,expiresIn,firstName,id,lastName,phone,refreshToken,const DeepCollectionEquality().hash(roles),tokenType,username,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'LoginResponse(accessToken: $accessToken, email: $email, expiresIn: $expiresIn, firstName: $firstName, id: $id, lastName: $lastName, phone: $phone, refreshToken: $refreshToken, roles: $roles, tokenType: $tokenType, username: $username, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 String? accessToken, String? email, int? expiresIn, String? firstName, String? id, String? lastName, String? phone, String? refreshToken, List<UserRole>? roles, String? tokenType, String? username, String? organizationId, String? clinicId, String? serviceId
});




}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? email = freezed,Object? expiresIn = freezed,Object? firstName = freezed,Object? id = freezed,Object? lastName = freezed,Object? phone = freezed,Object? refreshToken = freezed,Object? roles = freezed,Object? tokenType = freezed,Object? username = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRole>?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? accessToken,  String? email,  int? expiresIn,  String? firstName,  String? id,  String? lastName,  String? phone,  String? refreshToken,  List<UserRole>? roles,  String? tokenType,  String? username,  String? organizationId,  String? clinicId,  String? serviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.accessToken,_that.email,_that.expiresIn,_that.firstName,_that.id,_that.lastName,_that.phone,_that.refreshToken,_that.roles,_that.tokenType,_that.username,_that.organizationId,_that.clinicId,_that.serviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? accessToken,  String? email,  int? expiresIn,  String? firstName,  String? id,  String? lastName,  String? phone,  String? refreshToken,  List<UserRole>? roles,  String? tokenType,  String? username,  String? organizationId,  String? clinicId,  String? serviceId)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.accessToken,_that.email,_that.expiresIn,_that.firstName,_that.id,_that.lastName,_that.phone,_that.refreshToken,_that.roles,_that.tokenType,_that.username,_that.organizationId,_that.clinicId,_that.serviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? accessToken,  String? email,  int? expiresIn,  String? firstName,  String? id,  String? lastName,  String? phone,  String? refreshToken,  List<UserRole>? roles,  String? tokenType,  String? username,  String? organizationId,  String? clinicId,  String? serviceId)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.accessToken,_that.email,_that.expiresIn,_that.firstName,_that.id,_that.lastName,_that.phone,_that.refreshToken,_that.roles,_that.tokenType,_that.username,_that.organizationId,_that.clinicId,_that.serviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse extends LoginResponse {
  const _LoginResponse({this.accessToken, this.email, this.expiresIn, this.firstName, this.id, this.lastName, this.phone, this.refreshToken, final  List<UserRole>? roles, this.tokenType, this.username, this.organizationId, this.clinicId, this.serviceId}): _roles = roles,super._();
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  String? accessToken;
@override final  String? email;
@override final  int? expiresIn;
@override final  String? firstName;
@override final  String? id;
@override final  String? lastName;
@override final  String? phone;
@override final  String? refreshToken;
 final  List<UserRole>? _roles;
@override List<UserRole>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? tokenType;
@override final  String? username;
// Add role-based IDs
@override final  String? organizationId;
@override final  String? clinicId;
@override final  String? serviceId;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.id, id) || other.id == id)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.username, username) || other.username == username)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,email,expiresIn,firstName,id,lastName,phone,refreshToken,const DeepCollectionEquality().hash(_roles),tokenType,username,organizationId,clinicId,serviceId);

@override
String toString() {
  return 'LoginResponse(accessToken: $accessToken, email: $email, expiresIn: $expiresIn, firstName: $firstName, id: $id, lastName: $lastName, phone: $phone, refreshToken: $refreshToken, roles: $roles, tokenType: $tokenType, username: $username, organizationId: $organizationId, clinicId: $clinicId, serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String? accessToken, String? email, int? expiresIn, String? firstName, String? id, String? lastName, String? phone, String? refreshToken, List<UserRole>? roles, String? tokenType, String? username, String? organizationId, String? clinicId, String? serviceId
});




}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? email = freezed,Object? expiresIn = freezed,Object? firstName = freezed,Object? id = freezed,Object? lastName = freezed,Object? phone = freezed,Object? refreshToken = freezed,Object? roles = freezed,Object? tokenType = freezed,Object? username = freezed,Object? organizationId = freezed,Object? clinicId = freezed,Object? serviceId = freezed,}) {
  return _then(_LoginResponse(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRole>?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TokenModel {

 String? get accessToken; String? get refreshToken; String? get userId;
/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenModelCopyWith<TokenModel> get copyWith => _$TokenModelCopyWithImpl<TokenModel>(this as TokenModel, _$identity);

  /// Serializes this TokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,userId);

@override
String toString() {
  return 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TokenModelCopyWith<$Res>  {
  factory $TokenModelCopyWith(TokenModel value, $Res Function(TokenModel) _then) = _$TokenModelCopyWithImpl;
@useResult
$Res call({
 String? accessToken, String? refreshToken, String? userId
});




}
/// @nodoc
class _$TokenModelCopyWithImpl<$Res>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._self, this._then);

  final TokenModel _self;
  final $Res Function(TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? refreshToken = freezed,Object? userId = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenModel].
extension TokenModelPatterns on TokenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenModel value)  $default,){
final _that = this;
switch (_that) {
case _TokenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? accessToken,  String? refreshToken,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? accessToken,  String? refreshToken,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _TokenModel():
return $default(_that.accessToken,_that.refreshToken,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? accessToken,  String? refreshToken,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenModel extends TokenModel {
  const _TokenModel({this.accessToken, this.refreshToken, this.userId}): super._();
  factory _TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

@override final  String? accessToken;
@override final  String? refreshToken;
@override final  String? userId;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenModelCopyWith<_TokenModel> get copyWith => __$TokenModelCopyWithImpl<_TokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,userId);

@override
String toString() {
  return 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$TokenModelCopyWith<$Res> implements $TokenModelCopyWith<$Res> {
  factory _$TokenModelCopyWith(_TokenModel value, $Res Function(_TokenModel) _then) = __$TokenModelCopyWithImpl;
@override @useResult
$Res call({
 String? accessToken, String? refreshToken, String? userId
});




}
/// @nodoc
class __$TokenModelCopyWithImpl<$Res>
    implements _$TokenModelCopyWith<$Res> {
  __$TokenModelCopyWithImpl(this._self, this._then);

  final _TokenModel _self;
  final $Res Function(_TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? refreshToken = freezed,Object? userId = freezed,}) {
  return _then(_TokenModel(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AuthResponse {

 UserModel? get user; String? get accessToken; String? get refreshToken;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken);

@override
String toString() {
  return 'AuthResponse(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
 UserModel? user, String? accessToken, String? refreshToken
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponse].
extension AuthResponsePatterns on AuthResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel? user,  String? accessToken,  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.user,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel? user,  String? accessToken,  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AuthResponse():
return $default(_that.user,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel? user,  String? accessToken,  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.user,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponse extends AuthResponse {
  const _AuthResponse({this.user, this.accessToken, this.refreshToken}): super._();
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override final  UserModel? user;
@override final  String? accessToken;
@override final  String? refreshToken;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken);

@override
String toString() {
  return 'AuthResponse(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
 UserModel? user, String? accessToken, String? refreshToken
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,}) {
  return _then(_AuthResponse(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
