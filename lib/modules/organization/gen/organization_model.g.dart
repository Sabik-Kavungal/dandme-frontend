// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationModelImpl _$$OrganizationModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrganizationModelImpl(
  id: json['id'] as String?,
  name: json['name'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  licenseNumber: json['license_number'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] as String?,
  adminFirstName: json['admin_first_name'] as String?,
  adminLastName: json['admin_last_name'] as String?,
  adminEmail: json['admin_email'] as String?,
  adminUsername: json['admin_username'] as String?,
  adminPhone: json['admin_phone'] as String?,
  adminPassword: json['admin_password'] as String?,
);

Map<String, dynamic> _$$OrganizationModelImplToJson(
  _$OrganizationModelImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  'name': instance.name,
  if (instance.email case final value?) 'email': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.address case final value?) 'address': value,
  if (instance.licenseNumber case final value?) 'license_number': value,
  if (instance.isActive case final value?) 'isActive': value,
  if (instance.createdAt case final value?) 'createdAt': value,
  if (instance.adminFirstName case final value?) 'admin_first_name': value,
  if (instance.adminLastName case final value?) 'admin_last_name': value,
  if (instance.adminEmail case final value?) 'admin_email': value,
  if (instance.adminUsername case final value?) 'admin_username': value,
  if (instance.adminPhone case final value?) 'admin_phone': value,
  if (instance.adminPassword case final value?) 'admin_password': value,
};
