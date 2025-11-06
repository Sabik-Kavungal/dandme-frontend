import 'package:a/modules/clinic/viewmodels/appointments/appointment_details_viewmodel.dart';
import 'package:a/modules/clinic/views/appointments/reschedule_modal_view.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/clinic/models/appointment_history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/navigation_helper.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final String? appointmentId;
  final String? clinicPatientId;

  const AppointmentDetailsScreen({
    super.key,
    this.appointmentId,
    this.clinicPatientId,
  });

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  late AppointmentDetailsViewModel _viewModel;
  bool _isEditingPatientDetails = false;
  bool _isEditingBookingDetails = false;
  bool _isEditingVitalSigns = false;
  bool _isVitalSignsExpanded = false; // Privacy: collapsed by default
  bool _isSavingPatient = false;
  bool _isSavingVitals = false;

  // Controllers for booking details - initialized immediately
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

  // Controllers for patient details - initialized immediately
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
  final TextEditingController _patientSmokingController =
      TextEditingController();
  final TextEditingController _patientAlcoholController =
      TextEditingController();
  final TextEditingController _patientHeightController =
      TextEditingController();

  // Controllers for vital signs
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
  @override
  void initState() {
    super.initState();

    _viewModel = AppointmentDetailsViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );

    // Fetch data after the first frame is rendered — avoids context issues
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // Fetch appointment details first (if available)
        if (widget.appointmentId != null && widget.appointmentId!.isNotEmpty) {
          await _viewModel.fetchAppointmentDetails(widget.appointmentId!);
        }

        // If patient ID is provided directly (e.g. from another screen), fetch it
        if (widget.clinicPatientId != null &&
            widget.clinicPatientId!.isNotEmpty) {
          await _viewModel.fetchClinicPatient(widget.clinicPatientId!);
        }

        // Update text fields with any initial data
        if (mounted) {
          setState(() => _updateControllerValues());
        }
      } catch (e) {
        // Handle any errors during initialization
        if (mounted) {
          setState(() {});
        }
      }
    });

    // Listen for updates from the ViewModel
    _viewModel.addListener(() async {
      if (!mounted) return;

      // Update the text fields whenever data changes
      setState(() => _updateControllerValues());

      final appointment = _viewModel.appointmentDetails;
      final clinicPatient = _viewModel.clinicPatient;

      // If appointment is loaded but patient not yet fetched
      if (appointment != null && clinicPatient == null) {
        final patientId = appointment.clinicPatientId ?? widget.clinicPatientId;
        if (patientId != null && patientId.isNotEmpty) {
          await _viewModel.fetchClinicPatient(
            patientId,
            clinicId: appointment.clinic?.id,
            doctorId: appointment.doctor?.id,
            // departmentId: appointment.departmentId,
          );
        }
      }

      // Fetch vitals for this appointment if not already loaded
      if (appointment != null && _viewModel.vitalsRecord == null) {
        final patientId = appointment.clinicPatientId ?? widget.clinicPatientId;
        if (patientId != null && patientId.isNotEmpty) {
          await _viewModel.fetchVitalsForAppointment(
            appointmentId: appointment.id,
            clinicPatientId: patientId,
            clinicId: appointment.clinic?.id,
          );
        }
      }

      // Fetch appointment history if not already loaded
      if (appointment != null && _viewModel.appointmentHistory == null) {
        final patientId = appointment.clinicPatientId ?? widget.clinicPatientId;
        if (patientId != null && patientId.isNotEmpty) {
          await _viewModel.fetchAppointmentHistory(
            clinicPatientId: patientId,
            clinicId: appointment.clinic?.id,
            limit: 50,
          );
        }
      }
    });
  }

  // Helper function to format consultation type (remove underscores)
  String _formatConsultationType(String? consultationType) {
    if (consultationType == null ||
        consultationType.isEmpty ||
        consultationType == 'N/A') {
      return 'N/A';
    }
    return consultationType.replaceAll('_', ' ');
  }

  // Helper function to format doctor name (add Dr. prefix if not present)
  String _formatDoctorName(String? doctorName) {
    if (doctorName == null || doctorName.isEmpty || doctorName == 'N/A') {
      return 'N/A';
    }
    // Check if already has Dr. prefix (case insensitive)
    final trimmedName = doctorName.trim();
    if (trimmedName.toLowerCase().startsWith('dr.')) {
      return doctorName; // Already has Dr. prefix
    }
    return 'Dr. $trimmedName';
  }

  void _updateControllerValues() {
    final appointment = _viewModel.appointmentDetails;
    if (appointment == null) return;

    // Format dates
    String formatDate(String? dateTime) {
      if (dateTime == null) return 'N/A';
      try {
        final cleanDateTime = dateTime.split(' ')[0];
        final date = DateTime.parse(cleanDateTime);
        return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
      } catch (e) {
        return dateTime;
      }
    }

    String formatTime(String? dateTime) {
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
      } catch (e) {
        return dateTime;
      }
    }

    // Update booking controllers
    _bookingAppointmentIdController.text =
        appointment.tokenNumber?.toString() ?? 'N/A';
    _bookingBookedOnController.text = formatDate(appointment.createdAt);
    _bookingDateController.text = formatDate(appointment.appointmentDateTime);
    _bookingTimeController.text = formatTime(appointment.appointmentDateTime);
    _bookingDoctorController.text = _formatDoctorName(
      appointment.doctorName ?? appointment.doctor?.name ?? 'N/A',
    );
    _bookingDepartmentController.text = appointment.department ?? 'N/A';
    _bookingReasonController.text = appointment.notes ?? 'N/A';
    _bookingTypeController.text = _formatConsultationType(
      appointment.consultationType ?? 'N/A',
    );

    // Update patient controllers: prefer full clinic patient data if loaded
    final clinicPatient = _viewModel.clinicPatient;
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
      _patientSmokingController.text = clinicPatient.smokingStatus ?? 'N/A';
      _patientAlcoholController.text = clinicPatient.alcoholUse ?? 'N/A';
      _patientHeightController.text =
          clinicPatient.heightCm?.toString() ?? 'N/A';
    } else {
      // Fallback to limited data from appointment
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
      _patientSmokingController.text = 'N/A';
      _patientAlcoholController.text = 'N/A';
      _patientHeightController.text = 'N/A';
    }

    // Update vital signs controllers from fetched vitals record
    final vitalsRecord = _viewModel.vitalsRecord;
    if (vitalsRecord != null) {
      // Temperature
      _vitalTemperatureController.text =
          vitalsRecord.temperature?.toString() ?? '';

      // Pulse Rate
      _vitalPulseController.text = vitalsRecord.pulseRate?.toString() ?? '';

      // Respiratory Rate
      _vitalRespiratoryRateController.text =
          vitalsRecord.respBpm?.toString() ?? '';

      // Blood Pressure - prioritize blood_pressure field from API, fallback to combining systolic/diastolic
      if (vitalsRecord.bloodPressure != null &&
          vitalsRecord.bloodPressure!.isNotEmpty) {
        // Use blood_pressure field directly from API
        _vitalBloodPressureController.text = vitalsRecord.bloodPressure!;
      } else if (vitalsRecord.systolicBp != null ||
          vitalsRecord.diastolicBp != null) {
        // Fallback: combine systolic/diastolic if blood_pressure not available
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

      // SpO2
      _vitalSpO2Controller.text = vitalsRecord.spo2Percent?.toString() ?? '';

      // Blood Sugar
      _vitalBloodSugarController.text =
          vitalsRecord.sugarMgdl?.toString() ?? '';

      // Weight
      _vitalWeightController.text = vitalsRecord.weightKg?.toString() ?? '';
    } else {
      // No vitals record - clear all controllers
      _vitalTemperatureController.text = '';
      _vitalPulseController.text = '';
      _vitalRespiratoryRateController.text = '';
      _vitalBloodPressureController.text = '';
      _vitalSpO2Controller.text = '';
      _vitalBloodSugarController.text = '';
      _vitalWeightController.text = '';
    }
  }

  Future<void> _savePatientDetails() async {
    // Get patient ID and clinic ID
    final appointment = _viewModel.appointmentDetails;
    final clinicPatient = _viewModel.clinicPatient;

    final patientId =
        appointment?.clinicPatientId ??
        clinicPatient?.id ??
        widget.clinicPatientId;

    if (patientId == null || patientId.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Patient ID not found. Cannot save changes.'),
            backgroundColor: Color(0xFFEF4444),
          ),
        );
      }
      return;
    }

    // Get clinic ID from appointment or clinic patient
    final clinicId = appointment?.clinic?.id ?? clinicPatient?.clinicId;

    if (clinicId == null || clinicId.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Clinic ID not found. Cannot save changes.'),
            backgroundColor: Color(0xFFEF4444),
          ),
        );
      }
      return;
    }

    setState(() {
      _isSavingPatient = true;
    });

    try {
      // Build update map - only include non-empty, non-N/A values
      final updates = <String, dynamic>{};

      // Helper to check if value is valid for update
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

      // Add all patient fields
      addIfValid('first_name', _patientFirstNameController.text);
      addIfValid('last_name', _patientLastNameController.text);
      addIntIfValid('age', _patientAgeController.text);
      addIfValid('gender', _patientGenderController.text);
      addIfValid('email', _patientEmailController.text);
      addIfValid('phone', _patientPhoneController.text);

      // Parse address - split back into components if it was combined
      final address = _patientAddressController.text;
      if (address.isNotEmpty && address != 'N/A') {
        // If address contains commas, try to split it
        final addressParts = address.split(',').map((e) => e.trim()).toList();
        if (addressParts.length >= 1) {
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
      addIfValid('smoking_status', _patientSmokingController.text);
      addIfValid('alcohol_use', _patientAlcoholController.text);
      addIntIfValid('height_cm', _patientHeightController.text);

      if (updates.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No changes to save.'),
              backgroundColor: Color(0xFF6B7280),
            ),
          );
        }
        setState(() {
          _isSavingPatient = false;
        });
        return;
      }

      // Call API to update patient
      final success = await _viewModel.updateClinicPatient(
        patientId: patientId,
        updates: updates,
        clinicId: clinicId,
      );

      if (mounted) {
        if (success) {
          print('✅ UI: Patient details update completed successfully');
          print('🔄 Refreshing UI with updated data...');
          print('');

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Patient details updated successfully'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
          setState(() {
            _isEditingPatientDetails = false;
          });
          // Refresh controller values with updated data
          _updateControllerValues();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _viewModel.errorMessage ?? 'Failed to update patient details',
              ),
              backgroundColor: const Color(0xFFEF4444),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSavingPatient = false;
        });
      }
    }
  }

  Future<void> _saveVitalSigns() async {
    // Get patient ID and clinic ID
    final appointment = _viewModel.appointmentDetails;
    final clinicPatient = _viewModel.clinicPatient;

    final patientId =
        appointment?.clinicPatientId ??
        clinicPatient?.id ??
        widget.clinicPatientId;

    if (patientId == null || patientId.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Patient ID not found. Cannot save vital signs.'),
            backgroundColor: Color(0xFFEF4444),
          ),
        );
      }
      return;
    }

    // Get clinic ID from appointment or clinic patient
    final clinicId = appointment?.clinic?.id ?? clinicPatient?.clinicId;
    final appointmentId = appointment?.id;

    setState(() {
      _isSavingVitals = true;
    });

    try {
      // Collect vitals data from controllers
      final vitalsData = <String, dynamic>{};

      // Helper to get value from controller
      String getValue(TextEditingController controller) {
        final text = controller.text.trim();
        return text.isEmpty ? '' : text;
      }

      // Collect all vitals values
      final temperature = getValue(_vitalTemperatureController);
      final pulse = getValue(_vitalPulseController);
      final respiratoryRate = getValue(_vitalRespiratoryRateController);
      final bloodPressure = getValue(_vitalBloodPressureController);
      final spo2 = getValue(_vitalSpO2Controller);
      final bloodSugar = getValue(_vitalBloodSugarController);
      final weight = getValue(_vitalWeightController);

      // Only include non-empty values
      if (temperature.isNotEmpty) {
        vitalsData['temperature'] = temperature;
      }
      if (pulse.isNotEmpty) {
        vitalsData['pulse'] = pulse;
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
      if (weight.isNotEmpty) {
        vitalsData['weight'] = weight;
      }

      if (vitalsData.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No vital signs data to save.'),
              backgroundColor: Color(0xFF6B7280),
            ),
          );
        }
        setState(() {
          _isSavingVitals = false;
        });
        return;
      }

      // Check if we already have a vitals record (for update vs create)
      final existingVitalsId = _viewModel.vitalsRecord?.id;

      // Call API to save vitals (update if exists, create if new)
      final success = await _viewModel.saveVitals(
        clinicPatientId: patientId,
        vitalsData: vitalsData,
        appointmentId: appointmentId,
        clinicId: clinicId,
        vitalsRecordId: existingVitalsId,
      );

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vital signs saved successfully'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
          setState(() {
            _isEditingVitalSigns = false;
            // Refresh controllers with updated data from ViewModel
            _updateControllerValues();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _viewModel.errorMessage ?? 'Failed to save vital signs',
              ),
              backgroundColor: const Color(0xFFEF4444),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSavingVitals = false;
        });
      }
    }
  }

  @override
  void dispose() {
    // Dispose booking controllers
    _bookingAppointmentIdController.dispose();
    _bookingBookedOnController.dispose();
    _bookingDateController.dispose();
    _bookingTimeController.dispose();
    _bookingDoctorController.dispose();
    _bookingDepartmentController.dispose();
    _bookingReasonController.dispose();
    _bookingTypeController.dispose();

    // Dispose patient controllers
    _patientFirstNameController.dispose();
    _patientLastNameController.dispose();
    _patientAgeController.dispose();
    _patientGenderController.dispose();
    _patientEmailController.dispose();
    _patientPhoneController.dispose();
    _patientAddressController.dispose();
    _patientBloodGroupController.dispose();
    _patientSmokingController.dispose();
    _patientAlcoholController.dispose();
    _patientHeightController.dispose();

    // Dispose vital signs controllers
    _vitalTemperatureController.dispose();
    _vitalPulseController.dispose();
    _vitalRespiratoryRateController.dispose();
    _vitalBloodPressureController.dispose();
    _vitalSpO2Controller.dispose();
    _vitalBloodSugarController.dispose();
    _vitalWeightController.dispose();

    // Dispose status update controller
    _statusNotesController.dispose();

    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 52,
        shadowColor: Colors.black.withOpacity(0.08),
        shape: const Border(
          bottom: BorderSide(color: Color(0xFFE8EBF0), width: 1),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF333333),
              size: 18,
            ),
            onPressed: () => NavigationHelper.goBack(context),
          ),
        ),
        title: const Text(
          'Appointment Details',
          style: TextStyle(
            color: Color(0xFF1A1D29),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.print_rounded,
                color: Color(0xFF6366F1),
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFF5F7FA),
              Colors.white,
              const Color(0xFFFAFBFC),
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    // Show loading indicator only if actively loading and no data yet
    // Only show if we have an appointmentId to fetch
    if (_viewModel.isLoading &&
        _viewModel.appointmentDetails == null &&
        widget.appointmentId != null &&
        widget.appointmentId!.isNotEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF6366F1)),
      );
    }

    // Show error message only if there's an error and no data and we have appointmentId
    if (_viewModel.errorMessage != null &&
        _viewModel.appointmentDetails == null &&
        !_viewModel.isLoading &&
        widget.appointmentId != null &&
        widget.appointmentId!.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Color(0xFFEF4444)),
            const SizedBox(height: 16),
            Text(
              'Failed to load appointment details',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                _viewModel.errorMessage ?? 'Unknown error occurred',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                if (widget.appointmentId != null) {
                  _viewModel.fetchAppointmentDetails(widget.appointmentId!);
                }
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Show content
    return LayoutBuilder(
      builder: (context, constraints) {
        // For mobile screens, stack vertically - using same widgets as desktop
        if (constraints.maxWidth < 768) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                _buildBookingDetailsCard(),
                const SizedBox(height: 4),
                _buildPatientDetailsCard(),
                const SizedBox(height: 4),
                _buildVitalSignsCard(),
                const SizedBox(height: 4),
                _buildAppointmentHistoryCard(),
                const SizedBox(height: 8),
                _buildFooter(),
              ],
            ),
          );
        }
        // For tablet and desktop, use side-by-side layout matching the image
        else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column - 5 Cards
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _buildBookingDetailsCard(),
                        const SizedBox(height: 4),
                        _buildPatientDetailsCard(),
                        const SizedBox(height: 4),
                        _buildVitalSignsCard(),
                        const SizedBox(height: 8),
                        _buildFooter(),
                      ],
                    ),
                  ),
                  // Right Column - Appointment History
                  const SizedBox(width: 6),
                  Expanded(flex: 1, child: _buildAppointmentHistoryCard()),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildBookingDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.12),
            blurRadius: 28,
            offset: const Offset(0, 6),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header matching image exactly
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFF6366F1).withOpacity(0.25),
                            const Color(0xFF8B5CF6).withOpacity(0.2),
                            const Color(0xFFA78BFA).withOpacity(0.15),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Booking Details',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1D29),
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (_isEditingBookingDetails) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                          ),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6366F1).withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          'EDITING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildStatusPill(),
              const SizedBox(width: 6),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: _isEditingBookingDetails
                      ? const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                        )
                      : null,
                  color: _isEditingBookingDetails
                      ? null
                      : const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isEditingBookingDetails
                        ? Colors.transparent
                        : const Color(0xFFE5E7EB),
                    width: 1,
                  ),
                  boxShadow: _isEditingBookingDetails
                      ? [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        _isEditingBookingDetails = !_isEditingBookingDetails;
                        if (_isEditingBookingDetails) {
                          _updateControllerValues();
                        }
                      });
                    },
                    child: Center(
                      child: Icon(
                        _isEditingBookingDetails
                            ? Icons.close_rounded
                            : Icons.edit_rounded,
                        size: 17,
                        color: _isEditingBookingDetails
                            ? Colors.white
                            : const Color(0xFF6366F1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Details Layout - show editable or read-only
          if (_isEditingBookingDetails)
            _buildEditableBookingDetailsLayout()
          else
            _buildBookingDetailsLayout(),
          const SizedBox(height: 8),
          // Status Display and Update Section
          _buildStatusSection(),
          const SizedBox(height: 8),
          // Action Buttons matching image exactly
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF1A1D29),
                      side: BorderSide.none,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 14,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    label: const Text(
                      'Add More Appointment',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      // Cancel appointment action
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFEF4444),
                      side: BorderSide.none,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1A1D29), Color(0xFF2D3142)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(
                          context,
                        ).modalBarrierDismissLabel,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return RescheduleModal(
                            appointmentId: widget.appointmentId,
                          );
                        },
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ).copyWith(
                          overlayColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.1),
                          ),
                        ),
                    child: const Text(
                      'Reschedule',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_isEditingBookingDetails) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isEditingBookingDetails = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Save booking details
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking details updated successfully'),
                          backgroundColor: Color(0xFF10B981),
                        ),
                      );
                      setState(() {
                        _isEditingBookingDetails = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPatientDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withOpacity(0.12),
            blurRadius: 28,
            offset: const Offset(0, 6),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: const Color(0xFF10B981).withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF10B981).withOpacity(0.25),
                          const Color(0xFF34D399).withOpacity(0.2),
                          const Color(0xFF6EE7B7).withOpacity(0.15),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: const Color(0xFF10B981).withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 16,
                      color: Color(0xFF10B981),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Patient Details',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1D29),
                      letterSpacing: -0.2,
                    ),
                  ),
                  if (_isEditingPatientDetails) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF34D399)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        'EDITING',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: _isEditingPatientDetails
                      ? const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF34D399)],
                        )
                      : null,
                  color: _isEditingPatientDetails
                      ? null
                      : const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isEditingPatientDetails
                        ? Colors.transparent
                        : const Color(0xFFE5E7EB),
                    width: 1,
                  ),
                  boxShadow: _isEditingPatientDetails
                      ? [
                          BoxShadow(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        _isEditingPatientDetails = !_isEditingPatientDetails;
                        if (_isEditingPatientDetails) {
                          _updateControllerValues();
                        }
                      });
                    },
                    child: Center(
                      child: Icon(
                        _isEditingPatientDetails
                            ? Icons.close_rounded
                            : Icons.edit_rounded,
                        size: 17,
                        color: _isEditingPatientDetails
                            ? Colors.white
                            : const Color(0xFF6366F1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Patient Details Layout - show editable or read-only
          if (_isEditingPatientDetails)
            _buildEditablePatientDetailsLayout()
          else
            _buildPatientDetailsSection(context),
          if (_isEditingPatientDetails) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isEditingPatientDetails = false;
                      _updateControllerValues(); // Reset to original values
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF34D399)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _isSavingPatient
                        ? null
                        : () async {
                            await _savePatientDetails();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: _isSavingPatient
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVitalSignsCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEF4444).withOpacity(0.12),
            blurRadius: 28,
            offset: const Offset(0, 6),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: const Color(0xFFEF4444).withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFEF4444).withOpacity(0.25),
                            const Color(0xFFF87171).withOpacity(0.2),
                            const Color(0xFFFCA5A5).withOpacity(0.15),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFEF4444).withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: const Color(0xFFEF4444).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.monitor_heart_rounded,
                        size: 16,
                        color: Color(0xFFEF4444),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Vital Signs',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1D29),
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (_isEditingVitalSigns) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEF4444), Color(0xFFF87171)],
                          ),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFEF4444).withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          'EDITING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: _isEditingVitalSigns
                          ? const LinearGradient(
                              colors: [Color(0xFFEF4444), Color(0xFFF87171)],
                            )
                          : null,
                      color: _isEditingVitalSigns
                          ? null
                          : const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isEditingVitalSigns
                            ? Colors.transparent
                            : const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      boxShadow: _isEditingVitalSigns
                          ? [
                              BoxShadow(
                                color: const Color(0xFFEF4444).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            _isEditingVitalSigns = !_isEditingVitalSigns;
                            if (_isEditingVitalSigns) {
                              _updateControllerValues();
                            }
                          });
                        },
                        child: Center(
                          child: Icon(
                            _isEditingVitalSigns
                                ? Icons.close_rounded
                                : Icons.edit_rounded,
                            size: 17,
                            color: _isEditingVitalSigns
                                ? Colors.white
                                : const Color(0xFF6366F1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: _isVitalSignsExpanded
                          ? const Color(0xFFEF4444).withOpacity(0.1)
                          : const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isVitalSignsExpanded
                            ? const Color(0xFFEF4444).withOpacity(0.3)
                            : const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            _isVitalSignsExpanded = !_isVitalSignsExpanded;
                          });
                        },
                        child: Center(
                          child: Icon(
                            _isVitalSignsExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: _isVitalSignsExpanded
                                ? const Color(0xFFEF4444)
                                : const Color(0xFF6366F1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          if (_isVitalSignsExpanded) ...[
            if (_isEditingVitalSigns)
              _buildEditableVitalSignsContent()
            else
              _buildVitalSignsContent(),
            if (_isEditingVitalSigns) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isEditingVitalSigns = false;
                        _updateControllerValues(); // Reset to original values
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFEF4444), Color(0xFFF87171)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEF4444).withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _isSavingVitals
                          ? null
                          : () async {
                              await _saveVitalSigns();
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: _isSavingVitals
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              'Save Changes',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.2,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ] else ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFFF8F9FA), const Color(0xFFF5F7FA)],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE8EBF0), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_information_rounded,
                    size: 20,
                    color: const Color(0xFF6366F1).withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Click to view vital signs',
                    style: TextStyle(
                      color: const Color(0xFF6B7280).withOpacity(0.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVitalSignsContent() {
    // Helper to safely get controller text
    String getVitalValue(TextEditingController controller) {
      try {
        final text = controller.text.trim();
        return text.isEmpty ? 'No data available' : text;
      } catch (e) {
        return 'No data available';
      }
    }

    // Get values from controllers - show message if empty
    return Column(
      children: [
        // First row - 4 fields
        Row(
          children: [
            Expanded(
              child: _buildVitalSignItem(
                'Temperature',
                getVitalValue(_vitalTemperatureController),
                Icons.thermostat_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildVitalSignItem(
                'Pulse',
                getVitalValue(_vitalPulseController),
                Icons.favorite_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildVitalSignItem(
                'Respiratory Rate',
                getVitalValue(_vitalRespiratoryRateController),
                Icons.air_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildVitalSignItem(
                'Blood Pressure',
                getVitalValue(_vitalBloodPressureController),
                Icons.monitor_heart_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row - 3 fields (last row)
        Row(
          children: [
            Expanded(
              child: _buildVitalSignItem(
                'SpO₂',
                getVitalValue(_vitalSpO2Controller),
                Icons.water_drop_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildVitalSignItem(
                'Blood Sugar',
                getVitalValue(_vitalBloodSugarController),
                Icons.local_drink_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildVitalSignItem(
                'Weight',
                getVitalValue(_vitalWeightController),
                Icons.monitor_weight_rounded,
              ),
            ),
            const SizedBox(width: 6),
            const Expanded(child: SizedBox()), // Empty spacer for alignment
          ],
        ),
      ],
    );
  }

  Widget _buildEditableVitalSignsContent() {
    return Column(
      children: [
        // First row - 4 fields
        Row(
          children: [
            Expanded(
              child: _buildEditableVitalSignItem(
                'Temperature',
                _vitalTemperatureController,
                Icons.thermostat_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableVitalSignItem(
                'Pulse',
                _vitalPulseController,
                Icons.favorite_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableVitalSignItem(
                'Respiratory Rate',
                _vitalRespiratoryRateController,
                Icons.air_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableVitalSignItem(
                'Blood Pressure',
                _vitalBloodPressureController,
                Icons.monitor_heart_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row - 3 fields (last row)
        Row(
          children: [
            Expanded(
              child: _buildEditableVitalSignItem(
                'SpO₂',
                _vitalSpO2Controller,
                Icons.water_drop_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableVitalSignItem(
                'Blood Sugar',
                _vitalBloodSugarController,
                Icons.local_drink_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableVitalSignItem(
                'Weight',
                _vitalWeightController,
                Icons.monitor_weight_rounded,
              ),
            ),
            const SizedBox(width: 6),
            const Expanded(child: SizedBox()), // Empty spacer for alignment
          ],
        ),
      ],
    );
  }

  Widget _buildEditableVitalSignItem(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    // Keep red icon but use patient details theme for borders/shadows
    const Color vitalSignColor = Color(0xFFEF4444);
    const Color patientThemeColor = Color(0xFF10B981);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: patientThemeColor.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      vitalSignColor.withOpacity(0.15),
                      vitalSignColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 12, color: vitalSignColor),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Enter value',
              hintStyle: TextStyle(
                color: const Color(0xFF6B7280).withOpacity(0.5),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF59E0B).withOpacity(0.12),
            blurRadius: 28,
            offset: const Offset(0, 6),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: const Color(0xFFF59E0B).withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFF59E0B).withOpacity(0.25),
                      const Color(0xFFFBBF24).withOpacity(0.2),
                      const Color(0xFFFCD34D).withOpacity(0.15),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF59E0B).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFFF59E0B).withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.history_rounded,
                  size: 16,
                  color: Color(0xFFF59E0B),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Appointment History',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D29),
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Timeline with real appointment history data
          SizedBox(height: 570, child: _buildAppointmentHistoryTimeline()),
          const SizedBox(height: 8),
          // Show "View More" button if there are more appointments
          if (_viewModel.appointmentHistory != null &&
              _viewModel.appointmentHistory!.total >
                  _viewModel.appointmentHistory!.appointments.length)
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B82F6).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: const Text(
                  '+View More',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAppointmentHistoryTimeline() {
    final history = _viewModel.appointmentHistory;
    final currentAppointmentId = _viewModel.appointmentDetails?.id;

    // Show loading state
    if (_viewModel.isLoading && history == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Show empty state
    if (history == null || history.appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_rounded,
              size: 48,
              color: const Color(0xFF6B7280).withOpacity(0.5),
            ),
            const SizedBox(height: 12),
            Text(
              'No appointment history',
              style: TextStyle(
                color: const Color(0xFF6B7280).withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    // Build timeline with real data
    return SingleChildScrollView(
      child: Column(
        children: history.appointments.asMap().entries.map((entry) {
          final appointment = entry.value;
          final isHighlighted = appointment.id == currentAppointmentId;
          return _buildAppointmentHistoryItem(
            appointment: appointment,
            isHighlighted: isHighlighted,
            index: entry.key,
            totalItems: history.appointments.length,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAppointmentHistoryItem({
    required AppointmentHistoryItem appointment,
    required bool isHighlighted,
    required int index,
    required int totalItems,
  }) {
    // Format date to DD/MM/YYYY format
    final date = _formatDateToDDMMYYYY(appointment.appointmentDate);
    final time = appointment.appointmentTime;

    // Get doctor name from current appointment if highlighted, otherwise use empty
    String? doctorName;
    if (isHighlighted) {
      final currentAppointment = _viewModel.appointmentDetails;
      doctorName =
          currentAppointment?.doctorName ?? currentAppointment?.doctor?.name;
    }

    return _buildImageTimelineItem(
      date,
      time,
      doctorName,
      isHighlighted,
      index,
      totalItems,
    );
  }

  /// Format date string to DD/MM/YYYY format
  /// Handles various input formats and converts to DD/MM/YYYY
  String _formatDateToDDMMYYYY(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'N/A';
    }

    // If already in DD/MM/YYYY format, return as is
    if (RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dateString)) {
      return dateString;
    }

    // Try to parse various date formats
    try {
      DateTime? date;

      // Try ISO format (YYYY-MM-DD)
      if (dateString.contains('-')) {
        final parts = dateString.split(' ')[0].split('-');
        if (parts.length == 3) {
          date = DateTime.tryParse(dateString.split(' ')[0]);
        }
      }

      // Try DD-MM-YYYY format
      if (date == null && dateString.contains('-')) {
        final parts = dateString.split(' ')[0].split('-');
        if (parts.length == 3 && parts[0].length == 2) {
          date = DateTime.tryParse('${parts[2]}-${parts[1]}-${parts[0]}');
        }
      }

      // If parsing succeeded, format to DD/MM/YYYY
      if (date != null) {
        final day = date.day.toString().padLeft(2, '0');
        final month = date.month.toString().padLeft(2, '0');
        final year = date.year.toString();
        return '$day/$month/$year';
      }
    } catch (e) {
      // If parsing fails, return original string
      print('Error formatting date: $e');
    }

    // Return original string if formatting fails
    return dateString;
  }

  Widget _buildImageTimelineItem(
    String date,
    String time,
    String? doctorName,
    bool isHighlighted,
    int index,
    int totalItems,
  ) {
    final timelineColor = isHighlighted
        ? const Color(0xFFF59E0B)
        : const Color(0xFF10B981);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator matching image
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      timelineColor,
                      timelineColor.withOpacity(0.9),
                      timelineColor.withOpacity(0.8),
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: timelineColor.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                    BoxShadow(
                      color: timelineColor.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: timelineColor.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (index < totalItems - 1)
                Container(
                  width: 2.5,
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        timelineColor.withOpacity(0.7),
                        timelineColor.withOpacity(0.4),
                        timelineColor.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Content matching image exactly
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isHighlighted
                      ? [
                          const Color(0xFFFFF9E6),
                          const Color(0xFFFFF4CD),
                          const Color(0xFFFFF0B3),
                        ]
                      : [
                          const Color(0xFFF0FDF4),
                          const Color(0xFFE8F5E9),
                          const Color(0xFFD1FAE5),
                        ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isHighlighted
                      ? const Color(0xFFF59E0B).withOpacity(0.5)
                      : const Color(0xFF10B981).withOpacity(0.5),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isHighlighted
                                ? const Color(0xFFF59E0B)
                                : const Color(0xFF10B981))
                            .withOpacity(0.18),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    color:
                        (isHighlighted
                                ? const Color(0xFFF59E0B)
                                : const Color(0xFF10B981))
                            .withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Time in same row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              timelineColor.withOpacity(0.2),
                              timelineColor.withOpacity(0.15),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: timelineColor.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.calendar_today_rounded,
                          size: 14,
                          color: timelineColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '$date • $time',
                          style: TextStyle(
                            color: const Color(0xFF1A1D29),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Doctor name with icon
                  if (doctorName != null && doctorName.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                timelineColor.withOpacity(0.2),
                                timelineColor.withOpacity(0.15),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: timelineColor.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.medical_services_rounded,
                            size: 14,
                            color: timelineColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _formatDoctorName(doctorName),
                            style: TextStyle(
                              color: const Color(0xFF1A1D29),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsLayout(List<Map<String, String>> details) {
    // Ensure we have at least 9 fields for booking details
    if (details.length < 9) {
      // Fallback: handle fewer fields gracefully
      return Column(
        children: details
            .map(
              (detail) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildDetailItem(detail['label']!, detail['value']!),
              ),
            )
            .toList(),
      );
    }

    return Column(
      children: [
        // First row - 3 fields
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[0]['label']!,
                details[0]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[1]['label']!,
                details[1]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[2]['label']!,
                details[2]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row - 3 fields
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[3]['label']!,
                details[3]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[4]['label']!,
                details[4]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[5]['label']!,
                details[5]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Third row - 3 fields
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[6]['label']!,
                details[6]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[7]['label']!,
                details[7]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[8]['label']!,
                details[8]['value']!,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.5),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPatientDetailsLayout(List<Map<String, String>> details) {
    return Column(
      children: [
        // First row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[0]['label']!,
                details[0]['value']!,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildPatientDetailItem(
                details[1]['label']!,
                details[1]['value']!,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildPatientDetailItem(
                details[2]['label']!,
                details[2]['value']!,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildPatientDetailItem(
                details[3]['label']!,
                details[3]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[4]['label']!,
                details[4]['value']!,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildPatientDetailItem(
                details[5]['label']!,
                details[5]['value']!,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildPatientDetailItem(
                details[6]['label']!,
                details[6]['value']!,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildPatientDetailItem(
                details[7]['label']!,
                details[7]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Third row - only 2 items now (removed Last Name, so 9 items total)
        if (details.length > 8)
          Row(
            children: [
              Expanded(
                child: _buildPatientDetailItem(
                  details[8]['label']!,
                  details[8]['value']!,
                ),
              ),
              if (details.length > 9) ...[
                const SizedBox(width: 4),
                Expanded(
                  child: _buildPatientDetailItem(
                    details[9]['label']!,
                    details[9]['value']!,
                  ),
                ),
              ],
            ],
          ),
      ],
    );
  }

  Widget _buildPatientDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.5),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildVitalSignItem(String label, String value, IconData icon) {
    // Keep red icon but use patient details theme for borders/shadows
    const Color vitalSignColor = Color(0xFFEF4444);
    const Color patientThemeColor = Color(0xFF10B981);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAFBFC),
            const Color(0xFFF8F9FA),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.5),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: patientThemeColor.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      vitalSignColor.withOpacity(0.15),
                      vitalSignColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 12, color: vitalSignColor),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: value == 'No data available'
                  ? const Color(0xFF6B7280).withOpacity(0.6)
                  : const Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: value == 'No data available'
                  ? FontWeight.w500
                  : FontWeight.w600,
              letterSpacing: -0.2,
              fontStyle: value == 'No data available'
                  ? FontStyle.italic
                  : FontStyle.normal,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Helper method to build status pill
  Widget _buildStatusPill() {
    final status = _viewModel.appointmentDetails?.status ?? 'pending';

    // Determine color based on status
    Color statusColor;
    String statusText;
    switch (status.toLowerCase()) {
      case 'confirmed':
        statusColor = const Color(0xFF10B981);
        statusText = 'Confirmed';
        break;
      case 'completed':
        statusColor = const Color(0xFF6366F1);
        statusText = 'Completed';
        break;
      case 'cancelled':
        statusColor = const Color(0xFFEF4444);
        statusText = 'Cancelled';
        break;
      case 'pending':
      default:
        statusColor = const Color(0xFFF59E0B);
        statusText = 'Upcoming';
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Status',
          style: TextStyle(
            color: const Color(0xFF6B7280),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [statusColor, statusColor.withOpacity(0.8)],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: statusColor.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                statusText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Build editable booking details layout
  Widget _buildEditableBookingDetailsLayout() {
    return _buildEditableDetailsLayout([
      {'label': 'Token No', 'controller': _bookingAppointmentIdController},
      {'label': 'Booked On', 'controller': _bookingBookedOnController},
      {'label': 'Appointment Date', 'controller': _bookingDateController},
      {'label': 'Appointment Time', 'controller': _bookingTimeController},
      {'label': 'Doctor Assigned', 'controller': _bookingDoctorController},
      {'label': 'Department', 'controller': _bookingDepartmentController},
      {'label': 'Reason for Visit', 'controller': _bookingReasonController},
      {'label': 'Consultation Type', 'controller': _bookingTypeController},
    ]);
  }

  // Build editable patient details layout
  Widget _buildEditablePatientDetailsLayout() {
    return _buildEditablePatientDetailsLayoutWidget([
      {'label': 'Name', 'controller': _patientFirstNameController},
      {'label': 'Age', 'controller': _patientAgeController},
      {'label': 'Gender', 'controller': _patientGenderController},
      {'label': 'Email Address', 'controller': _patientEmailController},
      {'label': 'Contact Number', 'controller': _patientPhoneController},
      {'label': 'Address', 'controller': _patientAddressController},
      {'label': 'Blood Group', 'controller': _patientBloodGroupController},
      {'label': 'Smoking Status', 'controller': _patientSmokingController},
      {'label': 'Alcohol Use', 'controller': _patientAlcoholController},
      {'label': 'Height (cm)', 'controller': _patientHeightController},
    ]);
  }

  // Helper method to build editable details layout (3 columns for booking details)
  Widget _buildEditableDetailsLayout(List<Map<String, dynamic>> details) {
    if (details.length < 8) {
      // Fallback to 2 columns if fewer fields
      return Column(
        children: details
            .map(
              (detail) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _buildEditableDetailItem(
                  detail['label'] as String,
                  detail['controller'] as TextEditingController,
                ),
              ),
            )
            .toList(),
      );
    }

    return Column(
      children: [
        // First row - 3 fields
        Row(
          children: [
            Expanded(
              child: _buildEditableDetailItem(
                details[0]['label'] as String,
                details[0]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[1]['label'] as String,
                details[1]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[2]['label'] as String,
                details[2]['controller'] as TextEditingController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row - 3 fields
        Row(
          children: [
            Expanded(
              child: _buildEditableDetailItem(
                details[3]['label'] as String,
                details[3]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[4]['label'] as String,
                details[4]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[5]['label'] as String,
                details[5]['controller'] as TextEditingController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Third row - 2 fields (last row)
        Row(
          children: [
            Expanded(
              child: _buildEditableDetailItem(
                details[6]['label'] as String,
                details[6]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[7]['label'] as String,
                details[7]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: Container()), // Empty spacer for alignment
          ],
        ),
      ],
    );
  }

  // Helper method to build editable detail item (2 columns layout)
  Widget _buildEditableDetailItem(
    String label,
    TextEditingController controller,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, const Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build editable patient details layout (4 columns)
  Widget _buildEditablePatientDetailsLayoutWidget(
    List<Map<String, dynamic>> details,
  ) {
    return Column(
      children: [
        // First row
        Row(
          children: [
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[0]['label'] as String,
                details[0]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[1]['label'] as String,
                details[1]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[2]['label'] as String,
                details[2]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[3]['label'] as String,
                details[3]['controller'] as TextEditingController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row
        Row(
          children: [
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[4]['label'] as String,
                details[4]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[5]['label'] as String,
                details[5]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[6]['label'] as String,
                details[6]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildEditablePatientDetailItem(
                details[7]['label'] as String,
                details[7]['controller'] as TextEditingController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Third row - only 2 items now (removed Last Name, so 9 items total)
        if (details.length > 8)
          Row(
            children: [
              Expanded(
                child: _buildEditablePatientDetailItem(
                  details[8]['label'] as String,
                  details[8]['controller'] as TextEditingController,
                ),
              ),
              if (details.length > 9) ...[
                const SizedBox(width: 4),
                Expanded(
                  child: _buildEditablePatientDetailItem(
                    details[9]['label'] as String,
                    details[9]['controller'] as TextEditingController,
                  ),
                ),
              ],
            ],
          ),
      ],
    );
  }

  // Helper method to build editable patient detail item (4 columns layout)
  Widget _buildEditablePatientDetailItem(
    String label,
    TextEditingController controller,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, const Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build booking details layout
  Widget _buildBookingDetailsLayout() {
    final appointment = _viewModel.appointmentDetails;

    // Format dates
    String formatDate(String? dateTime) {
      if (dateTime == null) return 'N/A';
      try {
        // Handle format: "2025-10-18T00:00:00Z 13:30:00"
        final cleanDateTime = dateTime.split(' ')[0]; // Take date part
        final date = DateTime.parse(cleanDateTime);
        return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
      } catch (e) {
        return dateTime;
      }
    }

    // Format time
    String formatTime(String? dateTime) {
      if (dateTime == null) return 'N/A';
      try {
        // Handle format: "2025-10-18T00:00:00Z 13:30:00"
        final parts = dateTime.split(' ');
        if (parts.length > 1) {
          // Extract time part "13:30:00"
          final timeParts = parts[1].split(':');
          if (timeParts.length >= 2) {
            int hour = int.parse(timeParts[0]);
            int minute = int.parse(timeParts[1]);
            final period = hour >= 12 ? 'PM' : 'AM';
            hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
            return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
          }
        }
        // Fallback to standard parsing
        final date = DateTime.parse(dateTime);
        final hour = date.hour > 12
            ? date.hour - 12
            : (date.hour == 0 ? 12 : date.hour);
        final period = date.hour >= 12 ? 'PM' : 'AM';
        return '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $period';
      } catch (e) {
        return dateTime;
      }
    }

    return _buildDetailsLayout([
      {
        'label': 'Token No',
        'value': appointment?.tokenNumber?.toString() ?? 'N/A',
      },
      {'label': 'Booked On', 'value': formatDate(appointment?.createdAt)},
      {
        'label': 'Appointment Date',
        'value': formatDate(appointment?.appointmentDateTime),
      },
      {
        'label': 'Appointment Time',
        'value': formatTime(appointment?.appointmentDateTime),
      },
      {
        'label': 'Doctor Assigned',
        'value': _formatDoctorName(
          appointment?.doctorName ?? appointment?.doctor?.name ?? 'N/A',
        ),
      },
      {'label': 'Department', 'value': appointment?.department ?? 'N/A'},
      {'label': 'Reason for Visit', 'value': appointment?.notes ?? 'N/A'},
      {
        'label': 'Consultation Type',
        'value': _formatConsultationType(
          appointment?.consultationType ?? 'N/A',
        ),
      },
      {'label': 'Status', 'value': appointment?.status ?? 'N/A'},
    ]);
  }

  /// Build status section with display and update functionality
  Widget _buildStatusSection() {
    final appointment = _viewModel.appointmentDetails;
    if (appointment == null || appointment.status == null) {
      return const SizedBox.shrink();
    }

    final currentStatus = appointment.status!;
    final allowedStatuses = _viewModel.getAllowedStatuses(currentStatus);
    final isTerminalStatus = allowedStatuses.isEmpty;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, const Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE8EBF0).withOpacity(0.8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _getStatusColor(currentStatus).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: _getStatusColor(currentStatus),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Appointment Status',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D29),
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Current Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _getStatusColor(currentStatus).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _getStatusColor(currentStatus).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _getStatusColor(currentStatus),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatStatusLabel(currentStatus),
                  style: TextStyle(
                    color: _getStatusColor(currentStatus),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Status Update Section (if not terminal)
          if (!isTerminalStatus) ...[
            const SizedBox(height: 12),
            _buildStatusUpdateWidget(currentStatus, allowedStatuses),
          ] else ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 14,
                  color: const Color(0xFF6B7280).withOpacity(0.7),
                ),
                const SizedBox(width: 6),
                Text(
                  'Terminal status - cannot be changed',
                  style: TextStyle(
                    color: const Color(0xFF6B7280).withOpacity(0.7),
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // Status update state
  String? _selectedStatusForUpdate;
  final TextEditingController _statusNotesController = TextEditingController();
  bool _isUpdatingStatus = false;

  /// Build status update widget with dropdown and notes
  Widget _buildStatusUpdateWidget(
    String currentStatus,
    List<String> allowedStatuses,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Update Status',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedStatusForUpdate,
              isExpanded: true,
              hint: Text(
                'Select new status',
                style: TextStyle(
                  color: const Color(0xFF6B7280).withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
              items: allowedStatuses.map((status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _getStatusColor(status),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatStatusLabel(status),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF1A1D29),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: _isUpdatingStatus
                  ? null
                  : (value) {
                      setState(() {
                        _selectedStatusForUpdate = value;
                      });
                    },
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _statusNotesController,
          maxLines: 2,
          enabled: !_isUpdatingStatus,
          decoration: InputDecoration(
            hintText: 'Notes (optional)',
            hintStyle: TextStyle(
              color: const Color(0xFF6B7280).withOpacity(0.5),
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF6366F1),
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(fontSize: 12, color: Color(0xFF1A1D29)),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (_selectedStatusForUpdate == null || _isUpdatingStatus)
                ? null
                : () async {
                    final appointment = _viewModel.appointmentDetails;
                    if (appointment == null || appointment.id == null) {
                      return;
                    }

                    setState(() {
                      _isUpdatingStatus = true;
                    });

                    try {
                      final success = await _viewModel.updateAppointmentStatus(
                        appointmentId: appointment.id!,
                        clinicPatientId:
                            appointment.clinicPatientId ??
                            widget.clinicPatientId ??
                            '',
                        status: _selectedStatusForUpdate!,
                        notes: _statusNotesController.text.trim().isEmpty
                            ? null
                            : _statusNotesController.text.trim(),
                        clinicId: appointment.clinic?.id,
                      );

                      if (mounted) {
                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Status updated successfully to ${_formatStatusLabel(_selectedStatusForUpdate!)}',
                              ),
                              backgroundColor: const Color(0xFF10B981),
                            ),
                          );
                          _statusNotesController.clear();
                          setState(() {
                            _selectedStatusForUpdate = null;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _viewModel.errorMessage ??
                                    'Failed to update status',
                              ),
                              backgroundColor: const Color(0xFFEF4444),
                            ),
                          );
                        }
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: ${e.toString()}'),
                            backgroundColor: const Color(0xFFEF4444),
                          ),
                        );
                      }
                    } finally {
                      if (mounted) {
                        setState(() {
                          _isUpdatingStatus = false;
                        });
                      }
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: _isUpdatingStatus
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Update Status',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ],
    );
  }

  /// Get color for status badge
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return const Color(0xFF1976D2);
      case 'pending':
        return const Color(0xFFF57C00);
      case 'arrived':
        return const Color(0xFF7B1FA2);
      case 'in_consultation':
        return const Color(0xFF388E3C);
      case 'completed':
        return const Color(0xFF2E7D32);
      case 'cancelled':
        return const Color(0xFFC62828);
      case 'no_show':
        return const Color(0xFF616161);
      default:
        return const Color(0xFF6B7280);
    }
  }

  /// Format status label for display
  String _formatStatusLabel(String status) {
    return status
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  Widget _buildPatientDetailsSection(BuildContext context) {
    // Use local _viewModel directly instead of Consumer
    if (_viewModel.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_viewModel.errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            _viewModel.errorMessage!,
            style: const TextStyle(color: Colors.red, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final clinicPatient = _viewModel.clinicPatient;

    if (clinicPatient == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No patient details available.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      );
    }

    // ✅ Use your same logic to build layout
    final addressParts = <String>[
      if ((clinicPatient.address1 ?? '').isNotEmpty) clinicPatient.address1!,
      if ((clinicPatient.address2 ?? '').isNotEmpty) clinicPatient.address2!,
      if ((clinicPatient.district ?? '').isNotEmpty) clinicPatient.district!,
      if ((clinicPatient.state ?? '').isNotEmpty) clinicPatient.state!,
    ];
    final address = addressParts.isEmpty ? 'N/A' : addressParts.join(', ');

    return _buildPatientDetailsLayout([
      {'label': 'Name', 'value': clinicPatient.firstName},
      {'label': 'Age', 'value': clinicPatient.age?.toString() ?? 'N/A'},
      {'label': 'Gender', 'value': clinicPatient.gender ?? 'N/A'},
      {'label': 'Email Address', 'value': clinicPatient.email ?? 'N/A'},
      {'label': 'Contact Number', 'value': clinicPatient.phone},
      {'label': 'Address', 'value': address},
      {'label': 'Blood Group', 'value': clinicPatient.bloodGroup ?? 'N/A'},
      {
        'label': 'Smoking Status',
        'value': clinicPatient.smokingStatus ?? 'N/A',
      },
      {'label': 'Alcohol Use', 'value': clinicPatient.alcoholUse ?? 'N/A'},
      {
        'label': 'Height (cm)',
        'value': clinicPatient.heightCm?.toString() ?? 'N/A',
      },
    ]);
  }

  Widget _buildFooter() {
    return const Center(
      child: Text.rich(
        TextSpan(
          text: 'Copyright © 2025 ',
          style: TextStyle(color: Color(0xFF999999), fontSize: 12),
          children: [
            TextSpan(
              text: 'DrMe',
              style: TextStyle(
                color: Color(0xFFFF6B35),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: '. All rights reserved',
              style: TextStyle(color: Color(0xFF999999), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
