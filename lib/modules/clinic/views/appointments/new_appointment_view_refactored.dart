import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart'; // For extension methods
import 'package:drandme/modules/clinic/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Widgets
import 'widgets/consultation_details_section.dart';
import 'widgets/available_slots_section.dart';
import 'widgets/patient_search_section.dart';
import 'widgets/payment_method_section.dart';
import 'widgets/custom_button.dart';
import 'widgets/impressive_appointment_container.dart';
import 'widgets/auto_expanding_notes_field.dart';

// Dialogs
import 'dialogs/quick_patient_registration_dialog.dart';
import 'payment_confirmation_popup.dart';

// Helpers & Constants
import 'helpers/appointment_helpers.dart';
import 'constants/appointment_constants.dart';

/// Main appointment booking screen with responsive web and mobile layouts
/// Refactored for Web Performance & Production Optimizations
class NewAppointmentScreen extends StatefulWidget {
  final Function(String)? onNavigate;
  const NewAppointmentScreen({super.key, this.onNavigate});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  late NewAppointmentViewModel _viewModel;
  final TextEditingController searchController = TextEditingController();
  
  // ✅ Focus Nodes for keyboard navigation
  final FocusNode searchFocusNode = FocusNode();
  final FocusNode notesFocusNode = FocusNode();
  final FocusNode bookNowFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Initialize ViewModel once
    _viewModel = NewAppointmentViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    _viewModel.onNavigateCallback = widget.onNavigate; // ✅ Set the callback
    _viewModel.initialize();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    searchController.dispose();
    // ✅ Clean up focus nodes
    searchFocusNode.dispose();
    notesFocusNode.dispose();
    bookNowFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Optimization: Removed top-level Consumer to prevent full page rebuilds.
    // Using ChangeNotifierProvider.value to pass the existing VM instance.
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.enter): const _SubmitIntent(),
          LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.keyS): const _FocusSearchIntent(),
          LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.keyN): const _FocusNotesIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            _SubmitIntent: CallbackAction<_SubmitIntent>(
              onInvoke: (_) => _handleBookNow(context, _viewModel, _viewModel.onNavigateCallback),
            ),
            _FocusSearchIntent: CallbackAction<_FocusSearchIntent>(
              onInvoke: (_) => searchFocusNode.requestFocus(),
            ),
            _FocusNotesIntent: CallbackAction<_FocusNotesIntent>(
              onInvoke: (_) => notesFocusNode.requestFocus(),
            ),
          },
          child: Focus(
            autofocus: true,
            child: Container(
              color: const Color(0xFFF1F5F9), // Slate 100
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive logic
                  final isLargeScreen = constraints.maxWidth > 1200;
                  final isMobile = constraints.maxWidth < 600;
                  final scaleFactor = isLargeScreen ? 0.9 : 1.0;
      
                  if (isMobile) {
                    return _MobileLayout(
                      viewModel: _viewModel,
                      searchController: searchController,
                      scaleFactor: scaleFactor,
                      searchFocusNode: searchFocusNode,
                      notesFocusNode: notesFocusNode,
                    );
                  } else {
                    return _WebLayout(
                      viewModel: _viewModel,
                      searchController: searchController,
                      scaleFactor: scaleFactor,
                      searchFocusNode: searchFocusNode,
                      notesFocusNode: notesFocusNode,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Intents for keyboard shortcuts
class _SubmitIntent extends Intent { const _SubmitIntent(); }
class _FocusSearchIntent extends Intent { const _FocusSearchIntent(); }
class _FocusNotesIntent extends Intent { const _FocusNotesIntent(); }

/// Web Layout Structure
class _WebLayout extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final TextEditingController searchController;
  final double scaleFactor;
  final FocusNode searchFocusNode;
  final FocusNode notesFocusNode;

  const _WebLayout({
    required this.viewModel,
    required this.searchController,
    required this.scaleFactor,
    required this.searchFocusNode,
    required this.notesFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10 * scaleFactor),
      child: ImpressiveAppointmentContainer(
        scaleFactor: scaleFactor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Optimized Sections with scoped rebuilds
            _ConsultationWrapper(
              viewModel: viewModel,
              scaleFactor: scaleFactor,
            ),
            SizedBox(height: 6 * scaleFactor),

            _SlotsWrapper(viewModel: viewModel, scaleFactor: scaleFactor),
            SizedBox(height: 6 * scaleFactor),

            _PatientSearchWrapper(
              viewModel: viewModel,
              searchController: searchController,
              scaleFactor: scaleFactor,
              searchFocusNode: searchFocusNode,
            ),
            SizedBox(height: 6 * scaleFactor),

            _NotesWrapper(
              viewModel: viewModel, 
              scaleFactor: scaleFactor,
              focusNode: notesFocusNode,
            ),
            SizedBox(height: 6 * scaleFactor),

            _PaymentWrapper(viewModel: viewModel, scaleFactor: scaleFactor),
            SizedBox(height: 6 * scaleFactor),

            // Book Now Button
            Align(
              alignment: Alignment.centerLeft,
              child: _BookButtonWrapper(
                viewModel: viewModel,
                scaleFactor: scaleFactor,
                onNavigate: viewModel.onNavigateCallback ?? (context.findAncestorWidgetOfExactType<NewAppointmentScreen>()?.onNavigate),
              ),
            ),
            SizedBox(height: 8 * scaleFactor),

            _Footer(scaleFactor: scaleFactor),
          ],
        ),
      ),
    );
  }
}

/// Mobile Layout Structure
class _MobileLayout extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final TextEditingController searchController;
  final double scaleFactor;
  final FocusNode searchFocusNode;
  final FocusNode notesFocusNode;

  const _MobileLayout({
    required this.viewModel,
    required this.searchController,
    required this.scaleFactor,
    required this.searchFocusNode,
    required this.notesFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ConsultationWrapper(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            isMobile: true,
          ),
          SizedBox(height: 6 * scaleFactor),

          _SlotsWrapper(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            isMobile: true,
          ),
          SizedBox(height: 6 * scaleFactor),

          _PatientSearchWrapper(
            viewModel: viewModel,
            searchController: searchController,
            scaleFactor: scaleFactor,
            isMobile: true,
            searchFocusNode: searchFocusNode,
          ),
          SizedBox(height: 6 * scaleFactor),

          _NotesWrapper(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            isMobile: true,
            focusNode: notesFocusNode,
          ),
          SizedBox(height: 6 * scaleFactor),

          _PaymentWrapper(viewModel: viewModel, scaleFactor: scaleFactor),
          SizedBox(height: 6 * scaleFactor),

          _BookButtonWrapper(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            onNavigate: viewModel.onNavigateCallback ?? (context.findAncestorWidgetOfExactType<NewAppointmentScreen>()?.onNavigate),
          ),
          SizedBox(height: 8 * scaleFactor),

          _Footer(scaleFactor: scaleFactor),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PERFORMANCE WRAPPERS (Scoped Rebuilds)
// -----------------------------------------------------------------------------

class _ConsultationWrapper extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final bool isMobile;

  const _ConsultationWrapper({
    required this.viewModel, // used for event callbacks
    required this.scaleFactor,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Select only fields affecting consultation details UI
    context.select(
      (NewAppointmentViewModel vm) => (
        vm.selectedConsultationType,
        vm.selectedDepartmentId,
        vm.selectedDoctorObject,
        vm.clinicDoctors,
        vm.departments,
        vm.consultationTypesList,
        vm.isLoadingDoctors, // Rebuild when doctor loading state changes
        vm.noDepartmentSelectedYet, // Rebuild when first department is selected
      ),
    );

    return ConsultationDetailsSection(
      viewModel: viewModel,
      scaleFactor: scaleFactor,
      isMobile: isMobile,
    );
  }
}

class _SlotsWrapper extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final bool isMobile;

  const _SlotsWrapper({
    required this.viewModel,
    required this.scaleFactor,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Rebuild only when slots data or loading state changes
    context.select(
      (NewAppointmentViewModel vm) => (
        vm.isLoadingSlots,
        vm.groupedTimeSlots,
        vm.sessionSlotsResponse,
        vm.selectedSlotDate,
        vm.selectedSlotDetails,
        vm.isWalkIn, // Listen for walk-in mode toggle status
      ),
    );

    return AvailableSlotsSection(
      viewModel: viewModel,
      scaleFactor: scaleFactor,
      isMobile: isMobile,
      onPickDatePressed: () => _showDatePickerDialog(context, viewModel),
    );
  }
}

class _PatientSearchWrapper extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final TextEditingController searchController;
  final double scaleFactor;
  final bool isMobile;
  final FocusNode searchFocusNode;

  const _PatientSearchWrapper({
    required this.viewModel,
    required this.searchController,
    required this.scaleFactor,
    this.isMobile = false,
    required this.searchFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    // Rebuild on search results or selections
    context.select(
      (NewAppointmentViewModel vm) => (
        vm.clinicPatientSearchResults,
        vm.selectedClinicPatient,
        vm.searchType,
        vm.selectedCountryCode,
      ),
    );

    return PatientSearchSection(
      viewModel: viewModel,
      searchController: searchController,
      scaleFactor: scaleFactor,
      isMobile: isMobile,
      searchFocusNode: searchFocusNode,
      onAddNewPatient: () =>
          showQuickPatientRegistrationDialog(context, viewModel),
    );
  }
}

class _NotesWrapper extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final bool isMobile;
  final FocusNode focusNode;

  const _NotesWrapper({
    required this.viewModel,
    required this.scaleFactor,
    this.isMobile = false,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    // Optimized: Rebuild ONLY when notes string changes from external source
    // (though usually internal typing, but this keeps it consistent)
    final notes = context.select(
      (NewAppointmentViewModel vm) => vm.patientNotes,
    );

    return AutoExpandingNotesField(
      label: 'Reason or Add Notes',
      hint:
          'Add patient notes, reason for visit, or any additional information...',
      scaleFactor: scaleFactor,
      value: notes,
      onChanged: (value) => viewModel.setPatientNotes(value),
      isMobile: isMobile,
      focusNode: focusNode,
    );
  }
}

class _PaymentWrapper extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;

  const _PaymentWrapper({required this.viewModel, required this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    // Select data needed for visibility logic and payment UI
    final paymentData = context.select(
      (NewAppointmentViewModel vm) => (
        vm.selectedConsultationType,
        vm.selectedClinicPatient,
        vm.selectedDoctorObject,
        vm.selectedPaymentMethodEnum,
        vm.selectedDepartmentId,
        vm.isWalkIn, // Listen for walk-in mode for dynamic payment visibility
      ),
    );

    // Visibility Logic Logic
    final shouldShow = _shouldShowPayment(
      paymentData.$1, // type
      paymentData.$2, // patient
      paymentData.$3, // doctor
      paymentData.$5, // departmentId
    );

    if (!shouldShow) return const SizedBox.shrink();

    return PaymentMethodSection(viewModel: viewModel, scaleFactor: scaleFactor);
  }
}

class _BookButtonWrapper extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final Function(String)? onNavigate;

  const _BookButtonWrapper({
    required this.viewModel,
    required this.scaleFactor,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    // Rebuild only when loading state changes
    final isCreating = context.select(
      (NewAppointmentViewModel vm) => vm.isCreating,
    );

    return CustomButton(
      text: 'Book Now',
      onPressed: () => _handleBookNow(context, viewModel, onNavigate),
      isLoading: isCreating,
      scaleFactor: scaleFactor,
    );
  }
}

class _Footer extends StatelessWidget {
  final double scaleFactor;
  const _Footer({required this.scaleFactor});

  @override
  Widget build(BuildContext context) {
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
}

// -----------------------------------------------------------------------------
// HELPER METHODS
// -----------------------------------------------------------------------------

// Logic extracted for static access
bool _shouldShowPayment(
  String type,
  ClinicPatient? patient,
  dynamic doctor,
  String? departmentId,
) {
  if (!type.startsWith('follow-up')) return true;
  if (patient == null || doctor == null) return true;
  // Note: Using extension method from library
  return !patient.isEligibleFor(
    doctorId: (doctor.doctorId as String?) ?? '',
    departmentId: departmentId, // Null enables doctor-only matching if needed
  );
}

Future<void> _handleBookNow(
  BuildContext context,
  NewAppointmentViewModel viewModel,
  Function(String)? onNavigate,
) async {
  if (!_validateBooking(context, viewModel)) return;

  final isFreeFollowUp = !_shouldShowPayment(
    viewModel.selectedConsultationType,
    viewModel.selectedClinicPatient,
    viewModel.selectedDoctorObject,
    viewModel.selectedDepartmentId,
  );

  if (isFreeFollowUp) {
    await _createAppointment(context, viewModel, onNavigate: onNavigate, isFreeFollowUp: true);
    return;
  }

  // ALWAYS show the confirmation popup for all paid methods (Pay Now, Pay Later, Way Off)
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PaymentConfirmationPopup(
      viewModel: viewModel,
      onNavigate: onNavigate,
      parentContext: context, // ✅ Use the screen's context
    ),
  );
}

bool _validateBooking(BuildContext context, NewAppointmentViewModel viewModel) {
  if (viewModel.selectedClinicPatient == null) {
    AppointmentHelpers.showErrorSnackbar(
      context,
      AppointmentConstants.selectPatientError,
    );
    return false;
  }
  if (viewModel.selectedDepartment == 'Select Department' || 
      viewModel.selectedDepartmentId == null) {
    AppointmentHelpers.showErrorSnackbar(
      context,
      'Please select a Department',
    );
    return false;
  }
  if (viewModel.selectedDoctor == 'Select Doctor' || 
      viewModel.selectedDoctor.isEmpty) {
    AppointmentHelpers.showErrorSnackbar(
      context,
      AppointmentConstants.selectDoctorError,
    );
    return false;
  }
  // ✅ CRITICAL FIX: Skip slot validation if Walk-in mode is active OR available
  // If actively in Walk-in mode, skip validation
  if (viewModel.isWalkIn) {
    return true;
  }

  if (viewModel.selectedSlotDetails == null) {
    // If walk-in is available, let it pass so ViewModel can handle the auto-switch to Walk-in
    if (viewModel.walkinAvailable) {
      return true;
    }

    AppointmentHelpers.showErrorSnackbar(
      context,
      AppointmentConstants.selectSlotError,
    );
    return false;
  }
  return true;
}

Future<void> _createAppointment(
  BuildContext context,
  NewAppointmentViewModel viewModel, {
  bool isFreeFollowUp = false,
  Function(String)? onNavigate,
}) async {
  final result = await viewModel.createSimpleAppointment();
  if (result != null && context.mounted) {
    final message = isFreeFollowUp
        ? '${AppointmentConstants.followUpCreatedSuccess}${result.appointment.tokenNumber}'
        : '${AppointmentConstants.appointmentCreatedSuccess}${result.appointment.tokenNumber}';
    AppointmentHelpers.showSuccessSnackbar(context, message);
    
    // ✅ RESET FORM TO BLANK SLATE
    viewModel.resetForm();

    // REDIRECT TO LISTING PAGE
    if (onNavigate != null) {
      onNavigate('appointments_list');
    }
  } else if (viewModel.error.isNotEmpty && context.mounted) {
    AppointmentHelpers.showErrorSnackbar(context, '❌ ${viewModel.error}');
  }
}

Future<void> _showDatePickerDialog(
  BuildContext context,
  NewAppointmentViewModel viewModel,
) async {
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
