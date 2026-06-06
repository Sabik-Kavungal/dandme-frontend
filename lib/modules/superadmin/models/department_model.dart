import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/department_model.freezed.dart';
part '../gen/department_model.g.dart';

// Department Response Model
@freezed
abstract class DepartmentModel with _$DepartmentModel {
  const factory DepartmentModel({
    required String id,
    @JsonKey(name: "clinic_id") required String clinicId,
    @JsonKey(name: "clinic_name") String? clinicName,
    required String name,
    String? description,
    @JsonKey(name: "is_active") @Default(true) bool isActive,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);
}

// Create Department Input Model
@freezed
abstract class CreateDepartmentInput with _$CreateDepartmentInput {
  const factory CreateDepartmentInput({
    @JsonKey(name: "clinic_id") required String clinicId,
    required String name,
    String? description,
  }) = _CreateDepartmentInput;

  factory CreateDepartmentInput.fromJson(Map<String, dynamic> json) =>
      _$CreateDepartmentInputFromJson(json);
}

// Update Department Input Model
@freezed
abstract class UpdateDepartmentInput with _$UpdateDepartmentInput {
  const factory UpdateDepartmentInput({
    String? name,
    String? description,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _UpdateDepartmentInput;

  factory UpdateDepartmentInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDepartmentInputFromJson(json);
}

// Doctor in Department Model
@freezed
abstract class DoctorInDepartment with _$DoctorInDepartment {
  const factory DoctorInDepartment({
    required String id,
    @JsonKey(name: "user_id") required String userId,
    @JsonKey(name: "doctor_code") required String doctorCode,
    required String specialization,
    @JsonKey(name: "license_number") required String licenseNumber,
    @JsonKey(name: "is_main_doctor") @Default(false) bool isMainDoctor,
    @JsonKey(name: "is_active") @Default(true) bool isActive,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String email,
    String? phone,
    @JsonKey(name: "department_name") String? departmentName,
    @JsonKey(name: "clinic_name") String? clinicName,
  }) = _DoctorInDepartment;

  factory DoctorInDepartment.fromJson(Map<String, dynamic> json) =>
      _$DoctorInDepartmentFromJson(json);
}

// Department List Response
@freezed
abstract class DepartmentListResponse with _$DepartmentListResponse {
  const factory DepartmentListResponse({
    required List<DepartmentModel> departments,
    @JsonKey(name: "total_count") required int totalCount,
  }) = _DepartmentListResponse;

  factory DepartmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$DepartmentListResponseFromJson(json);
}

// Doctors by Department Response
@freezed
abstract class DoctorsByDepartmentResponse with _$DoctorsByDepartmentResponse {
  const factory DoctorsByDepartmentResponse({
    @JsonKey(name: "department_id") required String departmentId,
    required List<DoctorInDepartment> doctors,
    @JsonKey(name: "total_count") required int totalCount,
  }) = _DoctorsByDepartmentResponse;

  factory DoctorsByDepartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorsByDepartmentResponseFromJson(json);
}
