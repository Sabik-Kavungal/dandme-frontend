import 'package:flutter/material.dart';

/// Simple SaaS-Style Doctor Details Screen
/// Clean, minimal design with reduced spacing

class DoctorDetailsScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  bool _isOfflineTimingExpanded = true;
  bool _isOnlineTimingExpanded = true;

  // Mock data for the doctor
  final Map<String, dynamic> _doctorData = {
    'name': 'Dr. Arun Krishna',
    'licenseNo': 'MD-CS-1001',
    'joinDate': '15 May 2019',
    'specialization': 'Cardiology',
    'qualification': 'MD, MBBS, DM',
    'experience': '12',
    'mobile': '+91-98765-43210',
    'email': 'arun.k@clinic.com',
    'biography':
        'Experienced cardiologist with over 12 years of practice in diagnosing and treating heart conditions. Specialized in interventional cardiology and preventive care.',
    'onlineFee': '500',
    'offlineFee': '600',
    'patients': '450',
    'status': 'Active',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWeb = constraints.maxWidth >= 1024;
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(isWeb ? 10 : 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileSection(),
                        SizedBox(height: isWeb ? 8 : 6),
                        _buildQuickStats(),
                        SizedBox(height: isWeb ? 8 : 6),
                        if (isWeb) _buildBiographySection(),
                        if (isWeb) const SizedBox(height: 8),
                        // Web layout - optimized grid
                        if (isWeb) _buildWebGridLayout(),
                        // Mobile layout - single column
                        if (!isWeb) ...[
                          _buildBiographySection(),
                          const SizedBox(height: 6),
                          _buildOfflineConsultationTiming(),
                          const SizedBox(height: 6),
                          _buildOnlineConsultationTiming(),
                          const SizedBox(height: 6),
                          _buildConsultationFeeManagement(),
                          const SizedBox(height: 6),
                          _buildLeavesSection(),
                        ],
                        SizedBox(height: isWeb ? 8 : 6),
                        _buildFooter(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // WEB GRID LAYOUT
  // ============================================================================

  Widget _buildWebGridLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column - Offline + Online Timing (stacked, expandable)
        Expanded(
          flex: 7,
          child: Column(
            children: [
              _buildOfflineConsultationTimingExpandable(),
              const SizedBox(height: 6),
              _buildOnlineConsultationTimingExpandable(),
            ],
          ),
        ),
        const SizedBox(width: 6),
        // Right Column - Fee Management + Leaves (stacked)
        Expanded(
          flex: 4,
          child: Column(
            children: [
              _buildConsultationFeeManagement(),
              const SizedBox(height: 6),
              _buildLeavesSection(),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // HEADER
  // ============================================================================

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, size: 16),
            tooltip: 'Back',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8),
          const Text(
            'Doctor Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 32,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, size: 13),
              label: const Text(
                'Edit',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // PROFILE SECTION
  // ============================================================================

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE0E0E0), width: 2),
            ),
            child: const Icon(Icons.person, size: 24, color: Color(0xFF666666)),
          ),
          const SizedBox(width: 8),
          // Doctor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _doctorData['name'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4CAF50),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            _doctorData['status'],
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _doctorData['specialization'],
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'License: ${_doctorData['licenseNo']} • Joined ${_doctorData['joinDate']}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // QUICK STATS
  // ============================================================================

  Widget _buildQuickStats() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = constraints.maxWidth >= 1024;

        if (isWeb) {
          return Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  Icons.school,
                  'Qualification',
                  _doctorData['qualification'],
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildStatCard(
                  Icons.work,
                  'Experience',
                  '${_doctorData['experience']} Years',
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildStatCard(
                  Icons.people,
                  'Patients',
                  _doctorData['patients'],
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildStatCard(
                  Icons.email,
                  'Email',
                  _doctorData['email'],
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildStatCard(
                  Icons.phone,
                  'Phone',
                  _doctorData['mobile'],
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    Icons.school,
                    'Qualification',
                    _doctorData['qualification'],
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: _buildStatCard(
                    Icons.work,
                    'Experience',
                    '${_doctorData['experience']} Years',
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: _buildStatCard(
                    Icons.people,
                    'Patients',
                    _doctorData['patients'],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    Icons.email,
                    'Email',
                    _doctorData['email'],
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: _buildStatCard(
                    Icons.phone,
                    'Phone',
                    _doctorData['mobile'],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(IconData icon, String label, String value) {
    // Use smaller font for email/phone to prevent overflow
    final isContact = label == 'Email' || label == 'Phone';

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF666666)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isContact ? 9 : 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF333333),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: const TextStyle(fontSize: 9, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // BIOGRAPHY
  // ============================================================================

  Widget _buildBiographySection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Biography',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _doctorData['biography'],
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF666666),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // CONSULTATION TIMING
  // ============================================================================

  Widget _buildOfflineConsultationTiming() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 12,
                  color: Color(0xFF666666),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Offline Timing',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: _buildConsultationTimingTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildOnlineConsultationTiming() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.videocam, size: 12, color: Color(0xFF666666)),
                const SizedBox(width: 4),
                const Text(
                  'Online Timing',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: _buildConsultationTimingTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineConsultationTimingExpandable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isOfflineTimingExpanded = !_isOfflineTimingExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 12,
                    color: Color(0xFF666666),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Offline Timing',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _isOfflineTimingExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 14,
                    color: const Color(0xFF666666),
                  ),
                ],
              ),
            ),
          ),
          if (_isOfflineTimingExpanded)
            Padding(
              padding: const EdgeInsets.all(6),
              child: _buildConsultationTimingTable(),
            ),
        ],
      ),
    );
  }

  Widget _buildOnlineConsultationTimingExpandable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isOnlineTimingExpanded = !_isOnlineTimingExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.videocam,
                    size: 12,
                    color: Color(0xFF666666),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Online Timing',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _isOnlineTimingExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 14,
                    color: const Color(0xFF666666),
                  ),
                ],
              ),
            ),
          ),
          if (_isOnlineTimingExpanded)
            Padding(
              padding: const EdgeInsets.all(6),
              child: _buildConsultationTimingTable(),
            ),
        ],
      ),
    );
  }

  Widget _buildConsultationTimingTable() {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _buildMobileTimingList(days);
        }
        return _buildDesktopTimingTable(days);
      },
    );
  }

  Widget _buildDesktopTimingTable(List<String> days) {
    return Table(
      border: TableBorder.all(color: const Color(0xFFE0E0E0)),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
      },
      children: [
        TableRow(
          decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
          children: [
            _buildTableHeaderCell('Days'),
            _buildTableHeaderCell('Morning'),
            _buildTableHeaderCell('Afternoon'),
          ],
        ),
        ...days.map(
          (day) => TableRow(
            children: [
              _buildTableDataCell(
                Row(
                  children: [
                    Checkbox(
                      value: day == 'Monday' || day == 'Tuesday',
                      onChanged: (value) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    Text(day, style: const TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              _buildTableDataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeInput('09:00'),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: Color(0xFF999999),
                    ),
                    const SizedBox(width: 4),
                    _buildTimeInput('12:00'),
                  ],
                ),
              ),
              _buildTableDataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeInput('14:00'),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: Color(0xFF999999),
                    ),
                    const SizedBox(width: 4),
                    _buildTimeInput('17:00'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTimingList(List<String> days) {
    return Column(
      children: days.map((day) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: day == 'Monday' || day == 'Tuesday',
                    onChanged: (value) {},
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const SizedBox(width: 40),
                  const Text('Morning:', style: TextStyle(fontSize: 11)),
                  const SizedBox(width: 6),
                  _buildTimeInput('09:00'),
                  const SizedBox(width: 4),
                  const Text('-', style: TextStyle(fontSize: 11)),
                  const SizedBox(width: 4),
                  _buildTimeInput('12:00'),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const SizedBox(width: 40),
                  const Text('Afternoon:', style: TextStyle(fontSize: 11)),
                  const SizedBox(width: 6),
                  _buildTimeInput('14:00'),
                  const SizedBox(width: 4),
                  const Text('-', style: TextStyle(fontSize: 11)),
                  const SizedBox(width: 4),
                  _buildTimeInput('17:00'),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTableHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 10,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  Widget _buildTableDataCell(Widget child) {
    return Padding(padding: const EdgeInsets.all(5), child: child);
  }

  Widget _buildTimeInput(String value) {
    return Container(
      width: 48,
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(fontSize: 10, color: Color(0xFF333333)),
        ),
      ),
    );
  }

  // ============================================================================
  // CONSULTATION FEE MANAGEMENT
  // ============================================================================

  Widget _buildConsultationFeeManagement() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                size: 12,
                color: Color(0xFF666666),
              ),
              const SizedBox(width: 4),
              const Text(
                'Consultation Fees',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _buildFeeCard('Online', '₹${_doctorData['onlineFee']}'),
          const SizedBox(height: 4),
          _buildFeeCard('Offline', '₹${_doctorData['offlineFee']}'),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeeCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 9, color: Color(0xFF666666)),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // LEAVES SECTION
  // ============================================================================

  Widget _buildLeavesSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.event_busy, size: 12, color: Color(0xFF666666)),
              const SizedBox(width: 4),
              const Text(
                'Leaves',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _buildLeavesTable(),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 12),
              label: const Text(
                'Apply',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(color: Color(0xFFE0E0E0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeavesTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: const Color(0xFFE0E0E0)),
        columnWidths: const {
          0: FixedColumnWidth(80),
          1: FixedColumnWidth(80),
          2: FixedColumnWidth(80),
          3: FixedColumnWidth(40),
          4: FixedColumnWidth(60),
        },
        children: [
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
            children: [
              _buildTableHeaderCell('Leave Type'),
              _buildTableHeaderCell('From Date'),
              _buildTableHeaderCell('To Date'),
              _buildTableHeaderCell('Days'),
              _buildTableHeaderCell('Day Type'),
            ],
          ),
          _buildLeaveTableRow(
            'Casual Leave',
            '11-11-2025',
            '11-11-2025',
            '1',
            'Full Day',
          ),
          _buildLeaveTableRow(
            'Sick Leave',
            '15-12-2024',
            '16-12-2024',
            '2',
            'Full Day',
          ),
          _buildLeaveTableRow(
            'Casual Leave',
            '01-01-2025',
            '01-01-2025',
            '1',
            'Morning',
          ),
        ],
      ),
    );
  }

  TableRow _buildLeaveTableRow(
    String leaveType,
    String fromDate,
    String toDate,
    String days,
    String dayType,
  ) {
    return TableRow(
      children: [
        _buildTableDataCell(
          Text(leaveType, style: const TextStyle(fontSize: 10)),
        ),
        _buildTableDataCell(
          Text(fromDate, style: const TextStyle(fontSize: 10)),
        ),
        _buildTableDataCell(Text(toDate, style: const TextStyle(fontSize: 10))),
        _buildTableDataCell(Text(days, style: const TextStyle(fontSize: 10))),
        _buildTableDataCell(
          Text(dayType, style: const TextStyle(fontSize: 10)),
        ),
      ],
    );
  }

  // ============================================================================
  // FOOTER
  // ============================================================================

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 Dr&Me. All rights reserved.',
        style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
      ),
    );
  }
}
