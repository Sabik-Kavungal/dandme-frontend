import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/organization/models/organization_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/config/service.dart';

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
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      // Check if token is expired and refresh proactively
      if (authViewModel.tokens?.isAccessTokenExpired == true) {
        print('Token is expired, refreshing proactively...');
        final refreshed = await authViewModel.refreshAccessToken();
        if (!refreshed) {
          _setError('Token refresh failed. Please login again.');
          return null;
        }
      }

      // Return current token
      if (authViewModel.accessToken != null) {
        return authViewModel.accessToken;
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
    final token = await _getAccessToken(context);
    if (token == null) return;
    await _fetchOrganizationsWithToken(token, context);
  }

  /// Internal fetch logic that doesn't rely on Context for token lookup
  Future<void> _fetchOrganizationsWithToken(
    String token,
    BuildContext? context,
  ) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _service.requist(
        'organizations',
        method: 'GET',
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      if (response != null) {
        // If response is a List (direct array)
        if (response is List) {
          _organizations = response.map((json) {
            final Map<String, dynamic> data = Map<String, dynamic>.from(
              json as Map<String, dynamic>,
            );
            // Unified ID mapping
            if (data['id'] == null && data['organization_id'] != null) {
              data['id'] = data['organization_id'];
            }
            return OrganizationModel.fromJson(data);
          }).toList();
        }
        // If response is a Map with 'data' field
        else if (response is Map<String, dynamic> && response['data'] != null) {
          final List<dynamic> organizationsData =
              response['data'] as List<dynamic>;
          _organizations = organizationsData.map((json) {
            final Map<String, dynamic> data = Map<String, dynamic>.from(
              json as Map<String, dynamic>,
            );
            // Unified ID mapping
            if (data['id'] == null && data['organization_id'] != null) {
              data['id'] = data['organization_id'];
            }
            return OrganizationModel.fromJson(data);
          }).toList();
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
        'organizations/with-admin',
        method: 'POST',
        body: organization.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('response: ${organization.toJson()}');

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

  /// Delete an organization
  Future<bool> deleteOrganization(
    String organizationId,
    BuildContext context,
  ) async {
    // Get auth view model before the async gap
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    _setLoading(true);
    _clearError();

    try {
      final token = authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'organizations/$organizationId',
        method: 'DELETE',
        useOrgApi: true,
        token: token,
        context: context,
      );

      print('Organization deletion request for ID: $organizationId');

      if (response != null) {
        print('Organization deletion response: $response');
        // Refresh the organizations list using the token we already have
        await _fetchOrganizationsWithToken(token, context);
        return true;
      } else {
        _setError('Failed to delete organization');
        return false;
      }
    } catch (e) {
      _setError('Error deleting organization: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Refresh organizations list
  Future<void> refresh(BuildContext context) async {
    await fetchOrganizations(context);
  }
}
