import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/clinic_doctor_links_model.freezed.dart';
part '../gen/clinic_doctor_links_model.g.dart';

@freezed
abstract class ClinicDoctorLinksResponse with _$ClinicDoctorLinksResponse {
  const factory ClinicDoctorLinksResponse({
    required DoctorInfo doctor,
    required List<ClinicLink> clinics,
    @JsonKey(name: 'total_clinics') required int totalClinics,
  }) = _ClinicDoctorLinksResponse;

  const ClinicDoctorLinksResponse._();

  ClinicLink? getLinkForClinic(String clinicId) {
    try {
      return clinics.firstWhere((link) => link.clinic.clinicId == clinicId);
    } catch (_) {
      return null;
    }
  }

  factory ClinicDoctorLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$ClinicDoctorLinksResponseFromJson(json);
}

@freezed
abstract class DoctorInfo with _$DoctorInfo {
  const factory DoctorInfo({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_code') String? doctorCode,
    String? specialization,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? qualification,
    @JsonKey(name: 'experience_years') int? experienceYears,
    String? experience,
    String? bio,
  }) = _DoctorInfo;

  factory DoctorInfo.fromJson(Map<String, dynamic> json) =>
      _$DoctorInfoFromJson(json);
}

@freezed
abstract class ClinicLink with _$ClinicLink {
  const factory ClinicLink({
    @JsonKey(name: 'link_id') required String linkId,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required ClinicInfo clinic,
    required ClinicFees fees,
    String? notes,
  }) = _ClinicLink;

  factory ClinicLink.fromJson(Map<String, dynamic> json) =>
      _$ClinicLinkFromJson(json);
}

@freezed
abstract class ClinicInfo with _$ClinicInfo {
  const factory ClinicInfo({
    @JsonKey(name: 'clinic_id') required String clinicId,
    required String name,
    @JsonKey(name: 'clinic_code') required String clinicCode,
    String? phone,
    String? address,
    String? email,
  }) = _ClinicInfo;

  factory ClinicInfo.fromJson(Map<String, dynamic> json) =>
      _$ClinicInfoFromJson(json);
}

@freezed
abstract class ClinicFees with _$ClinicFees {
  const factory ClinicFees({
    @JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') double? followUpFee,
    @JsonKey(name: 'follow_up_days') int? followUpDays,
  }) = _ClinicFees;

  factory ClinicFees.fromJson(Map<String, dynamic> json) =>
      _$ClinicFeesFromJson(json);
}
