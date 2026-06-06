// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_model_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRoleAdmin _$UserRoleAdminFromJson(Map<String, dynamic> json) =>
    _UserRoleAdmin(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      permissions: json['permissions'] as Map<String, dynamic>?,
      isActive: json['is_active'] as bool?,
      organizationId: json['organization_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      serviceId: json['service_id'] as String?,
    );

Map<String, dynamic> _$UserRoleAdminToJson(_UserRoleAdmin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'permissions': ?instance.permissions,
      'is_active': ?instance.isActive,
      'organization_id': ?instance.organizationId,
      'clinic_id': ?instance.clinicId,
      'service_id': ?instance.serviceId,
    };

_UserModelAdmin _$UserModelAdminFromJson(Map<String, dynamic> json) =>
    _UserModelAdmin(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
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

Map<String, dynamic> _$UserModelAdminToJson(_UserModelAdmin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': ?instance.email,
      'username': instance.username,
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'phone': ?instance.phone,
      'date_of_birth': ?instance.dateOfBirth,
      'gender': ?instance.gender,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      'blocked_at': ?instance.blockedAt,
      'blocked_reason': ?instance.blockedReason,
      'last_login': ?instance.lastLogin,
      'created_at': instance.createdAt,
      'updated_at': ?instance.updatedAt,
      'roles': ?instance.roles?.map((e) => e.toJson()).toList(),
    };

_CreateUserModelAdmin _$CreateUserModelAdminFromJson(
  Map<String, dynamic> json,
) => _CreateUserModelAdmin(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
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

Map<String, dynamic> _$CreateUserModelAdminToJson(
  _CreateUserModelAdmin instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'email': ?instance.email,
  'username': instance.username,
  'phone': ?instance.phone,
  'password': instance.password,
  'date_of_birth': ?instance.dateOfBirth,
  'gender': ?instance.gender,
  'is_active': ?instance.isActive,
  'role_ids': ?instance.roleIds,
};

_UpdateUserModelAdmin _$UpdateUserModelAdminFromJson(
  Map<String, dynamic> json,
) => _UpdateUserModelAdmin(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$UpdateUserModelAdminToJson(
  _UpdateUserModelAdmin instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'date_of_birth': ?instance.dateOfBirth,
  'gender': ?instance.gender,
};

_BlockUserModelAdmin _$BlockUserModelAdminFromJson(Map<String, dynamic> json) =>
    _BlockUserModelAdmin(reason: json['reason'] as String);

Map<String, dynamic> _$BlockUserModelAdminToJson(
  _BlockUserModelAdmin instance,
) => <String, dynamic>{'reason': instance.reason};

_AdminChangePasswordModelAdmin _$AdminChangePasswordModelAdminFromJson(
  Map<String, dynamic> json,
) =>
    _AdminChangePasswordModelAdmin(newPassword: json['new_password'] as String);

Map<String, dynamic> _$AdminChangePasswordModelAdminToJson(
  _AdminChangePasswordModelAdmin instance,
) => <String, dynamic>{'new_password': instance.newPassword};

_AssignRoleModelAdmin _$AssignRoleModelAdminFromJson(
  Map<String, dynamic> json,
) => _AssignRoleModelAdmin(
  roleId: json['role_id'] as String,
  organizationId: json['organization_id'] as String?,
  clinicId: json['clinic_id'] as String?,
  serviceId: json['service_id'] as String?,
);

Map<String, dynamic> _$AssignRoleModelAdminToJson(
  _AssignRoleModelAdmin instance,
) => <String, dynamic>{
  'role_id': instance.roleId,
  'organization_id': ?instance.organizationId,
  'clinic_id': ?instance.clinicId,
  'service_id': ?instance.serviceId,
};

_UserActivityLogAdmin _$UserActivityLogAdminFromJson(
  Map<String, dynamic> json,
) => _UserActivityLogAdmin(
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

Map<String, dynamic> _$UserActivityLogAdminToJson(
  _UserActivityLogAdmin instance,
) => <String, dynamic>{
  'id': instance.id,
  'performed_by': ?instance.performedBy,
  'performed_by_name': ?instance.performedByName,
  'action_type': instance.actionType,
  'action_description': instance.actionDescription,
  'ip_address': ?instance.ipAddress,
  'user_agent': ?instance.userAgent,
  'metadata': ?instance.metadata,
  'created_at': instance.createdAt,
};

_UserPaginationAdmin _$UserPaginationAdminFromJson(Map<String, dynamic> json) =>
    _UserPaginationAdmin(
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$UserPaginationAdminToJson(
  _UserPaginationAdmin instance,
) => <String, dynamic>{
  'page': instance.page,
  'page_size': instance.pageSize,
  'total_count': instance.totalCount,
  'total_pages': instance.totalPages,
};

_UsersListResponseAdmin _$UsersListResponseAdminFromJson(
  Map<String, dynamic> json,
) => _UsersListResponseAdmin(
  users: (json['users'] as List<dynamic>)
      .map((e) => UserModelAdmin.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: UserPaginationAdmin.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UsersListResponseAdminToJson(
  _UsersListResponseAdmin instance,
) => <String, dynamic>{
  'users': instance.users.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_ActivityLogsResponseAdmin _$ActivityLogsResponseAdminFromJson(
  Map<String, dynamic> json,
) => _ActivityLogsResponseAdmin(
  logs: (json['logs'] as List<dynamic>)
      .map((e) => UserActivityLogAdmin.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: UserPaginationAdmin.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ActivityLogsResponseAdminToJson(
  _ActivityLogsResponseAdmin instance,
) => <String, dynamic>{
  'logs': instance.logs.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};
