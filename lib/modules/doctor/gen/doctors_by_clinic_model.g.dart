// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctors_by_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClinicInfoModel _$ClinicInfoModelFromJson(Map<String, dynamic> json) =>
    _ClinicInfoModel(
      id: json['id'] as String,
      clinicCode: json['clinic_code'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$ClinicInfoModelToJson(_ClinicInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_code': instance.clinicCode,
      'name': instance.name,
      'address': instance.address,
    };

_DoctorInClinicModel _$DoctorInClinicModelFromJson(Map<String, dynamic> json) =>
    _DoctorInClinicModel(
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

Map<String, dynamic> _$DoctorInClinicModelToJson(
  _DoctorInClinicModel instance,
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
  'created_at': ?instance.createdAt,
};

_DoctorsByClinicResponse _$DoctorsByClinicResponseFromJson(
  Map<String, dynamic> json,
) => _DoctorsByClinicResponse(
  clinic: ClinicInfoModel.fromJson(json['clinic'] as Map<String, dynamic>),
  doctors: (json['doctors'] as List<dynamic>)
      .map((e) => DoctorInClinicModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$DoctorsByClinicResponseToJson(
  _DoctorsByClinicResponse instance,
) => <String, dynamic>{
  'clinic': instance.clinic.toJson(),
  'doctors': instance.doctors.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
};
