// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    _DepartmentModel(
      id: json['id'] as String,
      clinicId: json['clinic_id'] as String,
      clinicName: json['clinic_name'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DepartmentModelToJson(_DepartmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_id': instance.clinicId,
      'clinic_name': ?instance.clinicName,
      'name': instance.name,
      'description': ?instance.description,
      'is_active': instance.isActive,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_CreateDepartmentInput _$CreateDepartmentInputFromJson(
  Map<String, dynamic> json,
) => _CreateDepartmentInput(
  clinicId: json['clinic_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$CreateDepartmentInputToJson(
  _CreateDepartmentInput instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'name': instance.name,
  'description': ?instance.description,
};

_UpdateDepartmentInput _$UpdateDepartmentInputFromJson(
  Map<String, dynamic> json,
) => _UpdateDepartmentInput(
  name: json['name'] as String?,
  description: json['description'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$UpdateDepartmentInputToJson(
  _UpdateDepartmentInput instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'description': ?instance.description,
  'is_active': ?instance.isActive,
};

_DoctorInDepartment _$DoctorInDepartmentFromJson(Map<String, dynamic> json) =>
    _DoctorInDepartment(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      doctorCode: json['doctor_code'] as String,
      specialization: json['specialization'] as String,
      licenseNumber: json['license_number'] as String,
      isMainDoctor: json['is_main_doctor'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      departmentName: json['department_name'] as String?,
      clinicName: json['clinic_name'] as String?,
    );

Map<String, dynamic> _$DoctorInDepartmentToJson(_DoctorInDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'doctor_code': instance.doctorCode,
      'specialization': instance.specialization,
      'license_number': instance.licenseNumber,
      'is_main_doctor': instance.isMainDoctor,
      'is_active': instance.isActive,
      'created_at': ?instance.createdAt,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': ?instance.phone,
      'department_name': ?instance.departmentName,
      'clinic_name': ?instance.clinicName,
    };

_DepartmentListResponse _$DepartmentListResponseFromJson(
  Map<String, dynamic> json,
) => _DepartmentListResponse(
  departments: (json['departments'] as List<dynamic>)
      .map((e) => DepartmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$DepartmentListResponseToJson(
  _DepartmentListResponse instance,
) => <String, dynamic>{
  'departments': instance.departments.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};

_DoctorsByDepartmentResponse _$DoctorsByDepartmentResponseFromJson(
  Map<String, dynamic> json,
) => _DoctorsByDepartmentResponse(
  departmentId: json['department_id'] as String,
  doctors: (json['doctors'] as List<dynamic>)
      .map((e) => DoctorInDepartment.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$DoctorsByDepartmentResponseToJson(
  _DoctorsByDepartmentResponse instance,
) => <String, dynamic>{
  'department_id': instance.departmentId,
  'doctors': instance.doctors.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};
