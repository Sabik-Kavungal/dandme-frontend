import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/config/service.dart';
import 'package:a/models/organization_model.dart';
import 'package:a/viewModels/authVM.dart';

class OrganizationViewModel extends ChangeNotifier {
  final ServiceRepo _service = ServiceRepo();

  // Private state
  bool _isLoading = false;
  bool _isAdding = false;
  String? _error;
  List<OrganizationModel> _organizations = [];

  // Getters
  bool get isLoading => _isLoading;
  bool get isAdding => _isAdding;
  String? get error => _error;
  List<OrganizationModel> get organizations => _organizations;

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setAdding(bool value) {
    _isAdding = value;
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
      final authVM = Provider.of<AuthViewModel>(context, listen: false);

      // Check if token is expired and refresh proactively
      if (authVM.tokens?.isAccessTokenExpired == true) {
        print('Token is expired, refreshing proactively...');
        final refreshed = await authVM.refreshAccessToken();
        if (!refreshed) {
          _setError('Token refresh failed. Please login again.');
          return null;
        }
      }

      // Return current token
      if (authVM.accessToken != null) {
        return authVM.accessToken;
      }

      // If no token available, user needs to login
      _setError('No authentication token found. Please login again.');
      return null;
    } catch (e) {
      print('Error getting access token: $e');
      _setError('Authentication error. Please login again.');
      return null;
    }
  }

  /// Fetch all organizations from API
  Future<void> fetchOrganizations(BuildContext context) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'organizations/organizations',
        method: 'GET',
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      if (response != null) {
        // If response is a List (direct array)
        if (response is List) {
          _organizations = response
              .map(
                (json) =>
                    OrganizationModel.fromJson(json as Map<String, dynamic>),
              )
              .toList();
        }
        // If response is a Map with 'data' field
        else if (response is Map<String, dynamic> && response['data'] != null) {
          final List<dynamic> organizationsData =
              response['data'] as List<dynamic>;
          _organizations = organizationsData
              .map(
                (json) =>
                    OrganizationModel.fromJson(json as Map<String, dynamic>),
              )
              .toList();
        } else {
          _setError('Invalid response format');
        }
      } else {
        _setError('Failed to fetch organizations');
      }
    } catch (e) {
      _setError('Error fetching organizations: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Add a new organization with admin
  Future<bool> addOrganization(
    OrganizationModel organization,
    BuildContext context,
  ) async {
    _setAdding(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'organizations/organizations/with-admin',
        method: 'POST',
        body: organization.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('response: $organization.toJson()');

      if (response != null) {
        print('response: $response');
        // Refresh the organizations list
        await fetchOrganizations(context);
        return true;
      } else {
        _setError('Failed to add organization');
        return false;
      }
    } catch (e) {
      _setError('Error adding organization: $e');
      return false;
    } finally {
      _setAdding(false);
    }
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Refresh organizations list
  Future<void> refresh(BuildContext context) async {
    await fetchOrganizations(context);
  }
}
