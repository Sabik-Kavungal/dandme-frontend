import 'package:drandme/modules/clinic/models/clinic_model.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:drandme/modules/clinic/views/appointments/appointment_details_view.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/appointment_list_item_model.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/utils/app_helpers.dart';

// Reusable widgets
import 'widgets/dashboard_summary_section.dart';
import 'widgets/dashboard_table_controls.dart';
import 'widgets/dashboard_pagination.dart';
import 'widgets/dashboard_status_chip.dart';
import 'widgets/dashboard_consultation_pill.dart';
import 'widgets/dashboard_patient_cell.dart';
import 'widgets/dashboard_fee_cell.dart';
import 'widgets/beautiful_table_container.dart';
import 'widgets/booking_mode_badge.dart';

// Dialogs
import 'dialogs/quick_patient_registration_dialog.dart';
import 'dialogs/existing_payment_dialog.dart';
import 'payment_confirmation_popup.dart';

// Models
import 'package:drandme/modules/clinic/models/payment_method_model.dart';

import 'package:drandme/core/services/pdf_receipt_service.dart';
import 'package:drandme/modules/clinic/models/receipt_model.dart';

// Constants & Helpers
import 'constants/dashboard_constants.dart';
import 'helpers/dashboard_helpers.dart';

/// Main appointments dashboard with responsive design
/// Optimized for Web Performance:
/// - Lazy rendering for lists (Slivers)
/// - Minimized shadows for GPU efficiency
/// - Memoized/Optimized date parsing
/// - Granular rebuilds where possible
/// - Strategic RepaintBoundaries
class AppointmentsDashboard extends StatefulWidget {
  final Function(String)? onNavigate;

  const AppointmentsDashboard({super.key, this.onNavigate});

  @override
  State<AppointmentsDashboard> createState() => _AppointmentsDashboardState();
}

class _AppointmentsDashboardState extends State<AppointmentsDashboard> {
  AppointmentDashboardViewModel? _viewModel;
  bool _isLocalViewModel = false;

  VoidCallback? get _newAppointmentCallback => widget.onNavigate == null
      ? null
      : () => widget.onNavigate!('new_appointment');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_viewModel == null) {
      try {
        // Attempt to find existing provider (e.g. from ClinicModuleView)
        _viewModel = Provider.of<AppointmentDashboardViewModel>(context);
        _isLocalViewModel = false;
      } catch (e) {
        // If not found, create a local instance (e.g. when navigating directly via GoRouter)
        final authVM = Provider.of<AuthViewModel>(context, listen: false);
        _viewModel = AppointmentDashboardViewModel(authVM);
        _isLocalViewModel = true;

        // Initialize local viewmodel
        _viewModel!.initializeSimpleDashboard();
      }
    }

    // Ensure data is loaded if not already
    if (_viewModel != null &&
        !_viewModel!.isInitialized &&
        !_viewModel!.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _viewModel!.initializeSimpleDashboard();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_viewModel == null) return const SizedBox.shrink();

    // Wrap in Material to provide context for sub-widgets (InkWell, IconButton, etc.)
    Widget contentWithMaterial = Material(
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (DashboardHelpers.isMobile(constraints)) {
            return const _MobileDashboardLayout();
          } else {
            return const _WebDashboardLayout();
          }
        },
      ),
    );

    if (_isLocalViewModel) {
      return ChangeNotifierProvider<AppointmentDashboardViewModel>.value(
        value: _viewModel!,
        child: contentWithMaterial,
      );
    }

    return contentWithMaterial;
  }

  /// Show date picker dialog
  Future<void> _showDatePicker(AppointmentDashboardViewModel viewModel) async {
    final picked = await DashboardHelpers.showDatePickerDialog(
      context: context,
      initialDate: viewModel.selectedDate != null
          ? DateTime.parse(viewModel.selectedDate!)
          : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      final formattedDate =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      viewModel.setDateFilter(formattedDate);
    }
  }

  void _handleNavigation(
    BuildContext context,
    AppointmentListItem appointment,
    AppointmentDashboardViewModel viewModel,
  ) {
    if (appointment.id.isEmpty) return;

    // Explicit access with fallbacks
    String? clinicPatientId =
        appointment.clinicPatientId ?? appointment.patientId;

    if (widget.onNavigate != null) {
      final patientIdPart = clinicPatientId ?? '';
      final navigationPayload =
          'appointment_details:${appointment.id}|$patientIdPart';
      widget.onNavigate!(navigationPayload);
      viewModel.loadSimpleAppointments(refresh: true);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentDetailsScreen(
          appointmentId: appointment.id,
          clinicPatientId: clinicPatientId ?? '',
        ),
      ),
    ).then((_) {
      viewModel.loadSimpleAppointments(refresh: true);
      viewModel.loadSummary();
    });
  }

  @override
  void dispose() {
    if (_isLocalViewModel) {
      _viewModel?.dispose();
    }
    super.dispose();
  }

  /// ✅ New: Handle Pay Now from anywhere in the dashboard
  void _handlePayNow(BuildContext context, AppointmentListItem appointment) {
    if (_viewModel == null) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ExistingPaymentDialog(
        appointment: appointment,
        viewModel: _viewModel!,
      ),
    );
  }
}

class _MobileDashboardLayout extends StatelessWidget {
  const _MobileDashboardLayout();

  @override
  Widget build(BuildContext context) {
    // Access ViewModel using Consumer to rebuild when data changes
    return Consumer<AppointmentDashboardViewModel>(
      builder: (context, viewModel, child) {
        final parentState = context
            .findAncestorStateOfType<_AppointmentsDashboardState>();

        return Material(
          color: DashboardConstants.backgroundColor,
          child: Column(
            children: [
              // Summary Cards (Pinned at top)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: RepaintBoundary(
                  child: DashboardSummarySection(
                    viewModel: viewModel,
                    constraints: const BoxConstraints(maxWidth: 600),
                  ),
                ),
              ),

              // Controls (Pinned at top)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: DashboardTableControls(
                  viewModel: viewModel,
                  onNewAppointment: parentState?._newAppointmentCallback,
                  selectedDate: viewModel.selectedDate != null
                      ? DateTime.tryParse(viewModel.selectedDate!)
                      : null,
                  onDatePickerTap: () =>
                      parentState?._showDatePicker(viewModel),
                  onClearDate: () => viewModel.clearDateFilter(),
                ),
              ),

              // Appointment List (Scrollable area)
              Expanded(
                child: viewModel.isLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
                          ),
                        ),
                      )
                    : viewModel.paginatedSimpleAppointments.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 48,
                                  color: const Color(0xFF94A3B8).withOpacity(0.5),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'No appointments found for this date',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : CustomScrollView(
                            physics: const BouncingScrollPhysics(),
                            slivers: [
                              SliverPadding(
                                padding: const EdgeInsets.all(12),
                                sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final appointmentItem =
                                          viewModel.paginatedSimpleAppointments[index];
                                      return _MobileAppointmentCard(
                                        appointment: appointmentItem,
                                        viewModel: viewModel,
                                        onTap: () => parentState?._handleNavigation(
                                          context,
                                          appointmentItem,
                                          viewModel,
                                        ),
                                      );
                                    },
                                    childCount:
                                        viewModel.paginatedSimpleAppointments.length,
                                  ),
                                ),
                              ),
                              const SliverToBoxAdapter(child: SizedBox(height: 20)),
                            ],
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WebDashboardLayout extends StatelessWidget {
  const _WebDashboardLayout();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentDashboardViewModel>(
      builder: (context, viewModel, child) {
        final parentState = context
            .findAncestorStateOfType<_AppointmentsDashboardState>();

        return LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = DashboardHelpers.isTablet(constraints);

            return Material(
              color: DashboardConstants.backgroundColor,
              child: Padding(
                padding: EdgeInsets.all(isTablet ? 4 : 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Summary Cards (Pinned at top)
                    RepaintBoundary(
                      child: DashboardSummarySection(
                        viewModel: viewModel,
                        constraints: constraints,
                      ),
                    ),
                    SizedBox(height: isTablet ? 4 : 6),

                    // Table Controls (Pinned at top)
                    DashboardTableControls(
                      viewModel: viewModel,
                      isTablet: isTablet,
                      onNewAppointment: parentState?._newAppointmentCallback,
                      selectedDate: viewModel.selectedDate != null
                          ? DateTime.tryParse(viewModel.selectedDate!)
                          : null,
                      onDatePickerTap: () =>
                          parentState?._showDatePicker(viewModel),
                      onClearDate: () => viewModel.clearDateFilter(),
                    ),
                    SizedBox(height: isTablet ? 3 : 4),

                    // Appointments Table and Pagination (Scrollable area)
                    Expanded(
                      child: viewModel.isLoading
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(40.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  RepaintBoundary(
                                    child: _AppointmentsTable(
                                      viewModel: viewModel,
                                      constraints: constraints,
                                      parentState: parentState,
                                    ),
                                  ),
                                  SizedBox(height: isTablet ? 3 : 4),

                                  // Pagination
                                  DashboardPagination(
                                    currentPage: viewModel.currentSimplePage,
                                    totalPages: viewModel.totalSimplePages,
                                    onPrevious: viewModel.currentSimplePage > 1
                                        ? viewModel.previousSimplePage
                                        : null,
                                    onNext:
                                        viewModel.currentSimplePage <
                                            viewModel.totalSimplePages
                                        ? viewModel.nextSimplePage
                                        : null,
                                    onPageTap: (page) =>
                                        viewModel.goToSimplePage(page),
                                  ),
                                  SizedBox(height: isTablet ? 4 : 6),

                                  // Footer
                                  const Center(
                                    child: Text(
                                      DashboardConstants.footerText,
                                      style: TextStyle(
                                        color: DashboardConstants.textHintColor,
                                        fontSize: DashboardConstants.smallFontSize,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _MobileAppointmentCard extends StatelessWidget {
  final AppointmentListItem appointment;
  final AppointmentDashboardViewModel viewModel;
  final VoidCallback onTap;

  const _MobileAppointmentCard({
    required this.appointment,
    required this.viewModel,
    required this.onTap,
  });

  Widget _buildGridInfoRow(String value, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 12,
            color: iconColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 10.5,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moId = appointment.moId ?? 'N/A';
    final bookingId = appointment.bookingNumber;
    var patientName = appointment.patientName;
    if (patientName.contains('(Patient)')) {
      patientName = patientName.replaceAll('(Patient)', '').trim();
    }
    final consultationType = appointment.consultationType;
    final doctorName = appointment.doctorName;
    final department = appointment.department ?? 'General';
    final status = appointment.status;
    final feeStatus = appointment.feeStatus;
    final feeAmount = appointment.feeAmount;
    final paymentStatus = appointment.paymentStatus;

    // Clean values for premium presentation
    final cleanType = consultationType.replaceAll('_', ' ').split(' ').map((str) {
      if (str.isEmpty) return '';
      return str[0].toUpperCase() + str.substring(1);
    }).join(' ');

    final cleanDept = department.replaceAll('_', ' ').split(' ').map((str) {
      if (str.isEmpty) return '';
      return str[0].toUpperCase() + str.substring(1);
    }).join(' ');

    // Build date and time
    String appDate = '';
    String appTime = '';
    if (appointment.appointmentDateTime != null) {
      final s = appointment.appointmentDateTime!;
      if (s.length >= 10 && s.contains('-')) {
        try {
          final date = DateTime.parse(s.split(' ')[0]);
          appDate = '${date.day}/${date.month}/${date.year}';

          final parts = s.split(' ');
          if (parts.length >= 2) {
            final timeParts = parts[1].split(':');
            if (timeParts.length >= 2) {
              int hour = int.parse(timeParts[0]);
              int minute = int.parse(timeParts[1]);
              final period = hour >= 12 ? 'PM' : 'AM';
              hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
              appTime = '${hour}:${minute.toString().padLeft(2, '0')} $period';
            }
          }
        } catch (_) {
          appDate = s.split(' ')[0];
        }
      }
    }

    final displayPatientVal = '$patientName${(appointment.patientNumber != null && appointment.patientNumber!.isNotEmpty) ? ' (${appointment.patientNumber})' : ''}';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xFFFBFDFF),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0).withOpacity(0.8), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withOpacity(0.025),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: const Color(0xFF6366F1).withOpacity(0.005),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Checkbox, ID, Status, More menu
              Row(
                children: [
                  // Stylized Checkbox
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xFFCBD5E1), width: 1.5),
                    ),
                    child: Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Token Number
                  Row(
                    children: [
                      const Text(
                        'Token: ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        appointment.displayToken ?? appointment.tokenNumber ?? '-',
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1D4ED8),
                          letterSpacing: 0.2,
                        ),
                      ),
                      if (appTime.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF), // Slate/Blue soft background
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFFBFDBFE).withOpacity(0.5), width: 0.8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                size: 10,
                                color: Color(0xFF2563EB),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                appTime,
                                style: const TextStyle(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2563EB),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  const Spacer(),
                  // Status Chip
                  DashboardStatusChip(status: status),
                  const SizedBox(width: 4),
                  // Three dot action
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      size: 18,
                      color: Color(0xFF64748B),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onTap,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Body: Two-Column layout
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildGridInfoRow(patientName, Icons.person_outline_rounded, const Color(0xFF6366F1)),
                        if (appointment.patientNumber != null && appointment.patientNumber!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          _buildGridInfoRow(appointment.patientNumber!, Icons.phone_android_rounded, const Color(0xFF6366F1)),
                        ],
                        const SizedBox(height: 4),
                        _buildGridInfoRow(cleanType, Icons.layers_outlined, const Color(0xFF14B8A6)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Right Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildGridInfoRow(doctorName, Icons.medical_services_outlined, const Color(0xFF10B981)),
                        const SizedBox(height: 4),
                        _buildGridInfoRow(cleanDept, Icons.badge_outlined, const Color(0xFFF59E0B)),
                        const SizedBox(height: 4),
                        _buildGridInfoRow(appDate.isNotEmpty ? appDate : 'N/A', Icons.calendar_today_rounded, const Color(0xFFEC4899)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Divider
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              const SizedBox(height: 8),

              // Bottom Row: Outlined View button & Pay Now
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Outlined View Button
                  OutlinedButton.icon(
                    onPressed: () {
                      final authVM = Provider.of<AuthViewModel>(
                        context,
                        listen: false,
                      );
                      final clinicVM = Provider.of<ClinicViewModel>(
                        context,
                        listen: false,
                      );

                      final userClinicId = authVM.user?.clinicId;
                      ClinicModel? userClinic;
                      if (userClinicId != null &&
                          clinicVM.clinics.isNotEmpty) {
                        try {
                          userClinic = clinicVM.clinics.firstWhere(
                            (c) => c.id == userClinicId,
                          );
                        } catch (_) {}
                      }

                      final clinicName =
                          userClinic?.name ??
                          authVM.user?.firstName ??
                          'DR & ME HEALTHCARE';
                      final clinicLogo =
                          userClinic?.logo ?? authVM.user?.logo;
                      final clinicLogoUrl = clinicLogo != null
                          ? AppHelpers.ensureImageUrl(clinicLogo)
                          : null;

                      PdfReceiptService.previewReceiptPdf(
                        context,
                        ReceiptModel(
                          receiptNumber: appointment.bookingNumber.isNotEmpty
                              ? appointment.bookingNumber
                              : 'REC-${DateTime.now().millisecondsSinceEpoch}',
                          appointmentId: appointment.id,
                          bookingNumber: appointment.bookingNumber,
                          patientName: patientName,
                          patientAge: '24',
                          patientGender: 'Male',
                          patientPhone: appointment.patientNumber,
                          doctorName: doctorName,
                          department: department,
                          clinicName: clinicName,
                          clinicAddress:
                              'Health City, Medical District, India',
                          clinicPhone:
                              authVM.user?.phone ?? '+91 98765 43210',
                          tokenNumber:
                              appointment.displayToken ??
                              appointment.tokenNumber ??
                              '-',
                          consultationType: consultationType,
                          appointmentDate: appointment.appointmentDate,
                          appointmentTime: appointment.appointmentTime,
                          visitMode: appointment.isOnline
                              ? 'Online'
                              : 'In-Clinic',
                          bookingType: appointment.isWalkIn
                              ? 'Walk-in'
                              : 'Regular',
                          paymentMethod: 'CASH',
                          transactionId: moId,
                          consultationFee: feeAmount ?? 0.0,
                          additionalCharges: 0.0,
                          discount: 0.0,
                          tax: 0.0,
                          totalAmount: feeAmount ?? 0.0,
                          paymentStatus: paymentStatus ?? 'Paid',
                          bookingStatus: status,
                          generatedAt: DateTime.now(),
                          clinicLogoUrl: clinicLogoUrl,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.visibility_outlined,
                      size: 13,
                      color: Color(0xFF2563EB),
                    ),
                    label: const Text(
                      'View',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2563EB),
                      backgroundColor: const Color(0xFFEFF6FF),
                      side: const BorderSide(color: Color(0xFFBFDBFE), width: 1),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),

                  // Payment Status and Action
                  Row(
                    children: [
                      if (paymentStatus?.toLowerCase() == 'paid')
                        Text(
                          'PAID  ₹${feeAmount?.toStringAsFixed(0) ?? '0'}',
                          style: const TextStyle(
                            color: Color(0xFF16A34A),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        )
                      else ...[
                        if (feeStatus?.toLowerCase() != 'paid' &&
                            feeStatus?.toLowerCase() != 'pending' &&
                            (feeStatus != null || feeAmount != null)) ...[
                          Text(
                            '(${feeStatus ?? '₹${feeAmount?.toStringAsFixed(2) ?? '0.00'}'})',
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: Color(0xFF64748B),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                        InkWell(
                          onTap: () {
                            final parent = context
                                .findAncestorStateOfType<
                                  _AppointmentsDashboardState
                                >();
                            if (parent != null) {
                              parent._handlePayNow(context, appointment);
                            }
                          },
                          child: const Text(
                            'Pay Now',
                            style: TextStyle(
                              color: Color(0xFF3B82F6),
                              fontWeight: FontWeight.bold,
                              fontSize: 11.5,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppointmentsTable extends StatefulWidget {
  final AppointmentDashboardViewModel viewModel;
  final BoxConstraints constraints;
  final _AppointmentsDashboardState? parentState;

  const _AppointmentsTable({
    required this.viewModel,
    required this.constraints,
    this.parentState,
  });

  @override
  State<_AppointmentsTable> createState() => _AppointmentsTableState();
}

class _AppointmentsTableState extends State<_AppointmentsTable> {
  final ScrollController _horizontalController = ScrollController();
  bool _showLeftShadow = false;
  bool _showRightShadow = true;

  @override
  void initState() {
    super.initState();
    _horizontalController.addListener(_handleScroll);
    // Check initial state after build
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleScroll());
  }

  void _handleScroll() {
    if (!_horizontalController.hasClients) return;

    final maxScroll = _horizontalController.position.maxScrollExtent;
    final currentScroll = _horizontalController.offset;

    final bool showLeft = currentScroll > 10;
    final bool showRight = currentScroll < maxScroll - 10;

    if (showLeft != _showLeftShadow || showRight != _showRightShadow) {
      setState(() {
        _showLeftShadow = showLeft;
        _showRightShadow = showRight;
      });
    }
  }

  @override
  void dispose() {
    _horizontalController.removeListener(_handleScroll);
    _horizontalController.dispose();
    super.dispose();
  }

  static const _dataStyle = TextStyle(
    fontSize: 12,
    color: DashboardConstants.textPrimaryColor,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  @override
  Widget build(BuildContext context) {
    final isTablet = DashboardHelpers.isTablet(widget.constraints);
    return BeautifulTableContainer(
      isTablet: isTablet,
      child: _buildTableContent(context),
    );
  }

  Widget _buildTableContent(BuildContext context) {
    final bool needsHorizontalScroll =
        widget.constraints.maxWidth < DashboardConstants.minTableWidth;

    Widget tableWidget = Theme(
      data: Theme.of(context).copyWith(
        dividerColor: const Color(0xFFE2E8F0),
        dataTableTheme: DataTableThemeData(
          headingRowColor: WidgetStateProperty.all(const Color(0xFFF8F9FA)),
          dataRowColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              return DashboardConstants.primaryColor.withOpacity(0.05);
            }
            return null;
          }),
        ),
      ),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(
          const Color(0xFFF1F5F9),
        ), // Distinct Slate 100
        headingRowHeight: DashboardConstants.tableHeadingHeight,
        horizontalMargin: 16,
        columnSpacing: 16,
        headingTextStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 10,
          color: Color(0xFF64748B),
          letterSpacing: 1.0,
        ),
        dataTextStyle: _dataStyle.copyWith(fontSize: 11),
        dataRowMinHeight: DashboardConstants.tableRowMinHeight,
        dataRowMaxHeight: DashboardConstants.tableRowMaxHeight,
        columns: const [
          DataColumn(label: _TableHeader('TOKEN')),
          DataColumn(label: _TableHeader('MO ID')),
          DataColumn(label: _TableHeader('PATIENT & PHONE')),
          DataColumn(label: _TableHeader('DOCTOR')),
          DataColumn(label: _TableHeader('DEPARTMENT')),
          DataColumn(label: _TableHeader('CONSULTATION TYPE')),
          DataColumn(label: _TableHeader('APPOINTMENT DATE & TIME')),
          DataColumn(label: _TableHeader('STATUS')),
          DataColumn(label: _TableHeader('FEE STATUS')),
          DataColumn(label: _TableHeader('ACTIONS')),
        ],
        rows: _buildTableRows(context),
        showBottomBorder: false,
        dividerThickness: 0,
        showCheckboxColumn: false, // Remove the checkboxes
      ),
    );

    if (needsHorizontalScroll) {
      return Stack(
        children: [
          Scrollbar(
            controller: _horizontalController,
            thumbVisibility: true,
            thickness: 6,
            radius: const Radius.circular(3),
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: DashboardConstants.minTableWidth,
                child: tableWidget,
              ),
            ),
          ),
          // Left Shadow Gradient
          if (_showLeftShadow)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 40,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          // Right Shadow Gradient
          if (_showRightShadow)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 40,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    }

    return SizedBox(width: widget.constraints.maxWidth, child: tableWidget);
  }

  List<DataRow> _buildTableRows(BuildContext context) {
    if (widget.viewModel.paginatedSimpleAppointments.isEmpty) {
      return const [];
    }

    final rows = <DataRow>[];
    final items = widget.viewModel.paginatedSimpleAppointments;
    // Calculate start index safely
    final startIndex =
        (widget.viewModel.currentSimplePage - 1) *
        widget.viewModel.itemsPerPage;

    for (int i = 0; i < items.length; i++) {
      // Ensure index is valid
      rows.add(_buildDataRow(context, items[i], startIndex + i + 1, i));
    }
    return rows;
  }

  String _formatDate(String? s) {
    if (s == null || s.isEmpty) return '';
    // Optimized date parsing assuming YYYY-MM-DD
    if (s.length >= 10 && s.contains('-')) {
      // Try fast check if format is YYYY-MM-DD
      if (s.codeUnitAt(4) == 45 && s.codeUnitAt(7) == 45) {
        try {
          final y = s.substring(0, 4);
          final m = s.substring(5, 7);
          final d = s.substring(8, 10);
          return '$d/$m/$y';
        } catch (_) {}
      }
      // Fallback
      try {
        final date = DateTime.parse(s.split(' ')[0]);
        return '${date.day}/${date.month}/${date.year}';
      } catch (_) {
        return s.split(' ')[0];
      }
    }
    return s;
  }

  String _formatTime(String? s) {
    if (s == null || s.isEmpty) return '';
    if (!s.contains(' ')) return s;

    try {
      final parts = s.split(' ');
      if (parts.length < 2) return parts[0];
      String timePart = parts[1];

      final timeParts = timePart.split(':');
      if (timeParts.length >= 2) {
        int hour = int.parse(timeParts[0]);
        int minute = int.parse(timeParts[1]);
        final period = hour >= 12 ? 'PM' : 'AM';
        hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
        return '${hour}:${minute.toString().padLeft(2, '0')}$period';
      }
      return timePart;
    } catch (_) {
      return s;
    }
  }

  DataRow _buildDataRow(
    BuildContext context,
    AppointmentListItem appointment,
    int globalIndex,
    int localIndex,
  ) {
    // Fast getters and processing
    final tokenValue =
        appointment.displayToken ??
        appointment.tokenNumber ??
        globalIndex.toString();
    final moId = appointment.moId ?? '-';

    var patientName = appointment.patientName;
    if (patientName.isNotEmpty && patientName.endsWith('(Patient)')) {
      patientName = patientName
          .substring(0, patientName.length - 9)
          .trimRight();
    } else if (patientName.contains('(Patient)')) {
      patientName = patientName.replaceAll('(Patient)', '').trim();
    }

    final doctorName = appointment.doctorName;
    final department = appointment.department ?? 'N/A';
    final consultationType = appointment.consultationType;
    final status = appointment.status;
    final feeStatus = appointment.feeStatus;
    final feeAmount = appointment.feeAmount;
    final paymentStatus = appointment.paymentStatus;

    final appDate = _formatDate(appointment.appointmentDateTime);
    final appTime = _formatTime(appointment.appointmentDateTime);

    return DataRow(
      onSelectChanged: (_) => widget.parentState?._handleNavigation(
        context,
        appointment,
        widget.viewModel,
      ),
      color: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return const Color(0xFFF0F9FF);
        }
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFFE0F2FE);
        }
        return localIndex % 2 == 0 ? Colors.white : const Color(0xFFFAFAFA);
      }),
      cells: [
        DataCell(
          Center(
            child: Container(
              height: 36,
              constraints: const BoxConstraints(minWidth: 36),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A64748B), // Subtle shadow
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  tokenValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: DashboardConstants.primaryColor,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            moId,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: DashboardConstants.textPrimaryColor,
              fontSize: 12,
            ),
          ),
        ),
        DataCell(
          DashboardPatientCell(
            patientName: patientName,
            phoneNumber: appointment.patientNumber ?? '-',
          ),
        ),
        DataCell(
          Row(
            children: [
              _buildDoctorAvatar(doctorName, appointment.doctorImage),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  doctorName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF334155),
                    fontSize: 12,
                    letterSpacing: -0.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            ),
            child: Text(
              department,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF475569),
              ),
            ),
          ),
        ),
        DataCell(DashboardConsultationPill(type: consultationType)),
        DataCell(
          appDate.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      appDate,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        appTime,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              : const Text('-'),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardStatusChip(status: status),
              if (appointment.isWalkIn) ...[
                const SizedBox(height: 4),
                const BookingModeBadge(
                  bookingMode: 'walk_in',
                  scaleFactor: 0.9,
                ),
              ],
            ],
          ),
        ),
        DataCell(
          DashboardFeeCell(
            feeStatus: feeStatus,
            feeAmount: feeAmount,
            paymentStatus: paymentStatus,
            onPayNowTap: () =>
                widget.parentState?._handlePayNow(context, appointment),
          ),
        ),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.picture_as_pdf_rounded,
                  size: 20,
                  color: Color(0xFF0F766E),
                ),
                tooltip: 'View Receipt',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  final authVM = Provider.of<AuthViewModel>(
                    context,
                    listen: false,
                  );
                  final clinicVM = Provider.of<ClinicViewModel>(
                    context,
                    listen: false,
                  );

                  // Same logic as sidebar logo
                  final userClinicId = authVM.user?.clinicId;
                  ClinicModel? userClinic;
                  if (userClinicId != null && clinicVM.clinics.isNotEmpty) {
                    try {
                      userClinic = clinicVM.clinics.firstWhere(
                        (c) => c.id == userClinicId,
                      );
                    } catch (_) {}
                  }

                  final clinicName =
                      userClinic?.name ??
                      authVM.user?.firstName ??
                      'DR & ME HEALTHCARE';
                  final clinicLogo = userClinic?.logo ?? authVM.user?.logo;
                  final clinicLogoUrl = clinicLogo != null
                      ? AppHelpers.ensureImageUrl(clinicLogo)
                      : null;

                  PdfReceiptService.previewReceiptPdf(
                    context,
                    ReceiptModel(
                      receiptNumber: appointment.bookingNumber.isNotEmpty
                          ? appointment.bookingNumber
                          : 'REC-${DateTime.now().millisecondsSinceEpoch}',
                      appointmentId: appointment.id,
                      bookingNumber: appointment.bookingNumber,
                      patientName: patientName,
                      patientAge: '24', // Placeholder as not in simple-list
                      patientGender: 'Male', // Placeholder
                      patientPhone: appointment.patientNumber,
                      doctorName: doctorName,
                      department: department,
                      clinicName: clinicName,
                      clinicAddress: 'Health City, Medical District, India',
                      clinicPhone: authVM.user?.phone ?? '+91 98765 43210',
                      tokenNumber: tokenValue,
                      consultationType: consultationType,
                      appointmentDate: appointment.appointmentDate,
                      appointmentTime: appointment.appointmentTime,
                      visitMode: appointment.isOnline ? 'Online' : 'In-Clinic',
                      bookingType: appointment.isWalkIn ? 'Walk-in' : 'Regular',
                      paymentMethod: 'CASH',
                      transactionId: moId,
                      consultationFee: feeAmount ?? 0.0,
                      additionalCharges: 0.0,
                      discount: 0.0,
                      tax: 0.0,
                      totalAmount: feeAmount ?? 0.0,
                      paymentStatus: paymentStatus ?? 'Paid',
                      bookingStatus: status,
                      generatedAt: DateTime.now(),
                      clinicLogoUrl: clinicLogoUrl,
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(
                  Icons.visibility_outlined,
                  size: 18,
                  color: DashboardConstants.primaryColor,
                ),
                tooltip: 'View Details',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => widget.parentState?._handleNavigation(
                  context,
                  appointment,
                  widget.viewModel,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTokenNumber(dynamic value) {
    if (value == null) return '00';
    final tokenStr = value.toString();
    // If it's a pure number and less than 10, pad it
    if (RegExp(r'^\d+$').hasMatch(tokenStr)) {
      return tokenStr.padLeft(2, '0');
    }
    return tokenStr;
  }

  String _getImageUrl(String rawPath) {
    return AppHelpers.ensureImageUrl(rawPath);
  }

  Widget _buildDoctorAvatar(String name, String? imagePath) {
    final initials = name.isNotEmpty
        ? name.replaceAll('Dr.', '').trim()[0].toUpperCase()
        : 'D';

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Unified light clinical grey
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: imagePath != null && imagePath.isNotEmpty
            ? Image.network(
                _getImageUrl(imagePath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildInitialsContent(initials),
              )
            : _buildInitialsContent(initials),
      ),
    );
  }

  Widget _buildInitialsContent(String initials) {
    return Center(
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: Color(0xFF475569), // Professional Slate 600
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  List<Color> _getDoctorAvatarColors(String name) {
    final int hash = name.isEmpty
        ? 0
        : name.split('').fold(0, (prev, char) => prev + char.codeUnitAt(0)) +
              name.length;
    // Specialized clinical palette for doctors (Deeper, authoritative)
    final List<List<Color>> palettes = [
      [const Color(0xFF334155), const Color(0xFF1E293B)], // Slate
      [const Color(0xFF1E40AF), const Color(0xFF1E3A8A)], // Deep Blue
      [const Color(0xFF0369A1), const Color(0xFF0C4A6E)], // Deep Sky
      [const Color(0xFF065F46), const Color(0xFF064E3B)], // Deep Emerald
      [const Color(0xFF5B21B6), const Color(0xFF4C1D95)], // Deep Violet
      [const Color(0xFF991B1B), const Color(0xFF7F1D1D)], // Deep Red
      [const Color(0xFF374151), const Color(0xFF111827)], // Dark Grey
    ];
    return palettes[hash % palettes.length];
  }

  Widget _buildDynamicAvatar(String? name) {
    final String initial = name != null && name.isNotEmpty
        ? name[0].toUpperCase()
        : 'P';

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Unified light clinical grey
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Center(
        child: Text(
          initial,
          style: const TextStyle(
            color: Color(0xFF475569), // Professional Slate 600
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final String title;

  const _TableHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 10,
        color: Color(0xFF475569), // Slate 600 for better contrast
        letterSpacing: 1.2,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
