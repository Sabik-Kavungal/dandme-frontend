// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/appointment_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentHistoryItem {

 String get id;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'clinic_patient_id') String? get clinicPatientId;@JsonKey(name: 'appointment_date') String get appointmentDate;@JsonKey(name: 'appointment_time') String get appointmentTime;@JsonKey(name: 'consultation_type') String get consultationType;@JsonKey(name: 'doctor_name') String? get doctorName;@JsonKey(name: 'doctor_prefix') String? get doctorPrefix; String? get reason; String? get notes; String get status;@JsonKey(name: 'fee_amount') double? get feeAmount;@JsonKey(name: 'payment_status') String get paymentStatus;@JsonKey(name: 'booking_number') String get bookingNumber;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of AppointmentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentHistoryItemCopyWith<AppointmentHistoryItem> get copyWith => _$AppointmentHistoryItemCopyWithImpl<AppointmentHistoryItem>(this as AppointmentHistoryItem, _$identity);

  /// Serializes this AppointmentHistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorPrefix, doctorPrefix) || other.doctorPrefix == doctorPrefix)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicId,clinicPatientId,appointmentDate,appointmentTime,consultationType,doctorName,doctorPrefix,reason,notes,status,feeAmount,paymentStatus,bookingNumber,createdAt);

@override
String toString() {
  return 'AppointmentHistoryItem(id: $id, clinicId: $clinicId, clinicPatientId: $clinicPatientId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, consultationType: $consultationType, doctorName: $doctorName, doctorPrefix: $doctorPrefix, reason: $reason, notes: $notes, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppointmentHistoryItemCopyWith<$Res>  {
  factory $AppointmentHistoryItemCopyWith(AppointmentHistoryItem value, $Res Function(AppointmentHistoryItem) _then) = _$AppointmentHistoryItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'appointment_time') String appointmentTime,@JsonKey(name: 'consultation_type') String consultationType,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'doctor_prefix') String? doctorPrefix, String? reason, String? notes, String status,@JsonKey(name: 'fee_amount') double? feeAmount,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'booking_number') String bookingNumber,@JsonKey(name: 'created_at') String createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clinicId = null,Object? clinicPatientId = freezed,Object? appointmentDate = null,Object? appointmentTime = null,Object? consultationType = null,Object? doctorName = freezed,Object? doctorPrefix = freezed,Object? reason = freezed,Object? notes = freezed,Object? status = null,Object? feeAmount = freezed,Object? paymentStatus = null,Object? bookingNumber = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,appointmentTime: null == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,doctorPrefix: freezed == doctorPrefix ? _self.doctorPrefix : doctorPrefix // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,bookingNumber: null == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'consultation_type')  String consultationType, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'doctor_prefix')  String? doctorPrefix,  String? reason,  String? notes,  String status, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentHistoryItem() when $default != null:
return $default(_that.id,_that.clinicId,_that.clinicPatientId,_that.appointmentDate,_that.appointmentTime,_that.consultationType,_that.doctorName,_that.doctorPrefix,_that.reason,_that.notes,_that.status,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'consultation_type')  String consultationType, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'doctor_prefix')  String? doctorPrefix,  String? reason,  String? notes,  String status, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppointmentHistoryItem():
return $default(_that.id,_that.clinicId,_that.clinicPatientId,_that.appointmentDate,_that.appointmentTime,_that.consultationType,_that.doctorName,_that.doctorPrefix,_that.reason,_that.notes,_that.status,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'consultation_type')  String consultationType, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'doctor_prefix')  String? doctorPrefix,  String? reason,  String? notes,  String status, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentHistoryItem() when $default != null:
return $default(_that.id,_that.clinicId,_that.clinicPatientId,_that.appointmentDate,_that.appointmentTime,_that.consultationType,_that.doctorName,_that.doctorPrefix,_that.reason,_that.notes,_that.status,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentHistoryItem implements AppointmentHistoryItem {
  const _AppointmentHistoryItem({required this.id, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'clinic_patient_id') this.clinicPatientId, @JsonKey(name: 'appointment_date') required this.appointmentDate, @JsonKey(name: 'appointment_time') required this.appointmentTime, @JsonKey(name: 'consultation_type') required this.consultationType, @JsonKey(name: 'doctor_name') this.doctorName, @JsonKey(name: 'doctor_prefix') this.doctorPrefix, this.reason, this.notes, required this.status, @JsonKey(name: 'fee_amount') this.feeAmount, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'booking_number') required this.bookingNumber, @JsonKey(name: 'created_at') required this.createdAt});
  factory _AppointmentHistoryItem.fromJson(Map<String, dynamic> json) => _$AppointmentHistoryItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'clinic_patient_id') final  String? clinicPatientId;
@override@JsonKey(name: 'appointment_date') final  String appointmentDate;
@override@JsonKey(name: 'appointment_time') final  String appointmentTime;
@override@JsonKey(name: 'consultation_type') final  String consultationType;
@override@JsonKey(name: 'doctor_name') final  String? doctorName;
@override@JsonKey(name: 'doctor_prefix') final  String? doctorPrefix;
@override final  String? reason;
@override final  String? notes;
@override final  String status;
@override@JsonKey(name: 'fee_amount') final  double? feeAmount;
@override@JsonKey(name: 'payment_status') final  String paymentStatus;
@override@JsonKey(name: 'booking_number') final  String bookingNumber;
@override@JsonKey(name: 'created_at') final  String createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorPrefix, doctorPrefix) || other.doctorPrefix == doctorPrefix)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicId,clinicPatientId,appointmentDate,appointmentTime,consultationType,doctorName,doctorPrefix,reason,notes,status,feeAmount,paymentStatus,bookingNumber,createdAt);

@override
String toString() {
  return 'AppointmentHistoryItem(id: $id, clinicId: $clinicId, clinicPatientId: $clinicPatientId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, consultationType: $consultationType, doctorName: $doctorName, doctorPrefix: $doctorPrefix, reason: $reason, notes: $notes, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppointmentHistoryItemCopyWith<$Res> implements $AppointmentHistoryItemCopyWith<$Res> {
  factory _$AppointmentHistoryItemCopyWith(_AppointmentHistoryItem value, $Res Function(_AppointmentHistoryItem) _then) = __$AppointmentHistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'appointment_time') String appointmentTime,@JsonKey(name: 'consultation_type') String consultationType,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'doctor_prefix') String? doctorPrefix, String? reason, String? notes, String status,@JsonKey(name: 'fee_amount') double? feeAmount,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'booking_number') String bookingNumber,@JsonKey(name: 'created_at') String createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clinicId = null,Object? clinicPatientId = freezed,Object? appointmentDate = null,Object? appointmentTime = null,Object? consultationType = null,Object? doctorName = freezed,Object? doctorPrefix = freezed,Object? reason = freezed,Object? notes = freezed,Object? status = null,Object? feeAmount = freezed,Object? paymentStatus = null,Object? bookingNumber = null,Object? createdAt = null,}) {
  return _then(_AppointmentHistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,appointmentTime: null == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,doctorPrefix: freezed == doctorPrefix ? _self.doctorPrefix : doctorPrefix // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,bookingNumber: null == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AppointmentHistoryResponse {

 bool get success;@JsonKey(name: 'clinic_patient_id') String get clinicPatientId;@JsonKey(name: 'clinic_id') String? get clinicId; int get total; List<AppointmentHistoryItem> get appointments;
/// Create a copy of AppointmentHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentHistoryResponseCopyWith<AppointmentHistoryResponse> get copyWith => _$AppointmentHistoryResponseCopyWithImpl<AppointmentHistoryResponse>(this as AppointmentHistoryResponse, _$identity);

  /// Serializes this AppointmentHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.appointments, appointments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,clinicPatientId,clinicId,total,const DeepCollectionEquality().hash(appointments));

@override
String toString() {
  return 'AppointmentHistoryResponse(success: $success, clinicPatientId: $clinicPatientId, clinicId: $clinicId, total: $total, appointments: $appointments)';
}


}

/// @nodoc
abstract mixin class $AppointmentHistoryResponseCopyWith<$Res>  {
  factory $AppointmentHistoryResponseCopyWith(AppointmentHistoryResponse value, $Res Function(AppointmentHistoryResponse) _then) = _$AppointmentHistoryResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(name: 'clinic_patient_id') String clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId, int total, List<AppointmentHistoryItem> appointments
});




}
/// @nodoc
class _$AppointmentHistoryResponseCopyWithImpl<$Res>
    implements $AppointmentHistoryResponseCopyWith<$Res> {
  _$AppointmentHistoryResponseCopyWithImpl(this._self, this._then);

  final AppointmentHistoryResponse _self;
  final $Res Function(AppointmentHistoryResponse) _then;

/// Create a copy of AppointmentHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? clinicPatientId = null,Object? clinicId = freezed,Object? total = null,Object? appointments = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,clinicPatientId: null == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,appointments: null == appointments ? _self.appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentHistoryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentHistoryResponse].
extension AppointmentHistoryResponsePatterns on AppointmentHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'clinic_patient_id')  String clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId,  int total,  List<AppointmentHistoryItem> appointments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentHistoryResponse() when $default != null:
return $default(_that.success,_that.clinicPatientId,_that.clinicId,_that.total,_that.appointments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'clinic_patient_id')  String clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId,  int total,  List<AppointmentHistoryItem> appointments)  $default,) {final _that = this;
switch (_that) {
case _AppointmentHistoryResponse():
return $default(_that.success,_that.clinicPatientId,_that.clinicId,_that.total,_that.appointments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(name: 'clinic_patient_id')  String clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId,  int total,  List<AppointmentHistoryItem> appointments)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentHistoryResponse() when $default != null:
return $default(_that.success,_that.clinicPatientId,_that.clinicId,_that.total,_that.appointments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentHistoryResponse implements AppointmentHistoryResponse {
  const _AppointmentHistoryResponse({required this.success, @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId, @JsonKey(name: 'clinic_id') this.clinicId, required this.total, required final  List<AppointmentHistoryItem> appointments}): _appointments = appointments;
  factory _AppointmentHistoryResponse.fromJson(Map<String, dynamic> json) => _$AppointmentHistoryResponseFromJson(json);

@override final  bool success;
@override@JsonKey(name: 'clinic_patient_id') final  String clinicPatientId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override final  int total;
 final  List<AppointmentHistoryItem> _appointments;
@override List<AppointmentHistoryItem> get appointments {
  if (_appointments is EqualUnmodifiableListView) return _appointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointments);
}


/// Create a copy of AppointmentHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentHistoryResponseCopyWith<_AppointmentHistoryResponse> get copyWith => __$AppointmentHistoryResponseCopyWithImpl<_AppointmentHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._appointments, _appointments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,clinicPatientId,clinicId,total,const DeepCollectionEquality().hash(_appointments));

@override
String toString() {
  return 'AppointmentHistoryResponse(success: $success, clinicPatientId: $clinicPatientId, clinicId: $clinicId, total: $total, appointments: $appointments)';
}


}

/// @nodoc
abstract mixin class _$AppointmentHistoryResponseCopyWith<$Res> implements $AppointmentHistoryResponseCopyWith<$Res> {
  factory _$AppointmentHistoryResponseCopyWith(_AppointmentHistoryResponse value, $Res Function(_AppointmentHistoryResponse) _then) = __$AppointmentHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(name: 'clinic_patient_id') String clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId, int total, List<AppointmentHistoryItem> appointments
});




}
/// @nodoc
class __$AppointmentHistoryResponseCopyWithImpl<$Res>
    implements _$AppointmentHistoryResponseCopyWith<$Res> {
  __$AppointmentHistoryResponseCopyWithImpl(this._self, this._then);

  final _AppointmentHistoryResponse _self;
  final $Res Function(_AppointmentHistoryResponse) _then;

/// Create a copy of AppointmentHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? clinicPatientId = null,Object? clinicId = freezed,Object? total = null,Object? appointments = null,}) {
  return _then(_AppointmentHistoryResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,clinicPatientId: null == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,appointments: null == appointments ? _self._appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentHistoryItem>,
  ));
}


}

// dart format on
