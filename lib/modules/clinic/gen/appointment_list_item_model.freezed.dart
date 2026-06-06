// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/appointment_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentListItem {

 String get id;@JsonKey(name: 'token_number', fromJson: _tokenNumberToString) String? get tokenNumber;@JsonKey(name: 'token_numeric') int? get tokenNumeric;@JsonKey(name: 'display_token') String? get displayToken;@JsonKey(name: 'doctor_prefix') String? get doctorPrefix;@JsonKey(name: 'queue_position') int? get queuePosition;@JsonKey(name: 'mo_id') String? get moId;@JsonKey(name: 'patient_number') String? get patientNumber;@JsonKey(name: 'patient_name') String get patientName;@JsonKey(name: 'doctor_name') String get doctorName; String? get department;@JsonKey(name: 'clinic_patient_id') String? get clinicPatientId;@JsonKey(name: 'patient_id') String? get patientId;// Legacy fallback
@JsonKey(name: 'consultation_type') String get consultationType;@JsonKey(name: 'appointment_date_time') String get appointmentDateTime; String get status;@JsonKey(name: 'fee_status') String get feeStatus;@JsonKey(name: 'fee_amount') double? get feeAmount;@JsonKey(name: 'payment_status') String get paymentStatus;@JsonKey(name: 'booking_number') String get bookingNumber;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'doctor_image') String? get doctorImage;@JsonKey(name: 'booking_mode') String? get bookingMode;@JsonKey(name: 'payment_mode') String? get paymentMode;
/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentListItemCopyWith<AppointmentListItem> get copyWith => _$AppointmentListItemCopyWithImpl<AppointmentListItem>(this as AppointmentListItem, _$identity);

  /// Serializes this AppointmentListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.tokenNumber, tokenNumber) || other.tokenNumber == tokenNumber)&&(identical(other.tokenNumeric, tokenNumeric) || other.tokenNumeric == tokenNumeric)&&(identical(other.displayToken, displayToken) || other.displayToken == displayToken)&&(identical(other.doctorPrefix, doctorPrefix) || other.doctorPrefix == doctorPrefix)&&(identical(other.queuePosition, queuePosition) || other.queuePosition == queuePosition)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.patientNumber, patientNumber) || other.patientNumber == patientNumber)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.department, department) || other.department == department)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.appointmentDateTime, appointmentDateTime) || other.appointmentDateTime == appointmentDateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeStatus, feeStatus) || other.feeStatus == feeStatus)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorImage, doctorImage) || other.doctorImage == doctorImage)&&(identical(other.bookingMode, bookingMode) || other.bookingMode == bookingMode)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tokenNumber,tokenNumeric,displayToken,doctorPrefix,queuePosition,moId,patientNumber,patientName,doctorName,department,clinicPatientId,patientId,consultationType,appointmentDateTime,status,feeStatus,feeAmount,paymentStatus,bookingNumber,createdAt,doctorImage,bookingMode,paymentMode]);

@override
String toString() {
  return 'AppointmentListItem(id: $id, tokenNumber: $tokenNumber, tokenNumeric: $tokenNumeric, displayToken: $displayToken, doctorPrefix: $doctorPrefix, queuePosition: $queuePosition, moId: $moId, patientNumber: $patientNumber, patientName: $patientName, doctorName: $doctorName, department: $department, clinicPatientId: $clinicPatientId, patientId: $patientId, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, status: $status, feeStatus: $feeStatus, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt, doctorImage: $doctorImage, bookingMode: $bookingMode, paymentMode: $paymentMode)';
}


}

/// @nodoc
abstract mixin class $AppointmentListItemCopyWith<$Res>  {
  factory $AppointmentListItemCopyWith(AppointmentListItem value, $Res Function(AppointmentListItem) _then) = _$AppointmentListItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'token_number', fromJson: _tokenNumberToString) String? tokenNumber,@JsonKey(name: 'token_numeric') int? tokenNumeric,@JsonKey(name: 'display_token') String? displayToken,@JsonKey(name: 'doctor_prefix') String? doctorPrefix,@JsonKey(name: 'queue_position') int? queuePosition,@JsonKey(name: 'mo_id') String? moId,@JsonKey(name: 'patient_number') String? patientNumber,@JsonKey(name: 'patient_name') String patientName,@JsonKey(name: 'doctor_name') String doctorName, String? department,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'patient_id') String? patientId,@JsonKey(name: 'consultation_type') String consultationType,@JsonKey(name: 'appointment_date_time') String appointmentDateTime, String status,@JsonKey(name: 'fee_status') String feeStatus,@JsonKey(name: 'fee_amount') double? feeAmount,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'booking_number') String bookingNumber,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'doctor_image') String? doctorImage,@JsonKey(name: 'booking_mode') String? bookingMode,@JsonKey(name: 'payment_mode') String? paymentMode
});




}
/// @nodoc
class _$AppointmentListItemCopyWithImpl<$Res>
    implements $AppointmentListItemCopyWith<$Res> {
  _$AppointmentListItemCopyWithImpl(this._self, this._then);

  final AppointmentListItem _self;
  final $Res Function(AppointmentListItem) _then;

/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tokenNumber = freezed,Object? tokenNumeric = freezed,Object? displayToken = freezed,Object? doctorPrefix = freezed,Object? queuePosition = freezed,Object? moId = freezed,Object? patientNumber = freezed,Object? patientName = null,Object? doctorName = null,Object? department = freezed,Object? clinicPatientId = freezed,Object? patientId = freezed,Object? consultationType = null,Object? appointmentDateTime = null,Object? status = null,Object? feeStatus = null,Object? feeAmount = freezed,Object? paymentStatus = null,Object? bookingNumber = null,Object? createdAt = null,Object? doctorImage = freezed,Object? bookingMode = freezed,Object? paymentMode = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tokenNumber: freezed == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as String?,tokenNumeric: freezed == tokenNumeric ? _self.tokenNumeric : tokenNumeric // ignore: cast_nullable_to_non_nullable
as int?,displayToken: freezed == displayToken ? _self.displayToken : displayToken // ignore: cast_nullable_to_non_nullable
as String?,doctorPrefix: freezed == doctorPrefix ? _self.doctorPrefix : doctorPrefix // ignore: cast_nullable_to_non_nullable
as String?,queuePosition: freezed == queuePosition ? _self.queuePosition : queuePosition // ignore: cast_nullable_to_non_nullable
as int?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,patientNumber: freezed == patientNumber ? _self.patientNumber : patientNumber // ignore: cast_nullable_to_non_nullable
as String?,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,appointmentDateTime: null == appointmentDateTime ? _self.appointmentDateTime : appointmentDateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeStatus: null == feeStatus ? _self.feeStatus : feeStatus // ignore: cast_nullable_to_non_nullable
as String,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,bookingNumber: null == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,doctorImage: freezed == doctorImage ? _self.doctorImage : doctorImage // ignore: cast_nullable_to_non_nullable
as String?,bookingMode: freezed == bookingMode ? _self.bookingMode : bookingMode // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentListItem].
extension AppointmentListItemPatterns on AppointmentListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentListItem value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentListItem value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'token_number', fromJson: _tokenNumberToString)  String? tokenNumber, @JsonKey(name: 'token_numeric')  int? tokenNumeric, @JsonKey(name: 'display_token')  String? displayToken, @JsonKey(name: 'doctor_prefix')  String? doctorPrefix, @JsonKey(name: 'queue_position')  int? queuePosition, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'patient_number')  String? patientNumber, @JsonKey(name: 'patient_name')  String patientName, @JsonKey(name: 'doctor_name')  String doctorName,  String? department, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'patient_id')  String? patientId, @JsonKey(name: 'consultation_type')  String consultationType, @JsonKey(name: 'appointment_date_time')  String appointmentDateTime,  String status, @JsonKey(name: 'fee_status')  String feeStatus, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'doctor_image')  String? doctorImage, @JsonKey(name: 'booking_mode')  String? bookingMode, @JsonKey(name: 'payment_mode')  String? paymentMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
return $default(_that.id,_that.tokenNumber,_that.tokenNumeric,_that.displayToken,_that.doctorPrefix,_that.queuePosition,_that.moId,_that.patientNumber,_that.patientName,_that.doctorName,_that.department,_that.clinicPatientId,_that.patientId,_that.consultationType,_that.appointmentDateTime,_that.status,_that.feeStatus,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt,_that.doctorImage,_that.bookingMode,_that.paymentMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'token_number', fromJson: _tokenNumberToString)  String? tokenNumber, @JsonKey(name: 'token_numeric')  int? tokenNumeric, @JsonKey(name: 'display_token')  String? displayToken, @JsonKey(name: 'doctor_prefix')  String? doctorPrefix, @JsonKey(name: 'queue_position')  int? queuePosition, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'patient_number')  String? patientNumber, @JsonKey(name: 'patient_name')  String patientName, @JsonKey(name: 'doctor_name')  String doctorName,  String? department, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'patient_id')  String? patientId, @JsonKey(name: 'consultation_type')  String consultationType, @JsonKey(name: 'appointment_date_time')  String appointmentDateTime,  String status, @JsonKey(name: 'fee_status')  String feeStatus, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'doctor_image')  String? doctorImage, @JsonKey(name: 'booking_mode')  String? bookingMode, @JsonKey(name: 'payment_mode')  String? paymentMode)  $default,) {final _that = this;
switch (_that) {
case _AppointmentListItem():
return $default(_that.id,_that.tokenNumber,_that.tokenNumeric,_that.displayToken,_that.doctorPrefix,_that.queuePosition,_that.moId,_that.patientNumber,_that.patientName,_that.doctorName,_that.department,_that.clinicPatientId,_that.patientId,_that.consultationType,_that.appointmentDateTime,_that.status,_that.feeStatus,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt,_that.doctorImage,_that.bookingMode,_that.paymentMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'token_number', fromJson: _tokenNumberToString)  String? tokenNumber, @JsonKey(name: 'token_numeric')  int? tokenNumeric, @JsonKey(name: 'display_token')  String? displayToken, @JsonKey(name: 'doctor_prefix')  String? doctorPrefix, @JsonKey(name: 'queue_position')  int? queuePosition, @JsonKey(name: 'mo_id')  String? moId, @JsonKey(name: 'patient_number')  String? patientNumber, @JsonKey(name: 'patient_name')  String patientName, @JsonKey(name: 'doctor_name')  String doctorName,  String? department, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'patient_id')  String? patientId, @JsonKey(name: 'consultation_type')  String consultationType, @JsonKey(name: 'appointment_date_time')  String appointmentDateTime,  String status, @JsonKey(name: 'fee_status')  String feeStatus, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'doctor_image')  String? doctorImage, @JsonKey(name: 'booking_mode')  String? bookingMode, @JsonKey(name: 'payment_mode')  String? paymentMode)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
return $default(_that.id,_that.tokenNumber,_that.tokenNumeric,_that.displayToken,_that.doctorPrefix,_that.queuePosition,_that.moId,_that.patientNumber,_that.patientName,_that.doctorName,_that.department,_that.clinicPatientId,_that.patientId,_that.consultationType,_that.appointmentDateTime,_that.status,_that.feeStatus,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt,_that.doctorImage,_that.bookingMode,_that.paymentMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentListItem implements AppointmentListItem {
  const _AppointmentListItem({required this.id, @JsonKey(name: 'token_number', fromJson: _tokenNumberToString) this.tokenNumber, @JsonKey(name: 'token_numeric') this.tokenNumeric, @JsonKey(name: 'display_token') this.displayToken, @JsonKey(name: 'doctor_prefix') this.doctorPrefix, @JsonKey(name: 'queue_position') this.queuePosition, @JsonKey(name: 'mo_id') this.moId, @JsonKey(name: 'patient_number') this.patientNumber, @JsonKey(name: 'patient_name') required this.patientName, @JsonKey(name: 'doctor_name') required this.doctorName, this.department, @JsonKey(name: 'clinic_patient_id') this.clinicPatientId, @JsonKey(name: 'patient_id') this.patientId, @JsonKey(name: 'consultation_type') required this.consultationType, @JsonKey(name: 'appointment_date_time') required this.appointmentDateTime, required this.status, @JsonKey(name: 'fee_status') required this.feeStatus, @JsonKey(name: 'fee_amount') this.feeAmount, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'booking_number') required this.bookingNumber, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'doctor_image') this.doctorImage, @JsonKey(name: 'booking_mode') this.bookingMode, @JsonKey(name: 'payment_mode') this.paymentMode});
  factory _AppointmentListItem.fromJson(Map<String, dynamic> json) => _$AppointmentListItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'token_number', fromJson: _tokenNumberToString) final  String? tokenNumber;
@override@JsonKey(name: 'token_numeric') final  int? tokenNumeric;
@override@JsonKey(name: 'display_token') final  String? displayToken;
@override@JsonKey(name: 'doctor_prefix') final  String? doctorPrefix;
@override@JsonKey(name: 'queue_position') final  int? queuePosition;
@override@JsonKey(name: 'mo_id') final  String? moId;
@override@JsonKey(name: 'patient_number') final  String? patientNumber;
@override@JsonKey(name: 'patient_name') final  String patientName;
@override@JsonKey(name: 'doctor_name') final  String doctorName;
@override final  String? department;
@override@JsonKey(name: 'clinic_patient_id') final  String? clinicPatientId;
@override@JsonKey(name: 'patient_id') final  String? patientId;
// Legacy fallback
@override@JsonKey(name: 'consultation_type') final  String consultationType;
@override@JsonKey(name: 'appointment_date_time') final  String appointmentDateTime;
@override final  String status;
@override@JsonKey(name: 'fee_status') final  String feeStatus;
@override@JsonKey(name: 'fee_amount') final  double? feeAmount;
@override@JsonKey(name: 'payment_status') final  String paymentStatus;
@override@JsonKey(name: 'booking_number') final  String bookingNumber;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'doctor_image') final  String? doctorImage;
@override@JsonKey(name: 'booking_mode') final  String? bookingMode;
@override@JsonKey(name: 'payment_mode') final  String? paymentMode;

/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentListItemCopyWith<_AppointmentListItem> get copyWith => __$AppointmentListItemCopyWithImpl<_AppointmentListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.tokenNumber, tokenNumber) || other.tokenNumber == tokenNumber)&&(identical(other.tokenNumeric, tokenNumeric) || other.tokenNumeric == tokenNumeric)&&(identical(other.displayToken, displayToken) || other.displayToken == displayToken)&&(identical(other.doctorPrefix, doctorPrefix) || other.doctorPrefix == doctorPrefix)&&(identical(other.queuePosition, queuePosition) || other.queuePosition == queuePosition)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.patientNumber, patientNumber) || other.patientNumber == patientNumber)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.department, department) || other.department == department)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.appointmentDateTime, appointmentDateTime) || other.appointmentDateTime == appointmentDateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeStatus, feeStatus) || other.feeStatus == feeStatus)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.doctorImage, doctorImage) || other.doctorImage == doctorImage)&&(identical(other.bookingMode, bookingMode) || other.bookingMode == bookingMode)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tokenNumber,tokenNumeric,displayToken,doctorPrefix,queuePosition,moId,patientNumber,patientName,doctorName,department,clinicPatientId,patientId,consultationType,appointmentDateTime,status,feeStatus,feeAmount,paymentStatus,bookingNumber,createdAt,doctorImage,bookingMode,paymentMode]);

@override
String toString() {
  return 'AppointmentListItem(id: $id, tokenNumber: $tokenNumber, tokenNumeric: $tokenNumeric, displayToken: $displayToken, doctorPrefix: $doctorPrefix, queuePosition: $queuePosition, moId: $moId, patientNumber: $patientNumber, patientName: $patientName, doctorName: $doctorName, department: $department, clinicPatientId: $clinicPatientId, patientId: $patientId, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, status: $status, feeStatus: $feeStatus, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt, doctorImage: $doctorImage, bookingMode: $bookingMode, paymentMode: $paymentMode)';
}


}

/// @nodoc
abstract mixin class _$AppointmentListItemCopyWith<$Res> implements $AppointmentListItemCopyWith<$Res> {
  factory _$AppointmentListItemCopyWith(_AppointmentListItem value, $Res Function(_AppointmentListItem) _then) = __$AppointmentListItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'token_number', fromJson: _tokenNumberToString) String? tokenNumber,@JsonKey(name: 'token_numeric') int? tokenNumeric,@JsonKey(name: 'display_token') String? displayToken,@JsonKey(name: 'doctor_prefix') String? doctorPrefix,@JsonKey(name: 'queue_position') int? queuePosition,@JsonKey(name: 'mo_id') String? moId,@JsonKey(name: 'patient_number') String? patientNumber,@JsonKey(name: 'patient_name') String patientName,@JsonKey(name: 'doctor_name') String doctorName, String? department,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'patient_id') String? patientId,@JsonKey(name: 'consultation_type') String consultationType,@JsonKey(name: 'appointment_date_time') String appointmentDateTime, String status,@JsonKey(name: 'fee_status') String feeStatus,@JsonKey(name: 'fee_amount') double? feeAmount,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'booking_number') String bookingNumber,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'doctor_image') String? doctorImage,@JsonKey(name: 'booking_mode') String? bookingMode,@JsonKey(name: 'payment_mode') String? paymentMode
});




}
/// @nodoc
class __$AppointmentListItemCopyWithImpl<$Res>
    implements _$AppointmentListItemCopyWith<$Res> {
  __$AppointmentListItemCopyWithImpl(this._self, this._then);

  final _AppointmentListItem _self;
  final $Res Function(_AppointmentListItem) _then;

/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tokenNumber = freezed,Object? tokenNumeric = freezed,Object? displayToken = freezed,Object? doctorPrefix = freezed,Object? queuePosition = freezed,Object? moId = freezed,Object? patientNumber = freezed,Object? patientName = null,Object? doctorName = null,Object? department = freezed,Object? clinicPatientId = freezed,Object? patientId = freezed,Object? consultationType = null,Object? appointmentDateTime = null,Object? status = null,Object? feeStatus = null,Object? feeAmount = freezed,Object? paymentStatus = null,Object? bookingNumber = null,Object? createdAt = null,Object? doctorImage = freezed,Object? bookingMode = freezed,Object? paymentMode = freezed,}) {
  return _then(_AppointmentListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tokenNumber: freezed == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as String?,tokenNumeric: freezed == tokenNumeric ? _self.tokenNumeric : tokenNumeric // ignore: cast_nullable_to_non_nullable
as int?,displayToken: freezed == displayToken ? _self.displayToken : displayToken // ignore: cast_nullable_to_non_nullable
as String?,doctorPrefix: freezed == doctorPrefix ? _self.doctorPrefix : doctorPrefix // ignore: cast_nullable_to_non_nullable
as String?,queuePosition: freezed == queuePosition ? _self.queuePosition : queuePosition // ignore: cast_nullable_to_non_nullable
as int?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,patientNumber: freezed == patientNumber ? _self.patientNumber : patientNumber // ignore: cast_nullable_to_non_nullable
as String?,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,appointmentDateTime: null == appointmentDateTime ? _self.appointmentDateTime : appointmentDateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeStatus: null == feeStatus ? _self.feeStatus : feeStatus // ignore: cast_nullable_to_non_nullable
as String,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,bookingNumber: null == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,doctorImage: freezed == doctorImage ? _self.doctorImage : doctorImage // ignore: cast_nullable_to_non_nullable
as String?,bookingMode: freezed == bookingMode ? _self.bookingMode : bookingMode // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SimpleAppointmentListResponse {

 bool get success;@JsonKey(name: 'clinic_id') String get clinicId; String? get date; int get total; List<AppointmentListItem> get appointments;
/// Create a copy of SimpleAppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleAppointmentListResponseCopyWith<SimpleAppointmentListResponse> get copyWith => _$SimpleAppointmentListResponseCopyWithImpl<SimpleAppointmentListResponse>(this as SimpleAppointmentListResponse, _$identity);

  /// Serializes this SimpleAppointmentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleAppointmentListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.appointments, appointments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,clinicId,date,total,const DeepCollectionEquality().hash(appointments));

@override
String toString() {
  return 'SimpleAppointmentListResponse(success: $success, clinicId: $clinicId, date: $date, total: $total, appointments: $appointments)';
}


}

/// @nodoc
abstract mixin class $SimpleAppointmentListResponseCopyWith<$Res>  {
  factory $SimpleAppointmentListResponseCopyWith(SimpleAppointmentListResponse value, $Res Function(SimpleAppointmentListResponse) _then) = _$SimpleAppointmentListResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(name: 'clinic_id') String clinicId, String? date, int total, List<AppointmentListItem> appointments
});




}
/// @nodoc
class _$SimpleAppointmentListResponseCopyWithImpl<$Res>
    implements $SimpleAppointmentListResponseCopyWith<$Res> {
  _$SimpleAppointmentListResponseCopyWithImpl(this._self, this._then);

  final SimpleAppointmentListResponse _self;
  final $Res Function(SimpleAppointmentListResponse) _then;

/// Create a copy of SimpleAppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? clinicId = null,Object? date = freezed,Object? total = null,Object? appointments = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,appointments: null == appointments ? _self.appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentListItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SimpleAppointmentListResponse].
extension SimpleAppointmentListResponsePatterns on SimpleAppointmentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimpleAppointmentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimpleAppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimpleAppointmentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _SimpleAppointmentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimpleAppointmentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SimpleAppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'clinic_id')  String clinicId,  String? date,  int total,  List<AppointmentListItem> appointments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimpleAppointmentListResponse() when $default != null:
return $default(_that.success,_that.clinicId,_that.date,_that.total,_that.appointments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'clinic_id')  String clinicId,  String? date,  int total,  List<AppointmentListItem> appointments)  $default,) {final _that = this;
switch (_that) {
case _SimpleAppointmentListResponse():
return $default(_that.success,_that.clinicId,_that.date,_that.total,_that.appointments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(name: 'clinic_id')  String clinicId,  String? date,  int total,  List<AppointmentListItem> appointments)?  $default,) {final _that = this;
switch (_that) {
case _SimpleAppointmentListResponse() when $default != null:
return $default(_that.success,_that.clinicId,_that.date,_that.total,_that.appointments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimpleAppointmentListResponse implements SimpleAppointmentListResponse {
  const _SimpleAppointmentListResponse({required this.success, @JsonKey(name: 'clinic_id') required this.clinicId, this.date, required this.total, required final  List<AppointmentListItem> appointments}): _appointments = appointments;
  factory _SimpleAppointmentListResponse.fromJson(Map<String, dynamic> json) => _$SimpleAppointmentListResponseFromJson(json);

@override final  bool success;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override final  String? date;
@override final  int total;
 final  List<AppointmentListItem> _appointments;
@override List<AppointmentListItem> get appointments {
  if (_appointments is EqualUnmodifiableListView) return _appointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointments);
}


/// Create a copy of SimpleAppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimpleAppointmentListResponseCopyWith<_SimpleAppointmentListResponse> get copyWith => __$SimpleAppointmentListResponseCopyWithImpl<_SimpleAppointmentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimpleAppointmentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimpleAppointmentListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._appointments, _appointments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,clinicId,date,total,const DeepCollectionEquality().hash(_appointments));

@override
String toString() {
  return 'SimpleAppointmentListResponse(success: $success, clinicId: $clinicId, date: $date, total: $total, appointments: $appointments)';
}


}

/// @nodoc
abstract mixin class _$SimpleAppointmentListResponseCopyWith<$Res> implements $SimpleAppointmentListResponseCopyWith<$Res> {
  factory _$SimpleAppointmentListResponseCopyWith(_SimpleAppointmentListResponse value, $Res Function(_SimpleAppointmentListResponse) _then) = __$SimpleAppointmentListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(name: 'clinic_id') String clinicId, String? date, int total, List<AppointmentListItem> appointments
});




}
/// @nodoc
class __$SimpleAppointmentListResponseCopyWithImpl<$Res>
    implements _$SimpleAppointmentListResponseCopyWith<$Res> {
  __$SimpleAppointmentListResponseCopyWithImpl(this._self, this._then);

  final _SimpleAppointmentListResponse _self;
  final $Res Function(_SimpleAppointmentListResponse) _then;

/// Create a copy of SimpleAppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? clinicId = null,Object? date = freezed,Object? total = null,Object? appointments = null,}) {
  return _then(_SimpleAppointmentListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,appointments: null == appointments ? _self._appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentListItem>,
  ));
}


}

// dart format on
