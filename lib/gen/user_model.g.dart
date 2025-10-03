// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
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
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.username case final value?) 'username': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.dateOfBirth case final value?) 'dateOfBirth': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.isActive case final value?) 'isActive': value,
      if (instance.lastLogin case final value?) 'lastLogin': value,
      if (instance.createdAt case final value?) 'createdAt': value,
      if (instance.role case final value?) 'role': value,
      if (instance.roleId case final value?) 'roleId': value,
      if (instance.organizationId case final value?) 'organizationId': value,
      if (instance.clinicId case final value?) 'clinicId': value,
      if (instance.serviceId case final value?) 'serviceId': value,
    };

_$UserRoleImpl _$$UserRoleImplFromJson(Map<String, dynamic> json) =>
    _$UserRoleImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      permissions: json['permissions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UserRoleImplToJson(_$UserRoleImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.permissions case final value?) 'permissions': value,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
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
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      if (instance.accessToken case final value?) 'accessToken': value,
      if (instance.email case final value?) 'email': value,
      if (instance.expiresIn case final value?) 'expiresIn': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.id case final value?) 'id': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.refreshToken case final value?) 'refreshToken': value,
      if (instance.roles?.map((e) => e.toJson()).toList() case final value?)
        'roles': value,
      if (instance.tokenType case final value?) 'tokenType': value,
      if (instance.username case final value?) 'username': value,
    };

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenModelImpl(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) =>
    <String, dynamic>{
      if (instance.accessToken case final value?) 'accessToken': value,
      if (instance.refreshToken case final value?) 'refreshToken': value,
      if (instance.userId case final value?) 'userId': value,
    };

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      if (instance.user?.toJson() case final value?) 'user': value,
      if (instance.accessToken case final value?) 'accessToken': value,
      if (instance.refreshToken case final value?) 'refreshToken': value,
    };
