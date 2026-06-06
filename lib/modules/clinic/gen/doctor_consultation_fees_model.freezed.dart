// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_consultation_fees_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorConsultationFees {

@JsonKey(name: 'clinic_doctor_id') String get clinicDoctorId;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'clinic_name') String? get clinicName;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String? get doctorName;@JsonKey(name: 'doctor_code') String? get doctorCode; String? get specialization;@JsonKey(name: 'consultation_fee_offline') double? get consultationFeeOffline;@JsonKey(name: 'consultation_fee_online') double? get consultationFeeOnline;@JsonKey(name: 'follow_up_fee') double? get followUpFee;@JsonKey(name: 'follow_up_days') int? get followUpDays; String? get notes;@JsonKey(name: 'is_active') bool? get isActive;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of DoctorConsultationFees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorConsultationFeesCopyWith<DoctorConsultationFees> get copyWith => _$DoctorConsultationFeesCopyWithImpl<DoctorConsultationFees>(this as DoctorConsultationFees, _$identity);

  /// Serializes this DoctorConsultationFees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorConsultationFees&&(identical(other.clinicDoctorId, clinicDoctorId) || other.clinicDoctorId == clinicDoctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicDoctorId,clinicId,clinicName,doctorId,doctorName,doctorCode,specialization,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DoctorConsultationFees(clinicDoctorId: $clinicDoctorId, clinicId: $clinicId, clinicName: $clinicName, doctorId: $doctorId, doctorName: $doctorName, doctorCode: $doctorCode, specialization: $specialization, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DoctorConsultationFeesCopyWith<$Res>  {
  factory $DoctorConsultationFeesCopyWith(DoctorConsultationFees value, $Res Function(DoctorConsultationFees) _then) = _$DoctorConsultationFeesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_doctor_id') String clinicDoctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_name') String? clinicName,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'doctor_code') String? doctorCode, String? specialization,@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays, String? notes,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$DoctorConsultationFeesCopyWithImpl<$Res>
    implements $DoctorConsultationFeesCopyWith<$Res> {
  _$DoctorConsultationFeesCopyWithImpl(this._self, this._then);

  final DoctorConsultationFees _self;
  final $Res Function(DoctorConsultationFees) _then;

/// Create a copy of DoctorConsultationFees
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicDoctorId = null,Object? clinicId = null,Object? clinicName = freezed,Object? doctorId = null,Object? doctorName = freezed,Object? doctorCode = freezed,Object? specialization = freezed,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
clinicDoctorId: null == clinicDoctorId ? _self.clinicDoctorId : clinicDoctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorConsultationFees].
extension DoctorConsultationFeesPatterns on DoctorConsultationFees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorConsultationFees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorConsultationFees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorConsultationFees value)  $default,){
final _that = this;
switch (_that) {
case _DoctorConsultationFees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorConsultationFees value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorConsultationFees() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'doctor_code')  String? doctorCode,  String? specialization, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorConsultationFees() when $default != null:
return $default(_that.clinicDoctorId,_that.clinicId,_that.clinicName,_that.doctorId,_that.doctorName,_that.doctorCode,_that.specialization,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'doctor_code')  String? doctorCode,  String? specialization, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DoctorConsultationFees():
return $default(_that.clinicDoctorId,_that.clinicId,_that.clinicName,_that.doctorId,_that.doctorName,_that.doctorCode,_that.specialization,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'doctor_code')  String? doctorCode,  String? specialization, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DoctorConsultationFees() when $default != null:
return $default(_that.clinicDoctorId,_that.clinicId,_that.clinicName,_that.doctorId,_that.doctorName,_that.doctorCode,_that.specialization,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorConsultationFees implements DoctorConsultationFees {
  const _DoctorConsultationFees({@JsonKey(name: 'clinic_doctor_id') required this.clinicDoctorId, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'clinic_name') this.clinicName, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') this.doctorName, @JsonKey(name: 'doctor_code') this.doctorCode, this.specialization, @JsonKey(name: 'consultation_fee_offline') this.consultationFeeOffline, @JsonKey(name: 'consultation_fee_online') this.consultationFeeOnline, @JsonKey(name: 'follow_up_fee') this.followUpFee, @JsonKey(name: 'follow_up_days') this.followUpDays, this.notes, @JsonKey(name: 'is_active') this.isActive, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _DoctorConsultationFees.fromJson(Map<String, dynamic> json) => _$DoctorConsultationFeesFromJson(json);

@override@JsonKey(name: 'clinic_doctor_id') final  String clinicDoctorId;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'clinic_name') final  String? clinicName;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String? doctorName;
@override@JsonKey(name: 'doctor_code') final  String? doctorCode;
@override final  String? specialization;
@override@JsonKey(name: 'consultation_fee_offline') final  double? consultationFeeOffline;
@override@JsonKey(name: 'consultation_fee_online') final  double? consultationFeeOnline;
@override@JsonKey(name: 'follow_up_fee') final  double? followUpFee;
@override@JsonKey(name: 'follow_up_days') final  int? followUpDays;
@override final  String? notes;
@override@JsonKey(name: 'is_active') final  bool? isActive;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of DoctorConsultationFees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorConsultationFeesCopyWith<_DoctorConsultationFees> get copyWith => __$DoctorConsultationFeesCopyWithImpl<_DoctorConsultationFees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorConsultationFeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorConsultationFees&&(identical(other.clinicDoctorId, clinicDoctorId) || other.clinicDoctorId == clinicDoctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicDoctorId,clinicId,clinicName,doctorId,doctorName,doctorCode,specialization,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DoctorConsultationFees(clinicDoctorId: $clinicDoctorId, clinicId: $clinicId, clinicName: $clinicName, doctorId: $doctorId, doctorName: $doctorName, doctorCode: $doctorCode, specialization: $specialization, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorConsultationFeesCopyWith<$Res> implements $DoctorConsultationFeesCopyWith<$Res> {
  factory _$DoctorConsultationFeesCopyWith(_DoctorConsultationFees value, $Res Function(_DoctorConsultationFees) _then) = __$DoctorConsultationFeesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_doctor_id') String clinicDoctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_name') String? clinicName,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'doctor_code') String? doctorCode, String? specialization,@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays, String? notes,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$DoctorConsultationFeesCopyWithImpl<$Res>
    implements _$DoctorConsultationFeesCopyWith<$Res> {
  __$DoctorConsultationFeesCopyWithImpl(this._self, this._then);

  final _DoctorConsultationFees _self;
  final $Res Function(_DoctorConsultationFees) _then;

/// Create a copy of DoctorConsultationFees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicDoctorId = null,Object? clinicId = null,Object? clinicName = freezed,Object? doctorId = null,Object? doctorName = freezed,Object? doctorCode = freezed,Object? specialization = freezed,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DoctorConsultationFees(
clinicDoctorId: null == clinicDoctorId ? _self.clinicDoctorId : clinicDoctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,doctorCode: freezed == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AddConsultationFeesRequest {

@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'clinic_doctor_id') String get clinicDoctorId;@JsonKey(name: 'consultation_fee_offline') double? get consultationFeeOffline;@JsonKey(name: 'consultation_fee_online') double? get consultationFeeOnline;@JsonKey(name: 'follow_up_fee') double? get followUpFee;@JsonKey(name: 'follow_up_days') int? get followUpDays; String? get notes;
/// Create a copy of AddConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddConsultationFeesRequestCopyWith<AddConsultationFeesRequest> get copyWith => _$AddConsultationFeesRequestCopyWithImpl<AddConsultationFeesRequest>(this as AddConsultationFeesRequest, _$identity);

  /// Serializes this AddConsultationFeesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddConsultationFeesRequest&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicDoctorId, clinicDoctorId) || other.clinicDoctorId == clinicDoctorId)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,clinicDoctorId,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'AddConsultationFeesRequest(clinicId: $clinicId, clinicDoctorId: $clinicDoctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AddConsultationFeesRequestCopyWith<$Res>  {
  factory $AddConsultationFeesRequestCopyWith(AddConsultationFeesRequest value, $Res Function(AddConsultationFeesRequest) _then) = _$AddConsultationFeesRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_doctor_id') String clinicDoctorId,@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays, String? notes
});




}
/// @nodoc
class _$AddConsultationFeesRequestCopyWithImpl<$Res>
    implements $AddConsultationFeesRequestCopyWith<$Res> {
  _$AddConsultationFeesRequestCopyWithImpl(this._self, this._then);

  final AddConsultationFeesRequest _self;
  final $Res Function(AddConsultationFeesRequest) _then;

/// Create a copy of AddConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? clinicDoctorId = null,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicDoctorId: null == clinicDoctorId ? _self.clinicDoctorId : clinicDoctorId // ignore: cast_nullable_to_non_nullable
as String,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddConsultationFeesRequest].
extension AddConsultationFeesRequestPatterns on AddConsultationFeesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddConsultationFeesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddConsultationFeesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddConsultationFeesRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddConsultationFeesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddConsultationFeesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddConsultationFeesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddConsultationFeesRequest() when $default != null:
return $default(_that.clinicId,_that.clinicDoctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AddConsultationFeesRequest():
return $default(_that.clinicId,_that.clinicDoctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AddConsultationFeesRequest() when $default != null:
return $default(_that.clinicId,_that.clinicDoctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddConsultationFeesRequest implements AddConsultationFeesRequest {
  const _AddConsultationFeesRequest({@JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'clinic_doctor_id') required this.clinicDoctorId, @JsonKey(name: 'consultation_fee_offline') this.consultationFeeOffline, @JsonKey(name: 'consultation_fee_online') this.consultationFeeOnline, @JsonKey(name: 'follow_up_fee') this.followUpFee, @JsonKey(name: 'follow_up_days') this.followUpDays, this.notes});
  factory _AddConsultationFeesRequest.fromJson(Map<String, dynamic> json) => _$AddConsultationFeesRequestFromJson(json);

@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'clinic_doctor_id') final  String clinicDoctorId;
@override@JsonKey(name: 'consultation_fee_offline') final  double? consultationFeeOffline;
@override@JsonKey(name: 'consultation_fee_online') final  double? consultationFeeOnline;
@override@JsonKey(name: 'follow_up_fee') final  double? followUpFee;
@override@JsonKey(name: 'follow_up_days') final  int? followUpDays;
@override final  String? notes;

/// Create a copy of AddConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddConsultationFeesRequestCopyWith<_AddConsultationFeesRequest> get copyWith => __$AddConsultationFeesRequestCopyWithImpl<_AddConsultationFeesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddConsultationFeesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddConsultationFeesRequest&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicDoctorId, clinicDoctorId) || other.clinicDoctorId == clinicDoctorId)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,clinicDoctorId,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'AddConsultationFeesRequest(clinicId: $clinicId, clinicDoctorId: $clinicDoctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AddConsultationFeesRequestCopyWith<$Res> implements $AddConsultationFeesRequestCopyWith<$Res> {
  factory _$AddConsultationFeesRequestCopyWith(_AddConsultationFeesRequest value, $Res Function(_AddConsultationFeesRequest) _then) = __$AddConsultationFeesRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_doctor_id') String clinicDoctorId,@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays, String? notes
});




}
/// @nodoc
class __$AddConsultationFeesRequestCopyWithImpl<$Res>
    implements _$AddConsultationFeesRequestCopyWith<$Res> {
  __$AddConsultationFeesRequestCopyWithImpl(this._self, this._then);

  final _AddConsultationFeesRequest _self;
  final $Res Function(_AddConsultationFeesRequest) _then;

/// Create a copy of AddConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? clinicDoctorId = null,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_AddConsultationFeesRequest(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicDoctorId: null == clinicDoctorId ? _self.clinicDoctorId : clinicDoctorId // ignore: cast_nullable_to_non_nullable
as String,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateConsultationFeesRequest {

@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'clinic_doctor_id') String get clinicDoctorId;@JsonKey(name: 'consultation_fee_offline') double? get consultationFeeOffline;@JsonKey(name: 'consultation_fee_online') double? get consultationFeeOnline;@JsonKey(name: 'follow_up_fee') double? get followUpFee;@JsonKey(name: 'follow_up_days') int? get followUpDays; String? get notes;
/// Create a copy of UpdateConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateConsultationFeesRequestCopyWith<UpdateConsultationFeesRequest> get copyWith => _$UpdateConsultationFeesRequestCopyWithImpl<UpdateConsultationFeesRequest>(this as UpdateConsultationFeesRequest, _$identity);

  /// Serializes this UpdateConsultationFeesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateConsultationFeesRequest&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicDoctorId, clinicDoctorId) || other.clinicDoctorId == clinicDoctorId)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,clinicDoctorId,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'UpdateConsultationFeesRequest(clinicId: $clinicId, clinicDoctorId: $clinicDoctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateConsultationFeesRequestCopyWith<$Res>  {
  factory $UpdateConsultationFeesRequestCopyWith(UpdateConsultationFeesRequest value, $Res Function(UpdateConsultationFeesRequest) _then) = _$UpdateConsultationFeesRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_doctor_id') String clinicDoctorId,@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays, String? notes
});




}
/// @nodoc
class _$UpdateConsultationFeesRequestCopyWithImpl<$Res>
    implements $UpdateConsultationFeesRequestCopyWith<$Res> {
  _$UpdateConsultationFeesRequestCopyWithImpl(this._self, this._then);

  final UpdateConsultationFeesRequest _self;
  final $Res Function(UpdateConsultationFeesRequest) _then;

/// Create a copy of UpdateConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? clinicDoctorId = null,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicDoctorId: null == clinicDoctorId ? _self.clinicDoctorId : clinicDoctorId // ignore: cast_nullable_to_non_nullable
as String,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateConsultationFeesRequest].
extension UpdateConsultationFeesRequestPatterns on UpdateConsultationFeesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateConsultationFeesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateConsultationFeesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateConsultationFeesRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateConsultationFeesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateConsultationFeesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateConsultationFeesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateConsultationFeesRequest() when $default != null:
return $default(_that.clinicId,_that.clinicDoctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _UpdateConsultationFeesRequest():
return $default(_that.clinicId,_that.clinicDoctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_doctor_id')  String clinicDoctorId, @JsonKey(name: 'consultation_fee_offline')  double? consultationFeeOffline, @JsonKey(name: 'consultation_fee_online')  double? consultationFeeOnline, @JsonKey(name: 'follow_up_fee')  double? followUpFee, @JsonKey(name: 'follow_up_days')  int? followUpDays,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _UpdateConsultationFeesRequest() when $default != null:
return $default(_that.clinicId,_that.clinicDoctorId,_that.consultationFeeOffline,_that.consultationFeeOnline,_that.followUpFee,_that.followUpDays,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateConsultationFeesRequest implements UpdateConsultationFeesRequest {
  const _UpdateConsultationFeesRequest({@JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'clinic_doctor_id') required this.clinicDoctorId, @JsonKey(name: 'consultation_fee_offline') this.consultationFeeOffline, @JsonKey(name: 'consultation_fee_online') this.consultationFeeOnline, @JsonKey(name: 'follow_up_fee') this.followUpFee, @JsonKey(name: 'follow_up_days') this.followUpDays, this.notes});
  factory _UpdateConsultationFeesRequest.fromJson(Map<String, dynamic> json) => _$UpdateConsultationFeesRequestFromJson(json);

@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'clinic_doctor_id') final  String clinicDoctorId;
@override@JsonKey(name: 'consultation_fee_offline') final  double? consultationFeeOffline;
@override@JsonKey(name: 'consultation_fee_online') final  double? consultationFeeOnline;
@override@JsonKey(name: 'follow_up_fee') final  double? followUpFee;
@override@JsonKey(name: 'follow_up_days') final  int? followUpDays;
@override final  String? notes;

/// Create a copy of UpdateConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateConsultationFeesRequestCopyWith<_UpdateConsultationFeesRequest> get copyWith => __$UpdateConsultationFeesRequestCopyWithImpl<_UpdateConsultationFeesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateConsultationFeesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateConsultationFeesRequest&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicDoctorId, clinicDoctorId) || other.clinicDoctorId == clinicDoctorId)&&(identical(other.consultationFeeOffline, consultationFeeOffline) || other.consultationFeeOffline == consultationFeeOffline)&&(identical(other.consultationFeeOnline, consultationFeeOnline) || other.consultationFeeOnline == consultationFeeOnline)&&(identical(other.followUpFee, followUpFee) || other.followUpFee == followUpFee)&&(identical(other.followUpDays, followUpDays) || other.followUpDays == followUpDays)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,clinicDoctorId,consultationFeeOffline,consultationFeeOnline,followUpFee,followUpDays,notes);

@override
String toString() {
  return 'UpdateConsultationFeesRequest(clinicId: $clinicId, clinicDoctorId: $clinicDoctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$UpdateConsultationFeesRequestCopyWith<$Res> implements $UpdateConsultationFeesRequestCopyWith<$Res> {
  factory _$UpdateConsultationFeesRequestCopyWith(_UpdateConsultationFeesRequest value, $Res Function(_UpdateConsultationFeesRequest) _then) = __$UpdateConsultationFeesRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_doctor_id') String clinicDoctorId,@JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,@JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,@JsonKey(name: 'follow_up_fee') double? followUpFee,@JsonKey(name: 'follow_up_days') int? followUpDays, String? notes
});




}
/// @nodoc
class __$UpdateConsultationFeesRequestCopyWithImpl<$Res>
    implements _$UpdateConsultationFeesRequestCopyWith<$Res> {
  __$UpdateConsultationFeesRequestCopyWithImpl(this._self, this._then);

  final _UpdateConsultationFeesRequest _self;
  final $Res Function(_UpdateConsultationFeesRequest) _then;

/// Create a copy of UpdateConsultationFeesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? clinicDoctorId = null,Object? consultationFeeOffline = freezed,Object? consultationFeeOnline = freezed,Object? followUpFee = freezed,Object? followUpDays = freezed,Object? notes = freezed,}) {
  return _then(_UpdateConsultationFeesRequest(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicDoctorId: null == clinicDoctorId ? _self.clinicDoctorId : clinicDoctorId // ignore: cast_nullable_to_non_nullable
as String,consultationFeeOffline: freezed == consultationFeeOffline ? _self.consultationFeeOffline : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
as double?,consultationFeeOnline: freezed == consultationFeeOnline ? _self.consultationFeeOnline : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
as double?,followUpFee: freezed == followUpFee ? _self.followUpFee : followUpFee // ignore: cast_nullable_to_non_nullable
as double?,followUpDays: freezed == followUpDays ? _self.followUpDays : followUpDays // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ConsultationFeesResponse {

 String get message; DoctorConsultationFees? get data;
/// Create a copy of ConsultationFeesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationFeesResponseCopyWith<ConsultationFeesResponse> get copyWith => _$ConsultationFeesResponseCopyWithImpl<ConsultationFeesResponse>(this as ConsultationFeesResponse, _$identity);

  /// Serializes this ConsultationFeesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationFeesResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'ConsultationFeesResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConsultationFeesResponseCopyWith<$Res>  {
  factory $ConsultationFeesResponseCopyWith(ConsultationFeesResponse value, $Res Function(ConsultationFeesResponse) _then) = _$ConsultationFeesResponseCopyWithImpl;
@useResult
$Res call({
 String message, DoctorConsultationFees? data
});


$DoctorConsultationFeesCopyWith<$Res>? get data;

}
/// @nodoc
class _$ConsultationFeesResponseCopyWithImpl<$Res>
    implements $ConsultationFeesResponseCopyWith<$Res> {
  _$ConsultationFeesResponseCopyWithImpl(this._self, this._then);

  final ConsultationFeesResponse _self;
  final $Res Function(ConsultationFeesResponse) _then;

/// Create a copy of ConsultationFeesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DoctorConsultationFees?,
  ));
}
/// Create a copy of ConsultationFeesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorConsultationFeesCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DoctorConsultationFeesCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConsultationFeesResponse].
extension ConsultationFeesResponsePatterns on ConsultationFeesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationFeesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationFeesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationFeesResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationFeesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationFeesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationFeesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  DoctorConsultationFees? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationFeesResponse() when $default != null:
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  DoctorConsultationFees? data)  $default,) {final _that = this;
switch (_that) {
case _ConsultationFeesResponse():
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  DoctorConsultationFees? data)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationFeesResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationFeesResponse implements ConsultationFeesResponse {
  const _ConsultationFeesResponse({required this.message, this.data});
  factory _ConsultationFeesResponse.fromJson(Map<String, dynamic> json) => _$ConsultationFeesResponseFromJson(json);

@override final  String message;
@override final  DoctorConsultationFees? data;

/// Create a copy of ConsultationFeesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationFeesResponseCopyWith<_ConsultationFeesResponse> get copyWith => __$ConsultationFeesResponseCopyWithImpl<_ConsultationFeesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationFeesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationFeesResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'ConsultationFeesResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ConsultationFeesResponseCopyWith<$Res> implements $ConsultationFeesResponseCopyWith<$Res> {
  factory _$ConsultationFeesResponseCopyWith(_ConsultationFeesResponse value, $Res Function(_ConsultationFeesResponse) _then) = __$ConsultationFeesResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, DoctorConsultationFees? data
});


@override $DoctorConsultationFeesCopyWith<$Res>? get data;

}
/// @nodoc
class __$ConsultationFeesResponseCopyWithImpl<$Res>
    implements _$ConsultationFeesResponseCopyWith<$Res> {
  __$ConsultationFeesResponseCopyWithImpl(this._self, this._then);

  final _ConsultationFeesResponse _self;
  final $Res Function(_ConsultationFeesResponse) _then;

/// Create a copy of ConsultationFeesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_ConsultationFeesResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DoctorConsultationFees?,
  ));
}

/// Create a copy of ConsultationFeesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorConsultationFeesCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DoctorConsultationFeesCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
