import 'package:flutter/material.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:drandme/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:drandme/core/config/service.dart';

class ClinicPatientsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ClinicPatientRepository _repository;

  ClinicPatientsViewModel(this._authViewModel)
      : _repository = ClinicPatientRepository(ServiceRepo());

  List<ClinicPatient> _patients = [];
  bool _isLoading = false;
  String _error = '';
  bool _hasLoadedOnce = false;

  List<ClinicPatient> get patients => _patients;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get hasLoadedOnce => _hasLoadedOnce;

  Future<void> loadPatients({bool forceRefresh = false}) async {
    // If already loading, don't start again
    if (_isLoading) return;

    // If we already have data and not forcing refresh, just stay with what we have
    if (_hasLoadedOnce && !forceRefresh) return;

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null || clinicId == null) {
        _error = 'Authentication required';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final response = await _repository.listPatients(
        token: token,
        clinicId: clinicId,
        onlyActive: true,
      );

      if (response != null) {
        _patients = response.patients;
        _hasLoadedOnce = true;
      } else {
        _error = 'Failed to load patients';
      }
    } catch (e) {
      _error = 'Error loading patients: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refresh() {
    loadPatients(forceRefresh: true);
  }
}
