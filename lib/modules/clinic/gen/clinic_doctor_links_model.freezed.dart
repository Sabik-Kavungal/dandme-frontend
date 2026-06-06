// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_doctor_links_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClinicDoctorLinksResponse {

 DoctorInfo get doctor; List<ClinicLink> get clinics;@JsonKey(name: 'total_clinics') int get totalClinics;
/// Create a copy of ClinicDoctorLinksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicDoctorLinksResponseCopyWith<ClinicDoctorLinksResponse> get copyWith => _$ClinicDoctorLinksResponseCopyWithImpl<ClinicDoctorLinksResponse>(this as ClinicDoctorLinksResponse, _$identity);

  /// Serializes this ClinicDoctorLinksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicDoctorLinksResponse&&(identical(other.doctor, doctor) || other.doctor == doctor)&&const DeepCollectionEquality().equals(other.clinics, clinics)&&(identical(other.totalClinics, totalClinics) || other.totalClinics == totalClinics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctor,const DeepCollectionEquality().hash(clinics),totalClinics);

@override
String toString() {
  return 'ClinicDoctorLinksResponse(doctor: $doctor, clinics: $clinics, totalClinics: $totalClinics)';
}


}

/// @nodoc
abstract mixin class $ClinicDoctorLinksResponseCopyWith<$Res>  {
  factory $ClinicDoctorLinksResponseCopyWith(ClinicDoctorLinksResponse value, $Res Function(ClinicDoctorLinksResponse) _then) = _$ClinicDoctorLinksResponseCopyWithImpl;
@useResult
$Res call({
 DoctorInfo doctor, List<ClinicLink> clinics,@JsonKey(name: 'total_clinics') int totalClinics
});


$DoctorInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class _$ClinicDoctorLinksResponseCopyWithImpl<$Res>
    implements $ClinicDoctorLinksResponseCopyWith<$Res> {
  _$ClinicDoctorLinksResponseCopyWithImpl(this._self, this._then);

  final ClinicDoctorLinksResponse _self;
  final $Res Function(ClinicDoctorLinksResponse) _then;

/// Create a copy of ClinicDoctorLinksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctor = null,Object? clinics = null,Object? totalClinics = null,}) {
  return _then(_self.copyWith(
doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorInfo,clinics: null == clinics ? _self.clinics : clinics // ignore: cast_nullable_to_non_nullable
as List<ClinicLink>,totalClinics: null == totalClinics ? _self.totalClinics : totalClinics // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ClinicDoctorLinksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<$Res> get doctor {
  
  return $DoctorInfoCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClinicDoctorLinksResponse].
extension ClinicDoctorLinksResponsePatterns on ClinicDoctorLinksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicDoctorLinksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicDoctorLinksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicDoctorLinksResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorLinksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicDoctorLinksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorLinksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DoctorInfo doctor,  List<ClinicLink> clinics, @JsonKey(name: 'total_clinics')  int totalClinics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicDoctorLinksResponse() when $default != null:
return $default(_that.doctor,_that.clinics,_that.totalClinics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DoctorInfo doctor,  List<ClinicLink> clinics, @JsonKey(name: 'total_clinics')  int totalClinics)  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorLinksResponse():
return $default(_that.doctor,_that.clinics,_that.totalClinics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DoctorInfo doctor,  List<ClinicLink> clinics, @JsonKey(name: 'total_clinics')  int totalClinics)?  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorLinksResponse() when $default != null:
return $default(_that.doctor,_that.clinics,_that.totalClinics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicDoctorLinksResponse extends ClinicDoctorLinksResponse {
  const _ClinicDoctorLinksResponse({required this.doctor, required final  List<ClinicLink> clinics, @JsonKey(name: 'total_clinics') required this.totalClinics}): _clinics = clinics,super._();
  factory _ClinicDoctorLinksResponse.fromJson(Map<String, dynamic> json) => _$ClinicDoctorLinksResponseFromJson(json);

@override final  DoctorInfo doctor;
 final  List<ClinicLink> _clinics;
@override List<ClinicLink> get clinics {
  if (_clinics is EqualUnmodifiableListView) return _clinics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clinics);
}

@override@JsonKey(name: 'total_clinics') final  int totalClinics;

/// Create a copy of ClinicDoctorLinksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicDoctorLinksResponseCopyWith<_ClinicDoctorLinksResponse> get copyWith => __$ClinicDoctorLinksResponseCopyWithImpl<_ClinicDoctorLinksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicDoctorLinksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicDoctorLinksResponse&&(identical(other.doctor, doctor) || other.doctor == doctor)&&const DeepCollectionEquality().equals(other._clinics, _clinics)&&(identical(other.totalClinics, totalClinics) || other.totalClinics == totalClinics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctor,const DeepCollectionEquality().hash(_clinics),totalClinics);

@override
String toString() {
  return 'ClinicDoctorLinksResponse(doctor: $doctor, clinics: $clinics, totalClinics: $totalClinics)';
}


}

/// @nodoc
abstract mixin class _$ClinicDoctorLinksResponseCopyWith<$Res> implements $ClinicDoctorLinksResponseCopyWith<$Res> {
  factory _$ClinicDoctorLinksResponseCopyWith(_ClinicDoctorLinksResponse value, $Res Function(_ClinicDoctorLinksResponse) _then) = __$ClinicDoctorLinksResponseCopyWithImpl;
@override @useResult
$Res call({
 DoctorInfo doctor, List<ClinicLink> clinics,@JsonKey(name: 'total_clinics') int totalClinics
});


@override $DoctorInfoCopyWith<$Res> get doctor;

}
/// @nodoc
class __$ClinicDoctorLinksResponseCopyWithImpl<$Res>
    implements _$ClinicDoctorLinksResponseCopyWith<$Res> {
  __$ClinicDoctorLinksResponseCopyWithImpl(this._self, this._then);

  final _ClinicDoctorLinksResponse _self;
  final $Res Function(_ClinicDoctorLinksResponse) _then;

/// Create a copy of ClinicDoctorLinksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctor = null,Object? clinics = null,Object? totalClinics = null,}) {
  return _then(_ClinicDoctorLinksResponse(
doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorInfo,clinics: null == clinics ? _self._clinics : clinics // ignore: cast_nullable_to_non_nullable
as List<ClinicLink>,totalClinics: null == totalClinics ? _self.totalClinics : totalClinics // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ClinicDoctorLinksResponse
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
mixin _$DoctorInfo {

@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_code') String? get doctorCode; String? get specialization;@JsonKey(name: 'license_number') String? get licenseNumber;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String? get email; String? get phone;@JsonKey(name: 'profile_image') String? get profileImage; String? get qualification;@JsonKey(name: 'experience_years') int? get experienceYears; String? get experience; String? get bio;
/// Create a copy of DoctorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorInfoCopyWith<DoctorInfo> get copyWith => _$DoctorInfoCopyWithImpl<DoctorInfo>(this as DoctorInfo, _$identity);

  /// Serializes this DoctorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorInfo&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,doctorCode,specialization,licenseNumber,firstName,lastName,email,phone,profileImage,qualification,experienceYears,experience,bio);

@override
String toString() {
  return 'DoctorInfo(doctorId: $doctorId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, profileImage: $profileImage, qualification: $qualification, experienceYears: $experienceYears, experience: $experience, bio: $bio)';
}


}

/// @nodoc
abstract mixin class $DoctorInfoCopyWith<$Res>  {
  factory $DoctorInfoCopyWith(DoctorInfo value, $Res Function(DoctorInfo) _then) = _$DoctorInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_code') String? doctorCode, String? specialization,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? email, String? phone,@JsonKey(name: 'profile_image') String? profileImage, String? qualification,@JsonKey(name: 'experience_years') int? experienceYears, String? experience, String? bio
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
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? doctorCode = freezed,Object? specialization = freezed,Object? licenseNumber = freezed,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,Object? profileImage = freezed,Object? qualification = freezed,Object? experienceYears = freezed,Object? experience = freezed,Object? bio = freezed,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: freezed == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_code')  String? doctorCode,  String? specialization, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? email,  String? phone, @JsonKey(name: 'profile_image')  String? profileImage,  String? qualification, @JsonKey(name: 'experience_years')  int? experienceYears,  String? experience,  String? bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorInfo() when $default != null:
return $default(_that.doctorId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.firstName,_that.lastName,_that.email,_that.phone,_that.profileImage,_that.qualification,_that.experienceYears,_that.experience,_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_code')  String? doctorCode,  String? specialization, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? email,  String? phone, @JsonKey(name: 'profile_image')  String? profileImage,  String? qualification, @JsonKey(name: 'experience_years')  int? experienceYears,  String? experience,  String? bio)  $default,) {final _that = this;
switch (_that) {
case _DoctorInfo():
return $default(_that.doctorId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.firstName,_that.lastName,_that.email,_that.phone,_that.profileImage,_that.qualification,_that.experienceYears,_that.experience,_that.bio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_code')  String? doctorCode,  String? specialization, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? email,  String? phone, @JsonKey(name: 'profile_image')  String? profileImage,  String? qualification, @JsonKey(name: 'experience_years')  int? experienceYears,  String? experience,  String? bio)?  $default,) {final _that = this;
switch (_that) {
case _DoctorInfo() when $default != null:
return $default(_that.doctorId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.firstName,_that.lastName,_that.email,_that.phone,_that.profileImage,_that.qualification,_that.experienceYears,_that.experience,_that.bio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorInfo implements DoctorInfo {
  const _DoctorInfo({@JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_code') this.doctorCode, this.specialization, @JsonKey(name: 'license_number') this.licenseNumber, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, this.email, this.phone, @JsonKey(name: 'profile_image') this.profileImage, this.qualification, @JsonKey(name: 'experience_years') this.experienceYears, this.experience, this.bio});
  factory _DoctorInfo.fromJson(Map<String, dynamic> json) => _$DoctorInfoFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_code') final  String? doctorCode;
@override final  String? specialization;
@override@JsonKey(name: 'license_number') final  String? licenseNumber;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String? email;
@override final  String? phone;
@override@JsonKey(name: 'profile_image') final  String? profileImage;
@override final  String? qualification;
@override@JsonKey(name: 'experience_years') final  int? experienceYears;
@override final  String? experience;
@override final  String? bio;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorInfo&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,doctorCode,specialization,licenseNumber,firstName,lastName,email,phone,profileImage,qualification,experienceYears,experience,bio);

@override
String toString() {
  return 'DoctorInfo(doctorId: $doctorId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, profileImage: $profileImage, qualification: $qualification, experienceYears: $experienceYears, experience: $experience, bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$DoctorInfoCopyWith<$Res> implements $DoctorInfoCopyWith<$Res> {
  factory _$DoctorInfoCopyWith(_DoctorInfo value, $Res Function(_DoctorInfo) _then) = __$DoctorInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_code') String? doctorCode, String? specialization,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? email, String? phone,@JsonKey(name: 'profile_image') String? profileImage, String? qualification,@JsonKey(name: 'experience_years') int? experienceYears, String? experience, String? bio
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
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? doctorCode = freezed,Object? specialization = freezed,Object? licenseNumber = freezed,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,Object? profileImage = freezed,Object? qualification = freezed,Object? experienceYears = freezed,Object? experience = freezed,Object? bio = freezed,}) {
  return _then(_DoctorInfo(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: freezed == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClinicLink {

@JsonKey(name: 'link_id') String get linkId;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt; ClinicInfo get clinic; ClinicFees get fees; String? get notes;
/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicLinkCopyWith<ClinicLink> get copyWith => _$ClinicLinkCopyWithImpl<ClinicLink>(this as ClinicLink, _$identity);

  /// Serializes this ClinicLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicLink&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.clinic, clinic) || other.clinic == clinic)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,linkId,isActive,createdAt,updatedAt,clinic,fees,notes);

@override
String toString() {
  return 'ClinicLink(linkId: $linkId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, clinic: $clinic, fees: $fees, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ClinicLinkCopyWith<$Res>  {
  factory $ClinicLinkCopyWith(ClinicLink value, $Res Function(ClinicLink) _then) = _$ClinicLinkCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'link_id') String linkId,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, ClinicInfo clinic, ClinicFees fees, String? notes
});


$ClinicInfoCopyWith<$Res> get clinic;$ClinicFeesCopyWith<$Res> get fees;

}
/// @nodoc
class _$ClinicLinkCopyWithImpl<$Res>
    implements $ClinicLinkCopyWith<$Res> {
  _$ClinicLinkCopyWithImpl(this._self, this._then);

  final ClinicLink _self;
  final $Res Function(ClinicLink) _then;

/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? linkId = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,Object? clinic = null,Object? fees = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfo,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as ClinicFees,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<$Res> get clinic {
  
  return $ClinicInfoCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicFeesCopyWith<$Res> get fees {
  
  return $ClinicFeesCopyWith<$Res>(_self.fees, (value) {
    return _then(_self.copyWith(fees: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClinicLink].
extension ClinicLinkPatterns on ClinicLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicLink value)  $default,){
final _that = this;
switch (_that) {
case _ClinicLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicLink value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'link_id')  String linkId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  ClinicInfo clinic,  ClinicFees fees,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicLink() when $default != null:
return $default(_that.linkId,_that.isActive,_that.createdAt,_that.updatedAt,_that.clinic,_that.fees,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'link_id')  String linkId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  ClinicInfo clinic,  ClinicFees fees,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ClinicLink():
return $default(_that.linkId,_that.isActive,_that.createdAt,_that.updatedAt,_that.clinic,_that.fees,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'link_id')  String linkId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  ClinicInfo clinic,  ClinicFees fees,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ClinicLink() when $default != null:
return $default(_that.linkId,_that.isActive,_that.createdAt,_that.updatedAt,_that.clinic,_that.fees,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicLink implements ClinicLink {
  const _ClinicLink({@JsonKey(name: 'link_id') required this.linkId, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.clinic, required this.fees, this.notes});
  factory _ClinicLink.fromJson(Map<String, dynamic> json) => _$ClinicLinkFromJson(json);

@override@JsonKey(name: 'link_id') final  String linkId;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override final  ClinicInfo clinic;
@override final  ClinicFees fees;
@override final  String? notes;

/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicLinkCopyWith<_ClinicLink> get copyWith => __$ClinicLinkCopyWithImpl<_ClinicLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicLink&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.clinic, clinic) || other.clinic == clinic)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,linkId,isActive,createdAt,updatedAt,clinic,fees,notes);

@override
String toString() {
  return 'ClinicLink(linkId: $linkId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, clinic: $clinic, fees: $fees, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ClinicLinkCopyWith<$Res> implements $ClinicLinkCopyWith<$Res> {
  factory _$ClinicLinkCopyWith(_ClinicLink value, $Res Function(_ClinicLink) _then) = __$ClinicLinkCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'link_id') String linkId,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, ClinicInfo clinic, ClinicFees fees, String? notes
});


@override $ClinicInfoCopyWith<$Res> get clinic;@override $ClinicFeesCopyWith<$Res> get fees;

}
/// @nodoc
class __$ClinicLinkCopyWithImpl<$Res>
    implements _$ClinicLinkCopyWith<$Res> {
  __$ClinicLinkCopyWithImpl(this._self, this._then);

  final _ClinicLink _self;
  final $Res Function(_ClinicLink) _then;

/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? linkId = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,Object? clinic = null,Object? fees = null,Object? notes = freezed,}) {
  return _then(_ClinicLink(
linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,clinic: null == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicInfo,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as ClinicFees,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<$Res> get clinic {
  
  return $ClinicInfoCopyWith<$Res>(_self.clinic, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}/// Create a copy of ClinicLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicFeesCopyWith<$Res> get fees {
  
  return $ClinicFeesCopyWith<$Res>(_self.fees, (value) {
    return _then(_self.copyWith(fees: value));
  });
}
}


/// @nodoc
mixin _$ClinicInfo {

@JsonKey(name: 'clinic_id') String get clinicId; String get name;@JsonKey(name: 'clinic_code') String get clinicCode; String? get phone; String? get address; String? get email;
/// Create a copy of ClinicInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicInfoCopyWith<ClinicInfo> get copyWith => _$ClinicInfoCopyWithImpl<ClinicInfo>(this as ClinicInfo, _$identity);

  /// Serializes this ClinicInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicInfo&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,name,clinicCode,phone,address,email);

@override
String toString() {
  return 'ClinicInfo(clinicId: $clinicId, name: $name, clinicCode: $clinicCode, phone: $phone, address: $address, email: $email)';
}


}

/// @nodoc
abstract mixin class $ClinicInfoCopyWith<$Res>  {
  factory $ClinicInfoCopyWith(ClinicInfo value, $Res Function(ClinicInfo) _then) = _$ClinicInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId, String name,@JsonKey(name: 'clinic_code') String clinicCode, String? phone, String? address, String? email
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
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? name = null,Object? clinicCode = null,Object? phone = freezed,Object? address = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicCode: null == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId,  String name, @JsonKey(name: 'clinic_code')  String clinicCode,  String? phone,  String? address,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicInfo() when $default != null:
return $default(_that.clinicId,_that.name,_that.clinicCode,_that.phone,_that.address,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId,  String name, @JsonKey(name: 'clinic_code')  String clinicCode,  String? phone,  String? address,  String? email)  $default,) {final _that = this;
switch (_that) {
case _ClinicInfo():
return $default(_that.clinicId,_that.name,_that.clinicCode,_that.phone,_that.address,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_id')  String clinicId,  String name, @JsonKey(name: 'clinic_code')  String clinicCode,  String? phone,  String? address,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _ClinicInfo() when $default != null:
return $default(_that.clinicId,_that.name,_that.clinicCode,_that.phone,_that.address,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicInfo implements ClinicInfo {
  const _ClinicInfo({@JsonKey(name: 'clinic_id') required this.clinicId, required this.name, @JsonKey(name: 'clinic_code') required this.clinicCode, this.phone, this.address, this.email});
  factory _ClinicInfo.fromJson(Map<String, dynamic> json) => _$ClinicInfoFromJson(json);

@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override final  String name;
@override@JsonKey(name: 'clinic_code') final  String clinicCode;
@override final  String? phone;
@override final  String? address;
@override final  String? email;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicInfo&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,name,clinicCode,phone,address,email);

@override
String toString() {
  return 'ClinicInfo(clinicId: $clinicId, name: $name, clinicCode: $clinicCode, phone: $phone, address: $address, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ClinicInfoCopyWith<$Res> implements $ClinicInfoCopyWith<$Res> {
  factory _$ClinicInfoCopyWith(_ClinicInfo value, $Res Function(_ClinicInfo) _then) = __$ClinicInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId, String name,@JsonKey(name: 'clinic_code') String clinicCode, String? phone, String? address, String? email
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
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? name = null,Object? clinicCode = null,Object? phone = freezed,Object? address = freezed,Object? email = freezed,}) {
  return _then(_ClinicInfo(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicCode: null == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClinicFees {

@JsonKey(name: 'consultation_fee_offline') double? get consultationFeeOffline;@JsonKey(name: 'consultation_fee_online') double? get consultationFeeOnline;@JsonKey(name: 'follow_up_fee') double? get followUpFee;@JsonKey(name: 'follow_up_days') int? get followUpDays;
/// Create a copy of ClinicFees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicFeesCopyWith<ClinicFees> get copyWith => _$ClinicFeesCopyWithImpl<ClinicFees>(this as ClinicFees, _$identity);

  /// Serializes this ClinicFees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicFees&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays);

@override
String toString() {
  return 'ClinicFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays)';
}


}

/// @nodoc
abstract mixin class $ClinicFeesCopyWith<$Res>  {
  factory $ClinicFeesCopyWith(ClinicFees value, $Res Function(ClinicFees) _then) = _$ClinicFeesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays
});




}
/// @nodoc
class _$ClinicFeesCopyWithImpl<$Res>
    implements $ClinicFeesCopyWith<$Res> {
  _$ClinicFeesCopyWithImpl(this._self, this._then);

  final ClinicFees _self;
  final $Res Function(ClinicFees) _then;

/// Create a copy of ClinicFees
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,}) {
  return _then(_self.copyWith(
consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicFees].
extension ClinicFeesPatterns on ClinicFees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicFees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicFees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicFees value)  $default,){
final _that = this;
switch (_that) {
case _ClinicFees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicFees value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicFees() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicFees() when $default != null:
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays)  $default,) {final _that = this;
switch (_that) {
case _ClinicFees():
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays)?  $default,) {final _that = this;
switch (_that) {
case _ClinicFees() when $default != null:
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicFees implements ClinicFees {
  const _ClinicFees({@JsonKey(name: 'consultation_fee_offline') this.consultationFeeOffline, @JsonKey(name: 'consultation_fee_online') this.consultationFeeOnline, @JsonKey(name: 'follow_up_fee') this.followUpFee, @JsonKey(name: 'follow_up_days') this.followUpDays});
  factory _ClinicFees.fromJson(Map<String, dynamic> json) => _$ClinicFeesFromJson(json);

@override@JsonKey(name: 'consultation_fee_offline') final  double? consultationFeeOffline;
@override@JsonKey(name: 'consultation_fee_online') final  double? consultationFeeOnline;
@override@JsonKey(name: 'follow_up_fee') final  double? followUpFee;
@override@JsonKey(name: 'follow_up_days') final  int? followUpDays;

/// Create a copy of ClinicFees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicFeesCopyWith<_ClinicFees> get copyWith => __$ClinicFeesCopyWithImpl<_ClinicFees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicFeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicFees&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays);

@override
String toString() {
  return 'ClinicFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays)';
}


}

/// @nodoc
abstract mixin class _$ClinicFeesCopyWith<$Res> implements $ClinicFeesCopyWith<$Res> {
  factory _$ClinicFeesCopyWith(_ClinicFees value, $Res Function(_ClinicFees) _then) = __$ClinicFeesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays
});




}
/// @nodoc
class __$ClinicFeesCopyWithImpl<$Res>
    implements _$ClinicFeesCopyWith<$Res> {
  __$ClinicFeesCopyWithImpl(this._self, this._then);

  final _ClinicFees _self;
  final $Res Function(_ClinicFees) _then;

/// Create a copy of ClinicFees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,}) {
  return _then(_ClinicFees(
consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
