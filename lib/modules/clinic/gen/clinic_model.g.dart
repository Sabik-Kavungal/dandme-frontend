// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClinicModel _$ClinicModelFromJson(Map<String, dynamic> json) => _ClinicModel(
  id: json['id'] as String?,
  organizationId: json['organization_id'] as String,
  clinicCode: json['clinic_code'] as String?,
  name: json['name'] as String,
  clinicType: json['clinic_type'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  licenseNumber: json['license_number'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['created_at'] as String?,
  adminFirstName: json['admin_first_name'] as String?,
  adminLastName: json['admin_last_name'] as String?,
  adminEmail: json['admin_email'] as String?,
  adminUsername: json['admin_username'] as String?,
  adminPhone: json['admin_phone'] as String?,
  adminPassword: json['admin_password'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$ClinicModelToJson(_ClinicModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'organization_id': instance.organizationId,
      'clinic_code': ?instance.clinicCode,
      'name': instance.name,
      'clinic_type': ?instance.clinicType,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'address': ?instance.address,
      'license_number': ?instance.licenseNumber,
      'is_active': ?instance.isActive,
      'created_at': ?instance.createdAt,
      'admin_first_name': ?instance.adminFirstName,
      'admin_last_name': ?instance.adminLastName,
      'admin_email': ?instance.adminEmail,
      'admin_username': ?instance.adminUsername,
      'admin_phone': ?instance.adminPhone,
      'admin_password': ?instance.adminPassword,
      'logo': ?instance.logo,
    };

_CreateClinicModel _$CreateClinicModelFromJson(Map<String, dynamic> json) =>
    _CreateClinicModel(
      organizationId: json['organization_id'] as String,
      clinicCode: json['clinic_code'] as String?,
      name: json['name'] as String,
      clinicType: json['clinic_type'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      licenseNumber: json['license_number'] as String?,
      adminFirstName: json['admin_first_name'] as String,
      adminLastName: json['admin_last_name'] as String,
      adminEmail: json['admin_email'] as String,
      adminUsername: json['admin_username'] as String,
      adminPhone: json['admin_phone'] as String?,
      adminPassword: json['admin_password'] as String,
    );

Map<String, dynamic> _$CreateClinicModelToJson(_CreateClinicModel instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'clinic_code': ?instance.clinicCode,
      'name': instance.name,
      'clinic_type': ?instance.clinicType,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'address': ?instance.address,
      'license_number': ?instance.licenseNumber,
      'admin_first_name': instance.adminFirstName,
      'admin_last_name': instance.adminLastName,
      'admin_email': instance.adminEmail,
      'admin_username': instance.adminUsername,
      'admin_phone': ?instance.adminPhone,
      'admin_password': instance.adminPassword,
    };
