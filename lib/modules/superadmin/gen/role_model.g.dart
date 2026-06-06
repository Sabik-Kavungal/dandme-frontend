// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => _RoleModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  permissions: json['permissions'] as Map<String, dynamic>,
  isSystemRole: json['is_system_role'] as bool,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String?,
  usersCount: (json['users_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$RoleModelToJson(_RoleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'permissions': instance.permissions,
      'is_system_role': instance.isSystemRole,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': ?instance.updatedAt,
      'users_count': ?instance.usersCount,
    };

_CreateRoleModel _$CreateRoleModelFromJson(Map<String, dynamic> json) =>
    _CreateRoleModel(
      name: json['name'] as String,
      description: json['description'] as String?,
      permissions: json['permissions'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CreateRoleModelToJson(_CreateRoleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': ?instance.description,
      'permissions': instance.permissions,
    };

_UpdateRoleModel _$UpdateRoleModelFromJson(Map<String, dynamic> json) =>
    _UpdateRoleModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      permissions: json['permissions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UpdateRoleModelToJson(_UpdateRoleModel instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'description': ?instance.description,
      'permissions': ?instance.permissions,
    };

_UpdateRolePermissionsModel _$UpdateRolePermissionsModelFromJson(
  Map<String, dynamic> json,
) => _UpdateRolePermissionsModel(
  permissions: json['permissions'] as Map<String, dynamic>,
);

Map<String, dynamic> _$UpdateRolePermissionsModelToJson(
  _UpdateRolePermissionsModel instance,
) => <String, dynamic>{'permissions': instance.permissions};

_PermissionTemplate _$PermissionTemplateFromJson(Map<String, dynamic> json) =>
    _PermissionTemplate(
      name: json['name'] as String,
      description: json['description'] as String,
      permissions: json['permissions'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PermissionTemplateToJson(_PermissionTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'permissions': instance.permissions,
    };

_PermissionTemplatesResponse _$PermissionTemplatesResponseFromJson(
  Map<String, dynamic> json,
) => _PermissionTemplatesResponse(
  templates: (json['templates'] as List<dynamic>)
      .map((e) => PermissionTemplate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PermissionTemplatesResponseToJson(
  _PermissionTemplatesResponse instance,
) => <String, dynamic>{
  'templates': instance.templates.map((e) => e.toJson()).toList(),
};

_RoleUserModel _$RoleUserModelFromJson(Map<String, dynamic> json) =>
    _RoleUserModel(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool,
      isBlocked: json['is_blocked'] as bool,
      lastLogin: json['last_login'] as String?,
      createdAt: json['created_at'] as String?,
      assignedAt: json['assigned_at'] as String?,
      organizationId: json['organization_id'] as String?,
      clinicId: json['clinic_id'] as String?,
      serviceId: json['service_id'] as String?,
    );

Map<String, dynamic> _$RoleUserModelToJson(_RoleUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': ?instance.email,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': ?instance.phone,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      'last_login': ?instance.lastLogin,
      'created_at': ?instance.createdAt,
      'assigned_at': ?instance.assignedAt,
      'organization_id': ?instance.organizationId,
      'clinic_id': ?instance.clinicId,
      'service_id': ?instance.serviceId,
    };

_RolePagination _$RolePaginationFromJson(Map<String, dynamic> json) =>
    _RolePagination(
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$RolePaginationToJson(_RolePagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_count': instance.totalCount,
      'total_pages': instance.totalPages,
    };

_RolesListResponse _$RolesListResponseFromJson(Map<String, dynamic> json) =>
    _RolesListResponse(
      roles: (json['roles'] as List<dynamic>)
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: RolePagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RolesListResponseToJson(_RolesListResponse instance) =>
    <String, dynamic>{
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };

_RoleUsersResponse _$RoleUsersResponseFromJson(Map<String, dynamic> json) =>
    _RoleUsersResponse(
      users: (json['users'] as List<dynamic>)
          .map((e) => RoleUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: RolePagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RoleUsersResponseToJson(_RoleUsersResponse instance) =>
    <String, dynamic>{
      'users': instance.users.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };
