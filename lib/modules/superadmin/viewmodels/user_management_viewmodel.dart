import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/superadmin/models/user_model_admin.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/service.dart';

class UserManagementViewModel extends ChangeNotifier {
  final ServiceRepo _service = ServiceRepo();

  // Private state
  bool _isLoading = false;
  bool _isLoadingUser = false;
  bool _isCreating = false;
  bool _isUpdating = false;
  bool _isDeleting = false;
  bool _isLoadingLogs = false;
  String? _error;
  List<UserModelAdmin> _users = [];
  UserModelAdmin? _selectedUser;
  UserPaginationAdmin? _pagination;
  List<UserActivityLogAdmin> _activityLogs = [];
  UserPaginationAdmin? _logsPagination;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingUser => _isLoadingUser;
  bool get isCreating => _isCreating;
  bool get isUpdating => _isUpdating;
  bool get isDeleting => _isDeleting;
  bool get isLoadingLogs => _isLoadingLogs;
  String? get error => _error;
  List<UserModelAdmin> get users => _users;
  UserModelAdmin? get selectedUser => _selectedUser;
  UserPaginationAdmin? get pagination => _pagination;
  List<UserActivityLogAdmin> get activityLogs => _activityLogs;
  UserPaginationAdmin? get logsPagination => _logsPagination;

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setLoadingUser(bool value) {
    _isLoadingUser = value;
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

  void _setLoadingLogs(bool value) {
    _isLoadingLogs = value;
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

  /// List all users with filtering and pagination
  Future<void> listUsers(
    BuildContext context, {
    int page = 1,
    int pageSize = 20,
    String? search,
    String? role,
    bool? isActive,
    bool? isBlocked,
    String sortBy = 'created_at',
    String sortOrder = 'DESC',
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
        if (role != null && role.isNotEmpty) 'role': role,
        if (isActive != null) 'is_active': isActive,
        if (isBlocked != null) 'is_blocked': isBlocked,
        'sort_by': sortBy,
        'sort_order': sortOrder,
      };

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');

      final response = await _service.requist(
        'auth/admin/users?$queryString',
        method: 'GET',
        useOrgApi: false, // Use auth API
        token: token,
        context: context,
      );

      if (response != null) {
        print('List users API response: $response');
        final usersListResponse = UsersListResponseAdmin.fromJson(response);
        _users = usersListResponse.users;
        _pagination = usersListResponse.pagination;
      } else {
        _setError('Failed to fetch users');
      }
    } catch (e) {
      print('Error fetching users: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Get a single user by ID
  Future<void> getUser(BuildContext context, String userId) async {
    _setLoadingUser(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'auth/admin/users/$userId',
        method: 'GET',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Get user API response: $response');
        _selectedUser = UserModelAdmin.fromJson(response);
      } else {
        _setError('Failed to fetch user');
      }
    } catch (e) {
      print('Error fetching user: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingUser(false);
    }
  }

  /// Create a new user
  Future<bool> createUser(
    BuildContext context,
    CreateUserModelAdmin user,
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
        'auth/admin/users',
        method: 'POST',
        body: user.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      print('Create user request: ${user.toJson()}');

      if (response != null) {
        print('Create user response: $response');
        return true;
      } else {
        _setError('Failed to create user');
        return false;
      }
    } catch (e) {
      print('Error creating user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setCreating(false);
    }
  }

  /// Update a user
  Future<bool> updateUser(
    BuildContext context,
    String userId,
    UpdateUserModelAdmin user,
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
        'auth/admin/users/$userId',
        method: 'PUT',
        body: user.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      print('Update user request: ${user.toJson()}');

      if (response != null) {
        print('Update user response: $response');
        return true;
      } else {
        _setError('Failed to update user');
        return false;
      }
    } catch (e) {
      print('Error updating user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Delete a user
  Future<bool> deleteUser(BuildContext context, String userId) async {
    _setDeleting(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/users/$userId',
        method: 'DELETE',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Delete user response: $response');
        return true;
      } else {
        _setError('Failed to delete user');
        return false;
      }
    } catch (e) {
      print('Error deleting user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setDeleting(false);
    }
  }

  /// Block a user
  Future<bool> blockUser(
    BuildContext context,
    String userId,
    String reason,
  ) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final blockModel = BlockUserModelAdmin(reason: reason);
      final response = await _service.requist(
        'auth/admin/users/$userId/block',
        method: 'POST',
        body: blockModel.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Block user response: $response');
        return true;
      } else {
        _setError('Failed to block user');
        return false;
      }
    } catch (e) {
      print('Error blocking user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Unblock a user
  Future<bool> unblockUser(BuildContext context, String userId) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/users/$userId/unblock',
        method: 'POST',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Unblock user response: $response');
        return true;
      } else {
        _setError('Failed to unblock user');
        return false;
      }
    } catch (e) {
      print('Error unblocking user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Activate a user
  Future<bool> activateUser(BuildContext context, String userId) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/users/$userId/activate',
        method: 'POST',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Activate user response: $response');
        return true;
      } else {
        _setError('Failed to activate user');
        return false;
      }
    } catch (e) {
      print('Error activating user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Deactivate a user
  Future<bool> deactivateUser(BuildContext context, String userId) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'auth/admin/users/$userId/deactivate',
        method: 'POST',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Deactivate user response: $response');
        return true;
      } else {
        _setError('Failed to deactivate user');
        return false;
      }
    } catch (e) {
      print('Error deactivating user: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Change user password (admin)
  Future<bool> adminChangePassword(
    BuildContext context,
    String userId,
    String newPassword,
  ) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final passwordModel = AdminChangePasswordModelAdmin(
        newPassword: newPassword,
      );
      final response = await _service.requist(
        'auth/admin/users/$userId/change-password',
        method: 'POST',
        body: passwordModel.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Change password response: $response');
        return true;
      } else {
        _setError('Failed to change password');
        return false;
      }
    } catch (e) {
      print('Error changing password: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Assign a role to a user
  Future<bool> assignRole(
    BuildContext context,
    String userId,
    AssignRoleModelAdmin roleModel,
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
        'auth/admin/users/$userId/roles',
        method: 'POST',
        body: roleModel.toJson(),
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Assign role response: $response');
        return true;
      } else {
        _setError('Failed to assign role');
        return false;
      }
    } catch (e) {
      print('Error assigning role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Remove a role from a user
  Future<bool> removeRole(
    BuildContext context,
    String userId,
    String roleId,
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
        'auth/admin/users/$userId/roles/$roleId',
        method: 'DELETE',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Remove role response: $response');
        return true;
      } else {
        _setError('Failed to remove role');
        return false;
      }
    } catch (e) {
      print('Error removing role: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Get user activity logs
  Future<void> getUserActivityLogs(
    BuildContext context,
    String userId, {
    int page = 1,
    int pageSize = 50,
  }) async {
    _setLoadingLogs(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'auth/admin/users/$userId/activity-logs?page=$page&page_size=$pageSize',
        method: 'GET',
        useOrgApi: false,
        token: token,
        context: context,
      );

      if (response != null) {
        print('Activity logs API response: $response');
        final logsResponse = ActivityLogsResponseAdmin.fromJson(response);
        _activityLogs = logsResponse.logs;
        _logsPagination = logsResponse.pagination;
      } else {
        _setError('Failed to fetch activity logs');
      }
    } catch (e) {
      print('Error fetching activity logs: $e');
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingLogs(false);
    }
  }

  /// Refresh users list
  Future<void> refresh(BuildContext context) async {
    await listUsers(context);
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Clear selected user
  void clearSelectedUser() {
    _selectedUser = null;
    notifyListeners();
  }
}
