// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/vitals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VitalsRecord {

 String? get id;@JsonKey(name: 'clinic_patient_id') String? get clinicPatientId;@JsonKey(name: 'appointment_id') String? get appointmentId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'systolic_bp') int? get systolicBp;@JsonKey(name: 'diastolic_bp') int? get diastolicBp;@JsonKey(name: 'blood_pressure') String? get bloodPressure; double? get temperature;@JsonKey(name: 'pulse_rate') int? get pulseRate;@JsonKey(name: 'resp_bpm') int? get respBpm;@JsonKey(name: 'spo2_percent') int? get spo2Percent;@JsonKey(name: 'sugar_mgdl') double? get sugarMgdl;@JsonKey(name: 'height_cm') int? get heightCm;@JsonKey(name: 'weight_kg') double? get weightKg; double? get bmi;@JsonKey(name: 'smoking_status') String? get smokingStatus;@JsonKey(name: 'alcohol_use') String? get alcoholUse; String? get notes;@JsonKey(name: 'recorded_by') String? get recordedBy;@JsonKey(name: 'recorded_at') String? get recordedAt;
/// Create a copy of VitalsRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalsRecordCopyWith<VitalsRecord> get copyWith => _$VitalsRecordCopyWithImpl<VitalsRecord>(this as VitalsRecord, _$identity);

  /// Serializes this VitalsRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.systolicBp, systolicBp) || other.systolicBp == systolicBp)&&(identical(other.diastolicBp, diastolicBp) || other.diastolicBp == diastolicBp)&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respBpm, respBpm) || other.respBpm == respBpm)&&(identical(other.spo2Percent, spo2Percent) || other.spo2Percent == spo2Percent)&&(identical(other.sugarMgdl, sugarMgdl) || other.sugarMgdl == sugarMgdl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clinicPatientId,appointmentId,clinicId,systolicBp,diastolicBp,bloodPressure,temperature,pulseRate,respBpm,spo2Percent,sugarMgdl,heightCm,weightKg,bmi,smokingStatus,alcoholUse,notes,recordedBy,recordedAt]);

@override
String toString() {
  return 'VitalsRecord(id: $id, clinicPatientId: $clinicPatientId, appointmentId: $appointmentId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, notes: $notes, recordedBy: $recordedBy, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $VitalsRecordCopyWith<$Res>  {
  factory $VitalsRecordCopyWith(VitalsRecord value, $Res Function(VitalsRecord) _then) = _$VitalsRecordCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'systolic_bp') int? systolicBp,@JsonKey(name: 'diastolic_bp') int? diastolicBp,@JsonKey(name: 'blood_pressure') String? bloodPressure, double? temperature,@JsonKey(name: 'pulse_rate') int? pulseRate,@JsonKey(name: 'resp_bpm') int? respBpm,@JsonKey(name: 'spo2_percent') int? spo2Percent,@JsonKey(name: 'sugar_mgdl') double? sugarMgdl,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') double? weightKg, double? bmi,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse, String? notes,@JsonKey(name: 'recorded_by') String? recordedBy,@JsonKey(name: 'recorded_at') String? recordedAt
});




}
/// @nodoc
class _$VitalsRecordCopyWithImpl<$Res>
    implements $VitalsRecordCopyWith<$Res> {
  _$VitalsRecordCopyWithImpl(this._self, this._then);

  final VitalsRecord _self;
  final $Res Function(VitalsRecord) _then;

/// Create a copy of VitalsRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? clinicPatientId = freezed,Object? appointmentId = freezed,Object? clinicId = freezed,Object? systolicBp = freezed,Object? diastolicBp = freezed,Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulseRate = freezed,Object? respBpm = freezed,Object? spo2Percent = freezed,Object? sugarMgdl = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? bmi = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? notes = freezed,Object? recordedBy = freezed,Object? recordedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,systolicBp: freezed == systolicBp ? _self.systolicBp : systolicBp // ignore: cast_nullable_to_non_nullable
as int?,diastolicBp: freezed == diastolicBp ? _self.diastolicBp : diastolicBp // ignore: cast_nullable_to_non_nullable
as int?,bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respBpm: freezed == respBpm ? _self.respBpm : respBpm // ignore: cast_nullable_to_non_nullable
as int?,spo2Percent: freezed == spo2Percent ? _self.spo2Percent : spo2Percent // ignore: cast_nullable_to_non_nullable
as int?,sugarMgdl: freezed == sugarMgdl ? _self.sugarMgdl : sugarMgdl // ignore: cast_nullable_to_non_nullable
as double?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: freezed == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VitalsRecord].
extension VitalsRecordPatterns on VitalsRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalsRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalsRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalsRecord value)  $default,){
final _that = this;
switch (_that) {
case _VitalsRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalsRecord value)?  $default,){
final _that = this;
switch (_that) {
case _VitalsRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes, @JsonKey(name: 'recorded_by')  String? recordedBy, @JsonKey(name: 'recorded_at')  String? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalsRecord() when $default != null:
return $default(_that.id,_that.clinicPatientId,_that.appointmentId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes,_that.recordedBy,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes, @JsonKey(name: 'recorded_by')  String? recordedBy, @JsonKey(name: 'recorded_at')  String? recordedAt)  $default,) {final _that = this;
switch (_that) {
case _VitalsRecord():
return $default(_that.id,_that.clinicPatientId,_that.appointmentId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes,_that.recordedBy,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes, @JsonKey(name: 'recorded_by')  String? recordedBy, @JsonKey(name: 'recorded_at')  String? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _VitalsRecord() when $default != null:
return $default(_that.id,_that.clinicPatientId,_that.appointmentId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes,_that.recordedBy,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VitalsRecord implements VitalsRecord {
  const _VitalsRecord({this.id, @JsonKey(name: 'clinic_patient_id') this.clinicPatientId, @JsonKey(name: 'appointment_id') this.appointmentId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'systolic_bp') this.systolicBp, @JsonKey(name: 'diastolic_bp') this.diastolicBp, @JsonKey(name: 'blood_pressure') this.bloodPressure, this.temperature, @JsonKey(name: 'pulse_rate') this.pulseRate, @JsonKey(name: 'resp_bpm') this.respBpm, @JsonKey(name: 'spo2_percent') this.spo2Percent, @JsonKey(name: 'sugar_mgdl') this.sugarMgdl, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'weight_kg') this.weightKg, this.bmi, @JsonKey(name: 'smoking_status') this.smokingStatus, @JsonKey(name: 'alcohol_use') this.alcoholUse, this.notes, @JsonKey(name: 'recorded_by') this.recordedBy, @JsonKey(name: 'recorded_at') this.recordedAt});
  factory _VitalsRecord.fromJson(Map<String, dynamic> json) => _$VitalsRecordFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'clinic_patient_id') final  String? clinicPatientId;
@override@JsonKey(name: 'appointment_id') final  String? appointmentId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'systolic_bp') final  int? systolicBp;
@override@JsonKey(name: 'diastolic_bp') final  int? diastolicBp;
@override@JsonKey(name: 'blood_pressure') final  String? bloodPressure;
@override final  double? temperature;
@override@JsonKey(name: 'pulse_rate') final  int? pulseRate;
@override@JsonKey(name: 'resp_bpm') final  int? respBpm;
@override@JsonKey(name: 'spo2_percent') final  int? spo2Percent;
@override@JsonKey(name: 'sugar_mgdl') final  double? sugarMgdl;
@override@JsonKey(name: 'height_cm') final  int? heightCm;
@override@JsonKey(name: 'weight_kg') final  double? weightKg;
@override final  double? bmi;
@override@JsonKey(name: 'smoking_status') final  String? smokingStatus;
@override@JsonKey(name: 'alcohol_use') final  String? alcoholUse;
@override final  String? notes;
@override@JsonKey(name: 'recorded_by') final  String? recordedBy;
@override@JsonKey(name: 'recorded_at') final  String? recordedAt;

/// Create a copy of VitalsRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalsRecordCopyWith<_VitalsRecord> get copyWith => __$VitalsRecordCopyWithImpl<_VitalsRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VitalsRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalsRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.systolicBp, systolicBp) || other.systolicBp == systolicBp)&&(identical(other.diastolicBp, diastolicBp) || other.diastolicBp == diastolicBp)&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respBpm, respBpm) || other.respBpm == respBpm)&&(identical(other.spo2Percent, spo2Percent) || other.spo2Percent == spo2Percent)&&(identical(other.sugarMgdl, sugarMgdl) || other.sugarMgdl == sugarMgdl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clinicPatientId,appointmentId,clinicId,systolicBp,diastolicBp,bloodPressure,temperature,pulseRate,respBpm,spo2Percent,sugarMgdl,heightCm,weightKg,bmi,smokingStatus,alcoholUse,notes,recordedBy,recordedAt]);

@override
String toString() {
  return 'VitalsRecord(id: $id, clinicPatientId: $clinicPatientId, appointmentId: $appointmentId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, notes: $notes, recordedBy: $recordedBy, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$VitalsRecordCopyWith<$Res> implements $VitalsRecordCopyWith<$Res> {
  factory _$VitalsRecordCopyWith(_VitalsRecord value, $Res Function(_VitalsRecord) _then) = __$VitalsRecordCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'systolic_bp') int? systolicBp,@JsonKey(name: 'diastolic_bp') int? diastolicBp,@JsonKey(name: 'blood_pressure') String? bloodPressure, double? temperature,@JsonKey(name: 'pulse_rate') int? pulseRate,@JsonKey(name: 'resp_bpm') int? respBpm,@JsonKey(name: 'spo2_percent') int? spo2Percent,@JsonKey(name: 'sugar_mgdl') double? sugarMgdl,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') double? weightKg, double? bmi,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse, String? notes,@JsonKey(name: 'recorded_by') String? recordedBy,@JsonKey(name: 'recorded_at') String? recordedAt
});




}
/// @nodoc
class __$VitalsRecordCopyWithImpl<$Res>
    implements _$VitalsRecordCopyWith<$Res> {
  __$VitalsRecordCopyWithImpl(this._self, this._then);

  final _VitalsRecord _self;
  final $Res Function(_VitalsRecord) _then;

/// Create a copy of VitalsRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? clinicPatientId = freezed,Object? appointmentId = freezed,Object? clinicId = freezed,Object? systolicBp = freezed,Object? diastolicBp = freezed,Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulseRate = freezed,Object? respBpm = freezed,Object? spo2Percent = freezed,Object? sugarMgdl = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? bmi = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? notes = freezed,Object? recordedBy = freezed,Object? recordedAt = freezed,}) {
  return _then(_VitalsRecord(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,systolicBp: freezed == systolicBp ? _self.systolicBp : systolicBp // ignore: cast_nullable_to_non_nullable
as int?,diastolicBp: freezed == diastolicBp ? _self.diastolicBp : diastolicBp // ignore: cast_nullable_to_non_nullable
as int?,bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respBpm: freezed == respBpm ? _self.respBpm : respBpm // ignore: cast_nullable_to_non_nullable
as int?,spo2Percent: freezed == spo2Percent ? _self.spo2Percent : spo2Percent // ignore: cast_nullable_to_non_nullable
as int?,sugarMgdl: freezed == sugarMgdl ? _self.sugarMgdl : sugarMgdl // ignore: cast_nullable_to_non_nullable
as double?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: freezed == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VitalsHistoryResponse {

@JsonKey(name: 'clinic_patient_id') String get clinicPatientId; int get total; List<VitalsRecord> get vitals;
/// Create a copy of VitalsHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalsHistoryResponseCopyWith<VitalsHistoryResponse> get copyWith => _$VitalsHistoryResponseCopyWithImpl<VitalsHistoryResponse>(this as VitalsHistoryResponse, _$identity);

  /// Serializes this VitalsHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsHistoryResponse&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.vitals, vitals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicPatientId,total,const DeepCollectionEquality().hash(vitals));

@override
String toString() {
  return 'VitalsHistoryResponse(clinicPatientId: $clinicPatientId, total: $total, vitals: $vitals)';
}


}

/// @nodoc
abstract mixin class $VitalsHistoryResponseCopyWith<$Res>  {
  factory $VitalsHistoryResponseCopyWith(VitalsHistoryResponse value, $Res Function(VitalsHistoryResponse) _then) = _$VitalsHistoryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clinic_patient_id') String clinicPatientId, int total, List<VitalsRecord> vitals
});




}
/// @nodoc
class _$VitalsHistoryResponseCopyWithImpl<$Res>
    implements $VitalsHistoryResponseCopyWith<$Res> {
  _$VitalsHistoryResponseCopyWithImpl(this._self, this._then);

  final VitalsHistoryResponse _self;
  final $Res Function(VitalsHistoryResponse) _then;

/// Create a copy of VitalsHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicPatientId = null,Object? total = null,Object? vitals = null,}) {
  return _then(_self.copyWith(
clinicPatientId: null == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,vitals: null == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as List<VitalsRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [VitalsHistoryResponse].
extension VitalsHistoryResponsePatterns on VitalsHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalsHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalsHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalsHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _VitalsHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalsHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VitalsHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_patient_id')  String clinicPatientId,  int total,  List<VitalsRecord> vitals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalsHistoryResponse() when $default != null:
return $default(_that.clinicPatientId,_that.total,_that.vitals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clinic_patient_id')  String clinicPatientId,  int total,  List<VitalsRecord> vitals)  $default,) {final _that = this;
switch (_that) {
case _VitalsHistoryResponse():
return $default(_that.clinicPatientId,_that.total,_that.vitals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clinic_patient_id')  String clinicPatientId,  int total,  List<VitalsRecord> vitals)?  $default,) {final _that = this;
switch (_that) {
case _VitalsHistoryResponse() when $default != null:
return $default(_that.clinicPatientId,_that.total,_that.vitals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VitalsHistoryResponse implements VitalsHistoryResponse {
  const _VitalsHistoryResponse({@JsonKey(name: 'clinic_patient_id') required this.clinicPatientId, required this.total, required final  List<VitalsRecord> vitals}): _vitals = vitals;
  factory _VitalsHistoryResponse.fromJson(Map<String, dynamic> json) => _$VitalsHistoryResponseFromJson(json);

@override@JsonKey(name: 'clinic_patient_id') final  String clinicPatientId;
@override final  int total;
 final  List<VitalsRecord> _vitals;
@override List<VitalsRecord> get vitals {
  if (_vitals is EqualUnmodifiableListView) return _vitals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vitals);
}


/// Create a copy of VitalsHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalsHistoryResponseCopyWith<_VitalsHistoryResponse> get copyWith => __$VitalsHistoryResponseCopyWithImpl<_VitalsHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VitalsHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalsHistoryResponse&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._vitals, _vitals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicPatientId,total,const DeepCollectionEquality().hash(_vitals));

@override
String toString() {
  return 'VitalsHistoryResponse(clinicPatientId: $clinicPatientId, total: $total, vitals: $vitals)';
}


}

/// @nodoc
abstract mixin class _$VitalsHistoryResponseCopyWith<$Res> implements $VitalsHistoryResponseCopyWith<$Res> {
  factory _$VitalsHistoryResponseCopyWith(_VitalsHistoryResponse value, $Res Function(_VitalsHistoryResponse) _then) = __$VitalsHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clinic_patient_id') String clinicPatientId, int total, List<VitalsRecord> vitals
});




}
/// @nodoc
class __$VitalsHistoryResponseCopyWithImpl<$Res>
    implements _$VitalsHistoryResponseCopyWith<$Res> {
  __$VitalsHistoryResponseCopyWithImpl(this._self, this._then);

  final _VitalsHistoryResponse _self;
  final $Res Function(_VitalsHistoryResponse) _then;

/// Create a copy of VitalsHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicPatientId = null,Object? total = null,Object? vitals = null,}) {
  return _then(_VitalsHistoryResponse(
clinicPatientId: null == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,vitals: null == vitals ? _self._vitals : vitals // ignore: cast_nullable_to_non_nullable
as List<VitalsRecord>,
  ));
}


}


/// @nodoc
mixin _$CreateVitalsRequest {

@JsonKey(name: 'appointment_id') String get appointmentId;@JsonKey(name: 'recorded_by') String get recordedBy;@JsonKey(name: 'clinic_patient_id') String? get clinicPatientId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'systolic_bp') int? get systolicBp;@JsonKey(name: 'diastolic_bp') int? get diastolicBp;@JsonKey(name: 'blood_pressure') String? get bloodPressure; double? get temperature;@JsonKey(name: 'pulse_rate') int? get pulseRate;@JsonKey(name: 'resp_bpm') int? get respBpm;@JsonKey(name: 'spo2_percent') int? get spo2Percent;@JsonKey(name: 'sugar_mgdl') double? get sugarMgdl;@JsonKey(name: 'height_cm') int? get heightCm;@JsonKey(name: 'weight_kg') double? get weightKg; double? get bmi;@JsonKey(name: 'smoking_status') String? get smokingStatus;@JsonKey(name: 'alcohol_use') String? get alcoholUse; String? get notes;
/// Create a copy of CreateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateVitalsRequestCopyWith<CreateVitalsRequest> get copyWith => _$CreateVitalsRequestCopyWithImpl<CreateVitalsRequest>(this as CreateVitalsRequest, _$identity);

  /// Serializes this CreateVitalsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateVitalsRequest&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.systolicBp, systolicBp) || other.systolicBp == systolicBp)&&(identical(other.diastolicBp, diastolicBp) || other.diastolicBp == diastolicBp)&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respBpm, respBpm) || other.respBpm == respBpm)&&(identical(other.spo2Percent, spo2Percent) || other.spo2Percent == spo2Percent)&&(identical(other.sugarMgdl, sugarMgdl) || other.sugarMgdl == sugarMgdl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,recordedBy,clinicPatientId,clinicId,systolicBp,diastolicBp,bloodPressure,temperature,pulseRate,respBpm,spo2Percent,sugarMgdl,heightCm,weightKg,bmi,smokingStatus,alcoholUse,notes);

@override
String toString() {
  return 'CreateVitalsRequest(appointmentId: $appointmentId, recordedBy: $recordedBy, clinicPatientId: $clinicPatientId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateVitalsRequestCopyWith<$Res>  {
  factory $CreateVitalsRequestCopyWith(CreateVitalsRequest value, $Res Function(CreateVitalsRequest) _then) = _$CreateVitalsRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'recorded_by') String recordedBy,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'systolic_bp') int? systolicBp,@JsonKey(name: 'diastolic_bp') int? diastolicBp,@JsonKey(name: 'blood_pressure') String? bloodPressure, double? temperature,@JsonKey(name: 'pulse_rate') int? pulseRate,@JsonKey(name: 'resp_bpm') int? respBpm,@JsonKey(name: 'spo2_percent') int? spo2Percent,@JsonKey(name: 'sugar_mgdl') double? sugarMgdl,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') double? weightKg, double? bmi,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse, String? notes
});




}
/// @nodoc
class _$CreateVitalsRequestCopyWithImpl<$Res>
    implements $CreateVitalsRequestCopyWith<$Res> {
  _$CreateVitalsRequestCopyWithImpl(this._self, this._then);

  final CreateVitalsRequest _self;
  final $Res Function(CreateVitalsRequest) _then;

/// Create a copy of CreateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appointmentId = null,Object? recordedBy = null,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? systolicBp = freezed,Object? diastolicBp = freezed,Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulseRate = freezed,Object? respBpm = freezed,Object? spo2Percent = freezed,Object? sugarMgdl = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? bmi = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,recordedBy: null == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,systolicBp: freezed == systolicBp ? _self.systolicBp : systolicBp // ignore: cast_nullable_to_non_nullable
as int?,diastolicBp: freezed == diastolicBp ? _self.diastolicBp : diastolicBp // ignore: cast_nullable_to_non_nullable
as int?,bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respBpm: freezed == respBpm ? _self.respBpm : respBpm // ignore: cast_nullable_to_non_nullable
as int?,spo2Percent: freezed == spo2Percent ? _self.spo2Percent : spo2Percent // ignore: cast_nullable_to_non_nullable
as int?,sugarMgdl: freezed == sugarMgdl ? _self.sugarMgdl : sugarMgdl // ignore: cast_nullable_to_non_nullable
as double?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateVitalsRequest].
extension CreateVitalsRequestPatterns on CreateVitalsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateVitalsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateVitalsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateVitalsRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateVitalsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateVitalsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateVitalsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'recorded_by')  String recordedBy, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateVitalsRequest() when $default != null:
return $default(_that.appointmentId,_that.recordedBy,_that.clinicPatientId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'recorded_by')  String recordedBy, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateVitalsRequest():
return $default(_that.appointmentId,_that.recordedBy,_that.clinicPatientId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'appointment_id')  String appointmentId, @JsonKey(name: 'recorded_by')  String recordedBy, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateVitalsRequest() when $default != null:
return $default(_that.appointmentId,_that.recordedBy,_that.clinicPatientId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateVitalsRequest implements CreateVitalsRequest {
  const _CreateVitalsRequest({@JsonKey(name: 'appointment_id') required this.appointmentId, @JsonKey(name: 'recorded_by') required this.recordedBy, @JsonKey(name: 'clinic_patient_id') this.clinicPatientId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'systolic_bp') this.systolicBp, @JsonKey(name: 'diastolic_bp') this.diastolicBp, @JsonKey(name: 'blood_pressure') this.bloodPressure, this.temperature, @JsonKey(name: 'pulse_rate') this.pulseRate, @JsonKey(name: 'resp_bpm') this.respBpm, @JsonKey(name: 'spo2_percent') this.spo2Percent, @JsonKey(name: 'sugar_mgdl') this.sugarMgdl, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'weight_kg') this.weightKg, this.bmi, @JsonKey(name: 'smoking_status') this.smokingStatus, @JsonKey(name: 'alcohol_use') this.alcoholUse, this.notes});
  factory _CreateVitalsRequest.fromJson(Map<String, dynamic> json) => _$CreateVitalsRequestFromJson(json);

@override@JsonKey(name: 'appointment_id') final  String appointmentId;
@override@JsonKey(name: 'recorded_by') final  String recordedBy;
@override@JsonKey(name: 'clinic_patient_id') final  String? clinicPatientId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'systolic_bp') final  int? systolicBp;
@override@JsonKey(name: 'diastolic_bp') final  int? diastolicBp;
@override@JsonKey(name: 'blood_pressure') final  String? bloodPressure;
@override final  double? temperature;
@override@JsonKey(name: 'pulse_rate') final  int? pulseRate;
@override@JsonKey(name: 'resp_bpm') final  int? respBpm;
@override@JsonKey(name: 'spo2_percent') final  int? spo2Percent;
@override@JsonKey(name: 'sugar_mgdl') final  double? sugarMgdl;
@override@JsonKey(name: 'height_cm') final  int? heightCm;
@override@JsonKey(name: 'weight_kg') final  double? weightKg;
@override final  double? bmi;
@override@JsonKey(name: 'smoking_status') final  String? smokingStatus;
@override@JsonKey(name: 'alcohol_use') final  String? alcoholUse;
@override final  String? notes;

/// Create a copy of CreateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateVitalsRequestCopyWith<_CreateVitalsRequest> get copyWith => __$CreateVitalsRequestCopyWithImpl<_CreateVitalsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateVitalsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateVitalsRequest&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.systolicBp, systolicBp) || other.systolicBp == systolicBp)&&(identical(other.diastolicBp, diastolicBp) || other.diastolicBp == diastolicBp)&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respBpm, respBpm) || other.respBpm == respBpm)&&(identical(other.spo2Percent, spo2Percent) || other.spo2Percent == spo2Percent)&&(identical(other.sugarMgdl, sugarMgdl) || other.sugarMgdl == sugarMgdl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appointmentId,recordedBy,clinicPatientId,clinicId,systolicBp,diastolicBp,bloodPressure,temperature,pulseRate,respBpm,spo2Percent,sugarMgdl,heightCm,weightKg,bmi,smokingStatus,alcoholUse,notes);

@override
String toString() {
  return 'CreateVitalsRequest(appointmentId: $appointmentId, recordedBy: $recordedBy, clinicPatientId: $clinicPatientId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateVitalsRequestCopyWith<$Res> implements $CreateVitalsRequestCopyWith<$Res> {
  factory _$CreateVitalsRequestCopyWith(_CreateVitalsRequest value, $Res Function(_CreateVitalsRequest) _then) = __$CreateVitalsRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'appointment_id') String appointmentId,@JsonKey(name: 'recorded_by') String recordedBy,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'systolic_bp') int? systolicBp,@JsonKey(name: 'diastolic_bp') int? diastolicBp,@JsonKey(name: 'blood_pressure') String? bloodPressure, double? temperature,@JsonKey(name: 'pulse_rate') int? pulseRate,@JsonKey(name: 'resp_bpm') int? respBpm,@JsonKey(name: 'spo2_percent') int? spo2Percent,@JsonKey(name: 'sugar_mgdl') double? sugarMgdl,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') double? weightKg, double? bmi,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse, String? notes
});




}
/// @nodoc
class __$CreateVitalsRequestCopyWithImpl<$Res>
    implements _$CreateVitalsRequestCopyWith<$Res> {
  __$CreateVitalsRequestCopyWithImpl(this._self, this._then);

  final _CreateVitalsRequest _self;
  final $Res Function(_CreateVitalsRequest) _then;

/// Create a copy of CreateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appointmentId = null,Object? recordedBy = null,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? systolicBp = freezed,Object? diastolicBp = freezed,Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulseRate = freezed,Object? respBpm = freezed,Object? spo2Percent = freezed,Object? sugarMgdl = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? bmi = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? notes = freezed,}) {
  return _then(_CreateVitalsRequest(
appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,recordedBy: null == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,systolicBp: freezed == systolicBp ? _self.systolicBp : systolicBp // ignore: cast_nullable_to_non_nullable
as int?,diastolicBp: freezed == diastolicBp ? _self.diastolicBp : diastolicBp // ignore: cast_nullable_to_non_nullable
as int?,bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respBpm: freezed == respBpm ? _self.respBpm : respBpm // ignore: cast_nullable_to_non_nullable
as int?,spo2Percent: freezed == spo2Percent ? _self.spo2Percent : spo2Percent // ignore: cast_nullable_to_non_nullable
as int?,sugarMgdl: freezed == sugarMgdl ? _self.sugarMgdl : sugarMgdl // ignore: cast_nullable_to_non_nullable
as double?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateVitalsRequest {

@JsonKey(includeToJson: false) String get id;@JsonKey(name: 'appointment_id') String? get appointmentId;@JsonKey(name: 'recorded_by') String? get recordedBy;@JsonKey(name: 'clinic_patient_id') String? get clinicPatientId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'systolic_bp') int? get systolicBp;@JsonKey(name: 'diastolic_bp') int? get diastolicBp;@JsonKey(name: 'blood_pressure') String? get bloodPressure; double? get temperature;@JsonKey(name: 'pulse_rate') int? get pulseRate;@JsonKey(name: 'resp_bpm') int? get respBpm;@JsonKey(name: 'spo2_percent') int? get spo2Percent;@JsonKey(name: 'sugar_mgdl') double? get sugarMgdl;@JsonKey(name: 'height_cm') int? get heightCm;@JsonKey(name: 'weight_kg') double? get weightKg; double? get bmi;@JsonKey(name: 'smoking_status') String? get smokingStatus;@JsonKey(name: 'alcohol_use') String? get alcoholUse; String? get notes;
/// Create a copy of UpdateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateVitalsRequestCopyWith<UpdateVitalsRequest> get copyWith => _$UpdateVitalsRequestCopyWithImpl<UpdateVitalsRequest>(this as UpdateVitalsRequest, _$identity);

  /// Serializes this UpdateVitalsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateVitalsRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.systolicBp, systolicBp) || other.systolicBp == systolicBp)&&(identical(other.diastolicBp, diastolicBp) || other.diastolicBp == diastolicBp)&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respBpm, respBpm) || other.respBpm == respBpm)&&(identical(other.spo2Percent, spo2Percent) || other.spo2Percent == spo2Percent)&&(identical(other.sugarMgdl, sugarMgdl) || other.sugarMgdl == sugarMgdl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,appointmentId,recordedBy,clinicPatientId,clinicId,systolicBp,diastolicBp,bloodPressure,temperature,pulseRate,respBpm,spo2Percent,sugarMgdl,heightCm,weightKg,bmi,smokingStatus,alcoholUse,notes]);

@override
String toString() {
  return 'UpdateVitalsRequest(id: $id, appointmentId: $appointmentId, recordedBy: $recordedBy, clinicPatientId: $clinicPatientId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateVitalsRequestCopyWith<$Res>  {
  factory $UpdateVitalsRequestCopyWith(UpdateVitalsRequest value, $Res Function(UpdateVitalsRequest) _then) = _$UpdateVitalsRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'recorded_by') String? recordedBy,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'systolic_bp') int? systolicBp,@JsonKey(name: 'diastolic_bp') int? diastolicBp,@JsonKey(name: 'blood_pressure') String? bloodPressure, double? temperature,@JsonKey(name: 'pulse_rate') int? pulseRate,@JsonKey(name: 'resp_bpm') int? respBpm,@JsonKey(name: 'spo2_percent') int? spo2Percent,@JsonKey(name: 'sugar_mgdl') double? sugarMgdl,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') double? weightKg, double? bmi,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse, String? notes
});




}
/// @nodoc
class _$UpdateVitalsRequestCopyWithImpl<$Res>
    implements $UpdateVitalsRequestCopyWith<$Res> {
  _$UpdateVitalsRequestCopyWithImpl(this._self, this._then);

  final UpdateVitalsRequest _self;
  final $Res Function(UpdateVitalsRequest) _then;

/// Create a copy of UpdateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appointmentId = freezed,Object? recordedBy = freezed,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? systolicBp = freezed,Object? diastolicBp = freezed,Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulseRate = freezed,Object? respBpm = freezed,Object? spo2Percent = freezed,Object? sugarMgdl = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? bmi = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: freezed == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,systolicBp: freezed == systolicBp ? _self.systolicBp : systolicBp // ignore: cast_nullable_to_non_nullable
as int?,diastolicBp: freezed == diastolicBp ? _self.diastolicBp : diastolicBp // ignore: cast_nullable_to_non_nullable
as int?,bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respBpm: freezed == respBpm ? _self.respBpm : respBpm // ignore: cast_nullable_to_non_nullable
as int?,spo2Percent: freezed == spo2Percent ? _self.spo2Percent : spo2Percent // ignore: cast_nullable_to_non_nullable
as int?,sugarMgdl: freezed == sugarMgdl ? _self.sugarMgdl : sugarMgdl // ignore: cast_nullable_to_non_nullable
as double?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateVitalsRequest].
extension UpdateVitalsRequestPatterns on UpdateVitalsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateVitalsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateVitalsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateVitalsRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateVitalsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateVitalsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateVitalsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'recorded_by')  String? recordedBy, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateVitalsRequest() when $default != null:
return $default(_that.id,_that.appointmentId,_that.recordedBy,_that.clinicPatientId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'recorded_by')  String? recordedBy, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _UpdateVitalsRequest():
return $default(_that.id,_that.appointmentId,_that.recordedBy,_that.clinicPatientId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id, @JsonKey(name: 'appointment_id')  String? appointmentId, @JsonKey(name: 'recorded_by')  String? recordedBy, @JsonKey(name: 'clinic_patient_id')  String? clinicPatientId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'systolic_bp')  int? systolicBp, @JsonKey(name: 'diastolic_bp')  int? diastolicBp, @JsonKey(name: 'blood_pressure')  String? bloodPressure,  double? temperature, @JsonKey(name: 'pulse_rate')  int? pulseRate, @JsonKey(name: 'resp_bpm')  int? respBpm, @JsonKey(name: 'spo2_percent')  int? spo2Percent, @JsonKey(name: 'sugar_mgdl')  double? sugarMgdl, @JsonKey(name: 'height_cm')  int? heightCm, @JsonKey(name: 'weight_kg')  double? weightKg,  double? bmi, @JsonKey(name: 'smoking_status')  String? smokingStatus, @JsonKey(name: 'alcohol_use')  String? alcoholUse,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _UpdateVitalsRequest() when $default != null:
return $default(_that.id,_that.appointmentId,_that.recordedBy,_that.clinicPatientId,_that.clinicId,_that.systolicBp,_that.diastolicBp,_that.bloodPressure,_that.temperature,_that.pulseRate,_that.respBpm,_that.spo2Percent,_that.sugarMgdl,_that.heightCm,_that.weightKg,_that.bmi,_that.smokingStatus,_that.alcoholUse,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateVitalsRequest implements UpdateVitalsRequest {
  const _UpdateVitalsRequest({@JsonKey(includeToJson: false) required this.id, @JsonKey(name: 'appointment_id') this.appointmentId, @JsonKey(name: 'recorded_by') this.recordedBy, @JsonKey(name: 'clinic_patient_id') this.clinicPatientId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'systolic_bp') this.systolicBp, @JsonKey(name: 'diastolic_bp') this.diastolicBp, @JsonKey(name: 'blood_pressure') this.bloodPressure, this.temperature, @JsonKey(name: 'pulse_rate') this.pulseRate, @JsonKey(name: 'resp_bpm') this.respBpm, @JsonKey(name: 'spo2_percent') this.spo2Percent, @JsonKey(name: 'sugar_mgdl') this.sugarMgdl, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'weight_kg') this.weightKg, this.bmi, @JsonKey(name: 'smoking_status') this.smokingStatus, @JsonKey(name: 'alcohol_use') this.alcoholUse, this.notes});
  factory _UpdateVitalsRequest.fromJson(Map<String, dynamic> json) => _$UpdateVitalsRequestFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey(name: 'appointment_id') final  String? appointmentId;
@override@JsonKey(name: 'recorded_by') final  String? recordedBy;
@override@JsonKey(name: 'clinic_patient_id') final  String? clinicPatientId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'systolic_bp') final  int? systolicBp;
@override@JsonKey(name: 'diastolic_bp') final  int? diastolicBp;
@override@JsonKey(name: 'blood_pressure') final  String? bloodPressure;
@override final  double? temperature;
@override@JsonKey(name: 'pulse_rate') final  int? pulseRate;
@override@JsonKey(name: 'resp_bpm') final  int? respBpm;
@override@JsonKey(name: 'spo2_percent') final  int? spo2Percent;
@override@JsonKey(name: 'sugar_mgdl') final  double? sugarMgdl;
@override@JsonKey(name: 'height_cm') final  int? heightCm;
@override@JsonKey(name: 'weight_kg') final  double? weightKg;
@override final  double? bmi;
@override@JsonKey(name: 'smoking_status') final  String? smokingStatus;
@override@JsonKey(name: 'alcohol_use') final  String? alcoholUse;
@override final  String? notes;

/// Create a copy of UpdateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateVitalsRequestCopyWith<_UpdateVitalsRequest> get copyWith => __$UpdateVitalsRequestCopyWithImpl<_UpdateVitalsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateVitalsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVitalsRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.clinicPatientId, clinicPatientId) || other.clinicPatientId == clinicPatientId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.systolicBp, systolicBp) || other.systolicBp == systolicBp)&&(identical(other.diastolicBp, diastolicBp) || other.diastolicBp == diastolicBp)&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respBpm, respBpm) || other.respBpm == respBpm)&&(identical(other.spo2Percent, spo2Percent) || other.spo2Percent == spo2Percent)&&(identical(other.sugarMgdl, sugarMgdl) || other.sugarMgdl == sugarMgdl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.smokingStatus, smokingStatus) || other.smokingStatus == smokingStatus)&&(identical(other.alcoholUse, alcoholUse) || other.alcoholUse == alcoholUse)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,appointmentId,recordedBy,clinicPatientId,clinicId,systolicBp,diastolicBp,bloodPressure,temperature,pulseRate,respBpm,spo2Percent,sugarMgdl,heightCm,weightKg,bmi,smokingStatus,alcoholUse,notes]);

@override
String toString() {
  return 'UpdateVitalsRequest(id: $id, appointmentId: $appointmentId, recordedBy: $recordedBy, clinicPatientId: $clinicPatientId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$UpdateVitalsRequestCopyWith<$Res> implements $UpdateVitalsRequestCopyWith<$Res> {
  factory _$UpdateVitalsRequestCopyWith(_UpdateVitalsRequest value, $Res Function(_UpdateVitalsRequest) _then) = __$UpdateVitalsRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id,@JsonKey(name: 'appointment_id') String? appointmentId,@JsonKey(name: 'recorded_by') String? recordedBy,@JsonKey(name: 'clinic_patient_id') String? clinicPatientId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'systolic_bp') int? systolicBp,@JsonKey(name: 'diastolic_bp') int? diastolicBp,@JsonKey(name: 'blood_pressure') String? bloodPressure, double? temperature,@JsonKey(name: 'pulse_rate') int? pulseRate,@JsonKey(name: 'resp_bpm') int? respBpm,@JsonKey(name: 'spo2_percent') int? spo2Percent,@JsonKey(name: 'sugar_mgdl') double? sugarMgdl,@JsonKey(name: 'height_cm') int? heightCm,@JsonKey(name: 'weight_kg') double? weightKg, double? bmi,@JsonKey(name: 'smoking_status') String? smokingStatus,@JsonKey(name: 'alcohol_use') String? alcoholUse, String? notes
});




}
/// @nodoc
class __$UpdateVitalsRequestCopyWithImpl<$Res>
    implements _$UpdateVitalsRequestCopyWith<$Res> {
  __$UpdateVitalsRequestCopyWithImpl(this._self, this._then);

  final _UpdateVitalsRequest _self;
  final $Res Function(_UpdateVitalsRequest) _then;

/// Create a copy of UpdateVitalsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appointmentId = freezed,Object? recordedBy = freezed,Object? clinicPatientId = freezed,Object? clinicId = freezed,Object? systolicBp = freezed,Object? diastolicBp = freezed,Object? bloodPressure = freezed,Object? temperature = freezed,Object? pulseRate = freezed,Object? respBpm = freezed,Object? spo2Percent = freezed,Object? sugarMgdl = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? bmi = freezed,Object? smokingStatus = freezed,Object? alcoholUse = freezed,Object? notes = freezed,}) {
  return _then(_UpdateVitalsRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appointmentId: freezed == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: freezed == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String?,clinicPatientId: freezed == clinicPatientId ? _self.clinicPatientId : clinicPatientId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,systolicBp: freezed == systolicBp ? _self.systolicBp : systolicBp // ignore: cast_nullable_to_non_nullable
as int?,diastolicBp: freezed == diastolicBp ? _self.diastolicBp : diastolicBp // ignore: cast_nullable_to_non_nullable
as int?,bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as String?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respBpm: freezed == respBpm ? _self.respBpm : respBpm // ignore: cast_nullable_to_non_nullable
as int?,spo2Percent: freezed == spo2Percent ? _self.spo2Percent : spo2Percent // ignore: cast_nullable_to_non_nullable
as int?,sugarMgdl: freezed == sugarMgdl ? _self.sugarMgdl : sugarMgdl // ignore: cast_nullable_to_non_nullable
as double?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,smokingStatus: freezed == smokingStatus ? _self.smokingStatus : smokingStatus // ignore: cast_nullable_to_non_nullable
as String?,alcoholUse: freezed == alcoholUse ? _self.alcoholUse : alcoholUse // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
