import 'package:flutter/foundation.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_doctors_model.dart';
import 'package:a/core/config/service.dart';

class ClinicSettingsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ServiceRepo _serviceRepo;

  ClinicSettingsViewModel(this._authViewModel) : _serviceRepo = ServiceRepo();

  // State variables
  bool _isLoading = false;
  String _error = '';

  // Clinic doctors data
  List<ClinicDoctorModel> _clinicDoctors = [];
  List<ClinicDoctorModel> _filteredDoctors = [];
  String _searchQuery = '';

  // Getters
  bool get isLoading => _isLoading;
  String get error => _error;
  List<ClinicDoctorModel> get clinicDoctors => _filteredDoctors;
  String get searchQuery => _searchQuery;

  // Load clinic doctors
  Future<void> loadClinicDoctors() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) {
        _error = 'Clinic ID not found';
        _isLoading = false;
        notifyListeners();
        return;
      }

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LOADING CLINIC DOCTORS (CLINIC SETTINGS)                  ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Clinic ID: $clinicId');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('');

      final response = await _serviceRepo.requist(
        'organizations/doctors/clinic/$clinicId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response['doctors'] != null) {
        final doctorsList = response['doctors'] as List<dynamic>;

        print('📋 RAW DOCTOR DATA FROM API:');
        print('═══════════════════════════════════════════════════════');
        for (var i = 0; i < doctorsList.length && i < 2; i++) {
          print('Doctor ${i + 1}:');
          print(doctorsList[i]);
          print('---');
        }
        print('');

        _clinicDoctors = doctorsList
            .map((json) => ClinicDoctorModel.fromJson(json))
            .toList();

        _filteredDoctors = List.from(_clinicDoctors);

        print('✅ Loaded ${_clinicDoctors.length} clinic doctors');

        // Debug: Print first doctor's IDs
        if (_clinicDoctors.isNotEmpty) {
          final firstDoctor = _clinicDoctors.first;
          print('🔍 FIRST DOCTOR ID FIELDS AFTER PARSING:');
          print('   id: ${firstDoctor.id}');
          print('   linkId: ${firstDoctor.linkId}');
          print('   doctorId: ${firstDoctor.doctorId}');
          print('   userId: ${firstDoctor.userId}');
          print('   fullName: ${firstDoctor.fullName}');
          print('   firstName: ${firstDoctor.firstName}');
          print('   lastName: ${firstDoctor.lastName}');
        }
        print('');
      } else {
        print('❌ No doctors found or invalid response');
        _clinicDoctors = [];
        _filteredDoctors = [];
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN loadClinicDoctors                                 ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      _error = 'Error loading clinic doctors: $e';
      _clinicDoctors = [];
      _filteredDoctors = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Search/filter doctors
  void searchDoctors(String query) {
    _searchQuery = query;

    if (query.isEmpty) {
      _filteredDoctors = List.from(_clinicDoctors);
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredDoctors = _clinicDoctors.where((doctor) {
        final name =
            (doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}')
                .toLowerCase();
        final email = (doctor.email ?? '').toLowerCase();
        final phone = (doctor.phone ?? '').toLowerCase();
        final specialization = (doctor.specialization ?? '').toLowerCase();
        final licenseNumber = (doctor.licenseNumber ?? '').toLowerCase();

        return name.contains(lowerQuery) ||
            email.contains(lowerQuery) ||
            phone.contains(lowerQuery) ||
            specialization.contains(lowerQuery) ||
            licenseNumber.contains(lowerQuery);
      }).toList();
    }

    notifyListeners();
  }

  // Clear search
  void clearSearch() {
    _searchQuery = '';
    _filteredDoctors = List.from(_clinicDoctors);
    notifyListeners();
  }

  // Reload doctors
  Future<void> reload() async {
    await loadClinicDoctors();
  }

  void clearError() {
    _error = '';
    notifyListeners();
  }
}
