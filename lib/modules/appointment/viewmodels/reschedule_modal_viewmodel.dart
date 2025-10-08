import 'package:a/core/repositories/appointment_repository.dart';
import 'package:a/modules/appointment/models/appointment_model.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/foundation.dart';

class RescheduleModalViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  late final AppointmentRepository _repository;

  RescheduleModalViewModel(this._authViewModel)
    : _repository = AppointmentRepository();

  // State variables
  bool _isLoading = false;
  bool _isSaving = false;
  bool _disposed = false;
  String _error = '';

  // Form data
  String _selectedDepartment = 'Orthology';
  String _selectedDoctor = 'Dr. Arun Krishna';
  String _selectedDate = '16, July';
  String _selectedTimeSlot = '09:00 AM';
  String _rescheduleReason = '';

  // Data lists
  List<Department> _departments = [];
  List<Doctor> _doctors = [];
  List<TimeSlot> _availableTimeSlots = [];

  // Getters
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String get error => _error;
  String get selectedDepartment => _selectedDepartment;
  String get selectedDoctor => _selectedDoctor;
  String get selectedDate => _selectedDate;
  String get selectedTimeSlot => _selectedTimeSlot;
  String get rescheduleReason => _rescheduleReason;
  List<Department> get departments => _departments;
  List<Doctor> get doctors => _doctors;
  List<TimeSlot> get availableTimeSlots => _availableTimeSlots;

  // Initialize modal data
  Future<void> initialize() async {
    await loadDepartments();
  }

  // Load departments
  Future<void> loadDepartments() async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final departments = await _repository.getDepartments(token);
      if (departments != null) {
        _departments = departments;
        if (departments.isNotEmpty) {
          _selectedDepartment = departments.first.name ?? 'Orthology';
          await loadDoctorsByDepartment(_selectedDepartment);
        }
        _safeNotifyListeners();
      } else {
        _setError('Failed to load departments');
      }
    } catch (e) {
      _setError('Error loading departments: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load doctors by department
  Future<void> loadDoctorsByDepartment(String department) async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final doctors = await _repository.getDoctorsByDepartment(
        department,
        token,
      );
      if (doctors != null) {
        _doctors = doctors;
        if (doctors.isNotEmpty) {
          _selectedDoctor =
              '${doctors.first.firstName} ${doctors.first.lastName}';
          await loadAvailableTimeSlots(doctors.first.id!, _selectedDate);
        }
        _safeNotifyListeners();
      } else {
        _setError('Failed to load doctors');
      }
    } catch (e) {
      _setError('Error loading doctors: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load available time slots
  Future<void> loadAvailableTimeSlots(String doctorId, String date) async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final slots = await _repository.getAvailableTimeSlots(
        doctorId: doctorId,
        date: date,
        token: token,
      );

      if (slots != null) {
        _availableTimeSlots = slots;
        _safeNotifyListeners();
      } else {
        _setError('Failed to load available time slots');
      }
    } catch (e) {
      _setError('Error loading time slots: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Save reschedule
  Future<bool> saveReschedule(String appointmentId) async {
    try {
      _setSaving(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return false;
      }

      final success = await _repository.rescheduleAppointment(
        appointmentId: appointmentId,
        token: token,
        newDate: _selectedDate,
        newTime: _selectedTimeSlot,
        reason: _rescheduleReason.isNotEmpty ? _rescheduleReason : null,
      );

      if (success != null) {
        return true;
      } else {
        _setError('Failed to reschedule appointment');
        return false;
      }
    } catch (e) {
      _setError('Error rescheduling appointment: $e');
      return false;
    } finally {
      _setSaving(false);
    }
  }

  // Form field setters
  void setDepartment(String department) {
    _selectedDepartment = department;
    loadDoctorsByDepartment(department);
    _safeNotifyListeners();
  }

  void setDoctor(String doctor) {
    _selectedDoctor = doctor;
    // Load time slots for selected doctor and date
    final doctorObj = _doctors.firstWhere(
      (d) => '${d.firstName} ${d.lastName}' == doctor,
      orElse: () => _doctors.first,
    );
    if (doctorObj.id != null) {
      loadAvailableTimeSlots(doctorObj.id!, _selectedDate);
    }
    _safeNotifyListeners();
  }

  void setDate(String date) {
    _selectedDate = date;
    // Load time slots for selected doctor and date
    final doctor = _doctors.firstWhere(
      (d) => '${d.firstName} ${d.lastName}' == _selectedDoctor,
      orElse: () => _doctors.first,
    );
    if (doctor.id != null) {
      loadAvailableTimeSlots(doctor.id!, date);
    }
    _safeNotifyListeners();
  }

  void setTimeSlot(String timeSlot) {
    _selectedTimeSlot = timeSlot;
    _safeNotifyListeners();
  }

  void setRescheduleReason(String reason) {
    _rescheduleReason = reason;
    _safeNotifyListeners();
  }

  // Reset form
  void resetForm() {
    _selectedDepartment = 'Orthology';
    _selectedDoctor = 'Dr. Arun Krishna';
    _selectedDate = '16, July';
    _selectedTimeSlot = '09:00 AM';
    _rescheduleReason = '';
    _availableTimeSlots.clear();
    _safeNotifyListeners();
  }

  // Private helper methods
  void _setLoading(bool loading) {
    if (_disposed) return;
    _isLoading = loading;
    _safeNotifyListeners();
  }

  void _setSaving(bool saving) {
    if (_disposed) return;
    _isSaving = saving;
    _safeNotifyListeners();
  }

  void _setError(String error) {
    if (_disposed) return;
    _error = error;
    _safeNotifyListeners();
  }

  void _clearError() {
    _error = '';
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
