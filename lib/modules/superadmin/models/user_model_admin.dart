import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/user_model_admin.freezed.dart';
part '../gen/user_model_admin.g.dart';

// User role information for admin
@freezed
class UserRoleAdmin with _$UserRoleAdmin {
  const factory UserRoleAdmin({
    required String id,
    required String name,
    String? description,
    Map<String, dynamic>? permissions,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  }) = _UserRoleAdmin;

  factory UserRoleAdmin.fromJson(Map<String, dynamic> json) =>
      _$UserRoleAdminFromJson(json);
}

// User response model for admin (for listing and viewing users)
@freezed
class UserModelAdmin with _$UserModelAdmin {
  const factory UserModelAdmin({
    required String id,
    String? email,
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_blocked') required bool isBlocked,
    @JsonKey(name: 'blocked_at') String? blockedAt,
    @JsonKey(name: 'blocked_reason') String? blockedReason,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<UserRoleAdmin>? roles,
  }) = _UserModelAdmin;

  factory UserModelAdmin.fromJson(Map<String, dynamic> json) =>
      _$UserModelAdminFromJson(json);
}

// Model for creating a new user (admin)
@freezed
class CreateUserModelAdmin with _$CreateUserModelAdmin {
  const factory CreateUserModelAdmin({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    String? email,
    required String username,
    String? phone,
    required String password,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'role_ids') List<String>? roleIds,
  }) = _CreateUserModelAdmin;

  factory CreateUserModelAdmin.fromJson(Map<String, dynamic> json) =>
      _$CreateUserModelAdminFromJson(json);
}

// Model for updating a user (admin)
@freezed
class UpdateUserModelAdmin with _$UpdateUserModelAdmin {
  const factory UpdateUserModelAdmin({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
  }) = _UpdateUserModelAdmin;

  factory UpdateUserModelAdmin.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserModelAdminFromJson(json);
}

// Model for blocking a user (admin)
@freezed
class BlockUserModelAdmin with _$BlockUserModelAdmin {
  const factory BlockUserModelAdmin({required String reason}) =
      _BlockUserModelAdmin;

  factory BlockUserModelAdmin.fromJson(Map<String, dynamic> json) =>
      _$BlockUserModelAdminFromJson(json);
}

// Model for changing user password (admin)
@freezed
class AdminChangePasswordModelAdmin with _$AdminChangePasswordModelAdmin {
  const factory AdminChangePasswordModelAdmin({
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _AdminChangePasswordModelAdmin;

  factory AdminChangePasswordModelAdmin.fromJson(Map<String, dynamic> json) =>
      _$AdminChangePasswordModelAdminFromJson(json);
}

// Model for assigning a role (admin)
@freezed
class AssignRoleModelAdmin with _$AssignRoleModelAdmin {
  const factory AssignRoleModelAdmin({
    @JsonKey(name: 'role_id') required String roleId,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'service_id') String? serviceId,
  }) = _AssignRoleModelAdmin;

  factory AssignRoleModelAdmin.fromJson(Map<String, dynamic> json) =>
      _$AssignRoleModelAdminFromJson(json);
}

// User activity log model (admin)
@freezed
class UserActivityLogAdmin with _$UserActivityLogAdmin {
  const factory UserActivityLogAdmin({
    required String id,
    @JsonKey(name: 'performed_by') String? performedBy,
    @JsonKey(name: 'performed_by_name') String? performedByName,
    @JsonKey(name: 'action_type') required String actionType,
    @JsonKey(name: 'action_description') required String actionDescription,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'user_agent') String? userAgent,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _UserActivityLogAdmin;

  factory UserActivityLogAdmin.fromJson(Map<String, dynamic> json) =>
      _$UserActivityLogAdminFromJson(json);
}

// Pagination model for users (admin)
@freezed
class UserPaginationAdmin with _$UserPaginationAdmin {
  const factory UserPaginationAdmin({
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _UserPaginationAdmin;

  factory UserPaginationAdmin.fromJson(Map<String, dynamic> json) =>
      _$UserPaginationAdminFromJson(json);
}

// Users list response (admin)
@freezed
class UsersListResponseAdmin with _$UsersListResponseAdmin {
  const factory UsersListResponseAdmin({
    required List<UserModelAdmin> users,
    required UserPaginationAdmin pagination,
  }) = _UsersListResponseAdmin;

  factory UsersListResponseAdmin.fromJson(Map<String, dynamic> json) =>
      _$UsersListResponseAdminFromJson(json);
}

// Activity logs response (admin)
@freezed
class ActivityLogsResponseAdmin with _$ActivityLogsResponseAdmin {
  const factory ActivityLogsResponseAdmin({
    required List<UserActivityLogAdmin> logs,
    required UserPaginationAdmin pagination,
  }) = _ActivityLogsResponseAdmin;

  factory ActivityLogsResponseAdmin.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogsResponseAdminFromJson(json);
}
