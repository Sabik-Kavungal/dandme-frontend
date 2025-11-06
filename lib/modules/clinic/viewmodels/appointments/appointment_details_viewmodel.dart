import 'package:flutter/material.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/models/appointment_history_model.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart';
import 'package:a/modules/clinic/models/vitals_model.dart';
import 'package:a/modules/clinic/repositories/clinic_appointment_repository.dart';
import 'package:a/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:a/modules/clinic/repositories/vitals_repository.dart';
import 'package:a/core/config/service.dart';

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

  AppointmentDetails? get appointmentDetails => _appointmentDetails;
  ClinicPatient? get clinicPatient => _clinicPatient;
  VitalsRecord? get vitalsRecord => _vitalsRecord;
  AppointmentHistoryResponse? get appointmentHistory => _appointmentHistory;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ========================
  // FETCH APPOINTMENT DETAILS
  // ========================
  Future<void> fetchAppointmentDetails(String appointmentId) async {
    if (_disposed) return;

    _setLoading(true);

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
      // If we have a specific vitals ID, fetch it directly
      if (vitalsId != null && vitalsId.isNotEmpty) {
        final vitals = await _vitalsRepository.getVitalsById(
          token: token,
          vitalsId: vitalsId,
          clinicPatientId: clinicPatientId,
          clinicId: clinicId,
        );

        if (vitals != null) {
          _vitalsRecord = vitals;
          _safeNotify();
          return;
        }
      }

      // Otherwise, fetch vitals history and find the one matching this appointment
      final history = await _vitalsRepository.getVitalsHistory(
        token: token,
        clinicPatientId: clinicPatientId,
        clinicId: clinicId,
        limit: 50,
      );

      if (history != null && history.vitals.isNotEmpty) {
        // If appointmentId provided, find vitals for this appointment
        if (appointmentId != null && appointmentId.isNotEmpty) {
          final appointmentVitals = history.vitals.firstWhere(
            (v) => v.appointmentId == appointmentId,
            orElse: () => history.vitals.first, // Fallback to most recent
          );
          _vitalsRecord = appointmentVitals;
        } else {
          // No appointment ID, use most recent vitals
          _vitalsRecord = history.vitals.first;
        }
        _safeNotify();
      }
    } catch (e) {
      print('⚠️ Error fetching vitals: $e');
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

    _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
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

    _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
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

        // Check for success response
        if (response['success'] == true) {
          // Refresh appointment details to get updated status
          await fetchAppointmentDetails(appointmentId);
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
    return transitions[currentStatus.toLowerCase()] ?? [];
  }

  // ========================
  // CANCEL APPOINTMENT
  // ========================
  Future<bool> cancelAppointment(String appointmentId) async {
    if (_disposed) return false;

    _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
      return false;
    }

    try {
      final success = await _repository.cancelAppointment(appointmentId, token);

      if (success) {
        _appointmentDetails = _appointmentDetails?.copyWith(
          status: 'Cancelled',
        );
        _errorMessage = null;
        _safeNotify();
        return true;
      }

      _setError('Failed to cancel appointment.');
      return false;
    } catch (e) {
      _setError('Error cancelling appointment: $e');
      return false;
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

    _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
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
        _errorMessage = null;
        _safeNotify();
        return true;
      }

      print('❌ ViewModel: Failed to update patient - response is null');
      print('');
      _setError('Failed to update patient');
      return false;
    } catch (e) {
      print('❌ ViewModel: Error updating patient: $e');
      print('');
      _setError('Error updating patient: $e');
      return false;
    } finally {
      _setLoading(false);
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

    _setLoading(true);

    final token = _authViewModel.accessToken;
    if (token == null || token.isEmpty) {
      _setError('Authentication required');
      return false;
    }

    // Get user ID for recorded_by (required for create/update)
    final userId = _authViewModel.user?.id;
    if (userId == null || userId.isEmpty) {
      _setError('User ID not found');
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

      // Validate blood_pressure string length (max 20 chars)
      if (bloodPressureString != null && bloodPressureString.length > 20) {
        print(
          '⚠️ Warning: blood_pressure string exceeds 20 characters, truncating',
        );
        bloodPressureString = bloodPressureString.substring(0, 20);
      }

      // Parse and validate numeric values with API ranges
      double? temperature = _parseDouble(vitalsData['temperature']);
      if (temperature != null && (temperature < 30.0 || temperature > 45.0)) {
        print('⚠️ Warning: Temperature out of range (30.0-45.0), ignoring');
        temperature = null;
      }

      int? pulseRate = _parseInt(vitalsData['pulse']);
      if (pulseRate != null && (pulseRate < 30 || pulseRate > 200)) {
        print('⚠️ Warning: Pulse rate out of range (30-200), ignoring');
        pulseRate = null;
      }

      int? respBpm = _parseInt(vitalsData['respiratory_rate']);
      if (respBpm != null && (respBpm < 5 || respBpm > 60)) {
        print('⚠️ Warning: Respiratory rate out of range (5-60), ignoring');
        respBpm = null;
      }

      int? spo2Percent = _parseInt(vitalsData['spo2']);
      if (spo2Percent != null && (spo2Percent < 50 || spo2Percent > 100)) {
        print('⚠️ Warning: SpO2 out of range (50-100), ignoring');
        spo2Percent = null;
      }

      double? sugarMgdl = _parseDouble(vitalsData['blood_sugar']);
      if (sugarMgdl != null && (sugarMgdl < 10 || sugarMgdl > 1000)) {
        print('⚠️ Warning: Blood sugar out of range (10-1000), ignoring');
        sugarMgdl = null;
      }

      double? weightKg = _parseDouble(vitalsData['weight']);
      if (weightKg != null && (weightKg < 1.0 || weightKg > 500.0)) {
        print('⚠️ Warning: Weight out of range (1.0-500.0), ignoring');
        weightKg = null;
      }

      // Check if we have at least one valid vital sign
      final hasValidData =
          systolicBp != null ||
          diastolicBp != null ||
          temperature != null ||
          pulseRate != null ||
          respBpm != null ||
          spo2Percent != null ||
          sugarMgdl != null ||
          weightKg != null;

      if (!hasValidData) {
        _setError(
          'No valid vital signs data to save. Please check the values are within acceptable ranges.',
        );
        return false;
      }

      if (vitalsRecordId != null && vitalsRecordId.isNotEmpty) {
        // Update existing vitals record
        final updateRequest = UpdateVitalsRequest(
          id: vitalsRecordId,
          clinicPatientId: clinicPatientId,
          clinicId: clinicId,
          appointmentId: appointmentId,
          systolicBp: systolicBp,
          diastolicBp: diastolicBp,
          bloodPressure: bloodPressureString,
          temperature: temperature,
          pulseRate: pulseRate,
          respBpm: respBpm,
          spo2Percent: spo2Percent,
          sugarMgdl: sugarMgdl,
          weightKg: weightKg,
          notes: vitalsData['notes'] as String?,
          recordedBy: userId,
        );

        final success = await _vitalsRepository.updateVitals(
          token: token,
          vitalsId: vitalsRecordId,
          request: updateRequest,
        );

        if (success) {
          print('✅ ViewModel: Vitals updated successfully');
          print('');

          // Refresh the vitals record from API to get updated data
          try {
            final updatedVitals = await _vitalsRepository.getVitalsById(
              token: token,
              vitalsId: vitalsRecordId,
              clinicPatientId: clinicPatientId,
              clinicId: clinicId,
            );

            if (updatedVitals != null) {
              _vitalsRecord = updatedVitals;
              print('✅ ViewModel: Vitals record refreshed from API');
              print('');
            } else {
              print('⚠️ ViewModel: Could not refresh vitals record from API');
              print('');
            }
          } catch (e) {
            print('⚠️ ViewModel: Error refreshing vitals record: $e');
            print('');
            // Continue even if refresh fails - the update was successful
          }

          _errorMessage = null;
          _safeNotify();
          return true;
        }

        _setError('Failed to update vitals');
        return false;
      } else {
        // Create new vitals record
        final createRequest = CreateVitalsRequest(
          clinicPatientId: clinicPatientId,
          clinicId: clinicId,
          appointmentId: appointmentId,
          systolicBp: systolicBp,
          diastolicBp: diastolicBp,
          bloodPressure: bloodPressureString,
          temperature: temperature,
          pulseRate: pulseRate,
          respBpm: respBpm,
          spo2Percent: spo2Percent,
          sugarMgdl: sugarMgdl,
          weightKg: weightKg,
          notes: vitalsData['notes'] as String?,
          recordedBy: userId,
        );

        final vitalsRecord = await _vitalsRepository.createVitals(
          token: token,
          request: createRequest,
        );

        if (vitalsRecord != null) {
          print('✅ ViewModel: Vitals created successfully');
          print('   Vitals ID: ${vitalsRecord.id}');
          print('');
          // Update local vitals record
          _vitalsRecord = vitalsRecord;
          _errorMessage = null;
          _safeNotify();
          return true;
        }

        _setError('Failed to create vitals');
        return false;
      }
    } catch (e) {
      print('❌ ViewModel: Error saving vitals: $e');
      print('');
      _setError('Error saving vitals: $e');
      return false;
    } finally {
      _setLoading(false);
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

  // ========================
  // INTERNAL HELPERS
  // ========================
  void _setLoading(bool value) {
    if (_disposed) return;
    _isLoading = value;
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
    _disposed = true;
    super.dispose();
  }
}
