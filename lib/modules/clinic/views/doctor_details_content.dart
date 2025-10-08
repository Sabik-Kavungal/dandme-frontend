import 'package:flutter/material.dart';

/// Doctor Details Content Widget
///
/// This widget displays the doctor details content that can be embedded
/// within the sidebar layout. It doesn't include the Scaffold or navigation
/// as those are handled by the parent layout.

class DoctorDetailsContent extends StatefulWidget {
  final String doctorId;
  final VoidCallback? onBack;

  const DoctorDetailsContent({super.key, required this.doctorId, this.onBack});

  @override
  State<DoctorDetailsContent> createState() => _DoctorDetailsContentState();
}

class _DoctorDetailsContentState extends State<DoctorDetailsContent> {
  bool _isOfflineTimingExpanded = true;
  bool _isOnlineTimingExpanded = false;

  // Mock data for the doctor
  final Map<String, dynamic> _doctorData = {
    'name': 'Dr. Johen doe',
    'licenseNo': '38999229',
    'joinDate': '15 May 2019, 10:00 AM',
    'specialization': 'ENT Specialist',
    'qualification': 'MBBS, MD',
    'experience': '+5',
    'mobile': '+1(333) 123-267387',
    'email': 'asd@gmail.com',
    'biography':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    'onlineFee': '200',
    'offlineFee': '250',
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final padding = isMobile ? 12.0 : 24.0;

        return SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Navigation Bar
              _buildTopNavigationBar(),
              const SizedBox(height: 20),

              // Main Content
              if (isMobile) _buildMobileLayout() else _buildDesktopLayout(),

              const SizedBox(height: 40),

              // Footer
              _buildFooter(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopNavigationBar() {
    return Row(
      children: [
        // Back Button
        IconButton(
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
        ),
        const SizedBox(width: 8),
        // Navigation Tabs
        Row(
          children: [
            _buildTab('Doctor Onboarding', true),
            const SizedBox(width: 20),
            _buildTab('Patients', false),
            const SizedBox(width: 20),
            _buildTab('Doctors', false),
          ],
        ),
        const Spacer(),
        // Edit Button
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              // TODO: Implement edit functionality
            },
            icon: const Icon(Icons.edit, color: Color(0xFFDC3545), size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: isActive
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF007BFF), width: 3),
              ),
            )
          : null,
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF007BFF) : Colors.grey.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildDoctorProfileCard(),
        const SizedBox(height: 16),
        _buildBiographySection(),
        const SizedBox(height: 16),
        _buildOfflineConsultationTiming(),
        const SizedBox(height: 16),
        _buildOnlineConsultationTiming(),
        const SizedBox(height: 16),
        _buildConsultationFeeManagement(),
        const SizedBox(height: 16),
        _buildLeavesSection(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildDoctorProfileCard(),
              const SizedBox(height: 20),
              _buildBiographySection(),
              const SizedBox(height: 20),
              _buildOfflineConsultationTiming(),
              const SizedBox(height: 20),
              _buildOnlineConsultationTiming(),
            ],
          ),
        ),
        const SizedBox(width: 20),
        // Right Column
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _buildConsultationFeeManagement(),
              const SizedBox(height: 20),
              _buildLeavesSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/doctor_placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                        // Specialization Tag
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDC3545),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _doctorData['specialization'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'License No: ${_doctorData['licenseNo']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Join on ${_doctorData['joinDate']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Info Cards
          Row(
            children: [
              Expanded(
                child: _buildInfoCard(
                  Icons.school,
                  'Qualification',
                  _doctorData['qualification'],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoCard(
                  Icons.work,
                  'Experience',
                  _doctorData['experience'],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoCard(
                  Icons.phone,
                  'Mobile Number',
                  _doctorData['mobile'],
                  color: const Color(0xFF28A745),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoCard(
                  Icons.email,
                  'Email',
                  _doctorData['email'],
                  color: const Color(0xFF007BFF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color ?? Colors.grey.shade600, size: 20),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildBiographySection() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Biography',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _doctorData['biography'],
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineConsultationTiming() {
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
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () {
              setState(() {
                _isOfflineTimingExpanded = !_isOfflineTimingExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Offline Consultation Timing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _isOfflineTimingExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),
          // Content
          if (_isOfflineTimingExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () {
              setState(() {
                _isOnlineTimingExpanded = !_isOnlineTimingExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Online Consultation Timing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _isOnlineTimingExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),
          // Content
          if (_isOnlineTimingExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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

    return Table(
      border: TableBorder.all(color: Colors.grey.shade200),
      children: [
        // Header
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade50),
          children: [
            _buildTableHeaderCell('Days'),
            _buildTableHeaderCell('Morning'),
            _buildTableHeaderCell('Afternoon'),
          ],
        ),
        // Data rows
        ...days
            .map(
              (day) => TableRow(
                children: [
                  _buildTableDataCell(
                    Row(
                      children: [
                        Checkbox(
                          value: day == 'Monday' || day == 'Tuesday',
                          onChanged: (value) {
                            // TODO: Handle checkbox change
                          },
                          activeColor: const Color(0xFF007BFF),
                        ),
                        Text(day),
                      ],
                    ),
                  ),
                  _buildTableDataCell(
                    Row(
                      children: [
                        _buildTimeInput('00:00'),
                        const Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Colors.grey,
                        ),
                        _buildTimeInput('00:00'),
                      ],
                    ),
                  ),
                  _buildTableDataCell(
                    Row(
                      children: [
                        _buildTimeInput('00:00'),
                        const Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Colors.grey,
                        ),
                        _buildTimeInput('00:00'),
                      ],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildTableHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color(0xFF333333),
        ),
      ),
    );
  }

  Widget _buildTableDataCell(Widget child) {
    return Padding(padding: const EdgeInsets.all(12), child: child);
  }

  Widget _buildTimeInput(String value) {
    return Container(
      width: 60,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: value,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }

  Widget _buildConsultationFeeManagement() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Consultation Fee Management',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          _buildFeeInput('Online Consultation Fee', _doctorData['onlineFee']),
          const SizedBox(height: 16),
          _buildFeeInput('Offline Consultation Fee', _doctorData['offlineFee']),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement save functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeeInput(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF007BFF)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeavesSection() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Leaves',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          // Leaves Table
          Table(
            border: TableBorder.all(color: Colors.grey.shade200),
            children: [
              // Header
              TableRow(
                decoration: BoxDecoration(color: Colors.grey.shade50),
                children: [
                  _buildTableHeaderCell('Leave'),
                  _buildTableHeaderCell('From Date'),
                  _buildTableHeaderCell('To date'),
                  _buildTableHeaderCell('Days'),
                  _buildTableHeaderCell('Days Type'),
                ],
              ),
              // Data rows
              _buildLeaveTableRow(
                'Casual Leave',
                '11-11-2025',
                '11-11-2025',
                '1',
                'Morning',
              ),
              _buildLeaveTableRow(
                'Casual Leave',
                '11-11-2025',
                '11-11-2025',
                '1',
                'Morning',
              ),
              _buildLeaveTableRow(
                'Casual Leave',
                '11-11-2025',
                '11-11-2025',
                '1',
                'Morning',
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement apply leave functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Apply Leave',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildLeaveTableRow(
    String leave,
    String fromDate,
    String toDate,
    String days,
    String daysType,
  ) {
    return TableRow(
      children: [
        _buildTableDataCell(Text(leave)),
        _buildTableDataCell(Text(fromDate)),
        _buildTableDataCell(Text(toDate)),
        _buildTableDataCell(Text(days)),
        _buildTableDataCell(Text(daysType)),
      ],
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 Dr&Me All rights reserved',
        style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
      ),
    );
  }
}
