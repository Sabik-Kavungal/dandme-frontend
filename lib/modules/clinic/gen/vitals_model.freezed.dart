// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/vitals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VitalsRecord _$VitalsRecordFromJson(Map<String, dynamic> json) {
  return _VitalsRecord.fromJson(json);
}

/// @nodoc
mixin _$VitalsRecord {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_id')
  String? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'systolic_bp')
  int? get systolicBp => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic_bp')
  int? get diastolicBp => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure')
  String? get bloodPressure => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'pulse_rate')
  int? get pulseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'resp_bpm')
  int? get respBpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'spo2_percent')
  int? get spo2Percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'sugar_mgdl')
  double? get sugarMgdl => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_cm')
  int? get heightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_kg')
  double? get weightKg => throw _privateConstructorUsedError;
  double? get bmi => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String? get recordedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at')
  String? get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this VitalsRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VitalsRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VitalsRecordCopyWith<VitalsRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VitalsRecordCopyWith<$Res> {
  factory $VitalsRecordCopyWith(
    VitalsRecord value,
    $Res Function(VitalsRecord) then,
  ) = _$VitalsRecordCopyWithImpl<$Res, VitalsRecord>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'systolic_bp') int? systolicBp,
    @JsonKey(name: 'diastolic_bp') int? diastolicBp,
    @JsonKey(name: 'blood_pressure') String? bloodPressure,
    double? temperature,
    @JsonKey(name: 'pulse_rate') int? pulseRate,
    @JsonKey(name: 'resp_bpm') int? respBpm,
    @JsonKey(name: 'spo2_percent') int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') double? sugarMgdl,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    double? bmi,
    String? notes,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'recorded_at') String? recordedAt,
  });
}

/// @nodoc
class _$VitalsRecordCopyWithImpl<$Res, $Val extends VitalsRecord>
    implements $VitalsRecordCopyWith<$Res> {
  _$VitalsRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VitalsRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clinicPatientId = freezed,
    Object? appointmentId = freezed,
    Object? clinicId = freezed,
    Object? systolicBp = freezed,
    Object? diastolicBp = freezed,
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulseRate = freezed,
    Object? respBpm = freezed,
    Object? spo2Percent = freezed,
    Object? sugarMgdl = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? bmi = freezed,
    Object? notes = freezed,
    Object? recordedBy = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicPatientId: freezed == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            systolicBp: freezed == systolicBp
                ? _value.systolicBp
                : systolicBp // ignore: cast_nullable_to_non_nullable
                      as int?,
            diastolicBp: freezed == diastolicBp
                ? _value.diastolicBp
                : diastolicBp // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodPressure: freezed == bloodPressure
                ? _value.bloodPressure
                : bloodPressure // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            pulseRate: freezed == pulseRate
                ? _value.pulseRate
                : pulseRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            respBpm: freezed == respBpm
                ? _value.respBpm
                : respBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            spo2Percent: freezed == spo2Percent
                ? _value.spo2Percent
                : spo2Percent // ignore: cast_nullable_to_non_nullable
                      as int?,
            sugarMgdl: freezed == sugarMgdl
                ? _value.sugarMgdl
                : sugarMgdl // ignore: cast_nullable_to_non_nullable
                      as double?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as int?,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            bmi: freezed == bmi
                ? _value.bmi
                : bmi // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedBy: freezed == recordedBy
                ? _value.recordedBy
                : recordedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedAt: freezed == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VitalsRecordImplCopyWith<$Res>
    implements $VitalsRecordCopyWith<$Res> {
  factory _$$VitalsRecordImplCopyWith(
    _$VitalsRecordImpl value,
    $Res Function(_$VitalsRecordImpl) then,
  ) = __$$VitalsRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'systolic_bp') int? systolicBp,
    @JsonKey(name: 'diastolic_bp') int? diastolicBp,
    @JsonKey(name: 'blood_pressure') String? bloodPressure,
    double? temperature,
    @JsonKey(name: 'pulse_rate') int? pulseRate,
    @JsonKey(name: 'resp_bpm') int? respBpm,
    @JsonKey(name: 'spo2_percent') int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') double? sugarMgdl,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    double? bmi,
    String? notes,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'recorded_at') String? recordedAt,
  });
}

/// @nodoc
class __$$VitalsRecordImplCopyWithImpl<$Res>
    extends _$VitalsRecordCopyWithImpl<$Res, _$VitalsRecordImpl>
    implements _$$VitalsRecordImplCopyWith<$Res> {
  __$$VitalsRecordImplCopyWithImpl(
    _$VitalsRecordImpl _value,
    $Res Function(_$VitalsRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VitalsRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clinicPatientId = freezed,
    Object? appointmentId = freezed,
    Object? clinicId = freezed,
    Object? systolicBp = freezed,
    Object? diastolicBp = freezed,
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulseRate = freezed,
    Object? respBpm = freezed,
    Object? spo2Percent = freezed,
    Object? sugarMgdl = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? bmi = freezed,
    Object? notes = freezed,
    Object? recordedBy = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(
      _$VitalsRecordImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicPatientId: freezed == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        systolicBp: freezed == systolicBp
            ? _value.systolicBp
            : systolicBp // ignore: cast_nullable_to_non_nullable
                  as int?,
        diastolicBp: freezed == diastolicBp
            ? _value.diastolicBp
            : diastolicBp // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodPressure: freezed == bloodPressure
            ? _value.bloodPressure
            : bloodPressure // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        pulseRate: freezed == pulseRate
            ? _value.pulseRate
            : pulseRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        respBpm: freezed == respBpm
            ? _value.respBpm
            : respBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        spo2Percent: freezed == spo2Percent
            ? _value.spo2Percent
            : spo2Percent // ignore: cast_nullable_to_non_nullable
                  as int?,
        sugarMgdl: freezed == sugarMgdl
            ? _value.sugarMgdl
            : sugarMgdl // ignore: cast_nullable_to_non_nullable
                  as double?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as int?,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        bmi: freezed == bmi
            ? _value.bmi
            : bmi // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedBy: freezed == recordedBy
            ? _value.recordedBy
            : recordedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedAt: freezed == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VitalsRecordImpl implements _VitalsRecord {
  const _$VitalsRecordImpl({
    this.id,
    @JsonKey(name: 'clinic_patient_id') this.clinicPatientId,
    @JsonKey(name: 'appointment_id') this.appointmentId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'systolic_bp') this.systolicBp,
    @JsonKey(name: 'diastolic_bp') this.diastolicBp,
    @JsonKey(name: 'blood_pressure') this.bloodPressure,
    this.temperature,
    @JsonKey(name: 'pulse_rate') this.pulseRate,
    @JsonKey(name: 'resp_bpm') this.respBpm,
    @JsonKey(name: 'spo2_percent') this.spo2Percent,
    @JsonKey(name: 'sugar_mgdl') this.sugarMgdl,
    @JsonKey(name: 'height_cm') this.heightCm,
    @JsonKey(name: 'weight_kg') this.weightKg,
    this.bmi,
    this.notes,
    @JsonKey(name: 'recorded_by') this.recordedBy,
    @JsonKey(name: 'recorded_at') this.recordedAt,
  });

  factory _$VitalsRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VitalsRecordImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String? clinicPatientId;
  @override
  @JsonKey(name: 'appointment_id')
  final String? appointmentId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'systolic_bp')
  final int? systolicBp;
  @override
  @JsonKey(name: 'diastolic_bp')
  final int? diastolicBp;
  @override
  @JsonKey(name: 'blood_pressure')
  final String? bloodPressure;
  @override
  final double? temperature;
  @override
  @JsonKey(name: 'pulse_rate')
  final int? pulseRate;
  @override
  @JsonKey(name: 'resp_bpm')
  final int? respBpm;
  @override
  @JsonKey(name: 'spo2_percent')
  final int? spo2Percent;
  @override
  @JsonKey(name: 'sugar_mgdl')
  final double? sugarMgdl;
  @override
  @JsonKey(name: 'height_cm')
  final int? heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  final double? weightKg;
  @override
  final double? bmi;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'recorded_by')
  final String? recordedBy;
  @override
  @JsonKey(name: 'recorded_at')
  final String? recordedAt;

  @override
  String toString() {
    return 'VitalsRecord(id: $id, clinicPatientId: $clinicPatientId, appointmentId: $appointmentId, clinicId: $clinicId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, bmi: $bmi, notes: $notes, recordedBy: $recordedBy, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VitalsRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.systolicBp, systolicBp) ||
                other.systolicBp == systolicBp) &&
            (identical(other.diastolicBp, diastolicBp) ||
                other.diastolicBp == diastolicBp) &&
            (identical(other.bloodPressure, bloodPressure) ||
                other.bloodPressure == bloodPressure) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.pulseRate, pulseRate) ||
                other.pulseRate == pulseRate) &&
            (identical(other.respBpm, respBpm) || other.respBpm == respBpm) &&
            (identical(other.spo2Percent, spo2Percent) ||
                other.spo2Percent == spo2Percent) &&
            (identical(other.sugarMgdl, sugarMgdl) ||
                other.sugarMgdl == sugarMgdl) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordedBy, recordedBy) ||
                other.recordedBy == recordedBy) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    clinicPatientId,
    appointmentId,
    clinicId,
    systolicBp,
    diastolicBp,
    bloodPressure,
    temperature,
    pulseRate,
    respBpm,
    spo2Percent,
    sugarMgdl,
    heightCm,
    weightKg,
    bmi,
    notes,
    recordedBy,
    recordedAt,
  );

  /// Create a copy of VitalsRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VitalsRecordImplCopyWith<_$VitalsRecordImpl> get copyWith =>
      __$$VitalsRecordImplCopyWithImpl<_$VitalsRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VitalsRecordImplToJson(this);
  }
}

abstract class _VitalsRecord implements VitalsRecord {
  const factory _VitalsRecord({
    final String? id,
    @JsonKey(name: 'clinic_patient_id') final String? clinicPatientId,
    @JsonKey(name: 'appointment_id') final String? appointmentId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'systolic_bp') final int? systolicBp,
    @JsonKey(name: 'diastolic_bp') final int? diastolicBp,
    @JsonKey(name: 'blood_pressure') final String? bloodPressure,
    final double? temperature,
    @JsonKey(name: 'pulse_rate') final int? pulseRate,
    @JsonKey(name: 'resp_bpm') final int? respBpm,
    @JsonKey(name: 'spo2_percent') final int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') final double? sugarMgdl,
    @JsonKey(name: 'height_cm') final int? heightCm,
    @JsonKey(name: 'weight_kg') final double? weightKg,
    final double? bmi,
    final String? notes,
    @JsonKey(name: 'recorded_by') final String? recordedBy,
    @JsonKey(name: 'recorded_at') final String? recordedAt,
  }) = _$VitalsRecordImpl;

  factory _VitalsRecord.fromJson(Map<String, dynamic> json) =
      _$VitalsRecordImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId;
  @override
  @JsonKey(name: 'appointment_id')
  String? get appointmentId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'systolic_bp')
  int? get systolicBp;
  @override
  @JsonKey(name: 'diastolic_bp')
  int? get diastolicBp;
  @override
  @JsonKey(name: 'blood_pressure')
  String? get bloodPressure;
  @override
  double? get temperature;
  @override
  @JsonKey(name: 'pulse_rate')
  int? get pulseRate;
  @override
  @JsonKey(name: 'resp_bpm')
  int? get respBpm;
  @override
  @JsonKey(name: 'spo2_percent')
  int? get spo2Percent;
  @override
  @JsonKey(name: 'sugar_mgdl')
  double? get sugarMgdl;
  @override
  @JsonKey(name: 'height_cm')
  int? get heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  double? get weightKg;
  @override
  double? get bmi;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'recorded_by')
  String? get recordedBy;
  @override
  @JsonKey(name: 'recorded_at')
  String? get recordedAt;

  /// Create a copy of VitalsRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VitalsRecordImplCopyWith<_$VitalsRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VitalsHistoryResponse _$VitalsHistoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _VitalsHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$VitalsHistoryResponse {
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<VitalsRecord> get vitals => throw _privateConstructorUsedError;

  /// Serializes this VitalsHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VitalsHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VitalsHistoryResponseCopyWith<VitalsHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VitalsHistoryResponseCopyWith<$Res> {
  factory $VitalsHistoryResponseCopyWith(
    VitalsHistoryResponse value,
    $Res Function(VitalsHistoryResponse) then,
  ) = _$VitalsHistoryResponseCopyWithImpl<$Res, VitalsHistoryResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    int total,
    List<VitalsRecord> vitals,
  });
}

/// @nodoc
class _$VitalsHistoryResponseCopyWithImpl<
  $Res,
  $Val extends VitalsHistoryResponse
>
    implements $VitalsHistoryResponseCopyWith<$Res> {
  _$VitalsHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VitalsHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicPatientId = null,
    Object? total = null,
    Object? vitals = null,
  }) {
    return _then(
      _value.copyWith(
            clinicPatientId: null == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            vitals: null == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as List<VitalsRecord>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VitalsHistoryResponseImplCopyWith<$Res>
    implements $VitalsHistoryResponseCopyWith<$Res> {
  factory _$$VitalsHistoryResponseImplCopyWith(
    _$VitalsHistoryResponseImpl value,
    $Res Function(_$VitalsHistoryResponseImpl) then,
  ) = __$$VitalsHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    int total,
    List<VitalsRecord> vitals,
  });
}

/// @nodoc
class __$$VitalsHistoryResponseImplCopyWithImpl<$Res>
    extends
        _$VitalsHistoryResponseCopyWithImpl<$Res, _$VitalsHistoryResponseImpl>
    implements _$$VitalsHistoryResponseImplCopyWith<$Res> {
  __$$VitalsHistoryResponseImplCopyWithImpl(
    _$VitalsHistoryResponseImpl _value,
    $Res Function(_$VitalsHistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VitalsHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicPatientId = null,
    Object? total = null,
    Object? vitals = null,
  }) {
    return _then(
      _$VitalsHistoryResponseImpl(
        clinicPatientId: null == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        vitals: null == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as List<VitalsRecord>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VitalsHistoryResponseImpl implements _VitalsHistoryResponse {
  const _$VitalsHistoryResponseImpl({
    @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId,
    required this.total,
    required final List<VitalsRecord> vitals,
  }) : _vitals = vitals;

  factory _$VitalsHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VitalsHistoryResponseImplFromJson(json);

  @override
  @JsonKey(name: 'clinic_patient_id')
  final String clinicPatientId;
  @override
  final int total;
  final List<VitalsRecord> _vitals;
  @override
  List<VitalsRecord> get vitals {
    if (_vitals is EqualUnmodifiableListView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vitals);
  }

  @override
  String toString() {
    return 'VitalsHistoryResponse(clinicPatientId: $clinicPatientId, total: $total, vitals: $vitals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VitalsHistoryResponseImpl &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._vitals, _vitals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinicPatientId,
    total,
    const DeepCollectionEquality().hash(_vitals),
  );

  /// Create a copy of VitalsHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VitalsHistoryResponseImplCopyWith<_$VitalsHistoryResponseImpl>
  get copyWith =>
      __$$VitalsHistoryResponseImplCopyWithImpl<_$VitalsHistoryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VitalsHistoryResponseImplToJson(this);
  }
}

abstract class _VitalsHistoryResponse implements VitalsHistoryResponse {
  const factory _VitalsHistoryResponse({
    @JsonKey(name: 'clinic_patient_id') required final String clinicPatientId,
    required final int total,
    required final List<VitalsRecord> vitals,
  }) = _$VitalsHistoryResponseImpl;

  factory _VitalsHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$VitalsHistoryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId;
  @override
  int get total;
  @override
  List<VitalsRecord> get vitals;

  /// Create a copy of VitalsHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VitalsHistoryResponseImplCopyWith<_$VitalsHistoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateVitalsRequest _$CreateVitalsRequestFromJson(Map<String, dynamic> json) {
  return _CreateVitalsRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateVitalsRequest {
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_id')
  String? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'systolic_bp')
  int? get systolicBp => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic_bp')
  int? get diastolicBp => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure')
  String? get bloodPressure => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'pulse_rate')
  int? get pulseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'resp_bpm')
  int? get respBpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'spo2_percent')
  int? get spo2Percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'sugar_mgdl')
  double? get sugarMgdl => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_cm')
  int? get heightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_kg')
  double? get weightKg => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String get recordedBy => throw _privateConstructorUsedError;

  /// Serializes this CreateVitalsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateVitalsRequestCopyWith<CreateVitalsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVitalsRequestCopyWith<$Res> {
  factory $CreateVitalsRequestCopyWith(
    CreateVitalsRequest value,
    $Res Function(CreateVitalsRequest) then,
  ) = _$CreateVitalsRequestCopyWithImpl<$Res, CreateVitalsRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'systolic_bp') int? systolicBp,
    @JsonKey(name: 'diastolic_bp') int? diastolicBp,
    @JsonKey(name: 'blood_pressure') String? bloodPressure,
    double? temperature,
    @JsonKey(name: 'pulse_rate') int? pulseRate,
    @JsonKey(name: 'resp_bpm') int? respBpm,
    @JsonKey(name: 'spo2_percent') int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') double? sugarMgdl,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    String? notes,
    @JsonKey(name: 'recorded_by') String recordedBy,
  });
}

/// @nodoc
class _$CreateVitalsRequestCopyWithImpl<$Res, $Val extends CreateVitalsRequest>
    implements $CreateVitalsRequestCopyWith<$Res> {
  _$CreateVitalsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicPatientId = null,
    Object? clinicId = freezed,
    Object? appointmentId = freezed,
    Object? systolicBp = freezed,
    Object? diastolicBp = freezed,
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulseRate = freezed,
    Object? respBpm = freezed,
    Object? spo2Percent = freezed,
    Object? sugarMgdl = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? notes = freezed,
    Object? recordedBy = null,
  }) {
    return _then(
      _value.copyWith(
            clinicPatientId: null == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            systolicBp: freezed == systolicBp
                ? _value.systolicBp
                : systolicBp // ignore: cast_nullable_to_non_nullable
                      as int?,
            diastolicBp: freezed == diastolicBp
                ? _value.diastolicBp
                : diastolicBp // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodPressure: freezed == bloodPressure
                ? _value.bloodPressure
                : bloodPressure // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            pulseRate: freezed == pulseRate
                ? _value.pulseRate
                : pulseRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            respBpm: freezed == respBpm
                ? _value.respBpm
                : respBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            spo2Percent: freezed == spo2Percent
                ? _value.spo2Percent
                : spo2Percent // ignore: cast_nullable_to_non_nullable
                      as int?,
            sugarMgdl: freezed == sugarMgdl
                ? _value.sugarMgdl
                : sugarMgdl // ignore: cast_nullable_to_non_nullable
                      as double?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as int?,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedBy: null == recordedBy
                ? _value.recordedBy
                : recordedBy // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateVitalsRequestImplCopyWith<$Res>
    implements $CreateVitalsRequestCopyWith<$Res> {
  factory _$$CreateVitalsRequestImplCopyWith(
    _$CreateVitalsRequestImpl value,
    $Res Function(_$CreateVitalsRequestImpl) then,
  ) = __$$CreateVitalsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'systolic_bp') int? systolicBp,
    @JsonKey(name: 'diastolic_bp') int? diastolicBp,
    @JsonKey(name: 'blood_pressure') String? bloodPressure,
    double? temperature,
    @JsonKey(name: 'pulse_rate') int? pulseRate,
    @JsonKey(name: 'resp_bpm') int? respBpm,
    @JsonKey(name: 'spo2_percent') int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') double? sugarMgdl,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    String? notes,
    @JsonKey(name: 'recorded_by') String recordedBy,
  });
}

/// @nodoc
class __$$CreateVitalsRequestImplCopyWithImpl<$Res>
    extends _$CreateVitalsRequestCopyWithImpl<$Res, _$CreateVitalsRequestImpl>
    implements _$$CreateVitalsRequestImplCopyWith<$Res> {
  __$$CreateVitalsRequestImplCopyWithImpl(
    _$CreateVitalsRequestImpl _value,
    $Res Function(_$CreateVitalsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicPatientId = null,
    Object? clinicId = freezed,
    Object? appointmentId = freezed,
    Object? systolicBp = freezed,
    Object? diastolicBp = freezed,
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulseRate = freezed,
    Object? respBpm = freezed,
    Object? spo2Percent = freezed,
    Object? sugarMgdl = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? notes = freezed,
    Object? recordedBy = null,
  }) {
    return _then(
      _$CreateVitalsRequestImpl(
        clinicPatientId: null == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        systolicBp: freezed == systolicBp
            ? _value.systolicBp
            : systolicBp // ignore: cast_nullable_to_non_nullable
                  as int?,
        diastolicBp: freezed == diastolicBp
            ? _value.diastolicBp
            : diastolicBp // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodPressure: freezed == bloodPressure
            ? _value.bloodPressure
            : bloodPressure // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        pulseRate: freezed == pulseRate
            ? _value.pulseRate
            : pulseRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        respBpm: freezed == respBpm
            ? _value.respBpm
            : respBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        spo2Percent: freezed == spo2Percent
            ? _value.spo2Percent
            : spo2Percent // ignore: cast_nullable_to_non_nullable
                  as int?,
        sugarMgdl: freezed == sugarMgdl
            ? _value.sugarMgdl
            : sugarMgdl // ignore: cast_nullable_to_non_nullable
                  as double?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as int?,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedBy: null == recordedBy
            ? _value.recordedBy
            : recordedBy // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateVitalsRequestImpl implements _CreateVitalsRequest {
  const _$CreateVitalsRequestImpl({
    @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'appointment_id') this.appointmentId,
    @JsonKey(name: 'systolic_bp') this.systolicBp,
    @JsonKey(name: 'diastolic_bp') this.diastolicBp,
    @JsonKey(name: 'blood_pressure') this.bloodPressure,
    this.temperature,
    @JsonKey(name: 'pulse_rate') this.pulseRate,
    @JsonKey(name: 'resp_bpm') this.respBpm,
    @JsonKey(name: 'spo2_percent') this.spo2Percent,
    @JsonKey(name: 'sugar_mgdl') this.sugarMgdl,
    @JsonKey(name: 'height_cm') this.heightCm,
    @JsonKey(name: 'weight_kg') this.weightKg,
    this.notes,
    @JsonKey(name: 'recorded_by') required this.recordedBy,
  });

  factory _$CreateVitalsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateVitalsRequestImplFromJson(json);

  @override
  @JsonKey(name: 'clinic_patient_id')
  final String clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'appointment_id')
  final String? appointmentId;
  @override
  @JsonKey(name: 'systolic_bp')
  final int? systolicBp;
  @override
  @JsonKey(name: 'diastolic_bp')
  final int? diastolicBp;
  @override
  @JsonKey(name: 'blood_pressure')
  final String? bloodPressure;
  @override
  final double? temperature;
  @override
  @JsonKey(name: 'pulse_rate')
  final int? pulseRate;
  @override
  @JsonKey(name: 'resp_bpm')
  final int? respBpm;
  @override
  @JsonKey(name: 'spo2_percent')
  final int? spo2Percent;
  @override
  @JsonKey(name: 'sugar_mgdl')
  final double? sugarMgdl;
  @override
  @JsonKey(name: 'height_cm')
  final int? heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  final double? weightKg;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'recorded_by')
  final String recordedBy;

  @override
  String toString() {
    return 'CreateVitalsRequest(clinicPatientId: $clinicPatientId, clinicId: $clinicId, appointmentId: $appointmentId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, notes: $notes, recordedBy: $recordedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVitalsRequestImpl &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.systolicBp, systolicBp) ||
                other.systolicBp == systolicBp) &&
            (identical(other.diastolicBp, diastolicBp) ||
                other.diastolicBp == diastolicBp) &&
            (identical(other.bloodPressure, bloodPressure) ||
                other.bloodPressure == bloodPressure) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.pulseRate, pulseRate) ||
                other.pulseRate == pulseRate) &&
            (identical(other.respBpm, respBpm) || other.respBpm == respBpm) &&
            (identical(other.spo2Percent, spo2Percent) ||
                other.spo2Percent == spo2Percent) &&
            (identical(other.sugarMgdl, sugarMgdl) ||
                other.sugarMgdl == sugarMgdl) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordedBy, recordedBy) ||
                other.recordedBy == recordedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinicPatientId,
    clinicId,
    appointmentId,
    systolicBp,
    diastolicBp,
    bloodPressure,
    temperature,
    pulseRate,
    respBpm,
    spo2Percent,
    sugarMgdl,
    heightCm,
    weightKg,
    notes,
    recordedBy,
  );

  /// Create a copy of CreateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVitalsRequestImplCopyWith<_$CreateVitalsRequestImpl> get copyWith =>
      __$$CreateVitalsRequestImplCopyWithImpl<_$CreateVitalsRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVitalsRequestImplToJson(this);
  }
}

abstract class _CreateVitalsRequest implements CreateVitalsRequest {
  const factory _CreateVitalsRequest({
    @JsonKey(name: 'clinic_patient_id') required final String clinicPatientId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'appointment_id') final String? appointmentId,
    @JsonKey(name: 'systolic_bp') final int? systolicBp,
    @JsonKey(name: 'diastolic_bp') final int? diastolicBp,
    @JsonKey(name: 'blood_pressure') final String? bloodPressure,
    final double? temperature,
    @JsonKey(name: 'pulse_rate') final int? pulseRate,
    @JsonKey(name: 'resp_bpm') final int? respBpm,
    @JsonKey(name: 'spo2_percent') final int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') final double? sugarMgdl,
    @JsonKey(name: 'height_cm') final int? heightCm,
    @JsonKey(name: 'weight_kg') final double? weightKg,
    final String? notes,
    @JsonKey(name: 'recorded_by') required final String recordedBy,
  }) = _$CreateVitalsRequestImpl;

  factory _CreateVitalsRequest.fromJson(Map<String, dynamic> json) =
      _$CreateVitalsRequestImpl.fromJson;

  @override
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'appointment_id')
  String? get appointmentId;
  @override
  @JsonKey(name: 'systolic_bp')
  int? get systolicBp;
  @override
  @JsonKey(name: 'diastolic_bp')
  int? get diastolicBp;
  @override
  @JsonKey(name: 'blood_pressure')
  String? get bloodPressure;
  @override
  double? get temperature;
  @override
  @JsonKey(name: 'pulse_rate')
  int? get pulseRate;
  @override
  @JsonKey(name: 'resp_bpm')
  int? get respBpm;
  @override
  @JsonKey(name: 'spo2_percent')
  int? get spo2Percent;
  @override
  @JsonKey(name: 'sugar_mgdl')
  double? get sugarMgdl;
  @override
  @JsonKey(name: 'height_cm')
  int? get heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  double? get weightKg;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'recorded_by')
  String get recordedBy;

  /// Create a copy of CreateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVitalsRequestImplCopyWith<_$CreateVitalsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateVitalsRequest _$UpdateVitalsRequestFromJson(Map<String, dynamic> json) {
  return _UpdateVitalsRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateVitalsRequest {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_id')
  String? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'systolic_bp')
  int? get systolicBp => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic_bp')
  int? get diastolicBp => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure')
  String? get bloodPressure => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'pulse_rate')
  int? get pulseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'resp_bpm')
  int? get respBpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'spo2_percent')
  int? get spo2Percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'sugar_mgdl')
  double? get sugarMgdl => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_cm')
  int? get heightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_kg')
  double? get weightKg => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String get recordedBy => throw _privateConstructorUsedError;

  /// Serializes this UpdateVitalsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateVitalsRequestCopyWith<UpdateVitalsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateVitalsRequestCopyWith<$Res> {
  factory $UpdateVitalsRequestCopyWith(
    UpdateVitalsRequest value,
    $Res Function(UpdateVitalsRequest) then,
  ) = _$UpdateVitalsRequestCopyWithImpl<$Res, UpdateVitalsRequest>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'systolic_bp') int? systolicBp,
    @JsonKey(name: 'diastolic_bp') int? diastolicBp,
    @JsonKey(name: 'blood_pressure') String? bloodPressure,
    double? temperature,
    @JsonKey(name: 'pulse_rate') int? pulseRate,
    @JsonKey(name: 'resp_bpm') int? respBpm,
    @JsonKey(name: 'spo2_percent') int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') double? sugarMgdl,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    String? notes,
    @JsonKey(name: 'recorded_by') String recordedBy,
  });
}

/// @nodoc
class _$UpdateVitalsRequestCopyWithImpl<$Res, $Val extends UpdateVitalsRequest>
    implements $UpdateVitalsRequestCopyWith<$Res> {
  _$UpdateVitalsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicPatientId = null,
    Object? clinicId = freezed,
    Object? appointmentId = freezed,
    Object? systolicBp = freezed,
    Object? diastolicBp = freezed,
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulseRate = freezed,
    Object? respBpm = freezed,
    Object? spo2Percent = freezed,
    Object? sugarMgdl = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? notes = freezed,
    Object? recordedBy = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicPatientId: null == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            systolicBp: freezed == systolicBp
                ? _value.systolicBp
                : systolicBp // ignore: cast_nullable_to_non_nullable
                      as int?,
            diastolicBp: freezed == diastolicBp
                ? _value.diastolicBp
                : diastolicBp // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodPressure: freezed == bloodPressure
                ? _value.bloodPressure
                : bloodPressure // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            pulseRate: freezed == pulseRate
                ? _value.pulseRate
                : pulseRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            respBpm: freezed == respBpm
                ? _value.respBpm
                : respBpm // ignore: cast_nullable_to_non_nullable
                      as int?,
            spo2Percent: freezed == spo2Percent
                ? _value.spo2Percent
                : spo2Percent // ignore: cast_nullable_to_non_nullable
                      as int?,
            sugarMgdl: freezed == sugarMgdl
                ? _value.sugarMgdl
                : sugarMgdl // ignore: cast_nullable_to_non_nullable
                      as double?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as int?,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedBy: null == recordedBy
                ? _value.recordedBy
                : recordedBy // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateVitalsRequestImplCopyWith<$Res>
    implements $UpdateVitalsRequestCopyWith<$Res> {
  factory _$$UpdateVitalsRequestImplCopyWith(
    _$UpdateVitalsRequestImpl value,
    $Res Function(_$UpdateVitalsRequestImpl) then,
  ) = __$$UpdateVitalsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'systolic_bp') int? systolicBp,
    @JsonKey(name: 'diastolic_bp') int? diastolicBp,
    @JsonKey(name: 'blood_pressure') String? bloodPressure,
    double? temperature,
    @JsonKey(name: 'pulse_rate') int? pulseRate,
    @JsonKey(name: 'resp_bpm') int? respBpm,
    @JsonKey(name: 'spo2_percent') int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') double? sugarMgdl,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    String? notes,
    @JsonKey(name: 'recorded_by') String recordedBy,
  });
}

/// @nodoc
class __$$UpdateVitalsRequestImplCopyWithImpl<$Res>
    extends _$UpdateVitalsRequestCopyWithImpl<$Res, _$UpdateVitalsRequestImpl>
    implements _$$UpdateVitalsRequestImplCopyWith<$Res> {
  __$$UpdateVitalsRequestImplCopyWithImpl(
    _$UpdateVitalsRequestImpl _value,
    $Res Function(_$UpdateVitalsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicPatientId = null,
    Object? clinicId = freezed,
    Object? appointmentId = freezed,
    Object? systolicBp = freezed,
    Object? diastolicBp = freezed,
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulseRate = freezed,
    Object? respBpm = freezed,
    Object? spo2Percent = freezed,
    Object? sugarMgdl = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? notes = freezed,
    Object? recordedBy = null,
  }) {
    return _then(
      _$UpdateVitalsRequestImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicPatientId: null == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        systolicBp: freezed == systolicBp
            ? _value.systolicBp
            : systolicBp // ignore: cast_nullable_to_non_nullable
                  as int?,
        diastolicBp: freezed == diastolicBp
            ? _value.diastolicBp
            : diastolicBp // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodPressure: freezed == bloodPressure
            ? _value.bloodPressure
            : bloodPressure // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        pulseRate: freezed == pulseRate
            ? _value.pulseRate
            : pulseRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        respBpm: freezed == respBpm
            ? _value.respBpm
            : respBpm // ignore: cast_nullable_to_non_nullable
                  as int?,
        spo2Percent: freezed == spo2Percent
            ? _value.spo2Percent
            : spo2Percent // ignore: cast_nullable_to_non_nullable
                  as int?,
        sugarMgdl: freezed == sugarMgdl
            ? _value.sugarMgdl
            : sugarMgdl // ignore: cast_nullable_to_non_nullable
                  as double?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as int?,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedBy: null == recordedBy
            ? _value.recordedBy
            : recordedBy // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateVitalsRequestImpl implements _UpdateVitalsRequest {
  const _$UpdateVitalsRequestImpl({
    required this.id,
    @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'appointment_id') this.appointmentId,
    @JsonKey(name: 'systolic_bp') this.systolicBp,
    @JsonKey(name: 'diastolic_bp') this.diastolicBp,
    @JsonKey(name: 'blood_pressure') this.bloodPressure,
    this.temperature,
    @JsonKey(name: 'pulse_rate') this.pulseRate,
    @JsonKey(name: 'resp_bpm') this.respBpm,
    @JsonKey(name: 'spo2_percent') this.spo2Percent,
    @JsonKey(name: 'sugar_mgdl') this.sugarMgdl,
    @JsonKey(name: 'height_cm') this.heightCm,
    @JsonKey(name: 'weight_kg') this.weightKg,
    this.notes,
    @JsonKey(name: 'recorded_by') required this.recordedBy,
  });

  factory _$UpdateVitalsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateVitalsRequestImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'appointment_id')
  final String? appointmentId;
  @override
  @JsonKey(name: 'systolic_bp')
  final int? systolicBp;
  @override
  @JsonKey(name: 'diastolic_bp')
  final int? diastolicBp;
  @override
  @JsonKey(name: 'blood_pressure')
  final String? bloodPressure;
  @override
  final double? temperature;
  @override
  @JsonKey(name: 'pulse_rate')
  final int? pulseRate;
  @override
  @JsonKey(name: 'resp_bpm')
  final int? respBpm;
  @override
  @JsonKey(name: 'spo2_percent')
  final int? spo2Percent;
  @override
  @JsonKey(name: 'sugar_mgdl')
  final double? sugarMgdl;
  @override
  @JsonKey(name: 'height_cm')
  final int? heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  final double? weightKg;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'recorded_by')
  final String recordedBy;

  @override
  String toString() {
    return 'UpdateVitalsRequest(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, appointmentId: $appointmentId, systolicBp: $systolicBp, diastolicBp: $diastolicBp, bloodPressure: $bloodPressure, temperature: $temperature, pulseRate: $pulseRate, respBpm: $respBpm, spo2Percent: $spo2Percent, sugarMgdl: $sugarMgdl, heightCm: $heightCm, weightKg: $weightKg, notes: $notes, recordedBy: $recordedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVitalsRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.systolicBp, systolicBp) ||
                other.systolicBp == systolicBp) &&
            (identical(other.diastolicBp, diastolicBp) ||
                other.diastolicBp == diastolicBp) &&
            (identical(other.bloodPressure, bloodPressure) ||
                other.bloodPressure == bloodPressure) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.pulseRate, pulseRate) ||
                other.pulseRate == pulseRate) &&
            (identical(other.respBpm, respBpm) || other.respBpm == respBpm) &&
            (identical(other.spo2Percent, spo2Percent) ||
                other.spo2Percent == spo2Percent) &&
            (identical(other.sugarMgdl, sugarMgdl) ||
                other.sugarMgdl == sugarMgdl) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordedBy, recordedBy) ||
                other.recordedBy == recordedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    clinicPatientId,
    clinicId,
    appointmentId,
    systolicBp,
    diastolicBp,
    bloodPressure,
    temperature,
    pulseRate,
    respBpm,
    spo2Percent,
    sugarMgdl,
    heightCm,
    weightKg,
    notes,
    recordedBy,
  );

  /// Create a copy of UpdateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVitalsRequestImplCopyWith<_$UpdateVitalsRequestImpl> get copyWith =>
      __$$UpdateVitalsRequestImplCopyWithImpl<_$UpdateVitalsRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateVitalsRequestImplToJson(this);
  }
}

abstract class _UpdateVitalsRequest implements UpdateVitalsRequest {
  const factory _UpdateVitalsRequest({
    required final String id,
    @JsonKey(name: 'clinic_patient_id') required final String clinicPatientId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'appointment_id') final String? appointmentId,
    @JsonKey(name: 'systolic_bp') final int? systolicBp,
    @JsonKey(name: 'diastolic_bp') final int? diastolicBp,
    @JsonKey(name: 'blood_pressure') final String? bloodPressure,
    final double? temperature,
    @JsonKey(name: 'pulse_rate') final int? pulseRate,
    @JsonKey(name: 'resp_bpm') final int? respBpm,
    @JsonKey(name: 'spo2_percent') final int? spo2Percent,
    @JsonKey(name: 'sugar_mgdl') final double? sugarMgdl,
    @JsonKey(name: 'height_cm') final int? heightCm,
    @JsonKey(name: 'weight_kg') final double? weightKg,
    final String? notes,
    @JsonKey(name: 'recorded_by') required final String recordedBy,
  }) = _$UpdateVitalsRequestImpl;

  factory _UpdateVitalsRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateVitalsRequestImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'appointment_id')
  String? get appointmentId;
  @override
  @JsonKey(name: 'systolic_bp')
  int? get systolicBp;
  @override
  @JsonKey(name: 'diastolic_bp')
  int? get diastolicBp;
  @override
  @JsonKey(name: 'blood_pressure')
  String? get bloodPressure;
  @override
  double? get temperature;
  @override
  @JsonKey(name: 'pulse_rate')
  int? get pulseRate;
  @override
  @JsonKey(name: 'resp_bpm')
  int? get respBpm;
  @override
  @JsonKey(name: 'spo2_percent')
  int? get spo2Percent;
  @override
  @JsonKey(name: 'sugar_mgdl')
  double? get sugarMgdl;
  @override
  @JsonKey(name: 'height_cm')
  int? get heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  double? get weightKg;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'recorded_by')
  String get recordedBy;

  /// Create a copy of UpdateVitalsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateVitalsRequestImplCopyWith<_$UpdateVitalsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
