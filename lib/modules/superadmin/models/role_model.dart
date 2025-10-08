import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/role_model.freezed.dart';
part '../gen/role_model.g.dart';

// Role response model
@freezed
class RoleModel with _$RoleModel {
  const factory RoleModel({
    required String id,
    required String name,
    String? description,
    required Map<String, dynamic> permissions,
    @JsonKey(name: 'is_system_role') required bool isSystemRole,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'users_count') int? usersCount,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}

// Model for creating a role
@freezed
class CreateRoleModel with _$CreateRoleModel {
  const factory CreateRoleModel({
    required String name,
    String? description,
    required Map<String, dynamic> permissions,
  }) = _CreateRoleModel;

  factory CreateRoleModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRoleModelFromJson(json);
}

// Model for updating a role
@freezed
class UpdateRoleModel with _$UpdateRoleModel {
  const factory UpdateRoleModel({
    String? name,
    String? description,
    Map<String, dynamic>? permissions,
  }) = _UpdateRoleModel;

  factory UpdateRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoleModelFromJson(json);
}

// Model for updating role permissions only
@freezed
class UpdateRolePermissionsModel with _$UpdateRolePermissionsModel {
  const factory UpdateRolePermissionsModel({
    required Map<String, dynamic> permissions,
  }) = _UpdateRolePermissionsModel;

  factory UpdateRolePermissionsModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateRolePermissionsModelFromJson(json);
}

// Permission template model
@freezed
class PermissionTemplate with _$PermissionTemplate {
  const factory PermissionTemplate({
    required String name,
    required String description,
    required Map<String, dynamic> permissions,
  }) = _PermissionTemplate;

  factory PermissionTemplate.fromJson(Map<String, dynamic> json) =>
      _$PermissionTemplateFromJson(json);
}

// Permission templates response
@freezed
class PermissionTemplatesResponse with _$PermissionTemplatesResponse {
  const factory PermissionTemplatesResponse({
    required List<PermissionTemplate> templates,
  }) = _PermissionTemplatesResponse;

  factory PermissionTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionTemplatesResponseFromJson(json);
}

// Role users model
@freezed
class RoleUserModel with _$RoleUserModel {
  const factory RoleUserModel({
    required String id,
    String? email,
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    String? phone,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_blocked') required bool isBlocked,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'assigned_at') String? assignedAt,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  }) = _RoleUserModel;

  factory RoleUserModel.fromJson(Map<String, dynamic> json) =>
      _$RoleUserModelFromJson(json);
}

// Pagination model
@freezed
class RolePagination with _$RolePagination {
  const factory RolePagination({
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _RolePagination;

  factory RolePagination.fromJson(Map<String, dynamic> json) =>
      _$RolePaginationFromJson(json);
}

// Roles list response
@freezed
class RolesListResponse with _$RolesListResponse {
  const factory RolesListResponse({
    required List<RoleModel> roles,
    required RolePagination pagination,
  }) = _RolesListResponse;

  factory RolesListResponse.fromJson(Map<String, dynamic> json) =>
      _$RolesListResponseFromJson(json);
}

// Role users response
@freezed
class RoleUsersResponse with _$RoleUsersResponse {
  const factory RoleUsersResponse({
    required List<RoleUserModel> users,
    required RolePagination pagination,
  }) = _RoleUsersResponse;

  factory RoleUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleUsersResponseFromJson(json);
}
