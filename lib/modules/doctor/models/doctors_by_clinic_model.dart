import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/doctors_by_clinic_model.freezed.dart';
part '../gen/doctors_by_clinic_model.g.dart';

// Clinic Info Model
@freezed
abstract class ClinicInfoModel with _$ClinicInfoModel {
  const factory ClinicInfoModel({
    required String id,
    @JsonKey(name: "clinic_code") required String clinicCode,
    required String name,
    required String address,
  }) = _ClinicInfoModel;

  factory ClinicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicInfoModelFromJson(json);
}

// Doctor in Clinic Model
@freezed
abstract class DoctorInClinicModel with _$DoctorInClinicModel {
  const factory DoctorInClinicModel({
    required String id,
    @JsonKey(name: "user_id") required String userId,
    @JsonKey(name: "doctor_code") required String doctorCode,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String email,
    required String phone,
    required String specialization,
    @JsonKey(name: "license_number") required String licenseNumber,
    @JsonKey(name: "is_active") @Default(true) bool isActive,
    @JsonKey(name: "is_main_doctor") @Default(false) bool isMainDoctor,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _DoctorInClinicModel;

  factory DoctorInClinicModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorInClinicModelFromJson(json);
}

// Doctors by Clinic Response Model
@freezed
abstract class DoctorsByClinicResponse with _$DoctorsByClinicResponse {
  const factory DoctorsByClinicResponse({
    required ClinicInfoModel clinic,
    required List<DoctorInClinicModel> doctors,
    @JsonKey(name: "total_count") required int totalCount,
  }) = _DoctorsByClinicResponse;

  factory DoctorsByClinicResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorsByClinicResponseFromJson(json);
}
