import 'dart:async';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:drandme/modules/clinic/models/appointment_model.dart'
    hide PaymentMethod;
import 'package:drandme/modules/clinic/repositories/clinic_appointment_repository.dart';
import 'package:drandme/modules/superadmin/repositories/department_repository.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';
import 'package:drandme/modules/clinic/models/clinic_doctors_model.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/models/doctor_session_slot_model.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:drandme/modules/clinic/models/payment_method_model.dart';
import 'package:drandme/modules/clinic/repositories/doctor_session_slot_repository.dart';
import 'package:drandme/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:drandme/modules/clinic/repositories/doctor_consultation_fees_repository.dart';
import 'package:drandme/modules/clinic/models/doctor_consultation_fees_model.dart';
import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/country_code_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:drandme/core/utils/loading_manager.dart';

/// Search type enum for patient search
enum SearchType { mobile, moId, name }

class NewAppointmentViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ClinicAppointmentRepository _repository;
  final DepartmentRepository _departmentRepository;
  final DoctorSessionSlotRepository _sessionSlotRepository;
  final ClinicPatientRepository _clinicPatientRepository;
  final DoctorConsultationFeesRepository _consultationFeesRepository;
  final ServiceRepo _serviceRepo;

  // ✅ Debounce timer for search
  Timer? _searchDebounce;

  NewAppointmentViewModel(this._authViewModel)
    : _repository = ClinicAppointmentRepository(),
      _departmentRepository = DepartmentRepository(),
      _serviceRepo = ServiceRepo(),
      _sessionSlotRepository = DoctorSessionSlotRepository(ServiceRepo()),
      _clinicPatientRepository = ClinicPatientRepository(ServiceRepo()),
      _consultationFeesRepository = DoctorConsultationFeesRepository(ServiceRepo());

  // ✅ NEW: Navigation callback support
  Function(String)? onNavigateCallback;

  // State variables
  bool _isLoading = false;
  bool _isLoadingSlots = false; // ✅ Separate loading state for slots
  bool _isCreating = false;
  bool _disposed = false;
  String _error = '';

  // Form data
  String _selectedConsultationType =
      'clinic_visit'; // Default to clinic visit (matches consultationTypeOptions)
  String _selectedDepartment = 'Select Department';
  String? _selectedDepartmentId; // Track selected department ID
  String _selectedDoctor = 'Select Doctor'; // Will be updated when doctors load
  String _selectedDate = '16, July';
  String _selectedTimeSlot = '09:00 AM';
  String _selectedPaymentMethod = 'Pay Now';
  String _patientNotes = '';
  bool _isMobileSearch = true;
  String _searchQuery = '';
  CountryCode _selectedCountryCode = defaultCountryCode;
  SearchType _searchType = SearchType.mobile;

  // Payment method selection
  PaymentMethod _selectedPaymentMethodEnum =
      PaymentMethod.payNow; // Default to pay now
  PaymentType? _selectedPaymentType;

  // Selected slot details
  String? _selectedSlotId; // Use slot ID for unique identification
  DoctorTimeSlotResponse? _selectedSlotDetails;

  // Walk-in booking support
  String? _bookingMode = 'slot'; // 'slot' or 'walk_in'
  DoctorSlotSession? _selectedWalkInSession;

  // Rescheduling support
  String? _rescheduleAppointmentId;

  // Date selection for slot filtering
  DateTime _selectedSlotDate = DateTime.now();
  List<DateTime> _availableDates = [];
  DateTime _displayedMonth = DateTime.now(); // Track which month to display

  // Static consultation type options
  final List<String> consultationTypeOptions = [
    'clinic_visit', // Clinic Visit
    'video_consultation', // Video Consultation
    'follow-up-via-clinic', // Follow-Up (Clinic)
    'follow-up-via-video', // Follow-Up (Video)
  ];

  // Data lists
  List<Department> _departments = [];
  List<DepartmentModel> _departmentModels =
      []; // New department models from API
  List<Doctor> _doctors = [];
  List<ClinicDoctorModel> _clinicDoctors = []; // Filtered list for dropdown
  List<ClinicDoctorModel> _allClinicDoctors = []; // All doctors in clinic (with fees)
  List<ConsultationType> _consultationTypes = [];
  List<TimeSlot> _availableTimeSlots = [];
  List<AvailableSlot> _doctorTimeSlots = []; // Doctor time slots from API
  GroupedTimeSlotsResponse? _groupedTimeSlots; // Grouped time slots by day
  ListSessionSlotsResponse?
  _sessionSlotsResponse; // ✅ Store full session slots response for session grouping
  String? _selectedDoctorId; // Track selected doctor ID

  // Clinic-specific patients (NEW SYSTEM - RECOMMENDED)
  List<ClinicPatient> _clinicPatients = [];
  List<ClinicPatient> _clinicPatientSearchResults = [];
  ClinicPatient? _selectedClinicPatient;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingSlots => _isLoadingSlots; // ✅ New getter for slot loading
  bool get isCreating => _isCreating;
  String get error => _error;
  String get selectedConsultationType => _selectedConsultationType;
  String get selectedDepartment => _selectedDepartment;
  String? get selectedDepartmentId =>
      _selectedDepartmentId; // ✅ NEW: Expose department ID
  String get selectedDoctor => _selectedDoctor;

  /// Get the actual Doctor object from the selected doctor string
  ClinicDoctorModel? get selectedDoctorObject {
    if (_selectedDoctor.isEmpty || _clinicDoctors.isEmpty) return null;
    try {
      return _clinicDoctors.firstWhere(
        (d) =>
            (d.fullName ?? '${d.firstName} ${d.lastName}') == _selectedDoctor,
      );
    } catch (e) {
      return null;
    }
  }

  String get selectedDate => _selectedDate;
  String get selectedTimeSlot => _selectedTimeSlot;
  String get selectedPaymentMethod => _selectedPaymentMethod;
  String get patientNotes => _patientNotes;
  bool get isMobileSearch => _isMobileSearch;
  String get searchQuery => _searchQuery;
  String get lastPatientSearchQuery =>
      _lastPatientSearchQuery; // ✅ Expose for UI refresh
  CountryCode get selectedCountryCode => _selectedCountryCode;
  SearchType get searchType => _searchType;
  List<Department> get departments => _departments;
  List<DepartmentModel> get departmentModels => _departmentModels;
  List<Doctor> get doctors => _doctors;
  List<ClinicDoctorModel> get clinicDoctors => _clinicDoctors;
  List<ConsultationType> get consultationTypes => _consultationTypes;
  List<String> get consultationTypesList => consultationTypeOptions;
  List<TimeSlot> get availableTimeSlots => _availableTimeSlots;
  DateTime get selectedSlotDate => _selectedSlotDate;
  List<DateTime> get availableDates => _availableDates;
  DateTime get displayedMonth => _displayedMonth;
  GroupedTimeSlotsResponse? get groupedTimeSlots => _groupedTimeSlots;
  ListSessionSlotsResponse? get sessionSlotsResponse =>
      _sessionSlotsResponse; // ✅ Expose session slots response
  String? get selectedSlotId => _selectedSlotId;

  String? _originalSlotId;
  String? get originalSlotId => _originalSlotId;
  DoctorTimeSlotResponse? get selectedSlotDetails => _selectedSlotDetails;
  String? get bookingMode => _bookingMode;
  DoctorSlotSession? get selectedWalkInSession => _selectedWalkInSession;
  bool get isWalkIn => _bookingMode == 'walk_in';

  // ✅ NEW: Walk-in availability from API
  // Uses strict logic: ONLY allow walk-in if NO time slots are available
  bool get walkinAvailable {
    if (_sessionSlotsResponse == null) return false;

    // ✅ CRITICAL: If there are ANY available time slots, DON'T show walk-in
    // The user must select a time slot if available.
    if (totalAvailableSlots > 0) {
      return false;
    }

    // Trust API flag if strictly true
    if (_sessionSlotsResponse!.walkinAvailable) return true;

    // Fallback: If sessions are defined BUT NO slots are available, allow walk-in
    return _sessionSlotsResponse!.slots.isNotEmpty;
  }

  /// ✅ NEW: Get total count of available slots across all sessions
  int get totalAvailableSlots {
    if (_sessionSlotsResponse == null) return 0;
    int count = 0;
    for (var day in _sessionSlotsResponse!.slots) {
      for (var session in day.sessions) {
        count += session.availableSlots;
      }
    }
    return count;
  }

  String? get walkinReason => _sessionSlotsResponse?.walkinReason;

  List<ClinicPatient> get clinicPatients => _clinicPatients;
  List<ClinicPatient> get clinicPatientSearchResults =>
      _clinicPatientSearchResults;
  ClinicPatient? get selectedClinicPatient => _selectedClinicPatient;

  // Payment method getters
  PaymentMethod get selectedPaymentMethodEnum => _selectedPaymentMethodEnum;
  PaymentType? get selectedPaymentType => _selectedPaymentType;

  /// Get the current payment configuration
  AppointmentPayment get currentPayment => AppointmentPayment(
    method: _selectedPaymentMethodEnum,
    type: _selectedPaymentType,
  );

  // Get time slots (not filtered by date - filtering done by day of week match)
  List<AvailableSlot> get doctorTimeSlots {
    if (_doctorTimeSlots.isEmpty) return [];

    // Filter slots by selected date's day of week
    final selectedDayOfWeek = _selectedSlotDate.weekday;
    return _doctorTimeSlots
        .where((slot) => slot.dayOfWeek == selectedDayOfWeek)
        .toList();
  }

  // Helper to determine slot type based on consultation type
  String get slotType {
    if (_selectedConsultationType == 'video_consultation' ||
        _selectedConsultationType == 'follow-up-via-video') {
      return 'video_consultation';
    } else {
      return 'clinic_visit';
    }
  }

  // ✅ Helper to get slot type for loading slots (clinic_visit or video_consultation)
  String _getSlotTypeForApi(String consultationType) {
    if (consultationType == 'follow-up-via-clinic') {
      return 'clinic_visit'; // Load clinic visit slots
    } else if (consultationType == 'follow-up-via-video') {
      return 'video_consultation'; // Load video consultation slots
    } else {
      return consultationType; // Already clinic_visit or video_consultation
    }
  }

  Future<void> initialize() async {
    // Generate static date list on initialization
    _generateAvailableDates();

    // Load consultation types, departments, and ALL doctors (with fees)
    await Future.wait([
      loadDepartments(),
      loadConsultationTypes(),
      loadAllClinicDoctors(),
    ]);
  }

  // ✅ NEW: Load all clinic doctors with fees
  Future<void> loadAllClinicDoctors() async {
    try {
      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null || clinicId == null) return;

      print('🔄 Loading all clinic doctors (with fees)...');

      final response = await _serviceRepo.requist(
        'doctors/clinic/$clinicId',
        method: 'GET',
        useOrgApi: true,
        token: token,
      );

      if (response != null && response is Map<String, dynamic>) {
        final clinicDoctorsResponse = ClinicDoctorsResponse.fromJson(response);
        _allClinicDoctors = clinicDoctorsResponse.doctors;
        print('✅ Loaded ${_allClinicDoctors.length} clinic doctors with fees');
      }
    } catch (e) {
      print('❌ Error loading all clinic doctors: $e');
    }
  }

  // Load departments from new Department API (filtered by logged-in clinic)
  Future<void> loadDepartments() async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      // Get the logged-in user's clinic ID
      final clinicId = _authViewModel.user?.clinicId;

      print('🔄 Loading departments for clinic: $clinicId');

      // Load departments from new Department API filtered by clinic ID
      final departmentsList = await _departmentRepository.listDepartments(
        token: token,
        clinicId: clinicId, // Filter by logged-in clinic (can be null for all)
        onlyActive: true, // Only show active departments
      );

      if (departmentsList != null && departmentsList.isNotEmpty) {
        _departmentModels = departmentsList;

        print('✅ Loaded ${departmentsList.length} departments');

        // Convert to old Department model for compatibility
        _departments = departmentsList.map((dept) {
          return Department(
            id: dept.id,
            name: dept.name,
            description: dept.description,
          );
        }).toList();

        // Do NOT auto-select first department anymore
        _selectedDepartment = 'Select Department';
        _selectedDepartmentId = null;

        _safeNotifyListeners();
      } else {
        print('❌ No departments found');
        _setError('No departments found');
      }
    } catch (e) {
      print('❌ Error loading departments: $e');
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
      _consultationTypes = types;
      if (types.isNotEmpty) {
        _selectedConsultationType = types.first.name ?? 'Video';
      }
      _safeNotifyListeners();
    } catch (e) {
      _setError('Error loading consultation types: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load doctors by clinic ID
  Future<void> loadDoctorsByClinic() async {
    try {
      _setLoading(true);
      _clearError();

      final clinicId = _authViewModel.user?.clinicId;

      print('🔍 User clinic ID: $clinicId');

      if (clinicId == null || clinicId.isEmpty) {
        print('❌ Clinic ID is null or empty');
        _setError('User does not have a clinic assigned');
        return;
      }

      print('🔄 Fetching doctors for clinic: $clinicId');

      final response = await _serviceRepo.requist(
        'doctors/clinic/$clinicId',
        method: 'GET',
        useOrgApi: true,
        token: _authViewModel.accessToken,
      );

      print('📦 Response received: ${response != null}');

      if (response != null && response is Map<String, dynamic>) {
        print('✅ Parsing ClinicDoctorsResponse...');

        final clinicDoctorsResponse = ClinicDoctorsResponse.fromJson(response);

        _clinicDoctors = clinicDoctorsResponse.doctors;

        print(
          '✅ Successfully loaded ${clinicDoctorsResponse.totalDoctors ?? clinicDoctorsResponse.doctors.length} doctors',
        );

        // Convert to Doctor model
        _doctors = _clinicDoctors.map((clinicDoctor) {
          return Doctor(
            id: clinicDoctor.doctorId,
            firstName: clinicDoctor.firstName,
            lastName: clinicDoctor.lastName,
            fullName: clinicDoctor.fullName,
            email: clinicDoctor.email,
            phone: clinicDoctor.phone,
            specialization: clinicDoctor.specialization,
            isAvailable: clinicDoctor.isActive,
            consultationFee: clinicDoctor
                .clinicSpecificFees
                ?.consultationFeeOffline
                ?.toString(),
          );
        }).toList();

        if (_doctors.isNotEmpty) {
          // Do NOT auto-select first doctor anymore
          _selectedDoctor = 'Select Doctor';
          _selectedDoctorId = null;
          print('✅ Selected doctor: $_selectedDoctor');

          for (var i = 0; i < _clinicDoctors.length; i++) {
            final doc = _clinicDoctors[i];
            print('   👨‍⚕️ ${i + 1}. ${doc.fullName} - ${doc.specialization}');
          }
        }

        _safeNotifyListeners();
      } else {
        print('❌ Invalid response format');
        _setError('Failed to fetch doctors');
      }
    } catch (e) {
      print('❌ Error fetching clinic doctors: $e');
      _setError('Error loading doctors: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load doctors by department (old method - kept for compatibility)
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
      _doctors = doctors;
      if (doctors.isNotEmpty) {
        // Set selected doctor name to match dropdown format (without "Dr.")
        _selectedDoctor =
            '${doctors.first.firstName} ${doctors.first.lastName}';
      }
      _safeNotifyListeners();
    } catch (e) {
      _setError('Error loading doctors: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load available time slots (old method - kept for backward compatibility)
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

  // Generate available dates for the displayed month
  void _generateAvailableDates() {
    _availableDates.clear();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final year = _displayedMonth.year;
    final month = _displayedMonth.month;

    // Get the number of days in the month
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;

    final dates = <DateTime>[];

    // Generate dates for the displayed month, but only from today onwards
    for (int day = 1; day <= lastDayOfMonth; day++) {
      final date = DateTime(year, month, day);
      // Only add dates that are today or in the future
      if (!date.isBefore(today)) {
        dates.add(date);
      }
    }

    _availableDates = dates;

    print(
      '📅 Generated ${dates.length} future dates for ${_getMonthName(month)} $year',
    );
    print('🎯 Selected date: ${_selectedSlotDate.toString().substring(0, 10)}');
  }

  // Navigate to specific month
  void navigateToMonth(DateTime date) {
    _displayedMonth = DateTime(date.year, date.month, 1);
    _generateAvailableDates();
    _safeNotifyListeners();
    print('📅 Navigated to ${_getMonthName(date.month)} ${date.year}');
  }

  // Navigate to previous month
  void previousMonth() {
    _displayedMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month - 1,
      1,
    );
    _generateAvailableDates();
    _safeNotifyListeners();
    print(
      '⬅️ Previous month: ${_getMonthName(_displayedMonth.month)} ${_displayedMonth.year}',
    );
  }

  // Navigate to next month
  void nextMonth() {
    _displayedMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month + 1,
      1,
    );
    _generateAvailableDates();
    _safeNotifyListeners();
    print(
      '➡️ Next month: ${_getMonthName(_displayedMonth.month)} ${_displayedMonth.year}',
    );
  }

  // Helper to get month name
  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  // Set selected date for slot filtering
  void selectSlotDate(DateTime date) {
    // ✅ Validate date is not in the past
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final selectedDate = DateTime(date.year, date.month, date.day);

    if (selectedDate.isBefore(today)) {
      _setError(
        'Cannot select past date. Please select a date from today onwards.',
      );
      return;
    }

    _selectedSlotDate = selectedDate;
    final dateString =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    // Get weekday name for better logging
    final weekdayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    final weekdayName = weekdayNames[date.weekday - 1];

    print('');
    print('╔════════════════════════════════════════════════════════════════╗');
    print('║     DATE SELECTED - RELOADING SLOTS                           ║');
    print('╚════════════════════════════════════════════════════════════════╝');
    print('📅 Date selected: $dateString');
    print('📆 Day name: $weekdayName');
    print(
      '🔍 Day of week (Dart): ${_selectedSlotDate.weekday} (1=Monday, 7=Sunday)',
    );
    print(
      '🔍 Day of week (API): ${_selectedSlotDate.weekday % 7} (0=Sunday, 1=Monday, ..., 6=Saturday)',
    );
    print('💡 API will match recurring slots for this weekday');
    print('');

    // Reload slots if doctor is selected
    if (_selectedDoctorId != null) {
      loadGroupedTimeSlots(
        doctorId: _selectedDoctorId!,
        slotType: _getSlotTypeForApi(
          _selectedConsultationType,
        ), // ✅ Get slot type
        date:
            dateString, // ✅ Always pass date - API will match recurring slots by weekday
      );
    } else {
      print('⚠️ No doctor selected - cannot load slots');
    }

    _safeNotifyListeners();
  }

  // Get slots with remaining capacity info
  // For now, we'll use max_patients as remaining since we don't have booking count API
  // TODO: Integrate with appointment booking count API when available
  int getRemainingSlots(AvailableSlot slot) {
    // This is a placeholder - in a real implementation, you'd fetch
    // the count of booked appointments for this slot and subtract from max_patients
    return slot.maxPatients;
  }

  // ✅ Track last search query for auto-refresh
  String _lastPatientSearchQuery = '';

  // ✅ NEW: Store follow-up type from API validation
  bool _isFreeFollowUpFromAPI = false;

  // ✅ NEW: Store real-time follow-up status from API
  FollowUpEligibilityResponse? _currentFollowUpStatus;

  // ✅ NEW: Get current follow-up status for UI display
  FollowUpEligibilityResponse? get currentFollowUpStatus =>
      _currentFollowUpStatus;

  // ✅ UPDATED: Get follow-up status display info for UI using new API structure
  // ✅ Includes critical follow-up limit rules: Only ONE free follow-up per doctor/department
  Map<String, dynamic> getFollowUpStatusDisplay() {
    if (_selectedClinicPatient == null || _selectedDoctorId == null) {
      return {
        'status': 'unknown',
        'message': 'No patient/doctor selected',
        'color': Colors.grey,
        'icon': '❓',
      };
    }

    final patient = _selectedClinicPatient!;

    // ✅ NEW: Use new API structure with followUps array
    final matchingFollowUps = patient.followUps
        .where(
          (fu) =>
              fu.doctorId == _selectedDoctorId &&
              (_selectedDepartmentId == null ||
                  fu.departmentId == _selectedDepartmentId),
        )
        .toList();

    // ✅ CRITICAL CHECK 1: Check if follow-up status is "used" in followUps array
    final hasUsedFollowUp = matchingFollowUps.any((fu) => fu.status == 'used');
    if (hasUsedFollowUp) {
      return {
        'status': 'used',
        'message': 'Free follow-up already used. Next one requires payment.',
        'color': Colors.orange,
        'icon': '⚠️',
        'isEligible': false,
        'isFree': false,
        'showPaidOption': true,
        'showFreeOption': false,
      };
    }

    // ✅ CRITICAL CHECK 2: Check if patient has used follow-ups using extension
    if (patient.usedFollowUps.isNotEmpty) {
      final matchingUsedFollowUps = patient.usedFollowUps
          .where(
            (fu) =>
                fu.doctorId == _selectedDoctorId &&
                (_selectedDepartmentId == null ||
                    fu.departmentId == _selectedDepartmentId),
          )
          .toList();

      if (matchingUsedFollowUps.isNotEmpty) {
        return {
          'status': 'used',
          'message': 'Free follow-up already used. Next one requires payment.',
          'color': Colors.orange,
          'icon': '⚠️',
          'isEligible': false,
          'isFree': false,
          'showPaidOption': true,
          'showFreeOption': false,
        };
      }
    }

    if (matchingFollowUps.isEmpty) {
      // ✅ CRITICAL: Check if patient already USED their free follow-up
      // by checking appointment history for follow-up appointments
      final hasUsedFreeFollowUpAppointment = patient.appointments.any(
        (apt) =>
            apt.doctorId == _selectedDoctorId &&
            (_selectedDepartmentId == null ||
                apt.departmentId == _selectedDepartmentId) &&
            apt.isFollowUpAppointment, // Check if they booked a follow-up appointment
      );

      if (hasUsedFreeFollowUpAppointment) {
        // ✅ Patient already used their FREE follow-up
        // Must book PAID follow-up now
        return {
          'status': 'used',
          'message': 'Free follow-up already used. Next one requires payment.',
          'color': Colors.orange,
          'icon': '⚠️',
          'isEligible': true,
          'isFree': false,
          'showPaidOption': true,
          'showFreeOption': false,
        };
      }

      // Check if patient has any regular appointments with this doctor
      final hasRegularAppointments = patient.appointments.any(
        (apt) =>
            apt.doctorId == _selectedDoctorId &&
            (_selectedDepartmentId == null ||
                apt.departmentId == _selectedDepartmentId) &&
            !apt.isFollowUpAppointment, // Regular appointment
      );

      if (!hasRegularAppointments) {
        // No previous appointment - can't book follow-up
        return {
          'status': 'not_eligible',
          'message':
              'No previous regular appointment found. Please book a regular appointment first.',
          'color': Colors.grey,
          'icon': '⚪',
          'isEligible': false,
          'showPaidOption': false,
          'showFreeOption': false,
        };
      }

      // ✅ PATIENT HAS REGULAR APPOINTMENTS BUT NO FOLLOW-UPS YET
      // This means they need to book a REGULAR appointment (not follow-up)
      // Regular appointment will create a FREE follow-up for next time
      return {
        'status': 'needs_regular',
        'message':
            'No follow-up available yet. Book a regular appointment and get a FREE follow-up for your next visit (valid 5 days)!',
        'color': Colors.blue,
        'icon': '📅',
        'isEligible': false,
        'isFree': false,
        'showPaidOption': false,
        'showFreeOption': false,
        'shouldBookRegular': true,
      };
    }

    final activeFollowUp = matchingFollowUps.firstWhere(
      (fu) => fu.status == 'active',
      orElse: () => matchingFollowUps.first,
    );

    if (activeFollowUp.status == 'active') {
      final daysRemaining = activeFollowUp.daysRemaining ?? 0;

      if (activeFollowUp.isFree) {
        return {
          'status': 'free',
          'message':
              'FREE follow-up available! This is your ONE free follow-up with this doctor. $daysRemaining days remaining',
          'color': Colors.green,
          'icon': '🟢',
          'daysRemaining': daysRemaining,
          'isEligible': true,
          'isFree': true,
          'showPaidOption': false,
          'showFreeOption': true,
        };
      } else {
        return {
          'status': 'paid',
          'message':
              'Free follow-up already used. This follow-up requires payment.',
          'color': Colors.orange,
          'icon': '🟠',
          'isEligible': true,
          'isFree': false,
          'showPaidOption': true,
          'showFreeOption': false,
        };
      }
    }

    // Follow-up expired
    if (activeFollowUp.status == 'expired') {
      final daysRemaining = activeFollowUp.daysRemaining ?? 0;
      return {
        'status': 'expired',
        'message':
            'Free follow-up expired. This follow-up requires payment. To renew, book a new regular appointment!',
        'color': Colors.orange,
        'icon': '⏰',
        'daysRemaining': daysRemaining,
        'isEligible': true,
        'isFree': false,
        'showPaidOption': true,
        'showFreeOption': false,
        'canRenew': true,
      };
    }

    return {
      'status': 'paid',
      'message': 'This follow-up requires payment',
      'color': Colors.orange,
      'icon': '🟠',
      'isEligible': true,
      'isFree': false,
      'showPaidOption': true,
      'showFreeOption': false,
    };
  }

  /// ✅ NEW: Get detailed follow-up eligibility info for UI display
  Map<String, dynamic> getDetailedFollowUpInfo() {
    final status = getFollowUpStatusDisplay();

    return {
      ...status,
      'isOnlyFreeFollowUp':
          status['status'] == 'free' && status['isFree'] == true,
      'hasUsedFreeFollowUp': status['status'] == 'used',
      'isFreeFollowUpExpired': status['status'] == 'expired',
      'message': _getFollowUpMessage(status),
    };
  }

  /// ✅ Get appropriate message for follow-up status
  String _getFollowUpMessage(Map<String, dynamic> status) {
    final statusType = status['status'] as String?;
    final isFree = status['isFree'] as bool?;
    final daysRemaining = status['daysRemaining'] as int?;

    if (statusType == 'free' && isFree == true) {
      return '✅ FREE follow-up available! This is your ONE free follow-up with this doctor. $daysRemaining days remaining. Use it within 5 days!';
    }

    if (statusType == 'used') {
      return '⚠️ You have already used your free follow-up. Next follow-up requires payment.';
    }

    if (statusType == 'expired') {
      return '⏰ Free follow-up expired. This follow-up requires payment. To renew your free follow-up, book a new regular appointment with this doctor!';
    }

    if (statusType == 'not_eligible') {
      return 'No previous regular appointment found with this doctor. Please book a regular appointment first.';
    }

    if (statusType == 'needs_regular') {
      return '📅 No follow-up available yet. Book a regular appointment now and get a FREE follow-up for your next visit (valid for 5 days)!';
    }

    return 'This follow-up requires payment.';
  }

  // ✅ UPDATED: Check follow-up status using patient data directly (no API call needed)
  Future<void> checkFollowUpStatusForUI() async {
    if (_selectedClinicPatient == null || _selectedDoctorId == null) {
      _currentFollowUpStatus = null;
      _safeNotifyListeners();
      return;
    }

    try {
      final patient = _selectedClinicPatient!;
      print('🔄 Checking follow-up status from patient data...');

      // ✅ Use new API structure - no separate API call needed!
      final matchingFollowUps = patient.followUps
          .where(
            (fu) =>
                fu.doctorId == _selectedDoctorId &&
                (_selectedDepartmentId == null ||
                    fu.departmentId == _selectedDepartmentId),
          )
          .toList();

      print('✅ Found ${matchingFollowUps.length} matching follow-ups');

      if (matchingFollowUps.isNotEmpty) {
        final activeFollowUp = matchingFollowUps.firstWhere(
          (fu) => fu.status == 'active',
          orElse: () => matchingFollowUps.first,
        );

        print('   Status: ${activeFollowUp.status}');
        print('   Is Free: ${activeFollowUp.isFree}');
        print('   Days Remaining: ${activeFollowUp.daysRemaining}');
      } else {
        print('   No active follow-ups found');
      }

      _safeNotifyListeners();
    } catch (e) {
      print('❌ Error checking follow-up status: $e');
      _currentFollowUpStatus = null;
      _safeNotifyListeners();
    }
  }

  /// ✅ NEW: Get patient's appointments list for display
  List<AppointmentDetail> getPatientAppointments() {
    if (_selectedClinicPatient == null) {
      return [];
    }
    return _selectedClinicPatient!.appointments;
  }

  /// ✅ NEW: Get patient's follow-ups list for display
  List<FollowUpDetail> getPatientFollowUps() {
    if (_selectedClinicPatient == null) {
      return [];
    }
    return _selectedClinicPatient!.followUps;
  }

  /// ✅ NEW: Get follow-up details for specific doctor+department
  FollowUpDetail? getFollowUpForCurrentDoctor() {
    if (_selectedClinicPatient == null || _selectedDoctorId == null) {
      return null;
    }

    try {
      return _selectedClinicPatient!.followUps.firstWhere(
        (fu) =>
            fu.doctorId == _selectedDoctorId &&
            (_selectedDepartmentId == null ||
                fu.departmentId == _selectedDepartmentId),
      );
    } catch (e) {
      return null;
    }
  }

  /// ✅ NEW: Check if follow-up booking is eligible and free
  Map<String, dynamic> checkFollowUpBookingEligibility() {
    if (_selectedClinicPatient == null || _selectedDoctorId == null) {
      return {
        'eligible': false,
        'isFree': false,
        'message': 'No patient or doctor selected',
        'status': 'not_eligible',
      };
    }

    final patient = _selectedClinicPatient!;

    // Check for active follow-ups
    final matchingFollowUps = patient.followUps
        .where(
          (fu) =>
              fu.doctorId == _selectedDoctorId &&
              (_selectedDepartmentId == null ||
                  fu.departmentId == _selectedDepartmentId),
        )
        .toList();

    if (matchingFollowUps.isEmpty) {
      return {
        'eligible': false,
        'isFree': false,
        'message': 'No active follow-up available',
        'status': 'no_followup',
      };
    }

    final activeFollowUp = matchingFollowUps.firstWhere(
      (fu) => fu.status == 'active',
      orElse: () => matchingFollowUps.first,
    );

    if (activeFollowUp.status != 'active') {
      return {
        'eligible': false,
        'isFree': false,
        'message': 'Follow-up is ${activeFollowUp.status}',
        'status': activeFollowUp.status,
      };
    }

    final daysRemaining = activeFollowUp.daysRemaining ?? 0;
    final isFree = activeFollowUp.isFree;

    return {
      'eligible': true,
      'isFree': isFree,
      'message': isFree
          ? 'FREE follow-up available! $daysRemaining days remaining.'
          : 'PAID follow-up available. $daysRemaining days remaining.',
      'status': 'active',
      'daysRemaining': daysRemaining,
      'validUntil': activeFollowUp.validUntil,
      'followUpId': activeFollowUp.followUpId,
    };
  }

  /// ✅ NEW: Get complete patient details including appointments and follow-ups
  Map<String, dynamic> getPatientDetailsWithAppointments() {
    if (_selectedClinicPatient == null) {
      return {
        'patient': null,
        'appointments': [],
        'followUps': [],
        'hasAppointments': false,
        'hasFollowUps': false,
      };
    }

    final patient = _selectedClinicPatient!;

    return {
      'patient': {
        'id': patient.id,
        'firstName': patient.firstName,
        'lastName': patient.lastName,
        'phone': patient.phone,
        'moId': patient.moId,
        'currentFollowupStatus': patient.currentFollowupStatus,
        'lastAppointmentId': patient.lastAppointmentId,
        'lastFollowupId': patient.lastFollowupId,
      },
      'appointments': patient.appointments,
      'followUps': patient.followUps,
      'hasAppointments': patient.appointments.isNotEmpty,
      'hasFollowUps': patient.followUps.isNotEmpty,
      'regularAppointments': patient.appointments
          .where((apt) => !apt.isFollowUpAppointment)
          .toList(),
      'followUpAppointments': patient.appointments
          .where((apt) => apt.isFollowUpAppointment)
          .toList(),
      'activeFollowUps': patient.followUps
          .where((fu) => fu.status == 'active')
          .toList(),
    };
  }

  // ✅ NEW: Refresh patient search with last query (for manual refresh)
  Future<void> refreshPatientSearch() async {
    if (_lastPatientSearchQuery.isEmpty) {
      print('⚠️ No previous search to refresh');
      return;
    }

    print('🔄 Manual refresh requested...');
    await searchClinicPatients(_lastPatientSearchQuery);
  }

  // Search clinic-specific patients
  Future<void> searchClinicPatients(String query) async {
    // ✅ FORCE CLEAR: Always clear selection when searching
    // This prevents all cards from showing as "selected"
    _selectedClinicPatient = null;

    // ✅ Store query for auto-refresh when doctor/department changes
    _lastPatientSearchQuery = query;

    if (query.isEmpty) {
      _clinicPatientSearchResults = []; // ✅ Use assignment instead of clear()
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

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null) {
        _setError('Clinic ID not found');
        return;
      }

      print('🔍 Searching patients with context:');
      print('   Query: "$query"');
      print('   Doctor ID: $_selectedDoctorId');
      print('   Department ID: $_selectedDepartmentId');

      // ✅ Pass doctor and department context for accurate follow-up eligibility
      final response = await _clinicPatientRepository.searchPatients(
        token: token,
        clinicId: clinicId,
        searchQuery: query,
        onlyActive: true,
        doctorId: _selectedDoctorId, // ✅ Contextual eligibility
        departmentId: _selectedDepartmentId, // ✅ Contextual eligibility
      );

      if (response != null) {
        _clinicPatientSearchResults = List<ClinicPatient>.from(
          response.patients,
        );
        print('✅ Found ${response.patients.length} patients matching query');
        _safeNotifyListeners();
      } else {
        _clinicPatientSearchResults = <ClinicPatient>[];
        _safeNotifyListeners();
      }
    } catch (e) {
      print('Error searching clinic patients: $e');
      _setError('Error searching patients: $e');
      _clinicPatientSearchResults = <ClinicPatient>[];
      _safeNotifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Create clinic-specific patient (quick registration with enhanced fields)
  Future<ClinicPatient?> createClinicPatient({
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
    int? age,
    String? gender,
    String? address,
    String? dateOfBirth,
  }) async {
    try {
      _setCreating(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return null;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null) {
        _setError('Clinic ID not found');
        return null;
      }

      final response = await _clinicPatientRepository.createPatient(
        token: token,
        clinicId: clinicId,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        age: age,
        gender: gender,
        address: address,
        dateOfBirth: dateOfBirth,
      );

      if (response != null) {
        // Add to local list
        _clinicPatients.add(response.patient);
        // Set as selected patient
        _selectedClinicPatient = response.patient;
        _safeNotifyListeners();
        return response.patient;
      } else {
        _setError('Failed to create patient');
        return null;
      }
    } catch (e) {
      print('Error creating clinic patient: $e');
      _setError('Error creating patient: $e');
      return null;
    } finally {
      _setCreating(false);
    }
  }

  // Select clinic patient
  void selectClinicPatient(ClinicPatient patient) {
    _selectedClinicPatient = patient;

    // ✅ Remove selected patient from search results
    _clinicPatientSearchResults.removeWhere((p) => p.id == patient.id);

    // ✅ Keep search query visible
    // _searchQuery = ''; // Keep search query visible

    print('✅ Patient selected: ${patient.firstName} ${patient.lastName}');
    print('   Patient removed from search results');
    print('   Search query kept visible');

    // ✅ NEW: Check follow-up status when patient is selected (uses patient data directly)
    _checkFollowUpStatusForSelectedPatient(patient);

    _safeNotifyListeners();
  }

  /// ✅ NEW: Check follow-up status for selected patient using data directly
  void _checkFollowUpStatusForSelectedPatient(ClinicPatient patient) {
    if (_selectedDoctorId == null) {
      print('   ⚠️ No doctor selected yet - skipping follow-up check');
      return;
    }

    try {
      print('   🔍 Checking follow-up status from patient data...');

      // ✅ Check if patient has active follow-ups for this doctor+department
      final matchingFollowUps = patient.followUps
          .where(
            (fu) =>
                fu.doctorId == _selectedDoctorId &&
                (_selectedDepartmentId == null ||
                    fu.departmentId == _selectedDepartmentId),
          )
          .toList();

      if (matchingFollowUps.isNotEmpty) {
        final activeFollowUp = matchingFollowUps.firstWhere(
          (fu) => fu.status == 'active',
          orElse: () => matchingFollowUps.first,
        );

        if (activeFollowUp.status == 'active') {
          final daysRemaining = activeFollowUp.daysRemaining ?? 0;
          final isFree = activeFollowUp.isFree;

          if (isFree) {
            print(
              '   🟢 FREE follow-up available ($daysRemaining days remaining)',
            );
          } else {
            print(
              '   🟠 PAID follow-up available ($daysRemaining days remaining)',
            );
          }
        } else {
          print('   ⚪ Follow-up status: ${activeFollowUp.status}');
        }
      } else {
        print('   ⚪ No active follow-ups found for this doctor');

        // Check if patient has any appointments
        final hasAppointments = patient.appointments.any(
          (apt) =>
              apt.doctorId == _selectedDoctorId &&
              (_selectedDepartmentId == null ||
                  apt.departmentId == _selectedDepartmentId) &&
              !apt.isFollowUpAppointment,
        );

        if (hasAppointments) {
          print('   📋 Has appointments but no active follow-up');
        } else {
          print('   📋 No previous appointments found');
        }
      }
    } catch (e) {
      print('   ❌ Error checking follow-up status: $e');
    }
  }

  // ✅ UPDATED: Validate follow-up eligibility using patient data directly (no API call needed!)
  // ✅ CRITICAL: Also checks appointment history to prevent multiple free follow-ups!
  // This uses patient's followUps array + appointment history - faster and more reliable!
  // Returns: true if eligible, false if not eligible
  // Sets _isFreeFollowUp flag based on patient data
  Future<bool> _validateFollowUpEligibility(ClinicPatient patient) async {
    print('');
    print('🔍 Validating follow-up eligibility (DATA-BASED)...');
    print('   Selected Consultation Type: $_selectedConsultationType');
    print('   Selected Doctor ID: $_selectedDoctorId');
    print('   Selected Department ID: $_selectedDepartmentId');
    print('   Patient: ${patient.firstName} ${patient.lastName}');

    // ✅ Rule 1: Check if doctor is selected
    if (_selectedDoctorId == null || _selectedDoctorId!.isEmpty) {
      _setError('❌ Please select a doctor first');
      return false;
    }

    // ✅ NEW: Use patient's followUps array directly (no API call!)
    try {
      print('🔄 Checking follow-up from patient data...');

      // Find matching follow-ups for this doctor+department
      final matchingFollowUps = patient.followUps
          .where(
            (fu) =>
                fu.doctorId == _selectedDoctorId &&
                (_selectedDepartmentId == null ||
                    fu.departmentId == _selectedDepartmentId),
          )
          .toList();

      print('   Found ${matchingFollowUps.length} matching follow-ups');

      // ✅ CRITICAL CHECK 1: Check if any follow-ups are "used" (already consumed)
      final hasUsedFollowUp = matchingFollowUps.any(
        (fu) => fu.status == 'used',
      );
      if (hasUsedFollowUp) {
        print('⚠️ Follow-up is already USED (status: used)');
        print('   Found used follow-up in followUps array');
        print('   ❌ Cannot book FREE follow-up - already consumed');
        print('   ✅ Must book PAID follow-up');
        _isFreeFollowUpFromAPI = false;
        return true; // ✅ Allow PAID follow-up (but not FREE)
      }

      // ✅ CRITICAL CHECK 2: Check patient's used follow-ups using extension
      if (patient.usedFollowUps.isNotEmpty) {
        final matchingUsedFollowUps = patient.usedFollowUps
            .where(
              (fu) =>
                  fu.doctorId == _selectedDoctorId &&
                  (_selectedDepartmentId == null ||
                      fu.departmentId == _selectedDepartmentId),
            )
            .toList();

        if (matchingUsedFollowUps.isNotEmpty) {
          print('⚠️ Patient has USED follow-ups for this doctor!');
          print('   Found ${matchingUsedFollowUps.length} used follow-ups');
          print('   ❌ Cannot book FREE follow-up - already consumed');
          print('   ✅ Must book PAID follow-up');
          _isFreeFollowUpFromAPI = false;
          return true; // ✅ Allow PAID follow-up (but not FREE)
        }
      }

      // ✅ CRITICAL CHECK 2: Check if patient already booked a follow-up appointment (consumed free follow-up)
      final hasUsedFreeFollowUpAppointment = patient.appointments.any(
        (apt) =>
            apt.doctorId == _selectedDoctorId &&
            (_selectedDepartmentId == null ||
                apt.departmentId == _selectedDepartmentId) &&
            apt.isFollowUpAppointment, // This is a follow-up appointment
      );

      if (hasUsedFreeFollowUpAppointment) {
        print('⚠️ Patient already used their FREE follow-up!');
        print('   Checking appointment history...');
        final followUpAppointments = patient.appointments
            .where(
              (apt) =>
                  apt.doctorId == _selectedDoctorId &&
                  (_selectedDepartmentId == null ||
                      apt.departmentId == _selectedDepartmentId) &&
                  apt.isFollowUpAppointment,
            )
            .length;
        print(
          '   Found $followUpAppointments follow-up appointments in history',
        );
        print('   ❌ Free follow-up already used - next one must be PAID');
        print('   ✅ Allowing PAID follow-up booking only');
        _isFreeFollowUpFromAPI = false;
        return true; // ✅ Allow PAID follow-up (but not FREE)
      }

      if (matchingFollowUps.isEmpty) {
        // Check if patient has any regular appointments with this doctor
        final hasAppointments = patient.appointments.any(
          (apt) =>
              apt.doctorId == _selectedDoctorId &&
              (_selectedDepartmentId == null ||
                  apt.departmentId == _selectedDepartmentId) &&
              !apt.isFollowUpAppointment,
        );

        if (!hasAppointments) {
          print('❌ No previous appointment found');
          _setError('❌ No previous appointment found with this doctor');
          return false;
        }

        print('⚠️ No active follow-up found - paid follow-up required');
        _isFreeFollowUpFromAPI = false;
        return true; // Can book paid follow-up
      }

      // Check for active follow-up
      final activeFollowUp = matchingFollowUps.firstWhere(
        (fu) => fu.status == 'active',
        orElse: () => matchingFollowUps.first,
      );

      if (activeFollowUp.status == 'active') {
        final isFree = activeFollowUp.isFree;
        final daysRemaining = activeFollowUp.daysRemaining ?? 0;

        if (isFree) {
          print('✅ FREE Follow-up eligible!');
          print('   Days remaining: $daysRemaining');
          print('   Valid until: ${activeFollowUp.validUntil}');
          _isFreeFollowUpFromAPI = true;
          return true;
        } else {
          print('⚠️ Active follow-up found but is paid');
          _isFreeFollowUpFromAPI = false;
          return true; // Can book paid follow-up
        }
      } else {
        print('⚠️ Follow-up is ${activeFollowUp.status}');
        _isFreeFollowUpFromAPI = false;
        return true; // Can book paid follow-up
      }
    } catch (e) {
      print('❌ Error checking follow-up eligibility: $e');
      _setError('❌ Error checking follow-up eligibility: $e');
      return false;
    }
  }

  // ✅ Deselect clinic patient
  void deselectClinicPatient() {
    _selectedClinicPatient = null;
    _searchQuery = '';
    _clinicPatientSearchResults = [];

    print('❌ Patient deselected');

    _safeNotifyListeners();
  }

  // Load all clinic patients
  Future<void> loadClinicPatients() async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null) {
        _setError('Clinic ID not found');
        return;
      }

      // ✅ Pass doctor and department context for accurate follow-up eligibility
      final response = await _clinicPatientRepository.listPatients(
        token: token,
        clinicId: clinicId,
        onlyActive: true,
        doctorId: _selectedDoctorId, // ✅ Contextual eligibility
        departmentId: _selectedDepartmentId, // ✅ Contextual eligibility
      );

      if (response != null) {
        _clinicPatients = response.patients;
        _safeNotifyListeners();
      } else {
        _clinicPatients = [];
        _safeNotifyListeners();
      }
    } catch (e) {
      print('Error loading clinic patients: $e');
      _setError('Error loading patients: $e');
      _clinicPatients = [];
      _safeNotifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Create appointment using simple API (clinic patients)
  Future<SimpleAppointmentResponse?> createSimpleAppointment() async {
    // Validate clinic patient
    if (_selectedClinicPatient == null) {
      _setError('Please select a patient');
      return null;
    }

    // Validate doctor
    if (_selectedDoctorId == null || _selectedDoctorId!.isEmpty) {
      _setError('Please select a doctor');
      return null;
    }

    // ✅ NEW: Validation Logic Update
    // 1. If user selected a slot: OK
    // 2. If user selected NO slot, check if Walk-in is allowed:
    //    - If Walk-in allowed: Auto-switch to Walk-in mode.
    //    - If Walk-in NOT allowed: Show error "Please select a time slot".

    // ✅ CRITICAL FIX: Skip slot validation completely if ALREADY in Walk-in mode
    // This allows manual walk-in selection to bypass "Select Slot" error
    if (_bookingMode == 'walk_in') {
      print('🚶 Booking Mode is Walk-in - Skipping slot validation');
    } else {
      // Logic for 'slot' mode:
      // 1. If slot selected: OK
      // 2. If NO slot selected:
      //    - If Walk-in available: Auto-switch to Walk-in
      //    - If Walk-in NOT available: Validtion Error

      if (_selectedSlotId == null || _selectedSlotId!.isEmpty) {
        if (walkinAvailable) {
          print('⚠️ No slot selected but Walk-in available. Auto-switching.');
          setGeneralWalkInMode();
          // Proceed...
        } else {
          _setError('Please select a time slot');
          return null;
        }
      }
    }

    /*
    if (_bookingMode == 'walk_in' && _selectedWalkInSession == null) {
      _setError('Please select a session for walk-in');
      return null;
    }
    */

    // ✅ Check if this is a follow-up appointment - ONLY when user selected follow-up type
    final isFollowUp = _selectedConsultationType.startsWith('follow-up');

    // ✅ API-BASED: Validate follow-up eligibility using real-time backend data
    bool isFreeFollowUp = false;
    if (isFollowUp) {
      print('🔄 Validating follow-up eligibility before booking...');
      final isValid = await _validateFollowUpEligibility(
        _selectedClinicPatient!,
      );
      if (!isValid) {
        return null; // Validation failed, error already set
      } 

      // Use the follow-up type determined by API validation
      isFreeFollowUp = _isFreeFollowUpFromAPI;
      print(
        '✅ Follow-up type determined by API: ${isFreeFollowUp ? 'FREE' : 'PAID'}',
      );
    }

    // ✅ Skip payment validation ONLY for FREE follow-up appointments
    if (!isFreeFollowUp) {
      //  
      if (_selectedPaymentMethodEnum == PaymentMethod.payLater ||
          _selectedPaymentMethodEnum == PaymentMethod.wayOff) {
        if (!isPaymentValid()) {
          _setError(
            getPaymentValidationError() ?? 'Invalid payment configuration',
          );
          return null;
        }
      }

      // For payNow, validate that payment type is selected (called from popup after user selects type)
      if (_selectedPaymentMethodEnum == PaymentMethod.payNow) {
        if (_selectedPaymentType == null) {
          _setError('Please select payment type (Cash/Card/UPI)');
          return null;
        }
      }
    }

    try {
      _setCreating(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return null;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null) {
        _setError('Clinic ID not found');
        return null;
      }

      // Format appointment time (YYYY-MM-DD HH:MM:SS)
      final appointmentDateTime = DateTime.parse(
        _selectedSlotDate.toString().split(' ')[0],
      );
      final appointmentDate =
          '${appointmentDateTime.year}-${appointmentDateTime.month.toString().padLeft(2, '0')}-${appointmentDateTime.day.toString().padLeft(2, '0')}';

      // Get time from selected slot details
      String appointmentTime;
      if (_bookingMode == 'walk_in' && _selectedWalkInSession != null) {
        // Use session start time for walk-in
        final timeStr = _extractTimeFromSlot(
          _selectedWalkInSession!.startTime ?? '00:00',
        );
        appointmentTime = '$appointmentDate $timeStr:00';
      } else if (_selectedSlotDetails != null) {
        // Extract HH:MM from slot start time (handles both HH:MM and ISO formats)
        final timeStr = _extractTimeFromSlot(_selectedSlotDetails!.startTime);
        appointmentTime = '$appointmentDate $timeStr:00';
      } else {
        // Fallback to current time if no slot details
        final now = DateTime.now();
        appointmentTime =
            '$appointmentDate ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:00';
      }

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        isFollowUp
            ? '║     BOOKING FOLLOW-UP APPOINTMENT (FREE)                      ║'
            : '║     BOOKING APPOINTMENT                                        ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print(
        '👤 Patient: ${_selectedClinicPatient!.firstName} ${_selectedClinicPatient!.lastName}',
      );
      print('👨‍⚕️ Doctor ID: $_selectedDoctorId');
      print('🏥 Clinic ID: $clinicId');
      if (_selectedDepartmentId != null) {
        print(
          '🏢 Department: $_selectedDepartment (ID: $_selectedDepartmentId)',
        );
      }
      print('🎫 Slot ID: $_selectedSlotId');
      print('📅 Date: $appointmentDate');
      print('🕐 Time: $appointmentTime');
      print('💻 Type: $_selectedConsultationType');

      // ✅ Send consultation type directly - backend auto-detects follow-up
      // ✅ Fix: Only pass departmentId if it's not null or empty
      final result = await _repository.createSimpleAppointment(
        token: token,
        clinicPatientId: _selectedClinicPatient!.id,
        doctorId: _selectedDoctorId!,
        clinicId: clinicId,
        individualSlotId:
            _selectedSlotId ?? '', // Repository will omit if walk_in
        appointmentDate: appointmentDate,
        appointmentTime: appointmentTime,
        consultationType: _selectedConsultationType,
        departmentId: _selectedDepartmentId,
        reason: _patientNotes,
        notes: _patientNotes,
        paymentMethod: isFreeFollowUp
            ? null
            : _paymentMethodToApiString(
                _selectedPaymentMethodEnum,
              ), // ✅ Use helper for correct strings (pay_now, pay_later, way_off)
        paymentType:
            _selectedPaymentType?.name, // ✅ Use .name (cash, card, upi)
        bookingMode: _bookingMode, // ✅ NEW: walk_in or slot
        appointmentMode: (_selectedConsultationType == 'video_consultation' || 
                         _selectedConsultationType == 'follow-up-via-video') 
                         ? 'online' : 'offline', // ✅ NEW: online or offline
      );

      if (result != null) {
        print('✅ Appointment booked successfully!');
        print('   Booking Number: ${result.appointment.bookingNumber}');
        print('   Token Number: #${result.appointment.tokenNumber}');
        print('   Consultation Type: $_selectedConsultationType');
        print('   Is Follow-Up: $isFollowUp');
        print('   Is Free Follow-Up: $isFreeFollowUp');

        // ✅ DEBUG: Check API response against documentation
        print('');
        print('🔍 API RESPONSE VERIFICATION:');
        print('   Response Type: ${result.runtimeType}');

        // ✅ NEW: Check for new API response fields
        if (result.followupGranted != null) {
          print(
            '   ✅ Response includes followup_granted: ${result.followupGranted}',
          );
        }

        if (result.followupMessage != null) {
          print(
            '   ✅ Response includes followup_message: ${result.followupMessage}',
          );
        }

        if (result.followupValidUntil != null) {
          print('   ✅ Follow-up valid until: ${result.followupValidUntil}');
        }

        if (result.followUp != null) {
          print('   ✅ Follow-up info received');
          print('      Status: ${result.followUp!.followUpStatus}');
          print('      Days Remaining: ${result.followUp!.daysRemaining}');
          print('      Is Free: ${result.followUp!.isFree}');
        }

        if (result.clinicPatientUpdate != null) {
          print('   ✅ Patient status updated');
          print(
            '      Current Status: ${result.clinicPatientUpdate!.currentFollowupStatus}',
          );
          print(
            '      Last Appointment: ${result.clinicPatientUpdate!.lastAppointmentId}',
          );
          print(
            '      Last Follow-up: ${result.clinicPatientUpdate!.lastFollowupId}',
          );
        }

        // ✅ DEBUG: Check if follow-up should have been created
        if (_selectedConsultationType == 'clinic_visit' ||
            _selectedConsultationType == 'video_consultation') {
          print('');
          print('🔄 REGULAR APPOINTMENT BOOKED - Follow-up should be created!');
          print(
            '   Patient: ${_selectedClinicPatient!.firstName} ${_selectedClinicPatient!.lastName}',
          );
          print('   Doctor ID: $_selectedDoctorId');
          print('   Department ID: $_selectedDepartmentId');
          print('   ✅ API Response (NEW FORMAT):');
          print(
            '     - is_regular_appointment: ${result.isRegularAppointment}',
          );
          print('     - followup_granted: ${result.followupGranted}');
          print('     - followup_message: ${result.followupMessage}');
          print('     - followup_valid_until: ${result.followupValidUntil}');
          print(
            '     - follow_up: ${result.followUp != null ? 'Present' : 'Null'}',
          );
          print(
            '     - clinic_patient_update: ${result.clinicPatientUpdate != null ? 'Present' : 'Null'}',
          );
        } else if (isFollowUp) {
          print('');
          print('🔄 FOLLOW-UP APPOINTMENT BOOKED');
          print('   ✅ API Response (NEW FORMAT):');
          print('     - is_free_followup: ${result.isFreeFollowup}');
          print('     - followup_type: ${result.followupType}');
          print(
            '     - follow_up_info: ${result.followUpInfo != null ? 'Present' : 'Null'}',
          );
          print(
            '     - clinic_patient_update: ${result.clinicPatientUpdate != null ? 'Present' : 'Null'}',
          );
          print(
            '     - current_followup_status: ${result.clinicPatientUpdate?.currentFollowupStatus}',
          );
        }

        // ✅ OPTIMIZED: Quick refresh without delays
        // Reload slots in background (non-blocking)
        if (_selectedDoctorId != null) {
          loadGroupedTimeSlots(
            doctorId: _selectedDoctorId!,
            slotType: _getSlotTypeForApi(_selectedConsultationType),
            date: appointmentDate,
          );
        }

        // ✅ CRITICAL: Refresh patient data to update follow-up status
        if (_lastPatientSearchQuery.isNotEmpty ||
            _selectedClinicPatient != null) {
          // Clear current results immediately
          _clinicPatientSearchResults = [];
          notifyListeners();

          // Wait for backend to process follow-up creation and status update
          print('⏳ Waiting for backend to process follow-up records...');
          Future.delayed(Duration(seconds: 3), () async {
            // ✅ Increased to 3 seconds for backend processing
            print('🔄 Refreshing patient data to check follow-up status...');

            // ✅ Refresh search results
            if (_lastPatientSearchQuery.isNotEmpty) {
              await searchClinicPatients(_lastPatientSearchQuery);
            }

            // ✅ CRITICAL: Also refresh the selected patient's data
            if (_selectedClinicPatient != null) {
              print('🔄 Refreshing selected patient data...');
              final selectedPatient = _selectedClinicPatient!;
              final patientId = selectedPatient.id;
              final patientName =
                  '${selectedPatient.firstName} ${selectedPatient.lastName}'
                      .trim();
              final searchQuery = patientName.isNotEmpty
                  ? patientName
                  : selectedPatient.phone;

              print('   Searching for: "$searchQuery"');
              print('   Patient ID: $patientId');

              // Search for the patient using their name to get updated data
              final token = _authViewModel.accessToken;
              if (token != null) {
                final clinicId = _authViewModel.user?.clinicId;
                if (clinicId != null && searchQuery.isNotEmpty) {
                  try {
                    final response = await _clinicPatientRepository
                        .searchPatients(
                          token: token,
                          clinicId: clinicId,
                          searchQuery: searchQuery,
                          onlyActive: true,
                          doctorId: _selectedDoctorId,
                          departmentId: _selectedDepartmentId,
                        );

                    if (response != null && response.patients.isNotEmpty) {
                      // Find the updated patient in the results by matching ID
                      final updatedPatient = response.patients.firstWhere(
                        (p) => p.id == patientId,
                        orElse: () => selectedPatient,
                      );

                      if (updatedPatient.id == patientId) {
                        _selectedClinicPatient = updatedPatient;
                        print('✅ Selected patient data refreshed');
                        print('   Patient: $patientName');
                        print(
                          '   Follow-ups: ${updatedPatient.followUps.length}',
                        );
                        print(
                          '   Active: ${updatedPatient.activeFollowUps.length}',
                        );
                        print(
                          '   Used: ${updatedPatient.usedFollowUps.length}',
                        );
                        print(
                          '   Expired: ${updatedPatient.expiredFollowUps.length}',
                        );

                        // ✅ CRITICAL: Show detailed follow-up status
                        if (updatedPatient.followUps.isNotEmpty) {
                          for (var fu in updatedPatient.followUps) {
                            print('   🔍 Follow-up:');
                            print('      - ID: ${fu.followUpId}');
                            print('      - Status: ${fu.status}');
                            print('      - Is Free: ${fu.isFree}');
                            print(
                              '      - Days Remaining: ${fu.daysRemaining}',
                            );
                            print('      - Valid Until: ${fu.validUntil}');
                          }
                        }

                        notifyListeners();
                      } else {
                        print('⚠️ Could not find patient in refreshed results');
                      }
                    } else {
                      print('⚠️ No patients found in search results');
                    }
                  } catch (e) {
                    print('⚠️ Error refreshing selected patient: $e');
                  }
                }
              }
            }
          });
        }

        // ✅ Reset form immediately for smooth UX
        _resetForm();
        return result;
      } else {
        _setError('Failed to create appointment');
        return null;
      }
    } catch (e) {
      print('❌ Error creating appointment: $e');

      // ✅ ENHANCED: Better error handling for backend validation failures
      String errorMessage = 'Error creating appointment: $e';

      if (e.toString().contains('Slot time has passed') ||
          e.toString().contains('past time slot')) {
        errorMessage =
            '❌ This time slot has expired! Please select a future time slot.';
      } else if (e.toString().contains('Not eligible for follow-up')) {
        errorMessage =
            '❌ Follow-up validation failed: The backend could not find a previous appointment for this patient with the selected doctor and department.\n\nThis might be due to:\n• Data synchronization issues\n• Missing appointment records\n• Incorrect doctor/department mapping\n\nPlease try booking a regular appointment first, or contact support if this persists.';
      } else if (e.toString().contains('No previous appointment')) {
        errorMessage =
            '❌ No previous appointment found: This patient has no appointment history with the selected doctor and department.\n\nPlease book a regular appointment first to create follow-up eligibility.';
      } else if (e.toString().contains('400')) {
        errorMessage =
            '❌ Validation error: The backend rejected the appointment request.\n\nThis could be due to:\n• Slot time has passed\n• Invalid patient data\n• Missing required fields\n• Business rule violations\n\nPlease check the appointment details and try again.';
      }

      _setError(errorMessage);
      return null;
    } finally {
      _setCreating(false);
    }
  }

  // Process payment (commented out - not implemented yet)
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

    // Reload time slots when consultation type changes (online/offline)
    if (_selectedDoctorId != null) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CONSULTATION TYPE CHANGED - RELOADING SLOTS                ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📋 New Consultation Type: $type');
      print('🆔 Current Doctor ID: $_selectedDoctorId');

      // ✅ Get slot type for loading slots
      final slotType = _getSlotTypeForApi(type);

      print('🔖 Slot Type: $slotType');
      print('');

      loadGroupedTimeSlots(
        doctorId: _selectedDoctorId!,
        slotType: slotType,
        date: _selectedSlotDate.toString().split(' ')[0], // YYYY-MM-DD
      );
    }

    // ✅ AUTO-REFRESH: Update patient search results to show relevant follow-up badges
    if (_lastPatientSearchQuery.isNotEmpty) {
      searchClinicPatients(_lastPatientSearchQuery);
    }

    _safeNotifyListeners();
  }

  void setDepartment(String department) {
    _selectedDepartment = department;

    // Find and store the department ID
    try {
      final dept = _departmentModels.firstWhere((d) => d.name == department);
      _selectedDepartmentId = dept.id;
      print('✅ Department selected: $department (ID: ${dept.id})');

      // ✅ NEW: Reload doctors filtered by the selected department
      _loadDoctorsBySelectedDepartment(dept.id);
    } catch (e) {
      _selectedDepartmentId = null;
      print('⚠️ Department ID not found for: $department');
    }

    // ✅ AUTO-REFRESH: If patient search results exist, refresh them with new context
    if (_lastPatientSearchQuery.isNotEmpty &&
        _clinicPatientSearchResults.isNotEmpty) {
      print('🔄 Auto-refreshing patient search with new department context...');
      searchClinicPatients(_lastPatientSearchQuery);
    }

    // ✅ NEW: Check follow-up status when department changes
    checkFollowUpStatusForUI();

    _safeNotifyListeners();
  }

  // ✅ Flag: tracks if no department has been selected yet (initial state)
  bool _noDepartmentSelectedYet = true;
  bool get noDepartmentSelectedYet => _noDepartmentSelectedYet;

  // ✅ Track whether doctors are being loaded for a department
  bool _isLoadingDoctors = false;
  bool get isLoadingDoctors => _isLoadingDoctors;

  /// ✅ Load doctors filtered by the selected department ID
  Future<void> _loadDoctorsBySelectedDepartment(String departmentId) async {
    try {
      _isLoadingDoctors = true;
      _noDepartmentSelectedYet = false;
      _selectedDoctor = 'Loading...';
      _safeNotifyListeners();

      print('🔄 Filtering doctors for department ID: $departmentId');

      // ✅ Optimization: Instead of just using the department API (which lacks fees),
      // we filter our master list of clinic doctors which ALREADY has fees.
      
      final token = _authViewModel.accessToken;
      if (token == null) return;

      // 1. Get the list of doctor IDs that belong to this department from the API
      final doctorsInDept = await _departmentRepository.getDoctorsByDepartment(
        token: token,
        departmentId: departmentId,
      ).timeout(const Duration(seconds: 15));

      if (doctorsInDept != null && doctorsInDept.isNotEmpty) {
        final deptDoctorIds = doctorsInDept.map((d) => d.userId).toSet();
        
        // 2. Filter master list (_allClinicDoctors) which was loaded in initialize() and has FEES
        _clinicDoctors = _allClinicDoctors.where((d) => 
          deptDoctorIds.contains(d.userId) || 
          deptDoctorIds.contains(d.doctorId) ||
          deptDoctorIds.contains(d.id)
        ).toList();

        // 3. Fallback: If master list doesn't have them yet, map the department models
        if (_clinicDoctors.isEmpty) {
          print('⚠️ Doctors not found in master list, mapping from department response (FEES MAY BE ZERO)');
          _clinicDoctors = doctorsInDept.map((d) {
            return ClinicDoctorModel(
              id: d.id,
              doctorId: d.userId,
              firstName: d.firstName,
              lastName: d.lastName,
              fullName: '${d.firstName} ${d.lastName}',
              email: d.email,
              phone: d.phone,
              specialization: d.specialization,
              licenseNumber: d.licenseNumber,
              isActive: d.isActive,
            );
          }).toList();
        }

        _selectedDoctor = 'Select Doctor';
        _selectedDoctorId = null;
        print('✅ Doctors loaded for department: ${_clinicDoctors.length} found');
      } else {
        print('⚠️ No doctors found for department: $departmentId');
        _clinicDoctors = [];
        _selectedDoctor = 'No doctors available';
      }
    } catch (e) {
      print('❌ Error loading doctors by department: $e');
      _clinicDoctors = [];
      _selectedDoctor = 'Error loading doctors';
    } finally {
      _isLoadingDoctors = false;
      _safeNotifyListeners();
    }
  }


  void setDoctor(String doctor) {
    _selectedDoctor = doctor;

    // Find the selected doctor's ID and load their time slots
    try {
      final selectedDoctor = _clinicDoctors.firstWhere(
        (d) => (d.fullName ?? '${d.firstName} ${d.lastName}') == doctor,
      );

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     DOCTOR SELECTED                                            ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Selected: $doctor');
      print('📋 Doctor Object:');
      print('   - id: ${selectedDoctor.id}');
      print('   - doctorId: ${selectedDoctor.doctorId}');
      print('   - firstName: ${selectedDoctor.firstName}');
      print('   - lastName: ${selectedDoctor.lastName}');
      print('   - fullName: ${selectedDoctor.fullName}');
      print('');

      // Try both id and doctorId fields
      final doctorIdToUse = selectedDoctor.id ?? selectedDoctor.doctorId;

      if (doctorIdToUse != null && doctorIdToUse.isNotEmpty) {
        _selectedDoctorId = doctorIdToUse;

        print('✅ Using Doctor ID: $_selectedDoctorId');
        print('🏥 Clinic ID: ${_authViewModel.user?.clinicId}');
        print('📋 Consultation Type: $_selectedConsultationType');

        // ✅ Get slot type for loading slots
        final slotType = _getSlotTypeForApi(_selectedConsultationType);

        print('🔖 Slot Type: $slotType');
        print('📅 Date: ${_selectedSlotDate.toString().split(' ')[0]}');
        print('');

        loadGroupedTimeSlots(
          doctorId: _selectedDoctorId!,
          slotType: slotType,
          date: _selectedSlotDate.toString().split(' ')[0], // YYYY-MM-DD
        );

        // ✅ NEW: Fetch consultation fees to ensure they are up to date (FEES FIX)
        _fetchConsultationFees(selectedDoctor);

        // ✅ NEW: Check follow-up status when doctor changes
        checkFollowUpStatusForUI();
      } else {
        print('❌ ERROR: No valid Doctor ID found for: $doctor');
        print('   Both id and doctorId fields are null/empty');
        print('   Cannot load time slots');
        _doctorTimeSlots = [];
        _groupedTimeSlots = null;
      }
    } catch (e) {
      print('⚠️ Warning: Doctor not found in clinic doctors list: ${doctor}');
      _doctorTimeSlots = [];
      _groupedTimeSlots = null;
    }

    // ✅ AUTO-REFRESH: If patient search results exist, refresh them with new context
    if (_lastPatientSearchQuery.isNotEmpty &&
        _clinicPatientSearchResults.isNotEmpty) {
      print('🔄 Auto-refreshing patient search with new doctor context...');
      searchClinicPatients(_lastPatientSearchQuery);
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

  void setTimeSlot(String timeSlot, {DoctorTimeSlotResponse? slotDetails}) {
    // If clicking the same slot (by ID), unselect it
    if (slotDetails != null && _selectedSlotId == slotDetails.id) {
      _selectedTimeSlot = '';
      _selectedSlotId = null;
      _selectedSlotDetails = null;

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     TIME SLOT UNSELECTED                                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🕐 Unselected Time: $timeSlot');
      print('🆔 Slot ID: ${slotDetails.id}');
      print('');
    } else {
      // Select the new slot
      _selectedTimeSlot = timeSlot;
      _selectedSlotId = slotDetails?.id;
      _selectedSlotDetails = slotDetails;

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     TIME SLOT SELECTED                                         ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🕐 Selected Time: $timeSlot');

      if (slotDetails != null) {
        print('📋 Slot Details:');
        print('   - Slot ID: ${slotDetails.id}');
        print('   - Day: ${slotDetails.dayName}');
        print('   - Time: ${slotDetails.startTime} - ${slotDetails.endTime}');
        print('   - Type: ${slotDetails.slotType}');
        print('   - Max Patients: ${slotDetails.maxPatients}');
        print('   - Booked: ${slotDetails.bookedPatients}');
        print(
          '   - Available: ${slotDetails.availableSpots}/${slotDetails.maxPatients}',
        );
        print('   - Status: ${slotDetails.status}');
        print('   - Notes: ${slotDetails.notes}');
      }
      print('');
    }

    _safeNotifyListeners();
  }

  /// ✅ NEW: Set walk-in mode for a specific session
  void setWalkInMode(DoctorSlotSession? session) {
    if (session == null) {
      _bookingMode = 'slot';
      _selectedWalkInSession = null;
    } else {
      _bookingMode = 'walk_in';
      _selectedWalkInSession = session;
      // Clear selected slot if any
      _selectedTimeSlot = session.startTime ?? '';
      _selectedSlotId = null;
      _selectedSlotDetails = null;

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     WALK-IN MODE SELECTED                                      ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📂 Session: ${session.sessionName}');
      print('🕐 Proposed Time: ${session.startTime ?? 'N/A'}');
      print('');

      // ✅ Set default payment method for walk-in (Pay Now)
      _selectedPaymentMethodEnum = PaymentMethod.payNow;
      _selectedPaymentType = null;
    }
    _safeNotifyListeners();
  }

  /// ✅ NEW: Set general walk-in mode (no specific session)
  void setGeneralWalkInMode() {
    _bookingMode = 'walk_in';
    _selectedWalkInSession = null;
    _selectedSlotId = null;
    _selectedSlotDetails = null;

    print('');
    print('╔════════════════════════════════════════════════════════════════╗');
    print('║     GENERAL WALK-IN MODE SELECTED                              ║');
    print('╚════════════════════════════════════════════════════════════════╝');
    print('📅 Date: $_selectedSlotDate');
    print('🕐 Time: Current time');

    // ✅ Set default payment method for walk-in (Pay Now)
    _selectedPaymentMethodEnum = PaymentMethod.payNow;
    _selectedPaymentType = null;

    _safeNotifyListeners();
  }

  void setPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    _safeNotifyListeners();
  }

  /// ✅ Fetch consultation fees for a specific doctor to ensure they are correct (FEES FIX)
  Future<void> _fetchConsultationFees(ClinicDoctorModel doctor) async {
    try {
      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;
      final clinicDoctorId = doctor.id ?? doctor.linkId;

      if (token == null || clinicId == null || clinicDoctorId == null) {
        print('⚠️ Missing data to fetch consultation fees');
        return;
      }

      print('🔄 Fetching real-time consultation fees for doctor: ${doctor.fullName} (ID: $clinicDoctorId)');

      final fees = await _consultationFeesRepository.getConsultationFees(
        token: token,
        clinicId: clinicId,
        clinicDoctorId: clinicDoctorId,
      ).timeout(const Duration(seconds: 10));

      if (fees != null) {
        print('✅ Fees fetched: Offline ₹${fees.consultationFeeOffline}, Online ₹${fees.consultationFeeOnline}');
        
        // Update the doctor object in our list with these fees
        final updatedFees = ClinicSpecificFees(
          consultationFeeOffline: fees.consultationFeeOffline,
          consultationFeeOnline: fees.consultationFeeOnline,
          followUpFee: fees.followUpFee,
          followUpDays: fees.followUpDays,
          notes: fees.notes,
        );

        // Find and update the doctor in our lists
        final index = _clinicDoctors.indexWhere((d) => d.id == doctor.id);
        if (index != -1) {
          _clinicDoctors[index] = _clinicDoctors[index].copyWith(clinicSpecificFees: updatedFees);
        }
        
        final allIndex = _allClinicDoctors.indexWhere((d) => d.id == doctor.id);
        if (allIndex != -1) {
          _allClinicDoctors[allIndex] = _allClinicDoctors[allIndex].copyWith(clinicSpecificFees: updatedFees);
        }

        _safeNotifyListeners(); // Refresh UI to show new fees
      }
    } catch (e) {
      print('❌ Error fetching consultation fees: $e');
    }
  }

  void setPatient(ClinicPatient patient) {
    _selectedClinicPatient = patient;
    _safeNotifyListeners();
  }

  void setPatientNotes(String notes) {
    _patientNotes = notes;
    _safeNotifyListeners();
  }

  /// Set payment method enum
  void setPaymentMethodEnum(PaymentMethod method) {
    _selectedPaymentMethodEnum = method;
    // Reset payment type when method changes
    _selectedPaymentType = null;

    // ✅ Kept Walk-in mode separate from payment selection
    // This allows selecting 'Pay Later' / 'Pay Now' without resetting Walk-in mode
    /*
    if (_bookingMode == 'walk_in') {
      _bookingMode = 'slot';
      _selectedWalkInSession = null;
    }
    */

    _safeNotifyListeners();
  }

  /// Set payment type (required only for pay_now)
  void setPaymentType(PaymentType? type) {
    _selectedPaymentType = type;
    _safeNotifyListeners();
  }

  /// Validate payment configuration
  bool isPaymentValid() {
    return currentPayment.isValid;
  }

  /// Get payment validation error
  String? getPaymentValidationError() {
    return currentPayment.validationError;
  }

  void setSearchType(bool isMobile) {
    _isMobileSearch = isMobile;
    _clinicPatientSearchResults = []; // ✅ Use assignment instead of clear()
    _safeNotifyListeners();
  }

  void setSearchTypeEnum(SearchType type) {
    _searchType = type;
    _isMobileSearch = type == SearchType.mobile; // Keep backward compatibility
    _clinicPatientSearchResults = [];
    _selectedClinicPatient = null;
    _safeNotifyListeners();
  }

  void setCountryCode(CountryCode countryCode) {
    _selectedCountryCode = countryCode;
    _safeNotifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;

    // ✅ Cancel previous debounce timer
    _searchDebounce?.cancel();

    if (query.isEmpty) {
      _clinicPatientSearchResults = []; // Use assignment instead of clear()
      _safeNotifyListeners();
      return;
    }

    // ✅ Debounce search - wait 500ms after user stops typing
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        final formattedQuery = _getFormattedSearchQuery(query);
        searchClinicPatients(
          formattedQuery,
        ); // Use clinic-specific patient search
      }
    });
  }

  /// Get formatted search query based on search type
  String _getFormattedSearchQuery(String query) {
    switch (_searchType) {
      case SearchType.mobile:
        // For mobile search, include country code
        return '${_selectedCountryCode.dialCode}$query';
      case SearchType.moId:
        // For Mo ID search, use as is
        return query;
      case SearchType.name:
        // For name search, use as is (repository should handle name search)
        return query;
    }
  }

  // ✅ REMOVED: Old selectPatient method (using clinic patients now)

  // ✅ REMOVED: Old selectPatient method (using clinic patients now)

  // Set reschedule appointment ID
  void setRescheduleAppointmentId(String? id) {
    _rescheduleAppointmentId = id;
    print('🔄 Reschedule Appointment ID set to: $id');

    // Reload slots if doctor is already selected
    if (_selectedDoctorId != null) {
      print('   Reloading slots with reschedule context...');
      loadGroupedTimeSlots(
        doctorId: _selectedDoctorId!,
        slotType: _getSlotTypeForApi(_selectedConsultationType),
        date: _selectedSlotDate.toString().split(' ')[0],
      );
    }
  }

  // Reset form
  void _resetForm() {
    _selectedConsultationType = 'clinic_visit'; // Default to clinic visit
    _selectedDepartment = _departments.isNotEmpty
        ? _departments.first.name ?? 'Orthology'
        : 'Orthology';
    _selectedDepartmentId = _departmentModels.isNotEmpty
        ? _departmentModels.first.id
        : null; // Reset department ID
    _selectedDoctor = _clinicDoctors.isNotEmpty
        ? (_clinicDoctors.first.fullName ??
              '${_clinicDoctors.first.firstName} ${_clinicDoctors.first.lastName}')
        : 'Loading...';
    _selectedDate = '16, July';
    _selectedTimeSlot = '09:00 AM';
    _selectedPaymentMethod = 'Pay Now';
    _selectedPaymentMethodEnum =
        PaymentMethod.payNow; // Reset payment method enum
    _selectedPaymentType = null; // Reset payment type
    _patientNotes = '';
    _searchQuery = '';
    _selectedClinicPatient = null; // Reset selected clinic patient
    _clinicPatientSearchResults = []; // Reset list instead of clear
    _selectedCountryCode = defaultCountryCode; // Reset to India
    _safeNotifyListeners();
  }

  // Private helper methods
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

  void _setCreating(bool creating) {
    if (_disposed) return;
    _isCreating = creating;
    if (creating) {
      LoadingManager.show(message: 'Creating Appointment...');
    } else {
      LoadingManager.hide();
    }
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

  // Load grouped time slots by day (using session-based API)
  Future<void> loadGroupedTimeSlots({
    required String doctorId,
    String? slotType,
    String? date,
    String?
    appointmentId, // ✅ NEW: For reschedule - exclude current appointment
  }) async {
    try {
      _isLoadingSlots = true; // ✅ Use slot-specific loading state
      LoadingManager.show(message: 'Loading Time Slots...');
      _safeNotifyListeners();
      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LOADING SESSION-BASED SLOTS FOR APPOINTMENT               ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');
      print('🏥 Clinic ID: $clinicId');
      print('📍 Slot Type: $slotType');
      print('📅 Date: $date');
      print('🆔 Appointment ID (reschedule): $appointmentId');
      print('📅 Date: $date');
      print(
        '🆔 Appointment ID (reschedule): ${appointmentId ?? _rescheduleAppointmentId}',
      );
      print('');

      // ✅ Ensure date is always provided - use selected date if not provided
      final dateToQuery =
          date ??
          '${_selectedSlotDate.year}-${_selectedSlotDate.month.toString().padLeft(2, '0')}-${_selectedSlotDate.day.toString().padLeft(2, '0')}';

      print('📅 Date to query API: $dateToQuery');
      print('💡 API will automatically match recurring slots for this weekday');

      // Use session-based API
      final response = await _sessionSlotRepository.listSessionSlots(
        token: token,
        doctorId: doctorId,
        clinicId: clinicId,
        slotType: slotType,
        date:
            dateToQuery, // ✅ Always pass date - API matches recurring slots by weekday
        appointmentId:
            appointmentId ??
            _rescheduleAppointmentId, // ✅ Pass appointmentId to exclude from count
      );

      // ✅ Allow response even if slots are empty (to capture walk-in status)
      if (response != null) {
        print('✅ Loaded ${response.slots.length} slot days');

        // ✅ Store full session slots response for UI access
        _sessionSlotsResponse = response;

        // Extract all individual slots from all sessions
        final allIndividualSlots = <IndividualSlot>[];
        for (var slotDay in response.slots) {
          for (var session in slotDay.sessions) {
            allIndividualSlots.addAll(session.slots);
            print(
              '📋 ${session.sessionName ?? "Session"}: ${session.generatedSlots} slots (${session.availableSlots} available)',
            );
          }
        }

        print('🎫 Total Individual Slots: ${allIndividualSlots.length}');

        // Convert to DoctorTimeSlotResponse for UI compatibility
        final convertedSlots = allIndividualSlots
            .map(
              (slot) => DoctorTimeSlotResponse(
                id: slot.id,
                doctorId:
                    (response.slots.isNotEmpty
                        ? response.slots.first.doctorId
                        : null) ??
                    doctorId,
                clinicId: slot.clinicId ?? clinicId ?? '',
                date: dateToQuery, // Use the date we queried with
                slotType: slotType ?? 'clinic_visit',
                startTime: slot.slotStart ?? '00:00',
                endTime: slot.slotEnd ?? '00:00',
                maxPatients: 1, // Individual slots have 1 patient capacity
                bookedPatients: slot.isBooked ? 1 : 0,
                availableSpots: slot.isBookable && !slot.isBooked ? 1 : 0,
                isAvailable:
                    slot.isBookable &&
                    !slot.isBooked &&
                    slot.status == 'available',
                isBookable: slot.isBookable,
                displayMessage: slot.displayMessage,
                status: slot.status,
                notes: slot.notes,
                isActive: true,
                createdAt: slot.createdAt != null
                    ? DateTime.tryParse(slot.createdAt!)
                    : null,
                updatedAt: slot.updatedAt != null
                    ? DateTime.tryParse(slot.updatedAt!)
                    : null,
              ),
            )
            .toList();

        // Separate morning and afternoon slots
        final morningSlots = convertedSlots
            .where((slot) => isMorningSlot(slot.startTime))
            .toList();
        final afternoonSlots = convertedSlots
            .where((slot) => !isMorningSlot(slot.startTime))
            .toList();

        print('🌅 Morning Slots: ${morningSlots.length}');
        for (var slot in morningSlots.take(5)) {
          print(
            '   - ${formatTime12Hour(slot.startTime)} to ${formatTime12Hour(slot.endTime)} | ${slot.isAvailable ? "Available" : "Booked"}',
          );
        }
        if (morningSlots.length > 5) {
          print('   ... and ${morningSlots.length - 5} more');
        }

        print('🌆 Afternoon Slots: ${afternoonSlots.length}');

        // ✅ LOG WALK-IN STATUS
        print('🚶 Walk-in Available: ${response.walkinAvailable}');
        print('❓ Walk-in Reason: ${response.walkinReason}');

        for (var slot in afternoonSlots.take(5)) {
          print(
            '   - ${formatTime12Hour(slot.startTime)} to ${formatTime12Hour(slot.endTime)} | ${slot.isAvailable ? "Available" : "Booked"}',
          );
        }
        if (afternoonSlots.length > 5) {
          print('   ... and ${afternoonSlots.length - 5} more');
        }
        print('');

        // Convert to grouped format for UI
        _groupedTimeSlots = GroupedTimeSlotsResponse(
          doctorId: doctorId,
          clinicId: clinicId,
          slotType: slotType,
          date: date,
          days: [
            DaySlotGroup(
              dayName: _getDayName(
                DateTime.parse(
                  date ?? DateTime.now().toString().split(' ')[0],
                ).weekday,
              ),
              dayOfWeek: DateTime.parse(
                date ?? DateTime.now().toString().split(' ')[0],
              ).weekday,
              slots: convertedSlots,
              hasSlots: convertedSlots.isNotEmpty,
              totalSlots: convertedSlots.length,
              availableSlots: convertedSlots
                  .where((s) => s.availableSpots > 0)
                  .length,
              isAvailable: convertedSlots.any((s) => s.availableSpots > 0),
              status: 'available',
            ),
          ],
        );

        // Also keep flat list for compatibility
        _doctorTimeSlots = allIndividualSlots
            .map(
              (slot) => AvailableSlot(
                id: slot.id,
                clinicId: slot.clinicId ?? clinicId ?? '',
                dayOfWeek:
                    DateTime.parse(
                      date ?? DateTime.now().toString().split(' ')[0],
                    ).weekday %
                    7,
                dayName: _getDayName(
                  DateTime.parse(
                    date ?? DateTime.now().toString().split(' ')[0],
                  ).weekday,
                ),
                slotType: slotType ?? 'clinic_visit',
                startTime: slot.slotStart ?? '00:00',
                endTime: slot.slotEnd ?? '00:00',
                maxPatients: 1,
                notes: slot.notes,
              ),
            )
            .toList();
      } else {
        _doctorTimeSlots = [];
        _groupedTimeSlots = null;
        _sessionSlotsResponse = null; // ✅ Clear session response
        print('❌ No session-based slots found for the selected criteria');
      }
    } catch (e) {
      print('❌ Error loading session slots: $e');
      _doctorTimeSlots = [];
      _groupedTimeSlots = null;
      _sessionSlotsResponse = null; // ✅ Clear session response on error
      _setError('Failed to load time slots');
    } finally {
      _isLoadingSlots = false; // ✅ Use slot-specific loading state
      LoadingManager.hide();
      _safeNotifyListeners();
    }
  }

  /// Safely notify listeners, checking if disposed
  void _safeNotifyListeners() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  /// Convert weekday number to day name
  String _getDayName(int weekday) {
    // DateTime.weekday: 1=Monday, 2=Tuesday, ..., 7=Sunday
    // We need to convert to: 0=Sunday, 1=Monday, ..., 6=Saturday
    switch (weekday % 7) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return 'Unknown';
    }
  }

  /// Convert PaymentMethod enum to API string format
  String _paymentMethodToApiString(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.payNow:
        return 'pay_now';
      case PaymentMethod.payLater:
        return 'pay_later';
      case PaymentMethod.wayOff:
        return 'way_off';
    }
  }

  /// Extract HH:MM from time string (handles both HH:MM and ISO formats)
  String _extractTimeFromSlot(String timeStr) {
    try {
      // Handle ISO timestamp format (0000-01-01T14:45:00Z)
      if (timeStr.contains('T')) {
        final dateTime = DateTime.parse(timeStr);
        final hour = dateTime.hour.toString().padLeft(2, '0');
        final minute = dateTime.minute.toString().padLeft(2, '0');
        return '$hour:$minute';
      }

      // Handle AM/PM format (e.g. "01:28 PM")
      final upperTime = timeStr.toUpperCase();
      if (upperTime.contains('PM') || upperTime.contains('AM')) {
        final parts = timeStr.split(':');
        if (parts.length >= 2) {
          var hour = int.tryParse(parts[0]) ?? 0;
          final minPart = parts[1];
          // Extract digits from minute part (removes ' PM', 'PM', etc)
          final minute =
              int.tryParse(minPart.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

          final isPM = upperTime.contains('PM');
          final isAM = upperTime.contains('AM');

          if (isPM && hour < 12) hour += 12;
          if (isAM && hour == 12) hour = 0;

          return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
        }
      }

      // Handle HH:MM or HH:MM:SS format
      final parts = timeStr.split(':');
      if (parts.length >= 2) {
        final hour = parts[0].padLeft(2, '0');
        // Clean minute of any non-digit chars just in case (e.g. if it has trailing stuff but no AM/PM)
        final minuteStr = parts[1].split(RegExp(r'[^0-9]')).first;
        final minute = minuteStr.padLeft(2, '0');
        return '$hour:$minute';
      }

      // Fallback to original
      return timeStr;
    } catch (e) {
      print('⚠️ Failed to extract time from: $timeStr - Error: $e');
      return timeStr;
    }
  }

  /// Convert 24-hour time to 12-hour format with AM/PM
  String formatTime12Hour(String time24) {
    try {
      // Handle ISO timestamp format (0000-01-01T14:45:00Z)
      if (time24.contains('T')) {
        final dateTime = DateTime.parse(time24);
        final hour = dateTime.hour;
        final minute = dateTime.minute;

        String period = 'AM';
        int hour12 = hour;
        if (hour >= 12) {
          period = 'PM';
          if (hour > 12) hour12 = hour - 12;
        }
        if (hour == 0) hour12 = 12;

        // ✅ Add padLeft for consistent format with leading zeros
        return '${hour12.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
      }

      // Handle HH:MM format
      final parts = time24.split(':');
      if (parts.length < 2) return time24;

      int hour = int.parse(parts[0]);
      final minute = parts[1].split('.')[0].split('Z')[0].trim();

      String period = 'AM';
      if (hour >= 12) {
        period = 'PM';
        if (hour > 12) hour -= 12;
      }
      if (hour == 0) hour = 12;

      // ✅ Add padLeft for consistent format with leading zeros
      return '${hour.toString().padLeft(2, '0')}:$minute $period';
    } catch (e) {
      print('⚠️ Failed to format time: $time24 - Error: $e');
      return time24;
    }
  }

  /// Check if time is in morning (before 12:00)
  bool isMorningSlot(String time24) {
    try {
      // Handle ISO timestamp format
      if (time24.contains('T')) {
        final dateTime = DateTime.parse(time24);
        return dateTime.hour < 12;
      }

      // Handle HH:MM format
      final hour = int.parse(time24.split(':')[0]);
      return hour < 12;
    } catch (e) {
      return false;
    }
  }

  /// Get morning slots
  List<DoctorTimeSlotResponse> get morningSlots {
    return _groupedTimeSlots?.days
            .expand((day) => day.slots)
            .where((slot) => isMorningSlot(slot.startTime))
            .toList() ??
        [];
  }

  /// Get afternoon slots
  List<DoctorTimeSlotResponse> get afternoonSlots {
    return _groupedTimeSlots?.days
            .expand((day) => day.slots)
            .where((slot) => !isMorningSlot(slot.startTime))
            .toList() ??
        [];
  }

  /// Select a date and reload time slots
  void selectDateAndReloadSlots(DateTime date) {
    // ✅ Validate date is not in the past
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final selectedDate = DateTime(date.year, date.month, date.day);

    if (selectedDate.isBefore(today)) {
      _setError(
        'Cannot select past date. Please select a date from today onwards.',
      );
      return;
    }

    _selectedSlotDate = selectedDate;

    // Reload slots if doctor is selected
    if (_selectedDoctorId != null) {
      final dateString =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     DATE CHANGED - RELOADING SLOTS                            ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📅 Selected Date: $dateString');
      print('👨‍⚕️ Doctor ID: $_selectedDoctorId');
      print('📍 Slot Type: $_selectedConsultationType');
      print('');

      loadGroupedTimeSlots(
        doctorId: _selectedDoctorId!,
        slotType: _getSlotTypeForApi(
          _selectedConsultationType,
        ), // ✅ Get slot type
        date: dateString,
      );
    }

    _safeNotifyListeners();
  }

  // Helper methods for date/time formatting

  String _formatTimeForAPI(String timeString) {
    // Convert "04:30 PM" to "16:30:00"
    final parts = timeString.split(' ');
    if (parts.length == 2) {
      final timePart = parts[0];
      final period = parts[1];
      final timeComponents = timePart.split(':');
      if (timeComponents.length == 2) {
        int hour = int.parse(timeComponents[0]);
        final minute = timeComponents[1];

        if (period == 'PM' && hour != 12) {
          hour += 12;
        } else if (period == 'AM' && hour == 12) {
          hour = 0;
        }

        return '${hour.toString().padLeft(2, '0')}:$minute:00';
      }
    }
    return '00:00:00';
  }

  // Load appointment details for rescheduling
  Future<void> loadAppointmentForReschedule(String appointmentId) async {
    try {
      _setLoading(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return;
      }

      final appointmentDetails = await _repository.getAppointmentDetails(
        token,
        appointmentId,
      );

      if (appointmentDetails != null) {
        print('📋 Loading appointment details for reschedule...');

        // Pre-populate form with current appointment data
        // Use flat structure (doctorName) or nested (doctor.name)
        if (appointmentDetails.consultationType != null) {
          _selectedConsultationType = appointmentDetails.consultationType!;
          print('✅ Consultation Type: $_selectedConsultationType');
        }

        final doctorName =
            appointmentDetails.doctorName ?? appointmentDetails.doctor?.name;

        if (doctorName != null) {
          _selectedDoctor = doctorName;

          // Find doctor ID from clinic doctors list
          try {
            final matchingDoctor = _clinicDoctors.firstWhere(
              (d) =>
                  (d.fullName ?? '${d.firstName} ${d.lastName}') == doctorName,
            );
            _selectedDoctorId = matchingDoctor.id ?? matchingDoctor.doctorId;
            print('✅ Found doctor: $doctorName (ID: $_selectedDoctorId)');
          } catch (e) {
            // If nested doctor object has ID, use that
            if (appointmentDetails.doctor?.id != null) {
              _selectedDoctorId = appointmentDetails.doctor!.id;
              print('✅ Using nested doctor ID: $_selectedDoctorId');
            } else {
              print('⚠️ Could not find doctor ID for: $doctorName');
            }
          }
        }

        // Use flat department or nested department.name
        final department = appointmentDetails.department;
        if (department != null) {
          _selectedDepartment = department;

          // Find department ID from department models
          try {
            final matchingDept = _departmentModels.firstWhere(
              (d) => d.name == department,
            );
            _selectedDepartmentId = matchingDept.id;
            print(
              '✅ Found department: $department (ID: $_selectedDepartmentId)',
            );
          } catch (e) {
            print('⚠️ Could not find department ID for: $department');
          }
        }

        // Format current date from appointment_date_time
        if (appointmentDetails.appointmentDateTime != null) {
          try {
            // Handle format: "2025-10-18T00:00:00Z 13:30:00"
            final dateTimeStr = appointmentDetails.appointmentDateTime!;
            final parts = dateTimeStr.split(' ');
            final datePart = parts[0]; // "2025-10-18T00:00:00Z"

            final dateTime = DateTime.parse(datePart);
            _selectedDate = '${dateTime.day}, ${_getMonthName(dateTime.month)}';
            _selectedSlotDate = dateTime;

            // If there's a time part, use it
            if (parts.length > 1) {
              final timePart = parts[1]; // "13:30:00"
              final timeComponents = timePart.split(':');
              if (timeComponents.length >= 2) {
                int hour = int.parse(timeComponents[0]);
                int minute = int.parse(timeComponents[1]);
                final period = hour >= 12 ? 'PM' : 'AM';
                hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
                _selectedTimeSlot =
                    '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
              }
            } else {
              _selectedTimeSlot = _formatTime(dateTime);
            }

            print('✅ Date: $_selectedDate');
            print('✅ Time: $_selectedTimeSlot');
          } catch (e) {
            print('⚠️ Error parsing date/time: $e');
          }
        }

        if (appointmentDetails.notes != null) {
          _patientNotes = appointmentDetails.notes!;
        }

        // Set reschedule appointment ID for state tracking
        _rescheduleAppointmentId = appointmentId;

        // Load slots for the current doctor and date
        if (_selectedDoctorId != null) {
          print('🔄 Loading slots for doctor (reschedule mode)...');
          await loadGroupedTimeSlots(
            doctorId: _selectedDoctorId!,
            date:
                '${_selectedSlotDate.year}-${_selectedSlotDate.month.toString().padLeft(2, '0')}-${_selectedSlotDate.day.toString().padLeft(2, '0')}',
            slotType: appointmentDetails.consultationType ?? 'clinic_visit',
            appointmentId:
                _rescheduleAppointmentId, // ✅ Pass appointmentId to exclude current from count
          );

          // ✅ Auto-select the current appointment's slot after slots are loaded
          if (_groupedTimeSlots != null && _selectedTimeSlot.isNotEmpty) {
            print('');
            print('🎯 Auto-selecting current appointment slot...');
            print('   Looking for time: $_selectedTimeSlot');

            bool found = false;
            int totalChecked = 0;

            // Find the slot that matches the current appointment time
            for (var day in _groupedTimeSlots!.days) {
              for (var slot in day.slots) {
                totalChecked++;
                final slotTimeFormatted = formatTime12Hour(slot.startTime);

                // Debug: Show comparison
                if (totalChecked <= 3) {
                  print(
                    '   Comparing: "$slotTimeFormatted" == "$_selectedTimeSlot" ? ${slotTimeFormatted == _selectedTimeSlot}',
                  );
                }

                if (slotTimeFormatted == _selectedTimeSlot) {
                  // Found matching slot - AUTO-SELECT IT
                  _selectedSlotId = slot.id;
                  _originalSlotId = slot
                      .id; // ✅ Store original slot ID for "Current Booking" logic
                  _selectedSlotDetails = slot;
                  found = true;

                  print('✅ Auto-selected current appointment slot:');
                  print('   - Slot ID: ${slot.id}');
                  print('   - Original ID: $_originalSlotId');
                  print('   - Raw Time: ${slot.startTime}');
                  print('   - Formatted Time: $slotTimeFormatted');
                  print('   - Matched With: $_selectedTimeSlot');
                  print('   - Status: ${slot.status}');
                  print(
                    '   - Available: ${slot.availableSpots}/${slot.maxPatients}',
                  );
                  print('');
                  break;
                }
              }
              if (found) break;
            }

            if (!found) {
              print('❌ Could not find matching slot!');
              print('   Looking for: "$_selectedTimeSlot"');
              print('   Total slots checked: $totalChecked');
              print('   Available slots:');
              for (var day in _groupedTimeSlots!.days) {
                for (var slot in day.slots.take(10)) {
                  final formatted = formatTime12Hour(slot.startTime);
                  print(
                    '   - Raw: ${slot.startTime} → Formatted: "$formatted"',
                  );
                }
              }
              print('');
            }
          }
        }

        _safeNotifyListeners();
      } else {
        _setError('Failed to load appointment details');
      }
    } catch (e) {
      _setError('Error loading appointment details: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Helper method to format time
  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }

  // Reschedule appointment using simple reschedule API
  Future<bool> rescheduleAppointment(String appointmentId) async {
    try {
      _setCreating(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return false;
      }

      if (_selectedSlotDetails == null) {
        _setError('Please select a time slot');
        return false;
      }

      // ✅ Use robust date/time construction for API
      // Use _selectedSlotDate instead of parsing _selectedDate string (which relies on comma separator)
      final dateToUse = _selectedSlotDate;
      final formattedDate =
          '${dateToUse.year}-${dateToUse.month.toString().padLeft(2, '0')}-${dateToUse.day.toString().padLeft(2, '0')}';

      // Use _selectedSlotDetails.startTime properly
      String apiTime = '00:00:00';
      if (_selectedSlotDetails != null) {
        final rawStart = _selectedSlotDetails!.startTime;
        print('🕒 Raw Slot Start Time: "$rawStart"');

        try {
          if (rawStart.contains('T')) {
            // Handle ISO format
            final dt = DateTime.parse(rawStart);
            apiTime =
                '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:00';
          } else if (rawStart.toUpperCase().contains('PM') ||
              rawStart.toUpperCase().contains('AM')) {
            // Handle 12-hour format "02:30 PM" or "02:30PM"
            // Ensure space between time and period
            var normalized = rawStart
                .replaceAll(RegExp(r'\s+'), ' ')
                .trim()
                .toUpperCase();
            if (!normalized.contains(' ')) {
              normalized = normalized
                  .replaceFirst('AM', ' AM')
                  .replaceFirst('PM', ' PM');
            }
            apiTime = _formatTimeForAPI(normalized);
          } else {
            // Handle HH:mm or HH:mm:ss
            final parts = rawStart.split(':');
            if (parts.length >= 2) {
              final h = int.parse(parts[0]);
              // Remove any non-digit chars from minute part just in case
              final mStr = parts[1].replaceAll(RegExp(r'[^0-9]'), '');
              final m = int.parse(mStr);
              apiTime =
                  '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:00';
            }
          }
        } catch (e) {
          print('⚠️ Error parsing slot start time: "$rawStart" - $e');
          // If all else fails, rely on the selected time slot string (extracted from UI)
          try {
            // If it's a range like "02:15 PM - 02:20 PM", take the first part
            final uiTime = _selectedTimeSlot.split('-')[0].trim();
            apiTime = _formatTimeForAPI(uiTime);
            print('⚠️ Fallback to UI time: "$uiTime" -> $apiTime');
          } catch (e2) {
            print('❌ Fallback failed too: $e2');
          }
        }
      } else {
        // Fallback if no slot details
        final uiTime = _selectedTimeSlot.split('-')[0].trim();
        apiTime = _formatTimeForAPI(uiTime);
      }

      final formattedTime = '$formattedDate $apiTime';

      print('🚀 Rescheduling to: $formattedTime (UTC/Local depending on API)');

      // ✅ Validate appointment is not in the past
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      try {
        final appointmentDateTime = DateTime.parse(formattedTime);
        final appointmentDate = DateTime(
          appointmentDateTime.year,
          appointmentDateTime.month,
          appointmentDateTime.day,
        );

        // Check if date is in the past
        if (appointmentDate.isBefore(today)) {
          _setError(
            'Cannot reschedule to past date. Please select a date from today onwards.',
          );
          return false;
        }

        // If appointment is today, check time is not in the past
        // ⚠️ RELAXED VALIDATION: Allow selecting current/past slots for today if backend permits
        // This fixes issues where server time vs client time causes false negatives
        /*
        if (appointmentDate.isAtSameMomentAs(today) &&
            appointmentDateTime.isBefore(now)) {
          _setError(
            'Cannot reschedule to past time. Please select a time in the future.',
          );
          return false;
        }
        */
      } catch (e) {
        print('⚠️ Error validating date/time: $e');
        // Continue if date parsing fails (backend will validate)
      }

      final result = await _repository.rescheduleSimpleAppointment(
        token: token,
        appointmentId: appointmentId,
        doctorId: _selectedDoctorId!,
        individualSlotId: _selectedSlotDetails!.id,
        appointmentDate: formattedDate,
        appointmentTime: formattedTime,
        departmentId: _selectedDepartmentId,
        consultationType: _selectedConsultationType,
        reason: _patientNotes.isNotEmpty ? _patientNotes : null,
        notes: _patientNotes.isNotEmpty ? _patientNotes : null,
      );

      if (result != null) {
        print('✅ Appointment rescheduled successfully!');
        print('   Appointment ID: ${result.id}');
        print('   Token Number: ${result.tokenNumber}');
        print('   New Date/Time: ${result.appointmentDateTime}');
        return true;
      } else {
        _setError(
          'Failed to reschedule appointment. Please try again or contact support.',
        );
        return false;
      }
    } catch (e) {
      _setError('Error rescheduling appointment: $e');
      return false;
    } finally {
      _setCreating(false);
    }
  }

  // ✅ MANUAL FOLLOW-UP RENEWAL: Force refresh patient eligibility
  // Call this method to manually trigger follow-up renewal check
  Future<void> forceFollowUpRenewal() async {
    if (_lastPatientSearchQuery.isEmpty) {
      print('❌ No patient search query available for renewal');
      return;
    }

    print('');
    print('🔄 MANUAL FOLLOW-UP RENEWAL: Forcing eligibility refresh...');
    print(
      '   Doctor: ${selectedDoctorObject?.firstName ?? 'Unknown'} ${selectedDoctorObject?.lastName ?? ''}',
    );
    print('   Department: ${_selectedDepartmentId ?? 'None'}');
    print('   Search Query: $_lastPatientSearchQuery');
    print('   Selected Doctor ID: $_selectedDoctorId');
    print('   Selected Department ID: $_selectedDepartmentId');

    try {
      // Step 1: Clear current patient list to force fresh data
      print('   Step 1: Clearing current patient results...');
      _clinicPatientSearchResults = []; // ✅ Use assignment instead of clear()
      notifyListeners();

      // Step 2: Wait for backend to process
      print('   Step 2: Waiting 2 seconds for backend to process...');
      await Future.delayed(Duration(seconds: 2));

      // Step 3: Search with fresh data
      print('   Step 3: Searching with fresh data...');
      await searchClinicPatients(_lastPatientSearchQuery);

      // Step 4: Additional refresh
      print('   Step 4: Additional refresh...');
      await Future.delayed(Duration(milliseconds: 500));
      await searchClinicPatients(_lastPatientSearchQuery);

      print('✅ Manual renewal complete!');
      print('   Check patient cards for updated follow-up status');
      print('   Look for "Card Status: free" and "Will show: GREEN"');
      print('');
    } catch (e) {
      print('❌ Manual renewal failed: $e');
    }
  }

  // ✅ CHECK BACKEND FOLLOW-UP CREATION: Debug method to verify API booking
  void debugBackendFollowUpCreation() {
    if (_selectedClinicPatient == null) {
      print('❌ No patient selected');
      return;
    }

    print('');
    print('🔍 BACKEND FOLLOW-UP CREATION DEBUG:');
    print(
      '   Patient: ${_selectedClinicPatient!.firstName} ${_selectedClinicPatient!.lastName}',
    );
    print('   Patient ID: ${_selectedClinicPatient!.id}');
    print('   Clinic ID: ${_selectedClinicPatient!.clinicId}');
    print('   Selected Doctor ID: $_selectedDoctorId');
    print('   Selected Department ID: $_selectedDepartmentId');
    print('   Consultation Type: $_selectedConsultationType');
    print('');

    // Check if this should create a follow-up
    final shouldCreateFollowUp =
        _selectedConsultationType == 'clinic_visit' ||
        _selectedConsultationType == 'video_consultation';

    print('📋 FOLLOW-UP CREATION CHECK:');
    print('   Should Create Follow-Up: $shouldCreateFollowUp');
    if (shouldCreateFollowUp) {
      print(
        '   ✅ This is a REGULAR appointment - backend should create follow-up record',
      );
      print('   Expected: New record in follow_ups table with status="active"');
      print('   Expected: is_free=true, valid for 5 days');
    } else {
      print(
        '   ❌ This is a FOLLOW-UP appointment - should not create new follow-up',
      );
      print('   Expected: Existing follow-up should be marked as "used"');
    }

    print('');
    print('🔍 CURRENT FOLLOW-UP STATUS:');
    print(
      '   Eligible Follow-ups: ${_selectedClinicPatient!.eligibleFollowUps.length}',
    );
    print(
      '   Total Appointments: ${_selectedClinicPatient!.appointments.length}',
    );

    if (_selectedClinicPatient!.eligibleFollowUps.isNotEmpty) {
      print('   Current Eligible Follow-ups:');
      for (var f in _selectedClinicPatient!.eligibleFollowUps) {
        print(
          '     - ${f.doctorName} (${f.department}) - ${f.remainingDays} days',
        );
      }
    }

    print('');
    print('⚠️ BACKEND CHECKLIST:');
    print(
      '   1. Check backend logs for "CreateFollowUp" or "MarkFollowUpAsUsed"',
    );
    print('   2. Verify follow_ups table has correct records');
    print('   3. Check if appointment creation triggers follow-up logic');
    print('   4. Verify doctor_id and department_id matching');
    print('');
  }

  // ✅ DEBUG FOLLOW-UP DATA: Comprehensive debugging method
  void debugFollowUpDataMismatch() {
    if (_selectedClinicPatient == null) {
      print('❌ No patient selected');
      return;
    }

    if (selectedDoctorObject == null) {
      print('❌ No doctor selected');
      return;
    }

    print('');
    print('🔍 FOLLOW-UP DATA MISMATCH DEBUG:');
    print(
      '   Patient: ${_selectedClinicPatient!.firstName} ${_selectedClinicPatient!.lastName}',
    );
    print(
      '   Doctor: ${selectedDoctorObject!.firstName} ${selectedDoctorObject!.lastName}',
    );
    print('   Department: ${_selectedDepartmentId ?? 'None'}');
    print('   Selected Doctor ID: $_selectedDoctorId');
    print('   Selected Department ID: $_selectedDepartmentId');
    print('');

    // Check eligible follow-ups
    print('📋 ELIGIBLE FOLLOW-UPS:');
    print('   Count: ${_selectedClinicPatient!.eligibleFollowUps.length}');
    for (var i = 0; i < _selectedClinicPatient!.eligibleFollowUps.length; i++) {
      final f = _selectedClinicPatient!.eligibleFollowUps[i];
      print('   [$i] Doctor ID: ${f.doctorId}');
      print('       Department ID: ${f.departmentId}');
      print('       Doctor Name: ${f.doctorName}');
      print('       Department: ${f.department}');
      print('       Days Remaining: ${f.remainingDays}');
      print('       Match Selected Doctor: ${f.doctorId == _selectedDoctorId}');
      print(
        '       Match Selected Department: ${f.departmentId == _selectedDepartmentId}',
      );
      print('');
    }

    // Check appointments
    print('📋 APPOINTMENTS:');
    print('   Count: ${_selectedClinicPatient!.appointments.length}');
    final matchingAppointments = _selectedClinicPatient!.appointments
        .where(
          (apt) =>
              apt.doctorId == _selectedDoctorId &&
              (_selectedDepartmentId == null ||
                  apt.departmentId == _selectedDepartmentId),
        )
        .toList();

    print('   Matching Appointments: ${matchingAppointments.length}');
    for (var i = 0; i < matchingAppointments.length && i < 3; i++) {
      final apt = matchingAppointments[i];
      print('   [$i] Doctor ID: ${apt.doctorId}');
      print('       Department ID: ${apt.departmentId}');
      print('       Time: ${apt.appointmentTime}');
      print('       Slot Type: ${apt.slotType}');
      print('       Status: ${apt.status}');
      print('');
    }

    // Final status
    final status = _selectedClinicPatient!.getFollowUpStatus(
      doctorId: _selectedDoctorId!,
      departmentId: _selectedDepartmentId,
    );

    print('🎯 FINAL STATUS: $status');
    print(
      '   Should Show: ${status == 'free' ? 'GREEN' : (status == 'paid_expired' ? 'ORANGE' : 'GREY')}',
    );
    print('   ⚠️ If backend fails, there might be a data sync issue!');
    print('');
  }

  // ✅ NEW: Reset form to blank slate after booking
  void resetForm() {
    _selectedDepartment = 'Select Department';
    _selectedDepartmentId = null;
    _selectedDoctor = 'Select Doctor';
    _selectedDoctorId = null;
    _selectedClinicPatient = null;
    _selectedSlotDetails = null;
    _selectedSlotId = null;
    _patientNotes = '';
    _searchQuery = '';
    _lastPatientSearchQuery = '';
    _bookingMode = 'slot';
    _isFreeFollowUpFromAPI = false;
    _currentFollowUpStatus = null;
    
    _clearError();
    notifyListeners();
    print('♻️ New Appointment form has been reset to blank slate');
  }

  @override
  void dispose() {
    _searchDebounce?.cancel(); // ✅ Cancel debounce timer
    _disposed = true;
    super.dispose();
  }
}
