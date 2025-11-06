import 'package:a/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:a/modules/clinic/views/appointments/appointment_details_view.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Reusable widgets
import 'widgets/dashboard_greeting_section.dart';
import 'widgets/dashboard_summary_section.dart';
import 'widgets/dashboard_table_controls.dart';
import 'widgets/dashboard_pagination.dart';
import 'widgets/dashboard_status_chip.dart';
import 'widgets/dashboard_consultation_pill.dart';
import 'widgets/dashboard_patient_cell.dart';
import 'widgets/dashboard_fee_cell.dart';
import 'widgets/beautiful_table_container.dart';

// Constants & Helpers
import 'constants/dashboard_constants.dart';
import 'helpers/dashboard_helpers.dart';

/// Main appointments dashboard with responsive design
class AppointmentsDashboard extends StatefulWidget {
  final Function(String)? onNavigate;

  const AppointmentsDashboard({super.key, this.onNavigate});

  @override
  State<AppointmentsDashboard> createState() => _AppointmentsDashboardState();
}

class _AppointmentsDashboardState extends State<AppointmentsDashboard> {
  late AppointmentDashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AppointmentDashboardViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    _viewModel.initializeSimpleDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<AppointmentDashboardViewModel>(
        builder: (context, viewModel, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return DashboardHelpers.isMobile(constraints)
                  ? _buildMobileLayout(viewModel)
                  : _buildWebLayout(viewModel);
            },
          );
        },
      ),
    );
  }

  /// Build mobile layout (cards)
  Widget _buildMobileLayout(AppointmentDashboardViewModel viewModel) {
    return Container(
      width: double.infinity,
      color: DashboardConstants.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildMobileSummaryCards(viewModel),
            const SizedBox(height: 8),
            _buildMobileTabsAndActions(viewModel),
            const SizedBox(height: 8),
            _buildMobileSearchAndFilter(),
            const SizedBox(height: 8),
            _buildMobileAppointmentCards(viewModel),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  /// Build web layout (table)
  Widget _buildWebLayout(AppointmentDashboardViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = DashboardHelpers.isTablet(constraints);

        return Container(
          width: double.infinity,
          color: DashboardConstants.backgroundColor,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(isTablet ? 4 : 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Section with Date Picker
                DashboardGreetingSection(
                  selectedDate: viewModel.selectedDate,
                  onDatePickerTap: () => _showDatePicker(viewModel),
                  onClearDate: () => viewModel.clearDateFilter(),
                ),
                SizedBox(height: isTablet ? 2 : 3),

                // Summary Cards
                LayoutBuilder(
                  builder: (context, summaryConstraints) {
                    return DashboardSummarySection(
                      viewModel: viewModel,
                      constraints: summaryConstraints,
                    );
                  },
                ),
                SizedBox(height: isTablet ? 4 : 6),

                // Table Controls (Tabs, Search, Filter)
                DashboardTableControls(
                  viewModel: viewModel,
                  isTablet: isTablet,
                ),
                SizedBox(height: isTablet ? 3 : 4),

                // Appointments Table
                _buildAppointmentsTable(viewModel, constraints),
                SizedBox(height: isTablet ? 3 : 4),

                // Pagination
                DashboardPagination(
                  currentPage: viewModel.currentSimplePage,
                  totalPages: viewModel.totalSimplePages,
                  onPrevious: viewModel.currentSimplePage > 1
                      ? viewModel.previousSimplePage
                      : null,
                  onNext:
                      viewModel.currentSimplePage < viewModel.totalSimplePages
                      ? viewModel.nextSimplePage
                      : null,
                  onPageTap: (page) => viewModel.goToSimplePage(page),
                ),
                SizedBox(height: isTablet ? 4 : 6),

                // Footer
                _buildFooter(),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Build appointments table with beautiful design
  Widget _buildAppointmentsTable(
    AppointmentDashboardViewModel viewModel,
    BoxConstraints constraints,
  ) {
    final isTablet = DashboardHelpers.isTablet(constraints);

    return BeautifulTableContainer(
      isTablet: isTablet,
      child: _buildTableContent(viewModel, constraints),
    );
  }

  /// Build table content with data
  Widget _buildTableContent(
    AppointmentDashboardViewModel viewModel,
    BoxConstraints constraints,
  ) {
    final bool needsHorizontalScroll =
        constraints.maxWidth < DashboardConstants.minTableWidth;

    Widget tableWidget = Theme(
      data: Theme.of(context).copyWith(
        dividerColor: const Color(0xFFF9FAFB),
        dataTableTheme: DataTableThemeData(
          headingRowColor: WidgetStateProperty.all(const Color(0xFFF8F9FA)),
          dataRowColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered)) {
              return const Color(0xFF6366F1).withOpacity(0.05);
            }
            return null;
          }),
        ),
      ),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF1F5F9)),
        headingRowHeight: 40,
        horizontalMargin: constraints.maxWidth < 1200 ? 24 : 32,
        columnSpacing: constraints.maxWidth < 1200 ? 24 : 32,
        headingTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 12,
          color: const Color(0xFF0F172A),
          letterSpacing: 0.5,
        ),
        dataTextStyle: const TextStyle(
          fontSize: 11,
          color: Color(0xFF334155),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        dataRowMinHeight: 44,
        dataRowMaxHeight: 44,
        columns: _buildTableColumns(),
        rows: _buildTableRows(viewModel),
      ),
    );

    if (needsHorizontalScroll) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: DashboardConstants.minTableWidth,
          child: tableWidget,
        ),
      );
    }

    return SizedBox(width: constraints.maxWidth, child: tableWidget);
  }

  /// Build table columns
  List<DataColumn> _buildTableColumns() {
    return [
      DataColumn(label: _buildColumnHeader('Token')),
      DataColumn(label: _buildColumnHeader('Mo ID')),
      DataColumn(label: _buildColumnHeader('Patient')),
      DataColumn(label: _buildColumnHeader('Doctor')),
      DataColumn(label: _buildColumnHeader('Department')),
      DataColumn(label: _buildColumnHeader('Consultation Type')),
      DataColumn(label: _buildColumnHeader('Appointment Date & Time')),
      DataColumn(label: _buildColumnHeader('STATUS')),
      DataColumn(label: _buildColumnHeader('Fee Status')),
      DataColumn(label: const Text('')),
    ];
  }

  /// Build column header text with impressive styling
  Widget _buildColumnHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 12,
          color: const Color(0xFF0F172A),
          letterSpacing: 0.5,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  /// Build table rows from appointment data
  List<DataRow> _buildTableRows(AppointmentDashboardViewModel viewModel) {
    if (viewModel.paginatedSimpleAppointments.isEmpty) {
      return [];
    }

    return viewModel.paginatedSimpleAppointments.asMap().entries.map((entry) {
      final index = entry.key;
      final appointment = entry.value;
      final globalIndex =
          (viewModel.currentSimplePage - 1) * viewModel.itemsPerPage +
          index +
          1;

      return _buildDataRow(appointment, globalIndex);
    }).toList();
  }

  /// Build individual data row
  DataRow _buildDataRow(dynamic appointment, int index) {
    final tokenNumber = appointment?.tokenNumber ?? index;
    final moId = appointment?.moId ?? '-';
    var patientName = appointment?.patientName ?? 'Unknown Patient';
    if (patientName.contains('(Patient)')) {
      patientName = patientName.replaceAll('(Patient)', '').trim();
    }
    final patientPhone = '-';
    final doctorName = appointment?.doctorName ?? '-';
    final department = appointment?.department ?? 'N/A';
    final consultationType = appointment?.consultationType ?? '-';
    final status = appointment?.status ?? '-';
    final feeStatus = appointment?.feeStatus ?? '';
    final feeAmount = appointment?.feeAmount;
    final paymentStatus = appointment?.paymentStatus ?? 'pending';

    // Format appointment date and time
    String appointmentDate = '';
    String appointmentTime = '';
    if (appointment?.appointmentDateTime != null &&
        appointment!.appointmentDateTime.contains(' ')) {
      final parts = appointment.appointmentDateTime.split(' ');
      if (parts.length >= 2) {
        // Format date to day/month/year
        try {
          final date = DateTime.parse(parts[0]);
          appointmentDate = '${date.day}/${date.month}/${date.year}';
        } catch (e) {
          appointmentDate = parts[0];
        }

        // Format time to 12-hour Indian format with AM/PM
        try {
          final timeParts = parts[1].split(':');
          if (timeParts.length >= 2) {
            int hour = int.parse(timeParts[0]);
            int minute = int.parse(timeParts[1]);
            final period = hour >= 12 ? 'PM' : 'AM';
            hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
            appointmentTime =
                '${hour}:${minute.toString().padLeft(2, '0')}$period';
          } else {
            appointmentTime = parts[1];
          }
        } catch (e) {
          appointmentTime = parts[1];
        }
      }
    }

    return DataRow(
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return const Color(0xFFF8FAFC);
        }
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFFF1F5F9);
        }
        return index % 2 == 0 ? Colors.white : const Color(0xFFFAFAFA);
      }),
      cells: [
        DataCell(
          Center(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6366F1).withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  tokenNumber != null
                      ? '${tokenNumber.toString().padLeft(2, '0')}'
                      : '00',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B),
                    fontSize: 12,
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
              color: Color(0xFF0F172A),
              fontSize: 12,
            ),
          ),
        ),
        DataCell(
          DashboardPatientCell(
            patientName: patientName,
            phoneNumber: patientPhone,
          ),
        ),
        DataCell(
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF10B981).withOpacity(0.4),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  doctorName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF334155),
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            ),
            child: Text(
              department,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF475569),
              ),
            ),
          ),
        ),
        DataCell(DashboardConsultationPill(type: consultationType)),
        DataCell(
          appointmentDate.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      appointmentDate,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        appointmentTime,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF475569),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              : const Text('-'),
        ),
        DataCell(DashboardStatusChip(status: status)),
        DataCell(
          DashboardFeeCell(
            feeStatus: feeStatus,
            feeAmount: feeAmount,
            paymentStatus: paymentStatus,
            onPayNowTap: () {
              // Navigate to payment
            },
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () {
              if (appointment?.id != null) {
                // Print appointment and patient IDs for debugging
                print('🔍 Navigating to Appointment Details:');
                print('   Appointment ID: ${appointment!.id}');
                print('   Patient ID: ${appointment.clinicPatientId}');
                print('');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentId: appointment!.id!,
                      clinicPatientId: appointment?.clinicPatientId,
                    ),
                  ),
                );
              }
            },
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              ),
              child: const Icon(
                Icons.more_vert,
                size: 16,
                color: Color(0xFF6B7280),
              ),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }

  /// Build footer
  Widget _buildFooter() {
    return const Center(
      child: Text(
        DashboardConstants.footerText,
        style: TextStyle(
          color: DashboardConstants.textHintColor,
          fontSize: DashboardConstants.smallFontSize,
        ),
      ),
    );
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

  // Mobile-specific widgets (these are simpler implementations)
  Widget _buildMobileSummaryCards(AppointmentDashboardViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return DashboardSummarySection(
            viewModel: viewModel,
            constraints: constraints,
          );
        },
      ),
    );
  }

  Widget _buildMobileTabsAndActions(AppointmentDashboardViewModel viewModel) {
    // Simplified mobile tabs - reuse desktop components where possible
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DashboardTableControls(viewModel: viewModel),
    );
  }

  Widget _buildMobileSearchAndFilter() {
    // Simplified search bar for mobile
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: DashboardConstants.borderColor),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search Doctors, P...',
            hintStyle: TextStyle(color: DashboardConstants.textHintColor),
            prefixIcon: Icon(
              Icons.search,
              color: DashboardConstants.textSecondaryColor,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileAppointmentCards(AppointmentDashboardViewModel viewModel) {
    // Use same data as table but in card format
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: viewModel.paginatedSimpleAppointments.map((appointment) {
          return _buildMobileAppointmentCard(appointment);
        }).toList(),
      ),
    );
  }

  Widget _buildMobileAppointmentCard(dynamic appointment) {
    final moId = appointment.moId ?? 'N/A';
    var patientName = appointment.patientName;
    if (patientName.contains('(Patient)')) {
      patientName = patientName.replaceAll('(Patient)', '').trim();
    }
    final consultationType = appointment.consultationType;
    final doctorName = appointment.doctorName;
    final department = appointment.department ?? 'General';
    final status = appointment.status;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [DashboardConstants.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Text(moId, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              DashboardStatusChip(status: status),
            ],
          ),
          const SizedBox(height: 8),
          // Patient & Doctor info
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient: $patientName',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Type: $consultationType',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor: $doctorName',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Dept: $department',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
