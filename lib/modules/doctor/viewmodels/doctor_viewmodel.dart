import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/doctor/models/doctor_model.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:drandme/core/config/service.dart';
import 'package:image_picker/image_picker.dart';

class DoctorViewModel extends ChangeNotifier {
  final ServiceRepo _service = ServiceRepo();

  // ✅ AuthViewModel injected — no BuildContext needed for token lookups
  final AuthViewModel _authViewModel;

  DoctorViewModel(this._authViewModel);

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

  /// ✅ Safe token retrieval — uses injected AuthViewModel, no BuildContext needed
  Future<String?> _getAccessToken() async {
    try {
      // Check if token is expired and refresh proactively
      if (_authViewModel.tokens?.isAccessTokenExpired == true) {
        print('Token is expired, refreshing proactively...');
        final refreshed = await _authViewModel.refreshAccessToken();
        if (!refreshed) {
          _setError('Token refresh failed. Please login again.');
          return null;
        }
      }

      // Return current token
      if (_authViewModel.accessToken != null) {
        return _authViewModel.accessToken;
      }

      _setError('No authentication token found. Please login again.');
      return null;
    } catch (e) {
      print('Error getting access token: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return null;
    }
  }

  /// Fetch all doctors from API
  Future<void> fetchDoctors({BuildContext? context}) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final response = await _service.requist(
        'doctors/all',
        method: 'GET',
        useOrgApi: true,
        token: token,
        context: context,
      );

      if (response != null) {
        if (response is Map<String, dynamic> && response['doctors'] != null) {
          final List<dynamic> doctorsData =
              response['doctors'] as List<dynamic>;
          _doctors = doctorsData.map((doctorJson) {
            final Map<String, dynamic> transformedDoc =
                _transformDoctorResponse(doctorJson as Map<String, dynamic>);
            return DoctorModel.fromJson(transformedDoc);
          }).toList();
        } else if (response is List) {
          _doctors = response.map((json) {
            final Map<String, dynamic> transformedDoc =
                _transformDoctorResponse(json as Map<String, dynamic>);
            return DoctorModel.fromJson(transformedDoc);
          }).toList();
        } else if (response is Map<String, dynamic> &&
            response['data'] != null) {
          final List<dynamic> doctorsData = response['data'] as List<dynamic>;
          _doctors = doctorsData.map((json) {
            final Map<String, dynamic> transformedDoc =
                _transformDoctorResponse(json as Map<String, dynamic>);
            return DoctorModel.fromJson(transformedDoc);
          }).toList();
        } else {
          _setError('Invalid response format');
        }
      } else {
        _setError('Failed to fetch doctors');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Add a new doctor
  Future<String?> addDoctor(
    DoctorModel doctor,
    XFile? profileImage, {
    BuildContext? context,
  }) async {
    _setAdding(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return null;
      }

      final Map<String, dynamic> doctorMap = doctor.toJson();
      final Map<String, String> fields = {};

      doctorMap.forEach((key, value) {
        if (value != null) {
          fields[key] = value.toString();
        }
      });

      final Map<String, XFile>? files = profileImage != null
          ? {'profile_image': profileImage}
          : null;

      final response = await _service.multipart(
        'doctors',
        method: 'POST',
        fields: fields,
        files: files,
        useOrgApi: true,
        token: token,
        context: context,
      );

      if (response != null) {
        print('✅ Add Doctor Raw Response: $response');
        await fetchDoctors();
        String doctorCode = '';
        if (response is Map<String, dynamic> &&
            response['doctor_code'] != null) {
          doctorCode = response['doctor_code'].toString();
        } else if (response is Map<String, dynamic> &&
            response['data'] != null &&
            response['data']['doctor_code'] != null) {
          doctorCode = response['data']['doctor_code'].toString();
        }
        return doctorCode.isNotEmpty ? doctorCode : 'Success';
      } else {
        _setError('Failed to add doctor');
        return null;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return null;
    } finally {
      _setAdding(false);
    }
  }

  /// Update an existing doctor
  Future<bool> updateDoctor(
    String doctorId,
    DoctorModel doctor,
    XFile? profileImage, {
    BuildContext? context,
  }) async {
    _setAdding(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) return false;

      final Map<String, dynamic> doctorMap = doctor.toJson();
      final Map<String, String> fields = {};

      doctorMap.forEach((key, value) {
        if (value != null && key != 'id') {
          fields[key] = value.toString();
        }
      });

      final Map<String, XFile>? files = profileImage != null
          ? {'profile_image': profileImage}
          : null;

      final response = await _service.multipart(
        'doctors/$doctorId',
        method: 'PUT',
        fields: fields,
        files: files,
        useOrgApi: true,
        token: token,
        context: context,
      );

      if (response != null) {
        print('✅ Update Doctor Raw Response: $response');
        await fetchDoctors();
        return true;
      }
      return false;
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setAdding(false);
    }
  }

  /// Delete a doctor record (Hard Delete)
  Future<bool> deleteDoctor(String doctorId, {BuildContext? context}) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) return false;

      final response = await _service.requist(
        'doctors/$doctorId',
        method: 'DELETE',
        useOrgApi: true,
        token: token,
        context: context,
      );

      if (response != null) {
        await fetchDoctors();
        return true;
      }
      return false;
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Transform API response to match DoctorModel structure
  Map<String, dynamic> _transformDoctorResponse(
    Map<String, dynamic> doctorJson,
  ) {
    final Map<String, dynamic>? userData =
        doctorJson['user'] as Map<String, dynamic>?;

    return {
      'id': doctorJson['doctor_id'],
      'user_id': userData?['user_id'],
      'first_name': userData?['first_name'],
      'last_name': userData?['last_name'],
      'email': userData?['email'],
      'username': userData?['username'],
      'phone': userData?['phone'],
      'doctor_code': doctorJson['doctor_code'],
      'specialization': doctorJson['specialization'],
      'license_number': doctorJson['license_number'],
      'consultation_fee': doctorJson['consultation_fee'],
      'follow_up_fee': doctorJson['follow_up_fee'],
      'follow_up_days': doctorJson['follow_up_days'],
      'profile_image': doctorJson['profile_image'],
      'qualification': doctorJson['qualification'],
      'experience_years': doctorJson['experience_years'],
      'bio': doctorJson['bio'],
    };
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Refresh doctors list
  Future<void> refresh({BuildContext? context}) async {
    await fetchDoctors();
  }
}
