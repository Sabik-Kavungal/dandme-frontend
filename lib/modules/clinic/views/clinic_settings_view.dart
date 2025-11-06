import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:a/modules/clinic/views/doctor_details_content.dart';
import 'package:a/modules/clinic/views/patients/clinic_patients_list_view.dart';
import 'package:a/modules/clinic/viewmodels/clinic_settings_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_doctors_model.dart';

/// Simple SaaS-Style Clinic Settings Screen
/// Clean, minimal design with reduced spacing

// ============================================================================
// STYLE CONSTANTS
// ============================================================================

class SaaSStyles {
  // Simple Black, White & Gray Color Palette
  static const Color primaryColor = Color(0xFF000000); // Black
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textMuted = Color(0xFF999999);

  // Status Colors - Matching appointments dashboard
  static const Color activeColor = Color(0xFF2E7D32);
  static const Color activeDotColor = Color(0xFF4CAF50);
  static const Color activeBg = Color(0xFFE8F5E8);

  static const Color inactiveColor = Color(0xFFD32F2F);
  static const Color inactiveDotColor = Color(0xFFF44336);
  static const Color inactiveBg = Color(0xFFFFEBEE);

  static const Color leaveColor = Color(0xFFF57C00);
  static const Color leaveDotColor = Color(0xFFFFC107);
  static const Color leaveBg = Color(0xFFFFF3E0);
}

// ============================================================================
// MAIN WIDGET
// ============================================================================

class ClinicSettingsScreen extends StatefulWidget {
  final Function(String)? onNavigate;

  const ClinicSettingsScreen({super.key, this.onNavigate});

  @override
  State<ClinicSettingsScreen> createState() => _ClinicSettingsScreenState();
}

class _ClinicSettingsScreenState extends State<ClinicSettingsScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedTab = 0; // 0 = Doctors, 1 = Patients

  @override
  void initState() {
    super.initState();
    // Load clinic doctors on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ClinicSettingsViewModel>().loadClinicDoctors();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<ClinicSettingsViewModel>().searchDoctors(
      _searchController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClinicSettingsViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          color: SaaSStyles.backgroundColor,
          child: Column(
            children: [
              _buildHeader(viewModel),
              _buildTabBar(),
              Expanded(child: _buildContent(viewModel)),
            ],
          ),
        );
      },
    );
  }

  // ============================================================================
  // TAB BAR
  // ============================================================================

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: SaaSStyles.borderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          _buildTab('Doctors', 0, Icons.person),
          _buildTab('Patients', 1, Icons.people),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, IconData icon) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? Colors.black : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ClinicSettingsViewModel viewModel) {
    if (_selectedTab == 0) {
      // Doctors tab
      return SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionBar(),
            const SizedBox(height: 12),
            _buildDoctorsTable(viewModel),
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      );
    } else {
      // Patients tab
      return const ClinicPatientsListView();
    }
  }

  // ============================================================================
  // HEADER
  // ============================================================================

  Widget _buildHeader(ClinicSettingsViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: SaaSStyles.borderColor, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Doctor Management',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: SaaSStyles.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: SaaSStyles.borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: SaaSStyles.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '12 Jan 2025',
                        style: TextStyle(
                          fontSize: 11,
                          color: SaaSStyles.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // ACTION BAR
  // ============================================================================

  Widget _buildActionBar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        if (isMobile) {
          return Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 8),
              SizedBox(width: double.infinity, child: _buildAddButton()),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: _buildSearchBar()),
            const SizedBox(width: 8),
            _buildAddButton(),
          ],
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: SaaSStyles.borderColor),
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, size: 16, color: SaaSStyles.textMuted),
          hintText: 'Search doctors...',
          hintStyle: TextStyle(fontSize: 12, color: SaaSStyles.textMuted),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      height: 36,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Add New Doctor')));
        },
        icon: const Icon(Icons.add, size: 14),
        label: const Text(
          'Add Doctor',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: SaaSStyles.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }

  // ============================================================================
  // DOCTORS TABLE
  // ============================================================================

  Widget _buildDoctorsTable(ClinicSettingsViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SaaSStyles.borderColor),
      ),
      child: Column(
        children: [
          // Table header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: SaaSStyles.borderColor)),
            ),
            child: Row(
              children: [
                const Text(
                  'Linked Doctors',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: SaaSStyles.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${viewModel.clinicDoctors.length} total',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: SaaSStyles.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Table content
          LayoutBuilder(
            builder: (context, constraints) {
              // Mobile card view for screens < 600px
              if (constraints.maxWidth < 600) {
                return _buildMobileCardView(viewModel);
              }
              // Table view for all other screens - full width
              return _buildDesktopTable(constraints.maxWidth, viewModel);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTable(
    double maxWidth,
    ClinicSettingsViewModel viewModel,
  ) {
    const double minTableWidth = 900.0;

    // If screen is wide enough, show full width table
    if (maxWidth >= minTableWidth) {
      return SizedBox(
        width: maxWidth,
        child: DataTable(
          headingRowHeight: 38,
          dataRowHeight: 52,
          horizontalMargin: 12,
          columnSpacing: 16,
          dividerThickness: 0,
          headingRowColor: WidgetStateProperty.all(const Color(0xFFF8F9FA)),
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: SaaSStyles.textSecondary,
            letterSpacing: 0.2,
          ),
          dataTextStyle: const TextStyle(
            fontSize: 12,
            color: SaaSStyles.textPrimary,
          ),
          columns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('DOCTOR')),
            DataColumn(label: Text('SPECIALIZATION')),
            DataColumn(label: Text('QUALIFICATIONS')),
            DataColumn(label: Text('LICENSE')),
            DataColumn(label: Text('CONTACT')),
            DataColumn(label: Text('STATUS')),
            DataColumn(label: Text('')),
          ],
          rows: viewModel.clinicDoctors
              .asMap()
              .entries
              .map((entry) => _buildDataRow(entry.key + 1, entry.value))
              .toList(),
        ),
      );
    }

    // For smaller screens, enable horizontal scrolling
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: minTableWidth,
        child: DataTable(
          headingRowHeight: 38,
          dataRowHeight: 52,
          horizontalMargin: 12,
          columnSpacing: 16,
          dividerThickness: 0,
          headingRowColor: WidgetStateProperty.all(const Color(0xFFF8F9FA)),
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: SaaSStyles.textSecondary,
            letterSpacing: 0.2,
          ),
          dataTextStyle: const TextStyle(
            fontSize: 12,
            color: SaaSStyles.textPrimary,
          ),
          columns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('DOCTOR')),
            DataColumn(label: Text('SPECIALIZATION')),
            DataColumn(label: Text('QUALIFICATIONS')),
            DataColumn(label: Text('LICENSE')),
            DataColumn(label: Text('CONTACT')),
            DataColumn(label: Text('STATUS')),
            DataColumn(label: Text('')),
          ],
          rows: viewModel.clinicDoctors
              .asMap()
              .entries
              .map((entry) => _buildDataRow(entry.key + 1, entry.value))
              .toList(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(int index, ClinicDoctorModel doctor) {
    final fullName =
        doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}';
    final status = doctor.isActive == true ? 'Active' : 'Inactive';

    // Get initials for avatar
    final nameParts = fullName.split(' ');
    final initials = nameParts.length >= 2
        ? '${nameParts[0][0]}${nameParts[1][0]}'
        : nameParts[0].substring(0, 2);

    return DataRow(
      cells: [
        DataCell(
          Text(
            index.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: SaaSStyles.textSecondary,
            ),
          ),
          onTap: doctor.doctorId != null
              ? () {
                  context.go('/clinic/doctor-details/${doctor.doctorId!}');
                }
              : null,
        ),
        DataCell(
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    initials.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: SaaSStyles.textPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (doctor.doctorId != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            body: DoctorDetailsContent(
                              doctorId: doctor.doctorId!,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: SaaSStyles.textPrimary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Text(
                        doctor.specialization ?? 'Not specified',
                        style: const TextStyle(
                          fontSize: 10,
                          color: SaaSStyles.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            doctor.specialization ?? 'N/A',
            style: const TextStyle(fontSize: 12),
          ),
          onTap: doctor.id != null
              ? () {
                  context.go('/clinic/doctor-details/${doctor.doctorId!}');
                }
              : null,
        ),
        DataCell(
          Text(
            'MBBS', // Placeholder - add qualifications to model if needed
            style: const TextStyle(
              fontSize: 11,
              color: SaaSStyles.textSecondary,
            ),
          ),
          onTap: doctor.id != null
              ? () {
                  context.go('/clinic/doctor-details/${doctor.id!}');
                }
              : null,
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: SaaSStyles.borderColor),
            ),
            child: Text(
              doctor.licenseNumber ?? 'N/A',
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onTap: doctor.doctorId != null
              ? () {
                  context.go('/clinic/doctor-details/${doctor.doctorId!}');
                }
              : null,
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                doctor.email ?? 'N/A',
                style: const TextStyle(
                  fontSize: 11,
                  color: SaaSStyles.textSecondary,
                ),
              ),
              Text(
                doctor.phone ?? 'N/A',
                style: const TextStyle(
                  fontSize: 10,
                  color: SaaSStyles.textMuted,
                ),
              ),
            ],
          ),
          onTap: doctor.doctorId != null
              ? () {
                  context.go('/clinic/doctor-details/${doctor.doctorId!}');
                }
              : null,
        ),
        DataCell(
          _buildStatusBadge(status),
          onTap: doctor.doctorId != null
              ? () {
                  context.go('/clinic/doctor-details/${doctor.doctorId!}');
                }
              : null,
        ),
        DataCell(
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 18,
              color: SaaSStyles.textMuted,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onSelected: (value) {
              print('');
              print('═══════════════════════════════════════════════════════');
              print('🔍 MENU ITEM SELECTED');
              print('═══════════════════════════════════════════════════════');
              print('Selected value: $value');
              print('Doctor ID: ${doctor.id}');
              print('Doctor Name: $fullName');
              print('');

              if (value == 'view' && doctor.id != null) {
                print('✅ Navigating to Doctor Details...');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: DoctorDetailsContent(doctorId: doctor.id!),
                    ),
                  ),
                );
                print('✅ Navigation called');
              } else if (value == 'edit') {
                print('📝 Edit selected');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit feature coming soon')),
                );
              } else {
                print('❌ No action for value: $value');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 16),
                    SizedBox(width: 10),
                    Text('Edit'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'view',
                child: Row(
                  children: [
                    Icon(Icons.visibility, size: 16),
                    SizedBox(width: 10),
                    Text('View Details'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    Color bgColor;

    switch (status) {
      case 'Active':
        color = SaaSStyles.activeColor;
        bgColor = SaaSStyles.activeBg;
        break;
      case 'Inactive':
        color = SaaSStyles.inactiveColor;
        bgColor = SaaSStyles.inactiveBg;
        break;
      case 'On leave':
        color = SaaSStyles.leaveColor;
        bgColor = SaaSStyles.leaveBg;
        break;
      default:
        color = SaaSStyles.textMuted;
        bgColor = const Color(0xFFF3F4F6);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // MOBILE CARD VIEW
  // ============================================================================

  Widget _buildMobileCardView(ClinicSettingsViewModel viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: viewModel.clinicDoctors.length,
      itemBuilder: (context, index) {
        final doctor = viewModel.clinicDoctors[index];
        return _buildDoctorCard(doctor, index + 1);
      },
    );
  }

  Widget _buildDoctorCard(ClinicDoctorModel doctor, int index) {
    final fullName =
        doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}';
    final status = doctor.isActive == true ? 'Active' : 'Inactive';

    // Get status color based on status
    Color getStatusColor() {
      return doctor.isActive == true
          ? const Color(0xFF28A745) // Green
          : const Color(0xFFDC3545); // Red
    }

    return GestureDetector(
      onTap: () {
        if (doctor.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Scaffold(body: DoctorDetailsContent(doctorId: doctor.id!)),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Top row: Doctor ID + Status + Menu
            Row(
              children: [
                Text(
                  '#${index.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const Spacer(),
                // Status indicator
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                // Kebab menu
                Icon(Icons.more_vert, color: const Color(0xFF666666), size: 16),
              ],
            ),
            const SizedBox(height: 10),
            // Doctor info section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column - Doctor details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Doctor: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: fullName,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Specialization: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: doctor.specialization ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 12,
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
                const SizedBox(width: 12),
                // Right column - Qualification & License
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Qualification: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: 'MBBS', // Placeholder
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'License: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: doctor.licenseNumber ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 12,
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
            const SizedBox(height: 12),
            // Bottom row: Contact info
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.email ?? 'N/A',
                        style: const TextStyle(
                          color: SaaSStyles.textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        doctor.phone ?? 'N/A',
                        style: const TextStyle(
                          color: SaaSStyles.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // FOOTER
  // ============================================================================

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 Dr&Me. All rights reserved.',
        style: TextStyle(fontSize: 11, color: SaaSStyles.textMuted),
      ),
    );
  }
}
