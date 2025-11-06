import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/clinic_doctors_model.freezed.dart';
part '../gen/clinic_doctors_model.g.dart';

// Clinic-specific fees model
@freezed
class ClinicSpecificFees with _$ClinicSpecificFees {
  const factory ClinicSpecificFees({
    @JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
    String? notes,
  }) = _ClinicSpecificFees;

  factory ClinicSpecificFees.fromJson(Map<String, dynamic> json) =>
      _$ClinicSpecificFeesFromJson(json);
}

// Default fees model
@freezed
class DefaultFees with _$DefaultFees {
  const factory DefaultFees({
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  }) = _DefaultFees;

  factory DefaultFees.fromJson(Map<String, dynamic> json) =>
      _$DefaultFeesFromJson(json);
}

// Clinic Doctor model
@freezed
class ClinicDoctorModel with _$ClinicDoctorModel {
  const factory ClinicDoctorModel({
    String? id, // Add direct id field
    @JsonKey(name: "link_id") String? linkId,
    @JsonKey(name: "doctor_id") String? doctorId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "doctor_code") String? doctorCode,
    String? specialization,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "full_name") String? fullName,
    String? email,
    String? username,
    String? phone,
    @JsonKey(name: "is_active") @Default(true) bool isActive,
    @JsonKey(name: "clinic_specific_fees")
    ClinicSpecificFees? clinicSpecificFees,
    @JsonKey(name: "default_fees") DefaultFees? defaultFees,
  }) = _ClinicDoctorModel;

  factory ClinicDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicDoctorModelFromJson(json);
}

// Clinic Doctors Response
@freezed
class ClinicDoctorsResponse with _$ClinicDoctorsResponse {
  const factory ClinicDoctorsResponse({
    @JsonKey(name: "clinic_id") String? clinicId, // Changed to nullable
    required List<ClinicDoctorModel> doctors,
    @JsonKey(name: "total_doctors")
    int? totalDoctors, // Changed to nullable with default
  }) = _ClinicDoctorsResponse;

  factory ClinicDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ClinicDoctorsResponseFromJson(json);
}
