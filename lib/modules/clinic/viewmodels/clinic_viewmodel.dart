import 'package:drandme/core/utils/loading_manager.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_doctor_link_model.dart';
import 'package:drandme/modules/clinic/models/clinic_model.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/config/service.dart';

import 'package:image_picker/image_picker.dart';

class ClinicViewModel extends ChangeNotifier {
  final ServiceRepo _service = ServiceRepo();

  // Private state
  bool _isLoading = false;
  bool _isAdding = false;
  bool _isLinking = false;
  bool _isLoadingLinks = false;
  String? _error;
  List<ClinicModel> _clinics = [];
  List<ClinicDoctorLinkResponse> _clinicDoctorLinks = [];

  // Getters
  bool get isLoading => _isLoading;
  bool get isAdding => _isAdding;
  bool get isLinking => _isLinking;
  bool get isLoadingLinks => _isLoadingLinks;
  String? get error => _error;
  List<ClinicModel> get clinics => _clinics;
  List<ClinicDoctorLinkResponse> get clinicDoctorLinks => _clinicDoctorLinks;

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    if (value) {
      LoadingManager.show();
    } else {
      LoadingManager.hide();
    }
    notifyListeners();
  }

  void _setAdding(bool value) {
    _isAdding = value;
    if (value) {
      LoadingManager.show(message: "Adding Clinic...");
    } else {
      LoadingManager.hide();
    }
    notifyListeners();
  }

  void _setLinking(bool value) {
    _isLinking = value;
    if (value) {
      LoadingManager.show(message: "Linking Doctor...");
    } else {
      LoadingManager.hide();
    }
    notifyListeners();
  }

  void _setLoadingLinks(bool value) {
    _isLoadingLinks = value;
    if (value) {
      LoadingManager.show();
    } else {
      LoadingManager.hide();
    }
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
      _setError(AppHelpers.getErrorMessage(e));
      return null;
    }
  }

  /// Fetch all clinics from API
  Future<void> fetchClinics(BuildContext context) async {
    final token = await _getAccessToken(context);
    if (token == null) return;
    await _fetchClinicsWithToken(token, context);
  }

  /// Internal fetch logic that doesn't rely on Context for token lookup
  Future<void> _fetchClinicsWithToken(
    String token,
    BuildContext? context,
  ) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _service.requist(
        'clinics',
        method: 'GET',
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      if (response != null) {
        print('Clinic API response: $response');
        print('Response type: ${response.runtimeType}');

        // If response is a List (direct array)
        if (response is List) {
          print('Processing list response with ${response.length} items');
          try {
            _clinics = response.map((json) {
              final Map<String, dynamic> data = Map<String, dynamic>.from(
                json as Map<String, dynamic>,
              );
              // Unified ID mapping
              if (data['id'] == null && data['clinic_id'] != null) {
                data['id'] = data['clinic_id'];
              }
              return ClinicModel.fromJson(data);
            }).toList();
            print('Successfully parsed ${_clinics.length} clinics into the list.');
            for (var clinic in _clinics) {
              print('Clinic in list: ${clinic.name} (${clinic.id})');
            }
          } catch (e) {
            print('Error parsing clinic list: $e');
            _setError('Error parsing clinic data: $e');
            return;
          }
        }
        // If response is a Map with 'data' field
        else if (response is Map<String, dynamic> && response['data'] != null) {
          print('Processing data field response');
          final List<dynamic> clinicsData = response['data'] as List<dynamic>;
          try {
            _clinics = clinicsData.map((json) {
              final Map<String, dynamic> data = Map<String, dynamic>.from(
                json as Map<String, dynamic>,
              );
              // Unified ID mapping
              if (data['id'] == null && data['clinic_id'] != null) {
                data['id'] = data['clinic_id'];
              }
              return ClinicModel.fromJson(data);
            }).toList();
            print(
              'Successfully parsed ${_clinics.length} clinics from data field into the list.',
            );
            for (var clinic in _clinics) {
              print('Clinic in list: ${clinic.name} (${clinic.id})');
            }
          } catch (e) {
            print('Error parsing clinic data field: $e');
            _setError('Error parsing clinic data: $e');
            return;
          }
        } else {
          print('Invalid response format: $response');
          _setError('Invalid response format');
        }
      } else {
        print('No response received from clinic API');
        _setError('Failed to fetch clinics');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Add a new clinic with admin
  Future<bool> addClinic(
    CreateClinicModel clinic,
    XFile? logo,
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

      // Convert model to map for fields
      final Map<String, dynamic> clinicMap = clinic.toJson();
      final Map<String, String> fields = {};

      clinicMap.forEach((key, value) {
        if (value != null) {
          fields[key] = value.toString();
        }
      });

      // Prepare files map
      final Map<String, XFile>? files;
      if (logo != null) {
        files = {'logo': logo};
      } else {
        files = null;
      }

      final response = await _service.multipart(
        'clinics/with-admin',
        method: 'POST',
        fields: fields,
        files: files,
        useOrgApi: true,
        token: token,
        context: context,
      );

      print('Clinic creation request with logo: ${clinic.toJson()}');

      if (response != null) {
        print('Clinic creation SUCCESS response: $response');
        // Refresh the clinics list
        await fetchClinics(context);
        return true;
      } else {
        print('Clinic creation FAILED: Response was null or error occurred');
        _setError('Failed to add clinic');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setAdding(false);
    }
  }

  /// Update an existing clinic
  Future<bool> updateClinic(
    String clinicId,
    Map<String, dynamic> updateData,
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
        'clinics/$clinicId',
        method: 'PUT',
        body: updateData,
        useOrgApi: true,
        token: token,
        context: context,
      );

      print('Clinic update request: $updateData');

      if (response != null) {
        print('Clinic update response: $response');
        // Refresh the clinics list
        await fetchClinics(context);
        return true;
      } else {
        _setError('Failed to update clinic');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setAdding(false);
    }
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Add clinic-doctor links
  Future<bool> addClinicDoctorLinks(
    CreateClinicDoctorLinkModel links,
    BuildContext context,
  ) async {
    _setLinking(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'clinic-doctor-links',
        method: 'POST',
        body: links.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('Clinic-Doctor Link creation request: ${links.toJson()}');

      if (response != null) {
        print('Clinic-Doctor Link creation response: $response');
        // Refresh the links list
        await fetchClinicDoctorLinks(context);
        return true;
      } else {
        _setError('Failed to add clinic-doctor links');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setLinking(false);
    }
  }

  /// Add clinic-doctor link with simple API format (without fees)
  Future<bool> addClinicDoctorLinkSimple(
    String clinicId,
    String doctorId,
    BuildContext context, {
    String? departmentId,
  }) async {
    _setLinking(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      // Create the simple API body format
      final body = <String, dynamic>{
        "clinic_id": clinicId,
        "doctor_id": doctorId,
      };

      // Include department_id if provided
      if (departmentId != null && departmentId.isNotEmpty) {
        body["department_id"] = departmentId;
      }

      final response = await _service.requist(
        'clinic-doctor-links',
        method: 'POST',
        body: body,
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('Simple Clinic-Doctor Link creation request: $body');

      if (response != null) {
        print('Simple Clinic-Doctor Link creation response: $response');
        // Refresh the links list
        await fetchClinicDoctorLinks(context);
        return true;
      } else {
        _setError('Failed to add clinic-doctor link');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setLinking(false);
    }
  }

  /// Add clinic-doctor link with fees
  Future<bool> addClinicDoctorLinkWithFees(
    CreateClinicDoctorLinkWithFees linkData,
    BuildContext context,
  ) async {
    _setLinking(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'clinic-doctor-links',
        method: 'POST',
        body: linkData.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print(
        'Clinic-Doctor Link with Fees creation request: ${linkData.toJson()}',
      );

      if (response != null) {
        print('Clinic-Doctor Link with Fees creation response: $response');
        // Refresh the links list
        await fetchClinicDoctorLinks(context);
        return true;
      } else {
        _setError('Failed to add clinic-doctor link');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setLinking(false);
    }
  }

  /// Update clinic-doctor link fees
  Future<bool> updateClinicDoctorLinkFees(
    String linkId,
    UpdateClinicDoctorLinkFees updateData,
    BuildContext context,
  ) async {
    _setLinking(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'clinic-doctor-links/$linkId',
        method: 'PUT',
        body: updateData.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('Update Clinic-Doctor Link Fees request: ${updateData.toJson()}');

      if (response != null) {
        print('Update Clinic-Doctor Link Fees response: $response');
        // Refresh the links list
        await fetchClinicDoctorLinks(context);
        return true;
      } else {
        _setError('Failed to update clinic-doctor link fees');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setLinking(false);
    }
  }

  /// Fetch all clinic-doctor links from API
  Future<void> fetchClinicDoctorLinks(BuildContext context) async {
    _setLoadingLinks(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'clinic-doctor-links',
        method: 'GET',
        useOrgApi: true,
        token: token,
        context: context,
      );

      if (response != null) {
        List<dynamic> linksData = [];

        if (response is List) {
          linksData = response;
        } else if (response is Map<String, dynamic>) {
          linksData = response['links'] ?? response['data'] ?? [];
        }

        if (linksData.isNotEmpty) {
          try {
            _clinicDoctorLinks = linksData.map((json) {
              return ClinicDoctorLinkResponse.fromJson(
                json as Map<String, dynamic>,
              );
            }).toList();
          } catch (e) {
            print('Error parsing links: $e');
            _setError('Error parsing clinic-doctor links data: $e');
          }
        } else {
          _clinicDoctorLinks = [];
        }
      } else {
        _setError('Failed to fetch clinic-doctor links');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingLinks(false);
    }
  }

  /// Delete a clinic
  Future<bool> deleteClinic(String clinicId, BuildContext context) async {
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
        'clinics/$clinicId',
        method: 'DELETE',
        useOrgApi: true,
        token: token,
        context: context,
      );

      print('Clinic deletion request for ID: $clinicId');

      if (response != null) {
        print('Clinic deletion response: $response');
        // Refresh the clinics list using the token we already have
        await _fetchClinicsWithToken(token, context);
        return true;
      } else {
        _setError('Failed to delete clinic');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Refresh clinics list
  Future<void> refresh(BuildContext context) async {
    await fetchClinics(context);
  }

  /// Refresh clinic-doctor links list
  Future<void> refreshLinks(BuildContext context) async {
    await fetchClinicDoctorLinks(context);
  }
}
