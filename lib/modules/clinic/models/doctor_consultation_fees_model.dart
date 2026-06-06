import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/doctor_consultation_fees_model.freezed.dart';
part '../gen/doctor_consultation_fees_model.g.dart';

/// Response model for consultation fees
@freezed
abstract class DoctorConsultationFees with _$DoctorConsultationFees {
  const factory DoctorConsultationFees({
    @JsonKey(name: 'clinic_doctor_id') required String clinicDoctorId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'doctor_code') String? doctorCode,
    String? specialization,
    @JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') double? followUpFee,
    @JsonKey(name: 'follow_up_days') int? followUpDays,
    String? notes,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DoctorConsultationFees;

  factory DoctorConsultationFees.fromJson(Map<String, dynamic> json) =>
      _$DoctorConsultationFeesFromJson(json);
}

/// Request model for adding consultation fees
@freezed
abstract class AddConsultationFeesRequest with _$AddConsultationFeesRequest {
  const factory AddConsultationFeesRequest({
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'clinic_doctor_id') required String clinicDoctorId,
    @JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') double? followUpFee,
    @JsonKey(name: 'follow_up_days') int? followUpDays,
    String? notes,
  }) = _AddConsultationFeesRequest;

  factory AddConsultationFeesRequest.fromJson(Map<String, dynamic> json) =>
      _$AddConsultationFeesRequestFromJson(json);
}

/// Request model for updating consultation fees
@freezed
abstract class UpdateConsultationFeesRequest with _$UpdateConsultationFeesRequest {
  const factory UpdateConsultationFeesRequest({
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'clinic_doctor_id') required String clinicDoctorId,
    @JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') double? followUpFee,
    @JsonKey(name: 'follow_up_days') int? followUpDays,
    String? notes,
  }) = _UpdateConsultationFeesRequest;

  factory UpdateConsultationFeesRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateConsultationFeesRequestFromJson(json);
}

/// Response wrapper for add/update operations
@freezed
abstract class ConsultationFeesResponse with _$ConsultationFeesResponse {
  const factory ConsultationFeesResponse({
    required String message,
    DoctorConsultationFees? data,
  }) = _ConsultationFeesResponse;

  factory ConsultationFeesResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFeesResponseFromJson(json);
}
