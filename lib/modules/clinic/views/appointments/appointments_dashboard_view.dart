import 'package:a/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:a/modules/clinic/views/appointments/appointment_details_view.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

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
              // For small mobile screens only (width < 600px), use the card design
              if (constraints.maxWidth < 600) {
                return _buildMobileLayout(viewModel);
              }
              // For tablets and desktop screens (width >= 600px), use the table layout
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
            padding: EdgeInsets.all(isTablet ? 6 : 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Section
                _buildGreetingSection(),
                SizedBox(height: isTablet ? 4 : 4),
                // Summary Cards
                _buildSummaryCards(viewModel),
                SizedBox(height: isTablet ? 8 : 10),

                // Table Controls
                _buildTableControls(viewModel),
                SizedBox(height: isTablet ? 6 : 8),

                // Appointments Table
                _buildAppointmentsTable(viewModel),
                SizedBox(height: isTablet ? 6 : 8),

                // Pagination
                _buildPagination(viewModel),
                SizedBox(height: isTablet ? 8 : 10),

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
            horizontal: isMobile ? 8 : (isTablet ? 10 : 12),
            vertical: isMobile ? 6 : (isTablet ? 6 : 8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF10B981), Color(0xFF059669)],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF10B981).withOpacity(0.4),
                                blurRadius: 4,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hi Arun Krishna, ',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: isMobile
                                        ? 12
                                        : (isTablet ? 13 : 14),
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xFF6B7280),
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Good Morning! ',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: isMobile
                                        ? 12
                                        : (isTablet ? 13 : 14),
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                    letterSpacing: 0,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: '✨',
                                  style: TextStyle(
                                    fontSize: isMobile
                                        ? 12
                                        : (isTablet ? 13 : 14),
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Modern date button
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 6 : 8,
                  vertical: isMobile ? 4 : 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.02),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.calendar_today,
                        color: const Color(0xFF6366F1),
                        size: isMobile ? 9 : 10,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '12 Jan 2025',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: const Color(0xFF374151),
                        fontSize: isMobile ? 10 : 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                        height: 1.1,
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
                  const SizedBox(width: 8),
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
              const SizedBox(height: 8),
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
                  const SizedBox(width: 8),
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
              const SizedBox(width: 8),
              Expanded(
                child: _buildUnifiedSummaryCard(
                  '${summary?.upcomingAppointments ?? 12}',
                  'Upcoming Appointments',
                  const Color(0xFFE0F0B0),
                  Icons.calendar_month,
                  constraints,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildUnifiedSummaryCard(
                  '${summary?.completedAppointments ?? 34}',
                  'Completed Appointments',
                  const Color(0xFFB0F0B0),
                  Icons.check_circle,
                  constraints,
                ),
              ),
              const SizedBox(width: 8),
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
    final cardType = _getCardType(label);

    // Calculate consistent dimensions based on screen size
    final cardHeight = isMobile ? 60.0 : 65.0;
    final iconSize = isMobile ? 20.0 : 24.0;
    final iconInnerSize = isMobile ? 10.0 : 12.0;
    final padding = isMobile ? 6.0 : 8.0;
    final borderRadius = 5.0; // Reduced for modern look

    return Container(
      height: cardHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: _getCardGradient(cardType, color),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Unique wavy background pattern based on card type
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: CustomPaint(
              size: Size(100, cardHeight),
              painter: _getWavyPainter(cardType),
            ),
          ),
          // Futuristic grid pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPatternPainter(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 0.5,
              ),
            ),
          ),
          // Content
          Row(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.white.withOpacity(0.8)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: iconInnerSize,
                  color: _getIconColor(cardType),
                ),
              ),
              SizedBox(width: isMobile ? 8 : 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF333333),
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(height: isMobile ? 1 : 1),
                    Flexible(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: isMobile ? 8 : 9,
                          color: const Color(0xFF333333).withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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

  Widget _buildTableControls(AppointmentDashboardViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth < 1024;

        return Column(
          children: [
            // Tabs
            _buildTabsRow(viewModel),
            const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 1),
            SizedBox(height: isTablet ? 6 : 8),
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
            SizedBox(width: isTablet ? 6 : 8),
            _buildTab('Patients', 1, viewModel),
            SizedBox(width: isTablet ? 6 : 8),
            _buildTab('Doctors', 2, viewModel),
            const Spacer(),
            // New Appointment Button
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 8 : 10,
                  vertical: isTablet ? 3 : 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(isTablet ? 4 : 5),
                ),
              ),
              icon: Icon(Icons.add, size: isTablet ? 11 : 12),
              label: Text(
                'New Appointment',
                style: TextStyle(fontSize: isTablet ? 10 : 11),
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
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              onChanged: (value) => viewModel.setSearchQuery(value),
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 11, color: Color(0xFF666666)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF666666),
                  size: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                isDense: true,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        // Filter Button
        _buildFilterButton(),
        const SizedBox(width: 6),
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
        padding: const EdgeInsets.symmetric(vertical: 4),
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
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF666666),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        icon: const Icon(Icons.keyboard_arrow_down, size: 14),
        label: const Text('Filter', style: TextStyle(fontSize: 11)),
      ),
    );
  }

  Widget _buildSortableHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 10,
        color: Color(0xFF333333),
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
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
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () => viewModel.toggleViewMode(),
        borderRadius: BorderRadius.circular(5),
        child: Icon(icon, size: 14, color: const Color(0xFF666666)),
      ),
    );
  }

  Widget _buildAppointmentsTable(AppointmentDashboardViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
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
                  const Color(0xFFF8F9FA),
                ),
                headingRowHeight: 36,
                horizontalMargin: constraints.maxWidth < 1200 ? 4 : 8,
                columnSpacing: constraints.maxWidth < 1200 ? 4 : 8,
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color(0xFF333333),
                ),
                dataTextStyle: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF333333),
                ),
                dividerThickness: 1,
                dataRowMinHeight: 42,
                dataRowMaxHeight: 42,
                columns: [
                  DataColumn(label: _buildSortableHeader('#')),
                  DataColumn(label: _buildSortableHeader('Mo ID')),
                  DataColumn(label: _buildSortableHeader('Patient Name')),
                  DataColumn(label: _buildSortableHeader('Doctors Name')),
                  DataColumn(label: _buildSortableHeader('Department')),
                  DataColumn(label: _buildSortableHeader('Consultation Type')),
                  DataColumn(
                    label: _buildSortableHeader('Appointment Date & Time'),
                  ),
                  DataColumn(label: _buildSortableHeader('STATUS')),
                  DataColumn(label: _buildSortableHeader('Fee Status')),
                  DataColumn(label: Text('')),
                ],
                rows: List.generate(
                  10,
                  (index) => _buildDataTableRow(index + 1, null, viewModel),
                ),
              ),
            );
          }
          // For smaller screens, enable horizontal scrolling
          else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: minTableWidth,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                    const Color(0xFFF8F9FA),
                  ),
                  headingRowHeight: 36,
                  horizontalMargin: 4,
                  columnSpacing: 4,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Color(0xFF333333),
                  ),
                  dataTextStyle: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF333333),
                  ),
                  dividerThickness: 1,
                  dataRowMinHeight: 42,
                  dataRowMaxHeight: 42,
                  columns: [
                    DataColumn(label: _buildSortableHeader('#')),
                    DataColumn(label: _buildSortableHeader('Mo ID')),
                    DataColumn(label: _buildSortableHeader('Patient Name')),
                    DataColumn(label: _buildSortableHeader('Doctors Name')),
                    DataColumn(label: _buildSortableHeader('Department')),
                    DataColumn(
                      label: _buildSortableHeader('Consultation Type'),
                    ),
                    DataColumn(
                      label: _buildSortableHeader('Appointment Date & Time'),
                    ),
                    DataColumn(label: _buildSortableHeader('STATUS')),
                    DataColumn(label: _buildSortableHeader('Fee Status')),
                    DataColumn(label: Text('')),
                  ],
                  rows: List.generate(
                    10,
                    (index) => _buildDataTableRow(index + 1, null, viewModel),
                  ),
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
    dynamic appointment,
    AppointmentDashboardViewModel viewModel,
  ) {
    return DataRow(
      color: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) => Colors.white,
      ),
      cells: [
        DataCell(Text('${index.toString().padLeft(2, '0')}')),
        DataCell(Text(_getMoIdForRow(index))),
        DataCell(_buildPatientProfileCellDynamic(index)),
        DataCell(Text(_getDoctorNameForRow(index))),
        DataCell(Text(_getDepartmentForRow(index))),
        DataCell(_buildConsultationTypePill(_getConsultationTypeForRow(index))),
        DataCell(Text(_getAppointmentDateForRow(index))),
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

  String _getDocNumberForRow(int index) {
    // Sample document numbers matching the image
    switch (index) {
      case 0:
        return 'BEC/11/AR/230001';
      case 1:
        return 'BEC/11/AR/230002';
      case 2:
        return 'BEC/11/AR/230003';
      case 3:
        return 'BEC/11/AR/230004';
      case 4:
        return 'BEC/11/AR/230005';
      case 5:
        return 'BEC/11/AR/230006';
      case 6:
        return 'BEC/11/AR/230007';
      case 7:
        return 'BEC/11/AR/230008';
      default:
        return 'BEC/11/AR/23000${index + 1}';
    }
  }

  String _getDocDateForRow(int index) {
    // Sample dates in YYYY/MM/DD format
    switch (index) {
      case 0:
        return '2024/06/06';
      case 1:
        return '2024/06/07';
      case 2:
        return '2024/06/08';
      case 3:
        return '2024/06/09';
      case 4:
        return '2024/06/10';
      case 5:
        return '2024/06/11';
      case 6:
        return '2024/06/12';
      case 7:
        return '2024/06/13';
      default:
        return '2024/06/14';
    }
  }

  String _getDocTypeForRow(int index) {
    // Sample document types
    switch (index) {
      case 0:
        return 'Z5E - Transfer Disposal ke Cabang Lain';
      case 1:
        return 'TCTV - Transfer Congsignment To Van';
      case 2:
        return 'Z5E - Transfer Disposal ke Cabang Lain';
      case 3:
        return 'TCTV - Transfer Congsignment To Van';
      case 4:
        return 'Z5E - Transfer Disposal ke Cabang Lain';
      case 5:
        return 'TCTV - Transfer Congsignment To Van';
      case 6:
        return 'Z5E - Transfer Disposal ke Cabang Lain';
      case 7:
        return 'TCTV - Transfer Congsignment To Van';
      default:
        return 'Z5E - Transfer Disposal ke Cabang Lain';
    }
  }

  String _getWHSourceForRow(int index) {
    // Sample warehouse source codes
    switch (index) {
      case 0:
        return 'DS0001.DS000102';
      case 1:
        return 'DS0002.DS000103';
      case 2:
        return 'DS0003.DS000104';
      case 3:
        return 'DS0004.DS000105';
      case 4:
        return 'DS0005.DS000106';
      case 5:
        return 'DS0006.DS000107';
      case 6:
        return 'DS0007.DS000108';
      case 7:
        return 'DS0008.DS000109';
      default:
        return 'DS0009.DS000110';
    }
  }

  String _getWHForRow(int index) {
    // Sample warehouse codes
    switch (index) {
      case 0:
        return 'WH001';
      case 1:
        return 'WH002';
      case 2:
        return 'WH003';
      case 3:
        return 'WH004';
      case 4:
        return 'WH005';
      case 5:
        return 'WH006';
      case 6:
        return 'WH007';
      case 7:
        return 'WH008';
      default:
        return 'WH009';
    }
  }

  String _getDepartmentForRow(int index) {
    const departments = [
      'Cardiology',
      'Dermatology',
      'Neurology',
      'Cardiology',
      'Dermatology',
      'Cardiology',
      'Cardiology',
      'Dermatology',
      'Orthopedics',
      'Pediatrics',
    ];
    return departments[index % departments.length];
  }

  String _getConsultationTypeForRow(int index) {
    const types = [
      'Clinic Visit',
      'Follow Up',
      'Online Consultation',
      'Clinic Visit',
      'Follow Up',
      'Clinic Visit',
      'Online Consultation',
      'Clinic Visit',
      'Follow Up',
      'Online Consultation',
    ];
    return types[index % types.length];
  }

  String _getStatusForRow(int index) {
    const statuses = [
      'Upcoming',
      'Completed',
      'Cancelled',
      'Cancelled',
      'Cancelled',
      'Upcoming',
      'Completed',
      'Cancelled',
      'Upcoming',
      'Completed',
    ];
    return statuses[index % statuses.length];
  }

  String _getMoIdForRow(int index) {
    const ids = [
      '#23454G',
      '#23455H',
      '#23456I',
      '#23457J',
      '#23458K',
      '#23459L',
      '#23460M',
      '#23461N',
      '#23462O',
      '#23463P',
    ];
    return ids[index % ids.length];
  }

  String _getPatientNameForRow(int index) {
    const names = [
      'Arun Krishna',
      'Sarah Johnson',
      'John Smith',
      'Emily Davis',
      'Michael Chen',
      'Anna Rodriguez',
      'Tom Wilson',
      'Lisa Anderson',
      'David Martinez',
      'Maria Garcia',
    ];
    return names[index % names.length];
  }

  String _getDoctorNameForRow(int index) {
    const doctors = [
      'Dr. Alan Green',
      'Dr. Maria Garcia',
      'Dr. David Wilson',
      'Dr. Lisa Brown',
      'Dr. Robert Taylor',
      'Dr. Jennifer Lee',
      'Dr. Alex Johnson',
      'Dr. Sarah White',
      'Dr. James Miller',
      'Dr. Emma Davis',
    ];
    return doctors[index % doctors.length];
  }

  String _getAppointmentDateForRow(int index) {
    const dates = [
      '11-03-2025 09:00 AM',
      '12-03-2025 10:30 AM',
      '13-03-2025 02:00 PM',
      '14-03-2025 11:15 AM',
      '15-03-2025 03:30 PM',
      '16-03-2025 09:45 AM',
      '17-03-2025 01:00 PM',
      '18-03-2025 04:15 PM',
      '19-03-2025 10:00 AM',
      '20-03-2025 02:30 PM',
    ];
    return dates[index % dates.length];
  }

  Widget _buildPatientProfileCellDynamic(int index) {
    final patientName = _getPatientNameForRow(index);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Icon (Circular)
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: const Icon(Icons.person, size: 12, color: Color(0xFF666666)),
        ),
        const SizedBox(width: 4),
        // Name and Roles
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              patientName,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.person_outline, size: 8, color: Color(0xFF999999)),
                SizedBox(width: 2),
                Text(
                  'Patient',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xFF999999),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _getFeeStatusForRow(int index) {
    // Paid status for indices: 1, 5, 6, 9
    const paidIndices = [1, 5, 6, 9];

    if (paidIndices.contains(index)) {
      return Text(
        '₹600.00',
        style: const TextStyle(color: Color(0xFF333333), fontSize: 10),
      );
    } else {
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
            fontSize: 10,
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 9, color: textColor),
          const SizedBox(width: 2),
          Flexible(
            child: Text(
              type,
              style: TextStyle(
                color: textColor,
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 3),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernStatusChip(String status) {
    Color textColor;
    Color backgroundColor;

    switch (status) {
      case 'OPEN':
        textColor = Colors.white;
        backgroundColor = const Color(0xFF2196F3);
        break;
      case 'CLOSED':
        textColor = Colors.white;
        backgroundColor = const Color(0xFFF44336);
        break;
      default:
        textColor = Colors.white;
        backgroundColor = const Color(0xFF2196F3);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPatientProfileCell() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Icon (Circular)
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: const Icon(Icons.person, size: 14, color: Color(0xFF666666)),
        ),
        const SizedBox(width: 6),
        // Name and Roles
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Arun Krishna',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 9,
                  color: Color(0xFF999999),
                ),
                const SizedBox(width: 2),
                const Text(
                  'Patient',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color(0xFF999999),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDocTypeWithIcon(String docType) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          docType,
          style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
        ),
        if (docType.contains('TCTV'))
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Icon(Icons.auto_awesome, size: 12, color: Color(0xFFE91E63)),
          ),
      ],
    );
  }

  Widget _buildPagination(AppointmentDashboardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: viewModel.hasMoreData
              ? () => viewModel.loadMoreAppointments()
              : null,
          icon: const Icon(Icons.chevron_left, size: 20),
          color: const Color(0xFF666666),
        ),
        const SizedBox(width: 8),
        _buildPageNumber(6, true),
        const SizedBox(width: 4),
        _buildPageNumber(7, false),
        const SizedBox(width: 4),
        _buildPageNumber(8, false),
        const SizedBox(width: 4),
        const Text('...', style: TextStyle(color: Color(0xFF666666))),
        const SizedBox(width: 4),
        _buildPageNumber(50, false),
        const SizedBox(width: 8),
        IconButton(
          onPressed: viewModel.hasMoreData
              ? () => viewModel.loadMoreAppointments()
              : null,
          icon: const Icon(Icons.chevron_right, size: 20),
          color: const Color(0xFF666666),
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
          color: isActive ? const Color(0xFF2196F3) : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF333333),
              fontWeight: FontWeight.w500,
              fontSize: 14,
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

  // Helper methods for card styling
  String _getCardType(String label) {
    if (label.contains('Today')) return 'today';
    if (label.contains('Upcoming')) return 'upcoming';
    if (label.contains('Completed')) return 'completed';
    if (label.contains('Cancelled')) return 'cancelled';
    return 'default';
  }

  LinearGradient _getCardGradient(String cardType, Color baseColor) {
    switch (cardType) {
      case 'today':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFE8D5FF), // Very light purple
            const Color(0xFFD1B3FF), // Light purple
            const Color(0xFFB088F0), // Original purple
          ],
        );
      case 'upcoming':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFF0F8D1), // Very light green
            const Color(0xFFE8F0B0), // Light green
            const Color(0xFFE0F0B0), // Original light green
          ],
        );
      case 'completed':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD1F0D1), // Very light green
            const Color(0xFFB8E8B8), // Light green
            const Color(0xFFB0F0B0), // Original green
          ],
        );
      case 'cancelled':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFF8D1D1), // Very light pink
            const Color(0xFFF0B8B8), // Light pink
            const Color(0xFFF0B0B0), // Original pink
          ],
        );
      default:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [baseColor, baseColor.withOpacity(0.8)],
        );
    }
  }

  Color _getIconColor(String cardType) {
    switch (cardType) {
      case 'today':
        return const Color(0xFFB088F0);
      case 'upcoming':
        return const Color(0xFFE0F0B0);
      case 'completed':
        return const Color(0xFFB0F0B0);
      case 'cancelled':
        return const Color(0xFFF0B0B0);
      default:
        return const Color(0xFF333333);
    }
  }

  CustomPainter _getWavyPainter(String cardType) {
    switch (cardType) {
      case 'today':
        return _TodayWavyPainter();
      case 'upcoming':
        return _UpcomingWavyPainter();
      case 'completed':
        return _CompletedWavyPainter();
      case 'cancelled':
        return _CancelledWavyPainter();
      default:
        return _DefaultWavyPainter();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

/// Grid pattern painter for futuristic look
class _GridPatternPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _GridPatternPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const double spacing = 20.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Today's Appointments - Calendar wave pattern
class _TodayWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.4;

    path.moveTo(0, size.height);

    // Calendar-like wave pattern
    for (double x = 0; x <= size.width; x += 6) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.3 * sin(x / size.width * 4 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 8 * pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw wave line
    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.3 * sin(0)) +
          (waveHeight * 0.2 * sin(0)),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.3 * sin(x / size.width * 4 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 8 * pi));
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Upcoming Appointments - Rising wave pattern
class _UpcomingWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.22)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.5;

    path.moveTo(0, size.height);

    // Rising wave pattern
    for (double x = 0; x <= size.width; x += 5) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.4 * sin(x / size.width * 3 * pi)) +
          (x / size.width * waveHeight * 0.3);
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw wave line
    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.4 * sin(0)) +
          (0 / size.width * waveHeight * 0.3),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.4 * sin(x / size.width * 3 * pi)) +
          (x / size.width * waveHeight * 0.3);
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Completed Appointments - Checkmark wave pattern
class _CompletedWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.28)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.35;

    path.moveTo(0, size.height);

    // Checkmark-like wave pattern
    for (double x = 0; x <= size.width; x += 8) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.5 * sin(x / size.width * 2 * pi)) +
          (waveHeight * 0.3 * sin(x / size.width * 6 * pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw wave line
    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.5 * sin(0)) +
          (waveHeight * 0.3 * sin(0)),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.5 * sin(x / size.width * 2 * pi)) +
          (waveHeight * 0.3 * sin(x / size.width * 6 * pi));
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Cancelled Appointments - Cross wave pattern
class _CancelledWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.45;

    path.moveTo(0, size.height);

    // Cross-like wave pattern
    for (double x = 0; x <= size.width; x += 6) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.6 * sin(x / size.width * 5 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 10 * pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw wave line
    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.6 * sin(0)) +
          (waveHeight * 0.2 * sin(0)),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.6 * sin(x / size.width * 5 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 10 * pi));
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Default wave pattern
class _DefaultWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = size.height * 0.3;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 10) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.5 * (1 + sin(x / size.width * 2 * pi)));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
