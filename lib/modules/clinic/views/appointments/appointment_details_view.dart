import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_details_viewmodel.dart';
import 'package:drandme/modules/clinic/views/appointments/reschedule_modal_view.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/appointment_history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/booking_mode_badge.dart';
import 'package:drandme/modules/clinic/models/receipt_model.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/receipt_action_buttons.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart' hide AppointmentHistoryItem;

// --- VISUAL CONSTANTS (Classy Slate) ---
const kBgColor = Color(0xFFF1F5F9); // Slate-100
const kCardColor = Colors.white;
const kPrimaryText = Color(0xFF1E293B); // Slate-900
const kSecondaryText = Color(0xFF64748B); // Slate-500
const kAccentColor = Color(0xFF000000); // Black (primary action color)
const kBlueColor = Color(0xFF3B82F6);
const kBorderColor = Color(0xFFE2E8F0); // Slate-200

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
  final List<String> _genderOptions = [
    'Male',
    'Female',
    'Other',
    'Prefer not to say',
  ];
  bool get _isEditingPatientDetails => _viewModel.isEditingPatientDetails;
  bool get _isEditingBookingDetails => _viewModel.isEditingBookingDetails;
  bool get _isEditingVitalSigns => _viewModel.isEditingVitalSigns;
  bool get _isEditingStatus => _viewModel.isEditingStatus;
  bool get _isVitalSignsExpanded => _viewModel.isVitalSignsExpanded;
  bool get _isSavingPatient => _viewModel.isSavingPatient;
  bool get _isSavingVitals => _viewModel.isSavingVitals;
  bool get _isUpdatingStatus => _viewModel.isUpdatingStatus;
  String? get _selectedStatusForUpdate => _viewModel.selectedStatusForUpdate;

  TextEditingController get _bookingAppointmentIdController =>
      _viewModel.bookingAppointmentIdController;
  TextEditingController get _bookingBookedOnController =>
      _viewModel.bookingBookedOnController;
  TextEditingController get _bookingDateController =>
      _viewModel.bookingDateController;
  TextEditingController get _bookingTimeController =>
      _viewModel.bookingTimeController;
  TextEditingController get _bookingDoctorController =>
      _viewModel.bookingDoctorController;
  TextEditingController get _bookingDepartmentController =>
      _viewModel.bookingDepartmentController;
  TextEditingController get _bookingReasonController =>
      _viewModel.bookingReasonController;
  TextEditingController get _bookingTypeController =>
      _viewModel.bookingTypeController;

  TextEditingController get _patientFirstNameController =>
      _viewModel.patientFirstNameController;
  TextEditingController get _patientAgeController =>
      _viewModel.patientAgeController;
  TextEditingController get _patientGenderController =>
      _viewModel.patientGenderController;
  TextEditingController get _patientEmailController =>
      _viewModel.patientEmailController;
  TextEditingController get _patientPhoneController =>
      _viewModel.patientPhoneController;
  TextEditingController get _patientAddressController =>
      _viewModel.patientAddressController;
  TextEditingController get _patientBloodGroupController =>
      _viewModel.patientBloodGroupController;
  TextEditingController get _patientHeightController =>
      _viewModel.patientHeightController;

  TextEditingController get _vitalTemperatureController =>
      _viewModel.vitalTemperatureController;
  TextEditingController get _vitalPulseController =>
      _viewModel.vitalPulseController;
  TextEditingController get _vitalRespiratoryRateController =>
      _viewModel.vitalRespiratoryRateController;
  TextEditingController get _vitalBloodPressureController =>
      _viewModel.vitalBloodPressureController;
  TextEditingController get _vitalSpO2Controller =>
      _viewModel.vitalSpO2Controller;
  TextEditingController get _vitalBloodSugarController =>
      _viewModel.vitalBloodSugarController;
  TextEditingController get _vitalWeightController =>
      _viewModel.vitalWeightController;
  TextEditingController get _vitalSmokingController =>
      _viewModel.vitalSmokingController;
  TextEditingController get _vitalAlcoholController =>
      _viewModel.vitalAlcoholController;
  TextEditingController get _vitalBMIController =>
      _viewModel.vitalBMIController;
  bool get _isRescheduleEnabled {
    final status = _viewModel.appointmentDetails?.status?.toLowerCase();
    return status == 'confirmed' || status == 'pending';
  }

  @override
  void initState() {
    super.initState();

    _viewModel = AppointmentDetailsViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.initialize(
        appointmentId: widget.appointmentId,
        clinicPatientId: widget.clinicPatientId,
      );
    });
  }

  Future<void> _savePatientDetails() async {
    final ageText = _patientAgeController.text.trim();
    if (ageText.isNotEmpty &&
        ageText != 'N/A' &&
        int.tryParse(ageText) == null) {
      _showPatientValidationError('Please enter a numeric age.');
      return;
    }

    final phoneText = _patientPhoneController.text.trim();
    if (phoneText.isNotEmpty && !_isPhoneNumberValid(phoneText)) {
      _showPatientValidationError('Please enter a valid phone number.');
      return;
    }

    final heightText = _patientHeightController.text.trim();
    if (heightText.isNotEmpty &&
        heightText != 'N/A' &&
        !_isNumericValue(heightText)) {
      _showPatientValidationError('Height must be a number.');
      return;
    }

    final result = await _viewModel.savePatientDetails();
    if (!mounted) return;

    final message = result.message ?? _viewModel.errorMessage;
    if (message == null || message.isEmpty) return;

    final isNeutral =
        !result.success && message.toLowerCase().contains('no changes');
    final backgroundColor = result.success
        ? const Color(0xFF10B981)
        : isNeutral
        ? const Color(0xFF6B7280)
        : const Color(0xFFEF4444);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }

  Future<void> _showCancelAppointmentDialog() async {
    final appointment = _viewModel.appointmentDetails;
    if (appointment == null) return;

    final reasonController = TextEditingController();
    final notesController = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444).withOpacity(0.1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Icon(
                Icons.cancel_outlined,
                color: Color(0xFFEF4444),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Cancel Appointment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D29),
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Are you sure you want to cancel this appointment? This action will free up the booked slot.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: reasonController,
                decoration: InputDecoration(
                  labelText: 'Reason (Optional)',
                  hintText: 'e.g., Patient requested cancellation',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  labelText: 'Notes (Optional)',
                  hintText: 'Additional details...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'No, Keep It',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              elevation: 0,
            ),
            child: const Text(
              'Yes, Cancel',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );

    if (result == true && mounted) {
      await _cancelAppointment(
        reason: reasonController.text.trim().isEmpty
            ? null
            : reasonController.text.trim(),
        notes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),
      );
    }
  }

  Future<void> _cancelAppointment({String? reason, String? notes}) async {
    final appointment = _viewModel.appointmentDetails;
    final appointmentId = appointment?.id;
    if (appointment == null || appointmentId == null || appointmentId.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Appointment ID not found.'),
            backgroundColor: Color(0xFFEF4444),
          ),
        );
      }
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: AppLoader(size: 20, strokeWidth: 2, color: Colors.white),
              ),
              SizedBox(width: 12),
              Text('Cancelling appointment...'),
            ],
          ),
          backgroundColor: Color(0xFF6366F1),
          duration: Duration(seconds: 2),
        ),
      );
    }

    try {
      final response = await _viewModel.cancelAppointment(
        appointmentId: appointmentId,
        reason: reason,
        notes: notes,
      );

      if (mounted) {
        if (response != null) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      response['message'] as String? ??
                          'Appointment cancelled successfully',
                    ),
                  ),
                ],
              ),
              backgroundColor: const Color(0xFF10B981),
              duration: const Duration(seconds: 3),
            ),
          );

          // Refresh dashboard appointment list
          _refreshDashboardList();

          // Show slot info if available
          if (response['slot_info'] != null) {
            final slotInfo = response['slot_info'] as Map<String, dynamic>;
            if (slotInfo['re_enabled'] == true) {
              Future.delayed(const Duration(seconds: 1), () {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        slotInfo['message'] as String? ??
                            'Slot has been freed up',
                      ),
                      backgroundColor: const Color(0xFF3B82F6),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              });
            }
          }
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _viewModel.errorMessage ?? 'Failed to cancel appointment',
              ),
              backgroundColor: const Color(0xFFEF4444),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error cancelling appointment: $e'),
            backgroundColor: const Color(0xFFEF4444),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Refresh dashboard appointment list after status update or cancellation
  /// Note: This is handled by the dashboard's .then() callback when navigating back
  /// We don't call the viewmodel directly here since it's not in the widget tree
  void _refreshDashboardList() {
    // Dashboard will refresh automatically when user navigates back
    // via the .then() callback in appointments_dashboard_view_refactored.dart
    print('✅ Status updated - dashboard will refresh on navigation back');
  }

  Future<void> _saveVitalSigns() async {
    final vitalInputs = {
      'Temperature': _vitalTemperatureController.text.trim(),
      'Pulse': _vitalPulseController.text.trim(),
      'Respiratory rate': _vitalRespiratoryRateController.text.trim(),
      'SpO₂': _vitalSpO2Controller.text.trim(),
      'Blood sugar': _vitalBloodSugarController.text.trim(),
      'Weight': _vitalWeightController.text.trim(),
    };

    for (final entry in vitalInputs.entries) {
      if (entry.value.isNotEmpty && !_isNumericValue(entry.value)) {
        _showVitalsValidationError('${entry.key} must be numeric.');
        return;
      }
    }

    final result = await _viewModel.saveVitalSigns();
    if (!mounted) return;

    final message = result.message ?? _viewModel.errorMessage;
    if (message == null || message.isEmpty) return;

    final isNeutral =
        !result.success && message.toLowerCase().contains('no vital signs');
    final backgroundColor = result.success
        ? const Color(0xFF10B981)
        : isNeutral
        ? const Color(0xFF6B7280)
        : const Color(0xFFEF4444);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppointmentDetailsViewModel>.value(
      value: _viewModel,
      child: Consumer<AppointmentDetailsViewModel>(
        builder: (context, __, child) {
          return Scaffold(
            backgroundColor: kBgColor,
            body: Container(color: kBgColor, child: _buildBody()),
          );
        },
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
        child: AppLoader(
          size: 60,
          strokeWidth: 4,
          color: kAccentColor,
          showMessage: true,
          message: 'Loading details...',
        ),
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
                backgroundColor: kAccentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                elevation: 0,
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
                        const SizedBox(height: 4),
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
        borderRadius: BorderRadius.circular(3),
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
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kAccentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: kAccentColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Booking Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryText,
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
                          borderRadius: BorderRadius.circular(3),
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
            ],
          ),
          const SizedBox(height: 6),
          // Status Update Section (when editing status)
          if (_isEditingStatus) ...[
            _buildStatusUpdateSection(),
            const SizedBox(height: 8),
          ],
          // Details Layout - show editable or read-only
          if (_isEditingBookingDetails)
            _buildEditableBookingDetailsLayout()
          else
            _buildBookingDetailsLayout(),
          const SizedBox(height: 8),
          // Action Buttons matching image exactly
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
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
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    icon: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(3),
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
                    borderRadius: BorderRadius.circular(3),
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
                    onPressed:
                        _viewModel.appointmentDetails?.status == 'cancelled' ||
                            _viewModel.appointmentDetails?.status ==
                                'completed' ||
                            _viewModel.appointmentDetails?.status == 'no_show'
                        ? null
                        : () => _showCancelAppointmentDialog(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFEF4444),
                      side: BorderSide.none,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      disabledForegroundColor: const Color(0xFF9CA3AF),
                      disabledBackgroundColor: const Color(0xFFF3F4F6),
                    ),
                    icon: const Icon(Icons.cancel_outlined, size: 16),
                    label: const Text(
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
                    color: _isRescheduleEnabled
                        ? Colors.black
                        : const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: _isRescheduleEnabled
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: ElevatedButton(
                    onPressed:
                        (_viewModel.appointmentDetails?.status?.toLowerCase() ==
                                'confirmed' ||
                            _viewModel.appointmentDetails?.status
                                    ?.toLowerCase() ==
                                'pending')
                        ? () async {
                            final result = await showGeneralDialog<bool>(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(
                                context,
                              ).modalBarrierDismissLabel,
                              barrierColor:
                                  Colors.transparent, // Handled by modal
                              transitionDuration: const Duration(
                                milliseconds: 300,
                              ),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                    return RescheduleModal(
                                      appointmentId: widget.appointmentId,
                                    );
                                  },
                            );

                            if (result == true &&
                                widget.appointmentId != null) {
                              await _viewModel.fetchAppointmentDetails(
                                widget.appointmentId!,
                              );
                            }
                          }
                        : null,
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: _isRescheduleEnabled
                              ? Colors.white
                              : const Color(0xFF9CA3AF),
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          elevation: 0,
                        ).copyWith(
                          overlayColor: MaterialStateProperty.all(
                            _isRescheduleEnabled
                                ? Colors.white.withOpacity(0.1)
                                : Colors.transparent,
                          ),
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.update_rounded, size: 16),
                        const SizedBox(width: 8),
                        const Text(
                          'Reschedule',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
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
                  onPressed: _viewModel.exitBookingEditing,
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
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: kAccentColor.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking details updated successfully'),
                          backgroundColor: Color(0xFF10B981),
                        ),
                      );
                      _viewModel.exitBookingEditing();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
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
          if (_viewModel.appointmentDetails != null) ...[
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFE2E8F0), height: 1),
            const SizedBox(height: 16),
          ],
        ],
    
      ),
    );
  }

  Widget _buildPatientDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 18,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Patient Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryText,
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
                        borderRadius: BorderRadius.circular(3),
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
                  borderRadius: BorderRadius.circular(3),
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
                    borderRadius: BorderRadius.circular(3),
                    onTap: _viewModel.togglePatientEditing,
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
                  onPressed: _viewModel.exitPatientEditing,
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
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: kAccentColor.withOpacity(0.2),
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
                        borderRadius: BorderRadius.circular(3),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kBlueColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.monitor_heart_rounded,
                        size: 18,
                        color: kBlueColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Vital Signs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryText,
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
                            colors: [kBlueColor, Color(0xFF60A5FA)],
                          ),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: kBlueColor.withOpacity(0.3),
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
                              colors: [kBlueColor, Color(0xFF60A5FA)],
                            )
                          : null,
                      color: _isEditingVitalSigns
                          ? null
                          : const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: _isEditingVitalSigns
                            ? Colors.transparent
                            : const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      boxShadow: _isEditingVitalSigns
                          ? [
                              BoxShadow(
                                color: kBlueColor.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(3),
                        onTap: _viewModel.toggleVitalSignsEditing,
                        child: Center(
                          child: Icon(
                            _isEditingVitalSigns
                                ? Icons.close_rounded
                                : Icons.edit_rounded,
                            size: 17,
                            color: _isEditingVitalSigns
                                ? Colors.white
                                : kBlueColor,
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
                          ? kBlueColor.withOpacity(0.1)
                          : const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: _isVitalSignsExpanded
                            ? kBlueColor.withOpacity(0.3)
                            : const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(3),
                        onTap: _viewModel.toggleVitalSignsExpansion,
                        child: Center(
                          child: Icon(
                            _isVitalSignsExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: _isVitalSignsExpanded
                                ? kBlueColor
                                : kBlueColor,
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
                    onPressed: _viewModel.exitVitalSignsEditing,
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
                      borderRadius: BorderRadius.circular(3),
                      gradient: const LinearGradient(
                        colors: [kBlueColor, Color(0xFF60A5FA)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kBlueColor.withOpacity(0.4),
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
                          borderRadius: BorderRadius.circular(3),
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
                color: kBgColor,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: kBorderColor, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_information_rounded,
                    size: 20,
                    color: kAccentColor.withOpacity(0.5),
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

    final items = [
      _buildVitalSignItem('Temperature', getVitalValue(_vitalTemperatureController), Icons.thermostat_rounded),
      _buildVitalSignItem('Pulse', getVitalValue(_vitalPulseController), Icons.favorite_rounded),
      _buildVitalSignItem('Respiratory Rate', getVitalValue(_vitalRespiratoryRateController), Icons.air_rounded),
      _buildVitalSignItem('Blood Pressure', getVitalValue(_vitalBloodPressureController), Icons.monitor_heart_rounded),
      _buildVitalSignItem('SpO₂', getVitalValue(_vitalSpO2Controller), Icons.water_drop_rounded),
      _buildVitalSignItem('Blood Sugar', getVitalValue(_vitalBloodSugarController), Icons.local_drink_rounded),
      _buildVitalSignItem('Weight', getVitalValue(_vitalWeightController), Icons.monitor_weight_rounded),
      _buildVitalSignItem('Smoking Status', getVitalValue(_vitalSmokingController), Icons.smoking_rooms_rounded),
      _buildVitalSignItem('Alcohol Use', getVitalValue(_vitalAlcoholController), Icons.local_bar_rounded),
      _buildVitalSignItem('BMI', getVitalValue(_vitalBMIController), Icons.speed_rounded),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth < 600 ? 2 : (constraints.maxWidth < 900 ? 3 : 4);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 2.2,
          ),
          itemBuilder: (context, index) => items[index],
        );
      },
    );
  }

  Widget _buildEditableVitalSignsContent() {
    final items = [
      _buildEditableVitalSignItem('Temperature', _vitalTemperatureController, Icons.thermostat_rounded),
      _buildEditableVitalSignItem('Pulse', _vitalPulseController, Icons.favorite_rounded),
      _buildEditableVitalSignItem('Respiratory Rate', _vitalRespiratoryRateController, Icons.air_rounded),
      _buildEditableVitalSignItem('Blood Pressure', _vitalBloodPressureController, Icons.monitor_heart_rounded),
      _buildEditableVitalSignItem('SpO₂', _vitalSpO2Controller, Icons.water_drop_rounded),
      _buildEditableVitalSignItem('Blood Sugar', _vitalBloodSugarController, Icons.local_drink_rounded),
      _buildEditableVitalSignItem('Weight', _vitalWeightController, Icons.monitor_weight_rounded),
      _buildEditableVitalSignItem('Smoking Status', _vitalSmokingController, Icons.smoking_rooms_rounded),
      _buildEditableVitalSignItem('Alcohol Use', _vitalAlcoholController, Icons.local_bar_rounded),
      _buildEditableVitalSignItem('BMI', _vitalBMIController, Icons.speed_rounded),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth < 600 ? 2 : (constraints.maxWidth < 900 ? 3 : 4);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 2.0, // Slightly more space for input
          ),
          itemBuilder: (context, index) => items[index],
        );
      },
    );
  }

  Widget _buildEditableVitalSignItem(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    // Premium Blue/Indigo theme
    const Color vitalSignColor = kBlueColor;
    const Color patientThemeColor = Color(0xFF10B981);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(3),
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
                  borderRadius: BorderRadius.circular(3),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Icon(
                  Icons.history_rounded,
                  size: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Appointment History',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryText,
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
                  borderRadius: BorderRadius.circular(3),
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

    // Get doctor name from history item or current appointment
    String doctorName = appointment.doctorName ?? 'N/A';
    if (isHighlighted) {
      final currentAppointment = _viewModel.appointmentDetails;
      doctorName = currentAppointment?.doctorName ??
          currentAppointment?.doctor?.name ??
          appointment.doctorName ??
          'N/A';
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
                    borderRadius: BorderRadius.circular(3),
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
                borderRadius: BorderRadius.circular(3),
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
                          borderRadius: BorderRadius.circular(3),
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
                            borderRadius: BorderRadius.circular(3),
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
                            _viewModel.formatDoctorName(doctorName),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: kBorderColor),
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
        borderRadius: BorderRadius.circular(3),
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
    // Premium Blue/Indigo theme
    const Color vitalSignColor = kBlueColor;
    const Color patientThemeColor = Color(0xFF10B981);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: kBorderColor),
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
                  borderRadius: BorderRadius.circular(3),
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
    final appointment = _viewModel.appointmentDetails;
    final status = appointment?.status ?? 'pending';
    final allowedStatuses = _viewModel.getAllowedStatuses(status);
    final isTerminalStatus = allowedStatuses.isEmpty;

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
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(3),
            onTap: isTerminalStatus ? null : _viewModel.toggleStatusEditing,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: _isEditingStatus ? kAccentColor : statusColor,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: (_isEditingStatus ? kAccentColor : statusColor)
                        .withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
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
                  if (!isTerminalStatus) ...[
                    const SizedBox(width: 4),
                    Icon(
                      _isEditingStatus
                          ? Icons.close_rounded
                          : Icons.edit_rounded,
                      size: 12,
                      color: Colors.white,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (appointment?.bookingMode == 'walk_in') ...[
          const SizedBox(width: 8),
          const BookingModeBadge(bookingMode: 'walk_in', scaleFactor: 1.0),
        ],
      ],
    );
  }

  // Build editable booking details layout
  Widget _buildEditableBookingDetailsLayout() {
    return _buildEditableDetailsLayout([
      {
        'label': 'Token No',
        'controller': _bookingAppointmentIdController,
        'readOnly': true,
      },
      {
        'label': 'Booked On',
        'controller': _bookingBookedOnController,
        'readOnly': true,
      },
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
                  readOnly: detail['readOnly'] as bool? ?? false,
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
                readOnly: details[0]['readOnly'] as bool? ?? false,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[1]['label'] as String,
                details[1]['controller'] as TextEditingController,
                readOnly: details[1]['readOnly'] as bool? ?? false,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[2]['label'] as String,
                details[2]['controller'] as TextEditingController,
                readOnly: details[2]['readOnly'] as bool? ?? false,
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
                readOnly: details[3]['readOnly'] as bool? ?? false,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[4]['label'] as String,
                details[4]['controller'] as TextEditingController,
                readOnly: details[4]['readOnly'] as bool? ?? false,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[5]['label'] as String,
                details[5]['controller'] as TextEditingController,
                readOnly: details[5]['readOnly'] as bool? ?? false,
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
                readOnly: details[6]['readOnly'] as bool? ?? false,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildEditableDetailItem(
                details[7]['label'] as String,
                details[7]['controller'] as TextEditingController,
                readOnly: details[7]['readOnly'] as bool? ?? false,
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
    TextEditingController controller, {
    bool readOnly = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: readOnly ? const Color(0xFFF3F4F6) : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: readOnly ? const Color(0xFFD1D5DB) : const Color(0xFFE8EBF0),
        ),
        boxShadow: readOnly
            ? null
            : [
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
            readOnly: readOnly,
            style: TextStyle(
              color: readOnly
                  ? const Color(0xFF4B5563)
                  : const Color(0xFF1A1D29),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
            decoration: const InputDecoration(
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
              child: _buildFieldForPatientDetail(
                details[0]['label'] as String,
                details[0]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildFieldForPatientDetail(
                details[1]['label'] as String,
                details[1]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildFieldForPatientDetail(
                details[2]['label'] as String,
                details[2]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildFieldForPatientDetail(
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
              child: _buildFieldForPatientDetail(
                details[4]['label'] as String,
                details[4]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildFieldForPatientDetail(
                details[5]['label'] as String,
                details[5]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildFieldForPatientDetail(
                details[6]['label'] as String,
                details[6]['controller'] as TextEditingController,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _buildFieldForPatientDetail(
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
                child: _buildFieldForPatientDetail(
                  details[8]['label'] as String,
                  details[8]['controller'] as TextEditingController,
                ),
              ),
              if (details.length > 9) ...[
                const SizedBox(width: 4),
                Expanded(
                  child: _buildFieldForPatientDetail(
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
  Widget _buildFieldForPatientDetail(
    String label,
    TextEditingController controller,
  ) {
    if (label.toLowerCase() == 'gender') {
      return _buildGenderDropdown(controller);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, const Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(3),
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

  Widget _buildGenderDropdown(TextEditingController controller) {
    final currentValue =
        controller.text.isNotEmpty && _genderOptions.contains(controller.text)
        ? controller.text
        : null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, const Color(0xFFFAFBFC)],
        ),
        borderRadius: BorderRadius.circular(3),
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
            'Gender',
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            value: currentValue,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
            items: _genderOptions
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(
                      option,
                      style: const TextStyle(
                        color: Color(0xFF1A1D29),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.text = value;
              }
            },
          ),
        ],
      ),
    );
  }

  bool _isPhoneNumberValid(String phone) {
    final digits = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    return digits.length >= 7;
  }

  void _showPatientValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFEF4444),
      ),
    );
  }

  bool _isNumericValue(String value) {
    return double.tryParse(value) != null;
  }

  void _showVitalsValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFEF4444),
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
        'value': appointment?.displayToken ?? appointment?.tokenNumber?.toString() ?? 'N/A',
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
        'value': _viewModel.formatDoctorName(
          appointment?.doctorName ?? appointment?.doctor?.name ?? 'N/A',
        ),
      },
      {'label': 'Department', 'value': appointment?.department ?? 'N/A'},
      {'label': 'Reason for Visit', 'value': appointment?.notes ?? 'N/A'},
      {
        'label': 'Consultation Type',
        'value': _viewModel.formatConsultationType(
          appointment?.consultationType ?? 'N/A',
        ),
      },
      {'label': 'Queue Position', 'value': appointment?.queuePosition?.toString() ?? 'N/A'},
      {'label': 'Status', 'value': appointment?.status ?? 'N/A'},
    ]);
  }

  /// Build status update section (shown when editing status)
  Widget _buildStatusUpdateSection() {
    final appointment = _viewModel.appointmentDetails;
    if (appointment == null || appointment.status == null) {
      return const SizedBox.shrink();
    }

    final currentStatus = appointment.status!;
    final allowedStatuses = _viewModel.getAllowedStatuses(currentStatus);
    final isTerminalStatus = allowedStatuses.isEmpty;

    if (isTerminalStatus) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _buildStatusUpdateWidget(currentStatus, allowedStatuses),
    );
  }

  /// Build status update widget with compact dropdown (auto-updates on selection)
  Widget _buildStatusUpdateWidget(
    String currentStatus,
    List<String> allowedStatuses,
  ) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: kBgColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: kBorderColor, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedStatusForUpdate,
                isExpanded: true,
                isDense: true,
                hint: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _getStatusColor(currentStatus),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Change status',
                      style: TextStyle(
                        color: const Color(0xFF6B7280).withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                items: allowedStatuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _getStatusColor(status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _viewModel.formatStatusLabel(status),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF1A1D29),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: _isUpdatingStatus
                    ? null
                    : (value) async {
                        if (value == null) return;

                        final appointment = _viewModel.appointmentDetails;
                        if (appointment == null || appointment.id == null) {
                          return;
                        }

                        final result = await _viewModel.changeStatus(value);
                        if (!mounted) return;

                        if (result.success) {
                          _refreshDashboardList();
                          if (mounted) {
                            _showSuccessDialog(
                              result.message ?? 'Status updated successfully',
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                result.message ??
                                    _viewModel.errorMessage ??
                                    'Failed to update status',
                              ),
                              backgroundColor: const Color(0xFFEF4444),
                            ),
                          );
                        }
                      },
                icon: _isUpdatingStatus
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF6366F1),
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
              ),
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

  void _showSuccessDialog(String message) {
    final appointment = _viewModel.appointmentDetails;
    final patientName = _viewModel.clinicPatient?.firstName ?? 'Patient';
    final status = appointment?.status ?? 'Updated';
    final token = appointment?.displayToken ?? appointment?.tokenNumber?.toString() ?? 'N/A';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success Icon with glow
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF10B981),
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Success!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E293B),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              
              // Structured detail model
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    _buildSuccessRow('Patient', patientName),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(height: 1, color: Color(0xFFE2E8F0)),
                    ),
                    _buildSuccessRow('Token', '#$token'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(height: 1, color: Color(0xFFE2E8F0)),
                    ),
                    _buildSuccessRow('New Status', _viewModel.formatStatusLabel(status)),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

}
