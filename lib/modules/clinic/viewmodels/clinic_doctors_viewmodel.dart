import 'package:drandme/core/utils/loading_manager.dart';
import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:drandme/modules/superadmin/repositories/department_repository.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';

class ClinicDoctorsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ServiceRepo _serviceRepo;
  final DepartmentRepository _departmentRepo;

  ClinicDoctorsViewModel(this._authViewModel)
    : _serviceRepo = ServiceRepo(),
      _departmentRepo = DepartmentRepository();

  List<ClinicDoctorModel> _doctors = [];
  List<DepartmentModel> _departments = [];
  bool _isLoading = false;
  String? _error;

  List<ClinicDoctorModel> get doctors => _doctors;
  List<DepartmentModel> get departments => _departments;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDoctors() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final clinicId = _authViewModel.user?.clinicId;
      final token = _authViewModel.accessToken;

      if (clinicId == null || token == null) {
        _error = "Clinic ID or Token missing";
        _isLoading = false;
        LoadingManager.hide();
        notifyListeners();
        return;
      }

      final response = await _serviceRepo.requist(
        'doctors/clinic/$clinicId',
        method: 'GET',
        useOrgApi: true,
        token: token,
      );

      print('Clinic Doctors API Response: $response');

      if (response != null) {
        List<dynamic>? rawDoctorsList;

        if (response is List) {
          rawDoctorsList = response;
        } else if (response is Map<String, dynamic>) {
          rawDoctorsList =
              (response['doctors'] as List<dynamic>?) ??
              (response['data'] as List<dynamic>?) ??
              (response['results'] as List<dynamic>?);
        }

        if (rawDoctorsList != null) {
          _doctors = rawDoctorsList.map((d) {
            final Map<String, dynamic> doctorJson = d as Map<String, dynamic>;
            final transformed = _transformDoctorData(doctorJson);
            return ClinicDoctorModel.fromJson(transformed);
          }).toList();
          print(
            'Successfully parsed and transformed ${_doctors.length} doctors',
          );
        } else if (response is Map<String, dynamic>) {
          try {
            final doctorsResponse = ClinicDoctorsResponse.fromJson(response);
            // Re-transform the doctors that were parsed by the model to ensure images are picked up
            _doctors = doctorsResponse.doctors.map((doc) {
              final transformed = _transformDoctorData(doc.toJson());
              return ClinicDoctorModel.fromJson(transformed);
            }).toList();
            print(
              'Parsed via ClinicDoctorsResponse and re-transformed: ${_doctors.length} docs',
            );
          } catch (e) {
            print('Failed direct model parsing/transformation: $e');
            _error = "Invalid response format";
          }
        }
      } else {
        _error = "No response from server";
      }
    } catch (e, stack) {
      print('Error in loadDoctors: $e\n$stack');
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadDepartments() async {
    try {
      final token = _authViewModel.accessToken;
      if (token == null) return;

      final results = await _departmentRepo.listDepartments(
        token: token,
        onlyActive: true,
      );
      if (results != null) {
        _departments = results;
        notifyListeners();
      }
    } catch (e) {
      print('Error loading departments: $e');
    }
  }

  Future<void> loadAllData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    // Run both in parallel and notify as each finishes
    await Future.wait([
      loadDoctors().then((_) => notifyListeners()),
      loadDepartments().then((_) => notifyListeners()),
    ]);

    _isLoading = false;
    notifyListeners();
  }

  /// Transforms nested doctor data (e.g. from clinic-doctor link) to flat model
  Map<String, dynamic> _transformDoctorData(Map<String, dynamic> json) {
    final Map<String, dynamic> result = Map.from(json);

    // 1. If data is nested under 'doctor' key (common in link responses)
    if (json.containsKey('doctor') && json['doctor'] is Map<String, dynamic>) {
      final docData = json['doctor'] as Map<String, dynamic>;

      final fieldsToCopy = [
        'doctor_id',
        'doctor_code',
        'first_name',
        'last_name',
        'specialization',
        'license_number',
        'profile_image',
        'qualification',
        'experience_years',
        'bio',
        'profile_pic',
        'image',
        'avatar',
        'email',
        'username',
        'phone',
      ];

      for (var field in fieldsToCopy) {
        if (result[field] == null) {
          result[field] = docData[field];
        }
      }

      // Deeper nesting in 'user' object inside 'doctor'
      if (docData.containsKey('user') &&
          docData['user'] is Map<String, dynamic>) {
        final userData = docData['user'] as Map<String, dynamic>;
        final userFields = [
          'user_id',
          'first_name',
          'last_name',
          'email',
          'username',
          'phone',
          'profile_image',
          'profile_pic',
          'image',
          'avatar',
        ];

        for (var field in userFields) {
          if (result[field] == null) {
            result[field] = userData[field];
          }
        }
      }
    }

    // 2. Secondary Check: If top-level user object exists
    if (json.containsKey('user') && json['user'] is Map<String, dynamic>) {
      final userData = json['user'] as Map<String, dynamic>;
      final userFields = [
        'user_id',
        'first_name',
        'last_name',
        'email',
        'username',
        'phone',
        'profile_image',
        'image',
      ];
      for (var field in userFields) {
        if (result[field] == null) {
          result[field] = userData[field];
        }
      }
    }

    // 3. Normalize Image Field from any source
    if (result['profile_image'] == null) {
      result['profile_image'] =
          result['profile_pic'] ??
          result['image'] ??
          result['avatar'] ??
          result['logo'] ??
          result['user_image'] ??
          result['picture'] ??
          result['photo'] ??
          result['profile_url'];
    }

    // 4. Normalize IDs (Ensuring they are Strings, as some APIs send numeric IDs)
    final idFields = [
      'id',
      'doctor_id',
      'user_id',
      'link_id',
      'organization_id',
      'clinic_id',
    ];
    for (var key in idFields) {
      if (result[key] != null && result[key] is! String) {
        result[key] = result[key].toString();
      }
    }

    if (result['profile_image'] != null) {
      print(
        'Found image field for ${result['full_name'] ?? result['first_name'] ?? 'Doctor'}: ${result['profile_image']}',
      );
    }

    return result;
  }

  void refresh() {
    loadAllData();
  }
}
