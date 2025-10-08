import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/organization_model.freezed.dart';
part '../gen/organization_model.g.dart';

@freezed
class OrganizationModel with _$OrganizationModel {
  const factory OrganizationModel({
    String? id,
    required String name,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'license_number') String? licenseNumber,
    bool? isActive,
    String? createdAt,
    // Admin details (for creating new organizations)
    @JsonKey(name: 'admin_first_name') String? adminFirstName,
    @JsonKey(name: 'admin_last_name') String? adminLastName,
    @JsonKey(name: 'admin_email') String? adminEmail,
    @JsonKey(name: 'admin_username') String? adminUsername,
    @JsonKey(name: 'admin_phone') String? adminPhone,
    @JsonKey(name: 'admin_password') String? adminPassword,
  }) = _OrganizationModel;

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationModelFromJson(json);
}
