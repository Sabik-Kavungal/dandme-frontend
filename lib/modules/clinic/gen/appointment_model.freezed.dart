// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentDetails {

 String? get id;@JsonKey(name: "token_number", fromJson: _tokenNumberFromJson) dynamic get tokenNumber;@JsonKey(name: "mo_id") String? get moId;@JsonKey(name: "booking_number") String? get bookingNumber;@JsonKey(name: "consultation_type") String? get consultationType;@JsonKey(name: "appointment_date_time") String? get appointmentDateTime;@JsonKey(name: "duration_minutes") int? get durationMinutes;@JsonKey(name: "session_type") String? get sessionType; String? get status;@JsonKey(name: "fee_amount") double? get feeAmount;@JsonKey(name: "fee_status") String? get feeStatus;@JsonKey(name: "payment_status") String? get paymentStatus;@JsonKey(name: "payment_method") String? get paymentMethod; String? get notes;@JsonKey(name: "cancellation_reason") String? get cancellationReason;@JsonKey(name: "slot_details") SlotDetails? get slotDetails;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;// Flat structure from API
@JsonKey(name: "patient_name") String? get patientName;@JsonKey(name: "doctor_name") String? get doctorName; String? get department;@JsonKey(name: "clinic_patient_id") String? get clinicPatientId;@JsonKey(name: "clinic_id") String? get clinicId;@JsonKey(name: "display_token") String? get displayToken;@JsonKey(name: "booking_mode") String? get bookingMode;@JsonKey(name: "queue_position") int? get queuePosition;// Nested objects (for compatibility)
 PatientDetails? get patient; DoctorDetails? get doctor; ClinicDetails? get clinic;
/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentDetailsCopyWith<AppointmentDetails> get copyWith => _$AppointmentDetailsCopyWithImpl<AppointmentDetails>(this as AppointmentDetails, _$identity);

  /// Serializes this AppointmentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentDetails&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.tokenNumber, tokenNumber)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.appointmentDateTime, appointmentDateTime) || other.appointmentDateTime == appointmentDateTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.sessionType, sessionType) || other.sessionType == sessionType)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.feeStatus, feeStatus) || other.feeStatus == feeStatus)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.slotDetails, slotDetails) || other.slotDetails == slotDetails)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.department, department) || other.department == department)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.displayToken, displayToken) || other.displayToken == displayToken)&&(identical(other.bookingMode, bookingMode) || other.bookingMode == bookingMode)&&(identical(other.queuePosition, queuePosition) || other.queuePosition == queuePosition)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.clinic, clinic) || other.clinic == clinic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,const DeepCollectionEquality().hash(tokenNumber),moId,bookingNumber,consultationType,appointmentDateTime,durationMinutes,sessionType,status,feeAmount,feeStatus,paymentStatus,paymentMethod,notes,cancellationReason,slotDetails,createdAt,updatedAt,patientName,doctorName,department,clinicPatientId,clinicId,displayToken,bookingMode,queuePosition,patient,doctor,clinic]);

@override
String toString() {
  return 'AppointmentDetails(id: $id, tokenNumber: $tokenNumber, moId: $moId, bookingNumber: $bookingNumber, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, durationMinutes: $durationMinutes, sessionType: $sessionType, status: $status, feeAmount: $feeAmount, feeStatus: $feeStatus, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, notes: $notes, cancellationReason: $cancellationReason, slotDetails: $slotDetails, createdAt: $createdAt, updatedAt: $updatedAt, patientName: $patientName, doctorName: $doctorName, department: $department, clinicPatientId: $clinicPatientId, clinicId: $clinicId, displayToken: $displayToken, bookingMode: $bookingMode, queuePosition: $queuePosition, patient: $patient, doctor: $doctor, clinic: $clinic)';
}


}

/// @nodoc
abstract mixin class $AppointmentDetailsCopyWith<$Res>  {
  factory $AppointmentDetailsCopyWith(AppointmentDetails value, $Res Function(AppointmentDetails) _then) = _$AppointmentDetailsCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: "token_number", fromJson: _tokenNumberFromJson) dynamic tokenNumber,@JsonKey(name: "mo_id") String? moId,@JsonKey(name: "booking_number") String? bookingNumber,@JsonKey(name: "consultation_type") String? consultationType,@JsonKey(name: "appointment_date_time") String? appointmentDateTime,@JsonKey(name: "duration_minutes") int? durationMinutes,@JsonKey(name: "session_type") String? sessionType, String? status,@JsonKey(name: "fee_amount") double? feeAmount,@JsonKey(name: "fee_status") String? feeStatus,@JsonKey(name: "payment_status") String? paymentStatus,@JsonKey(name: "payment_method") String? paymentMethod, String? notes,@JsonKey(name: "cancellation_reason") String? cancellationReason,@JsonKey(name: "slot_details") SlotDetails? slotDetails,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "patient_name") String? patientName,@JsonKey(name: "doctor_name") String? doctorName, String? department,@JsonKey(name: "clinic_patient_id") String? clinicPatientId,@JsonKey(name: "clinic_id") String? clinicId,@JsonKey(name: "display_token") String? displayToken,@JsonKey(name: "booking_mode") String? bookingMode,@JsonKey(name: "queue_position") int? queuePosition, PatientDetails? patient, DoctorDetails? doctor, ClinicDetails? clinic
});


$SlotDetailsCopyWith<$Res>? get slotDetails;$PatientDetailsCopyWith<$Res>? get patient;$DoctorDetailsCopyWith<$Res>? get doctor;$ClinicDetailsCopyWith<$Res>? get clinic;

}
/// @nodoc
class _$AppointmentDetailsCopyWithImpl<$Res>
    implements $AppointmentDetailsCopyWith<$Res> {
  _$AppointmentDetailsCopyWithImpl(this._self, this._then);

  final AppointmentDetails _self;
  final $Res Function(AppointmentDetails) _then;

/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tokenNumber = freezed,Object? moId = freezed,Object? bookingNumber = freezed,Object? consultationType = freezed,Object? appointmentDateTime = freezed,Object? durationMinutes = freezed,Object? sessionType = freezed,Object? status = freezed,Object? feeAmount = freezed,Object? feeStatus = freezed,Object? paymentStatus = freezed,Object? paymentMethod = freezed,Object? notes = freezed,Object? cancellationReason = freezed,Object? slotDetails = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? patientName = freezed,Object? doctorName = freezed,Object? department = freezed,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? displayToken = freezed,Object? bookingMode = freezed,Object? queuePosition = freezed,Object? patient = freezed,Object? doctor = freezed,Object? clinic = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tokenNumber: freezed == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as dynamic,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,bookingNumber: freezed == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String?,consultationType: freezed == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String?,appointmentDateTime: freezed == appointmentDateTime ? _self.appointmentDateTime : appointmentDateTime // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,sessionType: freezed == sessionType ? _self.sessionType : sessionType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,feeStatus: freezed == feeStatus ? _self.feeStatus : feeStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,slotDetails: freezed == slotDetails ? _self.slotDetails : slotDetails // ignore: cast_nullable_to_non_nullable
as SlotDetails?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,displayToken: freezed == displayToken ? _self.displayToken : displayToken // ignore: cast_nullable_to_non_nullable
as String?,bookingMode: freezed == bookingMode ? _self.bookingMode : bookingMode // ignore: cast_nullable_to_non_nullable
as String?,queuePosition: freezed == queuePosition ? _self.queuePosition : queuePosition // ignore: cast_nullable_to_non_nullable
as int?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientDetails?,doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorDetails?,clinic: freezed == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicDetails?,
  ));
}
/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SlotDetailsCopyWith<$Res>? get slotDetails {
    if (_self.slotDetails == null) {
    return null;
  }

  return $SlotDetailsCopyWith<$Res>(_self.slotDetails!, (value) {
    return _then(_self.copyWith(slotDetails: value));
  });
}/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientDetailsCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $PatientDetailsCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorDetailsCopyWith<$Res>? get doctor {
    if (_self.doctor == null) {
    return null;
  }

  return $DoctorDetailsCopyWith<$Res>(_self.doctor!, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicDetailsCopyWith<$Res>? get clinic {
    if (_self.clinic == null) {
    return null;
  }

  return $ClinicDetailsCopyWith<$Res>(_self.clinic!, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentDetails].
extension AppointmentDetailsPatterns on AppointmentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentDetails value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)  dynamic tokenNumber, @JsonKey(name: "mo_id")  String? moId, @JsonKey(name: "booking_number")  String? bookingNumber, @JsonKey(name: "consultation_type")  String? consultationType, @JsonKey(name: "appointment_date_time")  String? appointmentDateTime, @JsonKey(name: "duration_minutes")  int? durationMinutes, @JsonKey(name: "session_type")  String? sessionType,  String? status, @JsonKey(name: "fee_amount")  double? feeAmount, @JsonKey(name: "fee_status")  String? feeStatus, @JsonKey(name: "payment_status")  String? paymentStatus, @JsonKey(name: "payment_method")  String? paymentMethod,  String? notes, @JsonKey(name: "cancellation_reason")  String? cancellationReason, @JsonKey(name: "slot_details")  SlotDetails? slotDetails, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "patient_name")  String? patientName, @JsonKey(name: "doctor_name")  String? doctorName,  String? department, @JsonKey(name: "clinic_patient_id")  String? clinicPatientId, @JsonKey(name: "clinic_id")  String? clinicId, @JsonKey(name: "display_token")  String? displayToken, @JsonKey(name: "booking_mode")  String? bookingMode, @JsonKey(name: "queue_position")  int? queuePosition,  PatientDetails? patient,  DoctorDetails? doctor,  ClinicDetails? clinic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentDetails() when $default != null:
return $default(_that.id,_that.tokenNumber,_that.moId,_that.bookingNumber,_that.consultationType,_that.appointmentDateTime,_that.durationMinutes,_that.sessionType,_that.status,_that.feeAmount,_that.feeStatus,_that.paymentStatus,_that.paymentMethod,_that.notes,_that.cancellationReason,_that.slotDetails,_that.createdAt,_that.updatedAt,_that.patientName,_that.doctorName,_that.department,_that.clinicPatientId,_that.clinicId,_that.displayToken,_that.bookingMode,_that.queuePosition,_that.patient,_that.doctor,_that.clinic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)  dynamic tokenNumber, @JsonKey(name: "mo_id")  String? moId, @JsonKey(name: "booking_number")  String? bookingNumber, @JsonKey(name: "consultation_type")  String? consultationType, @JsonKey(name: "appointment_date_time")  String? appointmentDateTime, @JsonKey(name: "duration_minutes")  int? durationMinutes, @JsonKey(name: "session_type")  String? sessionType,  String? status, @JsonKey(name: "fee_amount")  double? feeAmount, @JsonKey(name: "fee_status")  String? feeStatus, @JsonKey(name: "payment_status")  String? paymentStatus, @JsonKey(name: "payment_method")  String? paymentMethod,  String? notes, @JsonKey(name: "cancellation_reason")  String? cancellationReason, @JsonKey(name: "slot_details")  SlotDetails? slotDetails, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "patient_name")  String? patientName, @JsonKey(name: "doctor_name")  String? doctorName,  String? department, @JsonKey(name: "clinic_patient_id")  String? clinicPatientId, @JsonKey(name: "clinic_id")  String? clinicId, @JsonKey(name: "display_token")  String? displayToken, @JsonKey(name: "booking_mode")  String? bookingMode, @JsonKey(name: "queue_position")  int? queuePosition,  PatientDetails? patient,  DoctorDetails? doctor,  ClinicDetails? clinic)  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetails():
return $default(_that.id,_that.tokenNumber,_that.moId,_that.bookingNumber,_that.consultationType,_that.appointmentDateTime,_that.durationMinutes,_that.sessionType,_that.status,_that.feeAmount,_that.feeStatus,_that.paymentStatus,_that.paymentMethod,_that.notes,_that.cancellationReason,_that.slotDetails,_that.createdAt,_that.updatedAt,_that.patientName,_that.doctorName,_that.department,_that.clinicPatientId,_that.clinicId,_that.displayToken,_that.bookingMode,_that.queuePosition,_that.patient,_that.doctor,_that.clinic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)  dynamic tokenNumber, @JsonKey(name: "mo_id")  String? moId, @JsonKey(name: "booking_number")  String? bookingNumber, @JsonKey(name: "consultation_type")  String? consultationType, @JsonKey(name: "appointment_date_time")  String? appointmentDateTime, @JsonKey(name: "duration_minutes")  int? durationMinutes, @JsonKey(name: "session_type")  String? sessionType,  String? status, @JsonKey(name: "fee_amount")  double? feeAmount, @JsonKey(name: "fee_status")  String? feeStatus, @JsonKey(name: "payment_status")  String? paymentStatus, @JsonKey(name: "payment_method")  String? paymentMethod,  String? notes, @JsonKey(name: "cancellation_reason")  String? cancellationReason, @JsonKey(name: "slot_details")  SlotDetails? slotDetails, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "patient_name")  String? patientName, @JsonKey(name: "doctor_name")  String? doctorName,  String? department, @JsonKey(name: "clinic_patient_id")  String? clinicPatientId, @JsonKey(name: "clinic_id")  String? clinicId, @JsonKey(name: "display_token")  String? displayToken, @JsonKey(name: "booking_mode")  String? bookingMode, @JsonKey(name: "queue_position")  int? queuePosition,  PatientDetails? patient,  DoctorDetails? doctor,  ClinicDetails? clinic)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetails() when $default != null:
return $default(_that.id,_that.tokenNumber,_that.moId,_that.bookingNumber,_that.consultationType,_that.appointmentDateTime,_that.durationMinutes,_that.sessionType,_that.status,_that.feeAmount,_that.feeStatus,_that.paymentStatus,_that.paymentMethod,_that.notes,_that.cancellationReason,_that.slotDetails,_that.createdAt,_that.updatedAt,_that.patientName,_that.doctorName,_that.department,_that.clinicPatientId,_that.clinicId,_that.displayToken,_that.bookingMode,_that.queuePosition,_that.patient,_that.doctor,_that.clinic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentDetails implements AppointmentDetails {
  const _AppointmentDetails({this.id, @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson) this.tokenNumber, @JsonKey(name: "mo_id") this.moId, @JsonKey(name: "booking_number") this.bookingNumber, @JsonKey(name: "consultation_type") this.consultationType, @JsonKey(name: "appointment_date_time") this.appointmentDateTime, @JsonKey(name: "duration_minutes") this.durationMinutes, @JsonKey(name: "session_type") this.sessionType, this.status, @JsonKey(name: "fee_amount") this.feeAmount, @JsonKey(name: "fee_status") this.feeStatus, @JsonKey(name: "payment_status") this.paymentStatus, @JsonKey(name: "payment_method") this.paymentMethod, this.notes, @JsonKey(name: "cancellation_reason") this.cancellationReason, @JsonKey(name: "slot_details") this.slotDetails, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt, @JsonKey(name: "patient_name") this.patientName, @JsonKey(name: "doctor_name") this.doctorName, this.department, @JsonKey(name: "clinic_patient_id") this.clinicPatientId, @JsonKey(name: "clinic_id") this.clinicId, @JsonKey(name: "display_token") this.displayToken, @JsonKey(name: "booking_mode") this.bookingMode, @JsonKey(name: "queue_position") this.queuePosition, this.patient, this.doctor, this.clinic});
  factory _AppointmentDetails.fromJson(Map<String, dynamic> json) => _$AppointmentDetailsFromJson(json);

@override final  String? id;
@override@JsonKey(name: "token_number", fromJson: _tokenNumberFromJson) final  dynamic tokenNumber;
@override@JsonKey(name: "mo_id") final  String? moId;
@override@JsonKey(name: "booking_number") final  String? bookingNumber;
@override@JsonKey(name: "consultation_type") final  String? consultationType;
@override@JsonKey(name: "appointment_date_time") final  String? appointmentDateTime;
@override@JsonKey(name: "duration_minutes") final  int? durationMinutes;
@override@JsonKey(name: "session_type") final  String? sessionType;
@override final  String? status;
@override@JsonKey(name: "fee_amount") final  double? feeAmount;
@override@JsonKey(name: "fee_status") final  String? feeStatus;
@override@JsonKey(name: "payment_status") final  String? paymentStatus;
@override@JsonKey(name: "payment_method") final  String? paymentMethod;
@override final  String? notes;
@override@JsonKey(name: "cancellation_reason") final  String? cancellationReason;
@override@JsonKey(name: "slot_details") final  SlotDetails? slotDetails;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;
// Flat structure from API
@override@JsonKey(name: "patient_name") final  String? patientName;
@override@JsonKey(name: "doctor_name") final  String? doctorName;
@override final  String? department;
@override@JsonKey(name: "clinic_patient_id") final  String? clinicPatientId;
@override@JsonKey(name: "clinic_id") final  String? clinicId;
@override@JsonKey(name: "display_token") final  String? displayToken;
@override@JsonKey(name: "booking_mode") final  String? bookingMode;
@override@JsonKey(name: "queue_position") final  int? queuePosition;
// Nested objects (for compatibility)
@override final  PatientDetails? patient;
@override final  DoctorDetails? doctor;
@override final  ClinicDetails? clinic;

/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentDetailsCopyWith<_AppointmentDetails> get copyWith => __$AppointmentDetailsCopyWithImpl<_AppointmentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentDetails&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.tokenNumber, tokenNumber)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.appointmentDateTime, appointmentDateTime) || other.appointmentDateTime == appointmentDateTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.sessionType, sessionType) || other.sessionType == sessionType)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.feeStatus, feeStatus) || other.feeStatus == feeStatus)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.slotDetails, slotDetails) || other.slotDetails == slotDetails)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.department, department) || other.department == department)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.displayToken, displayToken) || other.displayToken == displayToken)&&(identical(other.bookingMode, bookingMode) || other.bookingMode == bookingMode)&&(identical(other.queuePosition, queuePosition) || other.queuePosition == queuePosition)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.clinic, clinic) || other.clinic == clinic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,const DeepCollectionEquality().hash(tokenNumber),moId,bookingNumber,consultationType,appointmentDateTime,durationMinutes,sessionType,status,feeAmount,feeStatus,paymentStatus,paymentMethod,notes,cancellationReason,slotDetails,createdAt,updatedAt,patientName,doctorName,department,clinicPatientId,clinicId,displayToken,bookingMode,queuePosition,patient,doctor,clinic]);

@override
String toString() {
  return 'AppointmentDetails(id: $id, tokenNumber: $tokenNumber, moId: $moId, bookingNumber: $bookingNumber, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, durationMinutes: $durationMinutes, sessionType: $sessionType, status: $status, feeAmount: $feeAmount, feeStatus: $feeStatus, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, notes: $notes, cancellationReason: $cancellationReason, slotDetails: $slotDetails, createdAt: $createdAt, updatedAt: $updatedAt, patientName: $patientName, doctorName: $doctorName, department: $department, clinicPatientId: $clinicPatientId, clinicId: $clinicId, displayToken: $displayToken, bookingMode: $bookingMode, queuePosition: $queuePosition, patient: $patient, doctor: $doctor, clinic: $clinic)';
}


}

/// @nodoc
abstract mixin class _$AppointmentDetailsCopyWith<$Res> implements $AppointmentDetailsCopyWith<$Res> {
  factory _$AppointmentDetailsCopyWith(_AppointmentDetails value, $Res Function(_AppointmentDetails) _then) = __$AppointmentDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: "token_number", fromJson: _tokenNumberFromJson) dynamic tokenNumber,@JsonKey(name: "mo_id") String? moId,@JsonKey(name: "booking_number") String? bookingNumber,@JsonKey(name: "consultation_type") String? consultationType,@JsonKey(name: "appointment_date_time") String? appointmentDateTime,@JsonKey(name: "duration_minutes") int? durationMinutes,@JsonKey(name: "session_type") String? sessionType, String? status,@JsonKey(name: "fee_amount") double? feeAmount,@JsonKey(name: "fee_status") String? feeStatus,@JsonKey(name: "payment_status") String? paymentStatus,@JsonKey(name: "payment_method") String? paymentMethod, String? notes,@JsonKey(name: "cancellation_reason") String? cancellationReason,@JsonKey(name: "slot_details") SlotDetails? slotDetails,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "patient_name") String? patientName,@JsonKey(name: "doctor_name") String? doctorName, String? department,@JsonKey(name: "clinic_patient_id") String? clinicPatientId,@JsonKey(name: "clinic_id") String? clinicId,@JsonKey(name: "display_token") String? displayToken,@JsonKey(name: "booking_mode") String? bookingMode,@JsonKey(name: "queue_position") int? queuePosition, PatientDetails? patient, DoctorDetails? doctor, ClinicDetails? clinic
});


@override $SlotDetailsCopyWith<$Res>? get slotDetails;@override $PatientDetailsCopyWith<$Res>? get patient;@override $DoctorDetailsCopyWith<$Res>? get doctor;@override $ClinicDetailsCopyWith<$Res>? get clinic;

}
/// @nodoc
class __$AppointmentDetailsCopyWithImpl<$Res>
    implements _$AppointmentDetailsCopyWith<$Res> {
  __$AppointmentDetailsCopyWithImpl(this._self, this._then);

  final _AppointmentDetails _self;
  final $Res Function(_AppointmentDetails) _then;

/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tokenNumber = freezed,Object? moId = freezed,Object? bookingNumber = freezed,Object? consultationType = freezed,Object? appointmentDateTime = freezed,Object? durationMinutes = freezed,Object? sessionType = freezed,Object? status = freezed,Object? feeAmount = freezed,Object? feeStatus = freezed,Object? paymentStatus = freezed,Object? paymentMethod = freezed,Object? notes = freezed,Object? cancellationReason = freezed,Object? slotDetails = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? patientName = freezed,Object? doctorName = freezed,Object? department = freezed,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? displayToken = freezed,Object? bookingMode = freezed,Object? queuePosition = freezed,Object? patient = freezed,Object? doctor = freezed,Object? clinic = freezed,}) {
  return _then(_AppointmentDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tokenNumber: freezed == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as dynamic,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,bookingNumber: freezed == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String?,consultationType: freezed == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String?,appointmentDateTime: freezed == appointmentDateTime ? _self.appointmentDateTime : appointmentDateTime // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,sessionType: freezed == sessionType ? _self.sessionType : sessionType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,feeStatus: freezed == feeStatus ? _self.feeStatus : feeStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,slotDetails: freezed == slotDetails ? _self.slotDetails : slotDetails // ignore: cast_nullable_to_non_nullable
as SlotDetails?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,displayToken: freezed == displayToken ? _self.displayToken : displayToken // ignore: cast_nullable_to_non_nullable
as String?,bookingMode: freezed == bookingMode ? _self.bookingMode : bookingMode // ignore: cast_nullable_to_non_nullable
as String?,queuePosition: freezed == queuePosition ? _self.queuePosition : queuePosition // ignore: cast_nullable_to_non_nullable
as int?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientDetails?,doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorDetails?,clinic: freezed == clinic ? _self.clinic : clinic // ignore: cast_nullable_to_non_nullable
as ClinicDetails?,
  ));
}

/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SlotDetailsCopyWith<$Res>? get slotDetails {
    if (_self.slotDetails == null) {
    return null;
  }

  return $SlotDetailsCopyWith<$Res>(_self.slotDetails!, (value) {
    return _then(_self.copyWith(slotDetails: value));
  });
}/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientDetailsCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $PatientDetailsCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorDetailsCopyWith<$Res>? get doctor {
    if (_self.doctor == null) {
    return null;
  }

  return $DoctorDetailsCopyWith<$Res>(_self.doctor!, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}/// Create a copy of AppointmentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicDetailsCopyWith<$Res>? get clinic {
    if (_self.clinic == null) {
    return null;
  }

  return $ClinicDetailsCopyWith<$Res>(_self.clinic!, (value) {
    return _then(_self.copyWith(clinic: value));
  });
}
}


/// @nodoc
mixin _$PatientDetails {

 String? get name; String? get phone; String? get email; int? get age; String? get gender;
/// Create a copy of PatientDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientDetailsCopyWith<PatientDetails> get copyWith => _$PatientDetailsCopyWithImpl<PatientDetails>(this as PatientDetails, _$identity);

  /// Serializes this PatientDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,email,age,gender);

@override
String toString() {
  return 'PatientDetails(name: $name, phone: $phone, email: $email, age: $age, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $PatientDetailsCopyWith<$Res>  {
  factory $PatientDetailsCopyWith(PatientDetails value, $Res Function(PatientDetails) _then) = _$PatientDetailsCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone, String? email, int? age, String? gender
});




}
/// @nodoc
class _$PatientDetailsCopyWithImpl<$Res>
    implements $PatientDetailsCopyWith<$Res> {
  _$PatientDetailsCopyWithImpl(this._self, this._then);

  final PatientDetails _self;
  final $Res Function(PatientDetails) _then;

/// Create a copy of PatientDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone = freezed,Object? email = freezed,Object? age = freezed,Object? gender = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientDetails].
extension PatientDetailsPatterns on PatientDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientDetails value)  $default,){
final _that = this;
switch (_that) {
case _PatientDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PatientDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? email,  int? age,  String? gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientDetails() when $default != null:
return $default(_that.name,_that.phone,_that.email,_that.age,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? email,  int? age,  String? gender)  $default,) {final _that = this;
switch (_that) {
case _PatientDetails():
return $default(_that.name,_that.phone,_that.email,_that.age,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone,  String? email,  int? age,  String? gender)?  $default,) {final _that = this;
switch (_that) {
case _PatientDetails() when $default != null:
return $default(_that.name,_that.phone,_that.email,_that.age,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientDetails implements PatientDetails {
  const _PatientDetails({this.name, this.phone, this.email, this.age, this.gender});
  factory _PatientDetails.fromJson(Map<String, dynamic> json) => _$PatientDetailsFromJson(json);

@override final  String? name;
@override final  String? phone;
@override final  String? email;
@override final  int? age;
@override final  String? gender;

/// Create a copy of PatientDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientDetailsCopyWith<_PatientDetails> get copyWith => __$PatientDetailsCopyWithImpl<_PatientDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,email,age,gender);

@override
String toString() {
  return 'PatientDetails(name: $name, phone: $phone, email: $email, age: $age, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$PatientDetailsCopyWith<$Res> implements $PatientDetailsCopyWith<$Res> {
  factory _$PatientDetailsCopyWith(_PatientDetails value, $Res Function(_PatientDetails) _then) = __$PatientDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone, String? email, int? age, String? gender
});




}
/// @nodoc
class __$PatientDetailsCopyWithImpl<$Res>
    implements _$PatientDetailsCopyWith<$Res> {
  __$PatientDetailsCopyWithImpl(this._self, this._then);

  final _PatientDetails _self;
  final $Res Function(_PatientDetails) _then;

/// Create a copy of PatientDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone = freezed,Object? email = freezed,Object? age = freezed,Object? gender = freezed,}) {
  return _then(_PatientDetails(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DoctorDetails {

 String? get id; String? get name;
/// Create a copy of DoctorDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorDetailsCopyWith<DoctorDetails> get copyWith => _$DoctorDetailsCopyWithImpl<DoctorDetails>(this as DoctorDetails, _$identity);

  /// Serializes this DoctorDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DoctorDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $DoctorDetailsCopyWith<$Res>  {
  factory $DoctorDetailsCopyWith(DoctorDetails value, $Res Function(DoctorDetails) _then) = _$DoctorDetailsCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$DoctorDetailsCopyWithImpl<$Res>
    implements $DoctorDetailsCopyWith<$Res> {
  _$DoctorDetailsCopyWithImpl(this._self, this._then);

  final DoctorDetails _self;
  final $Res Function(DoctorDetails) _then;

/// Create a copy of DoctorDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorDetails].
extension DoctorDetailsPatterns on DoctorDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorDetails value)  $default,){
final _that = this;
switch (_that) {
case _DoctorDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorDetails value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorDetails() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _DoctorDetails():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _DoctorDetails() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorDetails implements DoctorDetails {
  const _DoctorDetails({this.id, this.name});
  factory _DoctorDetails.fromJson(Map<String, dynamic> json) => _$DoctorDetailsFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of DoctorDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorDetailsCopyWith<_DoctorDetails> get copyWith => __$DoctorDetailsCopyWithImpl<_DoctorDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DoctorDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DoctorDetailsCopyWith<$Res> implements $DoctorDetailsCopyWith<$Res> {
  factory _$DoctorDetailsCopyWith(_DoctorDetails value, $Res Function(_DoctorDetails) _then) = __$DoctorDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$DoctorDetailsCopyWithImpl<$Res>
    implements _$DoctorDetailsCopyWith<$Res> {
  __$DoctorDetailsCopyWithImpl(this._self, this._then);

  final _DoctorDetails _self;
  final $Res Function(_DoctorDetails) _then;

/// Create a copy of DoctorDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_DoctorDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DepartmentDetails {

 String? get id; String? get name;
/// Create a copy of DepartmentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentDetailsCopyWith<DepartmentDetails> get copyWith => _$DepartmentDetailsCopyWithImpl<DepartmentDetails>(this as DepartmentDetails, _$identity);

  /// Serializes this DepartmentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DepartmentDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $DepartmentDetailsCopyWith<$Res>  {
  factory $DepartmentDetailsCopyWith(DepartmentDetails value, $Res Function(DepartmentDetails) _then) = _$DepartmentDetailsCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$DepartmentDetailsCopyWithImpl<$Res>
    implements $DepartmentDetailsCopyWith<$Res> {
  _$DepartmentDetailsCopyWithImpl(this._self, this._then);

  final DepartmentDetails _self;
  final $Res Function(DepartmentDetails) _then;

/// Create a copy of DepartmentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentDetails].
extension DepartmentDetailsPatterns on DepartmentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentDetails value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentDetails() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _DepartmentDetails():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentDetails() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentDetails implements DepartmentDetails {
  const _DepartmentDetails({this.id, this.name});
  factory _DepartmentDetails.fromJson(Map<String, dynamic> json) => _$DepartmentDetailsFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of DepartmentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentDetailsCopyWith<_DepartmentDetails> get copyWith => __$DepartmentDetailsCopyWithImpl<_DepartmentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DepartmentDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DepartmentDetailsCopyWith<$Res> implements $DepartmentDetailsCopyWith<$Res> {
  factory _$DepartmentDetailsCopyWith(_DepartmentDetails value, $Res Function(_DepartmentDetails) _then) = __$DepartmentDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$DepartmentDetailsCopyWithImpl<$Res>
    implements _$DepartmentDetailsCopyWith<$Res> {
  __$DepartmentDetailsCopyWithImpl(this._self, this._then);

  final _DepartmentDetails _self;
  final $Res Function(_DepartmentDetails) _then;

/// Create a copy of DepartmentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_DepartmentDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClinicDetails {

 String? get id; String? get name;
/// Create a copy of ClinicDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicDetailsCopyWith<ClinicDetails> get copyWith => _$ClinicDetailsCopyWithImpl<ClinicDetails>(this as ClinicDetails, _$identity);

  /// Serializes this ClinicDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ClinicDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $ClinicDetailsCopyWith<$Res>  {
  factory $ClinicDetailsCopyWith(ClinicDetails value, $Res Function(ClinicDetails) _then) = _$ClinicDetailsCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$ClinicDetailsCopyWithImpl<$Res>
    implements $ClinicDetailsCopyWith<$Res> {
  _$ClinicDetailsCopyWithImpl(this._self, this._then);

  final ClinicDetails _self;
  final $Res Function(ClinicDetails) _then;

/// Create a copy of ClinicDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicDetails].
extension ClinicDetailsPatterns on ClinicDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicDetails value)  $default,){
final _that = this;
switch (_that) {
case _ClinicDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicDetails() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _ClinicDetails():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _ClinicDetails() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicDetails implements ClinicDetails {
  const _ClinicDetails({this.id, this.name});
  factory _ClinicDetails.fromJson(Map<String, dynamic> json) => _$ClinicDetailsFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of ClinicDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicDetailsCopyWith<_ClinicDetails> get copyWith => __$ClinicDetailsCopyWithImpl<_ClinicDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ClinicDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ClinicDetailsCopyWith<$Res> implements $ClinicDetailsCopyWith<$Res> {
  factory _$ClinicDetailsCopyWith(_ClinicDetails value, $Res Function(_ClinicDetails) _then) = __$ClinicDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$ClinicDetailsCopyWithImpl<$Res>
    implements _$ClinicDetailsCopyWith<$Res> {
  __$ClinicDetailsCopyWithImpl(this._self, this._then);

  final _ClinicDetails _self;
  final $Res Function(_ClinicDetails) _then;

/// Create a copy of ClinicDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_ClinicDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SlotDetails {

@JsonKey(name: "slot_id") String? get slotId;@JsonKey(name: "slot_status") String? get slotStatus;@JsonKey(name: "slot_start_time") String? get slotStartTime;@JsonKey(name: "slot_end_time") String? get slotEndTime;@JsonKey(name: "slot_date") String? get slotDate;@JsonKey(name: "slot_full_time") String? get slotFullTime;@JsonKey(name: "session_name") String? get sessionName;
/// Create a copy of SlotDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotDetailsCopyWith<SlotDetails> get copyWith => _$SlotDetailsCopyWithImpl<SlotDetails>(this as SlotDetails, _$identity);

  /// Serializes this SlotDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotDetails&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.slotStatus, slotStatus) || other.slotStatus == slotStatus)&&(identical(other.slotStartTime, slotStartTime) || other.slotStartTime == slotStartTime)&&(identical(other.slotEndTime, slotEndTime) || other.slotEndTime == slotEndTime)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.slotFullTime, slotFullTime) || other.slotFullTime == slotFullTime)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slotId,slotStatus,slotStartTime,slotEndTime,slotDate,slotFullTime,sessionName);

@override
String toString() {
  return 'SlotDetails(slotId: $slotId, slotStatus: $slotStatus, slotStartTime: $slotStartTime, slotEndTime: $slotEndTime, slotDate: $slotDate, slotFullTime: $slotFullTime, sessionName: $sessionName)';
}


}

/// @nodoc
abstract mixin class $SlotDetailsCopyWith<$Res>  {
  factory $SlotDetailsCopyWith(SlotDetails value, $Res Function(SlotDetails) _then) = _$SlotDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "slot_id") String? slotId,@JsonKey(name: "slot_status") String? slotStatus,@JsonKey(name: "slot_start_time") String? slotStartTime,@JsonKey(name: "slot_end_time") String? slotEndTime,@JsonKey(name: "slot_date") String? slotDate,@JsonKey(name: "slot_full_time") String? slotFullTime,@JsonKey(name: "session_name") String? sessionName
});




}
/// @nodoc
class _$SlotDetailsCopyWithImpl<$Res>
    implements $SlotDetailsCopyWith<$Res> {
  _$SlotDetailsCopyWithImpl(this._self, this._then);

  final SlotDetails _self;
  final $Res Function(SlotDetails) _then;

/// Create a copy of SlotDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slotId = freezed,Object? slotStatus = freezed,Object? slotStartTime = freezed,Object? slotEndTime = freezed,Object? slotDate = freezed,Object? slotFullTime = freezed,Object? sessionName = freezed,}) {
  return _then(_self.copyWith(
slotId: freezed == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String?,slotStatus: freezed == slotStatus ? _self.slotStatus : slotStatus // ignore: cast_nullable_to_non_nullable
as String?,slotStartTime: freezed == slotStartTime ? _self.slotStartTime : slotStartTime // ignore: cast_nullable_to_non_nullable
as String?,slotEndTime: freezed == slotEndTime ? _self.slotEndTime : slotEndTime // ignore: cast_nullable_to_non_nullable
as String?,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as String?,slotFullTime: freezed == slotFullTime ? _self.slotFullTime : slotFullTime // ignore: cast_nullable_to_non_nullable
as String?,sessionName: freezed == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SlotDetails].
extension SlotDetailsPatterns on SlotDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlotDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlotDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlotDetails value)  $default,){
final _that = this;
switch (_that) {
case _SlotDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlotDetails value)?  $default,){
final _that = this;
switch (_that) {
case _SlotDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "slot_id")  String? slotId, @JsonKey(name: "slot_status")  String? slotStatus, @JsonKey(name: "slot_start_time")  String? slotStartTime, @JsonKey(name: "slot_end_time")  String? slotEndTime, @JsonKey(name: "slot_date")  String? slotDate, @JsonKey(name: "slot_full_time")  String? slotFullTime, @JsonKey(name: "session_name")  String? sessionName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlotDetails() when $default != null:
return $default(_that.slotId,_that.slotStatus,_that.slotStartTime,_that.slotEndTime,_that.slotDate,_that.slotFullTime,_that.sessionName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "slot_id")  String? slotId, @JsonKey(name: "slot_status")  String? slotStatus, @JsonKey(name: "slot_start_time")  String? slotStartTime, @JsonKey(name: "slot_end_time")  String? slotEndTime, @JsonKey(name: "slot_date")  String? slotDate, @JsonKey(name: "slot_full_time")  String? slotFullTime, @JsonKey(name: "session_name")  String? sessionName)  $default,) {final _that = this;
switch (_that) {
case _SlotDetails():
return $default(_that.slotId,_that.slotStatus,_that.slotStartTime,_that.slotEndTime,_that.slotDate,_that.slotFullTime,_that.sessionName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "slot_id")  String? slotId, @JsonKey(name: "slot_status")  String? slotStatus, @JsonKey(name: "slot_start_time")  String? slotStartTime, @JsonKey(name: "slot_end_time")  String? slotEndTime, @JsonKey(name: "slot_date")  String? slotDate, @JsonKey(name: "slot_full_time")  String? slotFullTime, @JsonKey(name: "session_name")  String? sessionName)?  $default,) {final _that = this;
switch (_that) {
case _SlotDetails() when $default != null:
return $default(_that.slotId,_that.slotStatus,_that.slotStartTime,_that.slotEndTime,_that.slotDate,_that.slotFullTime,_that.sessionName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SlotDetails implements SlotDetails {
  const _SlotDetails({@JsonKey(name: "slot_id") this.slotId, @JsonKey(name: "slot_status") this.slotStatus, @JsonKey(name: "slot_start_time") this.slotStartTime, @JsonKey(name: "slot_end_time") this.slotEndTime, @JsonKey(name: "slot_date") this.slotDate, @JsonKey(name: "slot_full_time") this.slotFullTime, @JsonKey(name: "session_name") this.sessionName});
  factory _SlotDetails.fromJson(Map<String, dynamic> json) => _$SlotDetailsFromJson(json);

@override@JsonKey(name: "slot_id") final  String? slotId;
@override@JsonKey(name: "slot_status") final  String? slotStatus;
@override@JsonKey(name: "slot_start_time") final  String? slotStartTime;
@override@JsonKey(name: "slot_end_time") final  String? slotEndTime;
@override@JsonKey(name: "slot_date") final  String? slotDate;
@override@JsonKey(name: "slot_full_time") final  String? slotFullTime;
@override@JsonKey(name: "session_name") final  String? sessionName;

/// Create a copy of SlotDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotDetailsCopyWith<_SlotDetails> get copyWith => __$SlotDetailsCopyWithImpl<_SlotDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotDetails&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.slotStatus, slotStatus) || other.slotStatus == slotStatus)&&(identical(other.slotStartTime, slotStartTime) || other.slotStartTime == slotStartTime)&&(identical(other.slotEndTime, slotEndTime) || other.slotEndTime == slotEndTime)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.slotFullTime, slotFullTime) || other.slotFullTime == slotFullTime)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slotId,slotStatus,slotStartTime,slotEndTime,slotDate,slotFullTime,sessionName);

@override
String toString() {
  return 'SlotDetails(slotId: $slotId, slotStatus: $slotStatus, slotStartTime: $slotStartTime, slotEndTime: $slotEndTime, slotDate: $slotDate, slotFullTime: $slotFullTime, sessionName: $sessionName)';
}


}

/// @nodoc
abstract mixin class _$SlotDetailsCopyWith<$Res> implements $SlotDetailsCopyWith<$Res> {
  factory _$SlotDetailsCopyWith(_SlotDetails value, $Res Function(_SlotDetails) _then) = __$SlotDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "slot_id") String? slotId,@JsonKey(name: "slot_status") String? slotStatus,@JsonKey(name: "slot_start_time") String? slotStartTime,@JsonKey(name: "slot_end_time") String? slotEndTime,@JsonKey(name: "slot_date") String? slotDate,@JsonKey(name: "slot_full_time") String? slotFullTime,@JsonKey(name: "session_name") String? sessionName
});




}
/// @nodoc
class __$SlotDetailsCopyWithImpl<$Res>
    implements _$SlotDetailsCopyWith<$Res> {
  __$SlotDetailsCopyWithImpl(this._self, this._then);

  final _SlotDetails _self;
  final $Res Function(_SlotDetails) _then;

/// Create a copy of SlotDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slotId = freezed,Object? slotStatus = freezed,Object? slotStartTime = freezed,Object? slotEndTime = freezed,Object? slotDate = freezed,Object? slotFullTime = freezed,Object? sessionName = freezed,}) {
  return _then(_SlotDetails(
slotId: freezed == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String?,slotStatus: freezed == slotStatus ? _self.slotStatus : slotStatus // ignore: cast_nullable_to_non_nullable
as String?,slotStartTime: freezed == slotStartTime ? _self.slotStartTime : slotStartTime // ignore: cast_nullable_to_non_nullable
as String?,slotEndTime: freezed == slotEndTime ? _self.slotEndTime : slotEndTime // ignore: cast_nullable_to_non_nullable
as String?,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as String?,slotFullTime: freezed == slotFullTime ? _self.slotFullTime : slotFullTime // ignore: cast_nullable_to_non_nullable
as String?,sessionName: freezed == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Appointment {

 String? get id;@JsonKey(name: "token_number") int? get tokenNumber;@JsonKey(name: "mo_id") String? get moId;@JsonKey(name: "patient_name") String? get patientName;@JsonKey(name: "doctor_name") String? get doctorName; String? get department;@JsonKey(name: "consultation_type") String? get consultationType;@JsonKey(name: "appointment_date_time") String? get appointmentDateTime; String? get status;@JsonKey(name: "fee_status") String? get feeStatus;@JsonKey(name: "fee_amount") double? get feeAmount;@JsonKey(name: "payment_status") String? get paymentStatus;@JsonKey(name: "booking_number") String? get bookingNumber;@JsonKey(name: "created_at") String? get createdAt;// Legacy fields for backward compatibility
 String? get appointmentId; String? get patientId; String? get doctorId; String? get appointmentDate; String? get appointmentTime; String? get bookedOn; String? get reasonForVisit; String? get notes; double? get fee; String? get paymentMethod; Patient? get patient; Doctor? get doctor;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.tokenNumber, tokenNumber) || other.tokenNumber == tokenNumber)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.department, department) || other.department == department)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.appointmentDateTime, appointmentDateTime) || other.appointmentDateTime == appointmentDateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeStatus, feeStatus) || other.feeStatus == feeStatus)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.bookedOn, bookedOn) || other.bookedOn == bookedOn)&&(identical(other.reasonForVisit, reasonForVisit) || other.reasonForVisit == reasonForVisit)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.doctor, doctor) || other.doctor == doctor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tokenNumber,moId,patientName,doctorName,department,consultationType,appointmentDateTime,status,feeStatus,feeAmount,paymentStatus,bookingNumber,createdAt,appointmentId,patientId,doctorId,appointmentDate,appointmentTime,bookedOn,reasonForVisit,notes,fee,paymentMethod,patient,doctor]);

@override
String toString() {
  return 'Appointment(id: $id, tokenNumber: $tokenNumber, moId: $moId, patientName: $patientName, doctorName: $doctorName, department: $department, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, status: $status, feeStatus: $feeStatus, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt, appointmentId: $appointmentId, patientId: $patientId, doctorId: $doctorId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, bookedOn: $bookedOn, reasonForVisit: $reasonForVisit, notes: $notes, fee: $fee, paymentMethod: $paymentMethod, patient: $patient, doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: "token_number") int? tokenNumber,@JsonKey(name: "mo_id") String? moId,@JsonKey(name: "patient_name") String? patientName,@JsonKey(name: "doctor_name") String? doctorName, String? department,@JsonKey(name: "consultation_type") String? consultationType,@JsonKey(name: "appointment_date_time") String? appointmentDateTime, String? status,@JsonKey(name: "fee_status") String? feeStatus,@JsonKey(name: "fee_amount") double? feeAmount,@JsonKey(name: "payment_status") String? paymentStatus,@JsonKey(name: "booking_number") String? bookingNumber,@JsonKey(name: "created_at") String? createdAt, String? appointmentId, String? patientId, String? doctorId, String? appointmentDate, String? appointmentTime, String? bookedOn, String? reasonForVisit, String? notes, double? fee, String? paymentMethod, Patient? patient, Doctor? doctor
});


$PatientCopyWith<$Res>? get patient;$DoctorCopyWith<$Res>? get doctor;

}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tokenNumber = freezed,Object? moId = freezed,Object? patientName = freezed,Object? doctorName = freezed,Object? department = freezed,Object? consultationType = freezed,Object? appointmentDateTime = freezed,Object? status = freezed,Object? feeStatus = freezed,Object? feeAmount = freezed,Object? paymentStatus = freezed,Object? bookingNumber = freezed,Object? createdAt = freezed,Object? appointmentId = freezed,Object? patientId = freezed,Object? doctorId = freezed,Object? appointmentDate = freezed,Object? appointmentTime = freezed,Object? bookedOn = freezed,Object? reasonForVisit = freezed,Object? notes = freezed,Object? fee = freezed,Object? paymentMethod = freezed,Object? patient = freezed,Object? doctor = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tokenNumber: freezed == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as int?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,consultationType: freezed == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String?,appointmentDateTime: freezed == appointmentDateTime ? _self.appointmentDateTime : appointmentDateTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,feeStatus: freezed == feeStatus ? _self.feeStatus : feeStatus // ignore: cast_nullable_to_non_nullable
as String?,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,bookingNumber: freezed == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,appointmentDate: freezed == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String?,appointmentTime: freezed == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String?,bookedOn: freezed == bookedOn ? _self.bookedOn : bookedOn // ignore: cast_nullable_to_non_nullable
as String?,reasonForVisit: freezed == reasonForVisit ? _self.reasonForVisit : reasonForVisit // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient?,doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as Doctor?,
  ));
}
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $PatientCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorCopyWith<$Res>? get doctor {
    if (_self.doctor == null) {
    return null;
  }

  return $DoctorCopyWith<$Res>(_self.doctor!, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Appointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Appointment value)  $default,){
final _that = this;
switch (_that) {
case _Appointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Appointment value)?  $default,){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: "token_number")  int? tokenNumber, @JsonKey(name: "mo_id")  String? moId, @JsonKey(name: "patient_name")  String? patientName, @JsonKey(name: "doctor_name")  String? doctorName,  String? department, @JsonKey(name: "consultation_type")  String? consultationType, @JsonKey(name: "appointment_date_time")  String? appointmentDateTime,  String? status, @JsonKey(name: "fee_status")  String? feeStatus, @JsonKey(name: "fee_amount")  double? feeAmount, @JsonKey(name: "payment_status")  String? paymentStatus, @JsonKey(name: "booking_number")  String? bookingNumber, @JsonKey(name: "created_at")  String? createdAt,  String? appointmentId,  String? patientId,  String? doctorId,  String? appointmentDate,  String? appointmentTime,  String? bookedOn,  String? reasonForVisit,  String? notes,  double? fee,  String? paymentMethod,  Patient? patient,  Doctor? doctor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.tokenNumber,_that.moId,_that.patientName,_that.doctorName,_that.department,_that.consultationType,_that.appointmentDateTime,_that.status,_that.feeStatus,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt,_that.appointmentId,_that.patientId,_that.doctorId,_that.appointmentDate,_that.appointmentTime,_that.bookedOn,_that.reasonForVisit,_that.notes,_that.fee,_that.paymentMethod,_that.patient,_that.doctor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: "token_number")  int? tokenNumber, @JsonKey(name: "mo_id")  String? moId, @JsonKey(name: "patient_name")  String? patientName, @JsonKey(name: "doctor_name")  String? doctorName,  String? department, @JsonKey(name: "consultation_type")  String? consultationType, @JsonKey(name: "appointment_date_time")  String? appointmentDateTime,  String? status, @JsonKey(name: "fee_status")  String? feeStatus, @JsonKey(name: "fee_amount")  double? feeAmount, @JsonKey(name: "payment_status")  String? paymentStatus, @JsonKey(name: "booking_number")  String? bookingNumber, @JsonKey(name: "created_at")  String? createdAt,  String? appointmentId,  String? patientId,  String? doctorId,  String? appointmentDate,  String? appointmentTime,  String? bookedOn,  String? reasonForVisit,  String? notes,  double? fee,  String? paymentMethod,  Patient? patient,  Doctor? doctor)  $default,) {final _that = this;
switch (_that) {
case _Appointment():
return $default(_that.id,_that.tokenNumber,_that.moId,_that.patientName,_that.doctorName,_that.department,_that.consultationType,_that.appointmentDateTime,_that.status,_that.feeStatus,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt,_that.appointmentId,_that.patientId,_that.doctorId,_that.appointmentDate,_that.appointmentTime,_that.bookedOn,_that.reasonForVisit,_that.notes,_that.fee,_that.paymentMethod,_that.patient,_that.doctor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: "token_number")  int? tokenNumber, @JsonKey(name: "mo_id")  String? moId, @JsonKey(name: "patient_name")  String? patientName, @JsonKey(name: "doctor_name")  String? doctorName,  String? department, @JsonKey(name: "consultation_type")  String? consultationType, @JsonKey(name: "appointment_date_time")  String? appointmentDateTime,  String? status, @JsonKey(name: "fee_status")  String? feeStatus, @JsonKey(name: "fee_amount")  double? feeAmount, @JsonKey(name: "payment_status")  String? paymentStatus, @JsonKey(name: "booking_number")  String? bookingNumber, @JsonKey(name: "created_at")  String? createdAt,  String? appointmentId,  String? patientId,  String? doctorId,  String? appointmentDate,  String? appointmentTime,  String? bookedOn,  String? reasonForVisit,  String? notes,  double? fee,  String? paymentMethod,  Patient? patient,  Doctor? doctor)?  $default,) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.tokenNumber,_that.moId,_that.patientName,_that.doctorName,_that.department,_that.consultationType,_that.appointmentDateTime,_that.status,_that.feeStatus,_that.feeAmount,_that.paymentStatus,_that.bookingNumber,_that.createdAt,_that.appointmentId,_that.patientId,_that.doctorId,_that.appointmentDate,_that.appointmentTime,_that.bookedOn,_that.reasonForVisit,_that.notes,_that.fee,_that.paymentMethod,_that.patient,_that.doctor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Appointment implements Appointment {
  const _Appointment({this.id, @JsonKey(name: "token_number") this.tokenNumber, @JsonKey(name: "mo_id") this.moId, @JsonKey(name: "patient_name") this.patientName, @JsonKey(name: "doctor_name") this.doctorName, this.department, @JsonKey(name: "consultation_type") this.consultationType, @JsonKey(name: "appointment_date_time") this.appointmentDateTime, this.status, @JsonKey(name: "fee_status") this.feeStatus, @JsonKey(name: "fee_amount") this.feeAmount, @JsonKey(name: "payment_status") this.paymentStatus, @JsonKey(name: "booking_number") this.bookingNumber, @JsonKey(name: "created_at") this.createdAt, this.appointmentId, this.patientId, this.doctorId, this.appointmentDate, this.appointmentTime, this.bookedOn, this.reasonForVisit, this.notes, this.fee, this.paymentMethod, this.patient, this.doctor});
  factory _Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

@override final  String? id;
@override@JsonKey(name: "token_number") final  int? tokenNumber;
@override@JsonKey(name: "mo_id") final  String? moId;
@override@JsonKey(name: "patient_name") final  String? patientName;
@override@JsonKey(name: "doctor_name") final  String? doctorName;
@override final  String? department;
@override@JsonKey(name: "consultation_type") final  String? consultationType;
@override@JsonKey(name: "appointment_date_time") final  String? appointmentDateTime;
@override final  String? status;
@override@JsonKey(name: "fee_status") final  String? feeStatus;
@override@JsonKey(name: "fee_amount") final  double? feeAmount;
@override@JsonKey(name: "payment_status") final  String? paymentStatus;
@override@JsonKey(name: "booking_number") final  String? bookingNumber;
@override@JsonKey(name: "created_at") final  String? createdAt;
// Legacy fields for backward compatibility
@override final  String? appointmentId;
@override final  String? patientId;
@override final  String? doctorId;
@override final  String? appointmentDate;
@override final  String? appointmentTime;
@override final  String? bookedOn;
@override final  String? reasonForVisit;
@override final  String? notes;
@override final  double? fee;
@override final  String? paymentMethod;
@override final  Patient? patient;
@override final  Doctor? doctor;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.tokenNumber, tokenNumber) || other.tokenNumber == tokenNumber)&&(identical(other.moId, moId) || other.moId == moId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.department, department) || other.department == department)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.appointmentDateTime, appointmentDateTime) || other.appointmentDateTime == appointmentDateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeStatus, feeStatus) || other.feeStatus == feeStatus)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.bookedOn, bookedOn) || other.bookedOn == bookedOn)&&(identical(other.reasonForVisit, reasonForVisit) || other.reasonForVisit == reasonForVisit)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.doctor, doctor) || other.doctor == doctor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tokenNumber,moId,patientName,doctorName,department,consultationType,appointmentDateTime,status,feeStatus,feeAmount,paymentStatus,bookingNumber,createdAt,appointmentId,patientId,doctorId,appointmentDate,appointmentTime,bookedOn,reasonForVisit,notes,fee,paymentMethod,patient,doctor]);

@override
String toString() {
  return 'Appointment(id: $id, tokenNumber: $tokenNumber, moId: $moId, patientName: $patientName, doctorName: $doctorName, department: $department, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, status: $status, feeStatus: $feeStatus, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt, appointmentId: $appointmentId, patientId: $patientId, doctorId: $doctorId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, bookedOn: $bookedOn, reasonForVisit: $reasonForVisit, notes: $notes, fee: $fee, paymentMethod: $paymentMethod, patient: $patient, doctor: $doctor)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: "token_number") int? tokenNumber,@JsonKey(name: "mo_id") String? moId,@JsonKey(name: "patient_name") String? patientName,@JsonKey(name: "doctor_name") String? doctorName, String? department,@JsonKey(name: "consultation_type") String? consultationType,@JsonKey(name: "appointment_date_time") String? appointmentDateTime, String? status,@JsonKey(name: "fee_status") String? feeStatus,@JsonKey(name: "fee_amount") double? feeAmount,@JsonKey(name: "payment_status") String? paymentStatus,@JsonKey(name: "booking_number") String? bookingNumber,@JsonKey(name: "created_at") String? createdAt, String? appointmentId, String? patientId, String? doctorId, String? appointmentDate, String? appointmentTime, String? bookedOn, String? reasonForVisit, String? notes, double? fee, String? paymentMethod, Patient? patient, Doctor? doctor
});


@override $PatientCopyWith<$Res>? get patient;@override $DoctorCopyWith<$Res>? get doctor;

}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tokenNumber = freezed,Object? moId = freezed,Object? patientName = freezed,Object? doctorName = freezed,Object? department = freezed,Object? consultationType = freezed,Object? appointmentDateTime = freezed,Object? status = freezed,Object? feeStatus = freezed,Object? feeAmount = freezed,Object? paymentStatus = freezed,Object? bookingNumber = freezed,Object? createdAt = freezed,Object? appointmentId = freezed,Object? patientId = freezed,Object? doctorId = freezed,Object? appointmentDate = freezed,Object? appointmentTime = freezed,Object? bookedOn = freezed,Object? reasonForVisit = freezed,Object? notes = freezed,Object? fee = freezed,Object? paymentMethod = freezed,Object? patient = freezed,Object? doctor = freezed,}) {
  return _then(_Appointment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tokenNumber: freezed == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as int?,moId: freezed == moId ? _self.moId : moId // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,consultationType: freezed == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String?,appointmentDateTime: freezed == appointmentDateTime ? _self.appointmentDateTime : appointmentDateTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,feeStatus: freezed == feeStatus ? _self.feeStatus : feeStatus // ignore: cast_nullable_to_non_nullable
as String?,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,bookingNumber: freezed == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,appointmentDate: freezed == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String?,appointmentTime: freezed == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String?,bookedOn: freezed == bookedOn ? _self.bookedOn : bookedOn // ignore: cast_nullable_to_non_nullable
as String?,reasonForVisit: freezed == reasonForVisit ? _self.reasonForVisit : reasonForVisit // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient?,doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as Doctor?,
  ));
}

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $PatientCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorCopyWith<$Res>? get doctor {
    if (_self.doctor == null) {
    return null;
  }

  return $DoctorCopyWith<$Res>(_self.doctor!, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// @nodoc
mixin _$AppointmentListResponse {

 List<Appointment> get appointments;@JsonKey(name: "total_count") int? get totalCount;
/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentListResponseCopyWith<AppointmentListResponse> get copyWith => _$AppointmentListResponseCopyWithImpl<AppointmentListResponse>(this as AppointmentListResponse, _$identity);

  /// Serializes this AppointmentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentListResponse&&const DeepCollectionEquality().equals(other.appointments, appointments)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(appointments),totalCount);

@override
String toString() {
  return 'AppointmentListResponse(appointments: $appointments, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $AppointmentListResponseCopyWith<$Res>  {
  factory $AppointmentListResponseCopyWith(AppointmentListResponse value, $Res Function(AppointmentListResponse) _then) = _$AppointmentListResponseCopyWithImpl;
@useResult
$Res call({
 List<Appointment> appointments,@JsonKey(name: "total_count") int? totalCount
});




}
/// @nodoc
class _$AppointmentListResponseCopyWithImpl<$Res>
    implements $AppointmentListResponseCopyWith<$Res> {
  _$AppointmentListResponseCopyWithImpl(this._self, this._then);

  final AppointmentListResponse _self;
  final $Res Function(AppointmentListResponse) _then;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appointments = null,Object? totalCount = freezed,}) {
  return _then(_self.copyWith(
appointments: null == appointments ? _self.appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<Appointment>,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentListResponse].
extension AppointmentListResponsePatterns on AppointmentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Appointment> appointments, @JsonKey(name: "total_count")  int? totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
return $default(_that.appointments,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Appointment> appointments, @JsonKey(name: "total_count")  int? totalCount)  $default,) {final _that = this;
switch (_that) {
case _AppointmentListResponse():
return $default(_that.appointments,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Appointment> appointments, @JsonKey(name: "total_count")  int? totalCount)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
return $default(_that.appointments,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentListResponse implements AppointmentListResponse {
  const _AppointmentListResponse({required final  List<Appointment> appointments, @JsonKey(name: "total_count") this.totalCount}): _appointments = appointments;
  factory _AppointmentListResponse.fromJson(Map<String, dynamic> json) => _$AppointmentListResponseFromJson(json);

 final  List<Appointment> _appointments;
@override List<Appointment> get appointments {
  if (_appointments is EqualUnmodifiableListView) return _appointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointments);
}

@override@JsonKey(name: "total_count") final  int? totalCount;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentListResponseCopyWith<_AppointmentListResponse> get copyWith => __$AppointmentListResponseCopyWithImpl<_AppointmentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentListResponse&&const DeepCollectionEquality().equals(other._appointments, _appointments)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appointments),totalCount);

@override
String toString() {
  return 'AppointmentListResponse(appointments: $appointments, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$AppointmentListResponseCopyWith<$Res> implements $AppointmentListResponseCopyWith<$Res> {
  factory _$AppointmentListResponseCopyWith(_AppointmentListResponse value, $Res Function(_AppointmentListResponse) _then) = __$AppointmentListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Appointment> appointments,@JsonKey(name: "total_count") int? totalCount
});




}
/// @nodoc
class __$AppointmentListResponseCopyWithImpl<$Res>
    implements _$AppointmentListResponseCopyWith<$Res> {
  __$AppointmentListResponseCopyWithImpl(this._self, this._then);

  final _AppointmentListResponse _self;
  final $Res Function(_AppointmentListResponse) _then;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appointments = null,Object? totalCount = freezed,}) {
  return _then(_AppointmentListResponse(
appointments: null == appointments ? _self._appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<Appointment>,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Patient {

 String? get id; String? get firstName; String? get lastName; String? get email; String? get phone; String? get mobileId; String? get dateOfBirth; String? get gender; String? get bloodGroup; String? get address1; String? get address2; String? get district; String? get state; String? get height; String? get weight; String? get smokingStatus; String? get alcoholUse; VitalSigns? get vitalSigns;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.mobileId, mobileId) || other.mobileId == mobileId)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.district, district) || other.district == district)&&(identical(other.state, state) || other.state == state)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.vitalSigns, vitalSigns) || other.vitalSigns == vitalSigns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,phone,mobileId,dateOfBirth,gender,bloodGroup,address1,address2,district,state,height,weight,smokingStatus,alcoholUse,vitalSigns);

@override
String toString() {
  return 'Patient(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, mobileId: $mobileId, dateOfBirth: $dateOfBirth, gender: $gender, bloodGroup: $bloodGroup, address1: $address1, address2: $address2, district: $district, state: $state, height: $height, weight: $weight, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, vitalSigns: $vitalSigns)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 String? id, String? firstName, String? lastName, String? email, String? phone, String? mobileId, String? dateOfBirth, String? gender, String? bloodGroup, String? address1, String? address2, String? district, String? state, String? height, String? weight, String? smokingStatus, String? alcoholUse, VitalSigns? vitalSigns
});


$VitalSignsCopyWith<$Res>? get vitalSigns;

}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? phone = freezed,Object? mobileId = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? bloodGroup = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? district = freezed,Object? state = freezed,Object? height = freezed,Object? weight = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? vitalSigns = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,mobileId: freezed == mobileId ? _self.mobileId : mobileId // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,vitalSigns: freezed == vitalSigns ? _self.vitalSigns : vitalSigns // ignore: cast_nullable_to_non_nullable
as VitalSigns?,
  ));
}
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VitalSignsCopyWith<$Res>? get vitalSigns {
    if (_self.vitalSigns == null) {
    return null;
  }

  return $VitalSignsCopyWith<$Res>(_self.vitalSigns!, (value) {
    return _then(_self.copyWith(vitalSigns: value));
  });
}
}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? firstName,  String? lastName,  String? email,  String? phone,  String? mobileId,  String? dateOfBirth,  String? gender,  String? bloodGroup,  String? address1,  String? address2,  String? district,  String? state,  String? height,  String? weight,  String? smokingStatus,  String? alcoholUse,  VitalSigns? vitalSigns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone,_that.mobileId,_that.dateOfBirth,_that.gender,_that.bloodGroup,_that.address1,_that.address2,_that.district,_that.state,_that.height,_that.weight,_that.smokingStatus,_that.alcoholUse,_that.vitalSigns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? firstName,  String? lastName,  String? email,  String? phone,  String? mobileId,  String? dateOfBirth,  String? gender,  String? bloodGroup,  String? address1,  String? address2,  String? district,  String? state,  String? height,  String? weight,  String? smokingStatus,  String? alcoholUse,  VitalSigns? vitalSigns)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone,_that.mobileId,_that.dateOfBirth,_that.gender,_that.bloodGroup,_that.address1,_that.address2,_that.district,_that.state,_that.height,_that.weight,_that.smokingStatus,_that.alcoholUse,_that.vitalSigns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? firstName,  String? lastName,  String? email,  String? phone,  String? mobileId,  String? dateOfBirth,  String? gender,  String? bloodGroup,  String? address1,  String? address2,  String? district,  String? state,  String? height,  String? weight,  String? smokingStatus,  String? alcoholUse,  VitalSigns? vitalSigns)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone,_that.mobileId,_that.dateOfBirth,_that.gender,_that.bloodGroup,_that.address1,_that.address2,_that.district,_that.state,_that.height,_that.weight,_that.smokingStatus,_that.alcoholUse,_that.vitalSigns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Patient implements Patient {
  const _Patient({this.id, this.firstName, this.lastName, this.email, this.phone, this.mobileId, this.dateOfBirth, this.gender, this.bloodGroup, this.address1, this.address2, this.district, this.state, this.height, this.weight, this.smokingStatus, this.alcoholUse, this.vitalSigns});
  factory _Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

@override final  String? id;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? email;
@override final  String? phone;
@override final  String? mobileId;
@override final  String? dateOfBirth;
@override final  String? gender;
@override final  String? bloodGroup;
@override final  String? address1;
@override final  String? address2;
@override final  String? district;
@override final  String? state;
@override final  String? height;
@override final  String? weight;
@override final  String? smokingStatus;
@override final  String? alcoholUse;
@override final  VitalSigns? vitalSigns;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.mobileId, mobileId) || other.mobileId == mobileId)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.district, district) || other.district == district)&&(identical(other.state, state) || other.state == state)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.vitalSigns, vitalSigns) || other.vitalSigns == vitalSigns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,phone,mobileId,dateOfBirth,gender,bloodGroup,address1,address2,district,state,height,weight,smokingStatus,alcoholUse,vitalSigns);

@override
String toString() {
  return 'Patient(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, mobileId: $mobileId, dateOfBirth: $dateOfBirth, gender: $gender, bloodGroup: $bloodGroup, address1: $address1, address2: $address2, district: $district, state: $state, height: $height, weight: $weight, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, vitalSigns: $vitalSigns)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? firstName, String? lastName, String? email, String? phone, String? mobileId, String? dateOfBirth, String? gender, String? bloodGroup, String? address1, String? address2, String? district, String? state, String? height, String? weight, String? smokingStatus, String? alcoholUse, VitalSigns? vitalSigns
});


@override $VitalSignsCopyWith<$Res>? get vitalSigns;

}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? phone = freezed,Object? mobileId = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? bloodGroup = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? district = freezed,Object? state = freezed,Object? height = freezed,Object? weight = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? vitalSigns = freezed,}) {
  return _then(_Patient(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,mobileId: freezed == mobileId ? _self.mobileId : mobileId // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,vitalSigns: freezed == vitalSigns ? _self.vitalSigns : vitalSigns // ignore: cast_nullable_to_non_nullable
as VitalSigns?,
  ));
}

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VitalSignsCopyWith<$Res>? get vitalSigns {
    if (_self.vitalSigns == null) {
    return null;
  }

  return $VitalSignsCopyWith<$Res>(_self.vitalSigns!, (value) {
    return _then(_self.copyWith(vitalSigns: value));
  });
}
}


/// @nodoc
mixin _$Doctor {

 String? get id; String? get firstName; String? get lastName; String? get fullName; String? get email; String? get phone; String? get department; String? get specialization; String? get qualification; String? get experience; String? get consultationFee; bool? get isAvailable; List<TimeSlot>? get availableSlots;
/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorCopyWith<Doctor> get copyWith => _$DoctorCopyWithImpl<Doctor>(this as Doctor, _$identity);

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.department, department) || other.department == department)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&const DeepCollectionEquality().equals(other.availableSlots, availableSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fullName,email,phone,department,specialization,qualification,experience,consultationFee,isAvailable,const DeepCollectionEquality().hash(availableSlots));

@override
String toString() {
  return 'Doctor(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, phone: $phone, department: $department, specialization: $specialization, qualification: $qualification, experience: $experience, consultationFee: $consultationFee, isAvailable: $isAvailable, availableSlots: $availableSlots)';
}


}

/// @nodoc
abstract mixin class $DoctorCopyWith<$Res>  {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) _then) = _$DoctorCopyWithImpl;
@useResult
$Res call({
 String? id, String? firstName, String? lastName, String? fullName, String? email, String? phone, String? department, String? specialization, String? qualification, String? experience, String? consultationFee, bool? isAvailable, List<TimeSlot>? availableSlots
});




}
/// @nodoc
class _$DoctorCopyWithImpl<$Res>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._self, this._then);

  final Doctor _self;
  final $Res Function(Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? email = freezed,Object? phone = freezed,Object? department = freezed,Object? specialization = freezed,Object? qualification = freezed,Object? experience = freezed,Object? consultationFee = freezed,Object? isAvailable = freezed,Object? availableSlots = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as String?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,availableSlots: freezed == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Doctor].
extension DoctorPatterns on Doctor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Doctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Doctor value)  $default,){
final _that = this;
switch (_that) {
case _Doctor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Doctor value)?  $default,){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? firstName,  String? lastName,  String? fullName,  String? email,  String? phone,  String? department,  String? specialization,  String? qualification,  String? experience,  String? consultationFee,  bool? isAvailable,  List<TimeSlot>? availableSlots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.phone,_that.department,_that.specialization,_that.qualification,_that.experience,_that.consultationFee,_that.isAvailable,_that.availableSlots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? firstName,  String? lastName,  String? fullName,  String? email,  String? phone,  String? department,  String? specialization,  String? qualification,  String? experience,  String? consultationFee,  bool? isAvailable,  List<TimeSlot>? availableSlots)  $default,) {final _that = this;
switch (_that) {
case _Doctor():
return $default(_that.id,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.phone,_that.department,_that.specialization,_that.qualification,_that.experience,_that.consultationFee,_that.isAvailable,_that.availableSlots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? firstName,  String? lastName,  String? fullName,  String? email,  String? phone,  String? department,  String? specialization,  String? qualification,  String? experience,  String? consultationFee,  bool? isAvailable,  List<TimeSlot>? availableSlots)?  $default,) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.phone,_that.department,_that.specialization,_that.qualification,_that.experience,_that.consultationFee,_that.isAvailable,_that.availableSlots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Doctor implements Doctor {
  const _Doctor({this.id, this.firstName, this.lastName, this.fullName, this.email, this.phone, this.department, this.specialization, this.qualification, this.experience, this.consultationFee, this.isAvailable, final  List<TimeSlot>? availableSlots}): _availableSlots = availableSlots;
  factory _Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

@override final  String? id;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? fullName;
@override final  String? email;
@override final  String? phone;
@override final  String? department;
@override final  String? specialization;
@override final  String? qualification;
@override final  String? experience;
@override final  String? consultationFee;
@override final  bool? isAvailable;
 final  List<TimeSlot>? _availableSlots;
@override List<TimeSlot>? get availableSlots {
  final value = _availableSlots;
  if (value == null) return null;
  if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorCopyWith<_Doctor> get copyWith => __$DoctorCopyWithImpl<_Doctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.department, department) || other.department == department)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&const DeepCollectionEquality().equals(other._availableSlots, _availableSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fullName,email,phone,department,specialization,qualification,experience,consultationFee,isAvailable,const DeepCollectionEquality().hash(_availableSlots));

@override
String toString() {
  return 'Doctor(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, phone: $phone, department: $department, specialization: $specialization, qualification: $qualification, experience: $experience, consultationFee: $consultationFee, isAvailable: $isAvailable, availableSlots: $availableSlots)';
}


}

/// @nodoc
abstract mixin class _$DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$DoctorCopyWith(_Doctor value, $Res Function(_Doctor) _then) = __$DoctorCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? firstName, String? lastName, String? fullName, String? email, String? phone, String? department, String? specialization, String? qualification, String? experience, String? consultationFee, bool? isAvailable, List<TimeSlot>? availableSlots
});




}
/// @nodoc
class __$DoctorCopyWithImpl<$Res>
    implements _$DoctorCopyWith<$Res> {
  __$DoctorCopyWithImpl(this._self, this._then);

  final _Doctor _self;
  final $Res Function(_Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? email = freezed,Object? phone = freezed,Object? department = freezed,Object? specialization = freezed,Object? qualification = freezed,Object? experience = freezed,Object? consultationFee = freezed,Object? isAvailable = freezed,Object? availableSlots = freezed,}) {
  return _then(_Doctor(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,qualification: freezed == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as String?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,availableSlots: freezed == availableSlots ? _self._availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>?,
  ));
}


}


/// @nodoc
mixin _$TimeSlot {

 String? get id; String? get time; String? get date; bool? get isAvailable; bool? get isBooked; String? get doctorId;
/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotCopyWith<TimeSlot> get copyWith => _$TimeSlotCopyWithImpl<TimeSlot>(this as TimeSlot, _$identity);

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,time,date,isAvailable,isBooked,doctorId);

@override
String toString() {
  return 'TimeSlot(id: $id, time: $time, date: $date, isAvailable: $isAvailable, isBooked: $isBooked, doctorId: $doctorId)';
}


}

/// @nodoc
abstract mixin class $TimeSlotCopyWith<$Res>  {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) _then) = _$TimeSlotCopyWithImpl;
@useResult
$Res call({
 String? id, String? time, String? date, bool? isAvailable, bool? isBooked, String? doctorId
});




}
/// @nodoc
class _$TimeSlotCopyWithImpl<$Res>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._self, this._then);

  final TimeSlot _self;
  final $Res Function(TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? time = freezed,Object? date = freezed,Object? isAvailable = freezed,Object? isBooked = freezed,Object? doctorId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,isBooked: freezed == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlot].
extension TimeSlotPatterns on TimeSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlot value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? time,  String? date,  bool? isAvailable,  bool? isBooked,  String? doctorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.id,_that.time,_that.date,_that.isAvailable,_that.isBooked,_that.doctorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? time,  String? date,  bool? isAvailable,  bool? isBooked,  String? doctorId)  $default,) {final _that = this;
switch (_that) {
case _TimeSlot():
return $default(_that.id,_that.time,_that.date,_that.isAvailable,_that.isBooked,_that.doctorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? time,  String? date,  bool? isAvailable,  bool? isBooked,  String? doctorId)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.id,_that.time,_that.date,_that.isAvailable,_that.isBooked,_that.doctorId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlot implements TimeSlot {
  const _TimeSlot({this.id, this.time, this.date, this.isAvailable, this.isBooked, this.doctorId});
  factory _TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

@override final  String? id;
@override final  String? time;
@override final  String? date;
@override final  bool? isAvailable;
@override final  bool? isBooked;
@override final  String? doctorId;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotCopyWith<_TimeSlot> get copyWith => __$TimeSlotCopyWithImpl<_TimeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,time,date,isAvailable,isBooked,doctorId);

@override
String toString() {
  return 'TimeSlot(id: $id, time: $time, date: $date, isAvailable: $isAvailable, isBooked: $isBooked, doctorId: $doctorId)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotCopyWith<$Res> implements $TimeSlotCopyWith<$Res> {
  factory _$TimeSlotCopyWith(_TimeSlot value, $Res Function(_TimeSlot) _then) = __$TimeSlotCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? time, String? date, bool? isAvailable, bool? isBooked, String? doctorId
});




}
/// @nodoc
class __$TimeSlotCopyWithImpl<$Res>
    implements _$TimeSlotCopyWith<$Res> {
  __$TimeSlotCopyWithImpl(this._self, this._then);

  final _TimeSlot _self;
  final $Res Function(_TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? time = freezed,Object? date = freezed,Object? isAvailable = freezed,Object? isBooked = freezed,Object? doctorId = freezed,}) {
  return _then(_TimeSlot(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,isBooked: freezed == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VitalSigns {

 String? get bloodPressure; String? get temperature; String? get pulse; String? get respiratoryRate; String? get oxygenSaturation;
/// Create a copy of VitalSigns
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalSignsCopyWith<VitalSigns> get copyWith => _$VitalSignsCopyWithImpl<VitalSigns>(this as VitalSigns, _$identity);

  /// Serializes this VitalSigns to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalSigns&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulse, pulse) || other.pulse == pulse)&&(identical(other.respiratoryRate, respiratoryRate) || other.respiratoryRate == respiratoryRate)&&(identical(other.oxygenSaturation, oxygenSaturation) || other.oxygenSaturation == oxygenSaturation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bloodPressure,temperature,pulse,respiratoryRate,oxygenSaturation);

@override
String toString() {
  return 'VitalSigns(bloodPressure: $bloodPressure, temperature: $temperature, pulse: $pulse, respiratoryRate: $respiratoryRate, oxygenSaturation: $oxygenSaturation)';
}


}

/// @nodoc
abstract mixin class $VitalSignsCopyWith<$Res>  {
  factory $VitalSignsCopyWith(VitalSigns value, $Res Function(VitalSigns) _then) = _$VitalSignsCopyWithImpl;
@useResult
$Res call({
 String? bloodPressure, String? temperature, String? pulse, String? respiratoryRate, String? oxygenSaturation
});




}
/// @nodoc
class _$VitalSignsCopyWithImpl<$Res>
    implements $VitalSignsCopyWith<$Res> {
  _$VitalSignsCopyWithImpl(this._self, this._then);

  final VitalSigns _self;
  final $Res Function(VitalSigns) _then;

/// Create a copy of VitalSigns
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulse = freezed,Object? respiratoryRate = freezed,Object? oxygenSaturation = freezed,}) {
  return _then(_self.copyWith(
bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,pulse: freezed == pulse ? _self.pulse : pulse // ignore: cast_nullable_to_non_nullable
as String?,respiratoryRate: freezed == respiratoryRate ? _self.respiratoryRate : respiratoryRate // ignore: cast_nullable_to_non_nullable
as String?,oxygenSaturation: freezed == oxygenSaturation ? _self.oxygenSaturation : oxygenSaturation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VitalSigns].
extension VitalSignsPatterns on VitalSigns {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalSigns value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalSigns() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalSigns value)  $default,){
final _that = this;
switch (_that) {
case _VitalSigns():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalSigns value)?  $default,){
final _that = this;
switch (_that) {
case _VitalSigns() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? bloodPressure,  String? temperature,  String? pulse,  String? respiratoryRate,  String? oxygenSaturation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalSigns() when $default != null:
return $default(_that.bloodPressure,_that.temperature,_that.pulse,_that.respiratoryRate,_that.oxygenSaturation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? bloodPressure,  String? temperature,  String? pulse,  String? respiratoryRate,  String? oxygenSaturation)  $default,) {final _that = this;
switch (_that) {
case _VitalSigns():
return $default(_that.bloodPressure,_that.temperature,_that.pulse,_that.respiratoryRate,_that.oxygenSaturation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? bloodPressure,  String? temperature,  String? pulse,  String? respiratoryRate,  String? oxygenSaturation)?  $default,) {final _that = this;
switch (_that) {
case _VitalSigns() when $default != null:
return $default(_that.bloodPressure,_that.temperature,_that.pulse,_that.respiratoryRate,_that.oxygenSaturation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VitalSigns implements VitalSigns {
  const _VitalSigns({this.bloodPressure, this.temperature, this.pulse, this.respiratoryRate, this.oxygenSaturation});
  factory _VitalSigns.fromJson(Map<String, dynamic> json) => _$VitalSignsFromJson(json);

@override final  String? bloodPressure;
@override final  String? temperature;
@override final  String? pulse;
@override final  String? respiratoryRate;
@override final  String? oxygenSaturation;

/// Create a copy of VitalSigns
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalSignsCopyWith<_VitalSigns> get copyWith => __$VitalSignsCopyWithImpl<_VitalSigns>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VitalSignsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalSigns&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulse, pulse) || other.pulse == pulse)&&(identical(other.respiratoryRate, respiratoryRate) || other.respiratoryRate == respiratoryRate)&&(identical(other.oxygenSaturation, oxygenSaturation) || other.oxygenSaturation == oxygenSaturation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bloodPressure,temperature,pulse,respiratoryRate,oxygenSaturation);

@override
String toString() {
  return 'VitalSigns(bloodPressure: $bloodPressure, temperature: $temperature, pulse: $pulse, respiratoryRate: $respiratoryRate, oxygenSaturation: $oxygenSaturation)';
}


}

/// @nodoc
abstract mixin class _$VitalSignsCopyWith<$Res> implements $VitalSignsCopyWith<$Res> {
  factory _$VitalSignsCopyWith(_VitalSigns value, $Res Function(_VitalSigns) _then) = __$VitalSignsCopyWithImpl;
@override @useResult
$Res call({
 String? bloodPressure, String? temperature, String? pulse, String? respiratoryRate, String? oxygenSaturation
});




}
/// @nodoc
class __$VitalSignsCopyWithImpl<$Res>
    implements _$VitalSignsCopyWith<$Res> {
  __$VitalSignsCopyWithImpl(this._self, this._then);

  final _VitalSigns _self;
  final $Res Function(_VitalSigns) _then;

/// Create a copy of VitalSigns
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulse = freezed,Object? respiratoryRate = freezed,Object? oxygenSaturation = freezed,}) {
  return _then(_VitalSigns(
bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,pulse: freezed == pulse ? _self.pulse : pulse // ignore: cast_nullable_to_non_nullable
as String?,respiratoryRate: freezed == respiratoryRate ? _self.respiratoryRate : respiratoryRate // ignore: cast_nullable_to_non_nullable
as String?,oxygenSaturation: freezed == oxygenSaturation ? _self.oxygenSaturation : oxygenSaturation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppointmentSummaryCounts {

 int? get total; int? get confirmed; int? get arrived; int? get completed; int? get cancelled;@JsonKey(name: 'no_show') int? get noShow; int? get pending;
/// Create a copy of AppointmentSummaryCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentSummaryCountsCopyWith<AppointmentSummaryCounts> get copyWith => _$AppointmentSummaryCountsCopyWithImpl<AppointmentSummaryCounts>(this as AppointmentSummaryCounts, _$identity);

  /// Serializes this AppointmentSummaryCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentSummaryCounts&&(identical(other.total, total) || other.total == total)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.arrived, arrived) || other.arrived == arrived)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled)&&(identical(other.noShow, noShow) || other.noShow == noShow)&&(identical(other.pending, pending) || other.pending == pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,confirmed,arrived,completed,cancelled,noShow,pending);

@override
String toString() {
  return 'AppointmentSummaryCounts(total: $total, confirmed: $confirmed, arrived: $arrived, completed: $completed, cancelled: $cancelled, noShow: $noShow, pending: $pending)';
}


}

/// @nodoc
abstract mixin class $AppointmentSummaryCountsCopyWith<$Res>  {
  factory $AppointmentSummaryCountsCopyWith(AppointmentSummaryCounts value, $Res Function(AppointmentSummaryCounts) _then) = _$AppointmentSummaryCountsCopyWithImpl;
@useResult
$Res call({
 int? total, int? confirmed, int? arrived, int? completed, int? cancelled,@JsonKey(name: 'no_show') int? noShow, int? pending
});




}
/// @nodoc
class _$AppointmentSummaryCountsCopyWithImpl<$Res>
    implements $AppointmentSummaryCountsCopyWith<$Res> {
  _$AppointmentSummaryCountsCopyWithImpl(this._self, this._then);

  final AppointmentSummaryCounts _self;
  final $Res Function(AppointmentSummaryCounts) _then;

/// Create a copy of AppointmentSummaryCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = freezed,Object? confirmed = freezed,Object? arrived = freezed,Object? completed = freezed,Object? cancelled = freezed,Object? noShow = freezed,Object? pending = freezed,}) {
  return _then(_self.copyWith(
total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,confirmed: freezed == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as int?,arrived: freezed == arrived ? _self.arrived : arrived // ignore: cast_nullable_to_non_nullable
as int?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,cancelled: freezed == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int?,noShow: freezed == noShow ? _self.noShow : noShow // ignore: cast_nullable_to_non_nullable
as int?,pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentSummaryCounts].
extension AppointmentSummaryCountsPatterns on AppointmentSummaryCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentSummaryCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentSummaryCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentSummaryCounts value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentSummaryCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentSummaryCounts value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentSummaryCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? total,  int? confirmed,  int? arrived,  int? completed,  int? cancelled, @JsonKey(name: 'no_show')  int? noShow,  int? pending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentSummaryCounts() when $default != null:
return $default(_that.total,_that.confirmed,_that.arrived,_that.completed,_that.cancelled,_that.noShow,_that.pending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? total,  int? confirmed,  int? arrived,  int? completed,  int? cancelled, @JsonKey(name: 'no_show')  int? noShow,  int? pending)  $default,) {final _that = this;
switch (_that) {
case _AppointmentSummaryCounts():
return $default(_that.total,_that.confirmed,_that.arrived,_that.completed,_that.cancelled,_that.noShow,_that.pending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? total,  int? confirmed,  int? arrived,  int? completed,  int? cancelled, @JsonKey(name: 'no_show')  int? noShow,  int? pending)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentSummaryCounts() when $default != null:
return $default(_that.total,_that.confirmed,_that.arrived,_that.completed,_that.cancelled,_that.noShow,_that.pending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentSummaryCounts implements AppointmentSummaryCounts {
  const _AppointmentSummaryCounts({this.total, this.confirmed, this.arrived, this.completed, this.cancelled, @JsonKey(name: 'no_show') this.noShow, this.pending});
  factory _AppointmentSummaryCounts.fromJson(Map<String, dynamic> json) => _$AppointmentSummaryCountsFromJson(json);

@override final  int? total;
@override final  int? confirmed;
@override final  int? arrived;
@override final  int? completed;
@override final  int? cancelled;
@override@JsonKey(name: 'no_show') final  int? noShow;
@override final  int? pending;

/// Create a copy of AppointmentSummaryCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentSummaryCountsCopyWith<_AppointmentSummaryCounts> get copyWith => __$AppointmentSummaryCountsCopyWithImpl<_AppointmentSummaryCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentSummaryCountsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentSummaryCounts&&(identical(other.total, total) || other.total == total)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.arrived, arrived) || other.arrived == arrived)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled)&&(identical(other.noShow, noShow) || other.noShow == noShow)&&(identical(other.pending, pending) || other.pending == pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,confirmed,arrived,completed,cancelled,noShow,pending);

@override
String toString() {
  return 'AppointmentSummaryCounts(total: $total, confirmed: $confirmed, arrived: $arrived, completed: $completed, cancelled: $cancelled, noShow: $noShow, pending: $pending)';
}


}

/// @nodoc
abstract mixin class _$AppointmentSummaryCountsCopyWith<$Res> implements $AppointmentSummaryCountsCopyWith<$Res> {
  factory _$AppointmentSummaryCountsCopyWith(_AppointmentSummaryCounts value, $Res Function(_AppointmentSummaryCounts) _then) = __$AppointmentSummaryCountsCopyWithImpl;
@override @useResult
$Res call({
 int? total, int? confirmed, int? arrived, int? completed, int? cancelled,@JsonKey(name: 'no_show') int? noShow, int? pending
});




}
/// @nodoc
class __$AppointmentSummaryCountsCopyWithImpl<$Res>
    implements _$AppointmentSummaryCountsCopyWith<$Res> {
  __$AppointmentSummaryCountsCopyWithImpl(this._self, this._then);

  final _AppointmentSummaryCounts _self;
  final $Res Function(_AppointmentSummaryCounts) _then;

/// Create a copy of AppointmentSummaryCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = freezed,Object? confirmed = freezed,Object? arrived = freezed,Object? completed = freezed,Object? cancelled = freezed,Object? noShow = freezed,Object? pending = freezed,}) {
  return _then(_AppointmentSummaryCounts(
total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,confirmed: freezed == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as int?,arrived: freezed == arrived ? _self.arrived : arrived // ignore: cast_nullable_to_non_nullable
as int?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,cancelled: freezed == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int?,noShow: freezed == noShow ? _self.noShow : noShow // ignore: cast_nullable_to_non_nullable
as int?,pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AppointmentSummary {

 bool? get success;@JsonKey(name: 'clinic_id') String? get clinicId; String? get date;@JsonKey(name: 'doctor_id') String? get doctorId; String? get status;@JsonKey(name: 'summary') AppointmentSummaryCounts? get counts;
/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentSummaryCopyWith<AppointmentSummary> get copyWith => _$AppointmentSummaryCopyWithImpl<AppointmentSummary>(this as AppointmentSummary, _$identity);

  /// Serializes this AppointmentSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentSummary&&(identical(other.success, success) || other.success == success)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.status, status) || other.status == status)&&(identical(other.counts, counts) || other.counts == counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,clinicId,date,doctorId,status,counts);

@override
String toString() {
  return 'AppointmentSummary(success: $success, clinicId: $clinicId, date: $date, doctorId: $doctorId, status: $status, counts: $counts)';
}


}

/// @nodoc
abstract mixin class $AppointmentSummaryCopyWith<$Res>  {
  factory $AppointmentSummaryCopyWith(AppointmentSummary value, $Res Function(AppointmentSummary) _then) = _$AppointmentSummaryCopyWithImpl;
@useResult
$Res call({
 bool? success,@JsonKey(name: 'clinic_id') String? clinicId, String? date,@JsonKey(name: 'doctor_id') String? doctorId, String? status,@JsonKey(name: 'summary') AppointmentSummaryCounts? counts
});


$AppointmentSummaryCountsCopyWith<$Res>? get counts;

}
/// @nodoc
class _$AppointmentSummaryCopyWithImpl<$Res>
    implements $AppointmentSummaryCopyWith<$Res> {
  _$AppointmentSummaryCopyWithImpl(this._self, this._then);

  final AppointmentSummary _self;
  final $Res Function(AppointmentSummary) _then;

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? clinicId = freezed,Object? date = freezed,Object? doctorId = freezed,Object? status = freezed,Object? counts = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as AppointmentSummaryCounts?,
  ));
}
/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentSummaryCountsCopyWith<$Res>? get counts {
    if (_self.counts == null) {
    return null;
  }

  return $AppointmentSummaryCountsCopyWith<$Res>(_self.counts!, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentSummary].
extension AppointmentSummaryPatterns on AppointmentSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentSummary value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'doctor_id')  String? doctorId,  String? status, @JsonKey(name: 'summary')  AppointmentSummaryCounts? counts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
return $default(_that.success,_that.clinicId,_that.date,_that.doctorId,_that.status,_that.counts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'doctor_id')  String? doctorId,  String? status, @JsonKey(name: 'summary')  AppointmentSummaryCounts? counts)  $default,) {final _that = this;
switch (_that) {
case _AppointmentSummary():
return $default(_that.success,_that.clinicId,_that.date,_that.doctorId,_that.status,_that.counts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'doctor_id')  String? doctorId,  String? status, @JsonKey(name: 'summary')  AppointmentSummaryCounts? counts)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
return $default(_that.success,_that.clinicId,_that.date,_that.doctorId,_that.status,_that.counts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentSummary implements AppointmentSummary {
  const _AppointmentSummary({this.success, @JsonKey(name: 'clinic_id') this.clinicId, this.date, @JsonKey(name: 'doctor_id') this.doctorId, this.status, @JsonKey(name: 'summary') this.counts});
  factory _AppointmentSummary.fromJson(Map<String, dynamic> json) => _$AppointmentSummaryFromJson(json);

@override final  bool? success;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override final  String? date;
@override@JsonKey(name: 'doctor_id') final  String? doctorId;
@override final  String? status;
@override@JsonKey(name: 'summary') final  AppointmentSummaryCounts? counts;

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentSummaryCopyWith<_AppointmentSummary> get copyWith => __$AppointmentSummaryCopyWithImpl<_AppointmentSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentSummary&&(identical(other.success, success) || other.success == success)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.status, status) || other.status == status)&&(identical(other.counts, counts) || other.counts == counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,clinicId,date,doctorId,status,counts);

@override
String toString() {
  return 'AppointmentSummary(success: $success, clinicId: $clinicId, date: $date, doctorId: $doctorId, status: $status, counts: $counts)';
}


}

/// @nodoc
abstract mixin class _$AppointmentSummaryCopyWith<$Res> implements $AppointmentSummaryCopyWith<$Res> {
  factory _$AppointmentSummaryCopyWith(_AppointmentSummary value, $Res Function(_AppointmentSummary) _then) = __$AppointmentSummaryCopyWithImpl;
@override @useResult
$Res call({
 bool? success,@JsonKey(name: 'clinic_id') String? clinicId, String? date,@JsonKey(name: 'doctor_id') String? doctorId, String? status,@JsonKey(name: 'summary') AppointmentSummaryCounts? counts
});


@override $AppointmentSummaryCountsCopyWith<$Res>? get counts;

}
/// @nodoc
class __$AppointmentSummaryCopyWithImpl<$Res>
    implements _$AppointmentSummaryCopyWith<$Res> {
  __$AppointmentSummaryCopyWithImpl(this._self, this._then);

  final _AppointmentSummary _self;
  final $Res Function(_AppointmentSummary) _then;

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? clinicId = freezed,Object? date = freezed,Object? doctorId = freezed,Object? status = freezed,Object? counts = freezed,}) {
  return _then(_AppointmentSummary(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as AppointmentSummaryCounts?,
  ));
}

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentSummaryCountsCopyWith<$Res>? get counts {
    if (_self.counts == null) {
    return null;
  }

  return $AppointmentSummaryCountsCopyWith<$Res>(_self.counts!, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// @nodoc
mixin _$SimpleAppointment {

 String get id;@JsonKey(name: 'clinic_patient_id') String get clinicPatientId;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'booking_number') String get bookingNumber;@JsonKey(name: 'token_number') int get tokenNumber;@JsonKey(name: 'appointment_date') String get appointmentDate;@JsonKey(name: 'appointment_time') String get appointmentTime;@JsonKey(name: 'duration_minutes') int? get durationMinutes;@JsonKey(name: 'consultation_type') String get consultationType; String? get reason; String get status;@JsonKey(name: 'fee_amount') double? get feeAmount;@JsonKey(name: 'payment_status') String? get paymentStatus;@JsonKey(name: 'payment_mode') String? get paymentMode;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of SimpleAppointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleAppointmentCopyWith<SimpleAppointment> get copyWith => _$SimpleAppointmentCopyWithImpl<SimpleAppointment>(this as SimpleAppointment, _$identity);

  /// Serializes this SimpleAppointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleAppointment&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.tokenNumber, tokenNumber) || other.tokenNumber == tokenNumber)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicPatientId,clinicId,doctorId,bookingNumber,tokenNumber,appointmentDate,appointmentTime,durationMinutes,consultationType,reason,status,feeAmount,paymentStatus,paymentMode,createdAt,updatedAt);

@override
String toString() {
  return 'SimpleAppointment(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, doctorId: $doctorId, bookingNumber: $bookingNumber, tokenNumber: $tokenNumber, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, durationMinutes: $durationMinutes, consultationType: $consultationType, reason: $reason, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, paymentMode: $paymentMode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SimpleAppointmentCopyWith<$Res>  {
  factory $SimpleAppointmentCopyWith(SimpleAppointment value, $Res Function(SimpleAppointment) _then) = _$SimpleAppointmentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'clinic_patient_id') String clinicPatientId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'booking_number') String bookingNumber,@JsonKey(name: 'token_number') int tokenNumber,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'appointment_time') String appointmentTime,@JsonKey(name: 'duration_minutes') int? durationMinutes,@JsonKey(name: 'consultation_type') String consultationType, String? reason, String status,@JsonKey(name: 'fee_amount') double? feeAmount,@JsonKey(name: 'payment_status') String? paymentStatus,@JsonKey(name: 'payment_mode') String? paymentMode,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$SimpleAppointmentCopyWithImpl<$Res>
    implements $SimpleAppointmentCopyWith<$Res> {
  _$SimpleAppointmentCopyWithImpl(this._self, this._then);

  final SimpleAppointment _self;
  final $Res Function(SimpleAppointment) _then;

/// Create a copy of SimpleAppointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clinicPatientId = null,Object? clinicId = null,Object? doctorId = null,Object? bookingNumber = null,Object? tokenNumber = null,Object? appointmentDate = null,Object? appointmentTime = null,Object? durationMinutes = freezed,Object? consultationType = null,Object? reason = freezed,Object? status = null,Object? feeAmount = freezed,Object? paymentStatus = freezed,Object? paymentMode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicPatientId: null == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,bookingNumber: null == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String,tokenNumber: null == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as int,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,appointmentTime: null == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SimpleAppointment].
extension SimpleAppointmentPatterns on SimpleAppointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimpleAppointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimpleAppointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimpleAppointment value)  $default,){
final _that = this;
switch (_that) {
case _SimpleAppointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimpleAppointment value)?  $default,){
final _that = this;
switch (_that) {
case _SimpleAppointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_patient_id')  String clinicPatientId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'token_number')  int tokenNumber, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'consultation_type')  String consultationType,  String? reason,  String status, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String? paymentStatus, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimpleAppointment() when $default != null:
return $default(_that.id,_that.clinicPatientId,_that.clinicId,_that.doctorId,_that.bookingNumber,_that.tokenNumber,_that.appointmentDate,_that.appointmentTime,_that.durationMinutes,_that.consultationType,_that.reason,_that.status,_that.feeAmount,_that.paymentStatus,_that.paymentMode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_patient_id')  String clinicPatientId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'token_number')  int tokenNumber, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'consultation_type')  String consultationType,  String? reason,  String status, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String? paymentStatus, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SimpleAppointment():
return $default(_that.id,_that.clinicPatientId,_that.clinicId,_that.doctorId,_that.bookingNumber,_that.tokenNumber,_that.appointmentDate,_that.appointmentTime,_that.durationMinutes,_that.consultationType,_that.reason,_that.status,_that.feeAmount,_that.paymentStatus,_that.paymentMode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'clinic_patient_id')  String clinicPatientId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'booking_number')  String bookingNumber, @JsonKey(name: 'token_number')  int tokenNumber, @JsonKey(name: 'appointment_date')  String appointmentDate, @JsonKey(name: 'appointment_time')  String appointmentTime, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'consultation_type')  String consultationType,  String? reason,  String status, @JsonKey(name: 'fee_amount')  double? feeAmount, @JsonKey(name: 'payment_status')  String? paymentStatus, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SimpleAppointment() when $default != null:
return $default(_that.id,_that.clinicPatientId,_that.clinicId,_that.doctorId,_that.bookingNumber,_that.tokenNumber,_that.appointmentDate,_that.appointmentTime,_that.durationMinutes,_that.consultationType,_that.reason,_that.status,_that.feeAmount,_that.paymentStatus,_that.paymentMode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimpleAppointment implements SimpleAppointment {
  const _SimpleAppointment({required this.id, @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'booking_number') required this.bookingNumber, @JsonKey(name: 'token_number') required this.tokenNumber, @JsonKey(name: 'appointment_date') required this.appointmentDate, @JsonKey(name: 'appointment_time') required this.appointmentTime, @JsonKey(name: 'duration_minutes') this.durationMinutes, @JsonKey(name: 'consultation_type') required this.consultationType, this.reason, required this.status, @JsonKey(name: 'fee_amount') this.feeAmount, @JsonKey(name: 'payment_status') this.paymentStatus, @JsonKey(name: 'payment_mode') this.paymentMode, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _SimpleAppointment.fromJson(Map<String, dynamic> json) => _$SimpleAppointmentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'clinic_patient_id') final  String clinicPatientId;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'booking_number') final  String bookingNumber;
@override@JsonKey(name: 'token_number') final  int tokenNumber;
@override@JsonKey(name: 'appointment_date') final  String appointmentDate;
@override@JsonKey(name: 'appointment_time') final  String appointmentTime;
@override@JsonKey(name: 'duration_minutes') final  int? durationMinutes;
@override@JsonKey(name: 'consultation_type') final  String consultationType;
@override final  String? reason;
@override final  String status;
@override@JsonKey(name: 'fee_amount') final  double? feeAmount;
@override@JsonKey(name: 'payment_status') final  String? paymentStatus;
@override@JsonKey(name: 'payment_mode') final  String? paymentMode;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of SimpleAppointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimpleAppointmentCopyWith<_SimpleAppointment> get copyWith => __$SimpleAppointmentCopyWithImpl<_SimpleAppointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimpleAppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimpleAppointment&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.bookingNumber, bookingNumber) || other.bookingNumber == bookingNumber)&&(identical(other.tokenNumber, tokenNumber) || other.tokenNumber == tokenNumber)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.appointmentTime, appointmentTime) || other.appointmentTime == appointmentTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicPatientId,clinicId,doctorId,bookingNumber,tokenNumber,appointmentDate,appointmentTime,durationMinutes,consultationType,reason,status,feeAmount,paymentStatus,paymentMode,createdAt,updatedAt);

@override
String toString() {
  return 'SimpleAppointment(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, doctorId: $doctorId, bookingNumber: $bookingNumber, tokenNumber: $tokenNumber, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, durationMinutes: $durationMinutes, consultationType: $consultationType, reason: $reason, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, paymentMode: $paymentMode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SimpleAppointmentCopyWith<$Res> implements $SimpleAppointmentCopyWith<$Res> {
  factory _$SimpleAppointmentCopyWith(_SimpleAppointment value, $Res Function(_SimpleAppointment) _then) = __$SimpleAppointmentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'clinic_patient_id') String clinicPatientId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'booking_number') String bookingNumber,@JsonKey(name: 'token_number') int tokenNumber,@JsonKey(name: 'appointment_date') String appointmentDate,@JsonKey(name: 'appointment_time') String appointmentTime,@JsonKey(name: 'duration_minutes') int? durationMinutes,@JsonKey(name: 'consultation_type') String consultationType, String? reason, String status,@JsonKey(name: 'fee_amount') double? feeAmount,@JsonKey(name: 'payment_status') String? paymentStatus,@JsonKey(name: 'payment_mode') String? paymentMode,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$SimpleAppointmentCopyWithImpl<$Res>
    implements _$SimpleAppointmentCopyWith<$Res> {
  __$SimpleAppointmentCopyWithImpl(this._self, this._then);

  final _SimpleAppointment _self;
  final $Res Function(_SimpleAppointment) _then;

/// Create a copy of SimpleAppointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clinicPatientId = null,Object? clinicId = null,Object? doctorId = null,Object? bookingNumber = null,Object? tokenNumber = null,Object? appointmentDate = null,Object? appointmentTime = null,Object? durationMinutes = freezed,Object? consultationType = null,Object? reason = freezed,Object? status = null,Object? feeAmount = freezed,Object? paymentStatus = freezed,Object? paymentMode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SimpleAppointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicPatientId: null == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,bookingNumber: null == bookingNumber ? _self.bookingNumber : bookingNumber // ignore: cast_nullable_to_non_nullable
as String,tokenNumber: null == tokenNumber ? _self.tokenNumber : tokenNumber // ignore: cast_nullable_to_non_nullable
as int,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as String,appointmentTime: null == appointmentTime ? _self.appointmentTime : appointmentTime // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as double?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SimpleAppointmentResponse {

 String get message; SimpleAppointment get appointment;// ✅ NEW: Follow-up information
 FollowUpInfo? get followUp;@JsonKey(name: 'clinic_patient_update') ClinicPatientUpdate? get clinicPatientUpdate;// ✅ NEW: Appointment type flags
@JsonKey(name: 'is_regular_appointment') bool? get isRegularAppointment;@JsonKey(name: 'followup_granted') bool? get followupGranted;@JsonKey(name: 'followup_message') String? get followupMessage;@JsonKey(name: 'followup_valid_until') String? get followupValidUntil;// ✅ NEW: Free follow-up flags
@JsonKey(name: 'is_free_followup') bool? get isFreeFollowup;@JsonKey(name: 'followup_type') String? get followupType;@JsonKey(name: 'follow_up_info') FollowUpInfo? get followUpInfo;// ✅ NEW: Renewal options
 RenewalOptions? get renewalOptions;
/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleAppointmentResponseCopyWith<SimpleAppointmentResponse> get copyWith => _$SimpleAppointmentResponseCopyWithImpl<SimpleAppointmentResponse>(this as SimpleAppointmentResponse, _$identity);

  /// Serializes this SimpleAppointmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleAppointmentResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.appointment, appointment) || other.appointment == appointment)&&(identical(other.followUp, followUp) || other.followUp == followUp)&&(identical(other.clinicPatientUpdate, clinicPatientUpdate) || other.clinicPatientUpdate == clinicPatientUpdate)&&(identical(other.isRegularAppointment, isRegularAppointment) || other.isRegularAppointment == isRegularAppointment)&&(identical(other.followupGranted, followupGranted) || other.followupGranted == followupGranted)&&(identical(other.followupMessage, followupMessage) || other.followupMessage == followupMessage)&&(identical(other.followupValidUntil, followupValidUntil) || other.followupValidUntil == followupValidUntil)&&(identical(other.isFreeFollowup, isFreeFollowup) || other.isFreeFollowup == isFreeFollowup)&&(identical(other.followupType, followupType) || other.followupType == followupType)&&(identical(other.followUpInfo, followUpInfo) || other.followUpInfo == followUpInfo)&&(identical(other.renewalOptions, renewalOptions) || other.renewalOptions == renewalOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,appointment,followUp,clinicPatientUpdate,isRegularAppointment,followupGranted,followupMessage,followupValidUntil,isFreeFollowup,followupType,followUpInfo,renewalOptions);

@override
String toString() {
  return 'SimpleAppointmentResponse(message: $message, appointment: $appointment, followUp: $followUp, clinicPatientUpdate: $clinicPatientUpdate, isRegularAppointment: $isRegularAppointment, followupGranted: $followupGranted, followupMessage: $followupMessage, followupValidUntil: $followupValidUntil, isFreeFollowup: $isFreeFollowup, followupType: $followupType, followUpInfo: $followUpInfo, renewalOptions: $renewalOptions)';
}


}

/// @nodoc
abstract mixin class $SimpleAppointmentResponseCopyWith<$Res>  {
  factory $SimpleAppointmentResponseCopyWith(SimpleAppointmentResponse value, $Res Function(SimpleAppointmentResponse) _then) = _$SimpleAppointmentResponseCopyWithImpl;
@useResult
$Res call({
 String message, SimpleAppointment appointment, FollowUpInfo? followUp,@JsonKey(name: 'clinic_patient_update') ClinicPatientUpdate? clinicPatientUpdate,@JsonKey(name: 'is_regular_appointment') bool? isRegularAppointment,@JsonKey(name: 'followup_granted') bool? followupGranted,@JsonKey(name: 'followup_message') String? followupMessage,@JsonKey(name: 'followup_valid_until') String? followupValidUntil,@JsonKey(name: 'is_free_followup') bool? isFreeFollowup,@JsonKey(name: 'followup_type') String? followupType,@JsonKey(name: 'follow_up_info') FollowUpInfo? followUpInfo, RenewalOptions? renewalOptions
});


$SimpleAppointmentCopyWith<$Res> get appointment;$FollowUpInfoCopyWith<$Res>? get followUp;$ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate;$FollowUpInfoCopyWith<$Res>? get followUpInfo;$RenewalOptionsCopyWith<$Res>? get renewalOptions;

}
/// @nodoc
class _$SimpleAppointmentResponseCopyWithImpl<$Res>
    implements $SimpleAppointmentResponseCopyWith<$Res> {
  _$SimpleAppointmentResponseCopyWithImpl(this._self, this._then);

  final SimpleAppointmentResponse _self;
  final $Res Function(SimpleAppointmentResponse) _then;

/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? appointment = null,Object? followUp = freezed,Object? clinicPatientUpdate = freezed,Object? isRegularAppointment = freezed,Object? followupGranted = freezed,Object? followupMessage = freezed,Object? followupValidUntil = freezed,Object? isFreeFollowup = freezed,Object? followupType = freezed,Object? followUpInfo = freezed,Object? renewalOptions = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,appointment: null == appointment ? _self.appointment : appointment // ignore: cast_nullable_to_non_nullable
as SimpleAppointment,followUp: freezed == followUp ? _self.followUp : followUp // ignore: cast_nullable_to_non_nullable
as FollowUpInfo?,clinicPatientUpdate: freezed == clinicPatientUpdate ? _self.clinicPatientUpdate : clinicPatientUpdate // ignore: cast_nullable_to_non_nullable
as ClinicPatientUpdate?,isRegularAppointment: freezed == isRegularAppointment ? _self.isRegularAppointment : isRegularAppointment // ignore: cast_nullable_to_non_nullable
as bool?,followupGranted: freezed == followupGranted ? _self.followupGranted : followupGranted // ignore: cast_nullable_to_non_nullable
as bool?,followupMessage: freezed == followupMessage ? _self.followupMessage : followupMessage // ignore: cast_nullable_to_non_nullable
as String?,followupValidUntil: freezed == followupValidUntil ? _self.followupValidUntil : followupValidUntil // ignore: cast_nullable_to_non_nullable
as String?,isFreeFollowup: freezed == isFreeFollowup ? _self.isFreeFollowup : isFreeFollowup // ignore: cast_nullable_to_non_nullable
as bool?,followupType: freezed == followupType ? _self.followupType : followupType // ignore: cast_nullable_to_non_nullable
as String?,followUpInfo: freezed == followUpInfo ? _self.followUpInfo : followUpInfo // ignore: cast_nullable_to_non_nullable
as FollowUpInfo?,renewalOptions: freezed == renewalOptions ? _self.renewalOptions : renewalOptions // ignore: cast_nullable_to_non_nullable
as RenewalOptions?,
  ));
}
/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SimpleAppointmentCopyWith<$Res> get appointment {
  
  return $SimpleAppointmentCopyWith<$Res>(_self.appointment, (value) {
    return _then(_self.copyWith(appointment: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpInfoCopyWith<$Res>? get followUp {
    if (_self.followUp == null) {
    return null;
  }

  return $FollowUpInfoCopyWith<$Res>(_self.followUp!, (value) {
    return _then(_self.copyWith(followUp: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate {
    if (_self.clinicPatientUpdate == null) {
    return null;
  }

  return $ClinicPatientUpdateCopyWith<$Res>(_self.clinicPatientUpdate!, (value) {
    return _then(_self.copyWith(clinicPatientUpdate: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpInfoCopyWith<$Res>? get followUpInfo {
    if (_self.followUpInfo == null) {
    return null;
  }

  return $FollowUpInfoCopyWith<$Res>(_self.followUpInfo!, (value) {
    return _then(_self.copyWith(followUpInfo: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenewalOptionsCopyWith<$Res>? get renewalOptions {
    if (_self.renewalOptions == null) {
    return null;
  }

  return $RenewalOptionsCopyWith<$Res>(_self.renewalOptions!, (value) {
    return _then(_self.copyWith(renewalOptions: value));
  });
}
}


/// Adds pattern-matching-related methods to [SimpleAppointmentResponse].
extension SimpleAppointmentResponsePatterns on SimpleAppointmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimpleAppointmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimpleAppointmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimpleAppointmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _SimpleAppointmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimpleAppointmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SimpleAppointmentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  SimpleAppointment appointment,  FollowUpInfo? followUp, @JsonKey(name: 'clinic_patient_update')  ClinicPatientUpdate? clinicPatientUpdate, @JsonKey(name: 'is_regular_appointment')  bool? isRegularAppointment, @JsonKey(name: 'followup_granted')  bool? followupGranted, @JsonKey(name: 'followup_message')  String? followupMessage, @JsonKey(name: 'followup_valid_until')  String? followupValidUntil, @JsonKey(name: 'is_free_followup')  bool? isFreeFollowup, @JsonKey(name: 'followup_type')  String? followupType, @JsonKey(name: 'follow_up_info')  FollowUpInfo? followUpInfo,  RenewalOptions? renewalOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimpleAppointmentResponse() when $default != null:
return $default(_that.message,_that.appointment,_that.followUp,_that.clinicPatientUpdate,_that.isRegularAppointment,_that.followupGranted,_that.followupMessage,_that.followupValidUntil,_that.isFreeFollowup,_that.followupType,_that.followUpInfo,_that.renewalOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  SimpleAppointment appointment,  FollowUpInfo? followUp, @JsonKey(name: 'clinic_patient_update')  ClinicPatientUpdate? clinicPatientUpdate, @JsonKey(name: 'is_regular_appointment')  bool? isRegularAppointment, @JsonKey(name: 'followup_granted')  bool? followupGranted, @JsonKey(name: 'followup_message')  String? followupMessage, @JsonKey(name: 'followup_valid_until')  String? followupValidUntil, @JsonKey(name: 'is_free_followup')  bool? isFreeFollowup, @JsonKey(name: 'followup_type')  String? followupType, @JsonKey(name: 'follow_up_info')  FollowUpInfo? followUpInfo,  RenewalOptions? renewalOptions)  $default,) {final _that = this;
switch (_that) {
case _SimpleAppointmentResponse():
return $default(_that.message,_that.appointment,_that.followUp,_that.clinicPatientUpdate,_that.isRegularAppointment,_that.followupGranted,_that.followupMessage,_that.followupValidUntil,_that.isFreeFollowup,_that.followupType,_that.followUpInfo,_that.renewalOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  SimpleAppointment appointment,  FollowUpInfo? followUp, @JsonKey(name: 'clinic_patient_update')  ClinicPatientUpdate? clinicPatientUpdate, @JsonKey(name: 'is_regular_appointment')  bool? isRegularAppointment, @JsonKey(name: 'followup_granted')  bool? followupGranted, @JsonKey(name: 'followup_message')  String? followupMessage, @JsonKey(name: 'followup_valid_until')  String? followupValidUntil, @JsonKey(name: 'is_free_followup')  bool? isFreeFollowup, @JsonKey(name: 'followup_type')  String? followupType, @JsonKey(name: 'follow_up_info')  FollowUpInfo? followUpInfo,  RenewalOptions? renewalOptions)?  $default,) {final _that = this;
switch (_that) {
case _SimpleAppointmentResponse() when $default != null:
return $default(_that.message,_that.appointment,_that.followUp,_that.clinicPatientUpdate,_that.isRegularAppointment,_that.followupGranted,_that.followupMessage,_that.followupValidUntil,_that.isFreeFollowup,_that.followupType,_that.followUpInfo,_that.renewalOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimpleAppointmentResponse implements SimpleAppointmentResponse {
  const _SimpleAppointmentResponse({required this.message, required this.appointment, this.followUp, @JsonKey(name: 'clinic_patient_update') this.clinicPatientUpdate, @JsonKey(name: 'is_regular_appointment') this.isRegularAppointment, @JsonKey(name: 'followup_granted') this.followupGranted, @JsonKey(name: 'followup_message') this.followupMessage, @JsonKey(name: 'followup_valid_until') this.followupValidUntil, @JsonKey(name: 'is_free_followup') this.isFreeFollowup, @JsonKey(name: 'followup_type') this.followupType, @JsonKey(name: 'follow_up_info') this.followUpInfo, this.renewalOptions});
  factory _SimpleAppointmentResponse.fromJson(Map<String, dynamic> json) => _$SimpleAppointmentResponseFromJson(json);

@override final  String message;
@override final  SimpleAppointment appointment;
// ✅ NEW: Follow-up information
@override final  FollowUpInfo? followUp;
@override@JsonKey(name: 'clinic_patient_update') final  ClinicPatientUpdate? clinicPatientUpdate;
// ✅ NEW: Appointment type flags
@override@JsonKey(name: 'is_regular_appointment') final  bool? isRegularAppointment;
@override@JsonKey(name: 'followup_granted') final  bool? followupGranted;
@override@JsonKey(name: 'followup_message') final  String? followupMessage;
@override@JsonKey(name: 'followup_valid_until') final  String? followupValidUntil;
// ✅ NEW: Free follow-up flags
@override@JsonKey(name: 'is_free_followup') final  bool? isFreeFollowup;
@override@JsonKey(name: 'followup_type') final  String? followupType;
@override@JsonKey(name: 'follow_up_info') final  FollowUpInfo? followUpInfo;
// ✅ NEW: Renewal options
@override final  RenewalOptions? renewalOptions;

/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimpleAppointmentResponseCopyWith<_SimpleAppointmentResponse> get copyWith => __$SimpleAppointmentResponseCopyWithImpl<_SimpleAppointmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimpleAppointmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimpleAppointmentResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.appointment, appointment) || other.appointment == appointment)&&(identical(other.followUp, followUp) || other.followUp == followUp)&&(identical(other.clinicPatientUpdate, clinicPatientUpdate) || other.clinicPatientUpdate == clinicPatientUpdate)&&(identical(other.isRegularAppointment, isRegularAppointment) || other.isRegularAppointment == isRegularAppointment)&&(identical(other.followupGranted, followupGranted) || other.followupGranted == followupGranted)&&(identical(other.followupMessage, followupMessage) || other.followupMessage == followupMessage)&&(identical(other.followupValidUntil, followupValidUntil) || other.followupValidUntil == followupValidUntil)&&(identical(other.isFreeFollowup, isFreeFollowup) || other.isFreeFollowup == isFreeFollowup)&&(identical(other.followupType, followupType) || other.followupType == followupType)&&(identical(other.followUpInfo, followUpInfo) || other.followUpInfo == followUpInfo)&&(identical(other.renewalOptions, renewalOptions) || other.renewalOptions == renewalOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,appointment,followUp,clinicPatientUpdate,isRegularAppointment,followupGranted,followupMessage,followupValidUntil,isFreeFollowup,followupType,followUpInfo,renewalOptions);

@override
String toString() {
  return 'SimpleAppointmentResponse(message: $message, appointment: $appointment, followUp: $followUp, clinicPatientUpdate: $clinicPatientUpdate, isRegularAppointment: $isRegularAppointment, followupGranted: $followupGranted, followupMessage: $followupMessage, followupValidUntil: $followupValidUntil, isFreeFollowup: $isFreeFollowup, followupType: $followupType, followUpInfo: $followUpInfo, renewalOptions: $renewalOptions)';
}


}

/// @nodoc
abstract mixin class _$SimpleAppointmentResponseCopyWith<$Res> implements $SimpleAppointmentResponseCopyWith<$Res> {
  factory _$SimpleAppointmentResponseCopyWith(_SimpleAppointmentResponse value, $Res Function(_SimpleAppointmentResponse) _then) = __$SimpleAppointmentResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, SimpleAppointment appointment, FollowUpInfo? followUp,@JsonKey(name: 'clinic_patient_update') ClinicPatientUpdate? clinicPatientUpdate,@JsonKey(name: 'is_regular_appointment') bool? isRegularAppointment,@JsonKey(name: 'followup_granted') bool? followupGranted,@JsonKey(name: 'followup_message') String? followupMessage,@JsonKey(name: 'followup_valid_until') String? followupValidUntil,@JsonKey(name: 'is_free_followup') bool? isFreeFollowup,@JsonKey(name: 'followup_type') String? followupType,@JsonKey(name: 'follow_up_info') FollowUpInfo? followUpInfo, RenewalOptions? renewalOptions
});


@override $SimpleAppointmentCopyWith<$Res> get appointment;@override $FollowUpInfoCopyWith<$Res>? get followUp;@override $ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate;@override $FollowUpInfoCopyWith<$Res>? get followUpInfo;@override $RenewalOptionsCopyWith<$Res>? get renewalOptions;

}
/// @nodoc
class __$SimpleAppointmentResponseCopyWithImpl<$Res>
    implements _$SimpleAppointmentResponseCopyWith<$Res> {
  __$SimpleAppointmentResponseCopyWithImpl(this._self, this._then);

  final _SimpleAppointmentResponse _self;
  final $Res Function(_SimpleAppointmentResponse) _then;

/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? appointment = null,Object? followUp = freezed,Object? clinicPatientUpdate = freezed,Object? isRegularAppointment = freezed,Object? followupGranted = freezed,Object? followupMessage = freezed,Object? followupValidUntil = freezed,Object? isFreeFollowup = freezed,Object? followupType = freezed,Object? followUpInfo = freezed,Object? renewalOptions = freezed,}) {
  return _then(_SimpleAppointmentResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,appointment: null == appointment ? _self.appointment : appointment // ignore: cast_nullable_to_non_nullable
as SimpleAppointment,followUp: freezed == followUp ? _self.followUp : followUp // ignore: cast_nullable_to_non_nullable
as FollowUpInfo?,clinicPatientUpdate: freezed == clinicPatientUpdate ? _self.clinicPatientUpdate : clinicPatientUpdate // ignore: cast_nullable_to_non_nullable
as ClinicPatientUpdate?,isRegularAppointment: freezed == isRegularAppointment ? _self.isRegularAppointment : isRegularAppointment // ignore: cast_nullable_to_non_nullable
as bool?,followupGranted: freezed == followupGranted ? _self.followupGranted : followupGranted // ignore: cast_nullable_to_non_nullable
as bool?,followupMessage: freezed == followupMessage ? _self.followupMessage : followupMessage // ignore: cast_nullable_to_non_nullable
as String?,followupValidUntil: freezed == followupValidUntil ? _self.followupValidUntil : followupValidUntil // ignore: cast_nullable_to_non_nullable
as String?,isFreeFollowup: freezed == isFreeFollowup ? _self.isFreeFollowup : isFreeFollowup // ignore: cast_nullable_to_non_nullable
as bool?,followupType: freezed == followupType ? _self.followupType : followupType // ignore: cast_nullable_to_non_nullable
as String?,followUpInfo: freezed == followUpInfo ? _self.followUpInfo : followUpInfo // ignore: cast_nullable_to_non_nullable
as FollowUpInfo?,renewalOptions: freezed == renewalOptions ? _self.renewalOptions : renewalOptions // ignore: cast_nullable_to_non_nullable
as RenewalOptions?,
  ));
}

/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SimpleAppointmentCopyWith<$Res> get appointment {
  
  return $SimpleAppointmentCopyWith<$Res>(_self.appointment, (value) {
    return _then(_self.copyWith(appointment: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpInfoCopyWith<$Res>? get followUp {
    if (_self.followUp == null) {
    return null;
  }

  return $FollowUpInfoCopyWith<$Res>(_self.followUp!, (value) {
    return _then(_self.copyWith(followUp: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate {
    if (_self.clinicPatientUpdate == null) {
    return null;
  }

  return $ClinicPatientUpdateCopyWith<$Res>(_self.clinicPatientUpdate!, (value) {
    return _then(_self.copyWith(clinicPatientUpdate: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowUpInfoCopyWith<$Res>? get followUpInfo {
    if (_self.followUpInfo == null) {
    return null;
  }

  return $FollowUpInfoCopyWith<$Res>(_self.followUpInfo!, (value) {
    return _then(_self.copyWith(followUpInfo: value));
  });
}/// Create a copy of SimpleAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenewalOptionsCopyWith<$Res>? get renewalOptions {
    if (_self.renewalOptions == null) {
    return null;
  }

  return $RenewalOptionsCopyWith<$Res>(_self.renewalOptions!, (value) {
    return _then(_self.copyWith(renewalOptions: value));
  });
}
}


/// @nodoc
mixin _$FollowUpInfo {

 String? get id;@JsonKey(name: 'clinic_patient_id') String? get clinicPatientId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'patient_name') String? get patientName;@JsonKey(name: 'doctor_id') String? get doctorId;@JsonKey(name: 'doctor_name') String? get doctorName;@JsonKey(name: 'department_id') String? get departmentId;@JsonKey(name: 'department_name') String? get departmentName;@JsonKey(name: 'source_appointment_id') String? get sourceAppointmentId;@JsonKey(name: 'follow_up_status') String? get followUpStatus;@JsonKey(name: 'is_free') bool? get isFree;@JsonKey(name: 'valid_from') String? get validFrom;@JsonKey(name: 'valid_until') String? get validUntil;@JsonKey(name: 'days_remaining') int? get daysRemaining;@JsonKey(name: 'used_appointment_id') String? get usedAppointmentId;@JsonKey(name: 'used_at') String? get usedAt;@JsonKey(name: 'renewed_at') String? get renewedAt;@JsonKey(name: 'renewed_by_appointment_id') String? get renewedByAppointmentId;@JsonKey(name: 'appointment_slot_type') String? get appointmentSlotType;@JsonKey(name: 'follow_up_type') String? get followUpType;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of FollowUpInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowUpInfoCopyWith<FollowUpInfo> get copyWith => _$FollowUpInfoCopyWithImpl<FollowUpInfo>(this as FollowUpInfo, _$identity);

  /// Serializes this FollowUpInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowUpInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.sourceAppointmentId, sourceAppointmentId) || other.sourceAppointmentId == sourceAppointmentId)&&(identical(other.followUpStatus, followUpStatus) || other.followUpStatus == followUpStatus)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.usedAppointmentId, usedAppointmentId) || other.usedAppointmentId == usedAppointmentId)&&(identical(other.usedAt, usedAt) || other.usedAt == usedAt)&&(identical(other.renewedAt, renewedAt) || other.renewedAt == renewedAt)&&(identical(other.renewedByAppointmentId, renewedByAppointmentId) || other.renewedByAppointmentId == renewedByAppointmentId)&&(identical(other.appointmentSlotType, appointmentSlotType) || other.appointmentSlotType == appointmentSlotType)&&(identical(other.followUpType, followUpType) || other.followUpType == followUpType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clinicPatientId,clinicId,patientName,doctorId,doctorName,departmentId,departmentName,sourceAppointmentId,followUpStatus,isFree,validFrom,validUntil,daysRemaining,usedAppointmentId,usedAt,renewedAt,renewedByAppointmentId,appointmentSlotType,followUpType,createdAt,updatedAt]);

@override
String toString() {
  return 'FollowUpInfo(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, patientName: $patientName, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, sourceAppointmentId: $sourceAppointmentId, followUpStatus: $followUpStatus, isFree: $isFree, validFrom: $validFrom, validUntil: $validUntil, daysRemaining: $daysRemaining, usedAppointmentId: $usedAppointmentId, usedAt: $usedAt, renewedAt: $renewedAt, renewedByAppointmentId: $renewedByAppointmentId, appointmentSlotType: $appointmentSlotType, followUpType: $followUpType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FollowUpInfoCopyWith<$Res>  {
  factory $FollowUpInfoCopyWith(FollowUpInfo value, $Res Function(FollowUpInfo) _then) = _$FollowUpInfoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'patient_name') String? patientName,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'department_name') String? departmentName,@JsonKey(name: 'source_appointment_id') String? sourceAppointmentId,@JsonKey(name: 'follow_up_status') String? followUpStatus,@JsonKey(name: 'is_free') bool? isFree,@JsonKey(name: 'valid_from') String? validFrom,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'days_remaining') int? daysRemaining,@JsonKey(name: 'used_appointment_id') String? usedAppointmentId,@JsonKey(name: 'used_at') String? usedAt,@JsonKey(name: 'renewed_at') String? renewedAt,@JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,@JsonKey(name: 'appointment_slot_type') String? appointmentSlotType,@JsonKey(name: 'follow_up_type') String? followUpType,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$FollowUpInfoCopyWithImpl<$Res>
    implements $FollowUpInfoCopyWith<$Res> {
  _$FollowUpInfoCopyWithImpl(this._self, this._then);

  final FollowUpInfo _self;
  final $Res Function(FollowUpInfo) _then;

/// Create a copy of FollowUpInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? patientName = freezed,Object? doctorId = freezed,Object? doctorName = freezed,Object? departmentId = freezed,Object? departmentName = freezed,Object? sourceAppointmentId = freezed,Object? followUpStatus = freezed,Object? isFree = freezed,Object? validFrom = freezed,Object? validUntil = freezed,Object? daysRemaining = freezed,Object? usedAppointmentId = freezed,Object? usedAt = freezed,Object? renewedAt = freezed,Object? renewedByAppointmentId = freezed,Object? appointmentSlotType = freezed,Object? followUpType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,sourceAppointmentId: freezed == sourceAppointmentId ? _self.sourceAppointmentId : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,followUpStatus: freezed == followUpStatus ? _self.followUpStatus : followUpStatus // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,validFrom: freezed == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,usedAppointmentId: freezed == usedAppointmentId ? _self.usedAppointmentId : usedAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,usedAt: freezed == usedAt ? _self.usedAt : usedAt // ignore: cast_nullable_to_non_nullable
as String?,renewedAt: freezed == renewedAt ? _self.renewedAt : renewedAt // ignore: cast_nullable_to_non_nullable
as String?,renewedByAppointmentId: freezed == renewedByAppointmentId ? _self.renewedByAppointmentId : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,appointmentSlotType: freezed == appointmentSlotType ? _self.appointmentSlotType : appointmentSlotType // ignore: cast_nullable_to_non_nullable
as String?,followUpType: freezed == followUpType ? _self.followUpType : followUpType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowUpInfo].
extension FollowUpInfoPatterns on FollowUpInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowUpInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowUpInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowUpInfo value)  $default,){
final _that = this;
switch (_that) {
case _FollowUpInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowUpInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FollowUpInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'patient_name')  String? patientName, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'department_name')  String? departmentName, @JsonKey(name: 'source_appointment_id')  String? sourceAppointmentId, @JsonKey(name: 'follow_up_status')  String? followUpStatus, @JsonKey(name: 'is_free')  bool? isFree, @JsonKey(name: 'valid_from')  String? validFrom, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'days_remaining')  int? daysRemaining, @JsonKey(name: 'used_appointment_id')  String? usedAppointmentId, @JsonKey(name: 'used_at')  String? usedAt, @JsonKey(name: 'renewed_at')  String? renewedAt, @JsonKey(name: 'renewed_by_appointment_id')  String? renewedByAppointmentId, @JsonKey(name: 'appointment_slot_type')  String? appointmentSlotType, @JsonKey(name: 'follow_up_type')  String? followUpType, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowUpInfo() when $default != null:
return $default(_that.id,_that.clinicPatientId,_that.clinicId,_that.patientName,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.sourceAppointmentId,_that.followUpStatus,_that.isFree,_that.validFrom,_that.validUntil,_that.daysRemaining,_that.usedAppointmentId,_that.usedAt,_that.renewedAt,_that.renewedByAppointmentId,_that.appointmentSlotType,_that.followUpType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'patient_name')  String? patientName, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'department_name')  String? departmentName, @JsonKey(name: 'source_appointment_id')  String? sourceAppointmentId, @JsonKey(name: 'follow_up_status')  String? followUpStatus, @JsonKey(name: 'is_free')  bool? isFree, @JsonKey(name: 'valid_from')  String? validFrom, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'days_remaining')  int? daysRemaining, @JsonKey(name: 'used_appointment_id')  String? usedAppointmentId, @JsonKey(name: 'used_at')  String? usedAt, @JsonKey(name: 'renewed_at')  String? renewedAt, @JsonKey(name: 'renewed_by_appointment_id')  String? renewedByAppointmentId, @JsonKey(name: 'appointment_slot_type')  String? appointmentSlotType, @JsonKey(name: 'follow_up_type')  String? followUpType, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FollowUpInfo():
return $default(_that.id,_that.clinicPatientId,_that.clinicId,_that.patientName,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.sourceAppointmentId,_that.followUpStatus,_that.isFree,_that.validFrom,_that.validUntil,_that.daysRemaining,_that.usedAppointmentId,_that.usedAt,_that.renewedAt,_that.renewedByAppointmentId,_that.appointmentSlotType,_that.followUpType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'patient_name')  String? patientName, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'department_name')  String? departmentName, @JsonKey(name: 'source_appointment_id')  String? sourceAppointmentId, @JsonKey(name: 'follow_up_status')  String? followUpStatus, @JsonKey(name: 'is_free')  bool? isFree, @JsonKey(name: 'valid_from')  String? validFrom, @JsonKey(name: 'valid_until')  String? validUntil, @JsonKey(name: 'days_remaining')  int? daysRemaining, @JsonKey(name: 'used_appointment_id')  String? usedAppointmentId, @JsonKey(name: 'used_at')  String? usedAt, @JsonKey(name: 'renewed_at')  String? renewedAt, @JsonKey(name: 'renewed_by_appointment_id')  String? renewedByAppointmentId, @JsonKey(name: 'appointment_slot_type')  String? appointmentSlotType, @JsonKey(name: 'follow_up_type')  String? followUpType, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FollowUpInfo() when $default != null:
return $default(_that.id,_that.clinicPatientId,_that.clinicId,_that.patientName,_that.doctorId,_that.doctorName,_that.departmentId,_that.departmentName,_that.sourceAppointmentId,_that.followUpStatus,_that.isFree,_that.validFrom,_that.validUntil,_that.daysRemaining,_that.usedAppointmentId,_that.usedAt,_that.renewedAt,_that.renewedByAppointmentId,_that.appointmentSlotType,_that.followUpType,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FollowUpInfo implements FollowUpInfo {
  const _FollowUpInfo({this.id, @JsonKey(name: 'clinic_patient_id') this.clinicPatientId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'patient_name') this.patientName, @JsonKey(name: 'doctor_id') this.doctorId, @JsonKey(name: 'doctor_name') this.doctorName, @JsonKey(name: 'department_id') this.departmentId, @JsonKey(name: 'department_name') this.departmentName, @JsonKey(name: 'source_appointment_id') this.sourceAppointmentId, @JsonKey(name: 'follow_up_status') this.followUpStatus, @JsonKey(name: 'is_free') this.isFree, @JsonKey(name: 'valid_from') this.validFrom, @JsonKey(name: 'valid_until') this.validUntil, @JsonKey(name: 'days_remaining') this.daysRemaining, @JsonKey(name: 'used_appointment_id') this.usedAppointmentId, @JsonKey(name: 'used_at') this.usedAt, @JsonKey(name: 'renewed_at') this.renewedAt, @JsonKey(name: 'renewed_by_appointment_id') this.renewedByAppointmentId, @JsonKey(name: 'appointment_slot_type') this.appointmentSlotType, @JsonKey(name: 'follow_up_type') this.followUpType, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _FollowUpInfo.fromJson(Map<String, dynamic> json) => _$FollowUpInfoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'clinic_patient_id') final  String? clinicPatientId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'patient_name') final  String? patientName;
@override@JsonKey(name: 'doctor_id') final  String? doctorId;
@override@JsonKey(name: 'doctor_name') final  String? doctorName;
@override@JsonKey(name: 'department_id') final  String? departmentId;
@override@JsonKey(name: 'department_name') final  String? departmentName;
@override@JsonKey(name: 'source_appointment_id') final  String? sourceAppointmentId;
@override@JsonKey(name: 'follow_up_status') final  String? followUpStatus;
@override@JsonKey(name: 'is_free') final  bool? isFree;
@override@JsonKey(name: 'valid_from') final  String? validFrom;
@override@JsonKey(name: 'valid_until') final  String? validUntil;
@override@JsonKey(name: 'days_remaining') final  int? daysRemaining;
@override@JsonKey(name: 'used_appointment_id') final  String? usedAppointmentId;
@override@JsonKey(name: 'used_at') final  String? usedAt;
@override@JsonKey(name: 'renewed_at') final  String? renewedAt;
@override@JsonKey(name: 'renewed_by_appointment_id') final  String? renewedByAppointmentId;
@override@JsonKey(name: 'appointment_slot_type') final  String? appointmentSlotType;
@override@JsonKey(name: 'follow_up_type') final  String? followUpType;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of FollowUpInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowUpInfoCopyWith<_FollowUpInfo> get copyWith => __$FollowUpInfoCopyWithImpl<_FollowUpInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowUpInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowUpInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.sourceAppointmentId, sourceAppointmentId) || other.sourceAppointmentId == sourceAppointmentId)&&(identical(other.followUpStatus, followUpStatus) || other.followUpStatus == followUpStatus)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.usedAppointmentId, usedAppointmentId) || other.usedAppointmentId == usedAppointmentId)&&(identical(other.usedAt, usedAt) || other.usedAt == usedAt)&&(identical(other.renewedAt, renewedAt) || other.renewedAt == renewedAt)&&(identical(other.renewedByAppointmentId, renewedByAppointmentId) || other.renewedByAppointmentId == renewedByAppointmentId)&&(identical(other.appointmentSlotType, appointmentSlotType) || other.appointmentSlotType == appointmentSlotType)&&(identical(other.followUpType, followUpType) || other.followUpType == followUpType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clinicPatientId,clinicId,patientName,doctorId,doctorName,departmentId,departmentName,sourceAppointmentId,followUpStatus,isFree,validFrom,validUntil,daysRemaining,usedAppointmentId,usedAt,renewedAt,renewedByAppointmentId,appointmentSlotType,followUpType,createdAt,updatedAt]);

@override
String toString() {
  return 'FollowUpInfo(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, patientName: $patientName, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, sourceAppointmentId: $sourceAppointmentId, followUpStatus: $followUpStatus, isFree: $isFree, validFrom: $validFrom, validUntil: $validUntil, daysRemaining: $daysRemaining, usedAppointmentId: $usedAppointmentId, usedAt: $usedAt, renewedAt: $renewedAt, renewedByAppointmentId: $renewedByAppointmentId, appointmentSlotType: $appointmentSlotType, followUpType: $followUpType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FollowUpInfoCopyWith<$Res> implements $FollowUpInfoCopyWith<$Res> {
  factory _$FollowUpInfoCopyWith(_FollowUpInfo value, $Res Function(_FollowUpInfo) _then) = __$FollowUpInfoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'patient_name') String? patientName,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'department_name') String? departmentName,@JsonKey(name: 'source_appointment_id') String? sourceAppointmentId,@JsonKey(name: 'follow_up_status') String? followUpStatus,@JsonKey(name: 'is_free') bool? isFree,@JsonKey(name: 'valid_from') String? validFrom,@JsonKey(name: 'valid_until') String? validUntil,@JsonKey(name: 'days_remaining') int? daysRemaining,@JsonKey(name: 'used_appointment_id') String? usedAppointmentId,@JsonKey(name: 'used_at') String? usedAt,@JsonKey(name: 'renewed_at') String? renewedAt,@JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,@JsonKey(name: 'appointment_slot_type') String? appointmentSlotType,@JsonKey(name: 'follow_up_type') String? followUpType,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$FollowUpInfoCopyWithImpl<$Res>
    implements _$FollowUpInfoCopyWith<$Res> {
  __$FollowUpInfoCopyWithImpl(this._self, this._then);

  final _FollowUpInfo _self;
  final $Res Function(_FollowUpInfo) _then;

/// Create a copy of FollowUpInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? patientName = freezed,Object? doctorId = freezed,Object? doctorName = freezed,Object? departmentId = freezed,Object? departmentName = freezed,Object? sourceAppointmentId = freezed,Object? followUpStatus = freezed,Object? isFree = freezed,Object? validFrom = freezed,Object? validUntil = freezed,Object? daysRemaining = freezed,Object? usedAppointmentId = freezed,Object? usedAt = freezed,Object? renewedAt = freezed,Object? renewedByAppointmentId = freezed,Object? appointmentSlotType = freezed,Object? followUpType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FollowUpInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,sourceAppointmentId: freezed == sourceAppointmentId ? _self.sourceAppointmentId : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,followUpStatus: freezed == followUpStatus ? _self.followUpStatus : followUpStatus // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,validFrom: freezed == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: freezed == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int?,usedAppointmentId: freezed == usedAppointmentId ? _self.usedAppointmentId : usedAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,usedAt: freezed == usedAt ? _self.usedAt : usedAt // ignore: cast_nullable_to_non_nullable
as String?,renewedAt: freezed == renewedAt ? _self.renewedAt : renewedAt // ignore: cast_nullable_to_non_nullable
as String?,renewedByAppointmentId: freezed == renewedByAppointmentId ? _self.renewedByAppointmentId : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,appointmentSlotType: freezed == appointmentSlotType ? _self.appointmentSlotType : appointmentSlotType // ignore: cast_nullable_to_non_nullable
as String?,followUpType: freezed == followUpType ? _self.followUpType : followUpType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClinicPatientUpdate {

@JsonKey(name: 'current_followup_status') String? get currentFollowupStatus;@JsonKey(name: 'last_appointment_id') String? get lastAppointmentId;@JsonKey(name: 'last_followup_id') String? get lastFollowupId;
/// Create a copy of ClinicPatientUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicPatientUpdateCopyWith<ClinicPatientUpdate> get copyWith => _$ClinicPatientUpdateCopyWithImpl<ClinicPatientUpdate>(this as ClinicPatientUpdate, _$identity);

  /// Serializes this ClinicPatientUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicPatientUpdate&&(identical(other.currentFollowupStatus, currentFollowupStatus) || other.currentFollowupStatus == currentFollowupStatus)&&(identical(other.lastAppointmentId, lastAppointmentId) || other.lastAppointmentId == lastAppointmentId)&&(identical(other.lastFollowupId, lastFollowupId) || other.lastFollowupId == lastFollowupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentFollowupStatus,lastAppointmentId,lastFollowupId);

@override
String toString() {
  return 'ClinicPatientUpdate(currentFollowupStatus: $currentFollowupStatus, lastAppointmentId: $lastAppointmentId, lastFollowupId: $lastFollowupId)';
}


}

/// @nodoc
abstract mixin class $ClinicPatientUpdateCopyWith<$Res>  {
  factory $ClinicPatientUpdateCopyWith(ClinicPatientUpdate value, $Res Function(ClinicPatientUpdate) _then) = _$ClinicPatientUpdateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_followup_status') String? currentFollowupStatus,@JsonKey(name: 'last_appointment_id') String? lastAppointmentId,@JsonKey(name: 'last_followup_id') String? lastFollowupId
});




}
/// @nodoc
class _$ClinicPatientUpdateCopyWithImpl<$Res>
    implements $ClinicPatientUpdateCopyWith<$Res> {
  _$ClinicPatientUpdateCopyWithImpl(this._self, this._then);

  final ClinicPatientUpdate _self;
  final $Res Function(ClinicPatientUpdate) _then;

/// Create a copy of ClinicPatientUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentFollowupStatus = freezed,Object? lastAppointmentId = freezed,Object? lastFollowupId = freezed,}) {
  return _then(_self.copyWith(
currentFollowupStatus: freezed == currentFollowupStatus ? _self.currentFollowupStatus : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
as String?,lastAppointmentId: freezed == lastAppointmentId ? _self.lastAppointmentId : lastAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,lastFollowupId: freezed == lastFollowupId ? _self.lastFollowupId : lastFollowupId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicPatientUpdate].
extension ClinicPatientUpdatePatterns on ClinicPatientUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicPatientUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicPatientUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicPatientUpdate value)  $default,){
final _that = this;
switch (_that) {
case _ClinicPatientUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicPatientUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicPatientUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_followup_status')  String? currentFollowupStatus, @JsonKey(name: 'last_appointment_id')  String? lastAppointmentId, @JsonKey(name: 'last_followup_id')  String? lastFollowupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicPatientUpdate() when $default != null:
return $default(_that.currentFollowupStatus,_that.lastAppointmentId,_that.lastFollowupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_followup_status')  String? currentFollowupStatus, @JsonKey(name: 'last_appointment_id')  String? lastAppointmentId, @JsonKey(name: 'last_followup_id')  String? lastFollowupId)  $default,) {final _that = this;
switch (_that) {
case _ClinicPatientUpdate():
return $default(_that.currentFollowupStatus,_that.lastAppointmentId,_that.lastFollowupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_followup_status')  String? currentFollowupStatus, @JsonKey(name: 'last_appointment_id')  String? lastAppointmentId, @JsonKey(name: 'last_followup_id')  String? lastFollowupId)?  $default,) {final _that = this;
switch (_that) {
case _ClinicPatientUpdate() when $default != null:
return $default(_that.currentFollowupStatus,_that.lastAppointmentId,_that.lastFollowupId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicPatientUpdate implements ClinicPatientUpdate {
  const _ClinicPatientUpdate({@JsonKey(name: 'current_followup_status') this.currentFollowupStatus, @JsonKey(name: 'last_appointment_id') this.lastAppointmentId, @JsonKey(name: 'last_followup_id') this.lastFollowupId});
  factory _ClinicPatientUpdate.fromJson(Map<String, dynamic> json) => _$ClinicPatientUpdateFromJson(json);

@override@JsonKey(name: 'current_followup_status') final  String? currentFollowupStatus;
@override@JsonKey(name: 'last_appointment_id') final  String? lastAppointmentId;
@override@JsonKey(name: 'last_followup_id') final  String? lastFollowupId;

/// Create a copy of ClinicPatientUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicPatientUpdateCopyWith<_ClinicPatientUpdate> get copyWith => __$ClinicPatientUpdateCopyWithImpl<_ClinicPatientUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicPatientUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicPatientUpdate&&(identical(other.currentFollowupStatus, currentFollowupStatus) || other.currentFollowupStatus == currentFollowupStatus)&&(identical(other.lastAppointmentId, lastAppointmentId) || other.lastAppointmentId == lastAppointmentId)&&(identical(other.lastFollowupId, lastFollowupId) || other.lastFollowupId == lastFollowupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentFollowupStatus,lastAppointmentId,lastFollowupId);

@override
String toString() {
  return 'ClinicPatientUpdate(currentFollowupStatus: $currentFollowupStatus, lastAppointmentId: $lastAppointmentId, lastFollowupId: $lastFollowupId)';
}


}

/// @nodoc
abstract mixin class _$ClinicPatientUpdateCopyWith<$Res> implements $ClinicPatientUpdateCopyWith<$Res> {
  factory _$ClinicPatientUpdateCopyWith(_ClinicPatientUpdate value, $Res Function(_ClinicPatientUpdate) _then) = __$ClinicPatientUpdateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_followup_status') String? currentFollowupStatus,@JsonKey(name: 'last_appointment_id') String? lastAppointmentId,@JsonKey(name: 'last_followup_id') String? lastFollowupId
});




}
/// @nodoc
class __$ClinicPatientUpdateCopyWithImpl<$Res>
    implements _$ClinicPatientUpdateCopyWith<$Res> {
  __$ClinicPatientUpdateCopyWithImpl(this._self, this._then);

  final _ClinicPatientUpdate _self;
  final $Res Function(_ClinicPatientUpdate) _then;

/// Create a copy of ClinicPatientUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentFollowupStatus = freezed,Object? lastAppointmentId = freezed,Object? lastFollowupId = freezed,}) {
  return _then(_ClinicPatientUpdate(
currentFollowupStatus: freezed == currentFollowupStatus ? _self.currentFollowupStatus : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
as String?,lastAppointmentId: freezed == lastAppointmentId ? _self.lastAppointmentId : lastAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,lastFollowupId: freezed == lastFollowupId ? _self.lastFollowupId : lastFollowupId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RenewalOptions {

@JsonKey(name: 'can_renew') bool? get canRenew; String? get message;@JsonKey(name: 'previous_followup_id') String? get previousFollowupId;
/// Create a copy of RenewalOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenewalOptionsCopyWith<RenewalOptions> get copyWith => _$RenewalOptionsCopyWithImpl<RenewalOptions>(this as RenewalOptions, _$identity);

  /// Serializes this RenewalOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenewalOptions&&(identical(other.canRenew, canRenew) || other.canRenew == canRenew)&&(identical(other.message, message) || other.message == message)&&(identical(other.previousFollowupId, previousFollowupId) || other.previousFollowupId == previousFollowupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canRenew,message,previousFollowupId);

@override
String toString() {
  return 'RenewalOptions(canRenew: $canRenew, message: $message, previousFollowupId: $previousFollowupId)';
}


}

/// @nodoc
abstract mixin class $RenewalOptionsCopyWith<$Res>  {
  factory $RenewalOptionsCopyWith(RenewalOptions value, $Res Function(RenewalOptions) _then) = _$RenewalOptionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'can_renew') bool? canRenew, String? message,@JsonKey(name: 'previous_followup_id') String? previousFollowupId
});




}
/// @nodoc
class _$RenewalOptionsCopyWithImpl<$Res>
    implements $RenewalOptionsCopyWith<$Res> {
  _$RenewalOptionsCopyWithImpl(this._self, this._then);

  final RenewalOptions _self;
  final $Res Function(RenewalOptions) _then;

/// Create a copy of RenewalOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canRenew = freezed,Object? message = freezed,Object? previousFollowupId = freezed,}) {
  return _then(_self.copyWith(
canRenew: freezed == canRenew ? _self.canRenew : canRenew // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,previousFollowupId: freezed == previousFollowupId ? _self.previousFollowupId : previousFollowupId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RenewalOptions].
extension RenewalOptionsPatterns on RenewalOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenewalOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenewalOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenewalOptions value)  $default,){
final _that = this;
switch (_that) {
case _RenewalOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenewalOptions value)?  $default,){
final _that = this;
switch (_that) {
case _RenewalOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'can_renew')  bool? canRenew,  String? message, @JsonKey(name: 'previous_followup_id')  String? previousFollowupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenewalOptions() when $default != null:
return $default(_that.canRenew,_that.message,_that.previousFollowupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'can_renew')  bool? canRenew,  String? message, @JsonKey(name: 'previous_followup_id')  String? previousFollowupId)  $default,) {final _that = this;
switch (_that) {
case _RenewalOptions():
return $default(_that.canRenew,_that.message,_that.previousFollowupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'can_renew')  bool? canRenew,  String? message, @JsonKey(name: 'previous_followup_id')  String? previousFollowupId)?  $default,) {final _that = this;
switch (_that) {
case _RenewalOptions() when $default != null:
return $default(_that.canRenew,_that.message,_that.previousFollowupId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenewalOptions implements RenewalOptions {
  const _RenewalOptions({@JsonKey(name: 'can_renew') this.canRenew, this.message, @JsonKey(name: 'previous_followup_id') this.previousFollowupId});
  factory _RenewalOptions.fromJson(Map<String, dynamic> json) => _$RenewalOptionsFromJson(json);

@override@JsonKey(name: 'can_renew') final  bool? canRenew;
@override final  String? message;
@override@JsonKey(name: 'previous_followup_id') final  String? previousFollowupId;

/// Create a copy of RenewalOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenewalOptionsCopyWith<_RenewalOptions> get copyWith => __$RenewalOptionsCopyWithImpl<_RenewalOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenewalOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenewalOptions&&(identical(other.canRenew, canRenew) || other.canRenew == canRenew)&&(identical(other.message, message) || other.message == message)&&(identical(other.previousFollowupId, previousFollowupId) || other.previousFollowupId == previousFollowupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canRenew,message,previousFollowupId);

@override
String toString() {
  return 'RenewalOptions(canRenew: $canRenew, message: $message, previousFollowupId: $previousFollowupId)';
}


}

/// @nodoc
abstract mixin class _$RenewalOptionsCopyWith<$Res> implements $RenewalOptionsCopyWith<$Res> {
  factory _$RenewalOptionsCopyWith(_RenewalOptions value, $Res Function(_RenewalOptions) _then) = __$RenewalOptionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'can_renew') bool? canRenew, String? message,@JsonKey(name: 'previous_followup_id') String? previousFollowupId
});




}
/// @nodoc
class __$RenewalOptionsCopyWithImpl<$Res>
    implements _$RenewalOptionsCopyWith<$Res> {
  __$RenewalOptionsCopyWithImpl(this._self, this._then);

  final _RenewalOptions _self;
  final $Res Function(_RenewalOptions) _then;

/// Create a copy of RenewalOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canRenew = freezed,Object? message = freezed,Object? previousFollowupId = freezed,}) {
  return _then(_RenewalOptions(
canRenew: freezed == canRenew ? _self.canRenew : canRenew // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,previousFollowupId: freezed == previousFollowupId ? _self.previousFollowupId : previousFollowupId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Department {

 String? get id; String? get name; String? get description; List<Doctor>? get doctors;
/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentCopyWith<Department> get copyWith => _$DepartmentCopyWithImpl<Department>(this as Department, _$identity);

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Department&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.doctors, doctors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(doctors));

@override
String toString() {
  return 'Department(id: $id, name: $name, description: $description, doctors: $doctors)';
}


}

/// @nodoc
abstract mixin class $DepartmentCopyWith<$Res>  {
  factory $DepartmentCopyWith(Department value, $Res Function(Department) _then) = _$DepartmentCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? description, List<Doctor>? doctors
});




}
/// @nodoc
class _$DepartmentCopyWithImpl<$Res>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._self, this._then);

  final Department _self;
  final $Res Function(Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? doctors = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,doctors: freezed == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Department].
extension DepartmentPatterns on Department {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Department value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Department() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Department value)  $default,){
final _that = this;
switch (_that) {
case _Department():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Department value)?  $default,){
final _that = this;
switch (_that) {
case _Department() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  List<Doctor>? doctors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.doctors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  List<Doctor>? doctors)  $default,) {final _that = this;
switch (_that) {
case _Department():
return $default(_that.id,_that.name,_that.description,_that.doctors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? description,  List<Doctor>? doctors)?  $default,) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.doctors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Department implements Department {
  const _Department({this.id, this.name, this.description, final  List<Doctor>? doctors}): _doctors = doctors;
  factory _Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? description;
 final  List<Doctor>? _doctors;
@override List<Doctor>? get doctors {
  final value = _doctors;
  if (value == null) return null;
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentCopyWith<_Department> get copyWith => __$DepartmentCopyWithImpl<_Department>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Department&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._doctors, _doctors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_doctors));

@override
String toString() {
  return 'Department(id: $id, name: $name, description: $description, doctors: $doctors)';
}


}

/// @nodoc
abstract mixin class _$DepartmentCopyWith<$Res> implements $DepartmentCopyWith<$Res> {
  factory _$DepartmentCopyWith(_Department value, $Res Function(_Department) _then) = __$DepartmentCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? description, List<Doctor>? doctors
});




}
/// @nodoc
class __$DepartmentCopyWithImpl<$Res>
    implements _$DepartmentCopyWith<$Res> {
  __$DepartmentCopyWithImpl(this._self, this._then);

  final _Department _self;
  final $Res Function(_Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? doctors = freezed,}) {
  return _then(_Department(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,doctors: freezed == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>?,
  ));
}


}


/// @nodoc
mixin _$ConsultationType {

 String? get id; String? get name; String? get description; double? get baseFee;
/// Create a copy of ConsultationType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationTypeCopyWith<ConsultationType> get copyWith => _$ConsultationTypeCopyWithImpl<ConsultationType>(this as ConsultationType, _$identity);

  /// Serializes this ConsultationType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.baseFee, baseFee) || other.baseFee == baseFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,baseFee);

@override
String toString() {
  return 'ConsultationType(id: $id, name: $name, description: $description, baseFee: $baseFee)';
}


}

/// @nodoc
abstract mixin class $ConsultationTypeCopyWith<$Res>  {
  factory $ConsultationTypeCopyWith(ConsultationType value, $Res Function(ConsultationType) _then) = _$ConsultationTypeCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? description, double? baseFee
});




}
/// @nodoc
class _$ConsultationTypeCopyWithImpl<$Res>
    implements $ConsultationTypeCopyWith<$Res> {
  _$ConsultationTypeCopyWithImpl(this._self, this._then);

  final ConsultationType _self;
  final $Res Function(ConsultationType) _then;

/// Create a copy of ConsultationType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? baseFee = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,baseFee: freezed == baseFee ? _self.baseFee : baseFee // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationType].
extension ConsultationTypePatterns on ConsultationType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationType value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationType value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  double? baseFee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationType() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.baseFee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  double? baseFee)  $default,) {final _that = this;
switch (_that) {
case _ConsultationType():
return $default(_that.id,_that.name,_that.description,_that.baseFee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? description,  double? baseFee)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationType() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.baseFee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationType implements ConsultationType {
  const _ConsultationType({this.id, this.name, this.description, this.baseFee});
  factory _ConsultationType.fromJson(Map<String, dynamic> json) => _$ConsultationTypeFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? description;
@override final  double? baseFee;

/// Create a copy of ConsultationType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationTypeCopyWith<_ConsultationType> get copyWith => __$ConsultationTypeCopyWithImpl<_ConsultationType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.baseFee, baseFee) || other.baseFee == baseFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,baseFee);

@override
String toString() {
  return 'ConsultationType(id: $id, name: $name, description: $description, baseFee: $baseFee)';
}


}

/// @nodoc
abstract mixin class _$ConsultationTypeCopyWith<$Res> implements $ConsultationTypeCopyWith<$Res> {
  factory _$ConsultationTypeCopyWith(_ConsultationType value, $Res Function(_ConsultationType) _then) = __$ConsultationTypeCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? description, double? baseFee
});




}
/// @nodoc
class __$ConsultationTypeCopyWithImpl<$Res>
    implements _$ConsultationTypeCopyWith<$Res> {
  __$ConsultationTypeCopyWithImpl(this._self, this._then);

  final _ConsultationType _self;
  final $Res Function(_ConsultationType) _then;

/// Create a copy of ConsultationType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? baseFee = freezed,}) {
  return _then(_ConsultationType(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,baseFee: freezed == baseFee ? _self.baseFee : baseFee // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$PaymentMethod {

 String? get id; String? get name; String? get type; bool? get isActive;
/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodCopyWith<PaymentMethod> get copyWith => _$PaymentMethodCopyWithImpl<PaymentMethod>(this as PaymentMethod, _$identity);

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isActive);

@override
String toString() {
  return 'PaymentMethod(id: $id, name: $name, type: $type, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodCopyWith<$Res>  {
  factory $PaymentMethodCopyWith(PaymentMethod value, $Res Function(PaymentMethod) _then) = _$PaymentMethodCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? type, bool? isActive
});




}
/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._self, this._then);

  final PaymentMethod _self;
  final $Res Function(PaymentMethod) _then;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? type = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethod].
extension PaymentMethodPatterns on PaymentMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethod value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethod value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? type,  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? type,  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethod():
return $default(_that.id,_that.name,_that.type,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? type,  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethod implements PaymentMethod {
  const _PaymentMethod({this.id, this.name, this.type, this.isActive});
  factory _PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? type;
@override final  bool? isActive;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodCopyWith<_PaymentMethod> get copyWith => __$PaymentMethodCopyWithImpl<_PaymentMethod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isActive);

@override
String toString() {
  return 'PaymentMethod(id: $id, name: $name, type: $type, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodCopyWith<$Res> implements $PaymentMethodCopyWith<$Res> {
  factory _$PaymentMethodCopyWith(_PaymentMethod value, $Res Function(_PaymentMethod) _then) = __$PaymentMethodCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? type, bool? isActive
});




}
/// @nodoc
class __$PaymentMethodCopyWithImpl<$Res>
    implements _$PaymentMethodCopyWith<$Res> {
  __$PaymentMethodCopyWithImpl(this._self, this._then);

  final _PaymentMethod _self;
  final $Res Function(_PaymentMethod) _then;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? type = freezed,Object? isActive = freezed,}) {
  return _then(_PaymentMethod(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$MedicalRecord {

 String? get id; String? get patientId; String? get appointmentId; String? get recordType; String? get fileName; String? get fileUrl; String? get uploadDate; String? get description;
/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalRecordCopyWith<MedicalRecord> get copyWith => _$MedicalRecordCopyWithImpl<MedicalRecord>(this as MedicalRecord, _$identity);

  /// Serializes this MedicalRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,appointmentId,recordType,fileName,fileUrl,uploadDate,description);

@override
String toString() {
  return 'MedicalRecord(id: $id, patientId: $patientId, appointmentId: $appointmentId, recordType: $recordType, fileName: $fileName, fileUrl: $fileUrl, uploadDate: $uploadDate, description: $description)';
}


}

/// @nodoc
abstract mixin class $MedicalRecordCopyWith<$Res>  {
  factory $MedicalRecordCopyWith(MedicalRecord value, $Res Function(MedicalRecord) _then) = _$MedicalRecordCopyWithImpl;
@useResult
$Res call({
 String? id, String? patientId, String? appointmentId, String? recordType, String? fileName, String? fileUrl, String? uploadDate, String? description
});




}
/// @nodoc
class _$MedicalRecordCopyWithImpl<$Res>
    implements $MedicalRecordCopyWith<$Res> {
  _$MedicalRecordCopyWithImpl(this._self, this._then);

  final MedicalRecord _self;
  final $Res Function(MedicalRecord) _then;

/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? patientId = freezed,Object? appointmentId = freezed,Object? recordType = freezed,Object? fileName = freezed,Object? fileUrl = freezed,Object? uploadDate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,recordType: freezed == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalRecord].
extension MedicalRecordPatterns on MedicalRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalRecord value)  $default,){
final _that = this;
switch (_that) {
case _MedicalRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalRecord value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? patientId,  String? appointmentId,  String? recordType,  String? fileName,  String? fileUrl,  String? uploadDate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
return $default(_that.id,_that.patientId,_that.appointmentId,_that.recordType,_that.fileName,_that.fileUrl,_that.uploadDate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? patientId,  String? appointmentId,  String? recordType,  String? fileName,  String? fileUrl,  String? uploadDate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _MedicalRecord():
return $default(_that.id,_that.patientId,_that.appointmentId,_that.recordType,_that.fileName,_that.fileUrl,_that.uploadDate,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? patientId,  String? appointmentId,  String? recordType,  String? fileName,  String? fileUrl,  String? uploadDate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _MedicalRecord() when $default != null:
return $default(_that.id,_that.patientId,_that.appointmentId,_that.recordType,_that.fileName,_that.fileUrl,_that.uploadDate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicalRecord implements MedicalRecord {
  const _MedicalRecord({this.id, this.patientId, this.appointmentId, this.recordType, this.fileName, this.fileUrl, this.uploadDate, this.description});
  factory _MedicalRecord.fromJson(Map<String, dynamic> json) => _$MedicalRecordFromJson(json);

@override final  String? id;
@override final  String? patientId;
@override final  String? appointmentId;
@override final  String? recordType;
@override final  String? fileName;
@override final  String? fileUrl;
@override final  String? uploadDate;
@override final  String? description;

/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalRecordCopyWith<_MedicalRecord> get copyWith => __$MedicalRecordCopyWithImpl<_MedicalRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,appointmentId,recordType,fileName,fileUrl,uploadDate,description);

@override
String toString() {
  return 'MedicalRecord(id: $id, patientId: $patientId, appointmentId: $appointmentId, recordType: $recordType, fileName: $fileName, fileUrl: $fileUrl, uploadDate: $uploadDate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$MedicalRecordCopyWith<$Res> implements $MedicalRecordCopyWith<$Res> {
  factory _$MedicalRecordCopyWith(_MedicalRecord value, $Res Function(_MedicalRecord) _then) = __$MedicalRecordCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? patientId, String? appointmentId, String? recordType, String? fileName, String? fileUrl, String? uploadDate, String? description
});




}
/// @nodoc
class __$MedicalRecordCopyWithImpl<$Res>
    implements _$MedicalRecordCopyWith<$Res> {
  __$MedicalRecordCopyWithImpl(this._self, this._then);

  final _MedicalRecord _self;
  final $Res Function(_MedicalRecord) _then;

/// Create a copy of MedicalRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? patientId = freezed,Object? appointmentId = freezed,Object? recordType = freezed,Object? fileName = freezed,Object? fileUrl = freezed,Object? uploadDate = freezed,Object? description = freezed,}) {
  return _then(_MedicalRecord(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,recordType: freezed == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Prescription {

 String? get id; String? get patientId; String? get appointmentId; String? get medication; String? get dosage; String? get frequency; String? get duration; String? get instructions; String? get prescribedDate;
/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionCopyWith<Prescription> get copyWith => _$PrescriptionCopyWithImpl<Prescription>(this as Prescription, _$identity);

  /// Serializes this Prescription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Prescription&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.medication, medication) || other.medication == medication)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.prescribedDate, prescribedDate) || other.prescribedDate == prescribedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,appointmentId,medication,dosage,frequency,duration,instructions,prescribedDate);

@override
String toString() {
  return 'Prescription(id: $id, patientId: $patientId, appointmentId: $appointmentId, medication: $medication, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, prescribedDate: $prescribedDate)';
}


}

/// @nodoc
abstract mixin class $PrescriptionCopyWith<$Res>  {
  factory $PrescriptionCopyWith(Prescription value, $Res Function(Prescription) _then) = _$PrescriptionCopyWithImpl;
@useResult
$Res call({
 String? id, String? patientId, String? appointmentId, String? medication, String? dosage, String? frequency, String? duration, String? instructions, String? prescribedDate
});




}
/// @nodoc
class _$PrescriptionCopyWithImpl<$Res>
    implements $PrescriptionCopyWith<$Res> {
  _$PrescriptionCopyWithImpl(this._self, this._then);

  final Prescription _self;
  final $Res Function(Prescription) _then;

/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? patientId = freezed,Object? appointmentId = freezed,Object? medication = freezed,Object? dosage = freezed,Object? frequency = freezed,Object? duration = freezed,Object? instructions = freezed,Object? prescribedDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,medication: freezed == medication ? _self.medication : medication // ignore: cast_nullable_to_non_nullable
as String?,dosage: freezed == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,prescribedDate: freezed == prescribedDate ? _self.prescribedDate : prescribedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Prescription].
extension PrescriptionPatterns on Prescription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Prescription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Prescription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Prescription value)  $default,){
final _that = this;
switch (_that) {
case _Prescription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Prescription value)?  $default,){
final _that = this;
switch (_that) {
case _Prescription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? patientId,  String? appointmentId,  String? medication,  String? dosage,  String? frequency,  String? duration,  String? instructions,  String? prescribedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Prescription() when $default != null:
return $default(_that.id,_that.patientId,_that.appointmentId,_that.medication,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.prescribedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? patientId,  String? appointmentId,  String? medication,  String? dosage,  String? frequency,  String? duration,  String? instructions,  String? prescribedDate)  $default,) {final _that = this;
switch (_that) {
case _Prescription():
return $default(_that.id,_that.patientId,_that.appointmentId,_that.medication,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.prescribedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? patientId,  String? appointmentId,  String? medication,  String? dosage,  String? frequency,  String? duration,  String? instructions,  String? prescribedDate)?  $default,) {final _that = this;
switch (_that) {
case _Prescription() when $default != null:
return $default(_that.id,_that.patientId,_that.appointmentId,_that.medication,_that.dosage,_that.frequency,_that.duration,_that.instructions,_that.prescribedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Prescription implements Prescription {
  const _Prescription({this.id, this.patientId, this.appointmentId, this.medication, this.dosage, this.frequency, this.duration, this.instructions, this.prescribedDate});
  factory _Prescription.fromJson(Map<String, dynamic> json) => _$PrescriptionFromJson(json);

@override final  String? id;
@override final  String? patientId;
@override final  String? appointmentId;
@override final  String? medication;
@override final  String? dosage;
@override final  String? frequency;
@override final  String? duration;
@override final  String? instructions;
@override final  String? prescribedDate;

/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionCopyWith<_Prescription> get copyWith => __$PrescriptionCopyWithImpl<_Prescription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Prescription&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.medication, medication) || other.medication == medication)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.prescribedDate, prescribedDate) || other.prescribedDate == prescribedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,appointmentId,medication,dosage,frequency,duration,instructions,prescribedDate);

@override
String toString() {
  return 'Prescription(id: $id, patientId: $patientId, appointmentId: $appointmentId, medication: $medication, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, prescribedDate: $prescribedDate)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionCopyWith<$Res> implements $PrescriptionCopyWith<$Res> {
  factory _$PrescriptionCopyWith(_Prescription value, $Res Function(_Prescription) _then) = __$PrescriptionCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? patientId, String? appointmentId, String? medication, String? dosage, String? frequency, String? duration, String? instructions, String? prescribedDate
});




}
/// @nodoc
class __$PrescriptionCopyWithImpl<$Res>
    implements _$PrescriptionCopyWith<$Res> {
  __$PrescriptionCopyWithImpl(this._self, this._then);

  final _Prescription _self;
  final $Res Function(_Prescription) _then;

/// Create a copy of Prescription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? patientId = freezed,Object? appointmentId = freezed,Object? medication = freezed,Object? dosage = freezed,Object? frequency = freezed,Object? duration = freezed,Object? instructions = freezed,Object? prescribedDate = freezed,}) {
  return _then(_Prescription(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,medication: freezed == medication ? _self.medication : medication // ignore: cast_nullable_to_non_nullable
as String?,dosage: freezed == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,prescribedDate: freezed == prescribedDate ? _self.prescribedDate : prescribedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
