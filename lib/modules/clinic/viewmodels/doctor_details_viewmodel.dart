import 'package:flutter/foundation.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:a/modules/clinic/models/doctor_session_slot_model.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/models/clinic_doctor_links_model.dart';
import 'package:a/modules/clinic/repositories/doctor_time_slot_repository.dart';
import 'package:a/modules/clinic/repositories/doctor_session_slot_repository.dart';
import 'package:a/modules/clinic/repositories/doctor_details_repository.dart';
import 'package:a/core/config/service.dart';

class DoctorDetailsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final DoctorTimeSlotRepository _timeSlotRepository;
  final DoctorSessionSlotRepository _sessionSlotRepository;
  final DoctorDetailsRepository _doctorRepository;

  DoctorDetailsViewModel(this._authViewModel)
    : _timeSlotRepository = DoctorTimeSlotRepository(ServiceRepo()),
      _sessionSlotRepository = DoctorSessionSlotRepository(ServiceRepo()),
      _doctorRepository = DoctorDetailsRepository();

  // State variables
  bool _isLoading = false;
  bool _isCreating = false;
  bool _isLoadingDoctor = false;
  String _error = '';

  // Doctor data
  Doctor? _doctor;
  ClinicDoctorLinksResponse? _clinicDoctorLinks;
  String? _currentDoctorId;

  // Time slot data
  List<DateSpecificSlotResponse> _timeSlots = [];
  List<DateSpecificSlotResponse> _offlineSlots = [];
  List<DateSpecificSlotResponse> _onlineSlots = [];

  // Getters
  bool get isLoading => _isLoading;
  bool get isCreating => _isCreating;
  bool get isLoadingDoctor => _isLoadingDoctor;
  String get error => _error;
  Doctor? get doctor => _doctor;
  ClinicDoctorLinksResponse? get clinicDoctorLinks => _clinicDoctorLinks;
  DoctorInfo? get doctorInfo => _clinicDoctorLinks?.doctor;
  List<ClinicLink> get clinicLinks => _clinicDoctorLinks?.clinics ?? [];
  String? get currentDoctorId => _currentDoctorId;
  List<DateSpecificSlotResponse> get timeSlots => _timeSlots;
  List<DateSpecificSlotResponse> get offlineSlots => _offlineSlots;
  List<DateSpecificSlotResponse> get onlineSlots => _onlineSlots;

  // Load doctor details by ID (using new clinic doctor links API)
  Future<void> loadDoctorDetails(String doctorId) async {
    try {
      _isLoadingDoctor = true;
      _error = '';
      _currentDoctorId = doctorId;
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        _isLoadingDoctor = false;
        notifyListeners();
        return;
      }

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LOADING DOCTOR DETAILS WITH CLINIC LINKS                  ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');

      // Try new API first
      final clinicDoctorLinks = await _doctorRepository
          .getClinicDoctorLinksByDoctor(token, doctorId);

      if (clinicDoctorLinks != null) {
        _clinicDoctorLinks = clinicDoctorLinks;
        print('✅ Successfully loaded doctor details with clinic links');
        print(
          '   Name: ${clinicDoctorLinks.doctor.firstName} ${clinicDoctorLinks.doctor.lastName}',
        );
        print('   Specialization: ${clinicDoctorLinks.doctor.specialization}');
        print('   Email: ${clinicDoctorLinks.doctor.email}');
        print('   Total Clinics: ${clinicDoctorLinks.totalClinics}');
        print('');
      } else {
        // Fallback to legacy API
        print('⚠️ New API failed, trying legacy API...');
        final doctor = await _doctorRepository.getDoctorById(token, doctorId);

        if (doctor != null) {
          _doctor = doctor;
          print('✅ Successfully loaded doctor details (legacy API)');
          print(
            '   Name: ${doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}'}',
          );
          print('   Specialization: ${doctor.specialization}');
          print('   Email: ${doctor.email}');
          print('');
        } else {
          _error = 'Failed to load doctor details';
          print('❌ Failed to load doctor details from both APIs');
        }
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR LOADING DOCTOR DETAILS                              ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      _error = 'Error loading doctor details: $e';
    } finally {
      _isLoadingDoctor = false;
      notifyListeners();
    }
  }

  // Load time slots for a specific doctor and date
  Future<void> loadDoctorTimeSlots(
    String doctorId, {
    DateTime? selectedDate,
  }) async {
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
      final dateString = selectedDate != null
          ? '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}'
          : null;

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LOADING DOCTOR TIME SLOTS (DOCTOR DETAILS)                ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');
      print('🏥 Clinic ID: $clinicId');
      print('📅 Selected Date: ${dateString ?? "All dates"}');
      print('');

      // Load slots using new simplified API
      final offlineResponse = await _timeSlotRepository.listDateSpecificSlots(
        token: token,
        doctorId: doctorId,
        clinicId: clinicId,
        slotType: 'offline',
        date: dateString,
      );

      final onlineResponse = await _timeSlotRepository.listDateSpecificSlots(
        token: token,
        doctorId: doctorId,
        clinicId: clinicId,
        slotType: 'online',
        date: dateString,
      );

      // Process slots from response
      _timeSlots = [];
      _offlineSlots = [];
      _onlineSlots = [];

      if (offlineResponse != null && offlineResponse.slots.isNotEmpty) {
        _offlineSlots = offlineResponse.slots;
      }

      if (onlineResponse != null && onlineResponse.slots.isNotEmpty) {
        _onlineSlots = onlineResponse.slots;
      }

      _timeSlots = [..._offlineSlots, ..._onlineSlots];

      if (_timeSlots.isEmpty) {
        print('❌ No time slots found for this doctor');
        _error = 'No available time slots for this doctor';
      } else {
        print('✅ Loaded ${_timeSlots.length} time slots');
        print('   Offline: ${_offlineSlots.length}');
        print('   Online: ${_onlineSlots.length}');
        print('');
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN loadDoctorTimeSlots                               ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      _error = 'Error loading time slots: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Create date-specific time slots
  Future<CreateSlotsResponse?> createDateSpecificSlots(
    CreateDateSpecificSlotsInput input,
  ) async {
    try {
      _isCreating = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        _isCreating = false;
        notifyListeners();
        return null;
      }

      final response = await _timeSlotRepository.createDateSpecificSlots(
        token: token,
        input: input,
      );

      if (response != null) {
        print('✅ Date-specific time slots created successfully');
        print('   Created: ${response.totalCreated}');
        print('   Failed: ${response.totalFailed}');
        // Reload time slots for the doctor
        await loadDoctorTimeSlots(input.doctorId);
        return response;
      } else {
        _error = 'Failed to create time slots';
        return null;
      }
    } catch (e) {
      _error = 'Error creating time slots: $e';
      return null;
    } finally {
      _isCreating = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = '';
    notifyListeners();
  }

  // Load slots for a specific date (for checking existing slots)
  Future<ListSlotsResponse?> loadSlotsForDate({
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

      final response = await _timeSlotRepository.listDateSpecificSlots(
        token: token,
        doctorId: doctorId,
        clinicId: clinicId,
        slotType: slotType,
        date: date,
      );

      return response;
    } catch (e) {
      print('❌ Error loading slots for date: $e');
      return null;
    }
  }

  // Create session-based slots
  Future<CreateSessionSlotsResponse?> createSessionSlots(
    CreateSessionSlotsInput input,
  ) async {
    try {
      _isCreating = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        _isCreating = false;
        notifyListeners();
        return null;
      }

      final response = await _sessionSlotRepository.createSessionSlots(
        token: token,
        input: input,
      );

      if (response != null && response.success) {
        print('✅ Session-based slots created successfully');
        // Reload slots for the doctor
        await loadDoctorTimeSlots(input.doctorId);
        return response;
      } else {
        _error = 'Failed to create session slots';
        return null;
      }
    } catch (e) {
      _error = 'Error creating session slots: $e';
      return null;
    } finally {
      _isCreating = false;
      notifyListeners();
    }
  }

  // List session-based slots for a specific date
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
      print('❌ Error loading session slots for date: $e');
      return null;
    }
  }
}
