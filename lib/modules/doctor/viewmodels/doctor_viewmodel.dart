import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/doctor/models/doctor_model.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/service.dart';

class DoctorViewModel extends ChangeNotifier {
  final ServiceRepo _service = ServiceRepo();

  // Private state
  bool _isLoading = false;
  bool _isAdding = false;
  String? _error;
  List<DoctorModel> _doctors = [];

  // Getters
  bool get isLoading => _isLoading;
  bool get isAdding => _isAdding;
  String? get error => _error;
  List<DoctorModel> get doctors => _doctors;

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
      _setError(AppHelpers.getErrorMessage(e));
      return null;
    }
  }

  /// Fetch all doctors from API
  Future<void> fetchDoctors(BuildContext context) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'organizations/doctors/all',
        method: 'GET',
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      if (response != null) {
        print('Doctor API response: $response');
        print('Response type: ${response.runtimeType}');

        // Handle response with 'doctors' field containing nested user data
        if (response is Map<String, dynamic> && response['doctors'] != null) {
          print('Processing doctors field response');
          final List<dynamic> doctorsData =
              response['doctors'] as List<dynamic>;
          try {
            _doctors = doctorsData.map((doctorJson) {
              print('Processing doctor item from doctors: $doctorJson');
              // Transform the nested structure to match our DoctorModel
              final Map<String, dynamic> transformedDoc =
                  _transformDoctorResponse(doctorJson as Map<String, dynamic>);
              return DoctorModel.fromJson(transformedDoc);
            }).toList();
            print(
              'Successfully parsed ${_doctors.length} doctors from doctors field',
            );
          } catch (e) {
            print('Error parsing doctors data field: $e');
            _setError('Error parsing doctor data: $e');
            return;
          }
        }
        // If response is a List (direct array)
        else if (response is List) {
          print('Processing list response with ${response.length} items');
          try {
            _doctors = response.map((json) {
              print('Processing doctor item: $json');
              final Map<String, dynamic> doctorJson =
                  json as Map<String, dynamic>;
              final Map<String, dynamic> transformedDoc =
                  _transformDoctorResponse(doctorJson);
              return DoctorModel.fromJson(transformedDoc);
            }).toList();
            print('Successfully parsed ${_doctors.length} doctors');
          } catch (e) {
            print('Error parsing doctor list: $e');
            _setError('Error parsing doctor data: $e');
            return;
          }
        }
        // If response is a Map with 'data' field
        else if (response is Map<String, dynamic> && response['data'] != null) {
          print('Processing data field response');
          final List<dynamic> doctorsData = response['data'] as List<dynamic>;
          try {
            _doctors = doctorsData.map((json) {
              print('Processing doctor item from data: $json');
              final Map<String, dynamic> doctorJson =
                  json as Map<String, dynamic>;
              final Map<String, dynamic> transformedDoc =
                  _transformDoctorResponse(doctorJson);
              return DoctorModel.fromJson(transformedDoc);
            }).toList();
            print(
              'Successfully parsed ${_doctors.length} doctors from data field',
            );
          } catch (e) {
            print('Error parsing doctor data field: $e');
            _setError('Error parsing doctor data: $e');
            return;
          }
        } else {
          print('Invalid response format: $response');
          _setError('Invalid response format');
        }
      } else {
        print('No response received from doctor API');
        _setError('Failed to fetch doctors');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Add a new doctor
  Future<bool> addDoctor(DoctorModel doctor, BuildContext context) async {
    _setAdding(true);
    _clearError();

    try {
      final token = await _getAccessToken(context);
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _service.requist(
        'organizations/doctors',
        method: 'POST',
        body: doctor.toJson(),
        useOrgApi: true, // Use organization API
        token: token,
        context: context,
      );

      print('Doctor creation request: ${doctor.toJson()}');

      if (response != null) {
        print('Doctor creation response: $response');
        // Refresh the doctors list
        await fetchDoctors(context);
        return true;
      } else {
        _setError('Failed to add doctor');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setAdding(false);
    }
  }

  /// Transform API response to match DoctorModel structure
  Map<String, dynamic> _transformDoctorResponse(
    Map<String, dynamic> doctorJson,
  ) {
    // Extract user data from nested user object
    final Map<String, dynamic>? userData =
        doctorJson['user'] as Map<String, dynamic>?;

    // Return transformed structure that matches DoctorModel
    return {
      // Doctor ID (this was missing! - map to 'id' in JSON)
      'id': doctorJson['doctor_id'], // Maps to drid in DoctorModel
      // User fields
      'user_id': userData?['user_id'],
      'first_name': userData?['first_name'],
      'last_name': userData?['last_name'],
      'email': userData?['email'],
      'username': userData?['username'],
      'phone': userData?['phone'],

      // Doctor fields (direct from doctorJson)
      'doctor_code': doctorJson['doctor_code'],
      'specialization': doctorJson['specialization'],
      'license_number': doctorJson['license_number'],
      'consultation_fee': doctorJson['consultation_fee'],
      'follow_up_fee': doctorJson['follow_up_fee'],
      'follow_up_days': doctorJson['follow_up_days'],
    };
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Refresh doctors list
  Future<void> refresh(BuildContext context) async {
    await fetchDoctors(context);
  }
}
