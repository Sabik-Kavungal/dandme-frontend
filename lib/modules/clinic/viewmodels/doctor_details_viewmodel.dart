import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/appointment_model.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/models/doctor_session_slot_model.dart';
import 'package:drandme/modules/clinic/models/clinic_doctor_links_model.dart';
import 'package:drandme/modules/clinic/models/doctor_leave_model.dart';
import 'package:drandme/modules/clinic/models/doctor_consultation_fees_model.dart';
import 'package:drandme/modules/clinic/repositories/doctor_time_slot_repository.dart';
import 'package:drandme/modules/clinic/repositories/doctor_session_slot_repository.dart';
import 'package:drandme/modules/clinic/repositories/doctor_details_repository.dart';
import 'package:drandme/modules/clinic/repositories/doctor_leave_repository.dart';
import 'package:drandme/modules/clinic/repositories/doctor_consultation_fees_repository.dart';
import 'package:drandme/core/config/service.dart';
import 'package:drandme/core/utils/loading_manager.dart';

class DoctorDetailsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final DoctorTimeSlotRepository _timeSlotRepository;
  final DoctorSessionSlotRepository _sessionSlotRepository;
  final DoctorDetailsRepository _doctorRepository;
  final DoctorLeaveRepository _leaveRepository;
  final DoctorConsultationFeesRepository _consultationFeesRepository;

  DoctorDetailsViewModel(this._authViewModel)
    : _timeSlotRepository = DoctorTimeSlotRepository(ServiceRepo()),
      _sessionSlotRepository = DoctorSessionSlotRepository(ServiceRepo()),
      _doctorRepository = DoctorDetailsRepository(),
      _leaveRepository = DoctorLeaveRepository(ServiceRepo()),
      _consultationFeesRepository = DoctorConsultationFeesRepository(
        ServiceRepo(),
      );

  // State variables
  bool _isLoading = false;
  bool _isCreating = false;
  bool _isLoadingDoctor = false;
  bool _isLoadingLeaves = false;
  bool _isInitializing = false;
  bool _isLoadingFees = false;
  String _error = '';

  /// Feature flag: if false, we auto-approve doctor self-applied leaves (no manual review)
  /// Set this to true if the organization requires an explicit approval step.
  bool requireLeaveApproval = false;

  // Doctor data
  Doctor? _doctor;
  ClinicDoctorLinksResponse? _clinicDoctorLinks;
  String? _currentDoctorId;

  // Time slot data
  List<DateSpecificSlotResponse> _timeSlots = [];
  List<DateSpecificSlotResponse> _offlineSlots = [];
  List<DateSpecificSlotResponse> _onlineSlots = [];

  // Leave data
  List<DoctorLeave> _leaves = [];
  DoctorLeaveStats? _leaveStats;

  // Consultation fees data
  DoctorConsultationFees? _consultationFees;

  // Existing slots cache
  final Map<String, Map<String, List<DoctorSlotSession>>> _existingSessions =
      {};
  final Map<String, Map<String, DoctorSessionSlot>> _existingSlotDetails = {};
  bool _isLoadingExistingSlots = false;

  // Days list
  static const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  // Selected days for offline and online slots
  final Map<String, bool> _selectedDaysOffline = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };
  final Map<String, bool> _selectedDaysOnline = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  // Getters
  bool get isLoading => _isLoading;
  bool get isCreating => _isCreating;
  bool get isLoadingDoctor => _isLoadingDoctor;
  bool get isLoadingLeaves => _isLoadingLeaves;
  bool get isInitializing => _isInitializing;
  String get error => _error;
  Doctor? get doctor => _doctor;
  ClinicDoctorLinksResponse? get clinicDoctorLinks => _clinicDoctorLinks;
  DoctorInfo? get doctorInfo => _clinicDoctorLinks?.doctor;
  List<ClinicLink> get clinicLinks => _clinicDoctorLinks?.clinics ?? [];
  String? get currentDoctorId => _currentDoctorId;
  
  ClinicLink? get currentClinicLink {
    final clinicId = _authViewModel.user?.clinicId;
    if (clinicId == null || _clinicDoctorLinks == null) return null;
    return _clinicDoctorLinks!.getLinkForClinic(clinicId);
  }

  String get joinedDate {
    final link = currentClinicLink;
    if (link == null) return 'N/A';
    return formatDate(link.createdAt);
  }
  List<DateSpecificSlotResponse> get timeSlots => _timeSlots;
  List<DateSpecificSlotResponse> get offlineSlots => _offlineSlots;
  List<DateSpecificSlotResponse> get onlineSlots => _onlineSlots;
  List<DoctorLeave> get leaves => _leaves;
  DoctorLeaveStats? get leaveStats => _leaveStats;
  DoctorConsultationFees? get consultationFees => _consultationFees;
  bool get isLoadingFees => _isLoadingFees;
  Map<String, Map<String, List<DoctorSlotSession>>> get existingSessions =>
      _existingSessions;
  Map<String, Map<String, DoctorSessionSlot>> get existingSlotDetails =>
      _existingSlotDetails;
  bool get isLoadingExistingSlots => _isLoadingExistingSlots;
  Map<String, bool> get selectedDaysOffline => _selectedDaysOffline;
  Map<String, bool> get selectedDaysOnline => _selectedDaysOnline;

  bool _resetSelectedDaysState() {
    bool changed = false;
    for (final day in days) {
      if ((_selectedDaysOffline[day] ?? false)) {
        _selectedDaysOffline[day] = false;
        changed = true;
      }
      if ((_selectedDaysOnline[day] ?? false)) {
        _selectedDaysOnline[day] = false;
        changed = true;
      }
    }
    return changed;
  }

  bool _clearExistingSlotCache() {
    bool cleared = false;
    if (_existingSessions.isNotEmpty) {
      _existingSessions.clear();
      cleared = true;
    }
    if (_existingSlotDetails.isNotEmpty) {
      _existingSlotDetails.clear();
      cleared = true;
    }
    return cleared;
  }

  // Loading state helpers
  void _setLoading(bool value, {bool silent = false}) {
    if (_disposed) return;
    _isLoading = value;
    if (!silent) {
      if (value) {
        LoadingManager.show();
      } else {
        LoadingManager.hide();
      }
    }
    notifyListeners();
  }

  void _setCreating(bool value, {String? message}) {
    if (_disposed) return;
    _isCreating = value;
    if (value) {
      LoadingManager.show(message: message ?? 'Processing...');
    } else {
      LoadingManager.hide();
    }
    notifyListeners();
  }

  void _setLoadingDoctor(bool value, {bool silent = false}) {
    if (_disposed) return;
    _isLoadingDoctor = value;
    if (!silent) {
      if (value) {
        LoadingManager.show(message: 'Loading Doctor Details...');
      } else {
        LoadingManager.hide();
      }
    }
    notifyListeners();
  }

  void _setLoadingLeaves(bool value, {bool silent = false}) {
    if (_disposed) return;
    _isLoadingLeaves = value;
    if (!silent) {
      if (value) {
        LoadingManager.show(message: 'Loading Leave Records...');
      } else {
        LoadingManager.hide();
      }
    }
    notifyListeners();
  }

  void _setLoadingFees(bool value, {bool silent = false}) {
    if (_disposed) return;
    _isLoadingFees = value;
    if (!silent) {
      if (value) {
        LoadingManager.show(message: 'Loading Consultation Fees...');
      } else {
        LoadingManager.hide();
      }
    }
    notifyListeners();
  }

  void _setLoadingProgress(bool value, {bool silent = false}) {
    if (_disposed) return;
    if (!silent) {
      _isInitializing = value;
      if (value) {
        LoadingManager.show(message: 'Loading...');
      } else {
        LoadingManager.hide();
      }
    }
    notifyListeners();
  }

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> loadDoctorDetails(String doctorId, {bool silent = false}) async {
    if (_isLoadingDoctor) return;
    try {
      _setLoadingDoctor(true, silent: silent);
      _error = '';
      _currentDoctorId = doctorId;

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return;
      }

      final clinicDoctorLinks = await _doctorRepository
          .getClinicDoctorLinksByDoctor(token, doctorId);

      if (clinicDoctorLinks != null) {
        _clinicDoctorLinks = clinicDoctorLinks;
        _doctor = null; // Important to clear legacy if new one exists
      } else {
        final doctor = await _doctorRepository.getDoctorById(token, doctorId);
        if (doctor != null) {
          _doctor = doctor;
          _clinicDoctorLinks = null;
        } else {
          _error = 'Failed to load doctor details';
        }
      }
    } catch (e) {
      _error = 'Error loading doctor details: $e';
    } finally {
      _setLoadingDoctor(false, silent: silent);
    }
  }

  /// Update doctor basic info
  Future<bool> updateDoctorInfo({
    required String doctorId,
    required Map<String, dynamic> updateData,
  }) async {
    try {
      _setCreating(true, message: 'Updating Doctor Profile...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final updatedDoctor = await _doctorRepository.updateDoctorDetails(
        token: token,
        doctorId: doctorId,
        updateData: updateData,
      );

      if (updatedDoctor != null) {
        print(
          '✅ Update Doctor Profile Success: ${updatedDoctor.firstName} ${updatedDoctor.lastName}',
        );
        // Refresh the local data
        await loadDoctorDetails(doctorId, silent: true);
        return true;
      } else {
        _error = 'Failed to update doctor profile';
        return false;
      }
    } catch (e) {
      _error = 'Error updating doctor: $e';
      return false;
    } finally {
      _setCreating(false);
    }
  }

  Future<void> loadDoctorTimeSlots(
    String doctorId, {
    DateTime? selectedDate,
    bool silent = false,
  }) async {
    try {
      _setLoading(true, silent: silent);
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;
      final dateString = selectedDate != null
          ? '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}'
          : null;

      final responses = await Future.wait([
        _timeSlotRepository.listDateSpecificSlots(
          token: token,
          doctorId: doctorId,
          clinicId: clinicId,
          slotType: 'offline',
          date: dateString,
        ),
        _timeSlotRepository.listDateSpecificSlots(
          token: token,
          doctorId: doctorId,
          clinicId: clinicId,
          slotType: 'online',
          date: dateString,
        ),
      ]);

      final offlineResponse = responses[0];
      final onlineResponse = responses[1];

      _offlineSlots = offlineResponse?.slots ?? [];
      _onlineSlots = onlineResponse?.slots ?? [];
      _timeSlots = [..._offlineSlots, ..._onlineSlots];

      if (_timeSlots.isEmpty) {
        _error = 'No available time slots for this doctor';
      }
    } catch (e) {
      _error = 'Error loading time slots: $e';
    } finally {
      _setLoading(false, silent: silent);
    }
  }

  Future<CreateSlotsResponse?> createDateSpecificSlots(
    CreateDateSpecificSlotsInput input,
  ) async {
    try {
      _setCreating(true, message: 'Creating Time Slots...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return null;
      }

      final response = await _timeSlotRepository.createDateSpecificSlots(
        token: token,
        input: input,
      );

      if (response != null) {
        await loadDoctorTimeSlots(input.doctorId, silent: true);
        return response;
      } else {
        _error = 'Failed to create time slots';
        return null;
      }
    } catch (e) {
      _error = 'Error creating time slots: $e';
      return null;
    } finally {
      _setCreating(false);
    }
  }

  Future<CreateSessionSlotsResponse?> createSessionSlots(
    CreateSessionSlotsInput input,
  ) async {
    try {
      _setCreating(true, message: 'Processing Session Slots...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return null;
      }

      final response = await _sessionSlotRepository.createSessionSlots(
        token: token,
        input: input,
      );

      if (response != null && response.success) {
        await loadDoctorTimeSlots(input.doctorId, silent: true);
        return response;
      } else {
        _error = 'Failed to create session slots';
        return null;
      }
    } catch (e) {
      _error = 'Error creating session slots: $e';
      return null;
    } finally {
      _setCreating(false);
    }
  }

  Future<bool> updateSessionSlots({
    required String slotId,
    List<Map<String, String>> sessions = const [],
    List<Map<String, dynamic>> newSessions = const [],
  }) async {
    try {
      _setCreating(true, message: 'Updating Session Slots...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final success = await _sessionSlotRepository.updateSessionSlotSessions(
        token: token,
        slotId: slotId,
        sessions: sessions,
        newSessions: newSessions,
      );

      if (!success) {
        _error = 'Failed to update session slots';
      }

      return success;
    } catch (e) {
      _error = 'Error updating session slots: $e';
      return false;
    } finally {
      _setCreating(false);
    }
  }

  Future<ListSessionSlotsResponse?> listSessionSlotsForDate({
    required String doctorId,
    required String clinicId,
    required String slotType,
    required String date,
  }) async {
    try {
      final token = _authViewModel.accessToken;
      if (token == null) {
        return null;
      }

      final response = await _sessionSlotRepository.listSessionSlots(
        token: token,
        doctorId: doctorId,
        clinicId: clinicId,
        date: date,
        slotType: slotType,
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<void> loadLeaves({
    String? doctorId,
    String? clinicId,
    String? status,
    bool silent = false,
  }) async {
    try {
      _setLoadingLeaves(true, silent: silent);
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return;
      }

      final targetDoctorId = doctorId ?? _currentDoctorId;
      if (targetDoctorId == null) {
        _error = 'Doctor ID is required';
        return;
      }

      final response = await _leaveRepository.listLeaves(
        token: token,
        doctorId: targetDoctorId,
        clinicId: clinicId,
        status: status,
      );

      _leaves = response?.leaves ?? [];

      // Load stats
      loadLeaveStats(doctorId: targetDoctorId, silent: true);
    } catch (e) {
      _error = 'Error loading leaves: $e';
      _leaves = [];
    } finally {
      _setLoadingLeaves(false, silent: silent);
    }
  }

  Future<void> loadLeaveStats({
    required String doctorId,
    bool silent = false,
  }) async {
    try {
      if (!silent) _setLoadingLeaves(true, silent: silent);

      final token = _authViewModel.accessToken;
      if (token == null) return;

      final stats = await _leaveRepository.getLeaveStats(
        token: token,
        doctorId: doctorId,
      );

      _leaveStats = stats;
      notifyListeners();
    } catch (e) {
      print('Error loading create stats: $e');
    } finally {
      if (!silent) _setLoadingLeaves(false, silent: silent);
    }
  }

  Future<ApplyLeaveResponse?> applyLeave(ApplyLeaveRequest request) async {
    try {
      _setCreating(true, message: 'Applying for Leave...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return null;
      }

      final response = await _leaveRepository.applyLeave(
        token: token,
        request: request,
      );

      if (response != null) {
        if (!requireLeaveApproval && response.leaveId.isNotEmpty) {
          try {
            await _leaveRepository.reviewLeave(
              token: token,
              leaveId: response.leaveId,
              request: ReviewLeaveRequest(status: 'approved'),
            );
          } catch (e) {}
        }
        await loadLeaves(doctorId: request.doctorId);
        return response;
      } else {
        _error = 'Failed to apply for leave';
        return null;
      }
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      _error = errorMessage;
      return null;
    } finally {
      _setCreating(false);
    }
  }

  Future<bool> updateLeave({
    required String leaveId,
    required UpdateLeaveRequest request,
  }) async {
    try {
      _setCreating(true, message: 'Updating Leave...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final success = await _leaveRepository.updateLeave(
        token: token,
        leaveId: leaveId,
        request: request,
      );

      if (success) {
        await loadLeaves(doctorId: request.doctorId);
        return true;
      } else {
        _error = 'Failed to update leave';
        return false;
      }
    } catch (e) {
      _error = 'Error updating leave: $e';
      return false;
    } finally {
      _setCreating(false);
    }
  }

  Future<bool> cancelLeave(String leaveId) async {
    try {
      _setCreating(true, message: 'Cancelling Leave...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final success = await _leaveRepository.cancelLeave(
        token: token,
        leaveId: leaveId,
      );

      if (success) {
        await loadLeaves();
        return true;
      } else {
        _error = 'Failed to cancel leave';
        return false;
      }
    } catch (e) {
      _error = 'Error cancelling leave: $e';
      return false;
    } finally {
      _setCreating(false);
    }
  }

  Future<bool> reviewLeave({
    required String leaveId,
    required ReviewLeaveRequest request,
  }) async {
    try {
      _setCreating(true, message: 'Processing Review...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final success = await _leaveRepository.reviewLeave(
        token: token,
        leaveId: leaveId,
        request: request,
      );

      if (success) {
        await loadLeaves();
        return true;
      } else {
        _error = 'Failed to review leave';
        return false;
      }
    } catch (e) {
      _error = 'Error reviewing leave: $e';
      return false;
    } finally {
      _setCreating(false);
    }
  }

  Future<void> loadConsultationFees({
    required String clinicId,
    required String clinicDoctorId,
    bool silent = false,
  }) async {
    try {
      _setLoadingFees(true, silent: silent);
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return;
      }

      final fees = await _consultationFeesRepository.getConsultationFees(
        token: token,
        clinicId: clinicId,
        clinicDoctorId: clinicDoctorId,
      );

      _consultationFees = fees;
    } catch (e) {
      _error = 'Error loading consultation fees: $e';
      _consultationFees = null;
    } finally {
      _setLoadingFees(false, silent: silent);
    }
  }

  Future<bool> saveConsultationFees({
    required String clinicId,
    required String clinicDoctorId,
    required double? offlineFee,
    required double? onlineFee,
  }) async {
    try {
      _setCreating(true, message: 'Saving Consultation Fees...');
      _error = '';

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      // Check if fees exist
      final hasExistingFees = _consultationFees != null;

      DoctorConsultationFees? result;

      if (hasExistingFees) {
        // Update existing fees
        final request = UpdateConsultationFeesRequest(
          clinicId: clinicId,
          clinicDoctorId: clinicDoctorId,
          consultationFeeOffline: offlineFee,
          consultationFeeOnline: onlineFee,
        );
        result = await _consultationFeesRepository.updateConsultationFees(
          token: token,
          request: request,
        );
      } else {
        // Add new fees
        final request = AddConsultationFeesRequest(
          clinicId: clinicId,
          clinicDoctorId: clinicDoctorId,
          consultationFeeOffline: offlineFee,
          consultationFeeOnline: onlineFee,
        );
        result = await _consultationFeesRepository.addConsultationFees(
          token: token,
          request: request,
        );
      }

      if (result != null) {
        _consultationFees = result;
        return true;
      } else {
        _error = 'Failed to save consultation fees';
        return false;
      }
    } catch (e) {
      _error = 'Error saving consultation fees: $e';
      return false;
    } finally {
      _setCreating(false);
    }
  }

  int getDayOfWeekNumber(String day) {
    switch (day) {
      case 'Sunday':
        return 0;
      case 'Monday':
        return 1;
      case 'Tuesday':
        return 2;
      case 'Wednesday':
        return 3;
      case 'Thursday':
        return 4;
      case 'Friday':
        return 5;
      case 'Saturday':
        return 6;
      default:
        return 1;
    }
  }

  String getDayNameFromNumber(int weekday) {
    switch (weekday) {
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
        return 'Monday';
    }
  }

  DateTime getNextOccurrenceOfDay(String day) {
    final now = DateTime.now();
    final targetDayOfWeek = getDayOfWeekNumber(day);
    final currentDayOfWeek = now.weekday;

    int daysToAdd;
    if (targetDayOfWeek > currentDayOfWeek) {
      daysToAdd = targetDayOfWeek - currentDayOfWeek;
    } else if (targetDayOfWeek < currentDayOfWeek) {
      daysToAdd = 7 - currentDayOfWeek + targetDayOfWeek;
    } else {
      daysToAdd = 7;
    }

    return DateTime(
      now.year,
      now.month,
      now.day,
    ).add(Duration(days: daysToAdd));
  }

  String normalizeSessionTime(String? rawTime) {
    if (rawTime == null || rawTime.trim().isEmpty) {
      return '';
    }

    final value = rawTime.trim();

    try {
      if (value.contains('T')) {
        final dateTime = DateTime.parse(value);
        final hour = dateTime.hour.toString().padLeft(2, '0');
        final minute = dateTime.minute.toString().padLeft(2, '0');
        return '$hour:$minute';
      }

      // Handle AM/PM format (e.g. "01:28 PM" or "1:28 PM")
      final upperValue = value.toUpperCase();
      if (upperValue.contains('PM') || upperValue.contains('AM')) {
        final hasColon = upperValue.contains(':');
        int hour = 0;
        int minute = 0;

        if (hasColon) {
          final parts = upperValue.split(':');
          hour = int.tryParse(parts[0].replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
          final minPart = parts[1];
          minute = int.tryParse(minPart.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        } else {
          hour = int.tryParse(upperValue.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        }

        final isPM = upperValue.contains('PM');
        final isAM = upperValue.contains('AM');

        if (isPM && hour < 12) hour += 12;
        if (isAM && hour == 12) hour = 0;

        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      }

      // Handle plain HH:mm or HHmm
      final segments = value.split(':');
      if (segments.length >= 2) {
        final hour = int.tryParse(segments[0]) ?? 0;
        final minutePart = segments[1].replaceAll(RegExp(r'[^0-9]'), '');
        final minute = int.tryParse(minutePart) ?? 0;
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      } else if (value.length >= 3 && value.length <= 4) {
        // Handle 930 or 0930
        final hourStr = value.length == 3 ? value.substring(0, 1) : value.substring(0, 2);
        final minStr = value.length == 3 ? value.substring(1) : value.substring(2);
        final hour = int.tryParse(hourStr) ?? 0;
        final minute = int.tryParse(minStr) ?? 0;
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      }
    } catch (_) {
      // Ignore parsing errors
    }

    return value;
  }

  Future<void> loadExistingSlotsForDay({
    required String doctorId,
    required String day,
    required String slotType,
    required String clinicId,
    bool silent = false,
  }) async {
    try {
      _setLoadingProgress(true, silent: silent);
      final nextDate = getNextOccurrenceOfDay(day);
      final dateString =
          '${nextDate.year}-${nextDate.month.toString().padLeft(2, '0')}-${nextDate.day.toString().padLeft(2, '0')}';

      final sessionSlots = await listSessionSlotsForDate(
        doctorId: doctorId,
        clinicId: clinicId,
        slotType: slotType,
        date: dateString,
      );

      if (sessionSlots != null && sessionSlots.slots.isNotEmpty) {
        DoctorSessionSlot? slotMatch;
        final targetWeekday = getDayOfWeekNumber(day);

        for (final slotDay in sessionSlots.slots) {
          if (slotDay.dayOfWeek != null) {
            if (slotDay.dayOfWeek == targetWeekday) {
              slotMatch = slotDay;
              break;
            }
          } else if (slotDay.date == dateString) {
            slotMatch = slotDay;
            break;
          }
        }

        slotMatch ??= sessionSlots.slots.first;
        final allSessions = slotMatch.sessions;

        if (!_existingSessions.containsKey(day)) {
          _existingSessions[day] = {};
        }
        _existingSessions[day]![slotType] = allSessions;

        if (!_existingSlotDetails.containsKey(day)) {
          _existingSlotDetails[day] = {};
        }
        _existingSlotDetails[day]![slotType] = slotMatch;
      } else {
        if (!_existingSessions.containsKey(day)) {
          _existingSessions[day] = {};
        }
        _existingSessions[day]![slotType] = [];
        _existingSlotDetails[day]?.remove(slotType);
      }
    } catch (e) {
      if (!_existingSessions.containsKey(day)) {
        _existingSessions[day] = {};
      }
      _existingSessions[day]![slotType] = [];
    } finally {
      _setLoadingProgress(false, silent: silent);
    }
  }

  Future<void> loadBulkExistingSlots({
    required String doctorId,
    required String clinicId,
    bool silent = false,
  }) async {
    if (_isLoadingExistingSlots) return;
    _isLoadingExistingSlots = true;
    if (!silent) LoadingManager.show(message: 'Loading sessions...');
    notifyListeners();

    try {
      // Fetch all slots (no date filter) for both types in parallel
      final responses = await Future.wait([
        listSessionSlotsForDate(
          doctorId: doctorId,
          clinicId: clinicId,
          slotType: 'clinic_visit',
          date: '', // Empty date to get all
        ),
        listSessionSlotsForDate(
          doctorId: doctorId,
          clinicId: clinicId,
          slotType: 'video_consultation',
          date: '', // Empty date to get all
        ),
      ]);

      final offlineResponse = responses[0];
      final onlineResponse = responses[1];

      // Clear existing cache for fresh start
      _existingSessions.clear();
      _existingSlotDetails.clear();

      void processResponse(ListSessionSlotsResponse? response, String type) {
        if (response == null) return;
        for (final slot in response.slots) {
          final dayName = getDayNameFromNumber(slot.dayOfWeek ?? 1);
          _existingSessions.putIfAbsent(dayName, () => {})[type] = slot.sessions;
          _existingSlotDetails.putIfAbsent(dayName, () => {})[type] = slot;
        }
      }

      processResponse(offlineResponse, 'clinic_visit');
      processResponse(onlineResponse, 'video_consultation');
      
      autoSelectDaysWithSlots();
    } finally {
      _isLoadingExistingSlots = false;
      if (!silent) LoadingManager.hide();
      notifyListeners();
    }
  }

  Future<void> loadAllExistingSlots({
    required String doctorId,
    required String clinicId,
    required List<String> days,
    bool silent = false,
  }) async {
    if (_isLoadingExistingSlots) return;

    _isLoadingExistingSlots = true;
    if (!silent) {
      LoadingManager.show(message: 'Loading existing slots...');
    }
    notifyListeners();

    try {
      final futures = <Future<void>>[];
      for (final day in days) {
        futures.add(
          loadExistingSlotsForDay(
            doctorId: doctorId,
            day: day,
            slotType: 'clinic_visit',
            clinicId: clinicId,
            silent: true,
          ),
        );
        futures.add(
          loadExistingSlotsForDay(
            doctorId: doctorId,
            day: day,
            slotType: 'video_consultation',
            clinicId: clinicId,
            silent: true,
          ),
        );
      }
      await Future.wait(futures);
    } finally {
      _isLoadingExistingSlots = false;
      if (!silent) {
        LoadingManager.hide();
      }
      notifyListeners();
    }
  }

  bool hasSessionsChanged({
    required List<DoctorSlotSession> existingSessions,
    required List<SessionDefinition> newSessions,
  }) {
    String normalizeName(String? name) => (name ?? '').trim().toLowerCase();

    final existingMap = <String, DoctorSlotSession>{};
    for (final session in existingSessions) {
      existingMap[normalizeName(session.sessionName)] = session;
    }

    final newMap = <String, SessionDefinition>{};
    for (final session in newSessions) {
      newMap[normalizeName(session.sessionName)] = session;
    }

    final allKeys = <String>{...existingMap.keys, ...newMap.keys};
    for (final key in allKeys) {
      final existing = existingMap[key];
      final updated = newMap[key];

      if (existing == null || updated == null) {
        return true;
      }

      final existingStart = normalizeSessionTime(existing.startTime);
      final existingEnd = normalizeSessionTime(existing.endTime);
      final updatedStart = normalizeSessionTime(updated.startTime);
      final updatedEnd = normalizeSessionTime(updated.endTime);

      if (existingStart != updatedStart || existingEnd != updatedEnd) {
        return true;
      }

      if (existing.maxPatients != updated.maxPatients) {
        return true;
      }

      if (existing.slotIntervalMinutes != updated.slotIntervalMinutes) {
        return true;
      }
    }

    return false;
  }

  Future<SlotCreationResult> createSlots({
    required String doctorId,
    required String clinicId,
    required String slotType,
    required Map<String, bool> selectedDays,
    required Map<String, Map<String, String>> timeData,
    required Map<String, Map<String, String>> maxPatientsData,
  }) async {
    final selectedDaysList = selectedDays.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    if (selectedDaysList.isEmpty) {
      return SlotCreationResult(
        success: false,
        error: 'Please select at least one day',
      );
    }

    final createConfigs = <DaySlotConfig>[];
    final updateConfigs = <DayUpdateConfig>[];
    final missingSessionDays = <String>[];
    final unchangedExistingDays = <String>[];

    for (final day in selectedDaysList) {
      if (!timeData.containsKey(day)) {
        missingSessionDays.add(day);
        continue;
      }

      final sessionsForDay = _collectSessionsForDay(
        day: day,
        timeData: timeData,
        maxPatientsData: maxPatientsData,
      );

      if (sessionsForDay.isEmpty) {
        missingSessionDays.add(day);
        continue;
      }

      final existingSessionsForDay =
          _existingSessions[day]?[slotType] ?? const <DoctorSlotSession>[];
      final existingSlot = _existingSlotDetails[day]?[slotType];

      if (existingSessionsForDay.isNotEmpty && existingSlot != null) {
        final hasChanges = hasSessionsChanged(
          existingSessions: existingSessionsForDay,
          newSessions: sessionsForDay,
        );

        if (!hasChanges) {
          unchangedExistingDays.add(day);
          continue;
        }

        updateConfigs.add(
          DayUpdateConfig(
            dayName: day,
            weekdayNumber: getDayOfWeekNumber(day),
            slotId: existingSlot.id,
            newSessions: sessionsForDay,
            existingSessions: existingSessionsForDay,
          ),
        );
        continue;
      }

      createConfigs.add(
        DaySlotConfig(
          dayName: day,
          weekdayNumber: getDayOfWeekNumber(day),
          sessions: sessionsForDay,
        ),
      );
    }

    if (createConfigs.isEmpty && updateConfigs.isEmpty) {
      final buffer = StringBuffer();
      if (missingSessionDays.isNotEmpty) {
        buffer.write(
          'Please configure time slots for: ${missingSessionDays.join(', ')}',
        );
      }
      if (unchangedExistingDays.isNotEmpty) {
        if (buffer.isNotEmpty) buffer.write('\n');
        buffer.write(
          'No changes detected for: ${unchangedExistingDays.join(', ')}',
        );
      }
      if (buffer.isEmpty) {
        buffer.write('Please configure time slots before saving.');
      }

      return SlotCreationResult(success: false, error: buffer.toString());
    }

    int totalCreated = 0;
    final List<String> createdWeekdays = [];
    final List<String> updatedDays = [];
    final List<String> updateErrors = [];
    final List<String> errorMessages = [];

    // Create new slots
    for (final config in createConfigs) {
      final response = await createSessionSlots(
        CreateSessionSlotsInput(
          doctorId: doctorId,
          clinicId: clinicId,
          slotType: slotType,
          slotDuration: 5,
          weekdays: [config.weekdayNumber],
          isAvailable: true,
          sessions: config.sessions,
        ),
      );

      if (response != null && response.success) {
        if (response.dataList.isNotEmpty) {
          for (final slot in response.dataList) {
            final slotTotal = slot.sessions.fold<int>(
              0,
              (sum, session) => sum + session.generatedSlots,
            );
            totalCreated += slotTotal;
            final dayName = getDayNameFromNumber(slot.dayOfWeek ?? 0);
            createdWeekdays.add('$dayName - $slotTotal slots');
          }
        } else if (response.data != null) {
          final slotTotal = response.data!.sessions.fold<int>(
            0,
            (sum, session) => sum + session.generatedSlots,
          );
          totalCreated += slotTotal;
          createdWeekdays.add(
            '${response.data!.date ?? config.dayName} - $slotTotal slots',
          );
        }

        await loadExistingSlotsForDay(
          doctorId: doctorId,
          day: config.dayName,
          slotType: slotType,
          clinicId: clinicId,
          silent: true,
        );
      } else {
        errorMessages.add('Failed to create slots for ${config.dayName}');
      }
    }

    // Update existing slots
    for (final config in updateConfigs) {
      final updatePayload = <Map<String, String>>[];
      final newSessionsPayload = <Map<String, dynamic>>[];
      final existingMap = <String, DoctorSlotSession>{};
      for (final session in config.existingSessions) {
        existingMap[(session.sessionName ?? '').trim().toLowerCase()] = session;
      }

      for (final session in config.newSessions) {
        final key = session.sessionName.trim().toLowerCase();
        final existing = existingMap[key];
        if (existing == null) {
          newSessionsPayload.add({
            'session_name': session.sessionName,
            'start_time': session.startTime,
            'end_time': session.endTime,
            'max_patients': session.maxPatients,
            'slot_interval_minutes': session.slotIntervalMinutes,
            if (session.notes != null) 'notes': session.notes,
          });
          continue;
        }

        updatePayload.add({
          'session_id': existing.id,
          'start_time': session.startTime,
          'end_time': session.endTime,
        });
      }

      if (updatePayload.isEmpty && newSessionsPayload.isEmpty) {
        updateErrors.add('${config.dayName}: No changes detected');
        continue;
      }

      final success = await updateSessionSlots(
        slotId: config.slotId,
        sessions: updatePayload,
        newSessions: newSessionsPayload,
      );

      if (success) {
        updatedDays.add(config.dayName);
        await loadExistingSlotsForDay(
          doctorId: doctorId,
          day: config.dayName,
          slotType: slotType,
          clinicId: clinicId,
          silent: true,
        );
      } else {
        updateErrors.add('${config.dayName}: Failed to update sessions');
      }
    }

    final processedCreateDayNames = createConfigs
        .map((c) => c.dayName)
        .toList();

    return SlotCreationResult(
      success: totalCreated > 0 || updatedDays.isNotEmpty,
      totalCreated: totalCreated,
      createdWeekdays: createdWeekdays,
      updatedDays: updatedDays,
      errorMessages: [...errorMessages, ...updateErrors],
      missingSessionDays: missingSessionDays,
      unchangedExistingDays: unchangedExistingDays,
      processedCreateDayNames: processedCreateDayNames,
    );
  }

  List<SessionDefinition> _collectSessionsForDay({
    required String day,
    required Map<String, Map<String, String>> timeData,
    required Map<String, Map<String, String>> maxPatientsData,
  }) {
    final dayData = timeData[day];
    if (dayData == null) {
      return [];
    }

    final maxData = maxPatientsData[day];
    final sessions = <SessionDefinition>[];

    final morningStart = dayData['morningStart']?.trim() ?? '';
    final morningEnd = dayData['morningEnd']?.trim() ?? '';
    if (morningStart.isNotEmpty && morningEnd.isNotEmpty) {
      final morningMax = int.tryParse(maxData?['morningMax'] ?? '1') ?? 1;
      sessions.add(
        SessionDefinition(
          sessionName: 'Morning Session',
          startTime: normalizeSessionTime(morningStart),
          endTime: normalizeSessionTime(morningEnd),
          maxPatients: morningMax,
          slotIntervalMinutes: 5,
        ),
      );
    }

    final afternoonStart = dayData['afternoonStart']?.trim() ?? '';
    final afternoonEnd = dayData['afternoonEnd']?.trim() ?? '';
    if (afternoonStart.isNotEmpty && afternoonEnd.isNotEmpty) {
      final afternoonMax = int.tryParse(maxData?['afternoonMax'] ?? '1') ?? 1;
      sessions.add(
        SessionDefinition(
          sessionName: 'Afternoon Session',
          startTime: normalizeSessionTime(afternoonStart),
          endTime: normalizeSessionTime(afternoonEnd),
          maxPatients: afternoonMax,
          slotIntervalMinutes: 5,
        ),
      );
    }

    return sessions;
  }

  Future<void> refreshSessionSlotsForDateRange({
    required String doctorId,
    required DateTime? start,
    DateTime? end,
  }) async {
    if (start == null) return;
    final DateTime startDate = DateTime(start.year, start.month, start.day);
    final DateTime endDate = end != null
        ? DateTime(end.year, end.month, end.day)
        : DateTime(start.year, start.month, start.day);

    for (
      DateTime d = startDate;
      !d.isAfter(endDate);
      d = d.add(const Duration(days: 1))
    ) {
      await loadDoctorTimeSlots(doctorId, selectedDate: d);
    }
  }

  Future<void> refresh({required String doctorId, String? clinicId}) async {
    try {
      _setLoadingProgress(true); // ONE Master loader for refresh
      await Future.wait([
        loadDoctorDetails(doctorId, silent: true),
        loadDoctorTimeSlots(doctorId, silent: true),
        if (clinicId != null)
          loadLeaves(doctorId: doctorId, clinicId: clinicId, silent: true),
      ]);
    } finally {
      _setLoadingProgress(false);
    }
  }

  void setSelectedDay(String day, String slotType, bool value) {
    if (slotType == 'clinic_visit') {
      _selectedDaysOffline[day] = value;
    } else {
      _selectedDaysOnline[day] = value;
    }
    notifyListeners();
  }

  Map<String, bool> getSelectedDays(String slotType) {
    return slotType == 'clinic_visit'
        ? _selectedDaysOffline
        : _selectedDaysOnline;
  }

  void autoSelectDaysWithSlots() {
    bool changed = false;
    for (String day in days) {
      final offlineSessions = _existingSessions[day]?['clinic_visit'];
      final onlineSessions = _existingSessions[day]?['video_consultation'];

      if (offlineSessions != null && offlineSessions.isNotEmpty) {
        final currentValue = _selectedDaysOffline[day] ?? false;
        if (!currentValue) {
          _selectedDaysOffline[day] = true;
          changed = true;
        }
      }

      if (onlineSessions != null && onlineSessions.isNotEmpty) {
        final currentValue = _selectedDaysOnline[day] ?? false;
        if (!currentValue) {
          _selectedDaysOnline[day] = true;
          changed = true;
        }
      }
    }
    if (changed) {
      notifyListeners();
    }
  }

  Future<void> loadConsultationFeesForCurrentClinic({
    required String clinicId,
    bool silent = false,
  }) async {
    if (clinicLinks.isEmpty) return;

    final clinicLink = clinicLinks.firstWhere(
      (link) => link.clinic.clinicId == clinicId,
      orElse: () => clinicLinks.first,
    );

    await loadConsultationFees(
      clinicId: clinicId,
      clinicDoctorId: clinicLink.linkId,
      silent: silent,
    );
  }

  Future<void> initializeDoctorData({
    required String doctorId,
    String? clinicId,
  }) async {
    final isSwitchingDoctor = _currentDoctorId != doctorId;
    if (isSwitchingDoctor) {
      _resetSelectedDaysState();
      _clearExistingSlotCache();
      _currentDoctorId = doctorId;
      notifyListeners();
    }

    try {
      _setLoadingProgress(true);

      // 1. Load Critical Profile Info First (Fastest)
      await loadDoctorDetails(doctorId, silent: true);
      
      // 2. UNLOCK UI immediately after profile is ready
      _setLoadingProgress(false); 
      
      // 3. Load everything else in the background
      final List<Future> backgroundTasks = [
        loadDoctorTimeSlots(doctorId, silent: true),
      ];

      if (clinicId != null) {
        backgroundTasks.add(loadLeaves(doctorId: doctorId, clinicId: clinicId, silent: true));
        backgroundTasks.add(loadBulkExistingSlots(doctorId: doctorId, clinicId: clinicId, silent: true));
        backgroundTasks.add(loadConsultationFeesForCurrentClinic(clinicId: clinicId, silent: true));
      }

      await Future.wait(backgroundTasks);
      
    } catch (e) {
      _error = 'Initialization error: $e';
      _setLoadingProgress(false);
    }
  }

  static String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  static String formatLeaveType(String leaveType) {
    switch (leaveType) {
      case 'sick_leave':
        return 'Sick Leave';
      case 'vacation':
        return 'Vacation';
      case 'emergency':
        return 'Emergency';
      case 'casual_leave':
        return 'Casual Leave';
      case 'other':
        return 'Other';
      default:
        return leaveType
            .replaceAll('_', ' ')
            .split(' ')
            .map(
              (word) =>
                  word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
            )
            .join(' ');
    }
  }

  static String formatDaysType(String daysType) {
    switch (daysType) {
      case 'full_day':
        return 'Full Day';
      case 'morning':
        return 'Morning';
      case 'afternoon':
        return 'Afternoon';
      default:
        return daysType
            .replaceAll('_', ' ')
            .split(' ')
            .map(
              (word) =>
                  word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
            )
            .join(' ');
    }
  }

  Future<FeeSaveResult> validateAndSaveFees({
    required String clinicId,
    required String offlineFeeText,
    required String onlineFeeText,
  }) async {
    // Validation
    if (offlineFeeText.isEmpty && onlineFeeText.isEmpty) {
      return FeeSaveResult(
        success: false,
        error: 'Please enter at least one fee',
      );
    }

    double? offlineFee;
    double? onlineFee;

    if (offlineFeeText.isNotEmpty) {
      offlineFee = double.tryParse(offlineFeeText);
      if (offlineFee == null || offlineFee < 0) {
        return FeeSaveResult(
          success: false,
          error: 'Invalid offline fee amount',
        );
      }
    }

    if (onlineFeeText.isNotEmpty) {
      onlineFee = double.tryParse(onlineFeeText);
      if (onlineFee == null || onlineFee < 0) {
        return FeeSaveResult(
          success: false,
          error: 'Invalid online fee amount',
        );
      }
    }

    if (clinicLinks.isEmpty) {
      return FeeSaveResult(success: false, error: 'Clinic link not found');
    }

    final clinicLink = clinicLinks.firstWhere(
      (link) => link.clinic.clinicId == clinicId,
      orElse: () => clinicLinks.first,
    );

    // Save fees
    final success = await saveConsultationFees(
      clinicId: clinicId,
      clinicDoctorId: clinicLink.linkId,
      offlineFee: offlineFee,
      onlineFee: onlineFee,
    );

    if (success) {
      // Reload fees
      await loadConsultationFees(
        clinicId: clinicId,
        clinicDoctorId: clinicLink.linkId,
      );
      return FeeSaveResult(success: true);
    } else {
      return FeeSaveResult(
        success: false,
        error: error.isNotEmpty ? error : 'Failed to save consultation fees',
      );
    }
  }

  static LeaveValidationResult validateLeaveDates({
    required DateTime? fromDate,
    required DateTime? toDate,
    String? reason,
  }) {
    if (fromDate == null || toDate == null) {
      return LeaveValidationResult(
        isValid: false,
        error: 'Please select both from and to dates',
      );
    }

    if (toDate.isBefore(fromDate)) {
      return LeaveValidationResult(
        isValid: false,
        error: 'To date must be after from date',
      );
    }

    // Validate reason if provided (must be 5-500 characters)
    if (reason != null && reason.isNotEmpty) {
      if (reason.length < 5) {
        return LeaveValidationResult(
          isValid: false,
          error: 'Reason must be at least 5 characters if provided',
        );
      }
      if (reason.length > 500) {
        return LeaveValidationResult(
          isValid: false,
          error: 'Reason must not exceed 500 characters',
        );
      }
    }

    return LeaveValidationResult(isValid: true);
  }

  FeeValues? getConsultationFeeValues() {
    if (_consultationFees == null) return null;
    return FeeValues(
      offlineFee: _consultationFees!.consultationFeeOffline?.toString() ?? '',
      onlineFee: _consultationFees!.consultationFeeOnline?.toString() ?? '',
    );
  }

  Map<String, TimeFieldData> getTimeFieldPreFillData(String slotType) {
    final result = <String, TimeFieldData>{};

    for (String day in days) {
      final sessions = _existingSessions[day]?[slotType];
      if (sessions == null || sessions.isEmpty) continue;

      // Find morning and afternoon sessions
      DoctorSlotSession? morningSession;
      DoctorSlotSession? afternoonSession;

      for (var session in sessions) {
        final sessionName = (session.sessionName ?? '').toLowerCase();
        if (sessionName.contains('morning')) {
          morningSession = session;
        } else if (sessionName.contains('afternoon')) {
          afternoonSession = session;
        }
      }

      if (morningSession != null || afternoonSession != null) {
        result[day] = TimeFieldData(
          morningStart: morningSession != null
              ? normalizeSessionTime(morningSession.startTime)
              : '',
          morningEnd: morningSession != null
              ? normalizeSessionTime(morningSession.endTime)
              : '',
          morningMax: morningSession?.maxPatients.toString() ?? '1',
          afternoonStart: afternoonSession != null
              ? normalizeSessionTime(afternoonSession.startTime)
              : '',
          afternoonEnd: afternoonSession != null
              ? normalizeSessionTime(afternoonSession.endTime)
              : '',
          afternoonMax: afternoonSession?.maxPatients.toString() ?? '1',
        );
      }
    }

    return result;
  }

  static Map<String, Map<String, String>> extractTimeData(
    Map<String, Map<String, String>> controllerValues,
  ) {
    final result = <String, Map<String, String>>{};
    controllerValues.forEach((day, dayData) {
      result[day] = {
        'morningStart': dayData['morningStart']?.trim() ?? '',
        'morningEnd': dayData['morningEnd']?.trim() ?? '',
        'afternoonStart': dayData['afternoonStart']?.trim() ?? '',
        'afternoonEnd': dayData['afternoonEnd']?.trim() ?? '',
      };
    });
    return result;
  }

  static Map<String, Map<String, String>> extractMaxPatientsData(
    Map<String, Map<String, String>> controllerValues,
  ) {
    final result = <String, Map<String, String>>{};
    controllerValues.forEach((day, dayData) {
      result[day] = {
        'morningMax': dayData['morningMax']?.trim() ?? '1',
        'afternoonMax': dayData['afternoonMax']?.trim() ?? '1',
      };
    });
    return result;
  }
}

// Helper classes for UI data
class FeeValues {
  final String offlineFee;
  final String onlineFee;

  FeeValues({required this.offlineFee, required this.onlineFee});
}

class TimeFieldData {
  final String morningStart;
  final String morningEnd;
  final String morningMax;
  final String afternoonStart;
  final String afternoonEnd;
  final String afternoonMax;

  TimeFieldData({
    required this.morningStart,
    required this.morningEnd,
    required this.morningMax,
    required this.afternoonStart,
    required this.afternoonEnd,
    required this.afternoonMax,
  });
}

// Helper classes for results
class FeeSaveResult {
  final bool success;
  final String? error;

  FeeSaveResult({required this.success, this.error});
}

class LeaveValidationResult {
  final bool isValid;
  final String? error;

  LeaveValidationResult({required this.isValid, this.error});
}

// Helper classes for slot creation
class DaySlotConfig {
  final String dayName;
  final int weekdayNumber;
  final List<SessionDefinition> sessions;

  DaySlotConfig({
    required this.dayName,
    required this.weekdayNumber,
    required this.sessions,
  });
}

class DayUpdateConfig {
  final String dayName;
  final int weekdayNumber;
  final String slotId;
  final List<SessionDefinition> newSessions;
  final List<DoctorSlotSession> existingSessions;

  DayUpdateConfig({
    required this.dayName,
    required this.weekdayNumber,
    required this.slotId,
    required this.newSessions,
    required this.existingSessions,
  });
}

class SlotCreationResult {
  final bool success;
  final int totalCreated;
  final List<String> createdWeekdays;
  final List<String> updatedDays;
  final List<String> errorMessages;
  final List<String> missingSessionDays;
  final List<String> unchangedExistingDays;
  final List<String> processedCreateDayNames;
  final String? error;

  SlotCreationResult({
    required this.success,
    this.totalCreated = 0,
    this.createdWeekdays = const [],
    this.updatedDays = const [],
    this.errorMessages = const [],
    this.missingSessionDays = const [],
    this.unchangedExistingDays = const [],
    this.processedCreateDayNames = const [],
    this.error,
  });
}
