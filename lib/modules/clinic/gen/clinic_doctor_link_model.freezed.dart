// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_doctor_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClinicInfo {

@JsonKey(name: "clinic_code") String get clinicCode; String get name;
/// Create a copy of ClinicInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<ClinicInfo> get copyWith => _$ClinicInfoCopyWithImpl<ClinicInfo>(this as ClinicInfo, _$identity);

  /// Serializes this ClinicInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicInfo&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicCode,name);

@override
String toString() {
  return 'ClinicInfo(clinicCode: $clinicCode, name: $name)';
}


}

/// @nodoc
abstract mixin class $ClinicInfoCopyWith<$Res>  {
  factory $ClinicInfoCopyWith(ClinicInfo value, $Res Function(ClinicInfo) _then) = _$ClinicInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "clinic_code") String clinicCode, String name
});




}
/// @nodoc
class _$ClinicInfoCopyWithImpl<$Res>
    implements $ClinicInfoCopyWith<$Res> {
  _$ClinicInfoCopyWithImpl(this._self, this._then);

  final ClinicInfo _self;
  final $Res Function(ClinicInfo) _then;

/// Create a copy of ClinicInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicCode = null,Object? name = null,}) {
  return _then(_self.copyWith(
clinicCode: null == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicInfo].
extension ClinicInfoPatterns on ClinicInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicInfo value)  $default,){
final _that = this;
switch (_that) {
case _ClinicInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_code")  String clinicCode,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicInfo() when $default != null:
return $default(_that.clinicCode,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_code")  String clinicCode,  String name)  $default,) {final _that = this;
switch (_that) {
case _ClinicInfo():
return $default(_that.clinicCode,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "clinic_code")  String clinicCode,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ClinicInfo() when $default != null:
return $default(_that.clinicCode,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicInfo implements ClinicInfo {
  const _ClinicInfo({@JsonKey(name: "clinic_code") required this.clinicCode, required this.name});
  factory _ClinicInfo.fromJson(Map<String, dynamic> json) => _$ClinicInfoFromJson(json);

@override@JsonKey(name: "clinic_code") final  String clinicCode;
@override final  String name;

/// Create a copy of ClinicInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicInfoCopyWith<_ClinicInfo> get copyWith => __$ClinicInfoCopyWithImpl<_ClinicInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicInfo&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicCode,name);

@override
String toString() {
  return 'ClinicInfo(clinicCode: $clinicCode, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ClinicInfoCopyWith<$Res> implements $ClinicInfoCopyWith<$Res> {
  factory _$ClinicInfoCopyWith(_ClinicInfo value, $Res Function(_ClinicInfo) _then) = __$ClinicInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "clinic_code") String clinicCode, String name
});




}
/// @nodoc
class __$ClinicInfoCopyWithImpl<$Res>
    implements _$ClinicInfoCopyWith<$Res> {
  __$ClinicInfoCopyWithImpl(this._self, this._then);

  final _ClinicInfo _self;
  final $Res Function(_ClinicInfo) _then;

/// Create a copy of ClinicInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicCode = null,Object? name = null,}) {
  return _then(_ClinicInfo(
clinicCode: null == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DoctorInfo {

@JsonKey(name: "doctor_code") String get doctorCode; String get email;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName; String get specialization; String get username;@JsonKey(name: "profile_image") String? get profileImage;
/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<DoctorInfo> get copyWith => _$DoctorInfoCopyWithImpl<DoctorInfo>(this as DoctorInfo, _$identity);

  /// Serializes this DoctorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorInfo&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.username, username) || other.username == username)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorCode,email,firstName,lastName,specialization,username,profileImage);

@override
String toString() {
  return 'DoctorInfo(doctorCode: $doctorCode, email: $email, firstName: $firstName, lastName: $lastName, specialization: $specialization, username: $username, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class $DoctorInfoCopyWith<$Res>  {
  factory $DoctorInfoCopyWith(DoctorInfo value, $Res Function(DoctorInfo) _then) = _$DoctorInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "doctor_code") String doctorCode, String email,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String specialization, String username,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class _$DoctorInfoCopyWithImpl<$Res>
    implements $DoctorInfoCopyWith<$Res> {
  _$DoctorInfoCopyWithImpl(this._self, this._then);

  final DoctorInfo _self;
  final $Res Function(DoctorInfo) _then;

/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorCode = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? specialization = null,Object? username = null,Object? profileImage = freezed,}) {
  return _then(_self.copyWith(
doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorInfo].
extension DoctorInfoPatterns on DoctorInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorInfo value)  $default,){
final _that = this;
switch (_that) {
case _DoctorInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "doctor_code")  String doctorCode,  String email, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String specialization,  String username, @JsonKey(name: "profile_image")  String? profileImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorInfo() when $default != null:
return $default(_that.doctorCode,_that.email,_that.firstName,_that.lastName,_that.specialization,_that.username,_that.profileImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "doctor_code")  String doctorCode,  String email, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String specialization,  String username, @JsonKey(name: "profile_image")  String? profileImage)  $default,) {final _that = this;
switch (_that) {
case _DoctorInfo():
return $default(_that.doctorCode,_that.email,_that.firstName,_that.lastName,_that.specialization,_that.username,_that.profileImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "doctor_code")  String doctorCode,  String email, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String specialization,  String username, @JsonKey(name: "profile_image")  String? profileImage)?  $default,) {final _that = this;
switch (_that) {
case _DoctorInfo() when $default != null:
return $default(_that.doctorCode,_that.email,_that.firstName,_that.lastName,_that.specialization,_that.username,_that.profileImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorInfo implements DoctorInfo {
  const _DoctorInfo({@JsonKey(name: "doctor_code") required this.doctorCode, required this.email, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, required this.specialization, required this.username, @JsonKey(name: "profile_image") this.profileImage});
  factory _DoctorInfo.fromJson(Map<String, dynamic> json) => _$DoctorInfoFromJson(json);

@override@JsonKey(name: "doctor_code") final  String doctorCode;
@override final  String email;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override final  String specialization;
@override final  String username;
@override@JsonKey(name: "profile_image") final  String? profileImage;

/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorInfoCopyWith<_DoctorInfo> get copyWith => __$DoctorInfoCopyWithImpl<_DoctorInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorInfo&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.username, username) || other.username == username)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorCode,email,firstName,lastName,specialization,username,profileImage);

@override
String toString() {
  return 'DoctorInfo(doctorCode: $doctorCode, email: $email, firstName: $firstName, lastName: $lastName, specialization: $specialization, username: $username, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class _$DoctorInfoCopyWith<$Res> implements $DoctorInfoCopyWith<$Res> {
  factory _$DoctorInfoCopyWith(_DoctorInfo value, $Res Function(_DoctorInfo) _then) = __$DoctorInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "doctor_code") String doctorCode, String email,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String specialization, String username,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class __$DoctorInfoCopyWithImpl<$Res>
    implements _$DoctorInfoCopyWith<$Res> {
  __$DoctorInfoCopyWithImpl(this._self, this._then);

  final _DoctorInfo _self;
  final $Res Function(_DoctorInfo) _then;

/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorCode = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? specialization = null,Object? username = null,Object? profileImage = freezed,}) {
  return _then(_DoctorInfo(
doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClinicDoctorLinkModel {

 ClinicInfo get clinic; DoctorInfo get doctor;
/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicDoctorLinkModelCopyWith<ClinicDoctorLinkModel> get copyWith => _$ClinicDoctorLinkModelCopyWithImpl<ClinicDoctorLinkModel>(this as ClinicDoctorLinkModel, _$identity);

  /// Serializes this ClinicDoctorLinkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicDoctorLinkModel&&(identical(other.clinic, clinic) || other.clinic == clinic)&&(identical(other.doctor, doctor) || other.doctor == doctor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinic,doctor);

@override
String toString() {
  return 'ClinicDoctorLinkModel(clinic: $clinic, doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class $ClinicDoctorLinkModelCopyWith<$Res>  {
  factory $ClinicDoctorLinkModelCopyWith(ClinicDoctorLinkModel value, $Res Function(ClinicDoctorLinkModel) _then) = _$ClinicDoctorLinkModelCopyWithImpl;
@useResult
$Res call({
 ClinicInfo clinic, DoctorInfo doctor
});


$ClinicInfoCopyWith<$Res> get clinic;$DoctorInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class _$ClinicDoctorLinkModelCopyWithImpl<$Res>
    implements $ClinicDoctorLinkModelCopyWith<$Res> {
  _$ClinicDoctorLinkModelCopyWithImpl(this._self, this._then);

  final ClinicDoctorLinkModel _self;
  final $Res Function(ClinicDoctorLinkModel) _then;

/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinic = null,Object? doctor = null,}) {
  return _then(_self.copyWith(
clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfo,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorInfo,
  ));
}
/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<$Res> get clinic {
  
  return $ClinicInfoCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<$Res> get doctor {
  
  return $DoctorInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClinicDoctorLinkModel].
extension ClinicDoctorLinkModelPatterns on ClinicDoctorLinkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicDoctorLinkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicDoctorLinkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicDoctorLinkModel value)  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorLinkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicDoctorLinkModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorLinkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClinicInfo clinic,  DoctorInfo doctor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicDoctorLinkModel() when $default != null:
return $default(_that.clinic,_that.doctor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClinicInfo clinic,  DoctorInfo doctor)  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorLinkModel():
return $default(_that.clinic,_that.doctor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClinicInfo clinic,  DoctorInfo doctor)?  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorLinkModel() when $default != null:
return $default(_that.clinic,_that.doctor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicDoctorLinkModel implements ClinicDoctorLinkModel {
  const _ClinicDoctorLinkModel({required this.clinic, required this.doctor});
  factory _ClinicDoctorLinkModel.fromJson(Map<String, dynamic> json) => _$ClinicDoctorLinkModelFromJson(json);

@override final  ClinicInfo clinic;
@override final  DoctorInfo doctor;

/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicDoctorLinkModelCopyWith<_ClinicDoctorLinkModel> get copyWith => __$ClinicDoctorLinkModelCopyWithImpl<_ClinicDoctorLinkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicDoctorLinkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicDoctorLinkModel&&(identical(other.clinic, clinic) || other.clinic == clinic)&&(identical(other.doctor, doctor) || other.doctor == doctor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinic,doctor);

@override
String toString() {
  return 'ClinicDoctorLinkModel(clinic: $clinic, doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class _$ClinicDoctorLinkModelCopyWith<$Res> implements $ClinicDoctorLinkModelCopyWith<$Res> {
  factory _$ClinicDoctorLinkModelCopyWith(_ClinicDoctorLinkModel value, $Res Function(_ClinicDoctorLinkModel) _then) = __$ClinicDoctorLinkModelCopyWithImpl;
@override @useResult
$Res call({
 ClinicInfo clinic, DoctorInfo doctor
});


@override $ClinicInfoCopyWith<$Res> get clinic;@override $DoctorInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class __$ClinicDoctorLinkModelCopyWithImpl<$Res>
    implements _$ClinicDoctorLinkModelCopyWith<$Res> {
  __$ClinicDoctorLinkModelCopyWithImpl(this._self, this._then);

  final _ClinicDoctorLinkModel _self;
  final $Res Function(_ClinicDoctorLinkModel) _then;

/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinic = null,Object? doctor = null,}) {
  return _then(_ClinicDoctorLinkModel(
clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfo,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorInfo,
  ));
}

/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<$Res> get clinic {
  
  return $ClinicInfoCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}/// Create a copy of ClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<$Res> get doctor {
  
  return $DoctorInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// @nodoc
mixin _$CreateClinicDoctorLinkModel {

 List<ClinicDoctorLinkModel> get links;
/// Create a copy of CreateClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClinicDoctorLinkModelCopyWith<CreateClinicDoctorLinkModel> get copyWith => _$CreateClinicDoctorLinkModelCopyWithImpl<CreateClinicDoctorLinkModel>(this as CreateClinicDoctorLinkModel, _$identity);

  /// Serializes this CreateClinicDoctorLinkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClinicDoctorLinkModel&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'CreateClinicDoctorLinkModel(links: $links)';
}


}

/// @nodoc
abstract mixin class $CreateClinicDoctorLinkModelCopyWith<$Res>  {
  factory $CreateClinicDoctorLinkModelCopyWith(CreateClinicDoctorLinkModel value, $Res Function(CreateClinicDoctorLinkModel) _then) = _$CreateClinicDoctorLinkModelCopyWithImpl;
@useResult
$Res call({
 List<ClinicDoctorLinkModel> links
});




}
/// @nodoc
class _$CreateClinicDoctorLinkModelCopyWithImpl<$Res>
    implements $CreateClinicDoctorLinkModelCopyWith<$Res> {
  _$CreateClinicDoctorLinkModelCopyWithImpl(this._self, this._then);

  final CreateClinicDoctorLinkModel _self;
  final $Res Function(CreateClinicDoctorLinkModel) _then;

/// Create a copy of CreateClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? links = null,}) {
  return _then(_self.copyWith(
links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<ClinicDoctorLinkModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClinicDoctorLinkModel].
extension CreateClinicDoctorLinkModelPatterns on CreateClinicDoctorLinkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClinicDoctorLinkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClinicDoctorLinkModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClinicDoctorLinkModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ClinicDoctorLinkModel> links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkModel() when $default != null:
return $default(_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ClinicDoctorLinkModel> links)  $default,) {final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkModel():
return $default(_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ClinicDoctorLinkModel> links)?  $default,) {final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkModel() when $default != null:
return $default(_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateClinicDoctorLinkModel implements CreateClinicDoctorLinkModel {
  const _CreateClinicDoctorLinkModel({required final  List<ClinicDoctorLinkModel> links}): _links = links;
  factory _CreateClinicDoctorLinkModel.fromJson(Map<String, dynamic> json) => _$CreateClinicDoctorLinkModelFromJson(json);

 final  List<ClinicDoctorLinkModel> _links;
@override List<ClinicDoctorLinkModel> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}


/// Create a copy of CreateClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClinicDoctorLinkModelCopyWith<_CreateClinicDoctorLinkModel> get copyWith => __$CreateClinicDoctorLinkModelCopyWithImpl<_CreateClinicDoctorLinkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClinicDoctorLinkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClinicDoctorLinkModel&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'CreateClinicDoctorLinkModel(links: $links)';
}


}

/// @nodoc
abstract mixin class _$CreateClinicDoctorLinkModelCopyWith<$Res> implements $CreateClinicDoctorLinkModelCopyWith<$Res> {
  factory _$CreateClinicDoctorLinkModelCopyWith(_CreateClinicDoctorLinkModel value, $Res Function(_CreateClinicDoctorLinkModel) _then) = __$CreateClinicDoctorLinkModelCopyWithImpl;
@override @useResult
$Res call({
 List<ClinicDoctorLinkModel> links
});




}
/// @nodoc
class __$CreateClinicDoctorLinkModelCopyWithImpl<$Res>
    implements _$CreateClinicDoctorLinkModelCopyWith<$Res> {
  __$CreateClinicDoctorLinkModelCopyWithImpl(this._self, this._then);

  final _CreateClinicDoctorLinkModel _self;
  final $Res Function(_CreateClinicDoctorLinkModel) _then;

/// Create a copy of CreateClinicDoctorLinkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? links = null,}) {
  return _then(_CreateClinicDoctorLinkModel(
links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<ClinicDoctorLinkModel>,
  ));
}


}


/// @nodoc
mixin _$ClinicDoctorLinkResponse {

@JsonKey(name: "link_id") String? get linkId; ClinicInfo get clinic; DoctorFullInfo get doctor;@JsonKey(name: "consultation_fee_offline") double? get consultationFeeOffline;@JsonKey(name: "consultation_fee_online") double? get consultationFeeOnline;@JsonKey(name: "follow_up_fee") double? get followUpFee;@JsonKey(name: "follow_up_days") int? get followUpDays; String? get notes;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicDoctorLinkResponseCopyWith<ClinicDoctorLinkResponse> get copyWith => _$ClinicDoctorLinkResponseCopyWithImpl<ClinicDoctorLinkResponse>(this as ClinicDoctorLinkResponse, _$identity);

  /// Serializes this ClinicDoctorLinkResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicDoctorLinkResponse&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.clinic, clinic) || other.clinic == clinic)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,linkId,clinic,doctor,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes,createdAt,updatedAt,isActive);

@override
String toString() {
  return 'ClinicDoctorLinkResponse(linkId: $linkId, clinic: $clinic, doctor: $doctor, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ClinicDoctorLinkResponseCopyWith<$Res>  {
  factory $ClinicDoctorLinkResponseCopyWith(ClinicDoctorLinkResponse value, $Res Function(ClinicDoctorLinkResponse) _then) = _$ClinicDoctorLinkResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "link_id") String? linkId, ClinicInfo clinic, DoctorFullInfo doctor,@JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays, String? notes,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "is_active") bool? isActive
});


$ClinicInfoCopyWith<$Res> get clinic;$DoctorFullInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class _$ClinicDoctorLinkResponseCopyWithImpl<$Res>
    implements $ClinicDoctorLinkResponseCopyWith<$Res> {
  _$ClinicDoctorLinkResponseCopyWithImpl(this._self, this._then);

  final ClinicDoctorLinkResponse _self;
  final $Res Function(ClinicDoctorLinkResponse) _then;

/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? linkId = freezed,Object? clinic = null,Object? doctor = null,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
linkId: freezed == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String?,clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfo,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorFullInfo,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<$Res> get clinic {
  
  return $ClinicInfoCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorFullInfoCopyWith<$Res> get doctor {
  
  return $DoctorFullInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClinicDoctorLinkResponse].
extension ClinicDoctorLinkResponsePatterns on ClinicDoctorLinkResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicDoctorLinkResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicDoctorLinkResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicDoctorLinkResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorLinkResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicDoctorLinkResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorLinkResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "link_id")  String? linkId,  ClinicInfo clinic,  DoctorFullInfo doctor, @JsonKey(name: "consultation_fee_offline")  double? consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double? consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays,  String? notes, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "is_active")  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicDoctorLinkResponse() when $default != null:
return $default(_that.linkId,_that.clinic,_that.doctor,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes,_that.createdAt,_that.updatedAt,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "link_id")  String? linkId,  ClinicInfo clinic,  DoctorFullInfo doctor, @JsonKey(name: "consultation_fee_offline")  double? consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double? consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays,  String? notes, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "is_active")  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorLinkResponse():
return $default(_that.linkId,_that.clinic,_that.doctor,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes,_that.createdAt,_that.updatedAt,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "link_id")  String? linkId,  ClinicInfo clinic,  DoctorFullInfo doctor, @JsonKey(name: "consultation_fee_offline")  double? consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double? consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays,  String? notes, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "is_active")  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorLinkResponse() when $default != null:
return $default(_that.linkId,_that.clinic,_that.doctor,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes,_that.createdAt,_that.updatedAt,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicDoctorLinkResponse implements ClinicDoctorLinkResponse {
  const _ClinicDoctorLinkResponse({@JsonKey(name: "link_id") this.linkId, required this.clinic, required this.doctor, @JsonKey(name: "consultation_fee_offline") this.consultationFeeOffline, @JsonKey(name: "consultation_fee_online") this.consultationFeeOnline, @JsonKey(name: "follow_up_fee") this.followUpFee, @JsonKey(name: "follow_up_days") this.followUpDays, this.notes, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt, @JsonKey(name: "is_active") this.isActive});
  factory _ClinicDoctorLinkResponse.fromJson(Map<String, dynamic> json) => _$ClinicDoctorLinkResponseFromJson(json);

@override@JsonKey(name: "link_id") final  String? linkId;
@override final  ClinicInfo clinic;
@override final  DoctorFullInfo doctor;
@override@JsonKey(name: "consultation_fee_offline") final  double? consultationFeeOffline;
@override@JsonKey(name: "consultation_fee_online") final  double? consultationFeeOnline;
@override@JsonKey(name: "follow_up_fee") final  double? followUpFee;
@override@JsonKey(name: "follow_up_days") final  int? followUpDays;
@override final  String? notes;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicDoctorLinkResponseCopyWith<_ClinicDoctorLinkResponse> get copyWith => __$ClinicDoctorLinkResponseCopyWithImpl<_ClinicDoctorLinkResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicDoctorLinkResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicDoctorLinkResponse&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.clinic, clinic) || other.clinic == clinic)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,linkId,clinic,doctor,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes,createdAt,updatedAt,isActive);

@override
String toString() {
  return 'ClinicDoctorLinkResponse(linkId: $linkId, clinic: $clinic, doctor: $doctor, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ClinicDoctorLinkResponseCopyWith<$Res> implements $ClinicDoctorLinkResponseCopyWith<$Res> {
  factory _$ClinicDoctorLinkResponseCopyWith(_ClinicDoctorLinkResponse value, $Res Function(_ClinicDoctorLinkResponse) _then) = __$ClinicDoctorLinkResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "link_id") String? linkId, ClinicInfo clinic, DoctorFullInfo doctor,@JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays, String? notes,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "is_active") bool? isActive
});


@override $ClinicInfoCopyWith<$Res> get clinic;@override $DoctorFullInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class __$ClinicDoctorLinkResponseCopyWithImpl<$Res>
    implements _$ClinicDoctorLinkResponseCopyWith<$Res> {
  __$ClinicDoctorLinkResponseCopyWithImpl(this._self, this._then);

  final _ClinicDoctorLinkResponse _self;
  final $Res Function(_ClinicDoctorLinkResponse) _then;

/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? linkId = freezed,Object? clinic = null,Object? doctor = null,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isActive = freezed,}) {
  return _then(_ClinicDoctorLinkResponse(
linkId: freezed == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String?,clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfo,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorFullInfo,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<$Res> get clinic {
  
  return $ClinicInfoCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}/// Create a copy of ClinicDoctorLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorFullInfoCopyWith<$Res> get doctor {
  
  return $DoctorFullInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// @nodoc
mixin _$DoctorFullInfo {

@JsonKey(name: "doctor_id") String? get doctorId;@JsonKey(name: "doctor_code") String get doctorCode; String get email;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName; String get specialization; String get username;@JsonKey(name: "license_number") String? get licenseNumber;@JsonKey(name: "consultation_fee") double? get consultationFee;@JsonKey(name: "follow_up_fee") double? get followUpFee;@JsonKey(name: "follow_up_days") int? get followUpDays;@JsonKey(name: "profile_image") String? get profileImage;
/// Create a copy of DoctorFullInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorFullInfoCopyWith<DoctorFullInfo> get copyWith => _$DoctorFullInfoCopyWithImpl<DoctorFullInfo>(this as DoctorFullInfo, _$identity);

  /// Serializes this DoctorFullInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFullInfo&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.username, username) || other.username == username)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,doctorCode,email,firstName,lastName,specialization,username,licenseNumber,consultationFee,followUpFee,followUpDays,profileImage);

@override
String toString() {
  return 'DoctorFullInfo(doctorId: $doctorId, doctorCode: $doctorCode, email: $email, firstName: $firstName, lastName: $lastName, specialization: $specialization, username: $username, licenseNumber: $licenseNumber, consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class $DoctorFullInfoCopyWith<$Res>  {
  factory $DoctorFullInfoCopyWith(DoctorFullInfo value, $Res Function(DoctorFullInfo) _then) = _$DoctorFullInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "doctor_id") String? doctorId,@JsonKey(name: "doctor_code") String doctorCode, String email,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String specialization, String username,@JsonKey(name: "license_number") String? licenseNumber,@JsonKey(name: "consultation_fee") double? consultationFee,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class _$DoctorFullInfoCopyWithImpl<$Res>
    implements $DoctorFullInfoCopyWith<$Res> {
  _$DoctorFullInfoCopyWithImpl(this._self, this._then);

  final DoctorFullInfo _self;
  final $Res Function(DoctorFullInfo) _then;

/// Create a copy of DoctorFullInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = freezed,Object? doctorCode = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? specialization = null,Object? username = null,Object? licenseNumber = freezed,Object? consultationFee = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? profileImage = freezed,}) {
  return _then(_self.copyWith(
doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorFullInfo].
extension DoctorFullInfoPatterns on DoctorFullInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorFullInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorFullInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorFullInfo value)  $default,){
final _that = this;
switch (_that) {
case _DoctorFullInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorFullInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorFullInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "doctor_id")  String? doctorId, @JsonKey(name: "doctor_code")  String doctorCode,  String email, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String specialization,  String username, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays, @JsonKey(name: "profile_image")  String? profileImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorFullInfo() when $default != null:
return $default(_that.doctorId,_that.doctorCode,_that.email,_that.firstName,_that.lastName,_that.specialization,_that.username,_that.licenseNumber,_that.consultationFee,_that.followUpFee,_that.followUpDays,_that.profileImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "doctor_id")  String? doctorId, @JsonKey(name: "doctor_code")  String doctorCode,  String email, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String specialization,  String username, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays, @JsonKey(name: "profile_image")  String? profileImage)  $default,) {final _that = this;
switch (_that) {
case _DoctorFullInfo():
return $default(_that.doctorId,_that.doctorCode,_that.email,_that.firstName,_that.lastName,_that.specialization,_that.username,_that.licenseNumber,_that.consultationFee,_that.followUpFee,_that.followUpDays,_that.profileImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "doctor_id")  String? doctorId, @JsonKey(name: "doctor_code")  String doctorCode,  String email, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String specialization,  String username, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays, @JsonKey(name: "profile_image")  String? profileImage)?  $default,) {final _that = this;
switch (_that) {
case _DoctorFullInfo() when $default != null:
return $default(_that.doctorId,_that.doctorCode,_that.email,_that.firstName,_that.lastName,_that.specialization,_that.username,_that.licenseNumber,_that.consultationFee,_that.followUpFee,_that.followUpDays,_that.profileImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorFullInfo implements DoctorFullInfo {
  const _DoctorFullInfo({@JsonKey(name: "doctor_id") this.doctorId, @JsonKey(name: "doctor_code") required this.doctorCode, required this.email, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, required this.specialization, required this.username, @JsonKey(name: "license_number") this.licenseNumber, @JsonKey(name: "consultation_fee") this.consultationFee, @JsonKey(name: "follow_up_fee") this.followUpFee, @JsonKey(name: "follow_up_days") this.followUpDays, @JsonKey(name: "profile_image") this.profileImage});
  factory _DoctorFullInfo.fromJson(Map<String, dynamic> json) => _$DoctorFullInfoFromJson(json);

@override@JsonKey(name: "doctor_id") final  String? doctorId;
@override@JsonKey(name: "doctor_code") final  String doctorCode;
@override final  String email;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override final  String specialization;
@override final  String username;
@override@JsonKey(name: "license_number") final  String? licenseNumber;
@override@JsonKey(name: "consultation_fee") final  double? consultationFee;
@override@JsonKey(name: "follow_up_fee") final  double? followUpFee;
@override@JsonKey(name: "follow_up_days") final  int? followUpDays;
@override@JsonKey(name: "profile_image") final  String? profileImage;

/// Create a copy of DoctorFullInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorFullInfoCopyWith<_DoctorFullInfo> get copyWith => __$DoctorFullInfoCopyWithImpl<_DoctorFullInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorFullInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorFullInfo&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.username, username) || other.username == username)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,doctorCode,email,firstName,lastName,specialization,username,licenseNumber,consultationFee,followUpFee,followUpDays,profileImage);

@override
String toString() {
  return 'DoctorFullInfo(doctorId: $doctorId, doctorCode: $doctorCode, email: $email, firstName: $firstName, lastName: $lastName, specialization: $specialization, username: $username, licenseNumber: $licenseNumber, consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class _$DoctorFullInfoCopyWith<$Res> implements $DoctorFullInfoCopyWith<$Res> {
  factory _$DoctorFullInfoCopyWith(_DoctorFullInfo value, $Res Function(_DoctorFullInfo) _then) = __$DoctorFullInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "doctor_id") String? doctorId,@JsonKey(name: "doctor_code") String doctorCode, String email,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String specialization, String username,@JsonKey(name: "license_number") String? licenseNumber,@JsonKey(name: "consultation_fee") double? consultationFee,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class __$DoctorFullInfoCopyWithImpl<$Res>
    implements _$DoctorFullInfoCopyWith<$Res> {
  __$DoctorFullInfoCopyWithImpl(this._self, this._then);

  final _DoctorFullInfo _self;
  final $Res Function(_DoctorFullInfo) _then;

/// Create a copy of DoctorFullInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = freezed,Object? doctorCode = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? specialization = null,Object? username = null,Object? licenseNumber = freezed,Object? consultationFee = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? profileImage = freezed,}) {
  return _then(_DoctorFullInfo(
doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateClinicDoctorLinkWithFees {

@JsonKey(name: "clinic_id") String get clinicId;@JsonKey(name: "doctor_id") String get doctorId;@JsonKey(name: "consultation_fee_offline") double get consultationFeeOffline;@JsonKey(name: "consultation_fee_online") double get consultationFeeOnline;@JsonKey(name: "follow_up_fee") double get followUpFee;@JsonKey(name: "follow_up_days") int get followUpDays; String? get notes;
/// Create a copy of CreateClinicDoctorLinkWithFees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClinicDoctorLinkWithFeesCopyWith<CreateClinicDoctorLinkWithFees> get copyWith => _$CreateClinicDoctorLinkWithFeesCopyWithImpl<CreateClinicDoctorLinkWithFees>(this as CreateClinicDoctorLinkWithFees, _$identity);

  /// Serializes this CreateClinicDoctorLinkWithFees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClinicDoctorLinkWithFees&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,doctorId,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'CreateClinicDoctorLinkWithFees(clinicId: $clinicId, doctorId: $doctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateClinicDoctorLinkWithFeesCopyWith<$Res>  {
  factory $CreateClinicDoctorLinkWithFeesCopyWith(CreateClinicDoctorLinkWithFees value, $Res Function(CreateClinicDoctorLinkWithFees) _then) = _$CreateClinicDoctorLinkWithFeesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "clinic_id") String clinicId,@JsonKey(name: "doctor_id") String doctorId,@JsonKey(name: "consultation_fee_offline") double consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double consultationFeeOnline,@JsonKey(name: "follow_up_fee") double followUpFee,@JsonKey(name: "follow_up_days") int followUpDays, String? notes
});




}
/// @nodoc
class _$CreateClinicDoctorLinkWithFeesCopyWithImpl<$Res>
    implements $CreateClinicDoctorLinkWithFeesCopyWith<$Res> {
  _$CreateClinicDoctorLinkWithFeesCopyWithImpl(this._self, this._then);

  final CreateClinicDoctorLinkWithFees _self;
  final $Res Function(CreateClinicDoctorLinkWithFees) _then;

/// Create a copy of CreateClinicDoctorLinkWithFees
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? doctorId = null,Object? consultationFeeOffline = null,Object? consultationFeeOnline = null,Object? followUpFee = null,Object? followUpDays = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,consultationFeeOffline: null == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double,consultationFeeOnline: null == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double,followUpFee: null == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double,followUpDays: null == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClinicDoctorLinkWithFees].
extension CreateClinicDoctorLinkWithFeesPatterns on CreateClinicDoctorLinkWithFees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClinicDoctorLinkWithFees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkWithFees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClinicDoctorLinkWithFees value)  $default,){
final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkWithFees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClinicDoctorLinkWithFees value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkWithFees() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_id")  String clinicId, @JsonKey(name: "doctor_id")  String doctorId, @JsonKey(name: "consultation_fee_offline")  double consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double followUpFee, @JsonKey(name: "follow_up_days")  int followUpDays,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkWithFees() when $default != null:
return $default(_that.clinicId,_that.doctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_id")  String clinicId, @JsonKey(name: "doctor_id")  String doctorId, @JsonKey(name: "consultation_fee_offline")  double consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double followUpFee, @JsonKey(name: "follow_up_days")  int followUpDays,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkWithFees():
return $default(_that.clinicId,_that.doctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "clinic_id")  String clinicId, @JsonKey(name: "doctor_id")  String doctorId, @JsonKey(name: "consultation_fee_offline")  double consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double followUpFee, @JsonKey(name: "follow_up_days")  int followUpDays,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateClinicDoctorLinkWithFees() when $default != null:
return $default(_that.clinicId,_that.doctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateClinicDoctorLinkWithFees implements CreateClinicDoctorLinkWithFees {
  const _CreateClinicDoctorLinkWithFees({@JsonKey(name: "clinic_id") required this.clinicId, @JsonKey(name: "doctor_id") required this.doctorId, @JsonKey(name: "consultation_fee_offline") required this.consultationFeeOffline, @JsonKey(name: "consultation_fee_online") required this.consultationFeeOnline, @JsonKey(name: "follow_up_fee") required this.followUpFee, @JsonKey(name: "follow_up_days") required this.followUpDays, this.notes});
  factory _CreateClinicDoctorLinkWithFees.fromJson(Map<String, dynamic> json) => _$CreateClinicDoctorLinkWithFeesFromJson(json);

@override@JsonKey(name: "clinic_id") final  String clinicId;
@override@JsonKey(name: "doctor_id") final  String doctorId;
@override@JsonKey(name: "consultation_fee_offline") final  double consultationFeeOffline;
@override@JsonKey(name: "consultation_fee_online") final  double consultationFeeOnline;
@override@JsonKey(name: "follow_up_fee") final  double followUpFee;
@override@JsonKey(name: "follow_up_days") final  int followUpDays;
@override final  String? notes;

/// Create a copy of CreateClinicDoctorLinkWithFees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClinicDoctorLinkWithFeesCopyWith<_CreateClinicDoctorLinkWithFees> get copyWith => __$CreateClinicDoctorLinkWithFeesCopyWithImpl<_CreateClinicDoctorLinkWithFees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClinicDoctorLinkWithFeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClinicDoctorLinkWithFees&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,doctorId,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'CreateClinicDoctorLinkWithFees(clinicId: $clinicId, doctorId: $doctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateClinicDoctorLinkWithFeesCopyWith<$Res> implements $CreateClinicDoctorLinkWithFeesCopyWith<$Res> {
  factory _$CreateClinicDoctorLinkWithFeesCopyWith(_CreateClinicDoctorLinkWithFees value, $Res Function(_CreateClinicDoctorLinkWithFees) _then) = __$CreateClinicDoctorLinkWithFeesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "clinic_id") String clinicId,@JsonKey(name: "doctor_id") String doctorId,@JsonKey(name: "consultation_fee_offline") double consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double consultationFeeOnline,@JsonKey(name: "follow_up_fee") double followUpFee,@JsonKey(name: "follow_up_days") int followUpDays, String? notes
});




}
/// @nodoc
class __$CreateClinicDoctorLinkWithFeesCopyWithImpl<$Res>
    implements _$CreateClinicDoctorLinkWithFeesCopyWith<$Res> {
  __$CreateClinicDoctorLinkWithFeesCopyWithImpl(this._self, this._then);

  final _CreateClinicDoctorLinkWithFees _self;
  final $Res Function(_CreateClinicDoctorLinkWithFees) _then;

/// Create a copy of CreateClinicDoctorLinkWithFees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? doctorId = null,Object? consultationFeeOffline = null,Object? consultationFeeOnline = null,Object? followUpFee = null,Object? followUpDays = null,Object? notes = freezed,}) {
  return _then(_CreateClinicDoctorLinkWithFees(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,consultationFeeOffline: null == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double,consultationFeeOnline: null == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double,followUpFee: null == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double,followUpDays: null == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateClinicDoctorLinkFees {

@JsonKey(name: "consultation_fee_offline") double? get consultationFeeOffline;@JsonKey(name: "consultation_fee_online") double? get consultationFeeOnline;@JsonKey(name: "follow_up_fee") double? get followUpFee;@JsonKey(name: "follow_up_days") int? get followUpDays; String? get notes;
/// Create a copy of UpdateClinicDoctorLinkFees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClinicDoctorLinkFeesCopyWith<UpdateClinicDoctorLinkFees> get copyWith => _$UpdateClinicDoctorLinkFeesCopyWithImpl<UpdateClinicDoctorLinkFees>(this as UpdateClinicDoctorLinkFees, _$identity);

  /// Serializes this UpdateClinicDoctorLinkFees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClinicDoctorLinkFees&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'UpdateClinicDoctorLinkFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateClinicDoctorLinkFeesCopyWith<$Res>  {
  factory $UpdateClinicDoctorLinkFeesCopyWith(UpdateClinicDoctorLinkFees value, $Res Function(UpdateClinicDoctorLinkFees) _then) = _$UpdateClinicDoctorLinkFeesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays, String? notes
});




}
/// @nodoc
class _$UpdateClinicDoctorLinkFeesCopyWithImpl<$Res>
    implements $UpdateClinicDoctorLinkFeesCopyWith<$Res> {
  _$UpdateClinicDoctorLinkFeesCopyWithImpl(this._self, this._then);

  final UpdateClinicDoctorLinkFees _self;
  final $Res Function(UpdateClinicDoctorLinkFees) _then;

/// Create a copy of UpdateClinicDoctorLinkFees
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateClinicDoctorLinkFees].
extension UpdateClinicDoctorLinkFeesPatterns on UpdateClinicDoctorLinkFees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateClinicDoctorLinkFees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateClinicDoctorLinkFees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateClinicDoctorLinkFees value)  $default,){
final _that = this;
switch (_that) {
case _UpdateClinicDoctorLinkFees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateClinicDoctorLinkFees value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateClinicDoctorLinkFees() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "consultation_fee_offline")  double? consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double? consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateClinicDoctorLinkFees() when $default != null:
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "consultation_fee_offline")  double? consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double? consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _UpdateClinicDoctorLinkFees():
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "consultation_fee_offline")  double? consultationFeeOffline, @JsonKey(name: "consultation_fee_online")  double? consultationFeeOnline, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _UpdateClinicDoctorLinkFees() when $default != null:
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateClinicDoctorLinkFees implements UpdateClinicDoctorLinkFees {
  const _UpdateClinicDoctorLinkFees({@JsonKey(name: "consultation_fee_offline") this.consultationFeeOffline, @JsonKey(name: "consultation_fee_online") this.consultationFeeOnline, @JsonKey(name: "follow_up_fee") this.followUpFee, @JsonKey(name: "follow_up_days") this.followUpDays, this.notes});
  factory _UpdateClinicDoctorLinkFees.fromJson(Map<String, dynamic> json) => _$UpdateClinicDoctorLinkFeesFromJson(json);

@override@JsonKey(name: "consultation_fee_offline") final  double? consultationFeeOffline;
@override@JsonKey(name: "consultation_fee_online") final  double? consultationFeeOnline;
@override@JsonKey(name: "follow_up_fee") final  double? followUpFee;
@override@JsonKey(name: "follow_up_days") final  int? followUpDays;
@override final  String? notes;

/// Create a copy of UpdateClinicDoctorLinkFees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateClinicDoctorLinkFeesCopyWith<_UpdateClinicDoctorLinkFees> get copyWith => __$UpdateClinicDoctorLinkFeesCopyWithImpl<_UpdateClinicDoctorLinkFees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateClinicDoctorLinkFeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateClinicDoctorLinkFees&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'UpdateClinicDoctorLinkFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$UpdateClinicDoctorLinkFeesCopyWith<$Res> implements $UpdateClinicDoctorLinkFeesCopyWith<$Res> {
  factory _$UpdateClinicDoctorLinkFeesCopyWith(_UpdateClinicDoctorLinkFees value, $Res Function(_UpdateClinicDoctorLinkFees) _then) = __$UpdateClinicDoctorLinkFeesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays, String? notes
});




}
/// @nodoc
class __$UpdateClinicDoctorLinkFeesCopyWithImpl<$Res>
    implements _$UpdateClinicDoctorLinkFeesCopyWith<$Res> {
  __$UpdateClinicDoctorLinkFeesCopyWithImpl(this._self, this._then);

  final _UpdateClinicDoctorLinkFees _self;
  final $Res Function(_UpdateClinicDoctorLinkFees) _then;

/// Create a copy of UpdateClinicDoctorLinkFees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_UpdateClinicDoctorLinkFees(
consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
