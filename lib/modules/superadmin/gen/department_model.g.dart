// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentModelImpl _$$DepartmentModelImplFromJson(
  Map<String, dynamic> json,
) => _$DepartmentModelImpl(
  id: json['id'] as String,
  clinicId: json['clinic_id'] as String,
  clinicName: json['clinic_name'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  isActive: json['is_active'] as bool? ?? true,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$$DepartmentModelImplToJson(
  _$DepartmentModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_id': instance.clinicId,
  if (instance.clinicName case final value?) 'clinic_name': value,
  'name': instance.name,
  if (instance.description case final value?) 'description': value,
  'is_active': instance.isActive,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};

_$CreateDepartmentInputImpl _$$CreateDepartmentInputImplFromJson(
  Map<String, dynamic> json,
) => _$CreateDepartmentInputImpl(
  clinicId: json['clinic_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$CreateDepartmentInputImplToJson(
  _$CreateDepartmentInputImpl instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'name': instance.name,
  if (instance.description case final value?) 'description': value,
};

_$UpdateDepartmentInputImpl _$$UpdateDepartmentInputImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateDepartmentInputImpl(
  name: json['name'] as String?,
  description: json['description'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$$UpdateDepartmentInputImplToJson(
  _$UpdateDepartmentInputImpl instance,
) => <String, dynamic>{
  if (instance.name case final value?) 'name': value,
  if (instance.description case final value?) 'description': value,
  if (instance.isActive case final value?) 'is_active': value,
};

_$DoctorInDepartmentImpl _$$DoctorInDepartmentImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorInDepartmentImpl(
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

Map<String, dynamic> _$$DoctorInDepartmentImplToJson(
  _$DoctorInDepartmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'doctor_code': instance.doctorCode,
  'specialization': instance.specialization,
  'license_number': instance.licenseNumber,
  'is_main_doctor': instance.isMainDoctor,
  'is_active': instance.isActive,
  if (instance.createdAt case final value?) 'created_at': value,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  if (instance.phone case final value?) 'phone': value,
  if (instance.departmentName case final value?) 'department_name': value,
  if (instance.clinicName case final value?) 'clinic_name': value,
};

_$DepartmentListResponseImpl _$$DepartmentListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DepartmentListResponseImpl(
  departments: (json['departments'] as List<dynamic>)
      .map((e) => DepartmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$$DepartmentListResponseImplToJson(
  _$DepartmentListResponseImpl instance,
) => <String, dynamic>{
  'departments': instance.departments.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};

_$DoctorsByDepartmentResponseImpl _$$DoctorsByDepartmentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorsByDepartmentResponseImpl(
  departmentId: json['department_id'] as String,
  doctors: (json['doctors'] as List<dynamic>)
      .map((e) => DoctorInDepartment.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$$DoctorsByDepartmentResponseImplToJson(
  _$DoctorsByDepartmentResponseImpl instance,
) => <String, dynamic>{
  'department_id': instance.departmentId,
  'doctors': instance.doctors.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};
