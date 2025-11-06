import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/models/appointment_list_item_model.dart';
import 'package:a/modules/clinic/models/clinic_doctors_model.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:a/core/config/service.dart';

import 'package:a/modules/clinic/repositories/clinic_appointment_repository.dart';

class AppointmentDashboardViewModel extends ChangeNotifier {
  final ClinicAppointmentRepository _repository;
  final AuthViewModel _authViewModel;
  final ServiceRepo _serviceRepo;

  AppointmentDashboardViewModel(this._authViewModel)
    : _repository = ClinicAppointmentRepository(),
      _serviceRepo = ServiceRepo();

  // State variables
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _disposed = false;
  String _error = '';
  AppointmentSummary? _summary;
  List<Appointment> _appointments = [];
  List<AppointmentListItem> _simpleAppointments = []; // New simple list
  int _currentPage = 1;
  bool _hasMoreData = true;
  String?
  _selectedDate; // For date filtering in simple API (null = show button as unselected)
  String?
  _currentFilterDate; // Internal: actual date used for API (today by default)

  // Pagination for simple appointments
  int _currentSimplePage = 1;
  final int _itemsPerPage = 10;

  // Filter and search state
  int _selectedTab = 0; // 0: All, 1: Patients, 2: Doctors
  String _searchQuery = '';
  String? _selectedStatus;
  String? _selectedDepartment;
  String?
  _selectedDoctor; // Doctor ID for simple appointments filter (null or "all" = all doctors)
  bool _isListView = true;

  // ✅ Clinic doctors list for filter dropdown
  List<ClinicDoctorModel> _clinicDoctors = [];
  bool _isLoadingDoctors = false;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String get error => _error;
  AppointmentSummary? get summary => _summary;
  List<Appointment> get appointments => _appointments;
  List<AppointmentListItem> get simpleAppointments =>
      _simpleAppointments; // New getter
  int get selectedTab => _selectedTab;
  String get searchQuery => _searchQuery;
  String? get selectedStatus => _selectedStatus;
  String? get selectedDepartment => _selectedDepartment;
  String? get selectedDoctor => _selectedDoctor;
  String? get selectedDate => _selectedDate; // New getter
  bool get isListView => _isListView;
  bool get hasMoreData => _hasMoreData;

  // ✅ Doctor filter getters
  List<ClinicDoctorModel> get clinicDoctors => _clinicDoctors;
  bool get isLoadingDoctors => _isLoadingDoctors;

  // Pagination getters
  int get currentSimplePage => _currentSimplePage;
  int get itemsPerPage => _itemsPerPage;

  /// Get filtered appointments based on selected status
  List<AppointmentListItem> get _filteredSimpleAppointments {
    if (_selectedStatus == null || _selectedStatus!.isEmpty) {
      return _simpleAppointments;
    }
    final statusLower = _selectedStatus!.toLowerCase();
    return _simpleAppointments
        .where((a) => a.status.toLowerCase() == statusLower)
        .toList();
  }

  List<AppointmentListItem> get paginatedSimpleAppointments {
    final filteredList = _filteredSimpleAppointments;
    final startIndex = (_currentSimplePage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    if (startIndex >= filteredList.length) return [];
    return filteredList.sublist(
      startIndex,
      endIndex > filteredList.length ? filteredList.length : endIndex,
    );
  }

  /// Get status counts from simple appointments list
  int _getStatusCount(String status) {
    try {
      if (_simpleAppointments.isNotEmpty) {
        final statusLower = status.toLowerCase();
        return _simpleAppointments
            .where((a) => a.status.toLowerCase() == statusLower)
            .length;
      }
    } catch (_) {}
    return 0;
  }

  // Status count getters
  int get confirmedCount => _getStatusCount('confirmed');
  int get pendingCount => _getStatusCount('pending');
  int get arrivedCount => _getStatusCount('arrived');
  int get completedCount => _getStatusCount('completed');
  int get cancelledCount => _getStatusCount('cancelled');
  int get noShowCount => _getStatusCount('no_show');

  /// Combined Cancelled + No-show count for current context (fallbacks to summary when needed)
  int get cancelledOrNoShowCount {
    final cancelled = cancelledCount;
    final noShow = noShowCount;
    // If we have simple list loaded (even if zero), trust it
    if (_simpleAppointments.isNotEmpty) return cancelled + noShow;
    // Otherwise, fallback to summary when simple list not available
    return (_summary?.cancelledAppointments ?? 0);
  }

  /// Total pages for filtered appointments
  int get totalSimplePages {
    final filteredList = _filteredSimpleAppointments;
    return (filteredList.length / _itemsPerPage).ceil();
  }

  // Initialize dashboard data
  Future<void> initializeDashboard() async {
    await Future.wait([loadSummary(), loadAppointments()]);
  }

  // Initialize dashboard with simple API
  Future<void> initializeSimpleDashboard() async {
    // ✅ Set internal filter to today, but keep selectedDate null (button not highlighted)
    final now = DateTime.now();
    _selectedDate = null; // Keep null so date button doesn't show as selected
    _currentFilterDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    print(
      '📅 Dashboard initialized with today\'s date filter: $_currentFilterDate',
    );
    print('   Date button state: ${_selectedDate ?? "Not highlighted"}');

    // ✅ Load clinic doctors for filter dropdown
    await Future.wait([
      loadSummary(),
      loadClinicDoctors(),
      loadSimpleAppointments(),
    ]);
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

  // Load simple appointments (optimized for table display)
  Future<void> loadSimpleAppointments({bool refresh = false}) async {
    try {
      if (refresh) {
        _setLoading(true);
      } else {
        _setLoadingMore(true);
      }

      _clearError();

      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null) {
        _setError('Authentication required');
        return;
      }

      if (clinicId == null) {
        _setError('Clinic ID not found');
        return;
      }

      // ✅ Use selectedDate if user picked one, otherwise use currentFilterDate (today)
      final dateToUse = _selectedDate ?? _currentFilterDate;

      // ✅ Get doctor_id filter (null or "all" means show all doctors)
      final doctorIdToUse =
          (_selectedDoctor != null &&
              _selectedDoctor!.isNotEmpty &&
              _selectedDoctor != 'all')
          ? _selectedDoctor
          : null;

      print('📅 Loading appointments for date: $dateToUse');
      print('   User selected: ${_selectedDate ?? "None (using today)"}');
      print('   Doctor filter: ${doctorIdToUse ?? "All doctors"}');

      final response = await _repository.getSimpleAppointmentList(
        token: token,
        clinicId: clinicId,
        date: dateToUse,
        doctorId: doctorIdToUse, // ✅ Pass doctor filter
      );

      if (response != null) {
        _simpleAppointments = response.appointments;
        resetSimplePagination(); // Reset to page 1
        _safeNotifyListeners();
      } else {
        _setError('Failed to load appointments');
      }
    } catch (e) {
      _setError('Error loading appointments: $e');
    } finally {
      _setLoading(false);
      _setLoadingMore(false);
    }
  }

  // Load today's appointments using simple API
  Future<void> loadTodaySimpleAppointments() async {
    // ✅ Set today's date filter
    final now = DateTime.now();
    _selectedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    print('📅 Loading today\'s appointments: $_selectedDate');

    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null) {
        _setError('Authentication required');
        return;
      }

      if (clinicId == null) {
        _setError('Clinic ID not found');
        return;
      }

      final response = await _repository.getTodayAppointments(
        token: token,
        clinicId: clinicId,
      );

      if (response != null) {
        _simpleAppointments = response.appointments;
        resetSimplePagination(); // Reset to page 1
        _safeNotifyListeners();
      } else {
        _setError('Failed to load appointments');
      }
    } catch (e) {
      _setError('Error loading appointments: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Set date filter for simple appointments
  void setDateFilter(String? date) {
    if (_selectedDate != date) {
      _selectedDate = date;
      loadSimpleAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Clear date filter
  void clearDateFilter() {
    setDateFilter(null);
  }

  // Refresh simple appointments
  Future<void> refreshSimpleAppointments() async {
    await loadSimpleAppointments(refresh: true);
    await loadSummary();
  }

  // Pagination methods for simple appointments
  void goToSimplePage(int page) {
    if (page >= 1 && page <= totalSimplePages) {
      _currentSimplePage = page;
      notifyListeners();
    }
  }

  void nextSimplePage() {
    if (_currentSimplePage < totalSimplePages) {
      _currentSimplePage++;
      notifyListeners();
    }
  }

  void previousSimplePage() {
    if (_currentSimplePage > 1) {
      _currentSimplePage--;
      notifyListeners();
    }
  }

  void resetSimplePagination() {
    _currentSimplePage = 1;
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

  // Set status filter for simple appointments
  void setStatusFilter(String? status) {
    if (_selectedStatus != status) {
      _selectedStatus = status;
      resetSimplePagination(); // Reset to page 1 when filter changes
      notifyListeners();
      // Note: Status filtering is done client-side on _simpleAppointments
      // No need to reload from API
    }
  }

  // Clear status filter
  void clearStatusFilter() {
    setStatusFilter(null);
  }

  // Set department filter
  void setDepartmentFilter(String? department) {
    if (_selectedDepartment != department) {
      _selectedDepartment = department;
      loadAppointments(refresh: true);
      notifyListeners();
    }
  }

  // Set doctor filter (for simple appointments)
  void setDoctorFilter(String? doctorId) {
    if (_selectedDoctor != doctorId) {
      _selectedDoctor = doctorId;
      loadSimpleAppointments(
        refresh: true,
      ); // ✅ Use simple appointments instead
      notifyListeners();
    }
  }

  // ✅ Load clinic doctors for filter dropdown
  Future<void> loadClinicDoctors() async {
    try {
      _isLoadingDoctors = true;
      _clearError();

      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null) {
        _setError('Authentication required');
        return;
      }

      if (clinicId == null) {
        _setError('Clinic ID not found');
        return;
      }

      print('👨‍⚕️ Loading clinic doctors for filter dropdown...');

      final response = await _serviceRepo.requist(
        'organizations/doctors/clinic/$clinicId',
        method: 'GET',
        useOrgApi: true,
        token: token,
      );

      if (response != null && response is Map<String, dynamic>) {
        final clinicDoctorsResponse = ClinicDoctorsResponse.fromJson(response);
        _clinicDoctors = clinicDoctorsResponse.doctors;
        print('✅ Loaded ${_clinicDoctors.length} doctors for filter');
        _safeNotifyListeners();
      } else {
        print('❌ Failed to load clinic doctors');
        _clinicDoctors = [];
        _safeNotifyListeners();
      }
    } catch (e) {
      print('❌ Error loading clinic doctors: $e');
      _clinicDoctors = [];
      _setError('Error loading doctors: $e');
    } finally {
      _isLoadingDoctors = false;
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
      todayAppointments: 0,
      upcomingAppointments: 0,
      completedAppointments: 0,
      cancelledAppointments: 0,
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
