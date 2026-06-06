// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  username: json['username'] as String?,
  phone: json['phone'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  gender: json['gender'] as String?,
  isActive: json['isActive'] as bool?,
  lastLogin: json['lastLogin'] as String?,
  createdAt: json['createdAt'] as String?,
  role: json['role'] as String?,
  roleId: json['roleId'] as String?,
  organizationId: json['organizationId'] as String?,
  clinicId: json['clinicId'] as String?,
  serviceId: json['serviceId'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'firstName': ?instance.firstName,
      'lastName': ?instance.lastName,
      'email': ?instance.email,
      'username': ?instance.username,
      'phone': ?instance.phone,
      'dateOfBirth': ?instance.dateOfBirth,
      'gender': ?instance.gender,
      'isActive': ?instance.isActive,
      'lastLogin': ?instance.lastLogin,
      'createdAt': ?instance.createdAt,
      'role': ?instance.role,
      'roleId': ?instance.roleId,
      'organizationId': ?instance.organizationId,
      'clinicId': ?instance.clinicId,
      'serviceId': ?instance.serviceId,
      'logo': ?instance.logo,
    };

_UserRole _$UserRoleFromJson(Map<String, dynamic> json) => _UserRole(
  id: json['id'] as String?,
  name: json['name'] as String?,
  permissions: json['permissions'] as Map<String, dynamic>?,
  clinicId: json['clinic_id'] as String?,
  organizationId: json['organization_id'] as String?,
  serviceId: json['service_id'] as String?,
);

Map<String, dynamic> _$UserRoleToJson(_UserRole instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'permissions': ?instance.permissions,
  'clinic_id': ?instance.clinicId,
  'organization_id': ?instance.organizationId,
  'service_id': ?instance.serviceId,
};

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      accessToken: json['accessToken'] as String?,
      email: json['email'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      id: json['id'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      refreshToken: json['refreshToken'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => UserRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokenType: json['tokenType'] as String?,
      username: json['username'] as String?,
      organizationId: json['organizationId'] as String?,
      clinicId: json['clinicId'] as String?,
      serviceId: json['serviceId'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': ?instance.accessToken,
      'email': ?instance.email,
      'expiresIn': ?instance.expiresIn,
      'firstName': ?instance.firstName,
      'id': ?instance.id,
      'lastName': ?instance.lastName,
      'phone': ?instance.phone,
      'refreshToken': ?instance.refreshToken,
      'roles': ?instance.roles?.map((e) => e.toJson()).toList(),
      'tokenType': ?instance.tokenType,
      'username': ?instance.username,
      'organizationId': ?instance.organizationId,
      'clinicId': ?instance.clinicId,
      'serviceId': ?instance.serviceId,
    };

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => _TokenModel(
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
  userId: json['userId'] as String?,
);

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{
      'accessToken': ?instance.accessToken,
      'refreshToken': ?instance.refreshToken,
      'userId': ?instance.userId,
    };

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'user': ?instance.user?.toJson(),
      'accessToken': ?instance.accessToken,
      'refreshToken': ?instance.refreshToken,
    };
