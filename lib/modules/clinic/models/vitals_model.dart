import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/vitals_model.freezed.dart';
part '../gen/vitals_model.g.dart';

/// Vitals record model matching the API structure
@freezed
class VitalsRecord with _$VitalsRecord {
  const factory VitalsRecord({
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
  }) = _VitalsRecord;

  factory VitalsRecord.fromJson(Map<String, dynamic> json) =>
      _$VitalsRecordFromJson(json);
}

/// Vitals history response model
@freezed
class VitalsHistoryResponse with _$VitalsHistoryResponse {
  const factory VitalsHistoryResponse({
    @JsonKey(name: 'clinic_patient_id') required String clinicPatientId,
    required int total,
    required List<VitalsRecord> vitals,
  }) = _VitalsHistoryResponse;

  factory VitalsHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$VitalsHistoryResponseFromJson(json);
}

/// Create vitals request model
@freezed
class CreateVitalsRequest with _$CreateVitalsRequest {
  const factory CreateVitalsRequest({
    @JsonKey(name: 'clinic_patient_id') required String clinicPatientId,
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
    @JsonKey(name: 'recorded_by') required String recordedBy,
  }) = _CreateVitalsRequest;

  factory CreateVitalsRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVitalsRequestFromJson(json);
}

/// Update vitals request model
@freezed
class UpdateVitalsRequest with _$UpdateVitalsRequest {
  const factory UpdateVitalsRequest({
    required String id,
    @JsonKey(name: 'clinic_patient_id') required String clinicPatientId,
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
    @JsonKey(name: 'recorded_by') required String recordedBy,
  }) = _UpdateVitalsRequest;

  factory UpdateVitalsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateVitalsRequestFromJson(json);
}
