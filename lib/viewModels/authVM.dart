import 'package:a/config/localDB.dart';
import 'package:a/config/service.dart';
import 'package:a/models/user_model.dart';
import 'package:flutter/material.dart';

/// Optimized Auth ViewModel with clean architecture and reusable methods
class AuthViewModel extends ChangeNotifier {
  // Dependencies
  final ServiceRepo _service = ServiceRepo();
  final LocalDatabaseService _db = LocalDatabaseService();

  // Private state
  bool _loading = false;
  bool _isRefreshing = false;
  bool _disposed = false;
  TokenModel? _tokens;
  UserModel? _user;
  LoginResponse? _loginResponse;

  // Getters
  bool get isLoading => _loading;
  bool get isRefreshing => _isRefreshing;
  TokenModel? get tokens => _tokens;
  UserModel? get user => _user;
  LoginResponse? get loginResponse => _loginResponse;
  bool get isAuthenticated {
    final isValid = _tokens?.isValid == true;
    final isNotExpired = _tokens?.isAccessTokenExpired != true;
    final result = isValid && isNotExpired;

    print(
      'isAuthenticated check: isValid=$isValid, isNotExpired=$isNotExpired, result=$result',
    );
    print('Tokens: ${_tokens?.toJson()}');

    // Debug token expiration details
    if (_tokens != null) {
      print('Access token: ${_tokens!.accessToken?.substring(0, 20)}...');
      print('Refresh token: ${_tokens!.refreshToken?.substring(0, 20)}...');
      print('Token expiration: ${_tokens!.accessTokenExpiration}');
      print('Time until expires: ${_tokens!.timeUntilAccessTokenExpires}');
    }

    return result;
  }

  String? get accessToken => _tokens?.accessToken;
  String? get refreshToken => _tokens?.refreshToken;

  /// Get user role directly from LoginResponse (primary role)
  String? get userRole => _loginResponse?.primaryRole?.name ?? _user?.role;

  // Private helper methods
  void _setLoading(bool value) {
    if (_disposed) return;
    _loading = value;
    _safeNotifyListeners();
  }

  void _setRefreshing(bool value) {
    if (_disposed) return;
    _isRefreshing = value;
    _safeNotifyListeners();
  }

  /// Safely notify listeners, checking if disposed
  void _safeNotifyListeners() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  /// Centralized error handling and user feedback
  void _handleError(BuildContext context, String operation, dynamic error) {
    final message = error is String ? error : 'Error during $operation: $error';
    _showSnack(context, message, Colors.red);
    print('❌ $operation failed: $error');
  }

  /// Centralized success feedback
  void _handleSuccess(BuildContext context, String message) {
    _showSnack(context, message, Colors.green);
    print('✅ $message');
  }

  /// Show snackbar with consistent styling
  void _showSnack(BuildContext context, String msg, Color color) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: color,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  /// Save tokens and user data to local storage
  Future<void> _saveAuthData() async {
    try {
      final box = await _db.openBox<dynamic>("token");

      // Save tokens
      await _db.toDb(box, "accessToken", _tokens?.accessToken);
      await _db.toDb(box, "refreshToken", _tokens?.refreshToken);
      await _db.toDb(box, "userId", _tokens?.userId);

      // Save user data
      if (_user != null) {
        await _db.toDb(box, "userRole", _user!.role);
        await _db.toDb(box, "userRoleId", _user!.roleId);
        await _db.toDb(box, "userFirstName", _user!.firstName);
        await _db.toDb(box, "userLastName", _user!.lastName);
        await _db.toDb(box, "userEmail", _user!.email);
        await _db.toDb(box, "userUsername", _user!.username);
        await _db.toDb(box, "userPhone", _user!.phone);
        await _db.toDb(box, "userOrganizationId", _user!.organizationId);
        await _db.toDb(box, "userClinicId", _user!.clinicId);
        await _db.toDb(box, "userServiceId", _user!.serviceId);
      }
    } catch (e) {
      // Don't rethrow to prevent login failure due to storage issues
    }
  }

  /// Load auth data from local storage
  Future<void> _loadAuthData() async {
    try {
      final box = await _db.openBox<dynamic>("token");

      // Load tokens
      final accessToken = _db.fromDb(box, "accessToken") as String?;
      final refreshToken = _db.fromDb(box, "refreshToken") as String?;
      final userId = _db.fromDb(box, "userId") as String?;

      if (accessToken != null && refreshToken != null) {
        _tokens = TokenModel(
          accessToken: accessToken,
          refreshToken: refreshToken,
          userId: userId,
        );

        // Load user data
        _user = UserModel(
          id: userId,
          firstName: _db.fromDb(box, "userFirstName") as String?,
          lastName: _db.fromDb(box, "userLastName") as String?,
          email: _db.fromDb(box, "userEmail") as String?,
          username: _db.fromDb(box, "userUsername") as String?,
          phone: _db.fromDb(box, "userPhone") as String?,
          role: _db.fromDb(box, "userRole") as String?,
          roleId: _db.fromDb(box, "userRoleId") as String?,
          organizationId: _db.fromDb(box, "userOrganizationId") as String?,
          clinicId: _db.fromDb(box, "userClinicId") as String?,
          serviceId: _db.fromDb(box, "userServiceId") as String?,
        );

        _safeNotifyListeners();
      }
    } catch (e) {
      _clearAuthData();
    }
  }

  /// Clear all auth data
  void _clearAuthData() {
    _tokens = null;
    _user = null;
    _loginResponse = null;
    notifyListeners();
  }

  /// Clear tokens from storage
  Future<void> _clearStoredTokens() async {
    try {
      await _db.clearBox("token");
    } catch (e) {
      // Silent fail for storage cleanup
    }
  }

  // Public methods

  /// Initialize auth state by loading from storage
  Future<void> initialize() async {
    await _loadAuthData();
  }

  /// Register new user
  Future<bool> register(Map<String, dynamic> body, BuildContext context) async {
    _setLoading(true);
    try {
      final response = await _service.requist(
        "auth/register",
        method: "POST",
        body: body,
      );

      if (response != null) {
        final authRes = AuthResponse.fromJson(response);

        if (authRes.isValid) {
          _user = authRes.user;
          _tokens = authRes.toTokenModel();
          await _saveAuthData();
          _handleSuccess(context, "Registered successfully");
          return true;
        }
      }

      _handleError(context, "Registration", "Invalid response");
      return false;
    } catch (e) {
      _handleError(context, "Registration", e);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Login user
  Future<bool> login(
    String login,
    String password,
    BuildContext context,
  ) async {
    _setLoading(true);
    try {
      final response = await _service.requist(
        "auth/login",
        method: "POST",
        body: {"login": login, "password": password},
      );

      if (response != null) {
        print('Login response received: $response');
        final loginResponse = LoginResponse.fromJson(response);
        print('LoginResponse parsed: ${loginResponse.toJson()}');
        print('LoginResponse isValid: ${loginResponse.isValid}');

        if (loginResponse.isValid) {
          _tokens = loginResponse.toTokenModel();
          _user = loginResponse.toUserModel();
          _loginResponse = loginResponse;

          print('Tokens set: ${_tokens?.toJson()}');
          print('User set: ${_user?.toJson()}');
          print('isAuthenticated: $isAuthenticated');

          await _saveAuthData();

          final roleMessage = userRole != null
              ? "Login successful as $userRole"
              : "Login successful";

          _handleSuccess(context, roleMessage);

          // Force notify listeners to trigger UI rebuild
          _safeNotifyListeners();

          // Additional safety: Force another notification after a small delay
          // This ensures the UI rebuilds even if there are timing issues
          Future.delayed(const Duration(milliseconds: 100), () {
            _safeNotifyListeners();
          });

          print('After notifyListeners - isAuthenticated: $isAuthenticated');

          return true;
        }
      }

      _handleError(context, "Login", "Invalid credentials");
      return false;
    } catch (e) {
      _handleError(context, "Login", e);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Refresh access token
  Future<bool> refreshAccessToken() async {
    if (_isRefreshing) return false;

    if (_tokens?.hasRefreshToken != true) {
      return false;
    }

    _setRefreshing(true);

    try {
      final response = await _service.requist(
        "auth/refresh",
        method: "POST",
        body: {"refresh_token": _tokens!.refreshToken},
        token: _tokens!.refreshToken,
      );

      if (response != null) {
        final newTokens = TokenModel.fromJson(response);
        _tokens = newTokens.copyWith(userId: _tokens?.userId);
        await _saveAuthData();
        _safeNotifyListeners();
        return true;
      }

      return false;
    } catch (e) {
      await _clearStoredTokens();
      _clearAuthData();
      return false;
    } finally {
      _setRefreshing(false);
    }
  }

  /// Logout user
  Future<void> logout(BuildContext context) async {
    _setLoading(true);
    try {
      // Attempt server logout if refresh token is available
      if (_tokens?.hasRefreshToken == true) {
        try {
          await _service.requist(
            "auth/logout",
            method: "POST",
            body: {"refresh_token": _tokens!.refreshToken},
          );
        } catch (e) {
          // Continue with local logout even if server logout fails
        }
      }

      // Clear local data
      await _clearStoredTokens();
      _clearAuthData();
      _handleSuccess(context, "Logged out successfully");
    } catch (e) {
      _handleError(context, "Logout", e);
    } finally {
      _setLoading(false);
    }
  }

  /// Get user profile
  Future<bool> getProfile(BuildContext context) async {
    if (!isAuthenticated) {
      _handleError(context, "Profile fetch", "Not logged in");
      return false;
    }

    _setLoading(true);
    try {
      final response = await _service.requist(
        "auth/profile",
        method: "GET",
        token: _tokens!.accessToken,
      );

      if (response != null) {
        _user = UserModel.fromJson(response);
        await _saveAuthData();
        _safeNotifyListeners();
        return true;
      }

      _handleError(context, "Profile fetch", "No response from server");
      return false;
    } catch (e) {
      _handleError(context, "Profile fetch", e);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Update user profile
  Future<bool> updateProfile(
    Map<String, dynamic> profileData,
    BuildContext context,
  ) async {
    if (!isAuthenticated) {
      _handleError(context, "Profile update", "Not logged in");
      return false;
    }

    _setLoading(true);
    try {
      final response = await _service.requist(
        "auth/profile",
        method: "PUT",
        body: profileData,
        token: _tokens!.accessToken,
      );

      if (response != null) {
        _user = UserModel.fromJson(response);
        await _saveAuthData(); // Save updated profile data

        _handleSuccess(context, "Profile updated successfully");
        _safeNotifyListeners();
        return true;
      }

      _handleError(context, "Profile update", "Failed to update profile");
      return false;
    } catch (e) {
      _handleError(context, "Profile update", e);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Check if user has specific role
  bool hasRole(String roleName) {
    return _user?.hasRole(roleName) ?? false;
  }

  /// Check if user has specific permission
  bool hasPermission(String permission) {
    return _user?.role !=
        null; // Simplified - could be enhanced with role permissions
  }

  /// Get user's organizational context
  Map<String, String?> get organizationalContext =>
      _user?.organizationalContext ?? {};

  // Debugging methods (can be removed in production)

  /// Manual refresh token for testing
  Future<bool> manualRefreshToken() async {
    return await refreshAccessToken();
  }

  /// Test profile endpoint
  Future<void> testProfileEndpoint(BuildContext context) async {
    if (!isAuthenticated) {
      _handleError(context, "Profile test", "Not logged in");
      return;
    }

    try {
      final response = await _service.requist(
        "auth/profile",
        method: "GET",
        token: _tokens!.accessToken,
      );

      if (response != null) {
        _user = UserModel.fromJson(response);
        _handleSuccess(context, "Profile endpoint working! ✅");
        _safeNotifyListeners();
      } else {
        _handleError(context, "Profile test", "Profile endpoint failed ❌");
      }
    } catch (e) {
      _handleError(context, "Profile test", e);
    }
  }

  /// Show user role information dialog
  void showUserRoleInfo(BuildContext context) {
    if (_user == null) {
      _handleError(context, "Role info", "No user data available");
      return;
    }

    final roleInfo =
        '''
User Information:
• Name: ${_user!.fullName}
• Email: ${_user!.email ?? 'Not provided'}
• Username: ${_user!.username ?? 'Not provided'}

Role Information:
• Primary Role: ${_user!.role ?? 'Not assigned'}
• Role ID: ${_user!.roleId ?? 'Not assigned'}
• Organization: ${_user!.organizationId ?? 'Not assigned'}
• Clinic: ${_user!.clinicId ?? 'Not assigned'}
• Service: ${_user!.serviceId ?? 'Not assigned'}

Status:
• Active: ${_user!.isUserActive ? 'Yes' : 'No'}
• Valid Email: ${_user!.hasValidEmail ? 'Yes' : 'No'}
• Valid Phone: ${_user!.hasValidPhone ? 'Yes' : 'No'}
    ''';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('User & Role Information'),
        content: SingleChildScrollView(child: Text(roleInfo)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show token storage information dialog
  Future<void> showTokenStorageInfo(BuildContext context) async {
    try {
      await _db.openBox<dynamic>("token");

      final storageInfo =
          '''
Token Storage Contents:
• Access Token: ${_tokens?.hasAccessToken == true ? 'Present' : 'Not found'}
• Refresh Token: ${_tokens?.hasRefreshToken == true ? 'Present' : 'Not found'}
• User ID: ${_tokens?.userId ?? 'Not found'}

User Data in Storage:
• Role: ${_user?.role ?? 'Not found'}
• Role ID: ${_user?.roleId ?? 'Not found'}
• First Name: ${_user?.firstName ?? 'Not found'}
• Last Name: ${_user?.lastName ?? 'Not found'}
• Email: ${_user?.email ?? 'Not found'}
• Username: ${_user?.username ?? 'Not found'}
      ''';

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Token Storage Contents'),
          content: SingleChildScrollView(child: Text(storageInfo)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      _handleError(context, "Storage check", e);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
