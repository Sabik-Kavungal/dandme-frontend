import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/foundation.dart';

import 'package:a/modules/clinic/repositories/clinic_appointment_repository.dart';

class AppointmentDashboardViewModel extends ChangeNotifier {
  final ClinicAppointmentRepository _repository;
  final AuthViewModel _authViewModel;

  AppointmentDashboardViewModel(this._authViewModel)
    : _repository = ClinicAppointmentRepository();

  // State variables
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _disposed = false;
  String _error = '';
  AppointmentSummary? _summary;
  List<Appointment> _appointments = [];
  int _currentPage = 1;
  bool _hasMoreData = true;

  // Filter and search state
  int _selectedTab = 0; // 0: All, 1: Patients, 2: Doctors
  String _searchQuery = '';
  String? _selectedStatus;
  String? _selectedDepartment;
  String? _selectedDoctor;
  bool _isListView = true;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String get error => _error;
  AppointmentSummary? get summary => _summary;
  List<Appointment> get appointments => _appointments;
  int get selectedTab => _selectedTab;
  String get searchQuery => _searchQuery;
  String? get selectedStatus => _selectedStatus;
  String? get selectedDepartment => _selectedDepartment;
  String? get selectedDoctor => _selectedDoctor;
  bool get isListView => _isListView;
  bool get hasMoreData => _hasMoreData;

  // Initialize dashboard data
  Future<void> initializeDashboard() async {
    await Future.wait([loadSummary(), loadAppointments()]);
  }

  // Load appointment summary
  Future<void> loadSummary() async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final summary = await _repository.getAppointmentSummary(token);
      if (summary != null) {
        _summary = summary;
        _safeNotifyListeners();
      } else {
        // Use demo data when API fails
        _summary = _getDemoSummary();
        _setError('Using demo data - API connection failed');
        _safeNotifyListeners();
      }
    } catch (e) {
      _setError('Error loading summary: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load appointments with current filters
  Future<void> loadAppointments({bool refresh = false}) async {
    try {
      if (refresh) {
        _currentPage = 1;
        _appointments.clear();
        _hasMoreData = true;
        _setLoading(true);
      } else {
        _setLoadingMore(true);
      }

      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      // Determine status filter based on selected tab
      String? statusFilter;
      switch (_selectedTab) {
        case 0: // All
          statusFilter = _selectedStatus;
          break;
        case 1: // Patients
          statusFilter = _selectedStatus;
          break;
        case 2: // Doctors
          statusFilter = _selectedStatus;
          break;
      }

      final appointments = await _repository.getAppointments(
        token: token,
        page: _currentPage,
        limit: 10,
        status: statusFilter,
        department: _selectedDepartment,
        doctorId: _selectedDoctor,
        searchQuery: _searchQuery.isNotEmpty ? _searchQuery : null,
      );

      if (appointments != null) {
        if (refresh) {
          _appointments = appointments;
        } else {
          _appointments.addAll(appointments);
        }

        _hasMoreData = appointments.length >= 10;
        _currentPage++;
        _safeNotifyListeners();
      } else {
        // Use demo data when API fails
        final demoAppointments = _getDemoAppointments();
        if (refresh) {
          _appointments = demoAppointments;
        } else {
          _appointments.addAll(demoAppointments);
        }
        _hasMoreData = false;
        _setError('Using demo data - API connection failed');
        _safeNotifyListeners();
      }
    } catch (e) {
      _setError('Error loading appointments: $e');
    } finally {
      _setLoading(false);
      _setLoadingMore(false);
    }
  }

  // Load more appointments (pagination)
  Future<void> loadMoreAppointments() async {
    if (!_hasMoreData || _isLoadingMore) return;
    await loadAppointments();
  }

  // Refresh data
  Future<void> refresh() async {
    await loadAppointments(refresh: true);
    await loadSummary();
  }

  // Set selected tab
  void setSelectedTab(int tab) {
    if (_selectedTab != tab) {
      _selectedTab = tab;
      loadAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Set search query
  void setSearchQuery(String query) {
    if (_searchQuery != query) {
      _searchQuery = query;
      loadAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Set status filter
  void setStatusFilter(String? status) {
    if (_selectedStatus != status) {
      _selectedStatus = status;
      loadAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Set department filter
  void setDepartmentFilter(String? department) {
    if (_selectedDepartment != department) {
      _selectedDepartment = department;
      loadAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Set doctor filter
  void setDoctorFilter(String? doctor) {
    if (_selectedDoctor != doctor) {
      _selectedDoctor = doctor;
      loadAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Toggle view mode
  void toggleViewMode() {
    _isListView = !_isListView;
    notifyListeners();
  }

  // Clear all filters
  void clearFilters() {
    _searchQuery = '';
    _selectedStatus = null;
    _selectedDepartment = null;
    _selectedDoctor = null;
    loadAppointments(refresh: true);
    notifyListeners();
  }

  // Cancel appointment
  Future<bool> cancelAppointment(String appointmentId) async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return false;
      }

      final success = await _repository.cancelAppointment(appointmentId, token);
      if (success) {
        // Remove from local list
        _appointments.removeWhere(
          (appointment) => appointment.id == appointmentId,
        );
        // Refresh summary
        await loadSummary();
        _safeNotifyListeners();
        return true;
      } else {
        _setError('Failed to cancel appointment');
        return false;
      }
    } catch (e) {
      _setError('Error cancelling appointment: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Private helper methods
  void _setLoading(bool loading) {
    if (_disposed) return;
    _isLoading = loading;
    _safeNotifyListeners();
  }

  void _setLoadingMore(bool loading) {
    if (_disposed) return;
    _isLoadingMore = loading;
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

  // Demo data methods for when API is unavailable
  AppointmentSummary _getDemoSummary() {
    return AppointmentSummary(
      todayAppointments: 55,
      upcomingAppointments: 12,
      completedAppointments: 143,
      cancelledAppointments: 8,
    );
  }

  List<Appointment> _getDemoAppointments() {
    final now = DateTime.now();
    return [
      Appointment(
        id: '1',
        patientId: 'patient_1',
        doctorId: 'doctor_1',
        department: 'Cardiology',
        appointmentDate: now
            .add(const Duration(days: 1))
            .toIso8601String()
            .split('T')[0],
        appointmentTime: '10:00 AM',
        status: 'Scheduled',
        fee: 150.0,
        reasonForVisit: 'Regular checkup',
        notes: 'Patient has no allergies',
        patient: Patient(
          id: 'patient_1',
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@email.com',
          phone: '+1234567890',
        ),
        doctor: Doctor(
          id: 'doctor_1',
          firstName: 'Dr. Smith',
          lastName: '',
          email: 'dr.smith@hospital.com',
          phone: '+1234567891',
          department: 'Cardiology',
        ),
      ),
      Appointment(
        id: '2',
        patientId: 'patient_2',
        doctorId: 'doctor_2',
        department: 'Dermatology',
        appointmentDate: now
            .add(const Duration(days: 2))
            .toIso8601String()
            .split('T')[0],
        appointmentTime: '2:30 PM',
        status: 'Confirmed',
        fee: 200.0,
        reasonForVisit: 'Skin consultation',
        notes: 'Follow-up appointment',
        patient: Patient(
          id: 'patient_2',
          firstName: 'Jane',
          lastName: 'Smith',
          email: 'jane.smith@email.com',
          phone: '+1234567892',
        ),
        doctor: Doctor(
          id: 'doctor_2',
          firstName: 'Dr. Johnson',
          lastName: '',
          email: 'dr.johnson@hospital.com',
          phone: '+1234567893',
          department: 'Dermatology',
        ),
      ),
      Appointment(
        id: '3',
        patientId: 'patient_3',
        doctorId: 'doctor_3',
        department: 'Orthopedics',
        appointmentDate: now
            .add(const Duration(days: 3))
            .toIso8601String()
            .split('T')[0],
        appointmentTime: '9:15 AM',
        status: 'Pending',
        fee: 300.0,
        reasonForVisit: 'Knee pain consultation',
        notes: 'Sports injury',
        patient: Patient(
          id: 'patient_3',
          firstName: 'Mike',
          lastName: 'Wilson',
          email: 'mike.wilson@email.com',
          phone: '+1234567894',
        ),
        doctor: Doctor(
          id: 'doctor_3',
          firstName: 'Dr. Brown',
          lastName: '',
          email: 'dr.brown@hospital.com',
          phone: '+1234567895',
          department: 'Orthopedics',
        ),
      ),
    ];
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
