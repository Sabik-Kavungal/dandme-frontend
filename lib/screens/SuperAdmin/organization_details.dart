import 'package:flutter/material.dart';
import 'package:a/models/organization_model.dart';
import 'add_clinic_new.dart';

class OrganizationDetailsScreen extends StatefulWidget {
  final OrganizationModel organization;

  const OrganizationDetailsScreen({super.key, required this.organization});

  @override
  State<OrganizationDetailsScreen> createState() =>
      _OrganizationDetailsScreenState();
}

class _OrganizationDetailsScreenState extends State<OrganizationDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Organization data from the passed model
  OrganizationModel get _organizationData => widget.organization;

  // Sample clinics data - Replace with actual API data
  final List<Map<String, dynamic>> _clinics = [
    {
      'id': 'clinic-1',
      'clinic_code': 'CLC-001',
      'name': 'Main Branch Clinic',
      'email': 'main@citymedical.com',
      'phone': '9876543220',
      'address': '123 Main Street, City Center',
      'license_number': 'CLN-2024-001',
      'status': 'Active',
    },
    {
      'id': 'clinic-2',
      'clinic_code': 'CLC-002',
      'name': 'North Branch Clinic',
      'email': 'north@citymedical.com',
      'phone': '9876543221',
      'address': '456 North Avenue',
      'license_number': 'CLN-2024-002',
      'status': 'Active',
    },
    {
      'id': 'clinic-3',
      'clinic_code': 'CLC-003',
      'name': 'South Branch Clinic',
      'email': 'south@citymedical.com',
      'phone': '9876543222',
      'address': '789 South Boulevard',
      'license_number': 'CLN-2024-003',
      'status': 'Active',
    },
  ];

  List<Map<String, dynamic>> get _filteredClinics {
    if (_searchQuery.isEmpty) {
      return _clinics;
    }
    return _clinics.where((clinic) {
      final name = clinic['name'].toString().toLowerCase();
      final code = clinic['clinic_code'].toString().toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || code.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.organization.name,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Organization Info Card
                _buildOrganizationInfoCard(isMobile),
                const SizedBox(height: 24),

                // Clinics Section Header
                Row(
                  children: [
                    Text(
                      'Clinics (${_clinics.length})',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        // showGeneralDialog(
                        //   context: context,
                        //   barrierDismissible: true,
                        //   barrierLabel: MaterialLocalizations.of(
                        //     context,
                        //   ).modalBarrierDismissLabel,
                        //   barrierColor: Colors.black.withOpacity(0.5),
                        //   transitionDuration: const Duration(milliseconds: 300),
                        //   pageBuilder:
                        //       (context, animation, secondaryAnimation) {
                        //         return AddClinicScreen(
                        //           organizationId: widget
                        //               .organization
                        //               .name, // Using name as ID for now
                        //           organizationName: widget.organization.name,
                        //         );
                        //       },
                        // ).then((_) => setState(() {}));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9800),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 12 : 16,
                          vertical: isMobile ? 8 : 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Icon(Icons.add, size: isMobile ? 16 : 18),
                      label: Text(
                        'Add Clinic',
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search clinics...',
                      hintStyle: TextStyle(color: Color(0xFF999999)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF666666)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Clinics List
                _filteredClinics.isEmpty
                    ? _buildEmptyClinicsState(isMobile)
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _filteredClinics.length,
                        itemBuilder: (context, index) {
                          final clinic = _filteredClinics[index];
                          return _buildClinicCard(clinic, isMobile);
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrganizationInfoCard(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Organization Information',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.email_outlined,
            _organizationData.email ?? 'No email provided',
            isMobile,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.phone_outlined,
            _organizationData.phone ?? 'No phone provided',
            isMobile,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.location_on_outlined,
            _organizationData.address ?? 'No address provided',
            isMobile,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.card_membership_outlined,
            'License: ${_organizationData.licenseNumber ?? 'No license provided'}',
            isMobile,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.check_circle_outline,
            'Status: ${_organizationData.isActive == true ? 'Active' : 'Inactive'}',
            isMobile,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.access_time,
            'Created: ${_organizationData.createdAt ?? 'Unknown'}',
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildClinicCard(Map<String, dynamic> clinic, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isMobile ? 14 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.local_hospital,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clinic['name'],
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Code: ${clinic['clinic_code']}',
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  clinic['status'],
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  // More options
                },
                icon: const Icon(Icons.more_vert, size: 18),
                color: const Color(0xFF666666),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Details
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                _buildInfoRow(Icons.email_outlined, clinic['email'], isMobile),
                const SizedBox(height: 6),
                _buildInfoRow(Icons.phone_outlined, clinic['phone'], isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, bool isMobile) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF666666)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 11 : 12,
              color: const Color(0xFF666666),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyClinicsState(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.local_hospital_outlined,
              size: isMobile ? 48 : 64,
              color: const Color(0xFFCCCCCC),
            ),
            const SizedBox(height: 12),
            Text(
              'No clinics found',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF666666),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
