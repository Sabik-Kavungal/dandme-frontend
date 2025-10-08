// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_model_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRoleAdminImpl _$$UserRoleAdminImplFromJson(Map<String, dynamic> json) =>
    _$UserRoleAdminImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      permissions: json['permissions'] as Map<String, dynamic>?,
      isActive: json['is_active'] as bool?,
      organizationId: json['organization_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      serviceId: json['service_id'] as String?,
    );

Map<String, dynamic> _$$UserRoleAdminImplToJson(_$UserRoleAdminImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.permissions case final value?) 'permissions': value,
      if (instance.isActive case final value?) 'is_active': value,
      if (instance.organizationId case final value?) 'organization_id': value,
      if (instance.clinicId case final value?) 'clinic_id': value,
      if (instance.serviceId case final value?) 'service_id': value,
    };

_$UserModelAdminImpl _$$UserModelAdminImplFromJson(Map<String, dynamic> json) =>
    _$UserModelAdminImpl(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      isActive: json['is_active'] as bool,
      isBlocked: json['is_blocked'] as bool,
      blockedAt: json['blocked_at'] as String?,
      blockedReason: json['blocked_reason'] as String?,
      lastLogin: json['last_login'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => UserRoleAdmin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelAdminImplToJson(
  _$UserModelAdminImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.email case final value?) 'email': value,
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  if (instance.phone case final value?) 'phone': value,
  if (instance.dateOfBirth case final value?) 'date_of_birth': value,
  if (instance.gender case final value?) 'gender': value,
  'is_active': instance.isActive,
  'is_blocked': instance.isBlocked,
  if (instance.blockedAt case final value?) 'blocked_at': value,
  if (instance.blockedReason case final value?) 'blocked_reason': value,
  if (instance.lastLogin case final value?) 'last_login': value,
  'created_at': instance.createdAt,
  if (instance.updatedAt case final value?) 'updated_at': value,
  if (instance.roles?.map((e) => e.toJson()).toList() case final value?)
    'roles': value,
};

_$CreateUserModelAdminImpl _$$CreateUserModelAdminImplFromJson(
  Map<String, dynamic> json,
) => _$CreateUserModelAdminImpl(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String?,
  username: json['username'] as String,
  phone: json['phone'] as String?,
  password: json['password'] as String,
  dateOfBirth: json['date_of_birth'] as String?,
  gender: json['gender'] as String?,
  isActive: json['is_active'] as bool?,
  roleIds: (json['role_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$CreateUserModelAdminImplToJson(
  _$CreateUserModelAdminImpl instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  if (instance.email case final value?) 'email': value,
  'username': instance.username,
  if (instance.phone case final value?) 'phone': value,
  'password': instance.password,
  if (instance.dateOfBirth case final value?) 'date_of_birth': value,
  if (instance.gender case final value?) 'gender': value,
  if (instance.isActive case final value?) 'is_active': value,
  if (instance.roleIds case final value?) 'role_ids': value,
};

_$UpdateUserModelAdminImpl _$$UpdateUserModelAdminImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateUserModelAdminImpl(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$$UpdateUserModelAdminImplToJson(
  _$UpdateUserModelAdminImpl instance,
) => <String, dynamic>{
  if (instance.firstName case final value?) 'first_name': value,
  if (instance.lastName case final value?) 'last_name': value,
  if (instance.email case final value?) 'email': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.dateOfBirth case final value?) 'date_of_birth': value,
  if (instance.gender case final value?) 'gender': value,
};

_$BlockUserModelAdminImpl _$$BlockUserModelAdminImplFromJson(
  Map<String, dynamic> json,
) => _$BlockUserModelAdminImpl(reason: json['reason'] as String);

Map<String, dynamic> _$$BlockUserModelAdminImplToJson(
  _$BlockUserModelAdminImpl instance,
) => <String, dynamic>{'reason': instance.reason};

_$AdminChangePasswordModelAdminImpl
_$$AdminChangePasswordModelAdminImplFromJson(Map<String, dynamic> json) =>
    _$AdminChangePasswordModelAdminImpl(
      newPassword: json['new_password'] as String,
    );

Map<String, dynamic> _$$AdminChangePasswordModelAdminImplToJson(
  _$AdminChangePasswordModelAdminImpl instance,
) => <String, dynamic>{'new_password': instance.newPassword};

_$AssignRoleModelAdminImpl _$$AssignRoleModelAdminImplFromJson(
  Map<String, dynamic> json,
) => _$AssignRoleModelAdminImpl(
  roleId: json['role_id'] as String,
  organizationId: json['organization_id'] as String?,
  clinicId: json['clinic_id'] as String?,
  serviceId: json['service_id'] as String?,
);

Map<String, dynamic> _$$AssignRoleModelAdminImplToJson(
  _$AssignRoleModelAdminImpl instance,
) => <String, dynamic>{
  'role_id': instance.roleId,
  if (instance.organizationId case final value?) 'organization_id': value,
  if (instance.clinicId case final value?) 'clinic_id': value,
  if (instance.serviceId case final value?) 'service_id': value,
};

_$UserActivityLogAdminImpl _$$UserActivityLogAdminImplFromJson(
  Map<String, dynamic> json,
) => _$UserActivityLogAdminImpl(
  id: json['id'] as String,
  performedBy: json['performed_by'] as String?,
  performedByName: json['performed_by_name'] as String?,
  actionType: json['action_type'] as String,
  actionDescription: json['action_description'] as String,
  ipAddress: json['ip_address'] as String?,
  userAgent: json['user_agent'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$UserActivityLogAdminImplToJson(
  _$UserActivityLogAdminImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.performedBy case final value?) 'performed_by': value,
  if (instance.performedByName case final value?) 'performed_by_name': value,
  'action_type': instance.actionType,
  'action_description': instance.actionDescription,
  if (instance.ipAddress case final value?) 'ip_address': value,
  if (instance.userAgent case final value?) 'user_agent': value,
  if (instance.metadata case final value?) 'metadata': value,
  'created_at': instance.createdAt,
};

_$UserPaginationAdminImpl _$$UserPaginationAdminImplFromJson(
  Map<String, dynamic> json,
) => _$UserPaginationAdminImpl(
  page: (json['page'] as num).toInt(),
  pageSize: (json['page_size'] as num).toInt(),
  totalCount: (json['total_count'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$$UserPaginationAdminImplToJson(
  _$UserPaginationAdminImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'page_size': instance.pageSize,
  'total_count': instance.totalCount,
  'total_pages': instance.totalPages,
};

_$UsersListResponseAdminImpl _$$UsersListResponseAdminImplFromJson(
  Map<String, dynamic> json,
) => _$UsersListResponseAdminImpl(
  users: (json['users'] as List<dynamic>)
      .map((e) => UserModelAdmin.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: UserPaginationAdmin.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$UsersListResponseAdminImplToJson(
  _$UsersListResponseAdminImpl instance,
) => <String, dynamic>{
  'users': instance.users.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_$ActivityLogsResponseAdminImpl _$$ActivityLogsResponseAdminImplFromJson(
  Map<String, dynamic> json,
) => _$ActivityLogsResponseAdminImpl(
  logs: (json['logs'] as List<dynamic>)
      .map((e) => UserActivityLogAdmin.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: UserPaginationAdmin.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$ActivityLogsResponseAdminImplToJson(
  _$ActivityLogsResponseAdminImpl instance,
) => <String, dynamic>{
  'logs': instance.logs.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};
