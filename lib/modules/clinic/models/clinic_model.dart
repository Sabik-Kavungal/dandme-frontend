import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/clinic_model.freezed.dart';
part '../gen/clinic_model.g.dart';

@freezed
abstract class ClinicModel with _$ClinicModel {
  const factory ClinicModel({
    String? id,
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'clinic_code') String? clinicCode,
    required String name,
    @JsonKey(name: 'clinic_type') String? clinicType,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    // Admin details - these are optional for display, required for creation
    @JsonKey(name: 'admin_first_name') String? adminFirstName,
    @JsonKey(name: 'admin_last_name') String? adminLastName,
    @JsonKey(name: 'admin_email') String? adminEmail,
    @JsonKey(name: 'admin_username') String? adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String? adminPassword,
    String? logo,
  }) = _ClinicModel;

  factory ClinicModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicModelFromJson(json);
}

// Separate model for creating clinics with required admin fields
@freezed
abstract class CreateClinicModel with _$CreateClinicModel {
  const factory CreateClinicModel({
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'clinic_code') String? clinicCode,
    required String name,
    @JsonKey(name: 'clinic_type') String? clinicType,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    // Admin details - required for creation
    @JsonKey(name: 'admin_first_name') required String adminFirstName,
    @JsonKey(name: 'admin_last_name') required String adminLastName,
    @JsonKey(name: 'admin_email') required String adminEmail,
    @JsonKey(name: 'admin_username') required String adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') required String adminPassword,
  }) = _CreateClinicModel;

  factory CreateClinicModel.fromJson(Map<String, dynamic> json) =>
      _$CreateClinicModelFromJson(json);
}
