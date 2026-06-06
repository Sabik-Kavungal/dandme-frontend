// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctors_by_clinic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClinicInfoModel {

 String get id;@JsonKey(name: "clinic_code") String get clinicCode; String get name; String get address;
/// Create a copy of ClinicInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicInfoModelCopyWith<ClinicInfoModel> get copyWith => _$ClinicInfoModelCopyWithImpl<ClinicInfoModel>(this as ClinicInfoModel, _$identity);

  /// Serializes this ClinicInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicCode,name,address);

@override
String toString() {
  return 'ClinicInfoModel(id: $id, clinicCode: $clinicCode, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $ClinicInfoModelCopyWith<$Res>  {
  factory $ClinicInfoModelCopyWith(ClinicInfoModel value, $Res Function(ClinicInfoModel) _then) = _$ClinicInfoModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "clinic_code") String clinicCode, String name, String address
});




}
/// @nodoc
class _$ClinicInfoModelCopyWithImpl<$Res>
    implements $ClinicInfoModelCopyWith<$Res> {
  _$ClinicInfoModelCopyWithImpl(this._self, this._then);

  final ClinicInfoModel _self;
  final $Res Function(ClinicInfoModel) _then;

/// Create a copy of ClinicInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clinicCode = null,Object? name = null,Object? address = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicCode: null == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicInfoModel].
extension ClinicInfoModelPatterns on ClinicInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ClinicInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "clinic_code")  String clinicCode,  String name,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicInfoModel() when $default != null:
return $default(_that.id,_that.clinicCode,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "clinic_code")  String clinicCode,  String name,  String address)  $default,) {final _that = this;
switch (_that) {
case _ClinicInfoModel():
return $default(_that.id,_that.clinicCode,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "clinic_code")  String clinicCode,  String name,  String address)?  $default,) {final _that = this;
switch (_that) {
case _ClinicInfoModel() when $default != null:
return $default(_that.id,_that.clinicCode,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicInfoModel implements ClinicInfoModel {
  const _ClinicInfoModel({required this.id, @JsonKey(name: "clinic_code") required this.clinicCode, required this.name, required this.address});
  factory _ClinicInfoModel.fromJson(Map<String, dynamic> json) => _$ClinicInfoModelFromJson(json);

@override final  String id;
@override@JsonKey(name: "clinic_code") final  String clinicCode;
@override final  String name;
@override final  String address;

/// Create a copy of ClinicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicInfoModelCopyWith<_ClinicInfoModel> get copyWith => __$ClinicInfoModelCopyWithImpl<_ClinicInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicCode,name,address);

@override
String toString() {
  return 'ClinicInfoModel(id: $id, clinicCode: $clinicCode, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ClinicInfoModelCopyWith<$Res> implements $ClinicInfoModelCopyWith<$Res> {
  factory _$ClinicInfoModelCopyWith(_ClinicInfoModel value, $Res Function(_ClinicInfoModel) _then) = __$ClinicInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "clinic_code") String clinicCode, String name, String address
});




}
/// @nodoc
class __$ClinicInfoModelCopyWithImpl<$Res>
    implements _$ClinicInfoModelCopyWith<$Res> {
  __$ClinicInfoModelCopyWithImpl(this._self, this._then);

  final _ClinicInfoModel _self;
  final $Res Function(_ClinicInfoModel) _then;

/// Create a copy of ClinicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clinicCode = null,Object? name = null,Object? address = null,}) {
  return _then(_ClinicInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicCode: null == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DoctorInClinicModel {

 String get id;@JsonKey(name: "user_id") String get userId;@JsonKey(name: "doctor_code") String get doctorCode;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName; String get email; String get phone; String get specialization;@JsonKey(name: "license_number") String get licenseNumber;@JsonKey(name: "is_active") bool get isActive;@JsonKey(name: "is_main_doctor") bool get isMainDoctor;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of DoctorInClinicModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorInClinicModelCopyWith<DoctorInClinicModel> get copyWith => _$DoctorInClinicModelCopyWithImpl<DoctorInClinicModel>(this as DoctorInClinicModel, _$identity);

  /// Serializes this DoctorInClinicModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorInClinicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isMainDoctor, isMainDoctor) || other.isMainDoctor == isMainDoctor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,doctorCode,firstName,lastName,email,phone,specialization,licenseNumber,isActive,isMainDoctor,createdAt);

@override
String toString() {
  return 'DoctorInClinicModel(id: $id, userId: $userId, doctorCode: $doctorCode, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, specialization: $specialization, licenseNumber: $licenseNumber, isActive: $isActive, isMainDoctor: $isMainDoctor, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DoctorInClinicModelCopyWith<$Res>  {
  factory $DoctorInClinicModelCopyWith(DoctorInClinicModel value, $Res Function(DoctorInClinicModel) _then) = _$DoctorInClinicModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "doctor_code") String doctorCode,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String email, String phone, String specialization,@JsonKey(name: "license_number") String licenseNumber,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "is_main_doctor") bool isMainDoctor,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class _$DoctorInClinicModelCopyWithImpl<$Res>
    implements $DoctorInClinicModelCopyWith<$Res> {
  _$DoctorInClinicModelCopyWithImpl(this._self, this._then);

  final DoctorInClinicModel _self;
  final $Res Function(DoctorInClinicModel) _then;

/// Create a copy of DoctorInClinicModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? doctorCode = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,Object? specialization = null,Object? licenseNumber = null,Object? isActive = null,Object? isMainDoctor = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isMainDoctor: null == isMainDoctor ? _self.isMainDoctor : isMainDoctor // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorInClinicModel].
extension DoctorInClinicModelPatterns on DoctorInClinicModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorInClinicModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorInClinicModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorInClinicModel value)  $default,){
final _that = this;
switch (_that) {
case _DoctorInClinicModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorInClinicModel value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorInClinicModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "doctor_code")  String doctorCode, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String email,  String phone,  String specialization, @JsonKey(name: "license_number")  String licenseNumber, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "is_main_doctor")  bool isMainDoctor, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorInClinicModel() when $default != null:
return $default(_that.id,_that.userId,_that.doctorCode,_that.firstName,_that.lastName,_that.email,_that.phone,_that.specialization,_that.licenseNumber,_that.isActive,_that.isMainDoctor,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "doctor_code")  String doctorCode, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String email,  String phone,  String specialization, @JsonKey(name: "license_number")  String licenseNumber, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "is_main_doctor")  bool isMainDoctor, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _DoctorInClinicModel():
return $default(_that.id,_that.userId,_that.doctorCode,_that.firstName,_that.lastName,_that.email,_that.phone,_that.specialization,_that.licenseNumber,_that.isActive,_that.isMainDoctor,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "doctor_code")  String doctorCode, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String email,  String phone,  String specialization, @JsonKey(name: "license_number")  String licenseNumber, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "is_main_doctor")  bool isMainDoctor, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DoctorInClinicModel() when $default != null:
return $default(_that.id,_that.userId,_that.doctorCode,_that.firstName,_that.lastName,_that.email,_that.phone,_that.specialization,_that.licenseNumber,_that.isActive,_that.isMainDoctor,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorInClinicModel implements DoctorInClinicModel {
  const _DoctorInClinicModel({required this.id, @JsonKey(name: "user_id") required this.userId, @JsonKey(name: "doctor_code") required this.doctorCode, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, required this.email, required this.phone, required this.specialization, @JsonKey(name: "license_number") required this.licenseNumber, @JsonKey(name: "is_active") this.isActive = true, @JsonKey(name: "is_main_doctor") this.isMainDoctor = false, @JsonKey(name: "created_at") this.createdAt});
  factory _DoctorInClinicModel.fromJson(Map<String, dynamic> json) => _$DoctorInClinicModelFromJson(json);

@override final  String id;
@override@JsonKey(name: "user_id") final  String userId;
@override@JsonKey(name: "doctor_code") final  String doctorCode;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override final  String email;
@override final  String phone;
@override final  String specialization;
@override@JsonKey(name: "license_number") final  String licenseNumber;
@override@JsonKey(name: "is_active") final  bool isActive;
@override@JsonKey(name: "is_main_doctor") final  bool isMainDoctor;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of DoctorInClinicModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorInClinicModelCopyWith<_DoctorInClinicModel> get copyWith => __$DoctorInClinicModelCopyWithImpl<_DoctorInClinicModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorInClinicModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorInClinicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isMainDoctor, isMainDoctor) || other.isMainDoctor == isMainDoctor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,doctorCode,firstName,lastName,email,phone,specialization,licenseNumber,isActive,isMainDoctor,createdAt);

@override
String toString() {
  return 'DoctorInClinicModel(id: $id, userId: $userId, doctorCode: $doctorCode, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, specialization: $specialization, licenseNumber: $licenseNumber, isActive: $isActive, isMainDoctor: $isMainDoctor, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorInClinicModelCopyWith<$Res> implements $DoctorInClinicModelCopyWith<$Res> {
  factory _$DoctorInClinicModelCopyWith(_DoctorInClinicModel value, $Res Function(_DoctorInClinicModel) _then) = __$DoctorInClinicModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "doctor_code") String doctorCode,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String email, String phone, String specialization,@JsonKey(name: "license_number") String licenseNumber,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "is_main_doctor") bool isMainDoctor,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class __$DoctorInClinicModelCopyWithImpl<$Res>
    implements _$DoctorInClinicModelCopyWith<$Res> {
  __$DoctorInClinicModelCopyWithImpl(this._self, this._then);

  final _DoctorInClinicModel _self;
  final $Res Function(_DoctorInClinicModel) _then;

/// Create a copy of DoctorInClinicModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? doctorCode = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,Object? specialization = null,Object? licenseNumber = null,Object? isActive = null,Object? isMainDoctor = null,Object? createdAt = freezed,}) {
  return _then(_DoctorInClinicModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isMainDoctor: null == isMainDoctor ? _self.isMainDoctor : isMainDoctor // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DoctorsByClinicResponse {

 ClinicInfoModel get clinic; List<DoctorInClinicModel> get doctors;@JsonKey(name: "total_count") int get totalCount;
/// Create a copy of DoctorsByClinicResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorsByClinicResponseCopyWith<DoctorsByClinicResponse> get copyWith => _$DoctorsByClinicResponseCopyWithImpl<DoctorsByClinicResponse>(this as DoctorsByClinicResponse, _$identity);

  /// Serializes this DoctorsByClinicResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsByClinicResponse&&(identical(other.clinic, clinic) || other.clinic == clinic)&&const DeepCollectionEquality().equals(other.doctors, doctors)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinic,const DeepCollectionEquality().hash(doctors),totalCount);

@override
String toString() {
  return 'DoctorsByClinicResponse(clinic: $clinic, doctors: $doctors, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $DoctorsByClinicResponseCopyWith<$Res>  {
  factory $DoctorsByClinicResponseCopyWith(DoctorsByClinicResponse value, $Res Function(DoctorsByClinicResponse) _then) = _$DoctorsByClinicResponseCopyWithImpl;
@useResult
$Res call({
 ClinicInfoModel clinic, List<DoctorInClinicModel> doctors,@JsonKey(name: "total_count") int totalCount
});


$ClinicInfoModelCopyWith<$Res> get clinic;

}
/// @nodoc
class _$DoctorsByClinicResponseCopyWithImpl<$Res>
    implements $DoctorsByClinicResponseCopyWith<$Res> {
  _$DoctorsByClinicResponseCopyWithImpl(this._self, this._then);

  final DoctorsByClinicResponse _self;
  final $Res Function(DoctorsByClinicResponse) _then;

/// Create a copy of DoctorsByClinicResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinic = null,Object? doctors = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfoModel,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<DoctorInClinicModel>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of DoctorsByClinicResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoModelCopyWith<$Res> get clinic {
  
  return $ClinicInfoModelCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}
}


/// Adds pattern-matching-related methods to [DoctorsByClinicResponse].
extension DoctorsByClinicResponsePatterns on DoctorsByClinicResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorsByClinicResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorsByClinicResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorsByClinicResponse value)  $default,){
final _that = this;
switch (_that) {
case _DoctorsByClinicResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorsByClinicResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorsByClinicResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClinicInfoModel clinic,  List<DoctorInClinicModel> doctors, @JsonKey(name: "total_count")  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorsByClinicResponse() when $default != null:
return $default(_that.clinic,_that.doctors,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClinicInfoModel clinic,  List<DoctorInClinicModel> doctors, @JsonKey(name: "total_count")  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _DoctorsByClinicResponse():
return $default(_that.clinic,_that.doctors,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClinicInfoModel clinic,  List<DoctorInClinicModel> doctors, @JsonKey(name: "total_count")  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _DoctorsByClinicResponse() when $default != null:
return $default(_that.clinic,_that.doctors,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorsByClinicResponse implements DoctorsByClinicResponse {
  const _DoctorsByClinicResponse({required this.clinic, required final  List<DoctorInClinicModel> doctors, @JsonKey(name: "total_count") required this.totalCount}): _doctors = doctors;
  factory _DoctorsByClinicResponse.fromJson(Map<String, dynamic> json) => _$DoctorsByClinicResponseFromJson(json);

@override final  ClinicInfoModel clinic;
 final  List<DoctorInClinicModel> _doctors;
@override List<DoctorInClinicModel> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

@override@JsonKey(name: "total_count") final  int totalCount;

/// Create a copy of DoctorsByClinicResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorsByClinicResponseCopyWith<_DoctorsByClinicResponse> get copyWith => __$DoctorsByClinicResponseCopyWithImpl<_DoctorsByClinicResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorsByClinicResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorsByClinicResponse&&(identical(other.clinic, clinic) || other.clinic == clinic)&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinic,const DeepCollectionEquality().hash(_doctors),totalCount);

@override
String toString() {
  return 'DoctorsByClinicResponse(clinic: $clinic, doctors: $doctors, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$DoctorsByClinicResponseCopyWith<$Res> implements $DoctorsByClinicResponseCopyWith<$Res> {
  factory _$DoctorsByClinicResponseCopyWith(_DoctorsByClinicResponse value, $Res Function(_DoctorsByClinicResponse) _then) = __$DoctorsByClinicResponseCopyWithImpl;
@override @useResult
$Res call({
 ClinicInfoModel clinic, List<DoctorInClinicModel> doctors,@JsonKey(name: "total_count") int totalCount
});


@override $ClinicInfoModelCopyWith<$Res> get clinic;

}
/// @nodoc
class __$DoctorsByClinicResponseCopyWithImpl<$Res>
    implements _$DoctorsByClinicResponseCopyWith<$Res> {
  __$DoctorsByClinicResponseCopyWithImpl(this._self, this._then);

  final _DoctorsByClinicResponse _self;
  final $Res Function(_DoctorsByClinicResponse) _then;

/// Create a copy of DoctorsByClinicResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinic = null,Object? doctors = null,Object? totalCount = null,}) {
  return _then(_DoctorsByClinicResponse(
clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfoModel,doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<DoctorInClinicModel>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of DoctorsByClinicResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoModelCopyWith<$Res> get clinic {
  
  return $ClinicInfoModelCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}
}

// dart format on
