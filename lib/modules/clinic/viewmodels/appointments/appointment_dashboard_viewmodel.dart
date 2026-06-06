import 'package:drandme/core/utils/loading_manager.dart';
import 'package:drandme/modules/clinic/models/appointment_model.dart';
import 'package:drandme/modules/clinic/models/appointment_list_item_model.dart';
import 'package:drandme/modules/clinic/models/clinic_doctors_model.dart';
import 'package:drandme/modules/clinic/models/clinic_dashboard_model.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:flutter/foundation.dart';
import 'package:drandme/core/config/service.dart';

import 'package:drandme/modules/clinic/repositories/clinic_appointment_repository.dart';

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
  bool _isInitialized = false; // ✅ Track if dashboard has been initialized
  bool _disposed = false;
  String _error = '';
  AppointmentSummary? _summary;
  ClinicDashboardData? _clinicDashboardData; // ✅ New dashboard data
  Map<String, dynamic>? _collectionsData; // ✅ New collections data
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

  // Registered clinic patients list
  List<ClinicPatient> _clinicPatients = [];
  
  bool _isLoadingPatients = false;

  List<ClinicPatient> get clinicPatients => _clinicPatients;
  bool get isLoadingPatients => _isLoadingPatients;

  // Filter and search state
  int _selectedTab = 0; // 0: All, 1: Patients, 2: Doctors
  String _searchQuery = '';
  String? _selectedStatus;
  String? _selectedDepartment;
  String?
  _selectedDoctor; // Doctor ID for simple appointments filter (null or "all" = all doctors)
  String? _selectedPatientId; // Patient ID for simple appointments filter (null = all patients)
  String? _selectedBookingMode; // New: 'walk_in', 'slot', or null (All)
  bool _isListView = true;

  // ✅ Clinic doctors list for filter dropdown
  List<ClinicDoctorModel> _clinicDoctors = [];
  bool _isLoadingDoctors = false;

  // ✅ Dashboard date range (for ClinicAdminDashboard top-level card)
  String? _dashboardStartDate;
  String? _dashboardEndDate;
  String? _dashboardRangeLabel; // e.g. "Today", "Last 7 Days"

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get isInitialized => _isInitialized; // ✅ New getter
  String get error => _error;
  AppointmentSummary? get summary => _summary;
  ClinicDashboardData? get clinicDashboardData =>
      _clinicDashboardData; // ✅ New getter
  List<Appointment> get appointments => _appointments;
  List<AppointmentListItem> get simpleAppointments =>
      _simpleAppointments; // New getter
  int get selectedTab => _selectedTab;
  String get searchQuery => _searchQuery;
  String? get selectedStatus => _selectedStatus;
  String? get selectedDepartment => _selectedDepartment;
  String? get selectedDoctor => _selectedDoctor;
  String? get selectedPatientId => _selectedPatientId;
  String? get selectedBookingMode => _selectedBookingMode; // New getter
  String? get selectedDate => _selectedDate; // New getter
  // Dashboard date range getters
  String? get dashboardStartDate => _dashboardStartDate;
  String? get dashboardEndDate => _dashboardEndDate;
  String? get dashboardRangeLabel => _dashboardRangeLabel;
  bool get isListView => _isListView;
  bool get hasMoreData => _hasMoreData;

  // ✅ Doctor filter getters
  List<ClinicDoctorModel> get clinicDoctors => _clinicDoctors;
  bool get isLoadingDoctors => _isLoadingDoctors;

  // Pagination getters
  int get currentSimplePage => _currentSimplePage;
  int get itemsPerPage => _itemsPerPage;

  /// Get filtered appointments based on selected status, booking mode, and patient
  List<AppointmentListItem> get _filteredSimpleAppointments {
    List<AppointmentListItem> filtered = _simpleAppointments;

    // Filter by status
    if (_selectedStatus != null && _selectedStatus!.isNotEmpty) {
      final statusLower = _selectedStatus!.toLowerCase();
      filtered = filtered
          .where((a) => a.status.toLowerCase() == statusLower)
          .toList();
    }

    // Filter by booking mode
    if (_selectedBookingMode != null && _selectedBookingMode!.isNotEmpty) {
      final modeLower = _selectedBookingMode!.toLowerCase();
      filtered = filtered
          .where((a) => (a.bookingMode ?? 'slot').toLowerCase() == modeLower)
          .toList();
    }

    // Filter by patient ID
    if (_selectedPatientId != null && _selectedPatientId!.isNotEmpty) {
      filtered = filtered
          .where((a) => a.clinicPatientId == _selectedPatientId || a.patientId == _selectedPatientId)
          .toList();
    }

    // Filter by search query (patient name, phone number, MO ID, doctor name, token number)
    if (_searchQuery.isNotEmpty) {
      final queryLower = _searchQuery.toLowerCase();
      filtered = filtered
          .where((a) =>
              a.patientName.toLowerCase().contains(queryLower) ||
              (a.patientNumber ?? '').toLowerCase().contains(queryLower) ||
              (a.moId ?? '').toLowerCase().contains(queryLower) ||
              a.doctorName.toLowerCase().contains(queryLower) ||
              (a.tokenNumber ?? '').toLowerCase().contains(queryLower))
          .toList();
    }

    return filtered;
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
    return (_summary?.counts?.cancelled ?? 0) + (_summary?.counts?.noShow ?? 0);
  }

  AppointmentSummaryCounts? get _summaryCounts => _summary?.counts;

  int get summaryTotalAppointments {
    // If filtering by doctor, use the list count to reflect the filter
    if (_selectedDoctor != null && _selectedDoctor != 'all') {
      return _fallbackTotalAppointments;
    }
    // If summary API has data, use it
    if (_summaryCounts?.total != null && _summaryCounts!.total! > 0) {
      return _summaryCounts!.total!;
    }
    // Fallback to list count (e.g. if API summary is 0 but list has items)
    return _fallbackTotalAppointments;
  }

  int get summaryArrivedAppointments {
    // Logic: Arrived means "Patients who have arrived at the clinic"
    // This includes: Arrived (Waiting) + In Consultation + Completed
    // It should NOT decrement when a patient moves to Completed.

    // 1. If filtering by doctor, calculate from local list
    if (_selectedDoctor != null && _selectedDoctor != 'all') {
      return _cumulativeArrivedFromList;
    }

    // 2. If API summary is available
    if (_summaryCounts != null) {
      // ✅ Use the 'arrived' count from backend as-is.
      // The backend already sums arrived + in_consultation + completed.
      return _summaryCounts!.arrived ?? 0;
    }

    // 3. Fallback to list calculation
    return _cumulativeArrivedFromList;
  }

  /// Helper to calculate cumulative arrived patients from the local list
  int get _cumulativeArrivedFromList {
    if (_simpleAppointments.isEmpty) return 0;
    return _simpleAppointments.where((a) {
      final s = a.status.toLowerCase();
      return s == 'arrived' || s == 'in_consultation' || s == 'completed';
    }).length;
  }

  int get summaryCompletedAppointments {
    if (_selectedDoctor != null && _selectedDoctor != 'all') {
      return completedCount;
    }
    if (_summaryCounts?.completed != null && _summaryCounts!.completed! > 0) {
      return _summaryCounts!.completed!;
    }
    return completedCount;
  }

  int get summaryCancelledCount {
    if (_selectedDoctor != null && _selectedDoctor != 'all') {
      return cancelledCount;
    }
    if (_summaryCounts?.cancelled != null && _summaryCounts!.cancelled! > 0) {
      return _summaryCounts!.cancelled!;
    }
    return cancelledCount;
  }

  int get summaryNoShowCount {
    if (_selectedDoctor != null && _selectedDoctor != 'all') {
      return noShowCount;
    }
    if (_summaryCounts?.noShow != null && _summaryCounts!.noShow! > 0) {
      return _summaryCounts!.noShow!;
    }
    return noShowCount;
  }

  int get summaryCancelledOrNoShowCount =>
      summaryCancelledCount + summaryNoShowCount;

  /// Get collections breakdown (UPI, Cash, Card, Total) for today
  double get paymentTotal {
    if (_collectionsData != null && _collectionsData!['total_collection'] != null) {
      return (_collectionsData!['total_collection'] as num).toDouble();
    }
    final payments = ClinicAppointmentRepository.latestPayments;
    if (payments != null && payments['total'] != null) {
      return (payments['total'] as num).toDouble();
    }
    // Fallback: sum feeAmount from simple list where paymentStatus is paid
    if (_simpleAppointments.isNotEmpty) {
      return _simpleAppointments
          .where((a) => a.paymentStatus.toLowerCase() == 'paid')
          .map((a) => a.feeAmount ?? 0.0)
          .fold(0.0, (sum, item) => sum + item);
    }
    return 0.0;
  }

  double get paymentCash {
    if (_collectionsData != null && _collectionsData!['cash_total'] != null) {
      return (_collectionsData!['cash_total'] as num).toDouble();
    }
    final payments = ClinicAppointmentRepository.latestPayments;
    if (payments != null && payments['cash'] != null) {
      return (payments['cash'] as num).toDouble();
    }
    // Fallback: sum from local appointments list by payment mode
    if (_simpleAppointments.isNotEmpty) {
      return _simpleAppointments
          .where((a) =>
              a.paymentStatus.toLowerCase() == 'paid' &&
              (a.paymentMode?.toLowerCase() == 'cash'))
          .map((a) => a.feeAmount ?? 0.0)
          .fold(0.0, (sum, item) => sum + item);
    }
    return 0.0;
  }

  double get paymentCard {
    if (_collectionsData != null && _collectionsData!['card_total'] != null) {
      return (_collectionsData!['card_total'] as num).toDouble();
    }
    final payments = ClinicAppointmentRepository.latestPayments;
    if (payments != null && payments['card'] != null) {
      return (payments['card'] as num).toDouble();
    }
    // Fallback: sum from local appointments list by payment mode
    if (_simpleAppointments.isNotEmpty) {
      return _simpleAppointments
          .where((a) =>
              a.paymentStatus.toLowerCase() == 'paid' &&
              (a.paymentMode?.toLowerCase() == 'card'))
          .map((a) => a.feeAmount ?? 0.0)
          .fold(0.0, (sum, item) => sum + item);
    }
    return 0.0;
  }

  double get paymentUpi {
    if (_collectionsData != null && _collectionsData!['upi_total'] != null) {
      return (_collectionsData!['upi_total'] as num).toDouble();
    }
    final payments = ClinicAppointmentRepository.latestPayments;
    if (payments != null && payments['upi'] != null) {
      return (payments['upi'] as num).toDouble();
    }
    // Fallback: sum from local appointments list by payment mode
    if (_simpleAppointments.isNotEmpty) {
      return _simpleAppointments
          .where((a) =>
              a.paymentStatus.toLowerCase() == 'paid' &&
              (a.paymentMode?.toLowerCase() == 'upi'))
          .map((a) => a.feeAmount ?? 0.0)
          .fold(0.0, (sum, item) => sum + item);
    }
    return 0.0;
  }

  int get _fallbackTotalAppointments {
    // Calculate total from all loaded appointments for the day
    // This includes all statuses except maybe cancelled/noshow depending on how "total" is defined
    // Usually Total = All appointments scheduled for the day
    return _simpleAppointments.length;
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
    if (_isInitialized || _isLoading) return; // ✅ Prevent double loading
    
    try {
      _setLoading(true); // ✅ Start loading once for the whole batch
      
      // ✅ Automatically select today's current date and auto load
      final now = DateTime.now();
      _selectedDate = _formatDate(now); 
      _currentFilterDate = _formatDate(now);

      print('📅 Dashboard initialization started...');

      // ✅ Run all data loads in parallel
      await Future.wait([
        loadSummary(skipLoadingState: true),
        loadClinicDashboard(skipLoadingState: true),
        loadClinicDoctors(skipLoadingState: true),
        loadClinicPatients(skipLoadingState: true),
        loadSimpleAppointments(refresh: true, skipLoadingState: true),
        loadCollections(skipLoadingState: true),
      ]);
      
      print('✅ Dashboard initialization complete');
      _isInitialized = true; // ✅ Mark as initialized
    } catch (e) {
      _setError('Initialization failed: $e');
    } finally {
      _setLoading(false); // ✅ Stop loading once after everything is done
    }
  }

  // Load new clinic dashboard API
  Future<void> loadClinicDashboard({bool skipLoadingState = false}) async {
    try {
      if (!skipLoadingState) _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null || clinicId == null) {
        return;
      }

      // ✅ Use dashboard date range if set, otherwise fall back to single date
      final dateToUse = _selectedDate ?? _currentFilterDate;

      final response = await _repository.getClinicDashboard(
        token: token,
        clinicId: clinicId,
        startDate: _dashboardStartDate,
        endDate: _dashboardEndDate,
        date: (_dashboardStartDate == null) ? dateToUse : null,
      ).timeout(const Duration(seconds: 15));

      if (response != null && response.success) {
        _clinicDashboardData = response.data;
        _safeNotifyListeners();
      }
    } catch (e) {
      print('Error loading clinic dashboard: $e');
    } finally {
      if (!skipLoadingState) _setLoading(false);
    }
  }

  // Load collections summary from API
  Future<void> loadCollections({bool skipLoadingState = false}) async {
    try {
      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null || clinicId == null) {
        return;
      }

      final dateToUse = _selectedDate ?? _currentFilterDate;
      final doctorIdToUse =
          (_selectedDoctor != null &&
              _selectedDoctor!.isNotEmpty &&
              _selectedDoctor != 'all')
          ? _selectedDoctor
          : null;

      final data = await _repository.getCollections(
        token: token,
        clinicId: clinicId,
        date: dateToUse,
        doctorId: doctorIdToUse,
      );

      if (data != null) {
        _collectionsData = data;
        _safeNotifyListeners();
      }
    } catch (e) {
      print('Error loading collections: $e');
    }
  }

  // Load appointment summary
  Future<void> loadSummary({bool skipLoadingState = false}) async {
    try {
      if (!skipLoadingState) _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) {
        _setError('Clinic ID not found');
        return;
      }

      final dateToUse = _resolveSummaryDate();

      final summary = await _repository.getAppointmentSummary(
        token: token,
        clinicId: clinicId,
        date: dateToUse,
        doctorId: (_selectedDoctor != null && _selectedDoctor != 'all')
            ? _selectedDoctor
            : null,
        status: (_selectedStatus != null && _selectedStatus != 'all')
            ? _selectedStatus
            : null,
      ).timeout(const Duration(seconds: 15));

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
      if (!skipLoadingState) _setLoading(false);
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
  Future<void> loadSimpleAppointments({
    bool refresh = false,
    bool skipLoadingState = false,
  }) async {
    try {
      if (refresh) {
        loadClinicPatients(skipLoadingState: true);
      }

      if (!skipLoadingState) {
        if (refresh) {
          _setLoading(true);
        } else {
          _setLoadingMore(true);
        }
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
      ).timeout(const Duration(seconds: 15));

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
      if (!skipLoadingState) {
        _setLoading(false);
        _setLoadingMore(false);
      }
    }
  }

  // Load today's appointments using simple API
  Future<void> loadTodaySimpleAppointments() async {
    // ✅ Set today's date filter
    final now = DateTime.now();
    _selectedDate = _formatDate(now);

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
      _selectedPatientId = null; // Clear patient filter when date changes
      loadSimpleAppointments(refresh: true);
      loadSummary();
      loadClinicDashboard(); // ✅ Reload new dashboard API
      loadCollections(); // ✅ Reload collections API
      _safeNotifyListeners();
    }
  }

  // Clear date filter
  void clearDateFilter() {
    setDateFilter(null);
  }

  /// Set a date range for the clinic admin dashboard stats (not the appointments list)
  void setDashboardDateRange({
    required String startDate,
    required String endDate,
    required String label,
  }) {
    _dashboardStartDate = startDate;
    _dashboardEndDate = endDate;
    _dashboardRangeLabel = label;
    loadClinicDashboard();
    _safeNotifyListeners();
  }

  /// Clear dashboard date range (back to today)
  void clearDashboardDateRange() {
    _dashboardStartDate = null;
    _dashboardEndDate = null;
    _dashboardRangeLabel = null;
    loadClinicDashboard();
    _safeNotifyListeners();
  }


  // Refresh simple appointments
  Future<void> refreshSimpleAppointments() async {
    await loadSimpleAppointments(refresh: true);
    await loadSummary();
    await loadCollections();
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
      resetSimplePagination();
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
      _selectedPatientId = null; // Clear patient filter when doctor changes
      loadSimpleAppointments(refresh: true); // ✅ Use simple appointments instead
      loadSummary(); // Reload summary as well
      loadCollections(); // Reload collections
      notifyListeners();
    }
  }

  // Set patient filter
  void setPatientFilter(String? patientId) {
    if (_selectedPatientId != patientId) {
      _selectedPatientId = patientId;
      resetSimplePagination();
      notifyListeners();
    }
  }

  /// Get unique patients from loaded simple appointments list OR registered clinic patients
  List<Map<String, String>> get uniquePatientsInAppointments {
    final Map<String, Map<String, String>> patientsMap = {};

    // 1. First add all registered clinic patients
    for (final p in _clinicPatients) {
      if (p.id.isNotEmpty) {
        patientsMap[p.id] = {
          'name': p.fullName,
          'number': p.phone,
        };
      }
    }

    // 2. Fallback/merge with loaded simple appointments patients
    for (final a in _simpleAppointments) {
      final id = a.clinicPatientId ?? a.patientId;
      if (id != null && id.isNotEmpty) {
        if (!patientsMap.containsKey(id)) {
          patientsMap[id] = {
            'name': a.patientName,
            'number': a.patientNumber ?? '',
          };
        }
      }
    }

    return patientsMap.entries
        .map((e) => {
              'id': e.key,
              'name': e.value['name']!.isEmpty ? 'Unknown' : e.value['name']!,
              'number': e.value['number']!,
            })
        .toList()
      ..sort((a, b) => a['name']!.toLowerCase().compareTo(b['name']!.toLowerCase()));
  }

  // Set booking mode filter
  void setBookingModeFilter(String? mode) {
    if (_selectedBookingMode != mode) {
      _selectedBookingMode = mode;
      resetSimplePagination(); // Reset to page 1 when filter changes
      notifyListeners();
    }
  }

  // ✅ Load clinic doctors for filter dropdown
  Future<void> loadClinicDoctors({bool skipLoadingState = false}) async {
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
        'doctors/clinic/$clinicId',
        method: 'GET',
        useOrgApi: true,
        token: token,
      ).timeout(const Duration(seconds: 15));

      if (response != null && response is Map<String, dynamic>) {
        final rawDoctorsList = response['doctors'] as List<dynamic>?;
        if (rawDoctorsList != null) {
          _clinicDoctors = rawDoctorsList.map((d) {
            final Map<String, dynamic> doctorJson = d as Map<String, dynamic>;
            final transformed = _transformDoctorData(doctorJson);
            return ClinicDoctorModel.fromJson(transformed);
          }).toList();
        } else {
          _clinicDoctors = [];
        }
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
      _safeNotifyListeners();
    }
  }

  /// Transforms nested doctor data (e.g. from clinic-doctor link) to flat model
  Map<String, dynamic> _transformDoctorData(Map<String, dynamic> json) {
    final Map<String, dynamic> result = Map.from(json);

    // 1. If data is nested under 'doctor' key
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

    // 4. Normalize IDs
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

    return result;
  }

  // ✅ Load clinic patients for filter dropdown
  Future<void> loadClinicPatients({bool skipLoadingState = false}) async {
    try {
      if (!skipLoadingState) {
        _isLoadingPatients = true;
      }
      _clearError();

      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null || clinicId == null) {
        return;
      }

      print('👤 Loading clinic patients for filter dropdown...');

      final response = await _serviceRepo.requist(
        'clinic-specific-patients?clinic_id=$clinicId',
        method: 'GET',
        useOrgApi: true,
        token: token,
      ).timeout(const Duration(seconds: 15));

      if (response != null && response is Map<String, dynamic>) {
        final listResponse = ListClinicPatientsResponse.fromJson(response);
        _clinicPatients = listResponse.patients;
        print('✅ Loaded ${_clinicPatients.length} patients for filter');
        _safeNotifyListeners();
      } else {
        print('❌ Failed to load clinic patients');
        _clinicPatients = [];
        _safeNotifyListeners();
      }
    } catch (e) {
      print('❌ Error loading clinic patients: $e');
      _clinicPatients = [];
    } finally {
      _isLoadingPatients = false;
      _safeNotifyListeners();
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

      final response = await _repository.cancelAppointment(
        token: token,
        appointmentId: appointmentId,
      );

      if (response != null) {
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

  /// ✅ New: Record payment for an existing appointment
  Future<bool> confirmExistingPayment({
    required String appointmentId,
    required String paymentMethod,
    required double paidAmount,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return false;
      }

      print('💳 Recording payment for appointment: $appointmentId');
      print('   Method: $paymentMethod | Amount: $paidAmount');

      final success = await _repository.recordPayment(
        token: token,
        appointmentId: appointmentId,
        paymentMethod: paymentMethod,
        paidAmount: paidAmount,
      );

      if (success) {
        print('✅ Payment recorded successfully');
        // Refresh all relevant dashboard data to update financial stats and lists
        await Future.wait([
          loadSummary(skipLoadingState: true),
          loadClinicDashboard(skipLoadingState: true),
          loadSimpleAppointments(refresh: true, skipLoadingState: true),
          loadCollections(skipLoadingState: true),
        ]);
        return true;
      } else {
        _setError('Failed to record payment');
        return false;
      }
    } catch (e) {
      print('❌ Error recording payment: $e');
      _setError('Error: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Private helper methods
  String _formatDate(DateTime date) {
    final year = date.year;
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  String _resolveSummaryDate() {
    if (_selectedDate != null && _selectedDate!.isNotEmpty) {
      return _selectedDate!;
    }
    if (_currentFilterDate != null && _currentFilterDate!.isNotEmpty) {
      return _currentFilterDate!;
    }
    return _formatDate(DateTime.now());
  }

  void _setLoading(bool loading) {
    if (_disposed) return;
    _isLoading = loading;
    if (loading) {
      LoadingManager.show();
    } else {
      LoadingManager.hide();
    }
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
      success: true,
      clinicId: _authViewModel.user?.clinicId,
      date: _formatDate(DateTime.now()),
      counts: const AppointmentSummaryCounts(
        total: 0,
        confirmed: 0,
        arrived: 0,
        completed: 0,
        cancelled: 0,
        noShow: 0,
        pending: 0,
      ),
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
