import 'package:flutter/material.dart';
import 'package:a/modules/clinic/views/doctor_details_view.dart';

/// Simple SaaS-Style Clinic Settings Screen
/// Clean, minimal design with reduced spacing

// ============================================================================
// DATA MODELS
// ============================================================================

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String qualification;
  final String licenseNo;
  final String email;
  final String phone;
  final String status;
  final int experience;
  final int patients;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    required this.licenseNo,
    required this.email,
    required this.phone,
    required this.status,
    this.experience = 5,
    this.patients = 120,
  });
}

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
// MOCK DATA
// ============================================================================

final List<Doctor> _mockDoctors = [
  Doctor(
    id: '01',
    name: 'Dr. Arun Krishna',
    specialization: 'Cardiology',
    qualification: 'MD, MBBS, DM',
    licenseNo: 'MD-CS-1001',
    email: 'arun.k@clinic.com',
    phone: '+91-98765-43210',
    status: 'Active',
    experience: 12,
    patients: 450,
  ),
  Doctor(
    id: '02',
    name: 'Dr. Sarah Johnson',
    specialization: 'Neurology',
    qualification: 'MD, MBBS',
    licenseNo: 'MD-NR-1002',
    email: 'sarah.j@clinic.com',
    phone: '+91-98765-43211',
    status: 'Active',
    experience: 8,
    patients: 320,
  ),
  Doctor(
    id: '03',
    name: 'Dr. Michael Chen',
    specialization: 'Orthopedics',
    qualification: 'MS, MBBS',
    licenseNo: 'MS-OR-1003',
    email: 'michael.c@clinic.com',
    phone: '+91-98765-43212',
    status: 'On leave',
    experience: 15,
    patients: 580,
  ),
  Doctor(
    id: '04',
    name: 'Dr. Priya Sharma',
    specialization: 'Pediatrics',
    qualification: 'MD, MBBS, DCH',
    licenseNo: 'MD-PD-1004',
    email: 'priya.s@clinic.com',
    phone: '+91-98765-43213',
    status: 'Active',
    experience: 10,
    patients: 390,
  ),
  Doctor(
    id: '05',
    name: 'Dr. James Wilson',
    specialization: 'Dermatology',
    qualification: 'MD, MBBS',
    licenseNo: 'MD-DR-1005',
    email: 'james.w@clinic.com',
    phone: '+91-98765-43214',
    status: 'Inactive',
    experience: 6,
    patients: 210,
  ),
  Doctor(
    id: '06',
    name: 'Dr. Ananya Reddy',
    specialization: 'Gynecology',
    qualification: 'MD, MBBS, DGO',
    licenseNo: 'MD-GY-1006',
    email: 'ananya.r@clinic.com',
    phone: '+91-98765-43215',
    status: 'Active',
    experience: 14,
    patients: 510,
  ),
  Doctor(
    id: '07',
    name: 'Dr. Robert Taylor',
    specialization: 'ENT',
    qualification: 'MS, MBBS',
    licenseNo: 'MS-ENT-1007',
    email: 'robert.t@clinic.com',
    phone: '+91-98765-43216',
    status: 'Active',
    experience: 9,
    patients: 340,
  ),
  Doctor(
    id: '08',
    name: 'Dr. Lisa Anderson',
    specialization: 'Ophthalmology',
    qualification: 'MD, MBBS, DO',
    licenseNo: 'MD-OP-1008',
    email: 'lisa.a@clinic.com',
    phone: '+91-98765-43217',
    status: 'On leave',
    experience: 11,
    patients: 420,
  ),
];

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
  List<Doctor> _filteredDoctors = List.from(_mockDoctors);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterDoctors);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDoctors() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      if (query.isEmpty) {
        _filteredDoctors = List.from(_mockDoctors);
      } else {
        _filteredDoctors = _mockDoctors
            .where(
              (doctor) =>
                  doctor.name.toLowerCase().contains(query) ||
                  doctor.specialization.toLowerCase().contains(query) ||
                  doctor.qualification.toLowerCase().contains(query) ||
                  doctor.licenseNo.toLowerCase().contains(query) ||
                  doctor.email.toLowerCase().contains(query) ||
                  doctor.phone.contains(query),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SaaSStyles.backgroundColor,
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActionBar(),
                  const SizedBox(height: 12),
                  _buildDoctorsTable(),
                  const SizedBox(height: 16),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // HEADER
  // ============================================================================

  Widget _buildHeader() {
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
            _buildTabs(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTab('Doctor Onboarding', true),
          const SizedBox(width: 12),
          _buildTab('Patients', false),
          const SizedBox(width: 12),
          _buildTab('Doctors', false),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF0F0F0) : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: isActive
            ? Border.all(color: const Color(0xFFE0E0E0), width: 1)
            : null,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? SaaSStyles.textPrimary : SaaSStyles.textSecondary,
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

  Widget _buildDoctorsTable() {
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
                    '${_filteredDoctors.length} total',
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
                return _buildMobileCardView();
              }
              // Table view for all other screens - full width
              return _buildDesktopTable(constraints.maxWidth);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTable(double maxWidth) {
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
          rows: _filteredDoctors
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
          rows: _filteredDoctors
              .asMap()
              .entries
              .map((entry) => _buildDataRow(entry.key + 1, entry.value))
              .toList(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(int index, Doctor doctor) {
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
                    doctor.name.split(' ')[1][0] +
                        doctor.name.split(' ').last[0],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DoctorDetailsScreen(doctorId: doctor.id),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: SaaSStyles.textPrimary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Text(
                        '${doctor.experience} years exp',
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
          Text(doctor.specialization, style: const TextStyle(fontSize: 12)),
        ),
        DataCell(
          Text(
            doctor.qualification,
            style: const TextStyle(
              fontSize: 11,
              color: SaaSStyles.textSecondary,
            ),
          ),
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
              doctor.licenseNo,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                doctor.email,
                style: const TextStyle(
                  fontSize: 11,
                  color: SaaSStyles.textSecondary,
                ),
              ),
              Text(
                doctor.phone,
                style: const TextStyle(
                  fontSize: 10,
                  color: SaaSStyles.textMuted,
                ),
              ),
            ],
          ),
        ),
        DataCell(_buildStatusBadge(doctor.status)),
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
                    Text('View'),
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

  Widget _buildMobileCardView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: _filteredDoctors.length,
      itemBuilder: (context, index) {
        final doctor = _filteredDoctors[index];
        return _buildDoctorCard(doctor, index + 1);
      },
    );
  }

  Widget _buildDoctorCard(Doctor doctor, int index) {
    // Get status color based on status
    Color getStatusColor() {
      switch (doctor.status) {
        case 'Active':
          return const Color(0xFF28A745); // Green
        case 'Inactive':
          return const Color(0xFFDC3545); // Red
        case 'On leave':
          return const Color(0xFFFFC107); // Yellow
        default:
          return const Color(0xFF666666);
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailsScreen(doctorId: doctor.id),
          ),
        );
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
                        doctor.status,
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
                              text: doctor.name,
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
                              text: doctor.specialization,
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
                              text: doctor.qualification,
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
                              text: doctor.licenseNo,
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
                        doctor.email,
                        style: const TextStyle(
                          color: SaaSStyles.textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        doctor.phone,
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
