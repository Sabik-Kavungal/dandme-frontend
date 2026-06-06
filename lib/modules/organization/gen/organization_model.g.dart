// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) =>
    _OrganizationModel(
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

Map<String, dynamic> _$OrganizationModelToJson(_OrganizationModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'address': ?instance.address,
      'license_number': ?instance.licenseNumber,
      'isActive': ?instance.isActive,
      'createdAt': ?instance.createdAt,
      'admin_first_name': ?instance.adminFirstName,
      'admin_last_name': ?instance.adminLastName,
      'admin_email': ?instance.adminEmail,
      'admin_username': ?instance.adminUsername,
      'admin_phone': ?instance.adminPhone,
      'admin_password': ?instance.adminPassword,
    };
