import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart'; // For extension methods
import 'package:a/modules/clinic/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Widgets
import 'widgets/consultation_details_section.dart';
import 'widgets/available_slots_section.dart';
import 'widgets/patient_search_section.dart';
import 'widgets/payment_method_section.dart';
import 'widgets/unified_button.dart';
import 'widgets/impressive_appointment_container.dart';
import 'widgets/auto_expanding_notes_field.dart';

// Dialogs
import 'dialogs/quick_patient_registration_dialog.dart';
import 'payment_confirmation_popup.dart';

// Helpers & Constants
import 'helpers/appointment_helpers.dart';
import 'constants/appointment_constants.dart';

/// Main appointment booking screen with responsive web and mobile layouts
class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  late NewAppointmentViewModel _viewModel;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = NewAppointmentViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    _viewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<NewAppointmentViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppointmentConstants.backgroundColor,
            body: LayoutBuilder(
              builder: (context, constraints) {
                // Enhanced responsive breakpoints
                final isMobile = constraints.maxWidth < 600;
                final isTablet =
                    constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
                final isDesktop = constraints.maxWidth >= 1024;

                // Scale factor for very large screens
                final scaleFactor = constraints.maxWidth > 1400 ? 0.9 : 1.0;

                if (isMobile) {
                  return _buildMobileLayout(viewModel, scaleFactor);
                } else if (isTablet) {
                  return _buildTabletLayout(viewModel, scaleFactor);
                } else {
                  return _buildWebLayout(viewModel, scaleFactor, isDesktop);
                }
              },
            ),
          );
        },
      ),
    );
  }

  /// Build mobile layout (vertical scrolling)
  Widget _buildMobileLayout(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle('New Appointments', scaleFactor, isMobile: true),
          SizedBox(height: 6 * scaleFactor),

          // Consultation Details Section
          ConsultationDetailsSection(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            isMobile: true,
          ),
          SizedBox(height: 6 * scaleFactor),

          // Available Slots Section
          AvailableSlotsSection(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            isMobile: true,
            onPickDatePressed: () => _showDatePickerDialog(viewModel),
          ),
          SizedBox(height: 6 * scaleFactor),

          // Search Patient Section
          PatientSearchSection(
            viewModel: viewModel,
            searchController: searchController,
            scaleFactor: scaleFactor,
            isMobile: true,
            onAddNewPatient: () =>
                showQuickPatientRegistrationDialog(context, viewModel),
          ),
          SizedBox(height: 6 * scaleFactor),

          // Notes/Reason Section
          AutoExpandingNotesField(
            label: 'Reason or Add Notes',
            hint:
                'Add patient notes, reason for visit, or any additional information...',
            scaleFactor: scaleFactor,
            value: viewModel.patientNotes,
            onChanged: (value) => viewModel.setPatientNotes(value),
            isMobile: true,
          ),
          SizedBox(height: 6 * scaleFactor),

          // Payment Method Section (conditional) - moved closer to Book Now button
          if (_shouldShowPayment(viewModel)) ...[
            PaymentMethodSection(
              viewModel: viewModel,
              scaleFactor: scaleFactor,
            ),
            SizedBox(height: 6 * scaleFactor),
          ],

          // Book Now Button using unified button
          UnifiedButton.bookNow(
            onPressed: () => _handleBookNow(viewModel),
            scaleFactor: scaleFactor,
            isLoading: viewModel.isCreating,
          ),
          SizedBox(height: 8 * scaleFactor),

          // Footer
          _buildFooter(),
        ],
      ),
    );
  }

  /// Build tablet layout (optimized for tablets)
  Widget _buildTabletLayout(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12 * scaleFactor),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('New Appointments', scaleFactor, isMobile: false),
            SizedBox(height: 8 * scaleFactor),

            // Consultation Details Section
            ConsultationDetailsSection(
              viewModel: viewModel,
              scaleFactor: scaleFactor,
              isMobile: false,
            ),
            SizedBox(height: 8 * scaleFactor),

            // Available Slots Section
            AvailableSlotsSection(
              viewModel: viewModel,
              scaleFactor: scaleFactor,
              isMobile: false,
              onPickDatePressed: () => _showDatePickerDialog(viewModel),
            ),
            SizedBox(height: 8 * scaleFactor),

            // Search Patient Section
            PatientSearchSection(
              viewModel: viewModel,
              searchController: searchController,
              scaleFactor: scaleFactor,
              isMobile: false,
              onAddNewPatient: () =>
                  showQuickPatientRegistrationDialog(context, viewModel),
            ),
            SizedBox(height: 8 * scaleFactor),

            // Notes/Reason Section
            AutoExpandingNotesField(
              label: 'Reason or Add Notes',
              hint:
                  'Add patient notes, reason for visit, or any additional information...',
              scaleFactor: scaleFactor,
              value: viewModel.patientNotes,
              onChanged: (value) => viewModel.setPatientNotes(value),
              isMobile: false,
            ),
            SizedBox(height: 8 * scaleFactor),

            // Payment Method Section (conditional)
            if (_shouldShowPayment(viewModel)) ...[
              PaymentMethodSection(
                viewModel: viewModel,
                scaleFactor: scaleFactor,
              ),
              SizedBox(height: 8 * scaleFactor),
            ],

            // Book Now Button using unified button
            UnifiedButton.bookNow(
              onPressed: () => _handleBookNow(viewModel),
              scaleFactor: scaleFactor,
              isLoading: viewModel.isCreating,
            ),
            SizedBox(height: 10 * scaleFactor),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  /// Build web layout (horizontal sections with impressive container)
  Widget _buildWebLayout(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
    bool isDesktop,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10 * scaleFactor),
      child: ImpressiveAppointmentContainer(
        scaleFactor: scaleFactor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('New Appointments', scaleFactor),
            SizedBox(height: 6 * scaleFactor),

            // Consultation Details Section
            ConsultationDetailsSection(
              viewModel: viewModel,
              scaleFactor: scaleFactor,
            ),
            SizedBox(height: 6 * scaleFactor),

            // Available Slots Section
            AvailableSlotsSection(
              viewModel: viewModel,
              scaleFactor: scaleFactor,
              onPickDatePressed: () => _showDatePickerDialog(viewModel),
            ),
            SizedBox(height: 6 * scaleFactor),

            // Search Patient Section
            PatientSearchSection(
              viewModel: viewModel,
              searchController: searchController,
              scaleFactor: scaleFactor,
              onAddNewPatient: () =>
                  showQuickPatientRegistrationDialog(context, viewModel),
            ),
            SizedBox(height: 6 * scaleFactor),

            // Notes/Reason Section
            AutoExpandingNotesField(
              label: 'Reason or Add Notes',
              hint:
                  'Add patient notes, reason for visit, or any additional information...',
              scaleFactor: scaleFactor,
              value: viewModel.patientNotes,
              onChanged: (value) => viewModel.setPatientNotes(value),
              isMobile: false,
            ),
            SizedBox(height: 6 * scaleFactor),

            // Payment Method Section (conditional) - moved closer to Book Now button
            if (_shouldShowPayment(viewModel)) ...[
              PaymentMethodSection(
                viewModel: viewModel,
                scaleFactor: scaleFactor,
              ),
              SizedBox(height: 6 * scaleFactor),
            ],

            // Book Now Button using unified button
            Align(
              alignment: Alignment.centerLeft,
              child: UnifiedButton.bookNow(
                onPressed: () => _handleBookNow(viewModel),
                scaleFactor: scaleFactor,
                isLoading: viewModel.isCreating,
              ),
            ),
            SizedBox(height: 8 * scaleFactor),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  /// Build page title with impressive minimal styling
  Widget _buildTitle(
    String title,
    double scaleFactor, {
    bool isMobile = false,
  }) {
    return Row(
      children: [
        Container(
          width: 4,
          height: (isMobile ? 22 : 28) * scaleFactor,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFEF4444),
                Color(0xFFDC2626),
              ], // Changed from purple to red
            ),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFFEF4444,
                ).withOpacity(0.4), // Changed from purple to red
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(width: 10 * scaleFactor),
        Text(
          title,
          style: TextStyle(
            fontSize: (isMobile ? 18 : 24) * scaleFactor,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF0F172A),
            letterSpacing: 0.8,
            shadows: [
              Shadow(
                color: const Color(
                  0xFFEF4444,
                ).withOpacity(0.2), // Changed from purple to red
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build footer
  Widget _buildFooter() {
    return const Center(
      child: Text(
        AppointmentConstants.footerText,
        style: TextStyle(
          color: AppointmentConstants.textHintColor,
          fontSize: 12,
        ),
      ),
    );
  }

  /// Check if payment section should be shown
  /// Hide payment only for FREE follow-ups (in eligible_follow_ups array)
  bool _shouldShowPayment(NewAppointmentViewModel viewModel) {
    if (!viewModel.selectedConsultationType.startsWith('follow-up')) {
      return true; // Always show for regular appointments
    }

    if (viewModel.selectedClinicPatient == null ||
        viewModel.selectedDoctorObject == null) {
      return true; // Show if patient or doctor not selected yet
    }

    // Check if patient is eligible for free follow-up
    final isEligible = viewModel.selectedClinicPatient!.isEligibleFor(
      doctorId: viewModel.selectedDoctorObject!.doctorId!,
      departmentId: viewModel.selectedDepartmentId,
    );

    return !isEligible; // Hide payment only if truly eligible
  }

  /// Handle book now button press
  Future<void> _handleBookNow(NewAppointmentViewModel viewModel) async {
    // Validate required selections
    if (!_validateBooking(viewModel)) {
      return;
    }

    // Check if FREE follow-up (no payment needed)
    final isFreeFollowUp =
        viewModel.selectedConsultationType.startsWith('follow-up') &&
        (viewModel.selectedClinicPatient?.followUpEligibility?.isFree ?? false);

    // For FREE follow-up, create directly (no payment required)
    if (isFreeFollowUp) {
      await _createAppointment(viewModel, isFreeFollowUp: true);
      return;
    }

    // For Pay Later and Way Off, create appointment directly (no popup)
    if (viewModel.selectedPaymentMethodEnum == PaymentMethod.payLater ||
        viewModel.selectedPaymentMethodEnum == PaymentMethod.wayOff) {
      await _createAppointment(viewModel);
      return;
    }

    // For Pay Now, show payment confirmation popup
    showDialog(
      context: context,
      builder: (context) => PaymentConfirmationPopup(viewModel: viewModel),
    );
  }

  /// Validate booking requirements
  bool _validateBooking(NewAppointmentViewModel viewModel) {
    if (viewModel.selectedClinicPatient == null) {
      AppointmentHelpers.showErrorSnackbar(
        context,
        AppointmentConstants.selectPatientError,
      );
      return false;
    }

    if (viewModel.selectedDoctor.isEmpty) {
      AppointmentHelpers.showErrorSnackbar(
        context,
        AppointmentConstants.selectDoctorError,
      );
      return false;
    }

    if (viewModel.selectedSlotDetails == null) {
      AppointmentHelpers.showErrorSnackbar(
        context,
        AppointmentConstants.selectSlotError,
      );
      return false;
    }

    return true;
  }

  /// Create appointment and show result
  Future<void> _createAppointment(
    NewAppointmentViewModel viewModel, {
    bool isFreeFollowUp = false,
  }) async {
    final result = await viewModel.createSimpleAppointment();

    if (result != null && mounted) {
      final message = isFreeFollowUp
          ? '${AppointmentConstants.followUpCreatedSuccess}${result.appointment.tokenNumber}'
          : '${AppointmentConstants.appointmentCreatedSuccess}${result.appointment.tokenNumber}';

      AppointmentHelpers.showSuccessSnackbar(context, message);
    } else if (viewModel.error.isNotEmpty && mounted) {
      AppointmentHelpers.showErrorSnackbar(context, '❌ ${viewModel.error}');
    }
  }

  /// Show date picker dialog
  Future<void> _showDatePickerDialog(NewAppointmentViewModel viewModel) async {
    final picked = await AppointmentHelpers.showDatePickerDialog(
      context: context,
      initialDate: viewModel.selectedSlotDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: AppointmentConstants.maxDateRangeInDays),
      ),
    );

    if (picked != null) {
      viewModel.navigateToMonth(picked);
      viewModel.selectSlotDate(picked);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    searchController.dispose();
    super.dispose();
  }
}
