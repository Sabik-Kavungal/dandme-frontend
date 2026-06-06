// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowUpEligibilityResponse {

@JsonKey(name: 'is_free') bool get isFree;@JsonKey(name: 'is_eligible') bool get isEligible; String get message;@JsonKey(name: 'followup_details') FollowUpDetails? get followupDetails;
/// Create a copy of FollowUpEligibilityResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowUpEligibilityResponseCopyWith<FollowUpEligibilityResponse> get copyWith => _$FollowUpEligibilityResponseCopyWithImpl<FollowUpEligibilityResponse>(this as FollowUpEligibilityResponse, _$identity);

  /// Serializes this FollowUpEligibilityResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowUpEligibilityResponse&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.isEligible, isEligible) || other.isEligible == isEligible)&&(identical(other.message, message) || other.message == message)&&(identical(other.followupDetails, followupDetails) || other.followupDetails == followupDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFree,isEligible,message,followupDetails);

@override
String toString() {
  return 'FollowUpEligibilityResponse(isFree: $isFree, isEligible: $isEligible, message: $message, followupDetails: $followupDetails)';
}


}

/// @nodoc
abstract mixin class $FollowUpEligibilityResponseCopyWith<$Res>  {
  factory $FollowUpEligibilityResponseCopyWith(FollowUpEligibilityResponse value, $Res Function(FollowUpEligibilityResponse) _then) = _$FollowUpEligibilityResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_free') bool isFree,@JsonKey(name: 'is_eligible') bool isEligible, String message,@JsonKey(name: 'followup_details') FollowUpDetails? followupDetails
});


$FollowUpDetailsCopyWith<$Res>? get followupDetails;

}
/// @nodoc
class _$FollowUpEligibilityResponseCopyWithImpl<$Res>
    implements $FollowUpEligibilityResponseCopyWith<$Res> {
  _$FollowUpEligibilityResponseCopyWithImpl(this._self, this._then);

  final FollowUpEligibilityResponse _self;
  final $Res Function(FollowUpEligibilityResponse) _then;

/// Create a copy of FollowUpEligibilityResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFree = null,Object? isEligible = null,Object? message = null,Object? followupDetails = freezed,}) {
  return _then(_self.copyWith(
isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,isEligible: null == isEligible ? _self.isEligible : isEligible // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,followupDetails: freezed == followupDetails ? _self.followupDetails : followupDetails // ignore: cast_nullable_to_non_nullable
as FollowUpDetails?,
  ));
}
/// Create a copy of FollowUpEligibilityResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpDetailsCopyWith<$Res>? get followupDetails {
    if (_self.followupDetails == null) {
    return null;
  }

  return $FollowUpDetailsCopyWith<$Res>(_self.followupDetails!, (value) {
    return _then(_self.copyWith(followupDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [FollowUpEligibilityResponse].
extension FollowUpEligibilityResponsePatterns on FollowUpEligibilityResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowUpEligibilityResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowUpEligibilityResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowUpEligibilityResponse value)  $default,){
final _that = this;
switch (_that) {
case _FollowUpEligibilityResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowUpEligibilityResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FollowUpEligibilityResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'is_eligible')  bool isEligible,  String message, @JsonKey(name: 'followup_details')  FollowUpDetails? followupDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowUpEligibilityResponse() when $default != null:
return $default(_that.isFree,_that.isEligible,_that.message,_that.followupDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'is_eligible')  bool isEligible,  String message, @JsonKey(name: 'followup_details')  FollowUpDetails? followupDetails)  $default,) {final _that = this;
switch (_that) {
case _FollowUpEligibilityResponse():
return $default(_that.isFree,_that.isEligible,_that.message,_that.followupDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'is_eligible')  bool isEligible,  String message, @JsonKey(name: 'followup_details')  FollowUpDetails? followupDetails)?  $default,) {final _that = this;
switch (_that) {
case _FollowUpEligibilityResponse() when $default != null:
return $default(_that.isFree,_that.isEligible,_that.message,_that.followupDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FollowUpEligibilityResponse implements FollowUpEligibilityResponse {
  const _FollowUpEligibilityResponse({@JsonKey(name: 'is_free') required this.isFree, @JsonKey(name: 'is_eligible') required this.isEligible, required this.message, @JsonKey(name: 'followup_details') this.followupDetails});
  factory _FollowUpEligibilityResponse.fromJson(Map<String, dynamic> json) => _$FollowUpEligibilityResponseFromJson(json);

@override@JsonKey(name: 'is_free') final  bool isFree;
@override@JsonKey(name: 'is_eligible') final  bool isEligible;
@override final  String message;
@override@JsonKey(name: 'followup_details') final  FollowUpDetails? followupDetails;

/// Create a copy of FollowUpEligibilityResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowUpEligibilityResponseCopyWith<_FollowUpEligibilityResponse> get copyWith => __$FollowUpEligibilityResponseCopyWithImpl<_FollowUpEligibilityResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowUpEligibilityResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowUpEligibilityResponse&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.isEligible, isEligible) || other.isEligible == isEligible)&&(identical(other.message, message) || other.message == message)&&(identical(other.followupDetails, followupDetails) || other.followupDetails == followupDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFree,isEligible,message,followupDetails);

@override
String toString() {
  return 'FollowUpEligibilityResponse(isFree: $isFree, isEligible: $isEligible, message: $message, followupDetails: $followupDetails)';
}


}

/// @nodoc
abstract mixin class _$FollowUpEligibilityResponseCopyWith<$Res> implements $FollowUpEligibilityResponseCopyWith<$Res> {
  factory _$FollowUpEligibilityResponseCopyWith(_FollowUpEligibilityResponse value, $Res Function(_FollowUpEligibilityResponse) _then) = __$FollowUpEligibilityResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_free') bool isFree,@JsonKey(name: 'is_eligible') bool isEligible, String message,@JsonKey(name: 'followup_details') FollowUpDetails? followupDetails
});


@override $FollowUpDetailsCopyWith<$Res>? get followupDetails;

}
/// @nodoc
class __$FollowUpEligibilityResponseCopyWithImpl<$Res>
    implements _$FollowUpEligibilityResponseCopyWith<$Res> {
  __$FollowUpEligibilityResponseCopyWithImpl(this._self, this._then);

  final _FollowUpEligibilityResponse _self;
  final $Res Function(_FollowUpEligibilityResponse) _then;

/// Create a copy of FollowUpEligibilityResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFree = null,Object? isEligible = null,Object? message = null,Object? followupDetails = freezed,}) {
  return _then(_FollowUpEligibilityResponse(
isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,isEligible: null == isEligible ? _self.isEligible : isEligible // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,followupDetails: freezed == followupDetails ? _self.followupDetails : followupDetails // ignore: cast_nullable_to_non_nullable
as FollowUpDetails?,
  ));
}

/// Create a copy of FollowUpEligibilityResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpDetailsCopyWith<$Res>? get followupDetails {
    if (_self.followupDetails == null) {
    return null;
  }

  return $FollowUpDetailsCopyWith<$Res>(_self.followupDetails!, (value) {
    return _then(_self.copyWith(followupDetails: value));
  });
}
}


/// @nodoc
mixin _$FollowUpDetails {

@JsonKey(name: 'followup_id') String? get followupId;@JsonKey(name: 'valid_until') String? get validUntil;@JsonKey(name: 'days_remaining') int? get daysRemaining;@JsonKey(name: 'doctor_id') String? get doctorId;@JsonKey(name: 'department_id') String? get departmentId;
/// Create a copy of FollowUpDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowUpDetailsCopyWith<FollowUpDetails> get copyWith => _$FollowUpDetailsCopyWithImpl<FollowUpDetails>(this as FollowUpDetails, _$identity);

  /// Serializes this FollowUpDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowUpDetails&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,validUntil,daysRemaining,doctorId,departmentId);

@override
String toString() {
  return 'FollowUpDetails(followupId: $followupId, validUntil: $validUntil, daysRemaining: $daysRemaining, doctorId: $doctorId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class $FollowUpDetailsCopyWith<$Res>  {
  factory $FollowUpDetailsCopyWith(FollowUpDetails value, $Res Function(FollowUpDetails) _then) = _$FollowUpDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'followup_id') String? followupId,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'days_remaining') int? daysRemaining,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'department_id') String? departmentId
});




}
/// @nodoc
class _$FollowUpDetailsCopyWithImpl<$Res>
    implements $FollowUpDetailsCopyWith<$Res> {
  _$FollowUpDetailsCopyWithImpl(this._self, this._then);

  final FollowUpDetails _self;
  final $Res Function(FollowUpDetails) _then;

/// Create a copy of FollowUpDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followupId = freezed,Object? validUntil = freezed,Object? daysRemaining = freezed,Object? doctorId = freezed,Object? departmentId = freezed,}) {
  return _then(_self.copyWith(
followupId: freezed == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowUpDetails].
extension FollowUpDetailsPatterns on FollowUpDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowUpDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowUpDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowUpDetails value)  $default,){
final _that = this;
switch (_that) {
case _FollowUpDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowUpDetails value)?  $default,){
final _that = this;
switch (_that) {
case _FollowUpDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'days_remaining')  int? daysRemaining, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'department_id')  String? departmentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowUpDetails() when $default != null:
return $default(_that.followupId,_that.validUntil,_that.daysRemaining,_that.doctorId,_that.departmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'days_remaining')  int? daysRemaining, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'department_id')  String? departmentId)  $default,) {final _that = this;
switch (_that) {
case _FollowUpDetails():
return $default(_that.followupId,_that.validUntil,_that.daysRemaining,_that.doctorId,_that.departmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'days_remaining')  int? daysRemaining, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'department_id')  String? departmentId)?  $default,) {final _that = this;
switch (_that) {
case _FollowUpDetails() when $default != null:
return $default(_that.followupId,_that.validUntil,_that.daysRemaining,_that.doctorId,_that.departmentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FollowUpDetails implements FollowUpDetails {
  const _FollowUpDetails({@JsonKey(name: 'followup_id') this.followupId, @JsonKey(name: 'valid_until') this.validUntil, @JsonKey(name: 'days_remaining') this.daysRemaining, @JsonKey(name: 'doctor_id') this.doctorId, @JsonKey(name: 'department_id') this.departmentId});
  factory _FollowUpDetails.fromJson(Map<String, dynamic> json) => _$FollowUpDetailsFromJson(json);

@override@JsonKey(name: 'followup_id') final  String? followupId;
@override@JsonKey(name: 'valid_until') final  String? validUntil;
@override@JsonKey(name: 'days_remaining') final  int? daysRemaining;
@override@JsonKey(name: 'doctor_id') final  String? doctorId;
@override@JsonKey(name: 'department_id') final  String? departmentId;

/// Create a copy of FollowUpDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowUpDetailsCopyWith<_FollowUpDetails> get copyWith => __$FollowUpDetailsCopyWithImpl<_FollowUpDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowUpDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowUpDetails&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,validUntil,daysRemaining,doctorId,departmentId);

@override
String toString() {
  return 'FollowUpDetails(followupId: $followupId, validUntil: $validUntil, daysRemaining: $daysRemaining, doctorId: $doctorId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class _$FollowUpDetailsCopyWith<$Res> implements $FollowUpDetailsCopyWith<$Res> {
  factory _$FollowUpDetailsCopyWith(_FollowUpDetails value, $Res Function(_FollowUpDetails) _then) = __$FollowUpDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'followup_id') String? followupId,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'days_remaining') int? daysRemaining,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'department_id') String? departmentId
});




}
/// @nodoc
class __$FollowUpDetailsCopyWithImpl<$Res>
    implements _$FollowUpDetailsCopyWith<$Res> {
  __$FollowUpDetailsCopyWithImpl(this._self, this._then);

  final _FollowUpDetails _self;
  final $Res Function(_FollowUpDetails) _then;

/// Create a copy of FollowUpDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followupId = freezed,Object? validUntil = freezed,Object? daysRemaining = freezed,Object? doctorId = freezed,Object? departmentId = freezed,}) {
  return _then(_FollowUpDetails(
followupId: freezed == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ActiveFollowUpsResponse {

@JsonKey(name: 'active_followups') List<ActiveFollowUp> get activeFollowups;@JsonKey(name: 'total_count') int get totalCount;
/// Create a copy of ActiveFollowUpsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveFollowUpsResponseCopyWith<ActiveFollowUpsResponse> get copyWith => _$ActiveFollowUpsResponseCopyWithImpl<ActiveFollowUpsResponse>(this as ActiveFollowUpsResponse, _$identity);

  /// Serializes this ActiveFollowUpsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveFollowUpsResponse&&const DeepCollectionEquality().equals(other.activeFollowups, activeFollowups)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(activeFollowups),totalCount);

@override
String toString() {
  return 'ActiveFollowUpsResponse(activeFollowups: $activeFollowups, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $ActiveFollowUpsResponseCopyWith<$Res>  {
  factory $ActiveFollowUpsResponseCopyWith(ActiveFollowUpsResponse value, $Res Function(ActiveFollowUpsResponse) _then) = _$ActiveFollowUpsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'active_followups') List<ActiveFollowUp> activeFollowups,@JsonKey(name: 'total_count') int totalCount
});




}
/// @nodoc
class _$ActiveFollowUpsResponseCopyWithImpl<$Res>
    implements $ActiveFollowUpsResponseCopyWith<$Res> {
  _$ActiveFollowUpsResponseCopyWithImpl(this._self, this._then);

  final ActiveFollowUpsResponse _self;
  final $Res Function(ActiveFollowUpsResponse) _then;

/// Create a copy of ActiveFollowUpsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeFollowups = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
activeFollowups: null == activeFollowups ? _self.activeFollowups : activeFollowups // ignore: cast_nullable_to_non_nullable
as List<ActiveFollowUp>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveFollowUpsResponse].
extension ActiveFollowUpsResponsePatterns on ActiveFollowUpsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveFollowUpsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveFollowUpsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveFollowUpsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ActiveFollowUpsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveFollowUpsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveFollowUpsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'active_followups')  List<ActiveFollowUp> activeFollowups, @JsonKey(name: 'total_count')  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveFollowUpsResponse() when $default != null:
return $default(_that.activeFollowups,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'active_followups')  List<ActiveFollowUp> activeFollowups, @JsonKey(name: 'total_count')  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _ActiveFollowUpsResponse():
return $default(_that.activeFollowups,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'active_followups')  List<ActiveFollowUp> activeFollowups, @JsonKey(name: 'total_count')  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _ActiveFollowUpsResponse() when $default != null:
return $default(_that.activeFollowups,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveFollowUpsResponse implements ActiveFollowUpsResponse {
  const _ActiveFollowUpsResponse({@JsonKey(name: 'active_followups') required final  List<ActiveFollowUp> activeFollowups, @JsonKey(name: 'total_count') required this.totalCount}): _activeFollowups = activeFollowups;
  factory _ActiveFollowUpsResponse.fromJson(Map<String, dynamic> json) => _$ActiveFollowUpsResponseFromJson(json);

 final  List<ActiveFollowUp> _activeFollowups;
@override@JsonKey(name: 'active_followups') List<ActiveFollowUp> get activeFollowups {
  if (_activeFollowups is EqualUnmodifiableListView) return _activeFollowups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeFollowups);
}

@override@JsonKey(name: 'total_count') final  int totalCount;

/// Create a copy of ActiveFollowUpsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveFollowUpsResponseCopyWith<_ActiveFollowUpsResponse> get copyWith => __$ActiveFollowUpsResponseCopyWithImpl<_ActiveFollowUpsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveFollowUpsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveFollowUpsResponse&&const DeepCollectionEquality().equals(other._activeFollowups, _activeFollowups)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_activeFollowups),totalCount);

@override
String toString() {
  return 'ActiveFollowUpsResponse(activeFollowups: $activeFollowups, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$ActiveFollowUpsResponseCopyWith<$Res> implements $ActiveFollowUpsResponseCopyWith<$Res> {
  factory _$ActiveFollowUpsResponseCopyWith(_ActiveFollowUpsResponse value, $Res Function(_ActiveFollowUpsResponse) _then) = __$ActiveFollowUpsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'active_followups') List<ActiveFollowUp> activeFollowups,@JsonKey(name: 'total_count') int totalCount
});




}
/// @nodoc
class __$ActiveFollowUpsResponseCopyWithImpl<$Res>
    implements _$ActiveFollowUpsResponseCopyWith<$Res> {
  __$ActiveFollowUpsResponseCopyWithImpl(this._self, this._then);

  final _ActiveFollowUpsResponse _self;
  final $Res Function(_ActiveFollowUpsResponse) _then;

/// Create a copy of ActiveFollowUpsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeFollowups = null,Object? totalCount = null,}) {
  return _then(_ActiveFollowUpsResponse(
activeFollowups: null == activeFollowups ? _self._activeFollowups : activeFollowups // ignore: cast_nullable_to_non_nullable
as List<ActiveFollowUp>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ActiveFollowUp {

@JsonKey(name: 'followup_id') String get followupId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String get doctorName;@JsonKey(name: 'department_id') String get departmentId;@JsonKey(name: 'department_name') String get departmentName;@JsonKey(name: 'appointment_id') String get appointmentId;@JsonKey(name: 'appointment_date') String get appointmentDate;@JsonKey(name: 'valid_until') String get validUntil;@JsonKey(name: 'days_remaining') int get daysRemaining;@JsonKey(name: 'is_free') bool get isFree;
/// Create a copy of ActiveFollowUp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveFollowUpCopyWith<ActiveFollowUp> get copyWith => _$ActiveFollowUpCopyWithImpl<ActiveFollowUp>(this as ActiveFollowUp, _$identity);

  /// Serializes this ActiveFollowUp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveFollowUp&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,doctorId,doctorName,departmentId,departmentName,appointmentId,appointmentDate,validUntil,daysRemaining,isFree);

@override
String toString() {
  return 'ActiveFollowUp(followupId: $followupId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, appointmentId: $appointmentId, appointmentDate: $appointmentDate, validUntil: $validUntil, daysRemaining: $daysRemaining, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class $ActiveFollowUpCopyWith<$Res>  {
  factory $ActiveFollowUpCopyWith(ActiveFollowUp value, $Res Function(ActiveFollowUp) _then) = _$ActiveFollowUpCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'followup_id') String followupId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String departmentId,@JsonKey(name: 'department_name') String departmentName,@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'valid_until') String validUntil,@JsonKey(name: 'days_remaining') int daysRemaining,@JsonKey(name: 'is_free') bool isFree
});




}
/// @nodoc
class _$ActiveFollowUpCopyWithImpl<$Res>
    implements $ActiveFollowUpCopyWith<$Res> {
  _$ActiveFollowUpCopyWithImpl(this._self, this._then);

  final ActiveFollowUp _self;
  final $Res Function(ActiveFollowUp) _then;

/// Create a copy of ActiveFollowUp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followupId = null,Object? doctorId = null,Object? doctorName = null,Object? departmentId = null,Object? departmentName = null,Object? appointmentId = null,Object? appointmentDate = null,Object? validUntil = null,Object? daysRemaining = null,Object? isFree = null,}) {
  return _then(_self.copyWith(
followupId: null == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,departmentName: null == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String,appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveFollowUp].
extension ActiveFollowUpPatterns on ActiveFollowUp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveFollowUp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveFollowUp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveFollowUp value)  $default,){
final _that = this;
switch (_that) {
case _ActiveFollowUp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveFollowUp value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveFollowUp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String followupId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String departmentId, @JsonKey(name: 'department_name')  String departmentName, @JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'days_remaining')  int daysRemaining, @JsonKey(name: 'is_free')  bool isFree)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveFollowUp() when $default != null:
return $default(_that.followupId,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.appointmentId,_that.appointmentDate,_that.validUntil,_that.daysRemaining,_that.isFree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String followupId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String departmentId, @JsonKey(name: 'department_name')  String departmentName, @JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'days_remaining')  int daysRemaining, @JsonKey(name: 'is_free')  bool isFree)  $default,) {final _that = this;
switch (_that) {
case _ActiveFollowUp():
return $default(_that.followupId,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.appointmentId,_that.appointmentDate,_that.validUntil,_that.daysRemaining,_that.isFree);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'followup_id')  String followupId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String departmentId, @JsonKey(name: 'department_name')  String departmentName, @JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'days_remaining')  int daysRemaining, @JsonKey(name: 'is_free')  bool isFree)?  $default,) {final _that = this;
switch (_that) {
case _ActiveFollowUp() when $default != null:
return $default(_that.followupId,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.appointmentId,_that.appointmentDate,_that.validUntil,_that.daysRemaining,_that.isFree);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveFollowUp implements ActiveFollowUp {
  const _ActiveFollowUp({@JsonKey(name: 'followup_id') required this.followupId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') required this.doctorName, @JsonKey(name: 'department_id') required this.departmentId, @JsonKey(name: 'department_name') required this.departmentName, @JsonKey(name: 'appointment_id') required this.appointmentId, @JsonKey(name: 'appointment_date') required this.appointmentDate, @JsonKey(name: 'valid_until') required this.validUntil, @JsonKey(name: 'days_remaining') required this.daysRemaining, @JsonKey(name: 'is_free') required this.isFree});
  factory _ActiveFollowUp.fromJson(Map<String, dynamic> json) => _$ActiveFollowUpFromJson(json);

@override@JsonKey(name: 'followup_id') final  String followupId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String doctorName;
@override@JsonKey(name: 'department_id') final  String departmentId;
@override@JsonKey(name: 'department_name') final  String departmentName;
@override@JsonKey(name: 'appointment_id') final  String appointmentId;
@override@JsonKey(name: 'appointment_date') final  String appointmentDate;
@override@JsonKey(name: 'valid_until') final  String validUntil;
@override@JsonKey(name: 'days_remaining') final  int daysRemaining;
@override@JsonKey(name: 'is_free') final  bool isFree;

/// Create a copy of ActiveFollowUp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveFollowUpCopyWith<_ActiveFollowUp> get copyWith => __$ActiveFollowUpCopyWithImpl<_ActiveFollowUp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveFollowUpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveFollowUp&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,doctorId,doctorName,departmentId,departmentName,appointmentId,appointmentDate,validUntil,daysRemaining,isFree);

@override
String toString() {
  return 'ActiveFollowUp(followupId: $followupId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, appointmentId: $appointmentId, appointmentDate: $appointmentDate, validUntil: $validUntil, daysRemaining: $daysRemaining, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class _$ActiveFollowUpCopyWith<$Res> implements $ActiveFollowUpCopyWith<$Res> {
  factory _$ActiveFollowUpCopyWith(_ActiveFollowUp value, $Res Function(_ActiveFollowUp) _then) = __$ActiveFollowUpCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'followup_id') String followupId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String departmentId,@JsonKey(name: 'department_name') String departmentName,@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'valid_until') String validUntil,@JsonKey(name: 'days_remaining') int daysRemaining,@JsonKey(name: 'is_free') bool isFree
});




}
/// @nodoc
class __$ActiveFollowUpCopyWithImpl<$Res>
    implements _$ActiveFollowUpCopyWith<$Res> {
  __$ActiveFollowUpCopyWithImpl(this._self, this._then);

  final _ActiveFollowUp _self;
  final $Res Function(_ActiveFollowUp) _then;

/// Create a copy of ActiveFollowUp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followupId = null,Object? doctorId = null,Object? doctorName = null,Object? departmentId = null,Object? departmentName = null,Object? appointmentId = null,Object? appointmentDate = null,Object? validUntil = null,Object? daysRemaining = null,Object? isFree = null,}) {
  return _then(_ActiveFollowUp(
followupId: null == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,departmentName: null == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String,appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ClinicPatient {

 String get id;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get phone; String? get email;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; int? get age; String? get gender; String? get address; String? get address1; String? get address2; String? get district; String? get state;@JsonKey(name: 'mo_id') String? get moId;@JsonKey(name: 'medical_history') String? get medicalHistory; String? get allergies;@JsonKey(name: 'blood_group') String? get bloodGroup;@JsonKey(name: 'smoking_status') String? get smokingStatus;@JsonKey(name: 'alcohol_use') String? get alcoholUse;@JsonKey(name: 'height_cm') int? get heightCm;@JsonKey(name: 'weight_kg') int? get weightKg;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'global_patient_id') String? get globalPatientId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;// ✅ NEW: Status fields from clinic_patients table
@JsonKey(name: 'current_followup_status') String? get currentFollowupStatus;@JsonKey(name: 'last_appointment_id') String? get lastAppointmentId;@JsonKey(name: 'last_followup_id') String? get lastFollowupId;// ✅ NEW: Full appointments array with all fields
@JsonKey(name: 'appointments') List<AppointmentDetail> get appointments;// ✅ NEW: Full follow-ups array with all fields
@JsonKey(name: 'follow_ups') List<FollowUpDetail> get followUps;// ✅ LEGACY: Appointment history fields (for backward compatibility)
@JsonKey(name: 'last_appointment') LastAppointmentInfo? get lastAppointment;@JsonKey(name: 'follow_up_eligibility') FollowUpEligibility? get followUpEligibility;@JsonKey(name: 'total_appointments') int get totalAppointments;// ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
@JsonKey(name: 'appointments_history') List<AppointmentHistoryItem> get appointmentsHistory;@JsonKey(name: 'eligible_follow_ups') List<EligibleFollowUp> get eligibleFollowUps;// ✅ LEGACY: Expired follow-ups that need renewal
@JsonKey(name: 'expired_followups') List<ExpiredFollowUp> get expiredFollowups;
/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicPatientCopyWith<ClinicPatient> get copyWith => _$ClinicPatientCopyWithImpl<ClinicPatient>(this as ClinicPatient, _$identity);

  /// Serializes this ClinicPatient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicPatient&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.district, district) || other.district == district)&&(identical(other.state, state) || other.state == state)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.medicalHistory, medicalHistory) || other.medicalHistory == medicalHistory)&&(identical(other.allergies, allergies) || other.allergies == allergies)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.globalPatientId, globalPatientId) || other.globalPatientId == globalPatientId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currentFollowupStatus, currentFollowupStatus) || other.currentFollowupStatus == currentFollowupStatus)&&(identical(other.lastAppointmentId, lastAppointmentId) || other.lastAppointmentId == lastAppointmentId)&&(identical(other.lastFollowupId, lastFollowupId) || other.lastFollowupId == lastFollowupId)&&const DeepCollectionEquality().equals(other.appointments, appointments)&&const DeepCollectionEquality().equals(other.followUps, followUps)&&(identical(other.lastAppointment, lastAppointment) || other.lastAppointment == lastAppointment)&&(identical(other.followUpEligibility, followUpEligibility) || other.followUpEligibility == followUpEligibility)&&(identical(other.totalAppointments, totalAppointments) || other.totalAppointments == totalAppointments)&&const DeepCollectionEquality().equals(other.appointmentsHistory, appointmentsHistory)&&const DeepCollectionEquality().equals(other.eligibleFollowUps, eligibleFollowUps)&&const DeepCollectionEquality().equals(other.expiredFollowups, expiredFollowups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clinicId,firstName,lastName,phone,email,dateOfBirth,age,gender,address,address1,address2,district,state,moId,medicalHistory,allergies,bloodGroup,smokingStatus,alcoholUse,heightCm,weightKg,isActive,globalPatientId,createdAt,updatedAt,currentFollowupStatus,lastAppointmentId,lastFollowupId,const DeepCollectionEquality().hash(appointments),const DeepCollectionEquality().hash(followUps),lastAppointment,followUpEligibility,totalAppointments,const DeepCollectionEquality().hash(appointmentsHistory),const DeepCollectionEquality().hash(eligibleFollowUps),const DeepCollectionEquality().hash(expiredFollowups)]);

@override
String toString() {
  return 'ClinicPatient(id: $id, clinicId: $clinicId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, address: $address, address1: $address1, address2: $address2, district: $district, state: $state, moId: $moId, medicalHistory: $medicalHistory, allergies: $allergies, bloodGroup: $bloodGroup, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, heightCm: $heightCm, weightKg: $weightKg, isActive: $isActive, globalPatientId: $globalPatientId, createdAt: $createdAt, updatedAt: $updatedAt, currentFollowupStatus: $currentFollowupStatus, lastAppointmentId: $lastAppointmentId, lastFollowupId: $lastFollowupId, appointments: $appointments, followUps: $followUps, lastAppointment: $lastAppointment, followUpEligibility: $followUpEligibility, totalAppointments: $totalAppointments, appointmentsHistory: $appointmentsHistory, eligibleFollowUps: $eligibleFollowUps, expiredFollowups: $expiredFollowups)';
}


}

/// @nodoc
abstract mixin class $ClinicPatientCopyWith<$Res>  {
  factory $ClinicPatientCopyWith(ClinicPatient value, $Res Function(ClinicPatient) _then) = _$ClinicPatientCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String phone, String? email,@JsonKey(name: 'date_of_birth') String? dateOfBirth, int? age, String? gender, String? address, String? address1, String? address2, String? district, String? state,@JsonKey(name: 'mo_id') String? moId,@JsonKey(name: 'medical_history') String? medicalHistory, String? allergies,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') int? weightKg,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'global_patient_id') String? globalPatientId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'current_followup_status') String? currentFollowupStatus,@JsonKey(name: 'last_appointment_id') String? lastAppointmentId,@JsonKey(name: 'last_followup_id') String? lastFollowupId,@JsonKey(name: 'appointments') List<AppointmentDetail> appointments,@JsonKey(name: 'follow_ups') List<FollowUpDetail> followUps,@JsonKey(name: 'last_appointment') LastAppointmentInfo? lastAppointment,@JsonKey(name: 'follow_up_eligibility') FollowUpEligibility? followUpEligibility,@JsonKey(name: 'total_appointments') int totalAppointments,@JsonKey(name: 'appointments_history') List<AppointmentHistoryItem> appointmentsHistory,@JsonKey(name: 'eligible_follow_ups') List<EligibleFollowUp> eligibleFollowUps,@JsonKey(name: 'expired_followups') List<ExpiredFollowUp> expiredFollowups
});


$LastAppointmentInfoCopyWith<$Res>? get lastAppointment;$FollowUpEligibilityCopyWith<$Res>? get followUpEligibility;

}
/// @nodoc
class _$ClinicPatientCopyWithImpl<$Res>
    implements $ClinicPatientCopyWith<$Res> {
  _$ClinicPatientCopyWithImpl(this._self, this._then);

  final ClinicPatient _self;
  final $Res Function(ClinicPatient) _then;

/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clinicId = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = freezed,Object? dateOfBirth = freezed,Object? age = freezed,Object? gender = freezed,Object? address = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? district = freezed,Object? state = freezed,Object? moId = freezed,Object? medicalHistory = freezed,Object? allergies = freezed,Object? bloodGroup = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? isActive = null,Object? globalPatientId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? currentFollowupStatus = freezed,Object? lastAppointmentId = freezed,Object? lastFollowupId = freezed,Object? appointments = null,Object? followUps = null,Object? lastAppointment = freezed,Object? followUpEligibility = freezed,Object? totalAppointments = null,Object? appointmentsHistory = null,Object? eligibleFollowUps = null,Object? expiredFollowups = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,medicalHistory: freezed == medicalHistory ? _self.medicalHistory : medicalHistory // ignore: cast_nullable_to_non_nullable
as String?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,globalPatientId: freezed == globalPatientId ? _self.globalPatientId : globalPatientId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,currentFollowupStatus: freezed == currentFollowupStatus ? _self.currentFollowupStatus : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
as String?,lastAppointmentId: freezed == lastAppointmentId ? _self.lastAppointmentId : lastAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,lastFollowupId: freezed == lastFollowupId ? _self.lastFollowupId : lastFollowupId // ignore: cast_nullable_to_non_nullable
as String?,appointments: null == appointments ? _self.appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentDetail>,followUps: null == followUps ? _self.followUps : followUps // ignore: cast_nullable_to_non_nullable
as List<FollowUpDetail>,lastAppointment: freezed == lastAppointment ? _self.lastAppointment : lastAppointment // ignore: cast_nullable_to_non_nullable
as LastAppointmentInfo?,followUpEligibility: freezed == followUpEligibility ? _self.followUpEligibility : followUpEligibility // ignore: cast_nullable_to_non_nullable
as FollowUpEligibility?,totalAppointments: null == totalAppointments ? _self.totalAppointments : totalAppointments // ignore: cast_nullable_to_non_nullable
as int,appointmentsHistory: null == appointmentsHistory ? _self.appointmentsHistory : appointmentsHistory // ignore: cast_nullable_to_non_nullable
as List<AppointmentHistoryItem>,eligibleFollowUps: null == eligibleFollowUps ? _self.eligibleFollowUps : eligibleFollowUps // ignore: cast_nullable_to_non_nullable
as List<EligibleFollowUp>,expiredFollowups: null == expiredFollowups ? _self.expiredFollowups : expiredFollowups // ignore: cast_nullable_to_non_nullable
as List<ExpiredFollowUp>,
  ));
}
/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LastAppointmentInfoCopyWith<$Res>? get lastAppointment {
    if (_self.lastAppointment == null) {
    return null;
  }

  return $LastAppointmentInfoCopyWith<$Res>(_self.lastAppointment!, (value) {
    return _then(_self.copyWith(lastAppointment: value));
  });
}/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpEligibilityCopyWith<$Res>? get followUpEligibility {
    if (_self.followUpEligibility == null) {
    return null;
  }

  return $FollowUpEligibilityCopyWith<$Res>(_self.followUpEligibility!, (value) {
    return _then(_self.copyWith(followUpEligibility: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClinicPatient].
extension ClinicPatientPatterns on ClinicPatient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicPatient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicPatient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicPatient value)  $default,){
final _that = this;
switch (_that) {
case _ClinicPatient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicPatient value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicPatient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone,  String? email, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  int? age,  String? gender,  String? address,  String? address1,  String? address2,  String? district,  String? state, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'medical_history')  String? medicalHistory,  String? allergies, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  int? weightKg, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'global_patient_id')  String? globalPatientId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'current_followup_status')  String? currentFollowupStatus, @JsonKey(name: 'last_appointment_id')  String? lastAppointmentId, @JsonKey(name: 'last_followup_id')  String? lastFollowupId, @JsonKey(name: 'appointments')  List<AppointmentDetail> appointments, @JsonKey(name: 'follow_ups')  List<FollowUpDetail> followUps, @JsonKey(name: 'last_appointment')  LastAppointmentInfo? lastAppointment, @JsonKey(name: 'follow_up_eligibility')  FollowUpEligibility? followUpEligibility, @JsonKey(name: 'total_appointments')  int totalAppointments, @JsonKey(name: 'appointments_history')  List<AppointmentHistoryItem> appointmentsHistory, @JsonKey(name: 'eligible_follow_ups')  List<EligibleFollowUp> eligibleFollowUps, @JsonKey(name: 'expired_followups')  List<ExpiredFollowUp> expiredFollowups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicPatient() when $default != null:
return $default(_that.id,_that.clinicId,_that.firstName,_that.lastName,_that.phone,_that.email,_that.dateOfBirth,_that.age,_that.gender,_that.address,_that.address1,_that.address2,_that.district,_that.state,_that.moId,_that.medicalHistory,_that.allergies,_that.bloodGroup,_that.smokingStatus,_that.alcoholUse,_that.heightCm,_that.weightKg,_that.isActive,_that.globalPatientId,_that.createdAt,_that.updatedAt,_that.currentFollowupStatus,_that.lastAppointmentId,_that.lastFollowupId,_that.appointments,_that.followUps,_that.lastAppointment,_that.followUpEligibility,_that.totalAppointments,_that.appointmentsHistory,_that.eligibleFollowUps,_that.expiredFollowups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone,  String? email, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  int? age,  String? gender,  String? address,  String? address1,  String? address2,  String? district,  String? state, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'medical_history')  String? medicalHistory,  String? allergies, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  int? weightKg, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'global_patient_id')  String? globalPatientId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'current_followup_status')  String? currentFollowupStatus, @JsonKey(name: 'last_appointment_id')  String? lastAppointmentId, @JsonKey(name: 'last_followup_id')  String? lastFollowupId, @JsonKey(name: 'appointments')  List<AppointmentDetail> appointments, @JsonKey(name: 'follow_ups')  List<FollowUpDetail> followUps, @JsonKey(name: 'last_appointment')  LastAppointmentInfo? lastAppointment, @JsonKey(name: 'follow_up_eligibility')  FollowUpEligibility? followUpEligibility, @JsonKey(name: 'total_appointments')  int totalAppointments, @JsonKey(name: 'appointments_history')  List<AppointmentHistoryItem> appointmentsHistory, @JsonKey(name: 'eligible_follow_ups')  List<EligibleFollowUp> eligibleFollowUps, @JsonKey(name: 'expired_followups')  List<ExpiredFollowUp> expiredFollowups)  $default,) {final _that = this;
switch (_that) {
case _ClinicPatient():
return $default(_that.id,_that.clinicId,_that.firstName,_that.lastName,_that.phone,_that.email,_that.dateOfBirth,_that.age,_that.gender,_that.address,_that.address1,_that.address2,_that.district,_that.state,_that.moId,_that.medicalHistory,_that.allergies,_that.bloodGroup,_that.smokingStatus,_that.alcoholUse,_that.heightCm,_that.weightKg,_that.isActive,_that.globalPatientId,_that.createdAt,_that.updatedAt,_that.currentFollowupStatus,_that.lastAppointmentId,_that.lastFollowupId,_that.appointments,_that.followUps,_that.lastAppointment,_that.followUpEligibility,_that.totalAppointments,_that.appointmentsHistory,_that.eligibleFollowUps,_that.expiredFollowups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone,  String? email, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  int? age,  String? gender,  String? address,  String? address1,  String? address2,  String? district,  String? state, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'medical_history')  String? medicalHistory,  String? allergies, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  int? weightKg, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'global_patient_id')  String? globalPatientId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'current_followup_status')  String? currentFollowupStatus, @JsonKey(name: 'last_appointment_id')  String? lastAppointmentId, @JsonKey(name: 'last_followup_id')  String? lastFollowupId, @JsonKey(name: 'appointments')  List<AppointmentDetail> appointments, @JsonKey(name: 'follow_ups')  List<FollowUpDetail> followUps, @JsonKey(name: 'last_appointment')  LastAppointmentInfo? lastAppointment, @JsonKey(name: 'follow_up_eligibility')  FollowUpEligibility? followUpEligibility, @JsonKey(name: 'total_appointments')  int totalAppointments, @JsonKey(name: 'appointments_history')  List<AppointmentHistoryItem> appointmentsHistory, @JsonKey(name: 'eligible_follow_ups')  List<EligibleFollowUp> eligibleFollowUps, @JsonKey(name: 'expired_followups')  List<ExpiredFollowUp> expiredFollowups)?  $default,) {final _that = this;
switch (_that) {
case _ClinicPatient() when $default != null:
return $default(_that.id,_that.clinicId,_that.firstName,_that.lastName,_that.phone,_that.email,_that.dateOfBirth,_that.age,_that.gender,_that.address,_that.address1,_that.address2,_that.district,_that.state,_that.moId,_that.medicalHistory,_that.allergies,_that.bloodGroup,_that.smokingStatus,_that.alcoholUse,_that.heightCm,_that.weightKg,_that.isActive,_that.globalPatientId,_that.createdAt,_that.updatedAt,_that.currentFollowupStatus,_that.lastAppointmentId,_that.lastFollowupId,_that.appointments,_that.followUps,_that.lastAppointment,_that.followUpEligibility,_that.totalAppointments,_that.appointmentsHistory,_that.eligibleFollowUps,_that.expiredFollowups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicPatient implements ClinicPatient {
  const _ClinicPatient({required this.id, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.phone, this.email, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.age, this.gender, this.address, this.address1, this.address2, this.district, this.state, @JsonKey(name: 'mo_id') this.moId, @JsonKey(name: 'medical_history') this.medicalHistory, this.allergies, @JsonKey(name: 'blood_group') this.bloodGroup, @JsonKey(name: 'smoking_status') this.smokingStatus, @JsonKey(name: 'alcohol_use') this.alcoholUse, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'weight_kg') this.weightKg, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'global_patient_id') this.globalPatientId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'current_followup_status') this.currentFollowupStatus, @JsonKey(name: 'last_appointment_id') this.lastAppointmentId, @JsonKey(name: 'last_followup_id') this.lastFollowupId, @JsonKey(name: 'appointments') final  List<AppointmentDetail> appointments = const [], @JsonKey(name: 'follow_ups') final  List<FollowUpDetail> followUps = const [], @JsonKey(name: 'last_appointment') this.lastAppointment, @JsonKey(name: 'follow_up_eligibility') this.followUpEligibility, @JsonKey(name: 'total_appointments') this.totalAppointments = 0, @JsonKey(name: 'appointments_history') final  List<AppointmentHistoryItem> appointmentsHistory = const [], @JsonKey(name: 'eligible_follow_ups') final  List<EligibleFollowUp> eligibleFollowUps = const [], @JsonKey(name: 'expired_followups') final  List<ExpiredFollowUp> expiredFollowups = const []}): _appointments = appointments,_followUps = followUps,_appointmentsHistory = appointmentsHistory,_eligibleFollowUps = eligibleFollowUps,_expiredFollowups = expiredFollowups;
  factory _ClinicPatient.fromJson(Map<String, dynamic> json) => _$ClinicPatientFromJson(json);

@override final  String id;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String phone;
@override final  String? email;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override final  int? age;
@override final  String? gender;
@override final  String? address;
@override final  String? address1;
@override final  String? address2;
@override final  String? district;
@override final  String? state;
@override@JsonKey(name: 'mo_id') final  String? moId;
@override@JsonKey(name: 'medical_history') final  String? medicalHistory;
@override final  String? allergies;
@override@JsonKey(name: 'blood_group') final  String? bloodGroup;
@override@JsonKey(name: 'smoking_status') final  String? smokingStatus;
@override@JsonKey(name: 'alcohol_use') final  String? alcoholUse;
@override@JsonKey(name: 'height_cm') final  int? heightCm;
@override@JsonKey(name: 'weight_kg') final  int? weightKg;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'global_patient_id') final  String? globalPatientId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
// ✅ NEW: Status fields from clinic_patients table
@override@JsonKey(name: 'current_followup_status') final  String? currentFollowupStatus;
@override@JsonKey(name: 'last_appointment_id') final  String? lastAppointmentId;
@override@JsonKey(name: 'last_followup_id') final  String? lastFollowupId;
// ✅ NEW: Full appointments array with all fields
 final  List<AppointmentDetail> _appointments;
// ✅ NEW: Full appointments array with all fields
@override@JsonKey(name: 'appointments') List<AppointmentDetail> get appointments {
  if (_appointments is EqualUnmodifiableListView) return _appointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointments);
}

// ✅ NEW: Full follow-ups array with all fields
 final  List<FollowUpDetail> _followUps;
// ✅ NEW: Full follow-ups array with all fields
@override@JsonKey(name: 'follow_ups') List<FollowUpDetail> get followUps {
  if (_followUps is EqualUnmodifiableListView) return _followUps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_followUps);
}

// ✅ LEGACY: Appointment history fields (for backward compatibility)
@override@JsonKey(name: 'last_appointment') final  LastAppointmentInfo? lastAppointment;
@override@JsonKey(name: 'follow_up_eligibility') final  FollowUpEligibility? followUpEligibility;
@override@JsonKey(name: 'total_appointments') final  int totalAppointments;
// ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
 final  List<AppointmentHistoryItem> _appointmentsHistory;
// ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
@override@JsonKey(name: 'appointments_history') List<AppointmentHistoryItem> get appointmentsHistory {
  if (_appointmentsHistory is EqualUnmodifiableListView) return _appointmentsHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointmentsHistory);
}

 final  List<EligibleFollowUp> _eligibleFollowUps;
@override@JsonKey(name: 'eligible_follow_ups') List<EligibleFollowUp> get eligibleFollowUps {
  if (_eligibleFollowUps is EqualUnmodifiableListView) return _eligibleFollowUps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eligibleFollowUps);
}

// ✅ LEGACY: Expired follow-ups that need renewal
 final  List<ExpiredFollowUp> _expiredFollowups;
// ✅ LEGACY: Expired follow-ups that need renewal
@override@JsonKey(name: 'expired_followups') List<ExpiredFollowUp> get expiredFollowups {
  if (_expiredFollowups is EqualUnmodifiableListView) return _expiredFollowups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expiredFollowups);
}


/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicPatientCopyWith<_ClinicPatient> get copyWith => __$ClinicPatientCopyWithImpl<_ClinicPatient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicPatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicPatient&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.district, district) || other.district == district)&&(identical(other.state, state) || other.state == state)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.medicalHistory, medicalHistory) || other.medicalHistory == medicalHistory)&&(identical(other.allergies, allergies) || other.allergies == allergies)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.globalPatientId, globalPatientId) || other.globalPatientId == globalPatientId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currentFollowupStatus, currentFollowupStatus) || other.currentFollowupStatus == currentFollowupStatus)&&(identical(other.lastAppointmentId, lastAppointmentId) || other.lastAppointmentId == lastAppointmentId)&&(identical(other.lastFollowupId, lastFollowupId) || other.lastFollowupId == lastFollowupId)&&const DeepCollectionEquality().equals(other._appointments, _appointments)&&const DeepCollectionEquality().equals(other._followUps, _followUps)&&(identical(other.lastAppointment, lastAppointment) || other.lastAppointment == lastAppointment)&&(identical(other.followUpEligibility, followUpEligibility) || other.followUpEligibility == followUpEligibility)&&(identical(other.totalAppointments, totalAppointments) || other.totalAppointments == totalAppointments)&&const DeepCollectionEquality().equals(other._appointmentsHistory, _appointmentsHistory)&&const DeepCollectionEquality().equals(other._eligibleFollowUps, _eligibleFollowUps)&&const DeepCollectionEquality().equals(other._expiredFollowups, _expiredFollowups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clinicId,firstName,lastName,phone,email,dateOfBirth,age,gender,address,address1,address2,district,state,moId,medicalHistory,allergies,bloodGroup,smokingStatus,alcoholUse,heightCm,weightKg,isActive,globalPatientId,createdAt,updatedAt,currentFollowupStatus,lastAppointmentId,lastFollowupId,const DeepCollectionEquality().hash(_appointments),const DeepCollectionEquality().hash(_followUps),lastAppointment,followUpEligibility,totalAppointments,const DeepCollectionEquality().hash(_appointmentsHistory),const DeepCollectionEquality().hash(_eligibleFollowUps),const DeepCollectionEquality().hash(_expiredFollowups)]);

@override
String toString() {
  return 'ClinicPatient(id: $id, clinicId: $clinicId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, address: $address, address1: $address1, address2: $address2, district: $district, state: $state, moId: $moId, medicalHistory: $medicalHistory, allergies: $allergies, bloodGroup: $bloodGroup, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, heightCm: $heightCm, weightKg: $weightKg, isActive: $isActive, globalPatientId: $globalPatientId, createdAt: $createdAt, updatedAt: $updatedAt, currentFollowupStatus: $currentFollowupStatus, lastAppointmentId: $lastAppointmentId, lastFollowupId: $lastFollowupId, appointments: $appointments, followUps: $followUps, lastAppointment: $lastAppointment, followUpEligibility: $followUpEligibility, totalAppointments: $totalAppointments, appointmentsHistory: $appointmentsHistory, eligibleFollowUps: $eligibleFollowUps, expiredFollowups: $expiredFollowups)';
}


}

/// @nodoc
abstract mixin class _$ClinicPatientCopyWith<$Res> implements $ClinicPatientCopyWith<$Res> {
  factory _$ClinicPatientCopyWith(_ClinicPatient value, $Res Function(_ClinicPatient) _then) = __$ClinicPatientCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String phone, String? email,@JsonKey(name: 'date_of_birth') String? dateOfBirth, int? age, String? gender, String? address, String? address1, String? address2, String? district, String? state,@JsonKey(name: 'mo_id') String? moId,@JsonKey(name: 'medical_history') String? medicalHistory, String? allergies,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') int? weightKg,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'global_patient_id') String? globalPatientId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'current_followup_status') String? currentFollowupStatus,@JsonKey(name: 'last_appointment_id') String? lastAppointmentId,@JsonKey(name: 'last_followup_id') String? lastFollowupId,@JsonKey(name: 'appointments') List<AppointmentDetail> appointments,@JsonKey(name: 'follow_ups') List<FollowUpDetail> followUps,@JsonKey(name: 'last_appointment') LastAppointmentInfo? lastAppointment,@JsonKey(name: 'follow_up_eligibility') FollowUpEligibility? followUpEligibility,@JsonKey(name: 'total_appointments') int totalAppointments,@JsonKey(name: 'appointments_history') List<AppointmentHistoryItem> appointmentsHistory,@JsonKey(name: 'eligible_follow_ups') List<EligibleFollowUp> eligibleFollowUps,@JsonKey(name: 'expired_followups') List<ExpiredFollowUp> expiredFollowups
});


@override $LastAppointmentInfoCopyWith<$Res>? get lastAppointment;@override $FollowUpEligibilityCopyWith<$Res>? get followUpEligibility;

}
/// @nodoc
class __$ClinicPatientCopyWithImpl<$Res>
    implements _$ClinicPatientCopyWith<$Res> {
  __$ClinicPatientCopyWithImpl(this._self, this._then);

  final _ClinicPatient _self;
  final $Res Function(_ClinicPatient) _then;

/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clinicId = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = freezed,Object? dateOfBirth = freezed,Object? age = freezed,Object? gender = freezed,Object? address = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? district = freezed,Object? state = freezed,Object? moId = freezed,Object? medicalHistory = freezed,Object? allergies = freezed,Object? bloodGroup = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? isActive = null,Object? globalPatientId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? currentFollowupStatus = freezed,Object? lastAppointmentId = freezed,Object? lastFollowupId = freezed,Object? appointments = null,Object? followUps = null,Object? lastAppointment = freezed,Object? followUpEligibility = freezed,Object? totalAppointments = null,Object? appointmentsHistory = null,Object? eligibleFollowUps = null,Object? expiredFollowups = null,}) {
  return _then(_ClinicPatient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,medicalHistory: freezed == medicalHistory ? _self.medicalHistory : medicalHistory // ignore: cast_nullable_to_non_nullable
as String?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,globalPatientId: freezed == globalPatientId ? _self.globalPatientId : globalPatientId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,currentFollowupStatus: freezed == currentFollowupStatus ? _self.currentFollowupStatus : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
as String?,lastAppointmentId: freezed == lastAppointmentId ? _self.lastAppointmentId : lastAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,lastFollowupId: freezed == lastFollowupId ? _self.lastFollowupId : lastFollowupId // ignore: cast_nullable_to_non_nullable
as String?,appointments: null == appointments ? _self._appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentDetail>,followUps: null == followUps ? _self._followUps : followUps // ignore: cast_nullable_to_non_nullable
as List<FollowUpDetail>,lastAppointment: freezed == lastAppointment ? _self.lastAppointment : lastAppointment // ignore: cast_nullable_to_non_nullable
as LastAppointmentInfo?,followUpEligibility: freezed == followUpEligibility ? _self.followUpEligibility : followUpEligibility // ignore: cast_nullable_to_non_nullable
as FollowUpEligibility?,totalAppointments: null == totalAppointments ? _self.totalAppointments : totalAppointments // ignore: cast_nullable_to_non_nullable
as int,appointmentsHistory: null == appointmentsHistory ? _self._appointmentsHistory : appointmentsHistory // ignore: cast_nullable_to_non_nullable
as List<AppointmentHistoryItem>,eligibleFollowUps: null == eligibleFollowUps ? _self._eligibleFollowUps : eligibleFollowUps // ignore: cast_nullable_to_non_nullable
as List<EligibleFollowUp>,expiredFollowups: null == expiredFollowups ? _self._expiredFollowups : expiredFollowups // ignore: cast_nullable_to_non_nullable
as List<ExpiredFollowUp>,
  ));
}

/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LastAppointmentInfoCopyWith<$Res>? get lastAppointment {
    if (_self.lastAppointment == null) {
    return null;
  }

  return $LastAppointmentInfoCopyWith<$Res>(_self.lastAppointment!, (value) {
    return _then(_self.copyWith(lastAppointment: value));
  });
}/// Create a copy of ClinicPatient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpEligibilityCopyWith<$Res>? get followUpEligibility {
    if (_self.followUpEligibility == null) {
    return null;
  }

  return $FollowUpEligibilityCopyWith<$Res>(_self.followUpEligibility!, (value) {
    return _then(_self.copyWith(followUpEligibility: value));
  });
}
}


/// @nodoc
mixin _$LastAppointmentInfo {

 String get id;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String get doctorName;@JsonKey(name: 'department_id') String? get departmentId; String? get department; String get date; String? get status;@JsonKey(name: 'days_since') int get daysSince;
/// Create a copy of LastAppointmentInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastAppointmentInfoCopyWith<LastAppointmentInfo> get copyWith => _$LastAppointmentInfoCopyWithImpl<LastAppointmentInfo>(this as LastAppointmentInfo, _$identity);

  /// Serializes this LastAppointmentInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastAppointmentInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.department, department) || other.department == department)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.daysSince, daysSince) || other.daysSince == daysSince));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,doctorName,departmentId,department,date,status,daysSince);

@override
String toString() {
  return 'LastAppointmentInfo(id: $id, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, date: $date, status: $status, daysSince: $daysSince)';
}


}

/// @nodoc
abstract mixin class $LastAppointmentInfoCopyWith<$Res>  {
  factory $LastAppointmentInfoCopyWith(LastAppointmentInfo value, $Res Function(LastAppointmentInfo) _then) = _$LastAppointmentInfoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId, String? department, String date, String? status,@JsonKey(name: 'days_since') int daysSince
});




}
/// @nodoc
class _$LastAppointmentInfoCopyWithImpl<$Res>
    implements $LastAppointmentInfoCopyWith<$Res> {
  _$LastAppointmentInfoCopyWithImpl(this._self, this._then);

  final LastAppointmentInfo _self;
  final $Res Function(LastAppointmentInfo) _then;

/// Create a copy of LastAppointmentInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? department = freezed,Object? date = null,Object? status = freezed,Object? daysSince = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,daysSince: null == daysSince ? _self.daysSince : daysSince // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LastAppointmentInfo].
extension LastAppointmentInfoPatterns on LastAppointmentInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LastAppointmentInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LastAppointmentInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LastAppointmentInfo value)  $default,){
final _that = this;
switch (_that) {
case _LastAppointmentInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LastAppointmentInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LastAppointmentInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String? department,  String date,  String? status, @JsonKey(name: 'days_since')  int daysSince)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LastAppointmentInfo() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.date,_that.status,_that.daysSince);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String? department,  String date,  String? status, @JsonKey(name: 'days_since')  int daysSince)  $default,) {final _that = this;
switch (_that) {
case _LastAppointmentInfo():
return $default(_that.id,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.date,_that.status,_that.daysSince);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String? department,  String date,  String? status, @JsonKey(name: 'days_since')  int daysSince)?  $default,) {final _that = this;
switch (_that) {
case _LastAppointmentInfo() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.date,_that.status,_that.daysSince);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LastAppointmentInfo implements LastAppointmentInfo {
  const _LastAppointmentInfo({required this.id, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') required this.doctorName, @JsonKey(name: 'department_id') this.departmentId, this.department, required this.date, this.status, @JsonKey(name: 'days_since') required this.daysSince});
  factory _LastAppointmentInfo.fromJson(Map<String, dynamic> json) => _$LastAppointmentInfoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String doctorName;
@override@JsonKey(name: 'department_id') final  String? departmentId;
@override final  String? department;
@override final  String date;
@override final  String? status;
@override@JsonKey(name: 'days_since') final  int daysSince;

/// Create a copy of LastAppointmentInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastAppointmentInfoCopyWith<_LastAppointmentInfo> get copyWith => __$LastAppointmentInfoCopyWithImpl<_LastAppointmentInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LastAppointmentInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastAppointmentInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.department, department) || other.department == department)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.daysSince, daysSince) || other.daysSince == daysSince));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,doctorName,departmentId,department,date,status,daysSince);

@override
String toString() {
  return 'LastAppointmentInfo(id: $id, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, date: $date, status: $status, daysSince: $daysSince)';
}


}

/// @nodoc
abstract mixin class _$LastAppointmentInfoCopyWith<$Res> implements $LastAppointmentInfoCopyWith<$Res> {
  factory _$LastAppointmentInfoCopyWith(_LastAppointmentInfo value, $Res Function(_LastAppointmentInfo) _then) = __$LastAppointmentInfoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId, String? department, String date, String? status,@JsonKey(name: 'days_since') int daysSince
});




}
/// @nodoc
class __$LastAppointmentInfoCopyWithImpl<$Res>
    implements _$LastAppointmentInfoCopyWith<$Res> {
  __$LastAppointmentInfoCopyWithImpl(this._self, this._then);

  final _LastAppointmentInfo _self;
  final $Res Function(_LastAppointmentInfo) _then;

/// Create a copy of LastAppointmentInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? department = freezed,Object? date = null,Object? status = freezed,Object? daysSince = null,}) {
  return _then(_LastAppointmentInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,daysSince: null == daysSince ? _self.daysSince : daysSince // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FollowUpEligibility {

 bool get eligible;@JsonKey(name: 'is_free') bool get isFree;// ✅ NEW: Is follow-up free?
 String? get reason;@JsonKey(name: 'days_remaining') int? get daysRemaining; String? get message;
/// Create a copy of FollowUpEligibility
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowUpEligibilityCopyWith<FollowUpEligibility> get copyWith => _$FollowUpEligibilityCopyWithImpl<FollowUpEligibility>(this as FollowUpEligibility, _$identity);

  /// Serializes this FollowUpEligibility to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowUpEligibility&&(identical(other.eligible, eligible) || other.eligible == eligible)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eligible,isFree,reason,daysRemaining,message);

@override
String toString() {
  return 'FollowUpEligibility(eligible: $eligible, isFree: $isFree, reason: $reason, daysRemaining: $daysRemaining, message: $message)';
}


}

/// @nodoc
abstract mixin class $FollowUpEligibilityCopyWith<$Res>  {
  factory $FollowUpEligibilityCopyWith(FollowUpEligibility value, $Res Function(FollowUpEligibility) _then) = _$FollowUpEligibilityCopyWithImpl;
@useResult
$Res call({
 bool eligible,@JsonKey(name: 'is_free') bool isFree, String? reason,@JsonKey(name: 'days_remaining') int? daysRemaining, String? message
});




}
/// @nodoc
class _$FollowUpEligibilityCopyWithImpl<$Res>
    implements $FollowUpEligibilityCopyWith<$Res> {
  _$FollowUpEligibilityCopyWithImpl(this._self, this._then);

  final FollowUpEligibility _self;
  final $Res Function(FollowUpEligibility) _then;

/// Create a copy of FollowUpEligibility
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eligible = null,Object? isFree = null,Object? reason = freezed,Object? daysRemaining = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
eligible: null == eligible ? _self.eligible : eligible // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowUpEligibility].
extension FollowUpEligibilityPatterns on FollowUpEligibility {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowUpEligibility value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowUpEligibility() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowUpEligibility value)  $default,){
final _that = this;
switch (_that) {
case _FollowUpEligibility():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowUpEligibility value)?  $default,){
final _that = this;
switch (_that) {
case _FollowUpEligibility() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool eligible, @JsonKey(name: 'is_free')  bool isFree,  String? reason, @JsonKey(name: 'days_remaining')  int? daysRemaining,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowUpEligibility() when $default != null:
return $default(_that.eligible,_that.isFree,_that.reason,_that.daysRemaining,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool eligible, @JsonKey(name: 'is_free')  bool isFree,  String? reason, @JsonKey(name: 'days_remaining')  int? daysRemaining,  String? message)  $default,) {final _that = this;
switch (_that) {
case _FollowUpEligibility():
return $default(_that.eligible,_that.isFree,_that.reason,_that.daysRemaining,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool eligible, @JsonKey(name: 'is_free')  bool isFree,  String? reason, @JsonKey(name: 'days_remaining')  int? daysRemaining,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _FollowUpEligibility() when $default != null:
return $default(_that.eligible,_that.isFree,_that.reason,_that.daysRemaining,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FollowUpEligibility implements FollowUpEligibility {
  const _FollowUpEligibility({required this.eligible, @JsonKey(name: 'is_free') this.isFree = false, this.reason, @JsonKey(name: 'days_remaining') this.daysRemaining, this.message});
  factory _FollowUpEligibility.fromJson(Map<String, dynamic> json) => _$FollowUpEligibilityFromJson(json);

@override final  bool eligible;
@override@JsonKey(name: 'is_free') final  bool isFree;
// ✅ NEW: Is follow-up free?
@override final  String? reason;
@override@JsonKey(name: 'days_remaining') final  int? daysRemaining;
@override final  String? message;

/// Create a copy of FollowUpEligibility
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowUpEligibilityCopyWith<_FollowUpEligibility> get copyWith => __$FollowUpEligibilityCopyWithImpl<_FollowUpEligibility>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowUpEligibilityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowUpEligibility&&(identical(other.eligible, eligible) || other.eligible == eligible)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eligible,isFree,reason,daysRemaining,message);

@override
String toString() {
  return 'FollowUpEligibility(eligible: $eligible, isFree: $isFree, reason: $reason, daysRemaining: $daysRemaining, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FollowUpEligibilityCopyWith<$Res> implements $FollowUpEligibilityCopyWith<$Res> {
  factory _$FollowUpEligibilityCopyWith(_FollowUpEligibility value, $Res Function(_FollowUpEligibility) _then) = __$FollowUpEligibilityCopyWithImpl;
@override @useResult
$Res call({
 bool eligible,@JsonKey(name: 'is_free') bool isFree, String? reason,@JsonKey(name: 'days_remaining') int? daysRemaining, String? message
});




}
/// @nodoc
class __$FollowUpEligibilityCopyWithImpl<$Res>
    implements _$FollowUpEligibilityCopyWith<$Res> {
  __$FollowUpEligibilityCopyWithImpl(this._self, this._then);

  final _FollowUpEligibility _self;
  final $Res Function(_FollowUpEligibility) _then;

/// Create a copy of FollowUpEligibility
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eligible = null,Object? isFree = null,Object? reason = freezed,Object? daysRemaining = freezed,Object? message = freezed,}) {
  return _then(_FollowUpEligibility(
eligible: null == eligible ? _self.eligible : eligible // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppointmentHistoryItem {

@JsonKey(name: 'appointment_id') String get appointmentId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String get doctorName;@JsonKey(name: 'department_id') String? get departmentId; String get department;@JsonKey(name: 'appointment_date') String get appointmentDate;@JsonKey(name: 'days_since') int get daysSince;@JsonKey(name: 'validity_days') int get validityDays;@JsonKey(name: 'remaining_days') int? get remainingDays; String get status;// active, expired, future
@JsonKey(name: 'follow_up_eligible') bool get followUpEligible;@JsonKey(name: 'free_follow_up_used') bool get freeFollowUpUsed;// ✅ NEW: Enhanced renewal tracking fields
@JsonKey(name: 'follow_up_status') String? get followUpStatus;// active, expired, used, waiting
@JsonKey(name: 'renewal_status') String? get renewalStatus;// valid, waiting, renewed
@JsonKey(name: 'next_followup_expiry') String? get nextFollowupExpiry;// ISO date
 String? get note;
/// Create a copy of AppointmentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentHistoryItemCopyWith<AppointmentHistoryItem> get copyWith => _$AppointmentHistoryItemCopyWithImpl<AppointmentHistoryItem>(this as AppointmentHistoryItem, _$identity);

  /// Serializes this AppointmentHistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryItem&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.department, department) || other.department == department)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.daysSince, daysSince) || other.daysSince == daysSince)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.status, status) || other.status == status)&&(identical(other.followUpEligible, followUpEligible) || other.followUpEligible == followUpEligible)&&(identical(other.freeFollowUpUsed, freeFollowUpUsed) || other.freeFollowUpUsed == freeFollowUpUsed)&&(identical(other.followUpStatus, followUpStatus) || other.followUpStatus == followUpStatus)&&(identical(other.renewalStatus, renewalStatus) || other.renewalStatus == renewalStatus)&&(identical(other.nextFollowupExpiry, nextFollowupExpiry) || other.nextFollowupExpiry == nextFollowupExpiry)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,doctorId,doctorName,departmentId,department,appointmentDate,daysSince,validityDays,remainingDays,status,followUpEligible,freeFollowUpUsed,followUpStatus,renewalStatus,nextFollowupExpiry,note);

@override
String toString() {
  return 'AppointmentHistoryItem(appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, appointmentDate: $appointmentDate, daysSince: $daysSince, validityDays: $validityDays, remainingDays: $remainingDays, status: $status, followUpEligible: $followUpEligible, freeFollowUpUsed: $freeFollowUpUsed, followUpStatus: $followUpStatus, renewalStatus: $renewalStatus, nextFollowupExpiry: $nextFollowupExpiry, note: $note)';
}


}

/// @nodoc
abstract mixin class $AppointmentHistoryItemCopyWith<$Res>  {
  factory $AppointmentHistoryItemCopyWith(AppointmentHistoryItem value, $Res Function(AppointmentHistoryItem) _then) = _$AppointmentHistoryItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId, String department,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'days_since') int daysSince,@JsonKey(name: 'validity_days') int validityDays,@JsonKey(name: 'remaining_days') int? remainingDays, String status,@JsonKey(name: 'follow_up_eligible') bool followUpEligible,@JsonKey(name: 'free_follow_up_used') bool freeFollowUpUsed,@JsonKey(name: 'follow_up_status') String? followUpStatus,@JsonKey(name: 'renewal_status') String? renewalStatus,@JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry, String? note
});




}
/// @nodoc
class _$AppointmentHistoryItemCopyWithImpl<$Res>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  _$AppointmentHistoryItemCopyWithImpl(this._self, this._then);

  final AppointmentHistoryItem _self;
  final $Res Function(AppointmentHistoryItem) _then;

/// Create a copy of AppointmentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appointmentId = null,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? department = null,Object? appointmentDate = null,Object? daysSince = null,Object? validityDays = null,Object? remainingDays = freezed,Object? status = null,Object? followUpEligible = null,Object? freeFollowUpUsed = null,Object? followUpStatus = freezed,Object? renewalStatus = freezed,Object? nextFollowupExpiry = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,daysSince: null == daysSince ? _self.daysSince : daysSince // ignore: cast_nullable_to_non_nullable
as int,validityDays: null == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,followUpEligible: null == followUpEligible ? _self.followUpEligible : followUpEligible // ignore: cast_nullable_to_non_nullable
as bool,freeFollowUpUsed: null == freeFollowUpUsed ? _self.freeFollowUpUsed : freeFollowUpUsed // ignore: cast_nullable_to_non_nullable
as bool,followUpStatus: freezed == followUpStatus ? _self.followUpStatus : followUpStatus // ignore: cast_nullable_to_non_nullable
as String?,renewalStatus: freezed == renewalStatus ? _self.renewalStatus : renewalStatus // ignore: cast_nullable_to_non_nullable
as String?,nextFollowupExpiry: freezed == nextFollowupExpiry ? _self.nextFollowupExpiry : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentHistoryItem].
extension AppointmentHistoryItemPatterns on AppointmentHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String department, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'days_since')  int daysSince, @JsonKey(name: 'validity_days')  int validityDays, @JsonKey(name: 'remaining_days')  int? remainingDays,  String status, @JsonKey(name: 'follow_up_eligible')  bool followUpEligible, @JsonKey(name: 'free_follow_up_used')  bool freeFollowUpUsed, @JsonKey(name: 'follow_up_status')  String? followUpStatus, @JsonKey(name: 'renewal_status')  String? renewalStatus, @JsonKey(name: 'next_followup_expiry')  String? nextFollowupExpiry,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentHistoryItem() when $default != null:
return $default(_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.appointmentDate,_that.daysSince,_that.validityDays,_that.remainingDays,_that.status,_that.followUpEligible,_that.freeFollowUpUsed,_that.followUpStatus,_that.renewalStatus,_that.nextFollowupExpiry,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String department, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'days_since')  int daysSince, @JsonKey(name: 'validity_days')  int validityDays, @JsonKey(name: 'remaining_days')  int? remainingDays,  String status, @JsonKey(name: 'follow_up_eligible')  bool followUpEligible, @JsonKey(name: 'free_follow_up_used')  bool freeFollowUpUsed, @JsonKey(name: 'follow_up_status')  String? followUpStatus, @JsonKey(name: 'renewal_status')  String? renewalStatus, @JsonKey(name: 'next_followup_expiry')  String? nextFollowupExpiry,  String? note)  $default,) {final _that = this;
switch (_that) {
case _AppointmentHistoryItem():
return $default(_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.appointmentDate,_that.daysSince,_that.validityDays,_that.remainingDays,_that.status,_that.followUpEligible,_that.freeFollowUpUsed,_that.followUpStatus,_that.renewalStatus,_that.nextFollowupExpiry,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String department, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'days_since')  int daysSince, @JsonKey(name: 'validity_days')  int validityDays, @JsonKey(name: 'remaining_days')  int? remainingDays,  String status, @JsonKey(name: 'follow_up_eligible')  bool followUpEligible, @JsonKey(name: 'free_follow_up_used')  bool freeFollowUpUsed, @JsonKey(name: 'follow_up_status')  String? followUpStatus, @JsonKey(name: 'renewal_status')  String? renewalStatus, @JsonKey(name: 'next_followup_expiry')  String? nextFollowupExpiry,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentHistoryItem() when $default != null:
return $default(_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.appointmentDate,_that.daysSince,_that.validityDays,_that.remainingDays,_that.status,_that.followUpEligible,_that.freeFollowUpUsed,_that.followUpStatus,_that.renewalStatus,_that.nextFollowupExpiry,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentHistoryItem implements AppointmentHistoryItem {
  const _AppointmentHistoryItem({@JsonKey(name: 'appointment_id') required this.appointmentId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') required this.doctorName, @JsonKey(name: 'department_id') this.departmentId, required this.department, @JsonKey(name: 'appointment_date') required this.appointmentDate, @JsonKey(name: 'days_since') required this.daysSince, @JsonKey(name: 'validity_days') this.validityDays = 5, @JsonKey(name: 'remaining_days') this.remainingDays, required this.status, @JsonKey(name: 'follow_up_eligible') this.followUpEligible = false, @JsonKey(name: 'free_follow_up_used') this.freeFollowUpUsed = false, @JsonKey(name: 'follow_up_status') this.followUpStatus, @JsonKey(name: 'renewal_status') this.renewalStatus, @JsonKey(name: 'next_followup_expiry') this.nextFollowupExpiry, this.note});
  factory _AppointmentHistoryItem.fromJson(Map<String, dynamic> json) => _$AppointmentHistoryItemFromJson(json);

@override@JsonKey(name: 'appointment_id') final  String appointmentId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String doctorName;
@override@JsonKey(name: 'department_id') final  String? departmentId;
@override final  String department;
@override@JsonKey(name: 'appointment_date') final  String appointmentDate;
@override@JsonKey(name: 'days_since') final  int daysSince;
@override@JsonKey(name: 'validity_days') final  int validityDays;
@override@JsonKey(name: 'remaining_days') final  int? remainingDays;
@override final  String status;
// active, expired, future
@override@JsonKey(name: 'follow_up_eligible') final  bool followUpEligible;
@override@JsonKey(name: 'free_follow_up_used') final  bool freeFollowUpUsed;
// ✅ NEW: Enhanced renewal tracking fields
@override@JsonKey(name: 'follow_up_status') final  String? followUpStatus;
// active, expired, used, waiting
@override@JsonKey(name: 'renewal_status') final  String? renewalStatus;
// valid, waiting, renewed
@override@JsonKey(name: 'next_followup_expiry') final  String? nextFollowupExpiry;
// ISO date
@override final  String? note;

/// Create a copy of AppointmentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentHistoryItemCopyWith<_AppointmentHistoryItem> get copyWith => __$AppointmentHistoryItemCopyWithImpl<_AppointmentHistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentHistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentHistoryItem&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.department, department) || other.department == department)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.daysSince, daysSince) || other.daysSince == daysSince)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.status, status) || other.status == status)&&(identical(other.followUpEligible, followUpEligible) || other.followUpEligible == followUpEligible)&&(identical(other.freeFollowUpUsed, freeFollowUpUsed) || other.freeFollowUpUsed == freeFollowUpUsed)&&(identical(other.followUpStatus, followUpStatus) || other.followUpStatus == followUpStatus)&&(identical(other.renewalStatus, renewalStatus) || other.renewalStatus == renewalStatus)&&(identical(other.nextFollowupExpiry, nextFollowupExpiry) || other.nextFollowupExpiry == nextFollowupExpiry)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,doctorId,doctorName,departmentId,department,appointmentDate,daysSince,validityDays,remainingDays,status,followUpEligible,freeFollowUpUsed,followUpStatus,renewalStatus,nextFollowupExpiry,note);

@override
String toString() {
  return 'AppointmentHistoryItem(appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, appointmentDate: $appointmentDate, daysSince: $daysSince, validityDays: $validityDays, remainingDays: $remainingDays, status: $status, followUpEligible: $followUpEligible, freeFollowUpUsed: $freeFollowUpUsed, followUpStatus: $followUpStatus, renewalStatus: $renewalStatus, nextFollowupExpiry: $nextFollowupExpiry, note: $note)';
}


}

/// @nodoc
abstract mixin class _$AppointmentHistoryItemCopyWith<$Res> implements $AppointmentHistoryItemCopyWith<$Res> {
  factory _$AppointmentHistoryItemCopyWith(_AppointmentHistoryItem value, $Res Function(_AppointmentHistoryItem) _then) = __$AppointmentHistoryItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId, String department,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'days_since') int daysSince,@JsonKey(name: 'validity_days') int validityDays,@JsonKey(name: 'remaining_days') int? remainingDays, String status,@JsonKey(name: 'follow_up_eligible') bool followUpEligible,@JsonKey(name: 'free_follow_up_used') bool freeFollowUpUsed,@JsonKey(name: 'follow_up_status') String? followUpStatus,@JsonKey(name: 'renewal_status') String? renewalStatus,@JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry, String? note
});




}
/// @nodoc
class __$AppointmentHistoryItemCopyWithImpl<$Res>
    implements _$AppointmentHistoryItemCopyWith<$Res> {
  __$AppointmentHistoryItemCopyWithImpl(this._self, this._then);

  final _AppointmentHistoryItem _self;
  final $Res Function(_AppointmentHistoryItem) _then;

/// Create a copy of AppointmentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appointmentId = null,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? department = null,Object? appointmentDate = null,Object? daysSince = null,Object? validityDays = null,Object? remainingDays = freezed,Object? status = null,Object? followUpEligible = null,Object? freeFollowUpUsed = null,Object? followUpStatus = freezed,Object? renewalStatus = freezed,Object? nextFollowupExpiry = freezed,Object? note = freezed,}) {
  return _then(_AppointmentHistoryItem(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,daysSince: null == daysSince ? _self.daysSince : daysSince // ignore: cast_nullable_to_non_nullable
as int,validityDays: null == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,followUpEligible: null == followUpEligible ? _self.followUpEligible : followUpEligible // ignore: cast_nullable_to_non_nullable
as bool,freeFollowUpUsed: null == freeFollowUpUsed ? _self.freeFollowUpUsed : freeFollowUpUsed // ignore: cast_nullable_to_non_nullable
as bool,followUpStatus: freezed == followUpStatus ? _self.followUpStatus : followUpStatus // ignore: cast_nullable_to_non_nullable
as String?,renewalStatus: freezed == renewalStatus ? _self.renewalStatus : renewalStatus // ignore: cast_nullable_to_non_nullable
as String?,nextFollowupExpiry: freezed == nextFollowupExpiry ? _self.nextFollowupExpiry : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EligibleFollowUp {

// ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
@JsonKey(name: 'followup_id') String? get followupId;// ✅ LEGACY: Source appointment ID (for backward compatibility)
@JsonKey(name: 'appointment_id') String? get appointmentId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String get doctorName;@JsonKey(name: 'department_id') String? get departmentId; String get department;// ✅ NEW TABLE-BASED: Valid from/until dates
@JsonKey(name: 'valid_from') String? get validFrom;@JsonKey(name: 'valid_until') String? get validUntil;// ✅ LEGACY: Appointment date (for backward compatibility)
@JsonKey(name: 'appointment_date') String? get appointmentDate;@JsonKey(name: 'remaining_days') int? get remainingDays;@JsonKey(name: 'days_remaining') int? get daysRemaining;// ✅ NEW: Alternative field name
// ✅ NEW TABLE-BASED: Status tracking
 String? get status;// active, used, expired, renewed
@JsonKey(name: 'is_free') bool? get isFree;// ✅ NEW: Explicitly track if free
// ✅ Enhanced renewal tracking
@JsonKey(name: 'next_followup_expiry') String? get nextFollowupExpiry;// ISO date
 String? get note; String? get message;
/// Create a copy of EligibleFollowUp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibleFollowUpCopyWith<EligibleFollowUp> get copyWith => _$EligibleFollowUpCopyWithImpl<EligibleFollowUp>(this as EligibleFollowUp, _$identity);

  /// Serializes this EligibleFollowUp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EligibleFollowUp&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.department, department) || other.department == department)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.nextFollowupExpiry, nextFollowupExpiry) || other.nextFollowupExpiry == nextFollowupExpiry)&&(identical(other.note, note) || other.note == note)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,appointmentId,doctorId,doctorName,departmentId,department,validFrom,validUntil,appointmentDate,remainingDays,daysRemaining,status,isFree,nextFollowupExpiry,note,message);

@override
String toString() {
  return 'EligibleFollowUp(followupId: $followupId, appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, validFrom: $validFrom, validUntil: $validUntil, appointmentDate: $appointmentDate, remainingDays: $remainingDays, daysRemaining: $daysRemaining, status: $status, isFree: $isFree, nextFollowupExpiry: $nextFollowupExpiry, note: $note, message: $message)';
}


}

/// @nodoc
abstract mixin class $EligibleFollowUpCopyWith<$Res>  {
  factory $EligibleFollowUpCopyWith(EligibleFollowUp value, $Res Function(EligibleFollowUp) _then) = _$EligibleFollowUpCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'followup_id') String? followupId,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId, String department,@JsonKey(name: 'valid_from') String? validFrom,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'appointment_date') String? appointmentDate,@JsonKey(name: 'remaining_days') int? remainingDays,@JsonKey(name: 'days_remaining') int? daysRemaining, String? status,@JsonKey(name: 'is_free') bool? isFree,@JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry, String? note, String? message
});




}
/// @nodoc
class _$EligibleFollowUpCopyWithImpl<$Res>
    implements $EligibleFollowUpCopyWith<$Res> {
  _$EligibleFollowUpCopyWithImpl(this._self, this._then);

  final EligibleFollowUp _self;
  final $Res Function(EligibleFollowUp) _then;

/// Create a copy of EligibleFollowUp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followupId = freezed,Object? appointmentId = freezed,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? department = null,Object? validFrom = freezed,Object? validUntil = freezed,Object? appointmentDate = freezed,Object? remainingDays = freezed,Object? daysRemaining = freezed,Object? status = freezed,Object? isFree = freezed,Object? nextFollowupExpiry = freezed,Object? note = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
followupId: freezed == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,validFrom: freezed == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,appointmentDate: freezed == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,nextFollowupExpiry: freezed == nextFollowupExpiry ? _self.nextFollowupExpiry : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EligibleFollowUp].
extension EligibleFollowUpPatterns on EligibleFollowUp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EligibleFollowUp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EligibleFollowUp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EligibleFollowUp value)  $default,){
final _that = this;
switch (_that) {
case _EligibleFollowUp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EligibleFollowUp value)?  $default,){
final _that = this;
switch (_that) {
case _EligibleFollowUp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String department, @JsonKey(name: 'valid_from')  String? validFrom, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'appointment_date')  String? appointmentDate, @JsonKey(name: 'remaining_days')  int? remainingDays, @JsonKey(name: 'days_remaining')  int? daysRemaining,  String? status, @JsonKey(name: 'is_free')  bool? isFree, @JsonKey(name: 'next_followup_expiry')  String? nextFollowupExpiry,  String? note,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EligibleFollowUp() when $default != null:
return $default(_that.followupId,_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.validFrom,_that.validUntil,_that.appointmentDate,_that.remainingDays,_that.daysRemaining,_that.status,_that.isFree,_that.nextFollowupExpiry,_that.note,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String department, @JsonKey(name: 'valid_from')  String? validFrom, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'appointment_date')  String? appointmentDate, @JsonKey(name: 'remaining_days')  int? remainingDays, @JsonKey(name: 'days_remaining')  int? daysRemaining,  String? status, @JsonKey(name: 'is_free')  bool? isFree, @JsonKey(name: 'next_followup_expiry')  String? nextFollowupExpiry,  String? note,  String? message)  $default,) {final _that = this;
switch (_that) {
case _EligibleFollowUp():
return $default(_that.followupId,_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.validFrom,_that.validUntil,_that.appointmentDate,_that.remainingDays,_that.daysRemaining,_that.status,_that.isFree,_that.nextFollowupExpiry,_that.note,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId,  String department, @JsonKey(name: 'valid_from')  String? validFrom, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'appointment_date')  String? appointmentDate, @JsonKey(name: 'remaining_days')  int? remainingDays, @JsonKey(name: 'days_remaining')  int? daysRemaining,  String? status, @JsonKey(name: 'is_free')  bool? isFree, @JsonKey(name: 'next_followup_expiry')  String? nextFollowupExpiry,  String? note,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _EligibleFollowUp() when $default != null:
return $default(_that.followupId,_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.department,_that.validFrom,_that.validUntil,_that.appointmentDate,_that.remainingDays,_that.daysRemaining,_that.status,_that.isFree,_that.nextFollowupExpiry,_that.note,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EligibleFollowUp implements EligibleFollowUp {
  const _EligibleFollowUp({@JsonKey(name: 'followup_id') this.followupId, @JsonKey(name: 'appointment_id') this.appointmentId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') required this.doctorName, @JsonKey(name: 'department_id') this.departmentId, required this.department, @JsonKey(name: 'valid_from') this.validFrom, @JsonKey(name: 'valid_until') this.validUntil, @JsonKey(name: 'appointment_date') this.appointmentDate, @JsonKey(name: 'remaining_days') this.remainingDays, @JsonKey(name: 'days_remaining') this.daysRemaining, this.status, @JsonKey(name: 'is_free') this.isFree, @JsonKey(name: 'next_followup_expiry') this.nextFollowupExpiry, this.note, this.message});
  factory _EligibleFollowUp.fromJson(Map<String, dynamic> json) => _$EligibleFollowUpFromJson(json);

// ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
@override@JsonKey(name: 'followup_id') final  String? followupId;
// ✅ LEGACY: Source appointment ID (for backward compatibility)
@override@JsonKey(name: 'appointment_id') final  String? appointmentId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String doctorName;
@override@JsonKey(name: 'department_id') final  String? departmentId;
@override final  String department;
// ✅ NEW TABLE-BASED: Valid from/until dates
@override@JsonKey(name: 'valid_from') final  String? validFrom;
@override@JsonKey(name: 'valid_until') final  String? validUntil;
// ✅ LEGACY: Appointment date (for backward compatibility)
@override@JsonKey(name: 'appointment_date') final  String? appointmentDate;
@override@JsonKey(name: 'remaining_days') final  int? remainingDays;
@override@JsonKey(name: 'days_remaining') final  int? daysRemaining;
// ✅ NEW: Alternative field name
// ✅ NEW TABLE-BASED: Status tracking
@override final  String? status;
// active, used, expired, renewed
@override@JsonKey(name: 'is_free') final  bool? isFree;
// ✅ NEW: Explicitly track if free
// ✅ Enhanced renewal tracking
@override@JsonKey(name: 'next_followup_expiry') final  String? nextFollowupExpiry;
// ISO date
@override final  String? note;
@override final  String? message;

/// Create a copy of EligibleFollowUp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EligibleFollowUpCopyWith<_EligibleFollowUp> get copyWith => __$EligibleFollowUpCopyWithImpl<_EligibleFollowUp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EligibleFollowUpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EligibleFollowUp&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.department, department) || other.department == department)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.nextFollowupExpiry, nextFollowupExpiry) || other.nextFollowupExpiry == nextFollowupExpiry)&&(identical(other.note, note) || other.note == note)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,appointmentId,doctorId,doctorName,departmentId,department,validFrom,validUntil,appointmentDate,remainingDays,daysRemaining,status,isFree,nextFollowupExpiry,note,message);

@override
String toString() {
  return 'EligibleFollowUp(followupId: $followupId, appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, validFrom: $validFrom, validUntil: $validUntil, appointmentDate: $appointmentDate, remainingDays: $remainingDays, daysRemaining: $daysRemaining, status: $status, isFree: $isFree, nextFollowupExpiry: $nextFollowupExpiry, note: $note, message: $message)';
}


}

/// @nodoc
abstract mixin class _$EligibleFollowUpCopyWith<$Res> implements $EligibleFollowUpCopyWith<$Res> {
  factory _$EligibleFollowUpCopyWith(_EligibleFollowUp value, $Res Function(_EligibleFollowUp) _then) = __$EligibleFollowUpCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'followup_id') String? followupId,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId, String department,@JsonKey(name: 'valid_from') String? validFrom,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'appointment_date') String? appointmentDate,@JsonKey(name: 'remaining_days') int? remainingDays,@JsonKey(name: 'days_remaining') int? daysRemaining, String? status,@JsonKey(name: 'is_free') bool? isFree,@JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry, String? note, String? message
});




}
/// @nodoc
class __$EligibleFollowUpCopyWithImpl<$Res>
    implements _$EligibleFollowUpCopyWith<$Res> {
  __$EligibleFollowUpCopyWithImpl(this._self, this._then);

  final _EligibleFollowUp _self;
  final $Res Function(_EligibleFollowUp) _then;

/// Create a copy of EligibleFollowUp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followupId = freezed,Object? appointmentId = freezed,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? department = null,Object? validFrom = freezed,Object? validUntil = freezed,Object? appointmentDate = freezed,Object? remainingDays = freezed,Object? daysRemaining = freezed,Object? status = freezed,Object? isFree = freezed,Object? nextFollowupExpiry = freezed,Object? note = freezed,Object? message = freezed,}) {
  return _then(_EligibleFollowUp(
followupId: freezed == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,validFrom: freezed == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,appointmentDate: freezed == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,nextFollowupExpiry: freezed == nextFollowupExpiry ? _self.nextFollowupExpiry : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ExpiredFollowUp {

// ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
@JsonKey(name: 'followup_id') String? get followupId;// ✅ LEGACY: Source appointment ID (for backward compatibility)
@JsonKey(name: 'appointment_id') String? get appointmentId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String get doctorName;@JsonKey(name: 'department_id') String? get departmentId;@JsonKey(name: 'department_name') String? get departmentName;// ✅ NEW: Alternative field name
 String get department;// ✅ NEW TABLE-BASED: Expiration tracking
@JsonKey(name: 'valid_until') String? get validUntil;@JsonKey(name: 'expired_on') String? get expiredOn;// Date when follow-up expired
 String? get status;// ✅ NEW: Status from follow_ups table
 String? get note;
/// Create a copy of ExpiredFollowUp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpiredFollowUpCopyWith<ExpiredFollowUp> get copyWith => _$ExpiredFollowUpCopyWithImpl<ExpiredFollowUp>(this as ExpiredFollowUp, _$identity);

  /// Serializes this ExpiredFollowUp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpiredFollowUp&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.department, department) || other.department == department)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.expiredOn, expiredOn) || other.expiredOn == expiredOn)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,appointmentId,doctorId,doctorName,departmentId,departmentName,department,validUntil,expiredOn,status,note);

@override
String toString() {
  return 'ExpiredFollowUp(followupId: $followupId, appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, department: $department, validUntil: $validUntil, expiredOn: $expiredOn, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class $ExpiredFollowUpCopyWith<$Res>  {
  factory $ExpiredFollowUpCopyWith(ExpiredFollowUp value, $Res Function(ExpiredFollowUp) _then) = _$ExpiredFollowUpCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'followup_id') String? followupId,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'department_name') String? departmentName, String department,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'expired_on') String? expiredOn, String? status, String? note
});




}
/// @nodoc
class _$ExpiredFollowUpCopyWithImpl<$Res>
    implements $ExpiredFollowUpCopyWith<$Res> {
  _$ExpiredFollowUpCopyWithImpl(this._self, this._then);

  final ExpiredFollowUp _self;
  final $Res Function(ExpiredFollowUp) _then;

/// Create a copy of ExpiredFollowUp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followupId = freezed,Object? appointmentId = freezed,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? departmentName = freezed,Object? department = null,Object? validUntil = freezed,Object? expiredOn = freezed,Object? status = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
followupId: freezed == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,expiredOn: freezed == expiredOn ? _self.expiredOn : expiredOn // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpiredFollowUp].
extension ExpiredFollowUpPatterns on ExpiredFollowUp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpiredFollowUp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpiredFollowUp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpiredFollowUp value)  $default,){
final _that = this;
switch (_that) {
case _ExpiredFollowUp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpiredFollowUp value)?  $default,){
final _that = this;
switch (_that) {
case _ExpiredFollowUp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'department_name')  String? departmentName,  String department, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'expired_on')  String? expiredOn,  String? status,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpiredFollowUp() when $default != null:
return $default(_that.followupId,_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.department,_that.validUntil,_that.expiredOn,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'department_name')  String? departmentName,  String department, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'expired_on')  String? expiredOn,  String? status,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ExpiredFollowUp():
return $default(_that.followupId,_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.department,_that.validUntil,_that.expiredOn,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'followup_id')  String? followupId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String doctorName, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'department_name')  String? departmentName,  String department, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'expired_on')  String? expiredOn,  String? status,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ExpiredFollowUp() when $default != null:
return $default(_that.followupId,_that.appointmentId,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.department,_that.validUntil,_that.expiredOn,_that.status,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpiredFollowUp implements ExpiredFollowUp {
  const _ExpiredFollowUp({@JsonKey(name: 'followup_id') this.followupId, @JsonKey(name: 'appointment_id') this.appointmentId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') required this.doctorName, @JsonKey(name: 'department_id') this.departmentId, @JsonKey(name: 'department_name') this.departmentName, required this.department, @JsonKey(name: 'valid_until') this.validUntil, @JsonKey(name: 'expired_on') this.expiredOn, this.status, this.note});
  factory _ExpiredFollowUp.fromJson(Map<String, dynamic> json) => _$ExpiredFollowUpFromJson(json);

// ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
@override@JsonKey(name: 'followup_id') final  String? followupId;
// ✅ LEGACY: Source appointment ID (for backward compatibility)
@override@JsonKey(name: 'appointment_id') final  String? appointmentId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String doctorName;
@override@JsonKey(name: 'department_id') final  String? departmentId;
@override@JsonKey(name: 'department_name') final  String? departmentName;
// ✅ NEW: Alternative field name
@override final  String department;
// ✅ NEW TABLE-BASED: Expiration tracking
@override@JsonKey(name: 'valid_until') final  String? validUntil;
@override@JsonKey(name: 'expired_on') final  String? expiredOn;
// Date when follow-up expired
@override final  String? status;
// ✅ NEW: Status from follow_ups table
@override final  String? note;

/// Create a copy of ExpiredFollowUp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpiredFollowUpCopyWith<_ExpiredFollowUp> get copyWith => __$ExpiredFollowUpCopyWithImpl<_ExpiredFollowUp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpiredFollowUpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpiredFollowUp&&(identical(other.followupId, followupId) || other.followupId == followupId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.department, department) || other.department == department)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.expiredOn, expiredOn) || other.expiredOn == expiredOn)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followupId,appointmentId,doctorId,doctorName,departmentId,departmentName,department,validUntil,expiredOn,status,note);

@override
String toString() {
  return 'ExpiredFollowUp(followupId: $followupId, appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, department: $department, validUntil: $validUntil, expiredOn: $expiredOn, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ExpiredFollowUpCopyWith<$Res> implements $ExpiredFollowUpCopyWith<$Res> {
  factory _$ExpiredFollowUpCopyWith(_ExpiredFollowUp value, $Res Function(_ExpiredFollowUp) _then) = __$ExpiredFollowUpCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'followup_id') String? followupId,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String doctorName,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'department_name') String? departmentName, String department,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'expired_on') String? expiredOn, String? status, String? note
});




}
/// @nodoc
class __$ExpiredFollowUpCopyWithImpl<$Res>
    implements _$ExpiredFollowUpCopyWith<$Res> {
  __$ExpiredFollowUpCopyWithImpl(this._self, this._then);

  final _ExpiredFollowUp _self;
  final $Res Function(_ExpiredFollowUp) _then;

/// Create a copy of ExpiredFollowUp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followupId = freezed,Object? appointmentId = freezed,Object? doctorId = null,Object? doctorName = null,Object? departmentId = freezed,Object? departmentName = freezed,Object? department = null,Object? validUntil = freezed,Object? expiredOn = freezed,Object? status = freezed,Object? note = freezed,}) {
  return _then(_ExpiredFollowUp(
followupId: freezed == followupId ? _self.followupId : followupId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,expiredOn: freezed == expiredOn ? _self.expiredOn : expiredOn // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateClinicPatientInput {

@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get phone; String? get email;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; int? get age; String? get gender; String? get address; String? get address1; String? get address2; String? get district; String? get state;@JsonKey(name: 'mo_id') String? get moId;@JsonKey(name: 'medical_history') String? get medicalHistory; String? get allergies;@JsonKey(name: 'blood_group') String? get bloodGroup;@JsonKey(name: 'smoking_status') String? get smokingStatus;@JsonKey(name: 'alcohol_use') String? get alcoholUse;@JsonKey(name: 'height_cm') int? get heightCm;@JsonKey(name: 'weight_kg') int? get weightKg;
/// Create a copy of CreateClinicPatientInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClinicPatientInputCopyWith<CreateClinicPatientInput> get copyWith => _$CreateClinicPatientInputCopyWithImpl<CreateClinicPatientInput>(this as CreateClinicPatientInput, _$identity);

  /// Serializes this CreateClinicPatientInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClinicPatientInput&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.district, district) || other.district == district)&&(identical(other.state, state) || other.state == state)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.medicalHistory, medicalHistory) || other.medicalHistory == medicalHistory)&&(identical(other.allergies, allergies) || other.allergies == allergies)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,clinicId,firstName,lastName,phone,email,dateOfBirth,age,gender,address,address1,address2,district,state,moId,medicalHistory,allergies,bloodGroup,smokingStatus,alcoholUse,heightCm,weightKg]);

@override
String toString() {
  return 'CreateClinicPatientInput(clinicId: $clinicId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, address: $address, address1: $address1, address2: $address2, district: $district, state: $state, moId: $moId, medicalHistory: $medicalHistory, allergies: $allergies, bloodGroup: $bloodGroup, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, heightCm: $heightCm, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class $CreateClinicPatientInputCopyWith<$Res>  {
  factory $CreateClinicPatientInputCopyWith(CreateClinicPatientInput value, $Res Function(CreateClinicPatientInput) _then) = _$CreateClinicPatientInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String phone, String? email,@JsonKey(name: 'date_of_birth') String? dateOfBirth, int? age, String? gender, String? address, String? address1, String? address2, String? district, String? state,@JsonKey(name: 'mo_id') String? moId,@JsonKey(name: 'medical_history') String? medicalHistory, String? allergies,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') int? weightKg
});




}
/// @nodoc
class _$CreateClinicPatientInputCopyWithImpl<$Res>
    implements $CreateClinicPatientInputCopyWith<$Res> {
  _$CreateClinicPatientInputCopyWithImpl(this._self, this._then);

  final CreateClinicPatientInput _self;
  final $Res Function(CreateClinicPatientInput) _then;

/// Create a copy of CreateClinicPatientInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = freezed,Object? dateOfBirth = freezed,Object? age = freezed,Object? gender = freezed,Object? address = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? district = freezed,Object? state = freezed,Object? moId = freezed,Object? medicalHistory = freezed,Object? allergies = freezed,Object? bloodGroup = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? heightCm = freezed,Object? weightKg = freezed,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,medicalHistory: freezed == medicalHistory ? _self.medicalHistory : medicalHistory // ignore: cast_nullable_to_non_nullable
as String?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClinicPatientInput].
extension CreateClinicPatientInputPatterns on CreateClinicPatientInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClinicPatientInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClinicPatientInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClinicPatientInput value)  $default,){
final _that = this;
switch (_that) {
case _CreateClinicPatientInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClinicPatientInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClinicPatientInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone,  String? email, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  int? age,  String? gender,  String? address,  String? address1,  String? address2,  String? district,  String? state, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'medical_history')  String? medicalHistory,  String? allergies, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  int? weightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClinicPatientInput() when $default != null:
return $default(_that.clinicId,_that.firstName,_that.lastName,_that.phone,_that.email,_that.dateOfBirth,_that.age,_that.gender,_that.address,_that.address1,_that.address2,_that.district,_that.state,_that.moId,_that.medicalHistory,_that.allergies,_that.bloodGroup,_that.smokingStatus,_that.alcoholUse,_that.heightCm,_that.weightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone,  String? email, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  int? age,  String? gender,  String? address,  String? address1,  String? address2,  String? district,  String? state, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'medical_history')  String? medicalHistory,  String? allergies, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  int? weightKg)  $default,) {final _that = this;
switch (_that) {
case _CreateClinicPatientInput():
return $default(_that.clinicId,_that.firstName,_that.lastName,_that.phone,_that.email,_that.dateOfBirth,_that.age,_that.gender,_that.address,_that.address1,_that.address2,_that.district,_that.state,_that.moId,_that.medicalHistory,_that.allergies,_that.bloodGroup,_that.smokingStatus,_that.alcoholUse,_that.heightCm,_that.weightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone,  String? email, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  int? age,  String? gender,  String? address,  String? address1,  String? address2,  String? district,  String? state, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'medical_history')  String? medicalHistory,  String? allergies, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  int? weightKg)?  $default,) {final _that = this;
switch (_that) {
case _CreateClinicPatientInput() when $default != null:
return $default(_that.clinicId,_that.firstName,_that.lastName,_that.phone,_that.email,_that.dateOfBirth,_that.age,_that.gender,_that.address,_that.address1,_that.address2,_that.district,_that.state,_that.moId,_that.medicalHistory,_that.allergies,_that.bloodGroup,_that.smokingStatus,_that.alcoholUse,_that.heightCm,_that.weightKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateClinicPatientInput implements CreateClinicPatientInput {
  const _CreateClinicPatientInput({@JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.phone, this.email, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.age, this.gender, this.address, this.address1, this.address2, this.district, this.state, @JsonKey(name: 'mo_id') this.moId, @JsonKey(name: 'medical_history') this.medicalHistory, this.allergies, @JsonKey(name: 'blood_group') this.bloodGroup, @JsonKey(name: 'smoking_status') this.smokingStatus, @JsonKey(name: 'alcohol_use') this.alcoholUse, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'weight_kg') this.weightKg});
  factory _CreateClinicPatientInput.fromJson(Map<String, dynamic> json) => _$CreateClinicPatientInputFromJson(json);

@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String phone;
@override final  String? email;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override final  int? age;
@override final  String? gender;
@override final  String? address;
@override final  String? address1;
@override final  String? address2;
@override final  String? district;
@override final  String? state;
@override@JsonKey(name: 'mo_id') final  String? moId;
@override@JsonKey(name: 'medical_history') final  String? medicalHistory;
@override final  String? allergies;
@override@JsonKey(name: 'blood_group') final  String? bloodGroup;
@override@JsonKey(name: 'smoking_status') final  String? smokingStatus;
@override@JsonKey(name: 'alcohol_use') final  String? alcoholUse;
@override@JsonKey(name: 'height_cm') final  int? heightCm;
@override@JsonKey(name: 'weight_kg') final  int? weightKg;

/// Create a copy of CreateClinicPatientInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClinicPatientInputCopyWith<_CreateClinicPatientInput> get copyWith => __$CreateClinicPatientInputCopyWithImpl<_CreateClinicPatientInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClinicPatientInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClinicPatientInput&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.district, district) || other.district == district)&&(identical(other.state, state) || other.state == state)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.medicalHistory, medicalHistory) || other.medicalHistory == medicalHistory)&&(identical(other.allergies, allergies) || other.allergies == allergies)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,clinicId,firstName,lastName,phone,email,dateOfBirth,age,gender,address,address1,address2,district,state,moId,medicalHistory,allergies,bloodGroup,smokingStatus,alcoholUse,heightCm,weightKg]);

@override
String toString() {
  return 'CreateClinicPatientInput(clinicId: $clinicId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, address: $address, address1: $address1, address2: $address2, district: $district, state: $state, moId: $moId, medicalHistory: $medicalHistory, allergies: $allergies, bloodGroup: $bloodGroup, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, heightCm: $heightCm, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class _$CreateClinicPatientInputCopyWith<$Res> implements $CreateClinicPatientInputCopyWith<$Res> {
  factory _$CreateClinicPatientInputCopyWith(_CreateClinicPatientInput value, $Res Function(_CreateClinicPatientInput) _then) = __$CreateClinicPatientInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String phone, String? email,@JsonKey(name: 'date_of_birth') String? dateOfBirth, int? age, String? gender, String? address, String? address1, String? address2, String? district, String? state,@JsonKey(name: 'mo_id') String? moId,@JsonKey(name: 'medical_history') String? medicalHistory, String? allergies,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') int? weightKg
});




}
/// @nodoc
class __$CreateClinicPatientInputCopyWithImpl<$Res>
    implements _$CreateClinicPatientInputCopyWith<$Res> {
  __$CreateClinicPatientInputCopyWithImpl(this._self, this._then);

  final _CreateClinicPatientInput _self;
  final $Res Function(_CreateClinicPatientInput) _then;

/// Create a copy of CreateClinicPatientInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = freezed,Object? dateOfBirth = freezed,Object? age = freezed,Object? gender = freezed,Object? address = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? district = freezed,Object? state = freezed,Object? moId = freezed,Object? medicalHistory = freezed,Object? allergies = freezed,Object? bloodGroup = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? heightCm = freezed,Object? weightKg = freezed,}) {
  return _then(_CreateClinicPatientInput(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,medicalHistory: freezed == medicalHistory ? _self.medicalHistory : medicalHistory // ignore: cast_nullable_to_non_nullable
as String?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CreateClinicPatientResponse {

 String get message; ClinicPatient get patient;
/// Create a copy of CreateClinicPatientResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClinicPatientResponseCopyWith<CreateClinicPatientResponse> get copyWith => _$CreateClinicPatientResponseCopyWithImpl<CreateClinicPatientResponse>(this as CreateClinicPatientResponse, _$identity);

  /// Serializes this CreateClinicPatientResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClinicPatientResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.patient, patient) || other.patient == patient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,patient);

@override
String toString() {
  return 'CreateClinicPatientResponse(message: $message, patient: $patient)';
}


}

/// @nodoc
abstract mixin class $CreateClinicPatientResponseCopyWith<$Res>  {
  factory $CreateClinicPatientResponseCopyWith(CreateClinicPatientResponse value, $Res Function(CreateClinicPatientResponse) _then) = _$CreateClinicPatientResponseCopyWithImpl;
@useResult
$Res call({
 String message, ClinicPatient patient
});


$ClinicPatientCopyWith<$Res> get patient;

}
/// @nodoc
class _$CreateClinicPatientResponseCopyWithImpl<$Res>
    implements $CreateClinicPatientResponseCopyWith<$Res> {
  _$CreateClinicPatientResponseCopyWithImpl(this._self, this._then);

  final CreateClinicPatientResponse _self;
  final $Res Function(CreateClinicPatientResponse) _then;

/// Create a copy of CreateClinicPatientResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? patient = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as ClinicPatient,
  ));
}
/// Create a copy of CreateClinicPatientResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicPatientCopyWith<$Res> get patient {
  
  return $ClinicPatientCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateClinicPatientResponse].
extension CreateClinicPatientResponsePatterns on CreateClinicPatientResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClinicPatientResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClinicPatientResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClinicPatientResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateClinicPatientResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClinicPatientResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClinicPatientResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  ClinicPatient patient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClinicPatientResponse() when $default != null:
return $default(_that.message,_that.patient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  ClinicPatient patient)  $default,) {final _that = this;
switch (_that) {
case _CreateClinicPatientResponse():
return $default(_that.message,_that.patient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  ClinicPatient patient)?  $default,) {final _that = this;
switch (_that) {
case _CreateClinicPatientResponse() when $default != null:
return $default(_that.message,_that.patient);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateClinicPatientResponse implements CreateClinicPatientResponse {
  const _CreateClinicPatientResponse({required this.message, required this.patient});
  factory _CreateClinicPatientResponse.fromJson(Map<String, dynamic> json) => _$CreateClinicPatientResponseFromJson(json);

@override final  String message;
@override final  ClinicPatient patient;

/// Create a copy of CreateClinicPatientResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClinicPatientResponseCopyWith<_CreateClinicPatientResponse> get copyWith => __$CreateClinicPatientResponseCopyWithImpl<_CreateClinicPatientResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClinicPatientResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClinicPatientResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.patient, patient) || other.patient == patient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,patient);

@override
String toString() {
  return 'CreateClinicPatientResponse(message: $message, patient: $patient)';
}


}

/// @nodoc
abstract mixin class _$CreateClinicPatientResponseCopyWith<$Res> implements $CreateClinicPatientResponseCopyWith<$Res> {
  factory _$CreateClinicPatientResponseCopyWith(_CreateClinicPatientResponse value, $Res Function(_CreateClinicPatientResponse) _then) = __$CreateClinicPatientResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, ClinicPatient patient
});


@override $ClinicPatientCopyWith<$Res> get patient;

}
/// @nodoc
class __$CreateClinicPatientResponseCopyWithImpl<$Res>
    implements _$CreateClinicPatientResponseCopyWith<$Res> {
  __$CreateClinicPatientResponseCopyWithImpl(this._self, this._then);

  final _CreateClinicPatientResponse _self;
  final $Res Function(_CreateClinicPatientResponse) _then;

/// Create a copy of CreateClinicPatientResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? patient = null,}) {
  return _then(_CreateClinicPatientResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as ClinicPatient,
  ));
}

/// Create a copy of CreateClinicPatientResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicPatientCopyWith<$Res> get patient {
  
  return $ClinicPatientCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// @nodoc
mixin _$ListClinicPatientsResponse {

@JsonKey(name: 'clinic_id') String get clinicId; int get total; List<ClinicPatient> get patients;
/// Create a copy of ListClinicPatientsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListClinicPatientsResponseCopyWith<ListClinicPatientsResponse> get copyWith => _$ListClinicPatientsResponseCopyWithImpl<ListClinicPatientsResponse>(this as ListClinicPatientsResponse, _$identity);

  /// Serializes this ListClinicPatientsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListClinicPatientsResponse&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.patients, patients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,total,const DeepCollectionEquality().hash(patients));

@override
String toString() {
  return 'ListClinicPatientsResponse(clinicId: $clinicId, total: $total, patients: $patients)';
}


}

/// @nodoc
abstract mixin class $ListClinicPatientsResponseCopyWith<$Res>  {
  factory $ListClinicPatientsResponseCopyWith(ListClinicPatientsResponse value, $Res Function(ListClinicPatientsResponse) _then) = _$ListClinicPatientsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId, int total, List<ClinicPatient> patients
});




}
/// @nodoc
class _$ListClinicPatientsResponseCopyWithImpl<$Res>
    implements $ListClinicPatientsResponseCopyWith<$Res> {
  _$ListClinicPatientsResponseCopyWithImpl(this._self, this._then);

  final ListClinicPatientsResponse _self;
  final $Res Function(ListClinicPatientsResponse) _then;

/// Create a copy of ListClinicPatientsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? total = null,Object? patients = null,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,patients: null == patients ? _self.patients : patients // ignore: cast_nullable_to_non_nullable
as List<ClinicPatient>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListClinicPatientsResponse].
extension ListClinicPatientsResponsePatterns on ListClinicPatientsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListClinicPatientsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListClinicPatientsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListClinicPatientsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListClinicPatientsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListClinicPatientsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListClinicPatientsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId,  int total,  List<ClinicPatient> patients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListClinicPatientsResponse() when $default != null:
return $default(_that.clinicId,_that.total,_that.patients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_id')  String clinicId,  int total,  List<ClinicPatient> patients)  $default,) {final _that = this;
switch (_that) {
case _ListClinicPatientsResponse():
return $default(_that.clinicId,_that.total,_that.patients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_id')  String clinicId,  int total,  List<ClinicPatient> patients)?  $default,) {final _that = this;
switch (_that) {
case _ListClinicPatientsResponse() when $default != null:
return $default(_that.clinicId,_that.total,_that.patients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListClinicPatientsResponse implements ListClinicPatientsResponse {
  const _ListClinicPatientsResponse({@JsonKey(name: 'clinic_id') required this.clinicId, required this.total, required final  List<ClinicPatient> patients}): _patients = patients;
  factory _ListClinicPatientsResponse.fromJson(Map<String, dynamic> json) => _$ListClinicPatientsResponseFromJson(json);

@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override final  int total;
 final  List<ClinicPatient> _patients;
@override List<ClinicPatient> get patients {
  if (_patients is EqualUnmodifiableListView) return _patients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_patients);
}


/// Create a copy of ListClinicPatientsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListClinicPatientsResponseCopyWith<_ListClinicPatientsResponse> get copyWith => __$ListClinicPatientsResponseCopyWithImpl<_ListClinicPatientsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListClinicPatientsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListClinicPatientsResponse&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._patients, _patients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,total,const DeepCollectionEquality().hash(_patients));

@override
String toString() {
  return 'ListClinicPatientsResponse(clinicId: $clinicId, total: $total, patients: $patients)';
}


}

/// @nodoc
abstract mixin class _$ListClinicPatientsResponseCopyWith<$Res> implements $ListClinicPatientsResponseCopyWith<$Res> {
  factory _$ListClinicPatientsResponseCopyWith(_ListClinicPatientsResponse value, $Res Function(_ListClinicPatientsResponse) _then) = __$ListClinicPatientsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_id') String clinicId, int total, List<ClinicPatient> patients
});




}
/// @nodoc
class __$ListClinicPatientsResponseCopyWithImpl<$Res>
    implements _$ListClinicPatientsResponseCopyWith<$Res> {
  __$ListClinicPatientsResponseCopyWithImpl(this._self, this._then);

  final _ListClinicPatientsResponse _self;
  final $Res Function(_ListClinicPatientsResponse) _then;

/// Create a copy of ListClinicPatientsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? total = null,Object? patients = null,}) {
  return _then(_ListClinicPatientsResponse(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,patients: null == patients ? _self._patients : patients // ignore: cast_nullable_to_non_nullable
as List<ClinicPatient>,
  ));
}


}


/// @nodoc
mixin _$AppointmentDetail {

@JsonKey(name: 'appointment_id') String get appointmentId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'department_id') String? get departmentId;// ✅ Changed to nullable
@JsonKey(name: 'appointment_time') String get appointmentTime;@JsonKey(name: 'slot_type') String get slotType;@JsonKey(name: 'consultation_type') String get consultationType; String get status;@JsonKey(name: 'fee_amount') double get feeAmount;@JsonKey(name: 'payment_status') String get paymentStatus;@JsonKey(name: 'payment_mode') String? get paymentMode;@JsonKey(name: 'is_priority') bool get isPriority;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentDetailCopyWith<AppointmentDetail> get copyWith => _$AppointmentDetailCopyWithImpl<AppointmentDetail>(this as AppointmentDetail, _$identity);

  /// Serializes this AppointmentDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentDetail&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.isPriority, isPriority) || other.isPriority == isPriority)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,doctorId,departmentId,appointmentTime,slotType,consultationType,status,feeAmount,paymentStatus,paymentMode,isPriority,createdAt);

@override
String toString() {
  return 'AppointmentDetail(appointmentId: $appointmentId, doctorId: $doctorId, departmentId: $departmentId, appointmentTime: $appointmentTime, slotType: $slotType, consultationType: $consultationType, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, paymentMode: $paymentMode, isPriority: $isPriority, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppointmentDetailCopyWith<$Res>  {
  factory $AppointmentDetailCopyWith(AppointmentDetail value, $Res Function(AppointmentDetail) _then) = _$AppointmentDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'appointment_time') String appointmentTime,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'consultation_type') String consultationType, String status,@JsonKey(name: 'fee_amount') double feeAmount,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'payment_mode') String? paymentMode,@JsonKey(name: 'is_priority') bool isPriority,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$AppointmentDetailCopyWithImpl<$Res>
    implements $AppointmentDetailCopyWith<$Res> {
  _$AppointmentDetailCopyWithImpl(this._self, this._then);

  final AppointmentDetail _self;
  final $Res Function(AppointmentDetail) _then;

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appointmentId = null,Object? doctorId = null,Object? departmentId = freezed,Object? appointmentTime = null,Object? slotType = null,Object? consultationType = null,Object? status = null,Object? feeAmount = null,Object? paymentStatus = null,Object? paymentMode = freezed,Object? isPriority = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,appointmentTime: null == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeAmount: null == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,isPriority: null == isPriority ? _self.isPriority : isPriority // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentDetail].
extension AppointmentDetailPatterns on AppointmentDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentDetail value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentDetail value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'consultation_type')  String consultationType,  String status, @JsonKey(name: 'fee_amount')  double feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'is_priority')  bool isPriority, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
return $default(_that.appointmentId,_that.doctorId,_that.departmentId,_that.appointmentTime,_that.slotType,_that.consultationType,_that.status,_that.feeAmount,_that.paymentStatus,_that.paymentMode,_that.isPriority,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'consultation_type')  String consultationType,  String status, @JsonKey(name: 'fee_amount')  double feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'is_priority')  bool isPriority, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetail():
return $default(_that.appointmentId,_that.doctorId,_that.departmentId,_that.appointmentTime,_that.slotType,_that.consultationType,_that.status,_that.feeAmount,_that.paymentStatus,_that.paymentMode,_that.isPriority,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'consultation_type')  String consultationType,  String status, @JsonKey(name: 'fee_amount')  double feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'is_priority')  bool isPriority, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
return $default(_that.appointmentId,_that.doctorId,_that.departmentId,_that.appointmentTime,_that.slotType,_that.consultationType,_that.status,_that.feeAmount,_that.paymentStatus,_that.paymentMode,_that.isPriority,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentDetail implements AppointmentDetail {
  const _AppointmentDetail({@JsonKey(name: 'appointment_id') required this.appointmentId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'department_id') this.departmentId, @JsonKey(name: 'appointment_time') required this.appointmentTime, @JsonKey(name: 'slot_type') required this.slotType, @JsonKey(name: 'consultation_type') required this.consultationType, required this.status, @JsonKey(name: 'fee_amount') this.feeAmount = 0.0, @JsonKey(name: 'payment_status') this.paymentStatus = 'pending', @JsonKey(name: 'payment_mode') this.paymentMode, @JsonKey(name: 'is_priority') this.isPriority = false, @JsonKey(name: 'created_at') this.createdAt});
  factory _AppointmentDetail.fromJson(Map<String, dynamic> json) => _$AppointmentDetailFromJson(json);

@override@JsonKey(name: 'appointment_id') final  String appointmentId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'department_id') final  String? departmentId;
// ✅ Changed to nullable
@override@JsonKey(name: 'appointment_time') final  String appointmentTime;
@override@JsonKey(name: 'slot_type') final  String slotType;
@override@JsonKey(name: 'consultation_type') final  String consultationType;
@override final  String status;
@override@JsonKey(name: 'fee_amount') final  double feeAmount;
@override@JsonKey(name: 'payment_status') final  String paymentStatus;
@override@JsonKey(name: 'payment_mode') final  String? paymentMode;
@override@JsonKey(name: 'is_priority') final  bool isPriority;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentDetailCopyWith<_AppointmentDetail> get copyWith => __$AppointmentDetailCopyWithImpl<_AppointmentDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentDetail&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.isPriority, isPriority) || other.isPriority == isPriority)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,doctorId,departmentId,appointmentTime,slotType,consultationType,status,feeAmount,paymentStatus,paymentMode,isPriority,createdAt);

@override
String toString() {
  return 'AppointmentDetail(appointmentId: $appointmentId, doctorId: $doctorId, departmentId: $departmentId, appointmentTime: $appointmentTime, slotType: $slotType, consultationType: $consultationType, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, paymentMode: $paymentMode, isPriority: $isPriority, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppointmentDetailCopyWith<$Res> implements $AppointmentDetailCopyWith<$Res> {
  factory _$AppointmentDetailCopyWith(_AppointmentDetail value, $Res Function(_AppointmentDetail) _then) = __$AppointmentDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'appointment_time') String appointmentTime,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'consultation_type') String consultationType, String status,@JsonKey(name: 'fee_amount') double feeAmount,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'payment_mode') String? paymentMode,@JsonKey(name: 'is_priority') bool isPriority,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$AppointmentDetailCopyWithImpl<$Res>
    implements _$AppointmentDetailCopyWith<$Res> {
  __$AppointmentDetailCopyWithImpl(this._self, this._then);

  final _AppointmentDetail _self;
  final $Res Function(_AppointmentDetail) _then;

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appointmentId = null,Object? doctorId = null,Object? departmentId = freezed,Object? appointmentTime = null,Object? slotType = null,Object? consultationType = null,Object? status = null,Object? feeAmount = null,Object? paymentStatus = null,Object? paymentMode = freezed,Object? isPriority = null,Object? createdAt = freezed,}) {
  return _then(_AppointmentDetail(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,appointmentTime: null == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeAmount: null == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,isPriority: null == isPriority ? _self.isPriority : isPriority // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FollowUpDetail {

@JsonKey(name: 'follow_up_id') String get followUpId;@JsonKey(name: 'source_appointment_id') String get sourceAppointmentId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'department_id') String? get departmentId;// ✅ Changed to nullable
 String get status;@JsonKey(name: 'is_free') bool get isFree;@JsonKey(name: 'valid_from') String get validFrom;@JsonKey(name: 'valid_until') String get validUntil;@JsonKey(name: 'used_appointment_id') String? get usedAppointmentId;@JsonKey(name: 'renewed_by_appointment_id') String? get renewedByAppointmentId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of FollowUpDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowUpDetailCopyWith<FollowUpDetail> get copyWith => _$FollowUpDetailCopyWithImpl<FollowUpDetail>(this as FollowUpDetail, _$identity);

  /// Serializes this FollowUpDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowUpDetail&&(identical(other.followUpId, followUpId) || other.followUpId == followUpId)&&(identical(other.sourceAppointmentId, sourceAppointmentId) || other.sourceAppointmentId == sourceAppointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.usedAppointmentId, usedAppointmentId) || other.usedAppointmentId == usedAppointmentId)&&(identical(other.renewedByAppointmentId, renewedByAppointmentId) || other.renewedByAppointmentId == renewedByAppointmentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followUpId,sourceAppointmentId,doctorId,departmentId,status,isFree,validFrom,validUntil,usedAppointmentId,renewedByAppointmentId,createdAt,updatedAt);

@override
String toString() {
  return 'FollowUpDetail(followUpId: $followUpId, sourceAppointmentId: $sourceAppointmentId, doctorId: $doctorId, departmentId: $departmentId, status: $status, isFree: $isFree, validFrom: $validFrom, validUntil: $validUntil, usedAppointmentId: $usedAppointmentId, renewedByAppointmentId: $renewedByAppointmentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FollowUpDetailCopyWith<$Res>  {
  factory $FollowUpDetailCopyWith(FollowUpDetail value, $Res Function(FollowUpDetail) _then) = _$FollowUpDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'follow_up_id') String followUpId,@JsonKey(name: 'source_appointment_id') String sourceAppointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'department_id') String? departmentId, String status,@JsonKey(name: 'is_free') bool isFree,@JsonKey(name: 'valid_from') String validFrom,@JsonKey(name: 'valid_until') String validUntil,@JsonKey(name: 'used_appointment_id') String? usedAppointmentId,@JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$FollowUpDetailCopyWithImpl<$Res>
    implements $FollowUpDetailCopyWith<$Res> {
  _$FollowUpDetailCopyWithImpl(this._self, this._then);

  final FollowUpDetail _self;
  final $Res Function(FollowUpDetail) _then;

/// Create a copy of FollowUpDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followUpId = null,Object? sourceAppointmentId = null,Object? doctorId = null,Object? departmentId = freezed,Object? status = null,Object? isFree = null,Object? validFrom = null,Object? validUntil = null,Object? usedAppointmentId = freezed,Object? renewedByAppointmentId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
followUpId: null == followUpId ? _self.followUpId : followUpId // ignore: cast_nullable_to_non_nullable
as String,sourceAppointmentId: null == sourceAppointmentId ? _self.sourceAppointmentId : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,usedAppointmentId: freezed == usedAppointmentId ? _self.usedAppointmentId : usedAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,renewedByAppointmentId: freezed == renewedByAppointmentId ? _self.renewedByAppointmentId : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowUpDetail].
extension FollowUpDetailPatterns on FollowUpDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowUpDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowUpDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowUpDetail value)  $default,){
final _that = this;
switch (_that) {
case _FollowUpDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowUpDetail value)?  $default,){
final _that = this;
switch (_that) {
case _FollowUpDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'follow_up_id')  String followUpId, @JsonKey(name: 'source_appointment_id')  String sourceAppointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'department_id')  String? departmentId,  String status, @JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'valid_from')  String validFrom, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'used_appointment_id')  String? usedAppointmentId, @JsonKey(name: 'renewed_by_appointment_id')  String? renewedByAppointmentId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowUpDetail() when $default != null:
return $default(_that.followUpId,_that.sourceAppointmentId,_that.doctorId,_that.departmentId,_that.status,_that.isFree,_that.validFrom,_that.validUntil,_that.usedAppointmentId,_that.renewedByAppointmentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'follow_up_id')  String followUpId, @JsonKey(name: 'source_appointment_id')  String sourceAppointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'department_id')  String? departmentId,  String status, @JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'valid_from')  String validFrom, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'used_appointment_id')  String? usedAppointmentId, @JsonKey(name: 'renewed_by_appointment_id')  String? renewedByAppointmentId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FollowUpDetail():
return $default(_that.followUpId,_that.sourceAppointmentId,_that.doctorId,_that.departmentId,_that.status,_that.isFree,_that.validFrom,_that.validUntil,_that.usedAppointmentId,_that.renewedByAppointmentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'follow_up_id')  String followUpId, @JsonKey(name: 'source_appointment_id')  String sourceAppointmentId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'department_id')  String? departmentId,  String status, @JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'valid_from')  String validFrom, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'used_appointment_id')  String? usedAppointmentId, @JsonKey(name: 'renewed_by_appointment_id')  String? renewedByAppointmentId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FollowUpDetail() when $default != null:
return $default(_that.followUpId,_that.sourceAppointmentId,_that.doctorId,_that.departmentId,_that.status,_that.isFree,_that.validFrom,_that.validUntil,_that.usedAppointmentId,_that.renewedByAppointmentId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FollowUpDetail implements FollowUpDetail {
  const _FollowUpDetail({@JsonKey(name: 'follow_up_id') required this.followUpId, @JsonKey(name: 'source_appointment_id') required this.sourceAppointmentId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'department_id') this.departmentId, required this.status, @JsonKey(name: 'is_free') this.isFree = true, @JsonKey(name: 'valid_from') required this.validFrom, @JsonKey(name: 'valid_until') required this.validUntil, @JsonKey(name: 'used_appointment_id') this.usedAppointmentId, @JsonKey(name: 'renewed_by_appointment_id') this.renewedByAppointmentId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _FollowUpDetail.fromJson(Map<String, dynamic> json) => _$FollowUpDetailFromJson(json);

@override@JsonKey(name: 'follow_up_id') final  String followUpId;
@override@JsonKey(name: 'source_appointment_id') final  String sourceAppointmentId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'department_id') final  String? departmentId;
// ✅ Changed to nullable
@override final  String status;
@override@JsonKey(name: 'is_free') final  bool isFree;
@override@JsonKey(name: 'valid_from') final  String validFrom;
@override@JsonKey(name: 'valid_until') final  String validUntil;
@override@JsonKey(name: 'used_appointment_id') final  String? usedAppointmentId;
@override@JsonKey(name: 'renewed_by_appointment_id') final  String? renewedByAppointmentId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of FollowUpDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowUpDetailCopyWith<_FollowUpDetail> get copyWith => __$FollowUpDetailCopyWithImpl<_FollowUpDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowUpDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowUpDetail&&(identical(other.followUpId, followUpId) || other.followUpId == followUpId)&&(identical(other.sourceAppointmentId, sourceAppointmentId) || other.sourceAppointmentId == sourceAppointmentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.usedAppointmentId, usedAppointmentId) || other.usedAppointmentId == usedAppointmentId)&&(identical(other.renewedByAppointmentId, renewedByAppointmentId) || other.renewedByAppointmentId == renewedByAppointmentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followUpId,sourceAppointmentId,doctorId,departmentId,status,isFree,validFrom,validUntil,usedAppointmentId,renewedByAppointmentId,createdAt,updatedAt);

@override
String toString() {
  return 'FollowUpDetail(followUpId: $followUpId, sourceAppointmentId: $sourceAppointmentId, doctorId: $doctorId, departmentId: $departmentId, status: $status, isFree: $isFree, validFrom: $validFrom, validUntil: $validUntil, usedAppointmentId: $usedAppointmentId, renewedByAppointmentId: $renewedByAppointmentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FollowUpDetailCopyWith<$Res> implements $FollowUpDetailCopyWith<$Res> {
  factory _$FollowUpDetailCopyWith(_FollowUpDetail value, $Res Function(_FollowUpDetail) _then) = __$FollowUpDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'follow_up_id') String followUpId,@JsonKey(name: 'source_appointment_id') String sourceAppointmentId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'department_id') String? departmentId, String status,@JsonKey(name: 'is_free') bool isFree,@JsonKey(name: 'valid_from') String validFrom,@JsonKey(name: 'valid_until') String validUntil,@JsonKey(name: 'used_appointment_id') String? usedAppointmentId,@JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$FollowUpDetailCopyWithImpl<$Res>
    implements _$FollowUpDetailCopyWith<$Res> {
  __$FollowUpDetailCopyWithImpl(this._self, this._then);

  final _FollowUpDetail _self;
  final $Res Function(_FollowUpDetail) _then;

/// Create a copy of FollowUpDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followUpId = null,Object? sourceAppointmentId = null,Object? doctorId = null,Object? departmentId = freezed,Object? status = null,Object? isFree = null,Object? validFrom = null,Object? validUntil = null,Object? usedAppointmentId = freezed,Object? renewedByAppointmentId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FollowUpDetail(
followUpId: null == followUpId ? _self.followUpId : followUpId // ignore: cast_nullable_to_non_nullable
as String,sourceAppointmentId: null == sourceAppointmentId ? _self.sourceAppointmentId : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,usedAppointmentId: freezed == usedAppointmentId ? _self.usedAppointmentId : usedAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,renewedByAppointmentId: freezed == renewedByAppointmentId ? _self.renewedByAppointmentId : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
