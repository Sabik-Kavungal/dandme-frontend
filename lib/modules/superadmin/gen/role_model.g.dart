// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleModelImpl _$$RoleModelImplFromJson(Map<String, dynamic> json) =>
    _$RoleModelImpl(
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

Map<String, dynamic> _$$RoleModelImplToJson(_$RoleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      'permissions': instance.permissions,
      'is_system_role': instance.isSystemRole,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      if (instance.updatedAt case final value?) 'updated_at': value,
      if (instance.usersCount case final value?) 'users_count': value,
    };

_$CreateRoleModelImpl _$$CreateRoleModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateRoleModelImpl(
  name: json['name'] as String,
  description: json['description'] as String?,
  permissions: json['permissions'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$CreateRoleModelImplToJson(
  _$CreateRoleModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  if (instance.description case final value?) 'description': value,
  'permissions': instance.permissions,
};

_$UpdateRoleModelImpl _$$UpdateRoleModelImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateRoleModelImpl(
  name: json['name'] as String?,
  description: json['description'] as String?,
  permissions: json['permissions'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$UpdateRoleModelImplToJson(
  _$UpdateRoleModelImpl instance,
) => <String, dynamic>{
  if (instance.name case final value?) 'name': value,
  if (instance.description case final value?) 'description': value,
  if (instance.permissions case final value?) 'permissions': value,
};

_$UpdateRolePermissionsModelImpl _$$UpdateRolePermissionsModelImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateRolePermissionsModelImpl(
  permissions: json['permissions'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$UpdateRolePermissionsModelImplToJson(
  _$UpdateRolePermissionsModelImpl instance,
) => <String, dynamic>{'permissions': instance.permissions};

_$PermissionTemplateImpl _$$PermissionTemplateImplFromJson(
  Map<String, dynamic> json,
) => _$PermissionTemplateImpl(
  name: json['name'] as String,
  description: json['description'] as String,
  permissions: json['permissions'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$PermissionTemplateImplToJson(
  _$PermissionTemplateImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'permissions': instance.permissions,
};

_$PermissionTemplatesResponseImpl _$$PermissionTemplatesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PermissionTemplatesResponseImpl(
  templates: (json['templates'] as List<dynamic>)
      .map((e) => PermissionTemplate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PermissionTemplatesResponseImplToJson(
  _$PermissionTemplatesResponseImpl instance,
) => <String, dynamic>{
  'templates': instance.templates.map((e) => e.toJson()).toList(),
};

_$RoleUserModelImpl _$$RoleUserModelImplFromJson(Map<String, dynamic> json) =>
    _$RoleUserModelImpl(
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

Map<String, dynamic> _$$RoleUserModelImplToJson(_$RoleUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.email case final value?) 'email': value,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      if (instance.phone case final value?) 'phone': value,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      if (instance.lastLogin case final value?) 'last_login': value,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.assignedAt case final value?) 'assigned_at': value,
      if (instance.organizationId case final value?) 'organization_id': value,
      if (instance.clinicId case final value?) 'clinic_id': value,
      if (instance.serviceId case final value?) 'service_id': value,
    };

_$RolePaginationImpl _$$RolePaginationImplFromJson(Map<String, dynamic> json) =>
    _$RolePaginationImpl(
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$$RolePaginationImplToJson(
  _$RolePaginationImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'page_size': instance.pageSize,
  'total_count': instance.totalCount,
  'total_pages': instance.totalPages,
};

_$RolesListResponseImpl _$$RolesListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RolesListResponseImpl(
  roles: (json['roles'] as List<dynamic>)
      .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: RolePagination.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$RolesListResponseImplToJson(
  _$RolesListResponseImpl instance,
) => <String, dynamic>{
  'roles': instance.roles.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_$RoleUsersResponseImpl _$$RoleUsersResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RoleUsersResponseImpl(
  users: (json['users'] as List<dynamic>)
      .map((e) => RoleUserModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: RolePagination.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$RoleUsersResponseImplToJson(
  _$RoleUsersResponseImpl instance,
) => <String, dynamic>{
  'users': instance.users.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};
