// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorModel {

@JsonKey(name: "id") String? get drid;/// Existing user option
@JsonKey(name: "user_id") String? get userId;/// Create new user option
@JsonKey(name: "first_name") String? get firstName;@JsonKey(name: "last_name") String? get lastName;@JsonKey(name: "email") String? get email;@JsonKey(name: "username") String? get username;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "password") String? get password;/// Doctor profile
@JsonKey(name: "doctor_code") String? get doctorCode;@JsonKey(name: "specialization") String? get specialization;@JsonKey(name: "license_number") String? get licenseNumber;@JsonKey(name: "consultation_fee") double? get consultationFee;@JsonKey(name: "follow_up_fee") double? get followUpFee;@JsonKey(name: "follow_up_days") int? get followUpDays;@JsonKey(name: "profile_image") String? get profileImage;@JsonKey(name: "qualification") String? get qualification;@JsonKey(name: "experience_years") int? get experienceYears;@JsonKey(name: "bio") String? get bio;
/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorModelCopyWith<DoctorModel> get copyWith => _$DoctorModelCopyWithImpl<DoctorModel>(this as DoctorModel, _$identity);

  /// Serializes this DoctorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorModel&&(identical(other.drid, drid) || other.drid == drid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drid,userId,firstName,lastName,email,username,phone,password,doctorCode,specialization,licenseNumber,consultationFee,followUpFee,followUpDays,profileImage,qualification,experienceYears,bio);

@override
String toString() {
  return 'DoctorModel(drid: $drid, userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, password: $password, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays, profileImage: $profileImage, qualification: $qualification, experienceYears: $experienceYears, bio: $bio)';
}


}

/// @nodoc
abstract mixin class $DoctorModelCopyWith<$Res>  {
  factory $DoctorModelCopyWith(DoctorModel value, $Res Function(DoctorModel) _then) = _$DoctorModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? drid,@JsonKey(name: "user_id") String? userId,@JsonKey(name: "first_name") String? firstName,@JsonKey(name: "last_name") String? lastName,@JsonKey(name: "email") String? email,@JsonKey(name: "username") String? username,@JsonKey(name: "phone") String? phone,@JsonKey(name: "password") String? password,@JsonKey(name: "doctor_code") String? doctorCode,@JsonKey(name: "specialization") String? specialization,@JsonKey(name: "license_number") String? licenseNumber,@JsonKey(name: "consultation_fee") double? consultationFee,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "qualification") String? qualification,@JsonKey(name: "experience_years") int? experienceYears,@JsonKey(name: "bio") String? bio
});




}
/// @nodoc
class _$DoctorModelCopyWithImpl<$Res>
    implements $DoctorModelCopyWith<$Res> {
  _$DoctorModelCopyWithImpl(this._self, this._then);

  final DoctorModel _self;
  final $Res Function(DoctorModel) _then;

/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drid = freezed,Object? userId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? username = freezed,Object? phone = freezed,Object? password = freezed,Object? doctorCode = freezed,Object? specialization = freezed,Object? licenseNumber = freezed,Object? consultationFee = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? profileImage = freezed,Object? qualification = freezed,Object? experienceYears = freezed,Object? bio = freezed,}) {
  return _then(_self.copyWith(
drid: freezed == drid ? _self.drid : drid // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: freezed == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorModel].
extension DoctorModelPatterns on DoctorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorModel value)  $default,){
final _that = this;
switch (_that) {
case _DoctorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorModel value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? drid, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "email")  String? email, @JsonKey(name: "username")  String? username, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "password")  String? password, @JsonKey(name: "doctor_code")  String? doctorCode, @JsonKey(name: "specialization")  String? specialization, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "qualification")  String? qualification, @JsonKey(name: "experience_years")  int? experienceYears, @JsonKey(name: "bio")  String? bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
return $default(_that.drid,_that.userId,_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.password,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.consultationFee,_that.followUpFee,_that.followUpDays,_that.profileImage,_that.qualification,_that.experienceYears,_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? drid, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "email")  String? email, @JsonKey(name: "username")  String? username, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "password")  String? password, @JsonKey(name: "doctor_code")  String? doctorCode, @JsonKey(name: "specialization")  String? specialization, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "qualification")  String? qualification, @JsonKey(name: "experience_years")  int? experienceYears, @JsonKey(name: "bio")  String? bio)  $default,) {final _that = this;
switch (_that) {
case _DoctorModel():
return $default(_that.drid,_that.userId,_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.password,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.consultationFee,_that.followUpFee,_that.followUpDays,_that.profileImage,_that.qualification,_that.experienceYears,_that.bio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? drid, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "email")  String? email, @JsonKey(name: "username")  String? username, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "password")  String? password, @JsonKey(name: "doctor_code")  String? doctorCode, @JsonKey(name: "specialization")  String? specialization, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "qualification")  String? qualification, @JsonKey(name: "experience_years")  int? experienceYears, @JsonKey(name: "bio")  String? bio)?  $default,) {final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
return $default(_that.drid,_that.userId,_that.firstName,_that.lastName,_that.email,_that.username,_that.phone,_that.password,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.consultationFee,_that.followUpFee,_that.followUpDays,_that.profileImage,_that.qualification,_that.experienceYears,_that.bio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorModel implements DoctorModel {
  const _DoctorModel({@JsonKey(name: "id") this.drid, @JsonKey(name: "user_id") this.userId, @JsonKey(name: "first_name") this.firstName, @JsonKey(name: "last_name") this.lastName, @JsonKey(name: "email") this.email, @JsonKey(name: "username") this.username, @JsonKey(name: "phone") this.phone, @JsonKey(name: "password") this.password, @JsonKey(name: "doctor_code") this.doctorCode, @JsonKey(name: "specialization") this.specialization, @JsonKey(name: "license_number") this.licenseNumber, @JsonKey(name: "consultation_fee") this.consultationFee, @JsonKey(name: "follow_up_fee") this.followUpFee, @JsonKey(name: "follow_up_days") this.followUpDays, @JsonKey(name: "profile_image") this.profileImage, @JsonKey(name: "qualification") this.qualification, @JsonKey(name: "experience_years") this.experienceYears, @JsonKey(name: "bio") this.bio});
  factory _DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

@override@JsonKey(name: "id") final  String? drid;
/// Existing user option
@override@JsonKey(name: "user_id") final  String? userId;
/// Create new user option
@override@JsonKey(name: "first_name") final  String? firstName;
@override@JsonKey(name: "last_name") final  String? lastName;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "username") final  String? username;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "password") final  String? password;
/// Doctor profile
@override@JsonKey(name: "doctor_code") final  String? doctorCode;
@override@JsonKey(name: "specialization") final  String? specialization;
@override@JsonKey(name: "license_number") final  String? licenseNumber;
@override@JsonKey(name: "consultation_fee") final  double? consultationFee;
@override@JsonKey(name: "follow_up_fee") final  double? followUpFee;
@override@JsonKey(name: "follow_up_days") final  int? followUpDays;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override@JsonKey(name: "qualification") final  String? qualification;
@override@JsonKey(name: "experience_years") final  int? experienceYears;
@override@JsonKey(name: "bio") final  String? bio;

/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorModelCopyWith<_DoctorModel> get copyWith => __$DoctorModelCopyWithImpl<_DoctorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorModel&&(identical(other.drid, drid) || other.drid == drid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drid,userId,firstName,lastName,email,username,phone,password,doctorCode,specialization,licenseNumber,consultationFee,followUpFee,followUpDays,profileImage,qualification,experienceYears,bio);

@override
String toString() {
  return 'DoctorModel(drid: $drid, userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, password: $password, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays, profileImage: $profileImage, qualification: $qualification, experienceYears: $experienceYears, bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$DoctorModelCopyWith<$Res> implements $DoctorModelCopyWith<$Res> {
  factory _$DoctorModelCopyWith(_DoctorModel value, $Res Function(_DoctorModel) _then) = __$DoctorModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? drid,@JsonKey(name: "user_id") String? userId,@JsonKey(name: "first_name") String? firstName,@JsonKey(name: "last_name") String? lastName,@JsonKey(name: "email") String? email,@JsonKey(name: "username") String? username,@JsonKey(name: "phone") String? phone,@JsonKey(name: "password") String? password,@JsonKey(name: "doctor_code") String? doctorCode,@JsonKey(name: "specialization") String? specialization,@JsonKey(name: "license_number") String? licenseNumber,@JsonKey(name: "consultation_fee") double? consultationFee,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "qualification") String? qualification,@JsonKey(name: "experience_years") int? experienceYears,@JsonKey(name: "bio") String? bio
});




}
/// @nodoc
class __$DoctorModelCopyWithImpl<$Res>
    implements _$DoctorModelCopyWith<$Res> {
  __$DoctorModelCopyWithImpl(this._self, this._then);

  final _DoctorModel _self;
  final $Res Function(_DoctorModel) _then;

/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drid = freezed,Object? userId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? username = freezed,Object? phone = freezed,Object? password = freezed,Object? doctorCode = freezed,Object? specialization = freezed,Object? licenseNumber = freezed,Object? consultationFee = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? profileImage = freezed,Object? qualification = freezed,Object? experienceYears = freezed,Object? bio = freezed,}) {
  return _then(_DoctorModel(
drid: freezed == drid ? _self.drid : drid // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: freezed == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
