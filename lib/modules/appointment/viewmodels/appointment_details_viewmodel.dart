import 'package:flutter/material.dart';
import 'package:a/modules/appointment/models/appointment_model.dart';
import 'package:a/core/repositories/appointment_repository.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';

class AppointmentDetailsViewModel extends ChangeNotifier {
  final AppointmentRepository _repository;
  final AuthViewModel _authViewModel;

  AppointmentDetailsViewModel(
    AuthViewModel authViewModel, {
    AppointmentRepository? repository,
  }) : _authViewModel = authViewModel,
       _repository = repository ?? AppointmentRepository();

  Appointment? _appointmentDetails;
  bool _isLoading = false;
  bool _disposed = false;
  String? _errorMessage;

  Appointment? get appointmentDetails => _appointmentDetails;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAppointmentDetails(String appointmentId) async {
    if (_disposed) return;
    _isLoading = true;
    _errorMessage = null;
    _safeNotifyListeners();

    try {
      final token = _authViewModel.accessToken;
      if (token == null) {
        _errorMessage = 'Authentication required';
        return;
      }

      _appointmentDetails = await _repository.getAppointmentById(
        appointmentId,
        token,
      );
      if (_appointmentDetails == null) {
        _errorMessage = 'Failed to load appointment details.';
      }
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}';
    } finally {
      if (!_disposed) {
        _isLoading = false;
        _safeNotifyListeners();
      }
    }
  }

  Future<bool> rescheduleAppointment(
    String appointmentId,
    Map<String, dynamic> newDetails,
  ) async {
    if (_disposed) return false;
    _isLoading = true;
    _safeNotifyListeners();

    try {
      final token = _authViewModel.accessToken;
      if (token == null) {
        _errorMessage = 'Authentication required';
        return false;
      }

      final updatedAppointment = await _repository.updateAppointment(
        appointmentId: appointmentId,
        token: token,
        appointmentDate: newDetails['appointmentDate'],
        appointmentTime: newDetails['appointmentTime'],
        reasonForVisit: newDetails['reasonForVisit'],
        notes: newDetails['notes'],
      );

      if (!_disposed) {
        _isLoading = false;
        if (updatedAppointment != null) {
          _appointmentDetails = updatedAppointment;
          _safeNotifyListeners();
          return true;
        }
        _errorMessage = 'Failed to reschedule appointment.';
        _safeNotifyListeners();
        return false;
      }
      return false;
    } catch (e) {
      if (!_disposed) {
        _isLoading = false;
        _errorMessage = 'Error rescheduling appointment: ${e.toString()}';
        _safeNotifyListeners();
      }
      return false;
    }
  }

  Future<bool> cancelAppointment(String appointmentId) async {
    if (_disposed) return false;
    _isLoading = true;
    _safeNotifyListeners();

    try {
      final token = _authViewModel.accessToken;
      if (token == null) {
        _errorMessage = 'Authentication required';
        return false;
      }

      final success = await _repository.cancelAppointment(appointmentId, token);
      if (!_disposed) {
        _isLoading = false;
        if (success) {
          _appointmentDetails = _appointmentDetails?.copyWith(
            status: 'Cancelled',
          );
          _safeNotifyListeners();
          return true;
        }
        _errorMessage = 'Failed to cancel appointment.';
        _safeNotifyListeners();
        return false;
      }
      return false;
    } catch (e) {
      if (!_disposed) {
        _isLoading = false;
        _errorMessage = 'Error cancelling appointment: ${e.toString()}';
        _safeNotifyListeners();
      }
      return false;
    }
  }

  /// Safely notify listeners, checking if disposed
  void _safeNotifyListeners() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
