import 'package:flutter/material.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/appointment_model.dart';
import 'package:drandme/modules/clinic/models/appointment_history_model.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:drandme/modules/clinic/models/vitals_model.dart';
import 'package:drandme/modules/clinic/repositories/clinic_appointment_repository.dart';
import 'package:drandme/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:drandme/modules/clinic/repositories/vitals_repository.dart';
import 'package:drandme/core/config/service.dart';
import 'package:drandme/core/utils/loading_manager.dart';

class OperationResult {
  final bool success;
  final String? message;

  const OperationResult({required this.success, this.message});
}

class AppointmentDetailsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ClinicAppointmentRepository _repository;
  final ClinicPatientRepository _clinicPatientRepository;
  final VitalsRepository _vitalsRepository;

  AppointmentDetailsViewModel(
    AuthViewModel authViewModel, {
    ClinicAppointmentRepository? repository,
    ClinicPatientRepository? clinicPatientRepository,
    VitalsRepository? vitalsRepository,
  }) : _authViewModel = authViewModel,
       _repository = repository ?? ClinicAppointmentRepository(),
       _clinicPatientRepository =
           clinicPatientRepository ?? ClinicPatientRepository(ServiceRepo()),
       _vitalsRepository = vitalsRepository ?? VitalsRepository(ServiceRepo());

  AppointmentDetails? _appointmentDetails;
  ClinicPatient? _clinicPatient;
  VitalsRecord? _vitalsRecord;
  AppointmentHistoryResponse? _appointmentHistory;
  bool _isLoading = false;
  String? _errorMessage;
  bool _disposed = false;

  // UI state flags
  bool _isEditingPatientDetails = false;
  bool _isEditingBookingDetails = false;
  bool _isEditingVitalSigns = false;
  bool _isEditingStatus = false;
  bool _isVitalSignsExpanded = false;
  bool _isSavingPatient = false;
  bool _isSavingVitals = false;
  bool _isUpdatingStatus = false;
  String? _selectedStatusForUpdate;
  String? _lastOperationErrorMessage;

  // Fallback identifiers
  String? _initialClinicPatientId;

  // Booking detail controllers
  final TextEditingController _bookingAppointmentIdController =
      TextEditingController();
  final TextEditingController _bookingBookedOnController =
      TextEditingController();
  final TextEditingController _bookingDateController = TextEditingController();
  final TextEditingController _bookingTimeController = TextEditingController();
  final TextEditingController _bookingDoctorController =
      TextEditingController();
  final TextEditingController _bookingDepartmentController =
      TextEditingController();
  final TextEditingController _bookingReasonController =
      TextEditingController();
  final TextEditingController _bookingTypeController = TextEditingController();

  // Patient detail controllers
  final TextEditingController _patientFirstNameController =
      TextEditingController();
  final TextEditingController _patientLastNameController =
      TextEditingController();
  final TextEditingController _patientAgeController = TextEditingController();
  final TextEditingController _patientGenderController =
      TextEditingController();
  final TextEditingController _patientEmailController = TextEditingController();
  final TextEditingController _patientPhoneController = TextEditingController();
  final TextEditingController _patientAddressController =
      TextEditingController();
  final TextEditingController _patientBloodGroupController =
      TextEditingController();
  final TextEditingController _patientHeightController =
      TextEditingController();

  // Vital sign controllers
  final TextEditingController _vitalTemperatureController =
      TextEditingController();
  final TextEditingController _vitalPulseController = TextEditingController();
  final TextEditingController _vitalRespiratoryRateController =
      TextEditingController();
  final TextEditingController _vitalBloodPressureController =
      TextEditingController();
  final TextEditingController _vitalSpO2Controller = TextEditingController();
  final TextEditingController _vitalBloodSugarController =
      TextEditingController();
  final TextEditingController _vitalWeightController = TextEditingController();
  final TextEditingController _vitalSmokingController = TextEditingController();
  final TextEditingController _vitalAlcoholController = TextEditingController();
  final TextEditingController _vitalBMIController = TextEditingController();

  // Status change controller
  final TextEditingController _statusNotesController = TextEditingController();

  AuthViewModel get authViewModel => _authViewModel;
  AppointmentDetails? get appointmentDetails => _appointmentDetails;
  ClinicPatient? get clinicPatient => _clinicPatient;
  VitalsRecord? get vitalsRecord => _vitalsRecord;
  AppointmentHistoryResponse? get appointmentHistory => _appointmentHistory;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Editing and UI state getters
  bool get isEditingPatientDetails => _isEditingPatientDetails;
  bool get isEditingBookingDetails => _isEditingBookingDetails;
  bool get isEditingVitalSigns => _isEditingVitalSigns;
  bool get isEditingStatus => _isEditingStatus;
  bool get isVitalSignsExpanded => _isVitalSignsExpanded;
  bool get isSavingPatient => _isSavingPatient;
  bool get isSavingVitals => _isSavingVitals;
  bool get isUpdatingStatus => _isUpdatingStatus;
  String? get selectedStatusForUpdate => _selectedStatusForUpdate;

  // Controller getters
  TextEditingController get bookingAppointmentIdController =>
      _bookingAppointmentIdController;
  TextEditingController get bookingBookedOnController =>
      _bookingBookedOnController;
  TextEditingController get bookingDateController => _bookingDateController;
  TextEditingController get bookingTimeController => _bookingTimeController;
  TextEditingController get bookingDoctorController => _bookingDoctorController;
  TextEditingController get bookingDepartmentController =>
      _bookingDepartmentController;
  TextEditingController get bookingReasonController => _bookingReasonController;
  TextEditingController get bookingTypeController => _bookingTypeController;

  TextEditingController get patientFirstNameController =>
      _patientFirstNameController;
  TextEditingController get patientLastNameController =>
      _patientLastNameController;
  TextEditingController get patientAgeController => _patientAgeController;
  TextEditingController get patientGenderController => _patientGenderController;
  TextEditingController get patientEmailController => _patientEmailController;
  TextEditingController get patientPhoneController => _patientPhoneController;
  TextEditingController get patientAddressController =>
      _patientAddressController;
  TextEditingController get patientBloodGroupController =>
      _patientBloodGroupController;
  TextEditingController get patientHeightController => _patientHeightController;

  TextEditingController get vitalTemperatureController =>
      _vitalTemperatureController;
  TextEditingController get vitalPulseController => _vitalPulseController;
  TextEditingController get vitalRespiratoryRateController =>
      _vitalRespiratoryRateController;
  TextEditingController get vitalBloodPressureController =>
      _vitalBloodPressureController;
  TextEditingController get vitalSpO2Controller => _vitalSpO2Controller;
  TextEditingController get vitalBloodSugarController =>
      _vitalBloodSugarController;
  TextEditingController get vitalWeightController => _vitalWeightController;
  TextEditingController get vitalSmokingController => _vitalSmokingController;
  TextEditingController get vitalAlcoholController => _vitalAlcoholController;
  TextEditingController get vitalBMIController => _vitalBMIController;

  TextEditingController get statusNotesController => _statusNotesController;

  Future<void> initialize({
    String? appointmentId,
    String? clinicPatientId,
  }) async {
    _initialClinicPatientId = clinicPatientId;

    if (appointmentId != null && appointmentId.isNotEmpty) {
      await fetchAppointmentDetails(appointmentId);
    }

    if (_clinicPatient == null &&
        clinicPatientId != null &&
        clinicPatientId.isNotEmpty) {
      await fetchClinicPatient(clinicPatientId);
    }
  }

  Future<OperationResult> savePatientDetails() async {
    final patientId =
        _appointmentDetails?.clinicPatientId ??
        _clinicPatient?.id ??
        _initialClinicPatientId;
    if (patientId == null || patientId.isEmpty) {
      return const OperationResult(
        success: false,
        message: 'Patient ID not found. Cannot save changes.',
      );
    }

    final clinicId =
        _appointmentDetails?.clinic?.id ?? _clinicPatient?.clinicId;
    if (clinicId == null || clinicId.isEmpty) {
      return const OperationResult(
        success: false,
        message: 'Clinic ID not found. Cannot save changes.',
      );
    }

    _isSavingPatient = true;
    LoadingManager.show(message: 'Saving Patient Details...');
    _safeNotify();

    try {
      final updates = <String, dynamic>{};

      void addIfValid(String key, String? value) {
        if (value != null && value.isNotEmpty && value != 'N/A') {
          updates[key] = value;
        }
      }

      void addIntIfValid(String key, String? value) {
        if (value != null && value.isNotEmpty && value != 'N/A') {
          final intValue = int.tryParse(value);
          if (intValue != null) {
            updates[key] = intValue;
          }
        }
      }

      addIfValid('first_name', _patientFirstNameController.text);
      addIfValid('last_name', _patientLastNameController.text);
      addIntIfValid('age', _patientAgeController.text);
      addIfValid('gender', _patientGenderController.text);
      addIfValid('email', _patientEmailController.text);
      addIfValid('phone', _patientPhoneController.text);

      final address = _patientAddressController.text;
      if (address.isNotEmpty && address != 'N/A') {
        final addressParts = address
            .split(',')
            .map((part) => part.trim())
            .toList();
        if (addressParts.isNotEmpty) {
          updates['address1'] = addressParts[0];
        }
        if (addressParts.length >= 2) {
          updates['address2'] = addressParts[1];
        }
        if (addressParts.length >= 3) {
          updates['district'] = addressParts[2];
        }
        if (addressParts.length >= 4) {
          updates['state'] = addressParts[3];
        }
      }

      addIfValid('blood_group', _patientBloodGroupController.text);
      addIntIfValid('height_cm', _patientHeightController.text);

      if (updates.isEmpty) {
        return const OperationResult(
          success: false,
          message: 'No changes to save.',
        );
      }

      final success = await updateClinicPatient(
        patientId: patientId,
        updates: updates,
        clinicId: clinicId,
      );

      if (success) {
        _lastOperationErrorMessage = null;
        _isEditingPatientDetails = false;
        _refreshControllers();
        return const OperationResult(
          success: true,
          message: 'Patient details updated successfully',
        );
      }

      final message =
          _lastOperationErrorMessage ?? 'Failed to update patient details';
      _lastOperationErrorMessage = null;
      return OperationResult(success: false, message: message);
    } catch (e) {
      final errorMessage = 'Error saving patient details: $e';
      _lastOperationErrorMessage = errorMessage;
      return OperationResult(success: false, message: errorMessage);
    } finally {
      _isSavingPatient = false;
      LoadingManager.hide();
      _safeNotify();
    }
  }

  // ========================
  // FETCH APPOINTMENT DETAILS
  // ========================
  Future<void> fetchAppointmentDetails(
    String appointmentId, {
    bool silent = false,
  }) async {
    if (_disposed) return;

    if (!silent) _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
      return;
    }

    try {
      final result = await _repository
          .getAppointmentDetails(token, appointmentId)
          .timeout(const Duration(seconds: 15));

      if (result != null) {
        _appointmentDetails = result;
        _errorMessage = null;
        _refreshControllers();
        await _loadDependentData();
      } else {
        _setError('Unable to load appointment details');
      }
    } catch (e) {
      _setError('Failed to fetch appointment: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ========================
  // FETCH CLINIC PATIENT
  // ========================
  Future<void> fetchClinicPatient(
    String patientId, {
    String? clinicId,
    String? doctorId,
    String? departmentId,
  }) async {
    if (_disposed) return;
    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) return;

    try {
      final result = await _clinicPatientRepository
          .getPatient(
            token: token,
            patientId: patientId,
            clinicId: clinicId,
            doctorId: doctorId,
            departmentId: departmentId,
          )
          .timeout(const Duration(seconds: 10));

      if (result != null) {
        _clinicPatient = result;
        _refreshControllers();
      }
    } catch (_) {
      // Silently ignore patient fetch errors (non-critical)
    } finally {
      _safeNotify();
    }
  }

  // ========================
  // FETCH VITALS FOR APPOINTMENT
  // ========================
  Future<void> fetchVitalsForAppointment({
    String? vitalsId,
    String? appointmentId,
    String? clinicPatientId,
    String? clinicId,
  }) async {
    if (_disposed) return;

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) return;
    if (clinicPatientId == null || clinicPatientId.isEmpty) return;

    try {
      print('🔍 ViewModel: Fetching vitals for patient $clinicPatientId');
      if (appointmentId != null)
        print('   Filtering for Appointment ID: $appointmentId');

      // If we have a specific vitals ID, fetch it directly
      if (vitalsId != null && vitalsId.isNotEmpty) {
        print('   Fetching specific vitals record ID: $vitalsId');
        final vitals = await _vitalsRepository.getVitalsById(
          token: token,
          vitalsId: vitalsId,
          clinicPatientId: clinicPatientId,
          clinicId: clinicId,
        );

        if (vitals != null) {
          _vitalsRecord = vitals;
          print('   ✅ Specific vitals record found and loaded');
          _refreshControllers();
          _safeNotify();
          return;
        }
        print('   ⚠️ Specific vitals record not found');
      }

      // Otherwise, fetch vitals history and find the one matching this appointment
      final history = await _vitalsRepository.getVitalsHistory(
        token: token,
        clinicPatientId: clinicPatientId,
        clinicId: clinicId,
        limit: 50,
      );

      if (history != null && history.vitals.isNotEmpty) {
        print('   ✅ Fetched ${history.vitals.length} vitals from history');
        // If appointmentId provided, find vitals for this appointment
        if (appointmentId != null && appointmentId.isNotEmpty) {
          final appointmentVitals = history.vitals.firstWhere(
            (v) => v.appointmentId == appointmentId,
            orElse: () => history.vitals.first, // Fallback to most recent
          );

          if (appointmentVitals.appointmentId == appointmentId) {
            print('   ✅ Matching vitals found for this appointment');
          } else {
            print(
              '   ℹ️ No specific match for appointment $appointmentId, using latest record',
            );
          }

          _vitalsRecord = appointmentVitals;
        } else {
          // No appointment ID, use most recent vitals
          print('   ℹ️ No appointment ID provided, using latest record');
          _vitalsRecord = history.vitals.first;
        }
        _refreshControllers();
        _safeNotify();
      } else {
        print('   ℹ️ No vitals history found for this patient');
      }
    } catch (e) {
      print('❌ ViewModel: Error fetching vitals: $e');
      // Silently ignore vitals fetch errors (non-critical)
    }
  }

  // ========================
  // FETCH APPOINTMENT HISTORY
  // ========================
  Future<void> fetchAppointmentHistory({
    required String clinicPatientId,
    String? clinicId,
    int limit = 50,
  }) async {
    if (_disposed) return;

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) return;

    try {
      final history = await _repository.getAppointmentHistory(
        token: token,
        clinicPatientId: clinicPatientId,
        clinicId: clinicId,
        limit: limit,
      );

      if (history != null) {
        _appointmentHistory = history;
        _safeNotify();
      }
    } catch (e) {
      print('⚠️ Error fetching appointment history: $e');
      // Silently ignore appointment history fetch errors (non-critical)
    }
  }

  // ========================
  // RESCHEDULE APPOINTMENT
  // ========================
  Future<bool> rescheduleAppointment(
    String appointmentId,
    Map<String, dynamic> newDetails,
  ) async {
    if (_disposed) return false;

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _lastOperationErrorMessage = 'Authentication required';
      return false;
    }

    try {
      final updated = await _repository.updateAppointment(
        appointmentId: appointmentId,
        token: token,
        appointmentDate: newDetails['appointmentDate'],
        appointmentTime: newDetails['appointmentTime'],
        reasonForVisit: newDetails['reasonForVisit'],
        notes: newDetails['notes'],
      );

      if (updated != null) {
        await fetchAppointmentDetails(appointmentId);
        return true;
      }

      _setError('Failed to reschedule appointment.');
      return false;
    } catch (e) {
      _setError('Error rescheduling appointment: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // ========================
  // UPDATE APPOINTMENT STATUS
  // ========================
  Future<bool> updateAppointmentStatus({
    required String appointmentId,
    required String clinicPatientId,
    required String status,
    String? notes,
    String? clinicId,
  }) async {
    if (_disposed) return false;

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _lastOperationErrorMessage = 'Authentication required';
      return false;
    }

    try {
      final response = await _repository.updateAppointmentStatus(
        token: token,
        appointmentId: appointmentId,
        clinicPatientId: clinicPatientId,
        status: status,
        notes: notes,
        clinicId: clinicId,
      );

      if (response != null) {
        // Check if response contains an error
        if (response.containsKey('error')) {
          final errorMsg = response['error']?.toString() ?? 'Unknown error';
          final details = response['details']?.toString();
          final fullError = details != null && details.isNotEmpty
              ? '$errorMsg: $details'
              : errorMsg;
          _setError(fullError);
          return false;
        }

        // Check for success response (either explicit success flag or returned object with ID)
        if ((response.containsKey('success') && response['success'] == true) ||
            (response.containsKey('id') && response.containsKey('status'))) {
          // Refresh appointment details to get updated status
          await fetchAppointmentDetails(appointmentId, silent: true);
          _errorMessage = null;
          _safeNotify();
          return true;
        }
      }

      // If response is null or doesn't have expected structure
      final errorMsg =
          response?['error']?.toString() ??
          response?['message']?.toString() ??
          'Failed to update appointment status';
      _setError(errorMsg);
      return false;
    } catch (e) {
      _setError('Error updating appointment status: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Get allowed status transitions for the current appointment
  List<String> getAllowedStatuses(String currentStatus) {
    const transitions = {
      'confirmed': ['pending', 'completed', 'cancelled', 'no_show', 'arrived'],
      'pending': ['confirmed', 'completed', 'cancelled', 'no_show', 'arrived'],
      'arrived': ['in_consultation', 'completed', 'cancelled', 'no_show'],
      'in_consultation': ['completed', 'cancelled', 'no_show'],
      'completed': <String>[],
      'cancelled': <String>[],
      'no_show': <String>[],
    };
    final allowedStatuses = transitions[currentStatus.toLowerCase()] ?? [];
    // Remove 'cancelled' from dropdown options - cancellation should be done via cancel button
    return allowedStatuses.where((status) => status != 'cancelled').toList();
  }

  // ========================
  // CANCEL APPOINTMENT
  // ========================
  Future<Map<String, dynamic>?> cancelAppointment({
    required String appointmentId,
    String? reason,
    String? notes,
  }) async {
    if (_disposed) return null;

    _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
      return null;
    }

    try {
      final response = await _repository.cancelAppointment(
        token: token,
        appointmentId: appointmentId,
        reason: reason,
        notes: notes,
      );

      if (response != null) {
        // Refresh appointment details after cancellation
        await fetchAppointmentDetails(appointmentId);
        _errorMessage = null;
        _safeNotify();
        return response;
      }

      _setError('Failed to cancel appointment.');
      return null;
    } catch (e) {
      _setError('Error cancelling appointment: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  // ========================
  // UPDATE CLINIC PATIENT
  // ========================
  Future<bool> updateClinicPatient({
    required String patientId,
    required Map<String, dynamic> updates,
    String? clinicId,
  }) async {
    if (_disposed) return false;

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _lastOperationErrorMessage = 'Authentication required';
      return false;
    }

    try {
      print('🔄 ViewModel: Updating patient...');
      print('   Patient ID: $patientId');
      print('   Clinic ID: $clinicId');
      print('   Updates: ${updates.toString()}');
      print('');

      final updatedPatient = await _clinicPatientRepository.updatePatient(
        token: token,
        patientId: patientId,
        updates: updates,
        clinicId: clinicId,
      );

      if (updatedPatient != null) {
        print('✅ ViewModel: Patient update successful');
        print('📋 Updated Patient Info:');
        print('   ID: ${updatedPatient.id}');
        print('   Full Name: ${updatedPatient.fullName}');
        print('   First Name: ${updatedPatient.firstName}');
        print('   Last Name: ${updatedPatient.lastName}');
        print('   Phone: ${updatedPatient.phone}');
        print('   Email: ${updatedPatient.email ?? 'N/A'}');
        print('   Age: ${updatedPatient.age ?? 'N/A'}');
        print('   Gender: ${updatedPatient.gender ?? 'N/A'}');
        print('   Blood Group: ${updatedPatient.bloodGroup ?? 'N/A'}');
        print('   Height: ${updatedPatient.heightCm ?? 'N/A'} cm');
        print('   Smoking: ${updatedPatient.smokingStatus ?? 'N/A'}');
        print('   Alcohol: ${updatedPatient.alcoholUse ?? 'N/A'}');
        print('   Address: ${updatedPatient.address1 ?? 'N/A'}');
        if (updatedPatient.address2 != null) {
          print('   Address2: ${updatedPatient.address2}');
        }
        if (updatedPatient.district != null) {
          print('   District: ${updatedPatient.district}');
        }
        if (updatedPatient.state != null) {
          print('   State: ${updatedPatient.state}');
        }
        print('   Clinic ID: ${updatedPatient.clinicId}');
        print('');

        _clinicPatient = updatedPatient;
        _lastOperationErrorMessage = null;
        _refreshControllers();
        _safeNotify();
        return true;
      }

      print('❌ ViewModel: Failed to update patient - response is null');
      print('');
      _lastOperationErrorMessage = 'Failed to update patient';
      return false;
    } catch (e) {
      print('❌ ViewModel: Error updating patient: $e');
      print('');
      _lastOperationErrorMessage = 'Error updating patient: $e';
      return false;
    }
  }

  // ========================
  // CREATE/UPDATE VITALS
  // ========================
  Future<bool> saveVitals({
    required String clinicPatientId,
    required Map<String, dynamic> vitalsData,
    String? appointmentId,
    String? clinicId,
    String? vitalsRecordId, // For update operations
  }) async {
    if (_disposed) return false;

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _lastOperationErrorMessage = 'Authentication required';
      return false;
    }

    // Get user ID for recorded_by (required for create/update)
    final userId = _authViewModel.user?.id;
    if (userId == null || userId.isEmpty) {
      _lastOperationErrorMessage = 'User ID not found';
      return false;
    }

    if (appointmentId == null || appointmentId.isEmpty) {
      _lastOperationErrorMessage = 'Appointment ID required for vitals';
      return false;
    }

    try {
      print('🔄 ViewModel: Saving vitals...');
      print('   Patient ID: $clinicPatientId');
      print('   Appointment ID: $appointmentId');
      print('   Clinic ID: $clinicId');
      print('   Vitals Data: ${vitalsData.toString()}');
      print('');

      // Parse blood pressure - handle both combined string and separate values
      int? systolicBp;
      int? diastolicBp;
      String? bloodPressureString;

      // Option 1: Check if blood_pressure string is provided directly
      if (vitalsData['blood_pressure'] != null) {
        final bp = vitalsData['blood_pressure'].toString().trim();
        if (bp.isNotEmpty && bp.length <= 20) {
          bloodPressureString = bp;
          // Also parse it to extract systolic/diastolic if in "120/80" format
          if (bp.contains('/')) {
            final parts = bp.split('/');
            if (parts.length == 2) {
              systolicBp = int.tryParse(parts[0].trim());
              diastolicBp = int.tryParse(parts[1].trim());
            }
          }
        }
      }

      // Option 2: Check if separate systolic/diastolic values are provided
      // These can override parsed values from blood_pressure string
      if (vitalsData['systolic_bp'] != null) {
        final parsed = _parseInt(vitalsData['systolic_bp']);
        if (parsed != null && parsed >= 50 && parsed <= 300) {
          systolicBp = parsed;
        }
      }
      if (vitalsData['diastolic_bp'] != null) {
        final parsed = _parseInt(vitalsData['diastolic_bp']);
        if (parsed != null && parsed >= 30 && parsed <= 200) {
          diastolicBp = parsed;
        }
      }

      // Validate systolic > diastolic if both are provided
      if (systolicBp != null &&
          diastolicBp != null &&
          systolicBp <= diastolicBp) {
        print('⚠️ Warning: Systolic BP must be higher than Diastolic BP');
        systolicBp = null;
        diastolicBp = null;
      }

      // Generate blood_pressure string from separate values if not already provided
      if (bloodPressureString == null || bloodPressureString.isEmpty) {
        if (systolicBp != null && diastolicBp != null) {
          bloodPressureString = '$systolicBp/$diastolicBp';
        } else if (systolicBp != null) {
          bloodPressureString = systolicBp.toString();
        } else if (diastolicBp != null) {
          bloodPressureString = diastolicBp.toString();
        }
      }

      if (bloodPressureString != null && bloodPressureString.length > 20) {
        bloodPressureString = bloodPressureString.substring(0, 20);
      }

      final temperature = _parseDouble(vitalsData['temperature']);
      final pulseRate = _parseInt(vitalsData['pulse']);
      final respBpm = _parseInt(vitalsData['respiratory_rate']);
      final spo2Percent = _parseInt(vitalsData['spo2']);
      final sugarMgdl = _parseDouble(vitalsData['blood_sugar']);
      final weightKg = _parseDouble(vitalsData['weight']);

      final smokingValue = vitalsData['smoking_status'] as String?;
      final alcoholValue = vitalsData['alcohol_use'] as String?;

      if (vitalsRecordId != null && vitalsRecordId.isNotEmpty) {
        final updateRequest = UpdateVitalsRequest(
          id: vitalsRecordId,
          appointmentId: appointmentId,
          recordedBy: userId,
          clinicPatientId: clinicPatientId,
          clinicId: clinicId,
          systolicBp: systolicBp,
          diastolicBp: diastolicBp,
          bloodPressure: bloodPressureString,
          temperature: temperature,
          pulseRate: pulseRate,
          respBpm: respBpm,
          spo2Percent: spo2Percent,
          sugarMgdl: sugarMgdl,
          weightKg: weightKg,
          heightCm: _parseInt(vitalsData['height_cm']),
          bmi: _parseDouble(vitalsData['bmi']),
          notes: vitalsData['notes'] as String?,
          smokingStatus: smokingValue,
          alcoholUse: alcoholValue,
        );

        final success = await _vitalsRepository.updateVitals(
          token: token,
          vitalsId: vitalsRecordId,
          request: updateRequest,
        );

        if (success) {
          print('✅ ViewModel: Vitals updated successfully');
          print('🔄 ViewModel: Refreshing vitals from server...');
          print('');

          // Always re-fetch the full history from GET /vitals/clinic-patient/:id
          // so the UI reflects the exact server state (same as after a page refresh)
          await _refreshVitalsFromServer(
            token: token,
            clinicPatientId: clinicPatientId,
            appointmentId: appointmentId,
            clinicId: clinicId,
          );

          _lastOperationErrorMessage = null;
          _safeNotify();
          return true;
        }

        _lastOperationErrorMessage = 'Failed to update vitals';
        return false;
      } else {
        // Create new vitals record
        final createRequest = CreateVitalsRequest(
          appointmentId: appointmentId,
          recordedBy: userId,
          clinicPatientId: clinicPatientId,
          clinicId: clinicId,
          systolicBp: systolicBp,
          diastolicBp: diastolicBp,
          bloodPressure: bloodPressureString,
          temperature: temperature,
          pulseRate: pulseRate,
          respBpm: respBpm,
          spo2Percent: spo2Percent,
          sugarMgdl: sugarMgdl,
          weightKg: weightKg,
          heightCm: _parseInt(vitalsData['height_cm']),
          bmi: _parseDouble(vitalsData['bmi']),
          notes: vitalsData['notes'] as String?,
          smokingStatus: smokingValue,
          alcoholUse: alcoholValue,
        );

        final vitalsRecord = await _vitalsRepository.createVitals(
          token: token,
          request: createRequest,
        );

        if (vitalsRecord != null) {
          print('✅ ViewModel: Vitals created successfully');
          print('   Vitals ID: ${vitalsRecord.id}');
          print('🔄 ViewModel: Refreshing vitals from server...');
          print('');

          // Always re-fetch the full history from GET /vitals/clinic-patient/:id
          // so the UI reflects the exact server state (same as after a page refresh)
          await _refreshVitalsFromServer(
            token: token,
            clinicPatientId: clinicPatientId,
            appointmentId: appointmentId,
            clinicId: clinicId,
          );

          _lastOperationErrorMessage = null;
          _safeNotify();
          return true;
        }

        _lastOperationErrorMessage = 'Failed to create vitals';
        return false;
      }
    } catch (e) {
      print('❌ ViewModel: Error saving vitals: $e');
      print('');
      _lastOperationErrorMessage = 'Error saving vitals: $e';
      return false;
    }
  }

  Future<OperationResult> saveVitalSigns() async {
    final patientId =
        _appointmentDetails?.clinicPatientId ?? _initialClinicPatientId;

    if (patientId == null || patientId.isEmpty) {
      print('❌ ViewModel: Cannot save vitals - Patient ID not found');
      return const OperationResult(
        success: false,
        message: 'Patient ID not found. Cannot save vital signs.',
      );
    }

    final clinicId =
        _appointmentDetails?.clinic?.id ??
        _appointmentDetails
            ?.clinicId; // Attempt to get from details or fallback
    final appointmentId = _appointmentDetails?.id;

    _isSavingVitals = true;
    LoadingManager.show(message: 'Saving Vital Signs...');
    _safeNotify();

    try {
      final vitalsData = <String, dynamic>{};

      String _controllerValue(TextEditingController controller) {
        final text = controller.text.trim();
        return text.isEmpty ? '' : text;
      }

      final temperatureText = _controllerValue(_vitalTemperatureController);
      final pulseText = _controllerValue(_vitalPulseController);
      final respiratoryRate = _controllerValue(_vitalRespiratoryRateController);
      final bloodPressure = _controllerValue(_vitalBloodPressureController);
      final spo2 = _controllerValue(_vitalSpO2Controller);
      final bloodSugar = _controllerValue(_vitalBloodSugarController);
      final weightText = _controllerValue(_vitalWeightController);

      if (temperatureText.isNotEmpty) {
        vitalsData['temperature'] = temperatureText;
      }
      if (pulseText.isNotEmpty) {
        vitalsData['pulse'] = pulseText;
      }
      if (respiratoryRate.isNotEmpty) {
        vitalsData['respiratory_rate'] = respiratoryRate;
      }
      if (bloodPressure.isNotEmpty) {
        vitalsData['blood_pressure'] = bloodPressure;
      }
      if (spo2.isNotEmpty) {
        vitalsData['spo2'] = spo2;
      }
      if (bloodSugar.isNotEmpty) {
        vitalsData['blood_sugar'] = bloodSugar;
      }
      if (weightText.isNotEmpty) {
        vitalsData['weight'] = weightText;
      }

      final smokingValue = _normalizeOptionalText(_vitalSmokingController.text);
      if (smokingValue != null) {
        vitalsData['smoking_status'] = smokingValue;
      }

      final alcoholValue = _normalizeOptionalText(_vitalAlcoholController.text);
      if (alcoholValue != null) {
        vitalsData['alcohol_use'] = alcoholValue;
      }

      final bmiText = _controllerValue(_vitalBMIController);
      if (bmiText.isNotEmpty) {
        vitalsData['bmi'] = bmiText;
      }

      final heightText = _controllerValue(_patientHeightController);
      if (heightText.isNotEmpty) {
        vitalsData['height_cm'] = heightText;
      }

      if (vitalsData.isEmpty) {
        return const OperationResult(
          success: false,
          message: 'No vital signs data to save.',
        );
      }
      final success = await saveVitals(
        clinicPatientId: patientId,
        vitalsData: vitalsData,
        appointmentId: appointmentId,
        clinicId: clinicId,
        vitalsRecordId: _vitalsRecord?.id,
      );

      if (success) {
        _lastOperationErrorMessage = null;
        _isEditingVitalSigns = false;
        _refreshControllers();
        return const OperationResult(
          success: true,
          message: 'Vital signs saved successfully',
        );
      }

      final message =
          _lastOperationErrorMessage ?? 'Failed to save vital signs';
      _lastOperationErrorMessage = null;
      return OperationResult(success: false, message: message);
    } finally {
      _isSavingVitals = false;
      LoadingManager.hide();
      _safeNotify();
    }
  }

  // ========================
  // REFRESH VITALS FROM SERVER
  // ========================
  /// Calls GET /vitals/clinic-patient/:patient_id?limit=50
  /// This is the canonical refresh used after every create/update so the UI
  /// always shows the real server state (consistent with a manual page refresh).
  Future<void> _refreshVitalsFromServer({
    required String token,
    required String clinicPatientId,
    String? appointmentId,
    String? clinicId,
  }) async {
    try {
      print(
        '🔄 _refreshVitalsFromServer: calling GET /vitals/clinic-patient/$clinicPatientId?limit=50',
      );
      final history = await _vitalsRepository.getVitalsHistory(
        token: token,
        clinicPatientId: clinicPatientId,
        clinicId: clinicId,
        limit: 50,
      );

      if (history != null && history.vitals.isNotEmpty) {
        print('   ✅ Got ${history.vitals.length} record(s) from server');

        if (appointmentId != null && appointmentId.isNotEmpty) {
          final match = history.vitals.firstWhere(
            (v) => v.appointmentId == appointmentId,
            orElse: () => history.vitals.first,
          );
          _vitalsRecord = match;
          print('   ✅ Using vitals for appointment $appointmentId');
        } else {
          _vitalsRecord = history.vitals.first;
          print('   ✅ Using most recent vitals record');
        }

        _refreshControllers();
      } else {
        print('   ℹ️ No vitals found in history after save');
      }
    } catch (e) {
      print('   ⚠️ _refreshVitalsFromServer error: $e');
      // Non-fatal — the save itself was successful
    }
  }

  // Helper methods for parsing
  int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) {
      final cleaned = value.replaceAll(RegExp(r'[^\d.]'), '');
      return int.tryParse(cleaned);
    }
    return null;
  }

  double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final cleaned = value.replaceAll(RegExp(r'[^\d.]'), '');
      return double.tryParse(cleaned);
    }
    return null;
  }

  String? _normalizeOptionalText(String? raw, {int maxLength = 20}) {
    final trimmed = raw?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    return trimmed.length <= maxLength
        ? trimmed
        : trimmed.substring(0, maxLength);
  }

  void _refreshControllers() {
    final appointment = _appointmentDetails;
    if (appointment == null) return;

    String _formatDate(String? dateTime) {
      if (dateTime == null) return 'N/A';
      try {
        final cleanDateTime = dateTime.split(' ')[0];
        final date = DateTime.parse(cleanDateTime);
        return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
      } catch (_) {
        return dateTime;
      }
    }

    String _formatTime(String? dateTime) {
      if (dateTime == null) return 'N/A';
      try {
        final parts = dateTime.split(' ');
        if (parts.length > 1) {
          final timeParts = parts[1].split(':');
          if (timeParts.length >= 2) {
            int hour = int.parse(timeParts[0]);
            int minute = int.parse(timeParts[1]);
            final period = hour >= 12 ? 'PM' : 'AM';
            hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
            return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
          }
        }
        final date = DateTime.parse(dateTime);
        final hour = date.hour > 12
            ? date.hour - 12
            : (date.hour == 0 ? 12 : date.hour);
        final period = date.hour >= 12 ? 'PM' : 'AM';
        return '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $period';
      } catch (_) {
        return dateTime;
      }
    }

    _bookingAppointmentIdController.text =
        appointment.displayToken ?? appointment.tokenNumber?.toString() ?? 'N/A';
    _bookingBookedOnController.text = _formatDate(appointment.createdAt);
    _bookingDateController.text = _formatDate(appointment.appointmentDateTime);
    _bookingTimeController.text = _formatTime(appointment.appointmentDateTime);
    _bookingDoctorController.text = formatDoctorName(
      appointment.doctorName ?? appointment.doctor?.name ?? 'N/A',
    );
    _bookingDepartmentController.text = appointment.department ?? 'N/A';
    _bookingReasonController.text = appointment.notes ?? 'N/A';
    _bookingTypeController.text = formatConsultationType(
      appointment.consultationType ?? 'N/A',
    );

    final clinicPatient = _clinicPatient;
    if (clinicPatient != null) {
      _patientFirstNameController.text = clinicPatient.firstName;
      _patientLastNameController.text = clinicPatient.lastName;
      _patientAgeController.text = clinicPatient.age?.toString() ?? 'N/A';
      _patientGenderController.text = clinicPatient.gender ?? 'N/A';
      _patientEmailController.text = clinicPatient.email ?? 'N/A';
      _patientPhoneController.text = clinicPatient.phone;
      final addressParts = <String>[
        if ((clinicPatient.address1 ?? '').isNotEmpty) clinicPatient.address1!,
        if ((clinicPatient.address2 ?? '').isNotEmpty) clinicPatient.address2!,
        if ((clinicPatient.district ?? '').isNotEmpty) clinicPatient.district!,
        if ((clinicPatient.state ?? '').isNotEmpty) clinicPatient.state!,
      ];
      _patientAddressController.text = addressParts.isEmpty
          ? 'N/A'
          : addressParts.join(', ');
      _patientBloodGroupController.text = clinicPatient.bloodGroup ?? 'N/A';
      _patientHeightController.text =
          clinicPatient.heightCm?.toString() ?? 'N/A';
    } else {
      final patient = appointment.patient;
      final patientName = appointment.patientName ?? patient?.name ?? '';
      final nameParts = patientName.split(' ');
      _patientFirstNameController.text = nameParts.isNotEmpty
          ? nameParts.first
          : 'N/A';
      _patientLastNameController.text = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : 'N/A';
      _patientAgeController.text = patient?.age?.toString() ?? 'N/A';
      _patientGenderController.text = patient?.gender ?? 'N/A';
      _patientEmailController.text = patient?.email ?? 'N/A';
      _patientPhoneController.text = patient?.phone ?? 'N/A';
      _patientAddressController.text = 'N/A';
      _patientBloodGroupController.text = 'N/A';
      _patientHeightController.text = 'N/A';
    }

    final vitalsRecord = _vitalsRecord;
    if (vitalsRecord != null) {
      _vitalTemperatureController.text =
          vitalsRecord.temperature?.toString() ?? '';
      _vitalPulseController.text = vitalsRecord.pulseRate?.toString() ?? '';
      _vitalRespiratoryRateController.text =
          vitalsRecord.respBpm?.toString() ?? '';
      if (vitalsRecord.bloodPressure != null &&
          vitalsRecord.bloodPressure!.isNotEmpty) {
        _vitalBloodPressureController.text = vitalsRecord.bloodPressure!;
      } else if (vitalsRecord.systolicBp != null ||
          vitalsRecord.diastolicBp != null) {
        final systolic = vitalsRecord.systolicBp?.toString() ?? '';
        final diastolic = vitalsRecord.diastolicBp?.toString() ?? '';
        if (systolic.isNotEmpty && diastolic.isNotEmpty) {
          _vitalBloodPressureController.text = '$systolic/$diastolic';
        } else if (systolic.isNotEmpty) {
          _vitalBloodPressureController.text = systolic;
        } else if (diastolic.isNotEmpty) {
          _vitalBloodPressureController.text = diastolic;
        } else {
          _vitalBloodPressureController.text = '';
        }
      } else {
        _vitalBloodPressureController.text = '';
      }
      _vitalSpO2Controller.text = vitalsRecord.spo2Percent?.toString() ?? '';
      _vitalBloodSugarController.text =
          vitalsRecord.sugarMgdl?.toString() ?? '';
      _vitalWeightController.text = vitalsRecord.weightKg?.toString() ?? '';
      _vitalSmokingController.text = vitalsRecord.smokingStatus ?? '';
      _vitalAlcoholController.text = vitalsRecord.alcoholUse ?? '';
      _vitalBMIController.text = vitalsRecord.bmi?.toString() ?? '';
    } else {
      _vitalTemperatureController.text = '';
      _vitalPulseController.text = '';
      _vitalRespiratoryRateController.text = '';
      _vitalBloodPressureController.text = '';
      _vitalSpO2Controller.text = '';
      _vitalBloodSugarController.text = '';
      _vitalWeightController.text = '';
      _vitalSmokingController.text = '';
      _vitalAlcoholController.text = '';
      _vitalBMIController.text = '';
    }
  }

  String formatConsultationType(String? consultationType) {
    if (consultationType == null ||
        consultationType.isEmpty ||
        consultationType == 'N/A') {
      return 'N/A';
    }
    return consultationType.replaceAll('_', ' ');
  }

  void toggleBookingEditing() {
    _isEditingBookingDetails = !_isEditingBookingDetails;
    if (_isEditingBookingDetails) {
      _refreshControllers();
    }
    _safeNotify();
  }

  void exitBookingEditing() {
    if (_isEditingBookingDetails) {
      _isEditingBookingDetails = false;
      _refreshControllers();
      _safeNotify();
    }
  }

  void togglePatientEditing() {
    _isEditingPatientDetails = !_isEditingPatientDetails;
    if (_isEditingPatientDetails) {
      _refreshControllers();
    }
    _safeNotify();
  }

  void exitPatientEditing() {
    if (_isEditingPatientDetails) {
      _isEditingPatientDetails = false;
      _refreshControllers();
      _safeNotify();
    }
  }

  void toggleVitalSignsEditing() {
    _isEditingVitalSigns = !_isEditingVitalSigns;
    if (_isEditingVitalSigns) {
      _refreshControllers();
    }
    _safeNotify();
  }

  void exitVitalSignsEditing() {
    if (_isEditingVitalSigns) {
      _isEditingVitalSigns = false;
      _refreshControllers();
      _safeNotify();
    }
  }

  void toggleVitalSignsExpansion() {
    _isVitalSignsExpanded = !_isVitalSignsExpanded;
    _safeNotify();
  }

  void toggleStatusEditing() {
    _isEditingStatus = !_isEditingStatus;
    if (!_isEditingStatus) {
      _selectedStatusForUpdate = null;
      _statusNotesController.clear();
    }
    _safeNotify();
  }

  String formatStatusLabel(String status) {
    return status
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  Future<OperationResult> changeStatus(String status) async {
    final appointmentId = _appointmentDetails?.id;
    if (appointmentId == null || appointmentId.isEmpty) {
      return const OperationResult(
        success: false,
        message: 'Appointment ID not found.',
      );
    }

    final clinicPatientId =
        _appointmentDetails?.clinicPatientId ??
        _clinicPatient?.id ??
        _initialClinicPatientId;
    if (clinicPatientId == null || clinicPatientId.isEmpty) {
      return const OperationResult(
        success: false,
        message: 'Patient ID not found.',
      );
    }

    _isUpdatingStatus = true;
    _selectedStatusForUpdate = status;
    _safeNotify();

    final success = await updateAppointmentStatus(
      appointmentId: appointmentId,
      clinicPatientId: clinicPatientId,
      status: status,
      clinicId: _appointmentDetails?.clinic?.id,
      notes: null,
    );

    _isUpdatingStatus = false;
    if (success) {
      _isEditingStatus = false;
      _selectedStatusForUpdate = null;
      _refreshControllers();
      _safeNotify();
      return OperationResult(
        success: true,
        message: 'Status updated to ${formatStatusLabel(status)}',
      );
    }

    _selectedStatusForUpdate = null;
    _safeNotify();
    return OperationResult(
      success: false,
      message: _errorMessage ?? 'Failed to update status',
    );
  }

  Future<void> _loadDependentData() async {
    if (_appointmentDetails == null) return;

    final clinicPatientId =
        _appointmentDetails?.clinicPatientId ?? _initialClinicPatientId;
    if (clinicPatientId == null || clinicPatientId.isEmpty) return;

    final clinicId = _appointmentDetails?.clinic?.id;
    final doctorId = _appointmentDetails?.doctor?.id;
    if (_clinicPatient == null) {
      await fetchClinicPatient(
        clinicPatientId,
        clinicId: clinicId,
        doctorId: doctorId,
      );
    }

    if (_vitalsRecord == null) {
      await fetchVitalsForAppointment(
        appointmentId: _appointmentDetails?.id,
        clinicPatientId: clinicPatientId,
        clinicId: clinicId,
      );
    }

    if (_appointmentHistory == null) {
      await fetchAppointmentHistory(
        clinicPatientId: clinicPatientId,
        clinicId: clinicId,
        limit: 50,
      );
    }
  }

  String formatDoctorName(String? doctorName) {
    if (doctorName == null || doctorName.isEmpty || doctorName == 'N/A') {
      return 'N/A';
    }
    final trimmedName = doctorName.trim();
    if (trimmedName.toLowerCase().startsWith('dr.')) {
      return doctorName;
    }
    return 'Dr. $trimmedName';
  }

  // ========================
  // INTERNAL HELPERS
  // ========================
  void _setLoading(bool value) {
    if (_disposed) return;
    _isLoading = value;
    if (value) {
      LoadingManager.show();
    } else {
      LoadingManager.hide();
    }
    _safeNotify();
  }

  void _setError(String message) {
    _errorMessage = message;
    _setLoading(false);
  }

  void _safeNotify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _bookingAppointmentIdController.dispose();
    _bookingBookedOnController.dispose();
    _bookingDateController.dispose();
    _bookingTimeController.dispose();
    _bookingDoctorController.dispose();
    _bookingDepartmentController.dispose();
    _bookingReasonController.dispose();
    _bookingTypeController.dispose();

    _patientFirstNameController.dispose();
    _patientLastNameController.dispose();
    _patientAgeController.dispose();
    _patientGenderController.dispose();
    _patientEmailController.dispose();
    _patientPhoneController.dispose();
    _patientAddressController.dispose();
    _patientBloodGroupController.dispose();
    _patientHeightController.dispose();

    _vitalTemperatureController.dispose();
    _vitalPulseController.dispose();
    _vitalRespiratoryRateController.dispose();
    _vitalBloodPressureController.dispose();
    _vitalSpO2Controller.dispose();
    _vitalBloodSugarController.dispose();
    _vitalWeightController.dispose();
    _vitalSmokingController.dispose();
    _vitalAlcoholController.dispose();

    _statusNotesController.dispose();

    _disposed = true;
    super.dispose();
  }
}
