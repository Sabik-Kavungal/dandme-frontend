import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/repositories/clinic_appointment_repository.dart';

class NewAppointmentViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ClinicAppointmentRepository _repository;

  NewAppointmentViewModel(this._authViewModel)
    : _repository = ClinicAppointmentRepository();

  // State variables
  bool _isLoading = false;
  bool _isCreating = false;
  bool _disposed = false;
  String _error = '';

  // Form data
  String _selectedConsultationType = 'Video';
  String _selectedDepartment = 'Orthology';
  String _selectedDoctor = 'Dr. Arun Krishna';
  String _selectedDate = '16, July';
  String _selectedTimeSlot = '09:00 AM';
  String _selectedPaymentMethod = 'Pay Now';
  String _patientNotes = '';
  bool _isMobileSearch = true;
  String _searchQuery = '';

  // Data lists
  List<Department> _departments = [];
  List<Doctor> _doctors = [];
  List<ConsultationType> _consultationTypes = [];
  List<TimeSlot> _availableTimeSlots = [];
  List<Patient> _searchResults = [];
  Patient? _selectedPatient;

  // Getters
  bool get isLoading => _isLoading;
  bool get isCreating => _isCreating;
  String get error => _error;
  String get selectedConsultationType => _selectedConsultationType;
  String get selectedDepartment => _selectedDepartment;
  String get selectedDoctor => _selectedDoctor;
  String get selectedDate => _selectedDate;
  String get selectedTimeSlot => _selectedTimeSlot;
  String get selectedPaymentMethod => _selectedPaymentMethod;
  String get patientNotes => _patientNotes;
  bool get isMobileSearch => _isMobileSearch;
  String get searchQuery => _searchQuery;
  List<Department> get departments => _departments;
  List<Doctor> get doctors => _doctors;
  List<ConsultationType> get consultationTypes => _consultationTypes;
  List<TimeSlot> get availableTimeSlots => _availableTimeSlots;
  List<Patient> get searchResults => _searchResults;
  Patient? get selectedPatient => _selectedPatient;

  // Initialize form data
  Future<void> initialize() async {
    await Future.wait([loadDepartments(), loadConsultationTypes()]);
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

  // Load consultation types
  Future<void> loadConsultationTypes() async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final types = await _repository.getConsultationTypes(token);
      if (types != null) {
        _consultationTypes = types;
        if (types.isNotEmpty) {
          _selectedConsultationType = types.first.name ?? 'Video';
        }
        _safeNotifyListeners();
      } else {
        _setError('Failed to load consultation types');
      }
    } catch (e) {
      _setError('Error loading consultation types: $e');
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

      // final slots = await _repository.getAvailableTimeSlots(
      //   doctorId: doctorId,
      //   date: date,
      //   token: token,
      // );

      // if (slots != null) {
      //   _availableTimeSlots = slots;
      //   _safeNotifyListeners();
      // } else {
      //   _setError('Failed to load available time slots');
      // }
    } catch (e) {
      _setError('Error loading time slots: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Search patients
  Future<void> searchPatients(String query) async {
    if (query.isEmpty) {
      _searchResults.clear();
      _safeNotifyListeners();
      return;
    }

    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      // final searchType = _isMobileSearch ? 'mobile' : 'id';
      // final patients = await _repository.searchPatients(
      //   query: query,
      //   searchType: searchType,
      //   token: token,
      // );

      // if (patients != null) {
      //   _searchResults = patients;
      //   _safeNotifyListeners();
      // } else {
      //   _setError('Failed to search patients');
      // }
    } catch (e) {
      _setError('Error searching patients: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Create appointment
  Future<Appointment?> createAppointment() async {
    if (_selectedPatient == null) {
      _setError('Please select a patient');
      return null;
    }

    try {
      _setCreating(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return null;
      }

      // Find selected doctor ID
      final doctor = _doctors.firstWhere(
        (d) => '${d.firstName} ${d.lastName}' == _selectedDoctor,
        orElse: () => _doctors.first,
      );

      final appointment = await _repository.createAppointment(
        token: token,
        patientId: _selectedPatient!.id!,
        doctorId: doctor.id!,
        department: _selectedDepartment,
        consultationType: _selectedConsultationType,
        appointmentDate: _selectedDate,
        appointmentTime: _selectedTimeSlot,
        reasonForVisit: _patientNotes,
        notes: _patientNotes,
        paymentMethod: _selectedPaymentMethod,
      );

      if (appointment != null) {
        // Reset form
        _resetForm();
        return appointment;
      } else {
        _setError('Failed to create appointment');
        return null;
      }
    } catch (e) {
      _setError('Error creating appointment: $e');
      return null;
    } finally {
      _setCreating(false);
    }
  }

  // Process payment
  Future<Map<String, dynamic>?> processPayment(
    String appointmentId,
    double amount,
  ) async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return null;
      }

      // final result = await _repository.processPayment(
      //   appointmentId: appointmentId,
      //   paymentMethod: _selectedPaymentMethod,
      //   amount: amount,
      //   token: token,
      // );

      return null;
    } catch (e) {
      _setError('Error processing payment: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  // Form field setters
  void setConsultationType(String type) {
    _selectedConsultationType = type;
    _safeNotifyListeners();
  }

  void setDepartment(String department) {
    _selectedDepartment = department;
    loadDoctorsByDepartment(department);
    _safeNotifyListeners();
  }

  void setDoctor(String doctor) {
    _selectedDoctor = doctor;
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

  void setPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    _safeNotifyListeners();
  }

  void setPatientNotes(String notes) {
    _patientNotes = notes;
    _safeNotifyListeners();
  }

  void setSearchType(bool isMobile) {
    _isMobileSearch = isMobile;
    _searchResults.clear();
    _safeNotifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    if (query.isNotEmpty) {
      searchPatients(query);
    } else {
      _searchResults.clear();
      _safeNotifyListeners();
    }
  }

  void selectPatient(Patient patient) {
    _selectedPatient = patient;
    _searchResults.clear();
    _searchQuery = '';
    _safeNotifyListeners();
  }

  // Reset form
  void _resetForm() {
    _selectedConsultationType = 'Video';
    _selectedDepartment = 'Orthology';
    _selectedDoctor = 'Dr. Arun Krishna';
    _selectedDate = '16, July';
    _selectedTimeSlot = '09:00 AM';
    _selectedPaymentMethod = 'Pay Now';
    _patientNotes = '';
    _searchQuery = '';
    _searchResults.clear();
    _selectedPatient = null;
    _safeNotifyListeners();
  }

  // Private helper methods
  void _setLoading(bool loading) {
    if (_disposed) return;
    _isLoading = loading;
    _safeNotifyListeners();
  }

  void _setCreating(bool creating) {
    if (_disposed) return;
    _isCreating = creating;
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
