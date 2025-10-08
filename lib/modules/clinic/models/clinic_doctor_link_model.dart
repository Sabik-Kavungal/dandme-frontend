import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/clinic_doctor_link_model.freezed.dart';
part '../gen/clinic_doctor_link_model.g.dart';

// Models for creating clinic-doctor links
@freezed
class ClinicInfo with _$ClinicInfo {
  const factory ClinicInfo({
    @JsonKey(name: "clinic_code") required String clinicCode,
    required String name,
  }) = _ClinicInfo;

  factory ClinicInfo.fromJson(Map<String, dynamic> json) =>
      _$ClinicInfoFromJson(json);
}

@freezed
class DoctorInfo with _$DoctorInfo {
  const factory DoctorInfo({
    @JsonKey(name: "doctor_code") required String doctorCode,
    required String email,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String specialization,
    required String username,
  }) = _DoctorInfo;

  factory DoctorInfo.fromJson(Map<String, dynamic> json) =>
      _$DoctorInfoFromJson(json);
}

@freezed
class ClinicDoctorLinkModel with _$ClinicDoctorLinkModel {
  const factory ClinicDoctorLinkModel({
    required ClinicInfo clinic,
    required DoctorInfo doctor,
  }) = _ClinicDoctorLinkModel;

  factory ClinicDoctorLinkModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicDoctorLinkModelFromJson(json);
}

@freezed
class CreateClinicDoctorLinkModel with _$CreateClinicDoctorLinkModel {
  const factory CreateClinicDoctorLinkModel({
    required List<ClinicDoctorLinkModel> links,
  }) = _CreateClinicDoctorLinkModel;

  factory CreateClinicDoctorLinkModel.fromJson(Map<String, dynamic> json) =>
      _$CreateClinicDoctorLinkModelFromJson(json);
}

// Models for listing clinic-doctor links
@freezed
class ClinicDoctorLinkResponse with _$ClinicDoctorLinkResponse {
  const factory ClinicDoctorLinkResponse({
    @JsonKey(name: "link_id") String? linkId,
    required ClinicInfo clinic,
    required DoctorFullInfo doctor,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _ClinicDoctorLinkResponse;

  factory ClinicDoctorLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$ClinicDoctorLinkResponseFromJson(json);
}

@freezed
class DoctorFullInfo with _$DoctorFullInfo {
  const factory DoctorFullInfo({
    @JsonKey(name: "doctor_id") String? doctorId,
    @JsonKey(name: "doctor_code") required String doctorCode,
    required String email,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String specialization,
    required String username,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  }) = _DoctorFullInfo;

  factory DoctorFullInfo.fromJson(Map<String, dynamic> json) =>
      _$DoctorFullInfoFromJson(json);
}
