import 'package:a/modules/doctor/models/doctor_model.dart';
import 'package:a/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:a/modules/superadmin/views/doctors/add_doctor_view.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/navigation_helper.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  _DoctorsListScreenState createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load doctors when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final doctorViewModel = Provider.of<DoctorViewModel>(
        context,
        listen: false,
      );
      doctorViewModel.fetchDoctors(context);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<DoctorModel> get _filteredDoctors {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    if (_searchQuery.isEmpty) {
      return doctorViewModel.doctors;
    }
    return doctorViewModel.doctors.where((doctor) {
      final fullName = '${doctor.firstName ?? ''} ${doctor.lastName ?? ''}'
          .toLowerCase();
      final email = doctor.email?.toLowerCase() ?? '';
      final specialization = doctor.specialization?.toLowerCase() ?? '';
      final query = _searchQuery.toLowerCase();
      return fullName.contains(query) ||
          email.contains(query) ||
          specialization.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Consumer<DoctorViewModel>(
        builder: (context, doctorViewModel, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 480;

              return Column(
                children: [
                  // Header
                  _buildHeader(isMobile, doctorViewModel),
                  // Search Bar
                  _buildSearchBar(isMobile, doctorViewModel),
                  // Doctors List
                  Expanded(
                    child: doctorViewModel.isLoading
                        ? _buildLoadingWidget()
                        : _filteredDoctors.isEmpty
                        ? _buildEmptyState(isMobile)
                        : ListView.builder(
                            padding: EdgeInsets.all(isMobile ? 16 : 24),
                            itemCount: _filteredDoctors.length,
                            itemBuilder: (context, index) {
                              final doctor = _filteredDoctors[index];
                              return _buildDoctorCard(doctor, isMobile, index);
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
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: MaterialLocalizations.of(
              context,
            ).modalBarrierDismissLabel,
            barrierColor: Colors.black.withValues(alpha: 0.5),
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return AddDoctorScreen();
            },
          ).then((_) {
            // Refresh doctors list after adding
            final doctorViewModel = Provider.of<DoctorViewModel>(
              context,
              listen: false,
            );
            doctorViewModel.fetchDoctors(context);
          });
        },
        backgroundColor: const Color(0xFF3B82F6),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(bool isMobile, DoctorViewModel doctorViewModel) {
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
            onPressed: () => NavigationHelper.goBack(context),
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
                  'Doctors',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Manage all doctors',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),

          // Add Doctor Button
          ElevatedButton.icon(
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(
                  context,
                ).modalBarrierDismissLabel,
                barrierColor: Colors.black.withValues(alpha: 0.5),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return AddDoctorScreen();
                },
              ).then((_) {
                // Refresh doctors list after adding
                doctorViewModel.fetchDoctors(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
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
              'New Doctor',
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

  Widget _buildSearchBar(bool isMobile, DoctorViewModel doctorViewModel) {
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
          hintText: 'Search doctors...',
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
                  doctorViewModel.fetchDoctors(context);
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
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Loading doctors...',
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
                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.medical_services_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No doctors found',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first doctor to get started',
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(DoctorModel doctor, bool isMobile, int index) {
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
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: isMobile ? 24 : 28,
              backgroundColor: const Color(0xFF3B82F6),
              child: Text(
                AppHelpers.getInitials(doctor.firstName, doctor.lastName),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Doctor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getFullName(doctor.firstName, doctor.lastName),
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (doctor.email != null) ...[
                    _buildInfoRow(
                      Icons.email_outlined,
                      doctor.email!,
                      isMobile,
                    ),
                    const SizedBox(height: 4),
                  ],
                  if (doctor.specialization != null) ...[
                    _buildInfoRow(
                      Icons.medical_information_outlined,
                      doctor.specialization!,
                      isMobile,
                    ),
                    const SizedBox(height: 4),
                  ],
                  if (doctor.consultationFee != null) ...[
                    _buildInfoRow(
                      Icons.attach_money,
                      'Fee: \$${doctor.consultationFee!.toStringAsFixed(2)}',
                      isMobile,
                    ),
                  ],
                ],
              ),
            ),

            // Action Buttons
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFF3B82F6)),
                  tooltip: 'Edit',
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(
                        context,
                      ).modalBarrierDismissLabel,
                      barrierColor: Colors.black.withValues(alpha: 0.5),
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return AddDoctorScreen(editDoctor: doctor);
                      },
                    ).then((_) {
                      final doctorViewModel = Provider.of<DoctorViewModel>(
                        context,
                        listen: false,
                      );
                      doctorViewModel.fetchDoctors(context);
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  tooltip: 'Delete',
                  onPressed: () {
                    _showDeleteConfirmation(context, doctor, index);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, bool isMobile) {
    return Row(
      children: [
        Icon(icon, size: isMobile ? 14 : 16, color: const Color(0xFF666666)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: const Color(0xFF666666),
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    DoctorModel doctor,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Doctor'),
          content: Text(
            'Are you sure you want to delete ${AppHelpers.getFullName(doctor.firstName, doctor.lastName)}?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement delete functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Delete functionality not implemented yet'),
                    backgroundColor: Colors.orange,
                  ),
                );
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
