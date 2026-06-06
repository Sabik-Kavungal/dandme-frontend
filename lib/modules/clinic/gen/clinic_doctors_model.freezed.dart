// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_doctors_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClinicSpecificFees {

@JsonKey(name: "consultation_fee_offline") double? get consultationFeeOffline;@JsonKey(name: "consultation_fee_online") double? get consultationFeeOnline;@JsonKey(name: "follow_up_fee") double? get followUpFee;@JsonKey(name: "follow_up_days") int? get followUpDays; String? get notes;
/// Create a copy of ClinicSpecificFees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicSpecificFeesCopyWith<ClinicSpecificFees> get copyWith => _$ClinicSpecificFeesCopyWithImpl<ClinicSpecificFees>(this as ClinicSpecificFees, _$identity);

  /// Serializes this ClinicSpecificFees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicSpecificFees&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'ClinicSpecificFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ClinicSpecificFeesCopyWith<$Res>  {
  factory $ClinicSpecificFeesCopyWith(ClinicSpecificFees value, $Res Function(ClinicSpecificFees) _then) = _$ClinicSpecificFeesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays, String? notes
});




}
/// @nodoc
class _$ClinicSpecificFeesCopyWithImpl<$Res>
    implements $ClinicSpecificFeesCopyWith<$Res> {
  _$ClinicSpecificFeesCopyWithImpl(this._self, this._then);

  final ClinicSpecificFees _self;
  final $Res Function(ClinicSpecificFees) _then;

/// Create a copy of ClinicSpecificFees
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


/// Adds pattern-matching-related methods to [ClinicSpecificFees].
extension ClinicSpecificFeesPatterns on ClinicSpecificFees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicSpecificFees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicSpecificFees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicSpecificFees value)  $default,){
final _that = this;
switch (_that) {
case _ClinicSpecificFees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicSpecificFees value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicSpecificFees() when $default != null:
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
case _ClinicSpecificFees() when $default != null:
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
case _ClinicSpecificFees():
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
case _ClinicSpecificFees() when $default != null:
return $default(_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicSpecificFees implements ClinicSpecificFees {
  const _ClinicSpecificFees({@JsonKey(name: "consultation_fee_offline") this.consultationFeeOffline, @JsonKey(name: "consultation_fee_online") this.consultationFeeOnline, @JsonKey(name: "follow_up_fee") this.followUpFee, @JsonKey(name: "follow_up_days") this.followUpDays, this.notes});
  factory _ClinicSpecificFees.fromJson(Map<String, dynamic> json) => _$ClinicSpecificFeesFromJson(json);

@override@JsonKey(name: "consultation_fee_offline") final  double? consultationFeeOffline;
@override@JsonKey(name: "consultation_fee_online") final  double? consultationFeeOnline;
@override@JsonKey(name: "follow_up_fee") final  double? followUpFee;
@override@JsonKey(name: "follow_up_days") final  int? followUpDays;
@override final  String? notes;

/// Create a copy of ClinicSpecificFees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicSpecificFeesCopyWith<_ClinicSpecificFees> get copyWith => __$ClinicSpecificFeesCopyWithImpl<_ClinicSpecificFees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicSpecificFeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicSpecificFees&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'ClinicSpecificFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ClinicSpecificFeesCopyWith<$Res> implements $ClinicSpecificFeesCopyWith<$Res> {
  factory _$ClinicSpecificFeesCopyWith(_ClinicSpecificFees value, $Res Function(_ClinicSpecificFees) _then) = __$ClinicSpecificFeesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,@JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays, String? notes
});




}
/// @nodoc
class __$ClinicSpecificFeesCopyWithImpl<$Res>
    implements _$ClinicSpecificFeesCopyWith<$Res> {
  __$ClinicSpecificFeesCopyWithImpl(this._self, this._then);

  final _ClinicSpecificFees _self;
  final $Res Function(_ClinicSpecificFees) _then;

/// Create a copy of ClinicSpecificFees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_ClinicSpecificFees(
consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DefaultFees {

@JsonKey(name: "consultation_fee") double? get consultationFee;@JsonKey(name: "follow_up_fee") double? get followUpFee;@JsonKey(name: "follow_up_days") int? get followUpDays;
/// Create a copy of DefaultFees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultFeesCopyWith<DefaultFees> get copyWith => _$DefaultFeesCopyWithImpl<DefaultFees>(this as DefaultFees, _$identity);

  /// Serializes this DefaultFees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultFees&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFee,followUpFee,followUpDays);

@override
String toString() {
  return 'DefaultFees(consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays)';
}


}

/// @nodoc
abstract mixin class $DefaultFeesCopyWith<$Res>  {
  factory $DefaultFeesCopyWith(DefaultFees value, $Res Function(DefaultFees) _then) = _$DefaultFeesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "consultation_fee") double? consultationFee,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays
});




}
/// @nodoc
class _$DefaultFeesCopyWithImpl<$Res>
    implements $DefaultFeesCopyWith<$Res> {
  _$DefaultFeesCopyWithImpl(this._self, this._then);

  final DefaultFees _self;
  final $Res Function(DefaultFees) _then;

/// Create a copy of DefaultFees
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consultationFee = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,}) {
  return _then(_self.copyWith(
consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DefaultFees].
extension DefaultFeesPatterns on DefaultFees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefaultFees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefaultFees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefaultFees value)  $default,){
final _that = this;
switch (_that) {
case _DefaultFees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefaultFees value)?  $default,){
final _that = this;
switch (_that) {
case _DefaultFees() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefaultFees() when $default != null:
return $default(_that.consultationFee,_that.followUpFee,_that.followUpDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays)  $default,) {final _that = this;
switch (_that) {
case _DefaultFees():
return $default(_that.consultationFee,_that.followUpFee,_that.followUpDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "consultation_fee")  double? consultationFee, @JsonKey(name: "follow_up_fee")  double? followUpFee, @JsonKey(name: "follow_up_days")  int? followUpDays)?  $default,) {final _that = this;
switch (_that) {
case _DefaultFees() when $default != null:
return $default(_that.consultationFee,_that.followUpFee,_that.followUpDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DefaultFees implements DefaultFees {
  const _DefaultFees({@JsonKey(name: "consultation_fee") this.consultationFee, @JsonKey(name: "follow_up_fee") this.followUpFee, @JsonKey(name: "follow_up_days") this.followUpDays});
  factory _DefaultFees.fromJson(Map<String, dynamic> json) => _$DefaultFeesFromJson(json);

@override@JsonKey(name: "consultation_fee") final  double? consultationFee;
@override@JsonKey(name: "follow_up_fee") final  double? followUpFee;
@override@JsonKey(name: "follow_up_days") final  int? followUpDays;

/// Create a copy of DefaultFees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultFeesCopyWith<_DefaultFees> get copyWith => __$DefaultFeesCopyWithImpl<_DefaultFees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefaultFeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultFees&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationFee,followUpFee,followUpDays);

@override
String toString() {
  return 'DefaultFees(consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays)';
}


}

/// @nodoc
abstract mixin class _$DefaultFeesCopyWith<$Res> implements $DefaultFeesCopyWith<$Res> {
  factory _$DefaultFeesCopyWith(_DefaultFees value, $Res Function(_DefaultFees) _then) = __$DefaultFeesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "consultation_fee") double? consultationFee,@JsonKey(name: "follow_up_fee") double? followUpFee,@JsonKey(name: "follow_up_days") int? followUpDays
});




}
/// @nodoc
class __$DefaultFeesCopyWithImpl<$Res>
    implements _$DefaultFeesCopyWith<$Res> {
  __$DefaultFeesCopyWithImpl(this._self, this._then);

  final _DefaultFees _self;
  final $Res Function(_DefaultFees) _then;

/// Create a copy of DefaultFees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultationFee = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,}) {
  return _then(_DefaultFees(
consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ClinicDoctorModel {

 String? get id;// Add direct id field
@JsonKey(name: "link_id") String? get linkId;@JsonKey(name: "doctor_id") String? get doctorId;@JsonKey(name: "user_id") String? get userId;@JsonKey(name: "doctor_code") String? get doctorCode; String? get specialization;@JsonKey(name: "license_number") String? get licenseNumber;@JsonKey(name: "first_name") String? get firstName;@JsonKey(name: "last_name") String? get lastName;@JsonKey(name: "full_name") String? get fullName; String? get email; String? get username; String? get phone;@JsonKey(name: "is_active") bool get isActive;@JsonKey(name: "profile_image") String? get profileImage;@JsonKey(name: "qualification") String? get qualification;@JsonKey(name: "experience_years") int? get experienceYears;@JsonKey(name: "bio") String? get bio;@JsonKey(name: "clinic_specific_fees") ClinicSpecificFees? get clinicSpecificFees;@JsonKey(name: "default_fees") DefaultFees? get defaultFees;
/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicDoctorModelCopyWith<ClinicDoctorModel> get copyWith => _$ClinicDoctorModelCopyWithImpl<ClinicDoctorModel>(this as ClinicDoctorModel, _$identity);

  /// Serializes this ClinicDoctorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicDoctorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.clinicSpecificFees, clinicSpecificFees) || other.clinicSpecificFees == clinicSpecificFees)&&(identical(other.defaultFees, defaultFees) || other.defaultFees == defaultFees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,linkId,doctorId,userId,doctorCode,specialization,licenseNumber,firstName,lastName,fullName,email,username,phone,isActive,profileImage,qualification,experienceYears,bio,clinicSpecificFees,defaultFees]);

@override
String toString() {
  return 'ClinicDoctorModel(id: $id, linkId: $linkId, doctorId: $doctorId, userId: $userId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, username: $username, phone: $phone, isActive: $isActive, profileImage: $profileImage, qualification: $qualification, experienceYears: $experienceYears, bio: $bio, clinicSpecificFees: $clinicSpecificFees, defaultFees: $defaultFees)';
}


}

/// @nodoc
abstract mixin class $ClinicDoctorModelCopyWith<$Res>  {
  factory $ClinicDoctorModelCopyWith(ClinicDoctorModel value, $Res Function(ClinicDoctorModel) _then) = _$ClinicDoctorModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: "link_id") String? linkId,@JsonKey(name: "doctor_id") String? doctorId,@JsonKey(name: "user_id") String? userId,@JsonKey(name: "doctor_code") String? doctorCode, String? specialization,@JsonKey(name: "license_number") String? licenseNumber,@JsonKey(name: "first_name") String? firstName,@JsonKey(name: "last_name") String? lastName,@JsonKey(name: "full_name") String? fullName, String? email, String? username, String? phone,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "qualification") String? qualification,@JsonKey(name: "experience_years") int? experienceYears,@JsonKey(name: "bio") String? bio,@JsonKey(name: "clinic_specific_fees") ClinicSpecificFees? clinicSpecificFees,@JsonKey(name: "default_fees") DefaultFees? defaultFees
});


$ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees;$DefaultFeesCopyWith<$Res>? get defaultFees;

}
/// @nodoc
class _$ClinicDoctorModelCopyWithImpl<$Res>
    implements $ClinicDoctorModelCopyWith<$Res> {
  _$ClinicDoctorModelCopyWithImpl(this._self, this._then);

  final ClinicDoctorModel _self;
  final $Res Function(ClinicDoctorModel) _then;

/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? linkId = freezed,Object? doctorId = freezed,Object? userId = freezed,Object? doctorCode = freezed,Object? specialization = freezed,Object? licenseNumber = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? email = freezed,Object? username = freezed,Object? phone = freezed,Object? isActive = null,Object? profileImage = freezed,Object? qualification = freezed,Object? experienceYears = freezed,Object? bio = freezed,Object? clinicSpecificFees = freezed,Object? defaultFees = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,linkId: freezed == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: freezed == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,clinicSpecificFees: freezed == clinicSpecificFees ? _self.clinicSpecificFees : clinicSpecificFees // ignore: cast_nullable_to_non_nullable
as ClinicSpecificFees?,defaultFees: freezed == defaultFees ? _self.defaultFees : defaultFees // ignore: cast_nullable_to_non_nullable
as DefaultFees?,
  ));
}
/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees {
    if (_self.clinicSpecificFees == null) {
    return null;
  }

  return $ClinicSpecificFeesCopyWith<$Res>(_self.clinicSpecificFees!, (value) {
    return _then(_self.copyWith(clinicSpecificFees: value));
  });
}/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultFeesCopyWith<$Res>? get defaultFees {
    if (_self.defaultFees == null) {
    return null;
  }

  return $DefaultFeesCopyWith<$Res>(_self.defaultFees!, (value) {
    return _then(_self.copyWith(defaultFees: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClinicDoctorModel].
extension ClinicDoctorModelPatterns on ClinicDoctorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicDoctorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicDoctorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicDoctorModel value)  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicDoctorModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: "link_id")  String? linkId, @JsonKey(name: "doctor_id")  String? doctorId, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "doctor_code")  String? doctorCode,  String? specialization, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "full_name")  String? fullName,  String? email,  String? username,  String? phone, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "qualification")  String? qualification, @JsonKey(name: "experience_years")  int? experienceYears, @JsonKey(name: "bio")  String? bio, @JsonKey(name: "clinic_specific_fees")  ClinicSpecificFees? clinicSpecificFees, @JsonKey(name: "default_fees")  DefaultFees? defaultFees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicDoctorModel() when $default != null:
return $default(_that.id,_that.linkId,_that.doctorId,_that.userId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.username,_that.phone,_that.isActive,_that.profileImage,_that.qualification,_that.experienceYears,_that.bio,_that.clinicSpecificFees,_that.defaultFees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: "link_id")  String? linkId, @JsonKey(name: "doctor_id")  String? doctorId, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "doctor_code")  String? doctorCode,  String? specialization, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "full_name")  String? fullName,  String? email,  String? username,  String? phone, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "qualification")  String? qualification, @JsonKey(name: "experience_years")  int? experienceYears, @JsonKey(name: "bio")  String? bio, @JsonKey(name: "clinic_specific_fees")  ClinicSpecificFees? clinicSpecificFees, @JsonKey(name: "default_fees")  DefaultFees? defaultFees)  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorModel():
return $default(_that.id,_that.linkId,_that.doctorId,_that.userId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.username,_that.phone,_that.isActive,_that.profileImage,_that.qualification,_that.experienceYears,_that.bio,_that.clinicSpecificFees,_that.defaultFees);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: "link_id")  String? linkId, @JsonKey(name: "doctor_id")  String? doctorId, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "doctor_code")  String? doctorCode,  String? specialization, @JsonKey(name: "license_number")  String? licenseNumber, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "full_name")  String? fullName,  String? email,  String? username,  String? phone, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "qualification")  String? qualification, @JsonKey(name: "experience_years")  int? experienceYears, @JsonKey(name: "bio")  String? bio, @JsonKey(name: "clinic_specific_fees")  ClinicSpecificFees? clinicSpecificFees, @JsonKey(name: "default_fees")  DefaultFees? defaultFees)?  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorModel() when $default != null:
return $default(_that.id,_that.linkId,_that.doctorId,_that.userId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.username,_that.phone,_that.isActive,_that.profileImage,_that.qualification,_that.experienceYears,_that.bio,_that.clinicSpecificFees,_that.defaultFees);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicDoctorModel implements ClinicDoctorModel {
  const _ClinicDoctorModel({this.id, @JsonKey(name: "link_id") this.linkId, @JsonKey(name: "doctor_id") this.doctorId, @JsonKey(name: "user_id") this.userId, @JsonKey(name: "doctor_code") this.doctorCode, this.specialization, @JsonKey(name: "license_number") this.licenseNumber, @JsonKey(name: "first_name") this.firstName, @JsonKey(name: "last_name") this.lastName, @JsonKey(name: "full_name") this.fullName, this.email, this.username, this.phone, @JsonKey(name: "is_active") this.isActive = true, @JsonKey(name: "profile_image") this.profileImage, @JsonKey(name: "qualification") this.qualification, @JsonKey(name: "experience_years") this.experienceYears, @JsonKey(name: "bio") this.bio, @JsonKey(name: "clinic_specific_fees") this.clinicSpecificFees, @JsonKey(name: "default_fees") this.defaultFees});
  factory _ClinicDoctorModel.fromJson(Map<String, dynamic> json) => _$ClinicDoctorModelFromJson(json);

@override final  String? id;
// Add direct id field
@override@JsonKey(name: "link_id") final  String? linkId;
@override@JsonKey(name: "doctor_id") final  String? doctorId;
@override@JsonKey(name: "user_id") final  String? userId;
@override@JsonKey(name: "doctor_code") final  String? doctorCode;
@override final  String? specialization;
@override@JsonKey(name: "license_number") final  String? licenseNumber;
@override@JsonKey(name: "first_name") final  String? firstName;
@override@JsonKey(name: "last_name") final  String? lastName;
@override@JsonKey(name: "full_name") final  String? fullName;
@override final  String? email;
@override final  String? username;
@override final  String? phone;
@override@JsonKey(name: "is_active") final  bool isActive;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override@JsonKey(name: "qualification") final  String? qualification;
@override@JsonKey(name: "experience_years") final  int? experienceYears;
@override@JsonKey(name: "bio") final  String? bio;
@override@JsonKey(name: "clinic_specific_fees") final  ClinicSpecificFees? clinicSpecificFees;
@override@JsonKey(name: "default_fees") final  DefaultFees? defaultFees;

/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicDoctorModelCopyWith<_ClinicDoctorModel> get copyWith => __$ClinicDoctorModelCopyWithImpl<_ClinicDoctorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicDoctorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicDoctorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.clinicSpecificFees, clinicSpecificFees) || other.clinicSpecificFees == clinicSpecificFees)&&(identical(other.defaultFees, defaultFees) || other.defaultFees == defaultFees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,linkId,doctorId,userId,doctorCode,specialization,licenseNumber,firstName,lastName,fullName,email,username,phone,isActive,profileImage,qualification,experienceYears,bio,clinicSpecificFees,defaultFees]);

@override
String toString() {
  return 'ClinicDoctorModel(id: $id, linkId: $linkId, doctorId: $doctorId, userId: $userId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, username: $username, phone: $phone, isActive: $isActive, profileImage: $profileImage, qualification: $qualification, experienceYears: $experienceYears, bio: $bio, clinicSpecificFees: $clinicSpecificFees, defaultFees: $defaultFees)';
}


}

/// @nodoc
abstract mixin class _$ClinicDoctorModelCopyWith<$Res> implements $ClinicDoctorModelCopyWith<$Res> {
  factory _$ClinicDoctorModelCopyWith(_ClinicDoctorModel value, $Res Function(_ClinicDoctorModel) _then) = __$ClinicDoctorModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: "link_id") String? linkId,@JsonKey(name: "doctor_id") String? doctorId,@JsonKey(name: "user_id") String? userId,@JsonKey(name: "doctor_code") String? doctorCode, String? specialization,@JsonKey(name: "license_number") String? licenseNumber,@JsonKey(name: "first_name") String? firstName,@JsonKey(name: "last_name") String? lastName,@JsonKey(name: "full_name") String? fullName, String? email, String? username, String? phone,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "qualification") String? qualification,@JsonKey(name: "experience_years") int? experienceYears,@JsonKey(name: "bio") String? bio,@JsonKey(name: "clinic_specific_fees") ClinicSpecificFees? clinicSpecificFees,@JsonKey(name: "default_fees") DefaultFees? defaultFees
});


@override $ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees;@override $DefaultFeesCopyWith<$Res>? get defaultFees;

}
/// @nodoc
class __$ClinicDoctorModelCopyWithImpl<$Res>
    implements _$ClinicDoctorModelCopyWith<$Res> {
  __$ClinicDoctorModelCopyWithImpl(this._self, this._then);

  final _ClinicDoctorModel _self;
  final $Res Function(_ClinicDoctorModel) _then;

/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? linkId = freezed,Object? doctorId = freezed,Object? userId = freezed,Object? doctorCode = freezed,Object? specialization = freezed,Object? licenseNumber = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? email = freezed,Object? username = freezed,Object? phone = freezed,Object? isActive = null,Object? profileImage = freezed,Object? qualification = freezed,Object? experienceYears = freezed,Object? bio = freezed,Object? clinicSpecificFees = freezed,Object? defaultFees = freezed,}) {
  return _then(_ClinicDoctorModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,linkId: freezed == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: freezed == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,clinicSpecificFees: freezed == clinicSpecificFees ? _self.clinicSpecificFees : clinicSpecificFees // ignore: cast_nullable_to_non_nullable
as ClinicSpecificFees?,defaultFees: freezed == defaultFees ? _self.defaultFees : defaultFees // ignore: cast_nullable_to_non_nullable
as DefaultFees?,
  ));
}

/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees {
    if (_self.clinicSpecificFees == null) {
    return null;
  }

  return $ClinicSpecificFeesCopyWith<$Res>(_self.clinicSpecificFees!, (value) {
    return _then(_self.copyWith(clinicSpecificFees: value));
  });
}/// Create a copy of ClinicDoctorModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultFeesCopyWith<$Res>? get defaultFees {
    if (_self.defaultFees == null) {
    return null;
  }

  return $DefaultFeesCopyWith<$Res>(_self.defaultFees!, (value) {
    return _then(_self.copyWith(defaultFees: value));
  });
}
}


/// @nodoc
mixin _$ClinicDoctorsResponse {

@JsonKey(name: "clinic_id") String? get clinicId;// Changed to nullable
 List<ClinicDoctorModel> get doctors;@JsonKey(name: "total_doctors") int? get totalDoctors;
/// Create a copy of ClinicDoctorsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicDoctorsResponseCopyWith<ClinicDoctorsResponse> get copyWith => _$ClinicDoctorsResponseCopyWithImpl<ClinicDoctorsResponse>(this as ClinicDoctorsResponse, _$identity);

  /// Serializes this ClinicDoctorsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicDoctorsResponse&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&const DeepCollectionEquality().equals(other.doctors, doctors)&&(identical(other.totalDoctors, totalDoctors) || other.totalDoctors == totalDoctors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,const DeepCollectionEquality().hash(doctors),totalDoctors);

@override
String toString() {
  return 'ClinicDoctorsResponse(clinicId: $clinicId, doctors: $doctors, totalDoctors: $totalDoctors)';
}


}

/// @nodoc
abstract mixin class $ClinicDoctorsResponseCopyWith<$Res>  {
  factory $ClinicDoctorsResponseCopyWith(ClinicDoctorsResponse value, $Res Function(ClinicDoctorsResponse) _then) = _$ClinicDoctorsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "clinic_id") String? clinicId, List<ClinicDoctorModel> doctors,@JsonKey(name: "total_doctors") int? totalDoctors
});




}
/// @nodoc
class _$ClinicDoctorsResponseCopyWithImpl<$Res>
    implements $ClinicDoctorsResponseCopyWith<$Res> {
  _$ClinicDoctorsResponseCopyWithImpl(this._self, this._then);

  final ClinicDoctorsResponse _self;
  final $Res Function(ClinicDoctorsResponse) _then;

/// Create a copy of ClinicDoctorsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = freezed,Object? doctors = null,Object? totalDoctors = freezed,}) {
  return _then(_self.copyWith(
clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<ClinicDoctorModel>,totalDoctors: freezed == totalDoctors ? _self.totalDoctors : totalDoctors // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicDoctorsResponse].
extension ClinicDoctorsResponsePatterns on ClinicDoctorsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicDoctorsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicDoctorsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicDoctorsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicDoctorsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicDoctorsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_id")  String? clinicId,  List<ClinicDoctorModel> doctors, @JsonKey(name: "total_doctors")  int? totalDoctors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicDoctorsResponse() when $default != null:
return $default(_that.clinicId,_that.doctors,_that.totalDoctors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_id")  String? clinicId,  List<ClinicDoctorModel> doctors, @JsonKey(name: "total_doctors")  int? totalDoctors)  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorsResponse():
return $default(_that.clinicId,_that.doctors,_that.totalDoctors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "clinic_id")  String? clinicId,  List<ClinicDoctorModel> doctors, @JsonKey(name: "total_doctors")  int? totalDoctors)?  $default,) {final _that = this;
switch (_that) {
case _ClinicDoctorsResponse() when $default != null:
return $default(_that.clinicId,_that.doctors,_that.totalDoctors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicDoctorsResponse implements ClinicDoctorsResponse {
  const _ClinicDoctorsResponse({@JsonKey(name: "clinic_id") this.clinicId, required final  List<ClinicDoctorModel> doctors, @JsonKey(name: "total_doctors") this.totalDoctors}): _doctors = doctors;
  factory _ClinicDoctorsResponse.fromJson(Map<String, dynamic> json) => _$ClinicDoctorsResponseFromJson(json);

@override@JsonKey(name: "clinic_id") final  String? clinicId;
// Changed to nullable
 final  List<ClinicDoctorModel> _doctors;
// Changed to nullable
@override List<ClinicDoctorModel> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

@override@JsonKey(name: "total_doctors") final  int? totalDoctors;

/// Create a copy of ClinicDoctorsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicDoctorsResponseCopyWith<_ClinicDoctorsResponse> get copyWith => __$ClinicDoctorsResponseCopyWithImpl<_ClinicDoctorsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicDoctorsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicDoctorsResponse&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&(identical(other.totalDoctors, totalDoctors) || other.totalDoctors == totalDoctors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,const DeepCollectionEquality().hash(_doctors),totalDoctors);

@override
String toString() {
  return 'ClinicDoctorsResponse(clinicId: $clinicId, doctors: $doctors, totalDoctors: $totalDoctors)';
}


}

/// @nodoc
abstract mixin class _$ClinicDoctorsResponseCopyWith<$Res> implements $ClinicDoctorsResponseCopyWith<$Res> {
  factory _$ClinicDoctorsResponseCopyWith(_ClinicDoctorsResponse value, $Res Function(_ClinicDoctorsResponse) _then) = __$ClinicDoctorsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "clinic_id") String? clinicId, List<ClinicDoctorModel> doctors,@JsonKey(name: "total_doctors") int? totalDoctors
});




}
/// @nodoc
class __$ClinicDoctorsResponseCopyWithImpl<$Res>
    implements _$ClinicDoctorsResponseCopyWith<$Res> {
  __$ClinicDoctorsResponseCopyWithImpl(this._self, this._then);

  final _ClinicDoctorsResponse _self;
  final $Res Function(_ClinicDoctorsResponse) _then;

/// Create a copy of ClinicDoctorsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = freezed,Object? doctors = null,Object? totalDoctors = freezed,}) {
  return _then(_ClinicDoctorsResponse(
clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<ClinicDoctorModel>,totalDoctors: freezed == totalDoctors ? _self.totalDoctors : totalDoctors // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
