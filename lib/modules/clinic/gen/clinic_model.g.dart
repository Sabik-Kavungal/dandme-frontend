// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicModelImpl _$$ClinicModelImplFromJson(Map<String, dynamic> json) =>
    _$ClinicModelImpl(
      id: json['id'] as String?,
      organizationId: json['organization_id'] as String,
      clinicCode: json['clinic_code'] as String,
      name: json['name'] as String,
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
    );

Map<String, dynamic> _$$ClinicModelImplToJson(_$ClinicModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'organization_id': instance.organizationId,
      'clinic_code': instance.clinicCode,
      'name': instance.name,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.address case final value?) 'address': value,
      if (instance.licenseNumber case final value?) 'license_number': value,
      if (instance.isActive case final value?) 'is_active': value,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.adminFirstName case final value?) 'admin_first_name': value,
      if (instance.adminLastName case final value?) 'admin_last_name': value,
      if (instance.adminEmail case final value?) 'admin_email': value,
      if (instance.adminUsername case final value?) 'admin_username': value,
      if (instance.adminPhone case final value?) 'admin_phone': value,
      if (instance.adminPassword case final value?) 'admin_password': value,
    };

_$CreateClinicModelImpl _$$CreateClinicModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateClinicModelImpl(
  organizationId: json['organization_id'] as String,
  clinicCode: json['clinic_code'] as String,
  name: json['name'] as String,
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

Map<String, dynamic> _$$CreateClinicModelImplToJson(
  _$CreateClinicModelImpl instance,
) => <String, dynamic>{
  'organization_id': instance.organizationId,
  'clinic_code': instance.clinicCode,
  'name': instance.name,
  if (instance.email case final value?) 'email': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.address case final value?) 'address': value,
  if (instance.licenseNumber case final value?) 'license_number': value,
  'admin_first_name': instance.adminFirstName,
  'admin_last_name': instance.adminLastName,
  'admin_email': instance.adminEmail,
  'admin_username': instance.adminUsername,
  if (instance.adminPhone case final value?) 'admin_phone': value,
  'admin_password': instance.adminPassword,
};
