import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_doctor_link_model.dart';
import 'package:drandme/modules/superadmin/views/clinics/add_clinic_doctor_link_view.dart';

class ClinicDoctorLinksListScreen extends StatefulWidget {
  const ClinicDoctorLinksListScreen({super.key});

  @override
  _ClinicDoctorLinksListScreenState createState() =>
      _ClinicDoctorLinksListScreenState();
}

class _ClinicDoctorLinksListScreenState
    extends State<ClinicDoctorLinksListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load clinic-doctor links when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
      clinicVM.refreshLinks(context);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ClinicDoctorLinkResponse> get _filteredLinks {
    final clinicViewModel = Provider.of<ClinicViewModel>(context);
    if (_searchQuery.isEmpty) {
      return clinicViewModel.clinicDoctorLinks;
    }
    return clinicViewModel.clinicDoctorLinks.where((link) {
      final clinicName = link.clinic.name.toLowerCase();
      final doctorName = '${link.doctor.firstName} ${link.doctor.lastName}'
          .toLowerCase();
      final specialization = link.doctor.specialization.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return clinicName.contains(query) ||
          doctorName.contains(query) ||
          specialization.contains(query);
    }).toList();
  }

  void _openAddLinkPanel() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const AddClinicDoctorLinkScreen();
      },
    ).then((_) {
      // Refresh links list after adding
      final clinicViewModel = Provider.of<ClinicViewModel>(
        context,
        listen: false,
      );
      clinicViewModel.refreshLinks(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Consumer<ClinicViewModel>(
        builder: (context, clinicVM, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 480;

              return Column(
                children: [
                  // Header
                  _buildHeader(isMobile),
                  // Search Bar
                  _buildSearchBar(isMobile, clinicVM),
                  // Links List
                  Expanded(
                    child: clinicVM.isLoadingLinks
                        ? _buildLoadingWidget()
                        : _filteredLinks.isEmpty
                        ? _buildEmptyState(isMobile)
                        : ListView.builder(
                            padding: EdgeInsets.all(isMobile ? 16 : 24),
                            itemCount: _filteredLinks.length,
                            itemBuilder: (context, index) {
                              final link = _filteredLinks[index];
                              return _buildLinkCard(link, index, isMobile);
                            },
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddLinkPanel,
        backgroundColor: const Color(0xFF8B5CF6),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: 16,
      ),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 12),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clinic-Doctor Links',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Manage clinic-doctor relationships',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),

          // Add Link Button
          ElevatedButton.icon(
            onPressed: _openAddLinkPanel,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B5CF6),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.add, size: 16),
            label: Text(
              'New Link',
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isMobile, ClinicViewModel clinicVM) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        isMobile ? 16 : 24,
        16,
        isMobile ? 16 : 24,
        0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search by clinic, doctor, or specialization...',
          hintStyle: TextStyle(
            color: const Color(0xFF999999),
            fontSize: isMobile ? 13 : 14,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF666666),
            size: 20,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_searchQuery.isNotEmpty)
                IconButton(
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Color(0xFF666666),
                    size: 20,
                  ),
                ),
              IconButton(
                onPressed: () {
                  clinicVM.refreshLinks(context);
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Color(0xFF666666),
                  size: 20,
                ),
              ),
            ],
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isMobile ? 12 : 16,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
          ),
          SizedBox(height: 16),
          Text(
            'Loading links...',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isMobile) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.link_off, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 20),
          Text(
            'No clinic-doctor links found',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first link to get started',
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkCard(
    ClinicDoctorLinkResponse link,
    int index,
    bool isMobile,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with status and date
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: link.isActive == true
                        ? const Color(0xFF10B981).withValues(alpha: 0.1)
                        : Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        link.isActive == true
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: link.isActive == true
                            ? const Color(0xFF10B981)
                            : const Color(0xFFDC2626),
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        link.isActive == true ? 'Active' : 'Inactive',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: link.isActive == true
                              ? const Color(0xFF10B981)
                              : const Color(0xFFDC2626),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (link.linkId != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'ID: ${link.linkId}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B5CF6),
                      ),
                    ),
                  ),
                if (link.createdAt != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    _formatDate(link.createdAt!),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),

            // Clinic Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: isMobile ? 50 : 60,
                  height: isMobile ? 50 : 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.white,
                    size: isMobile ? 24 : 28,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clinic',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        link.clinic.name,
                        style: TextStyle(
                          fontSize: isMobile ? 15 : 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Code: ${link.clinic.clinicCode}',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Arrow Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey[300], thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.arrow_downward,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey[300], thickness: 1),
                  ),
                ],
              ),
            ),

            // Doctor Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: isMobile ? 50 : 60,
                  height: isMobile ? 50 : 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9333EA), Color(0xFFA855F7)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.medical_services,
                    color: Colors.white,
                    size: isMobile ? 24 : 28,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getDoctorFullName(
                          link.doctor.firstName,
                          link.doctor.lastName,
                        ),
                        style: TextStyle(
                          fontSize: isMobile ? 15 : 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9333EA).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          link.doctor.specialization,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9333EA),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              link.doctor.email,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Action Buttons
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () => _toggleLinkStatus(link, index),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  icon: Icon(
                    link.isActive == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 16,
                    color: const Color(0xFFF59E0B),
                  ),
                  label: Text(
                    link.isActive == true ? 'Deactivate' : 'Activate',
                    style: const TextStyle(
                      color: Color(0xFFF59E0B),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () => _showDeleteConfirmation(link, index),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  icon: const Icon(
                    Icons.delete,
                    size: 16,
                    color: Color(0xFFDC2626),
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Color(0xFFDC2626),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getDoctorFullName(String firstName, String lastName) {
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return 'Dr. $firstName $lastName';
    } else if (firstName.isNotEmpty) {
      return 'Dr. $firstName';
    } else if (lastName.isNotEmpty) {
      return 'Dr. $lastName';
    } else {
      return 'Dr. Unknown';
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  void _toggleLinkStatus(ClinicDoctorLinkResponse link, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Toggle status functionality will be implemented'),
        backgroundColor: Color(0xFFF59E0B),
      ),
    );
  }

  void _showDeleteConfirmation(ClinicDoctorLinkResponse link, int index) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Delete Link',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          content: Text(
            'Are you sure you want to delete the link between "${link.clinic.name}" and "${_getDoctorFullName(link.doctor.firstName, link.doctor.lastName)}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF666666)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                // TODO: Implement delete functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Delete functionality not implemented yet'),
                    backgroundColor: Color(0xFFF59E0B),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
