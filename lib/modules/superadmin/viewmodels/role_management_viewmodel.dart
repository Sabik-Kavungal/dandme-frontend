import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/superadmin/models/role_model.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/service.dart';

class RoleManagementViewModel extends ChangeNotifier {
  final ServiceRepo _service = ServiceRepo();

  // Private state
  bool _isLoading = false;
  bool _isLoadingRole = false;
  bool _isCreating = false;
  bool _isUpdating = false;
  bool _isDeleting = false;
  bool _isLoadingTemplates = false;
  bool _isLoadingRoleUsers = false;
  String? _error;
  List<RoleModel> _roles = [];
  RoleModel? _selectedRole;
  RolePagination? _pagination;
  List<PermissionTemplate> _permissionTemplates = [];
  List<RoleUserModel> _roleUsers = [];
  RolePagination? _roleUsersPagination;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingRole => _isLoadingRole;
  bool get isCreating => _isCreating;
  bool get isUpdating => _isUpdating;
  bool get isDeleting => _isDeleting;
  bool get isLoadingTemplates => _isLoadingTemplates;
  bool get isLoadingRoleUsers => _isLoadingRoleUsers;
  String? get error => _error;
  List<RoleModel> get roles => _roles;
  RoleModel? get selectedRole => _selectedRole;
  RolePagination? get pagination => _pagination;
  List<PermissionTemplate> get permissionTemplates => _permissionTemplates;
  List<RoleUserModel> get roleUsers => _roleUsers;
  RolePagination? get roleUsersPagination => _roleUsersPagination;

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setLoadingRole(bool value) {
    _isLoadingRole = value;
    notifyListeners();
  }

  void _setCreating(bool value) {
    _isCreating = value;
    notifyListeners();
  }

  void _setUpdating(bool value) {
    _isUpdating = value;
    notifyListeners();
  }

  void _setDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }

  void _setLoadingTemplates(bool value) {
    _isLoadingTemplates = value;
    notifyListeners();
  }

  void _setLoadingRoleUsers(bool value) {
    _isLoadingRoleUsers = value;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  /// Get access token with proactive refresh
  Future<String?> _getAccessToken(BuildContext context) async {
    try {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      if (authViewModel.tokens?.isAccessTokenExpired == true) {
        print('Token is expired, refreshing proactively...');
        final refreshed = await authViewModel.refreshAccessToken();
        if (!refreshed) {
          _setError('Token refresh failed. Please login again.');
          return null;
        }
      }

      if (authViewModel.accessToken != null) {
        return authViewModel.accessToken;
      }

      _setError('No authentication token found. Please login again.');
      return null;
    } catch (e) {
      print('Error getting access token: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return null;
    }
  }

  /// List all roles with filtering and pagination
  Future<void> listRoles(
    BuildContext context, {
    int page = 1,
    int pageSize = 20,
    String? search,
    bool? isActive,
    bool? isSystemRole,
    String sortBy = 'name',
    String sortOrder = 'ASC',
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      // Build query parameters
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
        if (isActive != null) 'is_active': isActive,
        if (isSystemRole != null) 'is_system_role': isSystemRole,
        'sort_by': sortBy,
        'sort_order': sortOrder,
      };

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');

      final response = await _service.requist(
        'auth/admin/roles?$queryString',
        method: 'GET',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('List roles API response: $response');
        final rolesListResponse = RolesListResponse.fromJson(response);
        _roles = rolesListResponse.roles;
        _pagination = rolesListResponse.pagination;
      } else {
        _setError('Failed to fetch roles');
      }
    } catch (e) {
      print('Error fetching roles: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Get a single role by ID
  Future<void> getRole(BuildContext context, String roleId) async {
    _setLoadingRole(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId',
        method: 'GET',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Get role API response: $response');
        _selectedRole = RoleModel.fromJson(response);
      } else {
        _setError('Failed to fetch role');
      }
    } catch (e) {
      print('Error fetching role: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingRole(false);
    }
  }

  /// Create a new role
  Future<bool> createRole(
    BuildContext context,
    CreateRoleModel role,
  ) async {
    _setCreating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/roles',
        method: 'POST',
        body: role.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      print('Create role request: ${role.toJson()}');

      if (response != null) {
        print('Create role response: $response');
        return true;
      } else {
        _setError('Failed to create role');
        return false;
      }
    } catch (e) {
      print('Error creating role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setCreating(false);
    }
  }

  /// Update a role
  Future<bool> updateRole(
    BuildContext context,
    String roleId,
    UpdateRoleModel role,
  ) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId',
        method: 'PUT',
        body: role.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      print('Update role request: ${role.toJson()}');

      if (response != null) {
        print('Update role response: $response');
        return true;
      } else {
        _setError('Failed to update role');
        return false;
      }
    } catch (e) {
      print('Error updating role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Delete a role
  Future<bool> deleteRole(BuildContext context, String roleId) async {
    _setDeleting(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId',
        method: 'DELETE',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Delete role response: $response');
        return true;
      } else {
        _setError('Failed to delete role');
        return false;
      }
    } catch (e) {
      print('Error deleting role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setDeleting(false);
    }
  }

  /// Activate a role
  Future<bool> activateRole(BuildContext context, String roleId) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId/activate',
        method: 'POST',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Activate role response: $response');
        return true;
      } else {
        _setError('Failed to activate role');
        return false;
      }
    } catch (e) {
      print('Error activating role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Deactivate a role
  Future<bool> deactivateRole(BuildContext context, String roleId) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId/deactivate',
        method: 'POST',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Deactivate role response: $response');
        return true;
      } else {
        _setError('Failed to deactivate role');
        return false;
      }
    } catch (e) {
      print('Error deactivating role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Update role permissions
  Future<bool> updateRolePermissions(
    BuildContext context,
    String roleId,
    UpdateRolePermissionsModel permissions,
  ) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId/permissions',
        method: 'PUT',
        body: permissions.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      print('Update permissions request: ${permissions.toJson()}');

      if (response != null) {
        print('Update permissions response: $response');
        return true;
      } else {
        _setError('Failed to update permissions');
        return false;
      }
    } catch (e) {
      print('Error updating permissions: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Get users assigned to a role
  Future<void> getRoleUsers(
    BuildContext context,
    String roleId, {
    int page = 1,
    int pageSize = 20,
  }) async {
    _setLoadingRoleUsers(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'auth/admin/roles/$roleId/users?page=$page&page_size=$pageSize',
        method: 'GET',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Role users API response: $response');
        final roleUsersResponse = RoleUsersResponse.fromJson(response);
        _roleUsers = roleUsersResponse.users;
        _roleUsersPagination = roleUsersResponse.pagination;
      } else {
        _setError('Failed to fetch role users');
      }
    } catch (e) {
      print('Error fetching role users: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingRoleUsers(false);
    }
  }

  /// Get permission templates
  Future<void> getPermissionTemplates(BuildContext context) async {
    _setLoadingTemplates(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'auth/admin/permission-templates',
        method: 'GET',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Permission templates API response: $response');
        final templatesResponse =
            PermissionTemplatesResponse.fromJson(response);
        _permissionTemplates = templatesResponse.templates;
      } else {
        _setError('Failed to fetch permission templates');
      }
    } catch (e) {
      print('Error fetching permission templates: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingTemplates(false);
    }
  }

  /// Refresh roles list
  Future<void> refresh(BuildContext context) async {
    await listRoles(context);
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Clear selected role
  void clearSelectedRole() {
    _selectedRole = null;
    notifyListeners();
  }
}

