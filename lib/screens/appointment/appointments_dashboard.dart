import 'package:a/screens/appointment/appointment_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/appointment_dashboard_vm.dart';
import 'package:a/viewModels/authVM.dart';

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
    _viewModel.initializeDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<AppointmentDashboardViewModel>(
        builder: (context, viewModel, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // For mobile screens (width < 480px), use the exact uploaded design
              if (constraints.maxWidth < 480) {
                return _buildMobileLayout(viewModel);
              }
              // For tablet and desktop screens, use the existing web UI with proper scaling
              else {
                return _buildWebLayout(viewModel);
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildMobileLayout(AppointmentDashboardViewModel viewModel) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8F9FA),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Summary Cards Grid
            _buildMobileSummaryCards(viewModel),
            const SizedBox(height: 20),

            // Navigation Tabs and Action Buttons
            _buildMobileTabsAndActions(viewModel),
            const SizedBox(height: 16),

            // Search and Filter Row
            _buildMobileSearchAndFilter(),
            const SizedBox(height: 16),

            // Appointment Cards List
            _buildMobileAppointmentCards(viewModel),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(AppointmentDashboardViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if this is a tablet or desktop
        final isTablet = constraints.maxWidth < 1024;

        // Show error state if there's an error and no data
        if (viewModel.error.isNotEmpty && viewModel.appointments.isEmpty) {
          return _buildErrorState(viewModel, isTablet);
        }

        return Container(
          width: double.infinity,
          color: const Color(0xFFF8F9FA),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(isTablet ? 12 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Section
                _buildGreetingSection(),
                SizedBox(height: isTablet ? 9 : 9),
                // Summary Cards
                _buildSummaryCards(viewModel),
                SizedBox(height: isTablet ? 16 : 20),

                // Table Controls
                _buildTableControls(viewModel),
                SizedBox(height: isTablet ? 12 : 16),

                // Appointments Table
                _buildAppointmentsTable(viewModel),
                SizedBox(height: isTablet ? 12 : 16),

                // Pagination
                _buildPagination(viewModel),
                SizedBox(height: isTablet ? 20 : 24),

                // Footer
                _buildFooter(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGreetingSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth < 1024;
        final isMobile = constraints.maxWidth < 480;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : (isTablet ? 12 : 16),
            vertical: isMobile ? 8 : (isTablet ? 6 : 8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Arun Krishna,',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : (isTablet ? 14 : 18),
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Good Morning!',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : (isTablet ? 20 : 28),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              // Calendar button
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDC3545),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '12 Jan 2025',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryCards(AppointmentDashboardViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final summary = viewModel.summary;

        if (constraints.maxWidth < 768) {
          // Mobile layout - 2x2 grid
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.todayAppointments ?? 55}',
                      'Today\'s Appointments',
                      const Color(0xFFB088F0),
                      Icons.calendar_today,
                      constraints,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.upcomingAppointments ?? 12}',
                      'Upcoming Appointments',
                      const Color(0xFFE0F0B0),
                      Icons.calendar_month,
                      constraints,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.completedAppointments ?? 34}',
                      'Completed Appointments',
                      const Color(0xFFB0F0B0),
                      Icons.check_circle,
                      constraints,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.cancelledAppointments ?? 9}',
                      'Cancelled Appointments',
                      const Color(0xFFF0B0B0),
                      Icons.cancel,
                      constraints,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          // Desktop/Tablet layout - horizontal row
          return Row(
            children: [
              Expanded(
                child: _buildUnifiedSummaryCard(
                  '${summary?.todayAppointments ?? 55}',
                  'Today\'s Appointments',
                  const Color(0xFFB088F0),
                  Icons.calendar_today,
                  constraints,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildUnifiedSummaryCard(
                  '${summary?.upcomingAppointments ?? 12}',
                  'Upcoming Appointments',
                  const Color(0xFFE0F0B0),
                  Icons.calendar_month,
                  constraints,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildUnifiedSummaryCard(
                  '${summary?.completedAppointments ?? 34}',
                  'Completed Appointments',
                  const Color(0xFFB0F0B0),
                  Icons.check_circle,
                  constraints,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildUnifiedSummaryCard(
                  '${summary?.cancelledAppointments ?? 9}',
                  'Cancelled Appointments',
                  const Color(0xFFF0B0B0),
                  Icons.cancel,
                  constraints,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildUnifiedSummaryCard(
    String value,
    String label,
    Color color,
    IconData icon,
    BoxConstraints constraints,
  ) {
    final isMobile = constraints.maxWidth < 768;

    // Calculate consistent dimensions based on screen size (slightly reduced)
    final cardHeight = isMobile ? 90.0 : 92.0;
    final iconSize = isMobile ? 32.0 : 36.0;
    final iconInnerSize = isMobile ? 16.0 : 18.0;
    final padding = isMobile ? 10.0 : 14.0;
    final borderRadius = isMobile ? 8.0 : 10.0;

    return Container(
      height: cardHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: iconInnerSize,
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(width: isMobile ? 10 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                ),
                SizedBox(height: isMobile ? 1 : 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableControls(AppointmentDashboardViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth < 1024;

        return Column(
          children: [
            // Tabs
            _buildTabsRow(viewModel),
            const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 1),
            SizedBox(height: isTablet ? 8 : 12),
            // Search and filter controls
            _buildSearchAndFilterRow(viewModel),
          ],
        );
      },
    );
  }

  Widget _buildTabsRow(AppointmentDashboardViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth < 1024;

        return Row(
          children: [
            // Tabs
            _buildTab('All', 0, viewModel),
            SizedBox(width: isTablet ? 8 : 12),
            _buildTab('Patients', 1, viewModel),
            SizedBox(width: isTablet ? 8 : 12),
            _buildTab('Doctors', 2, viewModel),
            const Spacer(),
            // New Appointment Button
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 10 : 12,
                  vertical: isTablet ? 4 : 6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(isTablet ? 4 : 6),
                ),
              ),
              icon: Icon(Icons.add, size: isTablet ? 12 : 14),
              label: Text(
                'New Appointment',
                style: TextStyle(fontSize: isTablet ? 11 : 13),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSearchAndFilterRow(AppointmentDashboardViewModel viewModel) {
    return Row(
      children: [
        // Search Bar
        Expanded(
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              onChanged: (value) => viewModel.setSearchQuery(value),
              decoration: const InputDecoration(
                hintText: 'Search Doctors, Patient, etc.....',
                hintStyle: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF666666),
                  size: 16,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                isDense: true,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Filter Button
        _buildFilterButton(),
        const SizedBox(width: 8),
        // View Toggle
        _buildViewToggleButtons(viewModel),
      ],
    );
  }

  Widget _buildTab(
    String title,
    int index,
    AppointmentDashboardViewModel viewModel,
  ) {
    final isSelected = viewModel.selectedTab == index;
    return InkWell(
      onTap: () => viewModel.setSelectedTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected
                ? const Color(0xFF007BFF)
                : const Color(0xFF666666),
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF666666),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        icon: const Icon(Icons.filter_list, size: 16),
        label: const Text('Filter', style: TextStyle(fontSize: 12)),
      ),
    );
  }

  Widget _buildViewToggleButtons(AppointmentDashboardViewModel viewModel) {
    return Row(
      children: [
        _buildViewToggle(Icons.view_list, true, viewModel),
        const SizedBox(width: 2),
        _buildViewToggle(Icons.grid_view, false, viewModel),
      ],
    );
  }

  Widget _buildViewToggle(
    IconData icon,
    bool isList,
    AppointmentDashboardViewModel viewModel,
  ) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () => viewModel.toggleViewMode(),
        borderRadius: BorderRadius.circular(6),
        child: Icon(icon, size: 16, color: const Color(0xFF666666)),
      ),
    );
  }

  Widget _buildAppointmentsTable(AppointmentDashboardViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Define minimum width needed for all columns
          const double minTableWidth = 1000.0;

          // If screen is wide enough, display without scrolling
          if (constraints.maxWidth >= minTableWidth) {
            return SizedBox(
              width: constraints.maxWidth,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                  const Color(0xFFF5F5F5),
                ),
                headingRowHeight: 48,
                dataRowHeight: 48,
                horizontalMargin: 0,
                columnSpacing: 0,
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF333333),
                ),
                dataTextStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF333333),
                ),
                columns: const [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('Mo ID')),
                  DataColumn(label: Text('Patient Name')),
                  DataColumn(label: Text('Doctors Name')),
                  DataColumn(label: Text('Department')),
                  DataColumn(label: Text('Consultation Type')),
                  DataColumn(label: Text('Appointment Date & Time')),
                  DataColumn(label: Text('STATUS')),
                  DataColumn(label: Text('Fee Status')),
                  DataColumn(label: Text('')),
                ],
                rows: viewModel.appointments
                    .asMap()
                    .entries
                    .map(
                      (entry) => _buildDataTableRow(
                        entry.key + 1,
                        entry.value,
                        viewModel,
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            // If screen is too narrow, enable horizontal scrolling
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: constraints.maxWidth > minTableWidth
                    ? constraints.maxWidth
                    : minTableWidth,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                    const Color(0xFFF5F5F5),
                  ),
                  headingRowHeight: 48,
                  dataRowHeight: 48,
                  horizontalMargin: constraints.maxWidth > minTableWidth
                      ? 0
                      : 16,
                  columnSpacing: constraints.maxWidth > minTableWidth ? 0 : 8,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                  dataTextStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                  columns: const [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Mo ID')),
                    DataColumn(label: Text('Patient Name')),
                    DataColumn(label: Text('Doctors Name')),
                    DataColumn(label: Text('Department')),
                    DataColumn(label: Text('Consultation Type')),
                    DataColumn(label: Text('Appointment Date & Time')),
                    DataColumn(label: Text('STATUS')),
                    DataColumn(label: Text('Fee Status')),
                    DataColumn(label: Text('')),
                  ],
                  rows: viewModel.appointments
                      .asMap()
                      .entries
                      .map(
                        (entry) => _buildDataTableRowSmallScreen(
                          entry.key + 1,
                          entry.value,
                          viewModel,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  DataRow _buildDataTableRow(
    int index,
    appointment,
    AppointmentDashboardViewModel viewModel,
  ) {
    return DataRow(
      color: WidgetStateProperty.all(
        (index - 1) % 2 == 0 ? Colors.white : const Color(0xFFF8F8F8),
      ),
      cells: [
        DataCell(Text('${index.toString().padLeft(2, '0')}')),
        DataCell(Text('#23454G')),
        DataCell(Text('Arun Krishna')),
        DataCell(Text('Dr. Alan Green')),
        DataCell(Text(_getDepartmentForRow(index))),
        DataCell(_buildConsultationTypePill(_getConsultationTypeForRow(index))),
        DataCell(Text('11-03-2025 12:34 PM')),
        DataCell(_buildStatusChip(_getStatusForRow(index))),
        DataCell(_getFeeStatusForRow(index)),
        DataCell(
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 16,
              color: Color(0xFF666666),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }

  DataRow _buildDataTableRowSmallScreen(
    int index,
    appointment,
    AppointmentDashboardViewModel viewModel,
  ) {
    return DataRow(
      color: WidgetStateProperty.all(
        (index - 1) % 2 == 0 ? Colors.white : const Color(0xFFF8F8F8),
      ),
      cells: [
        DataCell(Text('${index.toString().padLeft(2, '0')}')),
        DataCell(Text('#23454G')),
        DataCell(Text('Arun Krishna')),
        DataCell(Text('Dr. Alan Green')),
        DataCell(Text(_getDepartmentForRow(index))),
        DataCell(_buildConsultationTypePill(_getConsultationTypeForRow(index))),
        DataCell(Text('11-03-2025 12:34 PM')),
        DataCell(_buildStatusChip(_getStatusForRow(index))),
        DataCell(_getFeeStatusForRow(index)),
        DataCell(
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 16,
              color: Color(0xFF666666),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }

  String _getDepartmentForRow(int index) {
    // Based on the design: Cardiology (01,04,06,07), Dermatology (02,05,08), Neurology (03)
    switch (index) {
      case 0:
      case 3:
      case 5:
      case 6:
        return 'Cardiology';
      case 1:
      case 4:
      case 7:
        return 'Dermatology';
      case 2:
        return 'Neurology';
      default:
        return 'Cardiology';
    }
  }

  String _getConsultationTypeForRow(int index) {
    // Based on the design: Clinic Visit (01,04,06,08), Follow Up (02,05), Online Consultation (03,07)
    switch (index) {
      case 0:
      case 3:
      case 5:
      case 7:
        return 'Clinic Visit';
      case 1:
      case 4:
        return 'Follow Up';
      case 2:
      case 6:
        return 'Online Consultation';
      default:
        return 'Clinic Visit';
    }
  }

  String _getStatusForRow(int index) {
    // Based on the design: Upcoming (01,06), Completed (02,07), Cancelled (03,04,05,08)
    switch (index) {
      case 0:
      case 5:
        return 'Upcoming';
      case 1:
      case 6:
        return 'Completed';
      case 2:
      case 3:
      case 4:
      case 7:
        return 'Cancelled';
      default:
        return 'Upcoming';
    }
  }

  Widget _getFeeStatusForRow(int index) {
    // Based on the design: Pay Now (01,03,04,05,08), ₹600.00 (02,06,07)
    switch (index) {
      case 0:
      case 2:
      case 3:
      case 4:
      case 7:
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AppointmentDetailsScreen(appointmentId: '23454G'),
              ),
            );
          },
          child: Text(
            'Pay Now',
            style: const TextStyle(
              color: Color(0xFF007BFF),
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      case 1:
      case 5:
      case 6:
        return Text(
          '₹600.00',
          style: const TextStyle(color: Color(0xFF333333), fontSize: 12),
        );
      default:
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AppointmentDetailsScreen(appointmentId: '23454G'),
              ),
            );
          },
          child: Text(
            'Pay Now',
            style: const TextStyle(
              color: Color(0xFF007BFF),
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        );
    }
  }

  Widget _buildConsultationTypePill(String type) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (type.toLowerCase()) {
      case 'clinic visit':
        backgroundColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1976D2);
        icon = Icons.local_hospital;
        break;
      case 'follow up':
        backgroundColor = const Color(0xFFF3E5F5);
        textColor = const Color(0xFF7B1FA2);
        icon = Icons.calendar_today;
        break;
      case 'online consultation':
        backgroundColor = const Color(0xFFE8F5E8);
        textColor = const Color(0xFF2E7D32);
        icon = Icons.videocam;
        break;
      default:
        backgroundColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1976D2);
        icon = Icons.local_hospital;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            type,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color textColor;
    Color dotColor;
    Color backgroundColor;

    switch (status) {
      case 'Upcoming':
        textColor = const Color(0xFFF57C00);
        dotColor = const Color(0xFFFFC107);
        backgroundColor = const Color(0xFFFFF3E0);
        break;
      case 'Completed':
        textColor = const Color(0xFF2E7D32);
        dotColor = const Color(0xFF4CAF50);
        backgroundColor = const Color(0xFFE8F5E8);
        break;
      case 'Cancelled':
        textColor = const Color(0xFFD32F2F);
        dotColor = const Color(0xFFF44336);
        backgroundColor = const Color(0xFFFFEBEE);
        break;
      default:
        textColor = const Color(0xFF666666);
        dotColor = const Color(0xFF666666);
        backgroundColor = const Color(0xFFF5F5F5);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination(AppointmentDashboardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: viewModel.hasMoreData
              ? () => viewModel.loadMoreAppointments()
              : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF333333),
            side: const BorderSide(color: Color(0xFFE0E0E0)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          icon: const Icon(Icons.chevron_left, size: 16),
          label: const Text('Previous'),
        ),
        const SizedBox(width: 8),
        _buildPageNumber(1, true),
        const SizedBox(width: 4),
        _buildPageNumber(2, false),
        const SizedBox(width: 4),
        _buildPageNumber(3, false),
        const SizedBox(width: 4),
        const Text('...'),
        const SizedBox(width: 4),
        _buildPageNumber(8, false),
        const SizedBox(width: 4),
        _buildPageNumber(9, false),
        const SizedBox(width: 4),
        _buildPageNumber(10, false),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: viewModel.hasMoreData
              ? () => viewModel.loadMoreAppointments()
              : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF333333),
            side: const BorderSide(color: Color(0xFFE0E0E0)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          icon: const Icon(Icons.chevron_right, size: 16),
          label: const Text('Next'),
        ),
      ],
    );
  }

  Widget _buildPageNumber(int number, bool isActive) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF007BFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF333333),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 DrMe. All rights reserved',
        style: TextStyle(color: Color(0xFF999999), fontSize: 10),
      ),
    );
  }

  // // Mobile-specific methods for exact design match
  // Widget _buildMobileTitle() {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
  //     child: Row(
  //       children: [
  //         Row(
  //           children: [
  //             IconButton(
  //               onPressed: () {},
  //               icon: const Icon(
  //                 Icons.notifications_outlined,
  //                 color: Color(0xFF666666),
  //                 size: 24,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMobileSummaryCards(AppointmentDashboardViewModel viewModel) {
    final summary = viewModel.summary;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // First row
              Row(
                children: [
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.todayAppointments ?? 55}',
                      'Today\'s Appointments',
                      const Color(0xFFB088F0),
                      Icons.calendar_today,
                      constraints,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.upcomingAppointments ?? 12}',
                      'Upcoming Appointments',
                      const Color(0xFFE0F0B0),
                      Icons.calendar_month,
                      constraints,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Second row
              Row(
                children: [
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.completedAppointments ?? 34}',
                      'Completed Appointments',
                      const Color(0xFFB0F0B0),
                      Icons.check_circle,
                      constraints,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildUnifiedSummaryCard(
                      '${summary?.cancelledAppointments ?? 9}',
                      'Cancelled Appointments',
                      const Color(0xFFF0B0B0),
                      Icons.cancel,
                      constraints,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileTabsAndActions(AppointmentDashboardViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Tabs with horizontal scroll
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildMobileTab('All', 0, viewModel),
                  const SizedBox(width: 12),
                  _buildMobileTab('Patients', 1, viewModel),
                  const SizedBox(width: 12),
                  _buildMobileTab('Doctors', 2, viewModel),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Date picker button
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 120),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF666666),
                  size: 14,
                ),
                const SizedBox(width: 4),
                const Text(
                  '12-03-2025',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // New Appointment button
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTab(
    String title,
    int index,
    AppointmentDashboardViewModel viewModel,
  ) {
    final isSelected = viewModel.selectedTab == index;
    return InkWell(
      onTap: () => viewModel.setSelectedTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected
                ? const Color(0xFF007BFF)
                : const Color(0xFF666666),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: Container(
              height: 40,
              constraints: const BoxConstraints(
                minWidth: 0,
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Doctors, P...',
                  hintStyle: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF666666),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Filter button
          Container(
            height: 40,
            constraints: const BoxConstraints(minWidth: 80, maxWidth: 120),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.filter_list,
                  color: Color(0xFF666666),
                  size: 16,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileAppointmentCards(AppointmentDashboardViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Sample appointment cards matching the image
          _buildMobileAppointmentCard(
            '#23454G',
            'Arun Krishna',
            'Clinic Visit',
            'Dr. Alan Green',
            'Cardiology',
            'Cancelled',
            const Color(0xFFDC3545),
          ),
          const SizedBox(height: 12),
          _buildMobileAppointmentCard(
            '#23455H',
            'Sarah Johnson',
            'Follow Up',
            'Dr. Maria Garcia',
            'Dermatology',
            'Upcoming',
            const Color(0xFFFFC107),
          ),
          const SizedBox(height: 12),
          _buildMobileAppointmentCard(
            '#23456I',
            'John Smith',
            'Online Consultation',
            'Dr. David Wilson',
            'General Medicine',
            'Upcoming',
            const Color(0xFFFFC107),
          ),
          const SizedBox(height: 12),
          _buildMobileAppointmentCard(
            '#23457J',
            'Emily Davis',
            'Clinic Visit',
            'Dr. Lisa Brown',
            'Pediatrics',
            'Cancelled',
            const Color(0xFFDC3545),
            fee: '₹600.00',
          ),
          const SizedBox(height: 12),
          _buildMobileAppointmentCard(
            '#23458K',
            'Michael Chen',
            'Follow Up',
            'Dr. Robert Taylor',
            'Orthopedics',
            'Completed',
            const Color(0xFF28A745),
          ),
          const SizedBox(height: 12),
          _buildMobileAppointmentCard(
            '#23459L',
            'Anna Rodriguez',
            'Clinic Visit',
            'Dr. Jennifer Lee',
            'Cardiology',
            'Upcoming',
            const Color(0xFFFFC107),
          ),
          const SizedBox(height: 12),
          _buildMobileAppointmentCard(
            '#23460M',
            'Tom Wilson',
            'Online Consultation',
            'Dr. Alex Johnson',
            'General Medicine',
            'Upcoming',
            const Color(0xFFFFC107),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileAppointmentCard(
    String appointmentId,
    String patientName,
    String type,
    String doctorName,
    String department,
    String status,
    Color statusColor, {
    String? fee,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top row: Appointment ID + Status + Kebab menu
          Row(
            children: [
              // Appointment ID
              Text(
                appointmentId,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              // Status indicator
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Kebab menu
              Icon(Icons.more_vert, color: const Color(0xFF666666), size: 18),
            ],
          ),
          const SizedBox(height: 12),
          // Middle section: Patient info (left) + Doctor info (right)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column - Patient info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Patient: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: patientName,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Type: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: type,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right column - Doctor info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Doctors: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: doctorName,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Department: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: department,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Bottom row: Pay Now link (left) + Fee (right)
          Row(
            children: [
              // Pay Now link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentDetailsScreen(
                        appointmentId: '23454G',
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(60, 32),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Color(0xFF007BFF),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              // Fee display (if provided)
              if (fee != null)
                Text(
                  fee,
                  style: const TextStyle(
                    color: Color(0xFF28A745),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    AppointmentDashboardViewModel viewModel,
    bool isTablet,
  ) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 20 : 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: isTablet ? 64 : 80,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                'Connection Error',
                style: TextStyle(
                  fontSize: isTablet ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Unable to connect to the server.\nPlease check your internet connection.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? 14 : 16,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  viewModel.initializeDashboard();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Showing demo data for development',
                style: TextStyle(
                  fontSize: isTablet ? 12 : 14,
                  color: Colors.grey[400],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
