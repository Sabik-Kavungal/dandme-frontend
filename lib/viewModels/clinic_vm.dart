import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/config/service.dart';
import 'package:a/models/clinic_model.dart';
import 'package:a/models/clinic_doctor_link_model.dart';

import 'package:a/viewModels/authVM.dart';

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
    notifyListeners();
  }

  void _setAdding(bool value) {
    _isAdding = value;
    notifyListeners();
  }

  void _setLinking(bool value) {
    _isLinking = value;
    notifyListeners();
  }

  void _setLoadingLinks(bool value) {
    _isLoadingLinks = value;
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

  /// Fetch all clinics from API
  Future<void> fetchClinics(BuildContext context) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'organizations/clinics',
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
              print('Processing clinic item: $json');
              return ClinicModel.fromJson(json as Map<String, dynamic>);
            }).toList();
            print('Successfully parsed ${_clinics.length} clinics');
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
              print('Processing clinic item from data: $json');
              return ClinicModel.fromJson(json as Map<String, dynamic>);
            }).toList();
            print(
              'Successfully parsed ${_clinics.length} clinics from data field',
            );
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
      _setError('Error fetching clinics: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Add a new clinic with admin
  Future<bool> addClinic(CreateClinicModel clinic, BuildContext context) async {
    _setAdding(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'organizations/clinics/with-admin',
        method: 'POST',
        body: clinic.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('Clinic creation request: ${clinic.toJson()}');

      if (response != null) {
        print('Clinic creation response: $response');
        // Refresh the clinics list
        await fetchClinics(context);
        return true;
      } else {
        _setError('Failed to add clinic');
        return false;
      }
    } catch (e) {
      _setError('Error adding clinic: $e');
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
        'organizations/clinic-doctor-links',
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
      _setError('Error adding clinic-doctor links: $e');
      return false;
    } finally {
      _setLinking(false);
    }
  }

  /// Add clinic-doctor link with simple API format
  Future<bool> addClinicDoctorLinkSimple(
    String clinicId,
    String doctorId,
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

      // Create the simple API body format
      final body = {"clinic_id": clinicId, "doctor_id": doctorId};

      final response = await _service.requist(
        'organizations/clinic-doctor-links',
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
      _setError('Error adding clinic-doctor link: $e');
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
        'organizations/clinic-doctor-links',
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
      _setError('Error fetching clinic-doctor links: $e');
    } finally {
      _setLoadingLinks(false);
    }
  }

  //   try {
  //     final token = await _getAccessToken(context);
  //     if (token == null) {
  //       _setError('Authentication required. Please login again.');
  //       return;
  //     }

  //     final response = await _service.requist(
  //       'organizations/clinic-doctor-links',
  //       method: 'GET',
  //       useOrgApi: true, // Use organization API
  //       token: token,
  //       context: context,
  //     );

  //     if (response != null) {
  //       print('Clinic-Doctor Links API response: $response');
  //       print('Response type: ${response.runtimeType}');

  //       // If response is a List (direct array)
  //       if (response is List) {
  //         print('Processing list response with ${response.length} items');
  //         try {
  //           _clinicDoctorLinks = response.map((json) {
  //             print('Processing link item: $json');
  //             return ClinicDoctorLinkModel.fromJson(
  //               json as Map<String, dynamic>,
  //             );
  //           }).toList();
  //           print(
  //             'Successfully parsed ${_clinicDoctorLinks.length} clinic-doctor links',
  //           );
  //         } catch (e) {
  //           print('Error parsing clinic-doctor links list: $e');
  //           _setError('Error parsing clinic-doctor links data: $e');
  //           return;
  //         }
  //       }
  //       // If response is a Map with 'data' field
  //       else if (response is Map<String, dynamic> && response['data'] != null) {
  //         print('Processing data field response');
  //         final List<dynamic> linksData = response['data'] as List<dynamic>;
  //         try {
  //           _clinicDoctorLinks = linksData.map((json) {
  //             print('Processing link item from data: $json');
  //             return ClinicDoctorLinkModel.fromJson(
  //               json as Map<String, dynamic>,
  //             );
  //           }).toList();
  //           print(
  //             'Successfully parsed ${_clinicDoctorLinks.length} clinic-doctor links from data field',
  //           );
  //         } catch (e) {
  //           print('Error parsing clinic-doctor links data field: $e');
  //           _setError('Error parsing clinic-doctor links data: $e');
  //           return;
  //         }
  //       } else {
  //         print('Invalid response format: $response');
  //         _setError('Invalid response format');
  //       }
  //     } else {
  //       print('No response received from clinic-doctor links API');
  //       _setError('Failed to fetch clinic-doctor links');
  //     }
  //   } catch (e) {
  //     _setError('Error fetching clinic-doctor links: $e');
  //   } finally {
  //     _setLoadingLinks(false);
  //   }
  // }

  /// Refresh clinics list
  Future<void> refresh(BuildContext context) async {
    await fetchClinics(context);
  }

  /// Refresh clinic-doctor links list
  Future<void> refreshLinks(BuildContext context) async {
    await fetchClinicDoctorLinks(context);
  }
}
