// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/vitals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VitalsRecordImpl _$$VitalsRecordImplFromJson(Map<String, dynamic> json) =>
    _$VitalsRecordImpl(
      id: json['id'] as String?,
      clinicPatientId: json['clinic_patient_id'] as String?,
      appointmentId: json['appointment_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      systolicBp: (json['systolic_bp'] as num?)?.toInt(),
      diastolicBp: (json['diastolic_bp'] as num?)?.toInt(),
      bloodPressure: json['blood_pressure'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      pulseRate: (json['pulse_rate'] as num?)?.toInt(),
      respBpm: (json['resp_bpm'] as num?)?.toInt(),
      spo2Percent: (json['spo2_percent'] as num?)?.toInt(),
      sugarMgdl: (json['sugar_mgdl'] as num?)?.toDouble(),
      heightCm: (json['height_cm'] as num?)?.toInt(),
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      bmi: (json['bmi'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      recordedBy: json['recorded_by'] as String?,
      recordedAt: json['recorded_at'] as String?,
    );

Map<String, dynamic> _$$VitalsRecordImplToJson(
  _$VitalsRecordImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.clinicPatientId case final value?) 'clinic_patient_id': value,
  if (instance.appointmentId case final value?) 'appointment_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.systolicBp case final value?) 'systolic_bp': value,
  if (instance.diastolicBp case final value?) 'diastolic_bp': value,
  if (instance.bloodPressure case final value?) 'blood_pressure': value,
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.pulseRate case final value?) 'pulse_rate': value,
  if (instance.respBpm case final value?) 'resp_bpm': value,
  if (instance.spo2Percent case final value?) 'spo2_percent': value,
  if (instance.sugarMgdl case final value?) 'sugar_mgdl': value,
  if (instance.heightCm case final value?) 'height_cm': value,
  if (instance.weightKg case final value?) 'weight_kg': value,
  if (instance.bmi case final value?) 'bmi': value,
  if (instance.notes case final value?) 'notes': value,
  if (instance.recordedBy case final value?) 'recorded_by': value,
  if (instance.recordedAt case final value?) 'recorded_at': value,
};

_$VitalsHistoryResponseImpl _$$VitalsHistoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$VitalsHistoryResponseImpl(
  clinicPatientId: json['clinic_patient_id'] as String,
  total: (json['total'] as num).toInt(),
  vitals: (json['vitals'] as List<dynamic>)
      .map((e) => VitalsRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$VitalsHistoryResponseImplToJson(
  _$VitalsHistoryResponseImpl instance,
) => <String, dynamic>{
  'clinic_patient_id': instance.clinicPatientId,
  'total': instance.total,
  'vitals': instance.vitals.map((e) => e.toJson()).toList(),
};

_$CreateVitalsRequestImpl _$$CreateVitalsRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateVitalsRequestImpl(
  clinicPatientId: json['clinic_patient_id'] as String,
  clinicId: json['clinic_id'] as String?,
  appointmentId: json['appointment_id'] as String?,
  systolicBp: (json['systolic_bp'] as num?)?.toInt(),
  diastolicBp: (json['diastolic_bp'] as num?)?.toInt(),
  bloodPressure: json['blood_pressure'] as String?,
  temperature: (json['temperature'] as num?)?.toDouble(),
  pulseRate: (json['pulse_rate'] as num?)?.toInt(),
  respBpm: (json['resp_bpm'] as num?)?.toInt(),
  spo2Percent: (json['spo2_percent'] as num?)?.toInt(),
  sugarMgdl: (json['sugar_mgdl'] as num?)?.toDouble(),
  heightCm: (json['height_cm'] as num?)?.toInt(),
  weightKg: (json['weight_kg'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  recordedBy: json['recorded_by'] as String,
);

Map<String, dynamic> _$$CreateVitalsRequestImplToJson(
  _$CreateVitalsRequestImpl instance,
) => <String, dynamic>{
  'clinic_patient_id': instance.clinicPatientId,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.appointmentId case final value?) 'appointment_id': value,
  if (instance.systolicBp case final value?) 'systolic_bp': value,
  if (instance.diastolicBp case final value?) 'diastolic_bp': value,
  if (instance.bloodPressure case final value?) 'blood_pressure': value,
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.pulseRate case final value?) 'pulse_rate': value,
  if (instance.respBpm case final value?) 'resp_bpm': value,
  if (instance.spo2Percent case final value?) 'spo2_percent': value,
  if (instance.sugarMgdl case final value?) 'sugar_mgdl': value,
  if (instance.heightCm case final value?) 'height_cm': value,
  if (instance.weightKg case final value?) 'weight_kg': value,
  if (instance.notes case final value?) 'notes': value,
  'recorded_by': instance.recordedBy,
};

_$UpdateVitalsRequestImpl _$$UpdateVitalsRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateVitalsRequestImpl(
  id: json['id'] as String,
  clinicPatientId: json['clinic_patient_id'] as String,
  clinicId: json['clinic_id'] as String?,
  appointmentId: json['appointment_id'] as String?,
  systolicBp: (json['systolic_bp'] as num?)?.toInt(),
  diastolicBp: (json['diastolic_bp'] as num?)?.toInt(),
  bloodPressure: json['blood_pressure'] as String?,
  temperature: (json['temperature'] as num?)?.toDouble(),
  pulseRate: (json['pulse_rate'] as num?)?.toInt(),
  respBpm: (json['resp_bpm'] as num?)?.toInt(),
  spo2Percent: (json['spo2_percent'] as num?)?.toInt(),
  sugarMgdl: (json['sugar_mgdl'] as num?)?.toDouble(),
  heightCm: (json['height_cm'] as num?)?.toInt(),
  weightKg: (json['weight_kg'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  recordedBy: json['recorded_by'] as String,
);

Map<String, dynamic> _$$UpdateVitalsRequestImplToJson(
  _$UpdateVitalsRequestImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_patient_id': instance.clinicPatientId,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.appointmentId case final value?) 'appointment_id': value,
  if (instance.systolicBp case final value?) 'systolic_bp': value,
  if (instance.diastolicBp case final value?) 'diastolic_bp': value,
  if (instance.bloodPressure case final value?) 'blood_pressure': value,
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.pulseRate case final value?) 'pulse_rate': value,
  if (instance.respBpm case final value?) 'resp_bpm': value,
  if (instance.spo2Percent case final value?) 'spo2_percent': value,
  if (instance.sugarMgdl case final value?) 'sugar_mgdl': value,
  if (instance.heightCm case final value?) 'height_cm': value,
  if (instance.weightKg case final value?) 'weight_kg': value,
  if (instance.notes case final value?) 'notes': value,
  'recorded_by': instance.recordedBy,
};
