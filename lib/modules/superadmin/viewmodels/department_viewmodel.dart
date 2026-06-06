import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';
import 'package:drandme/modules/superadmin/repositories/department_repository.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';

/// DepartmentViewModel - never uses BuildContext for auth.
/// AuthViewModel is injected at construction time so token lookups
/// are always safe, even after dialogs/pages have been disposed.
class DepartmentViewModel extends ChangeNotifier {
  final DepartmentRepository _repository = DepartmentRepository();

  // ✅ AuthViewModel injected — no BuildContext needed for token lookups
  final AuthViewModel _authViewModel;

  DepartmentViewModel(this._authViewModel);

  // Private state
  bool _isLoading = false;
  bool _isCreating = false;
  bool _isUpdating = false;
  bool _isDeleting = false;
  bool _isLoadingDoctors = false;
  String? _error;
  List<DepartmentModel> _departments = [];
  DepartmentModel? _selectedDepartment;
  List<DoctorInDepartment> _departmentDoctors = [];

  // Getters
  bool get isLoading => _isLoading;
  bool get isCreating => _isCreating;
  bool get isUpdating => _isUpdating;
  bool get isDeleting => _isDeleting;
  bool get isLoadingDoctors => _isLoadingDoctors;
  String? get error => _error;
  List<DepartmentModel> get departments => _departments;
  DepartmentModel? get selectedDepartment => _selectedDepartment;
  List<DoctorInDepartment> get departmentDoctors => _departmentDoctors;

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
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

  void _setLoadingDoctors(bool value) {
    _isLoadingDoctors = value;
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

  /// ✅ Safe token retrieval — uses injected AuthViewModel, no BuildContext
  Future<String?> _getAccessToken() async {
    try {
      // Proactively refresh if expired
      if (_authViewModel.tokens?.isAccessTokenExpired == true) {
        print('Token is expired, refreshing proactively...');
        final refreshed = await _authViewModel.refreshAccessToken();
        if (!refreshed) {
          _setError('Token refresh failed. Please login again.');
          return null;
        }
      }

      final token = _authViewModel.accessToken;
      if (token != null) return token;

      _setError('No authentication token found. Please login again.');
      return null;
    } catch (e) {
      print('Error getting access token: $e');
      _setError(AppHelpers.getErrorMessage(e));
      return null;
    }
  }

  /// Fetch all departments
  Future<void> fetchDepartments({
    String? clinicId,
    bool onlyActive = true,
    // context kept for backward compat but IGNORED — token comes from AuthViewModel
    BuildContext? context,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final departments = await _repository.listDepartments(
        token: token,
        clinicId: clinicId,
        onlyActive: onlyActive,
      );

      if (departments != null) {
        _departments = departments;
        print('Successfully fetched ${_departments.length} departments');
      } else {
        _setError('Failed to fetch departments');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Get single department by ID
  Future<void> fetchDepartment(
    String departmentId, {
    BuildContext? context,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final department = await _repository.getDepartment(
        token: token,
        departmentId: departmentId,
      );

      if (department != null) {
        _selectedDepartment = department;
        print('Successfully fetched department: ${department.name}');
      } else {
        _setError('Failed to fetch department details');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  /// Create a new department
  Future<bool> createDepartment(
    CreateDepartmentInput input, {
    BuildContext? context,
  }) async {
    _setCreating(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final response = await _repository.createDepartment(
        token: token,
        input: input,
      );

      if (response != null) {
        print('Department created successfully: $response');
        await fetchDepartments();
        return true;
      } else {
        _setError('Failed to create department');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setCreating(false);
    }
  }

  /// Update an existing department
  Future<bool> updateDepartment(
    String departmentId,
    UpdateDepartmentInput input, {
    BuildContext? context,
  }) async {
    _setUpdating(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final success = await _repository.updateDepartment(
        token: token,
        departmentId: departmentId,
        input: input,
      );

      if (success) {
        print('Department updated successfully');
        await fetchDepartments();
        return true;
      } else {
        _setError('Failed to update department');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Delete a department
  Future<bool> deleteDepartment(
    String departmentId, {
    BuildContext? context,
  }) async {
    _setDeleting(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return false;
      }

      final success = await _repository.deleteDepartment(
        token: token,
        departmentId: departmentId,
      );

      if (success) {
        print('Department deleted successfully');
        await fetchDepartments();
        return true;
      } else {
        _setError('Failed to delete department');
        return false;
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
      return false;
    } finally {
      _setDeleting(false);
    }
  }

  /// Get doctors by department
  Future<void> fetchDoctorsByDepartment(
    String departmentId, {
    bool onlyActive = true,
    BuildContext? context,
  }) async {
    _setLoadingDoctors(true);
    _clearError();

    try {
      final token = await _getAccessToken();
      if (token == null) {
        _setError('Authentication required. Please login again.');
        return;
      }

      final doctors = await _repository.getDoctorsByDepartment(
        token: token,
        departmentId: departmentId,
        onlyActive: onlyActive,
      );

      if (doctors != null) {
        _departmentDoctors = doctors;
        print('Successfully fetched ${_departmentDoctors.length} doctors');
      } else {
        _setError('Failed to fetch department doctors');
      }
    } catch (e) {
      _setError(AppHelpers.getErrorMessage(e));
    } finally {
      _setLoadingDoctors(false);
    }
  }

  /// Clear error state
  void clearError() {
    _clearError();
  }

  /// Clear selected department
  void clearSelectedDepartment() {
    _selectedDepartment = null;
    notifyListeners();
  }

  /// Clear department doctors
  void clearDepartmentDoctors() {
    _departmentDoctors = [];
    notifyListeners();
  }

  /// Refresh departments list
  Future<void> refresh() async {
    await fetchDepartments();
  }
}
