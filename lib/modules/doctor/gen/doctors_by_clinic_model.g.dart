// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctors_by_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicInfoModelImpl _$$ClinicInfoModelImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicInfoModelImpl(
  id: json['id'] as String,
  clinicCode: json['clinic_code'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
);

Map<String, dynamic> _$$ClinicInfoModelImplToJson(
  _$ClinicInfoModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_code': instance.clinicCode,
  'name': instance.name,
  'address': instance.address,
};

_$DoctorInClinicModelImpl _$$DoctorInClinicModelImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorInClinicModelImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  doctorCode: json['doctor_code'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  specialization: json['specialization'] as String,
  licenseNumber: json['license_number'] as String,
  isActive: json['is_active'] as bool? ?? true,
  isMainDoctor: json['is_main_doctor'] as bool? ?? false,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$$DoctorInClinicModelImplToJson(
  _$DoctorInClinicModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'doctor_code': instance.doctorCode,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'specialization': instance.specialization,
  'license_number': instance.licenseNumber,
  'is_active': instance.isActive,
  'is_main_doctor': instance.isMainDoctor,
  if (instance.createdAt case final value?) 'created_at': value,
};

_$DoctorsByClinicResponseImpl _$$DoctorsByClinicResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DoctorsByClinicResponseImpl(
  clinic: ClinicInfoModel.fromJson(json['clinic'] as Map<String, dynamic>),
  doctors: (json['doctors'] as List<dynamic>)
      .map((e) => DoctorInClinicModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$$DoctorsByClinicResponseImplToJson(
  _$DoctorsByClinicResponseImpl instance,
) => <String, dynamic>{
  'clinic': instance.clinic.toJson(),
  'doctors': instance.doctors.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};
