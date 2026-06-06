// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/vitals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VitalsRecord _$VitalsRecordFromJson(Map<String, dynamic> json) =>
    _VitalsRecord(
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
      smokingStatus: json['smoking_status'] as String?,
      alcoholUse: json['alcohol_use'] as String?,
      notes: json['notes'] as String?,
      recordedBy: json['recorded_by'] as String?,
      recordedAt: json['recorded_at'] as String?,
    );

Map<String, dynamic> _$VitalsRecordToJson(_VitalsRecord instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'clinic_patient_id': ?instance.clinicPatientId,
      'appointment_id': ?instance.appointmentId,
      'clinic_id': ?instance.clinicId,
      'systolic_bp': ?instance.systolicBp,
      'diastolic_bp': ?instance.diastolicBp,
      'blood_pressure': ?instance.bloodPressure,
      'temperature': ?instance.temperature,
      'pulse_rate': ?instance.pulseRate,
      'resp_bpm': ?instance.respBpm,
      'spo2_percent': ?instance.spo2Percent,
      'sugar_mgdl': ?instance.sugarMgdl,
      'height_cm': ?instance.heightCm,
      'weight_kg': ?instance.weightKg,
      'bmi': ?instance.bmi,
      'smoking_status': ?instance.smokingStatus,
      'alcohol_use': ?instance.alcoholUse,
      'notes': ?instance.notes,
      'recorded_by': ?instance.recordedBy,
      'recorded_at': ?instance.recordedAt,
    };

_VitalsHistoryResponse _$VitalsHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _VitalsHistoryResponse(
  clinicPatientId: json['clinic_patient_id'] as String,
  total: (json['total'] as num).toInt(),
  vitals: (json['vitals'] as List<dynamic>)
      .map((e) => VitalsRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VitalsHistoryResponseToJson(
  _VitalsHistoryResponse instance,
) => <String, dynamic>{
  'clinic_patient_id': instance.clinicPatientId,
  'total': instance.total,
  'vitals': instance.vitals.map((e) => e.toJson()).toList(),
};

_CreateVitalsRequest _$CreateVitalsRequestFromJson(Map<String, dynamic> json) =>
    _CreateVitalsRequest(
      appointmentId: json['appointment_id'] as String,
      recordedBy: json['recorded_by'] as String,
      clinicPatientId: json['clinic_patient_id'] as String?,
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
      smokingStatus: json['smoking_status'] as String?,
      alcoholUse: json['alcohol_use'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CreateVitalsRequestToJson(
  _CreateVitalsRequest instance,
) => <String, dynamic>{
  'appointment_id': instance.appointmentId,
  'recorded_by': instance.recordedBy,
  'clinic_patient_id': ?instance.clinicPatientId,
  'clinic_id': ?instance.clinicId,
  'systolic_bp': ?instance.systolicBp,
  'diastolic_bp': ?instance.diastolicBp,
  'blood_pressure': ?instance.bloodPressure,
  'temperature': ?instance.temperature,
  'pulse_rate': ?instance.pulseRate,
  'resp_bpm': ?instance.respBpm,
  'spo2_percent': ?instance.spo2Percent,
  'sugar_mgdl': ?instance.sugarMgdl,
  'height_cm': ?instance.heightCm,
  'weight_kg': ?instance.weightKg,
  'bmi': ?instance.bmi,
  'smoking_status': ?instance.smokingStatus,
  'alcohol_use': ?instance.alcoholUse,
  'notes': ?instance.notes,
};

_UpdateVitalsRequest _$UpdateVitalsRequestFromJson(Map<String, dynamic> json) =>
    _UpdateVitalsRequest(
      id: json['id'] as String,
      appointmentId: json['appointment_id'] as String?,
      recordedBy: json['recorded_by'] as String?,
      clinicPatientId: json['clinic_patient_id'] as String?,
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
      smokingStatus: json['smoking_status'] as String?,
      alcoholUse: json['alcohol_use'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$UpdateVitalsRequestToJson(
  _UpdateVitalsRequest instance,
) => <String, dynamic>{
  'appointment_id': ?instance.appointmentId,
  'recorded_by': ?instance.recordedBy,
  'clinic_patient_id': ?instance.clinicPatientId,
  'clinic_id': ?instance.clinicId,
  'systolic_bp': ?instance.systolicBp,
  'diastolic_bp': ?instance.diastolicBp,
  'blood_pressure': ?instance.bloodPressure,
  'temperature': ?instance.temperature,
  'pulse_rate': ?instance.pulseRate,
  'resp_bpm': ?instance.respBpm,
  'spo2_percent': ?instance.spo2Percent,
  'sugar_mgdl': ?instance.sugarMgdl,
  'height_cm': ?instance.heightCm,
  'weight_kg': ?instance.weightKg,
  'bmi': ?instance.bmi,
  'smoking_status': ?instance.smokingStatus,
  'alcohol_use': ?instance.alcoholUse,
  'notes': ?instance.notes,
};
