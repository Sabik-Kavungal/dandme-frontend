import 'package:a/modules/clinic/models/clinic_model.dart';
import 'package:a/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:a/modules/superadmin/views/clinics/add_clinic_new_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ClinicsListScreen extends StatefulWidget {
  const ClinicsListScreen({super.key});

  @override
  State<ClinicsListScreen> createState() => _ClinicsListScreenState();
}

class _ClinicsListScreenState extends State<ClinicsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Fetch clinics when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clinicViewModel = Provider.of<ClinicViewModel>(
        context,
        listen: false,
      );
      clinicViewModel.fetchClinics(context);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ClinicModel> get _filteredClinics {
    final clinicViewModel = Provider.of<ClinicViewModel>(context);
    if (_searchQuery.isEmpty) {
      return clinicViewModel.clinics;
    }
    return clinicViewModel.clinics.where((clinic) {
      return clinic.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          clinic.clinicCode.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          (clinic.email?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
              false) ||
          (clinic.licenseNumber?.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ??
              false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Consumer<ClinicViewModel>(
        builder: (context, clinicViewModel, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 480;

              return Column(
                children: [
                  // Header
                  _buildHeader(isMobile),
                  // Search Bar
                  _buildSearchBar(isMobile),
                  // Error Display
                  if (clinicViewModel.error != null)
                    _buildErrorWidget(clinicViewModel.error!),
                  // Clinics List
                  Expanded(
                    child: clinicViewModel.isLoading
                        ? _buildLoadingWidget()
                        : _filteredClinics.isEmpty
                        ? _buildEmptyState(isMobile)
                        : ListView.builder(
                            padding: EdgeInsets.all(isMobile ? 16 : 24),
                            itemCount: _filteredClinics.length,
                            itemBuilder: (context, index) {
                              final clinic = _filteredClinics[index];
                              return _buildClinicModelCard(clinic, isMobile);
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
              return const AddClinicScreen();
            },
          ).then((_) {
            // Refresh clinics list after adding
            final clinicViewModel = Provider.of<ClinicViewModel>(
              context,
              listen: false,
            );
            clinicViewModel.fetchClinics(context);
          });
        },
        backgroundColor: const Color(0xFF3B82F6),
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
          Text(
            'Clinics',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const Spacer(),
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
                  return const AddClinicScreen();
                },
              ).then((_) {
                // Refresh clinics list after adding
                final clinicViewModel = Provider.of<ClinicViewModel>(
                  context,
                  listen: false,
                );
                clinicViewModel.fetchClinics(context);
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
              'New Clinic',
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

  Widget _buildSearchBar(bool isMobile) {
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
          hintText: 'Search clinics...',
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
                  final clinicViewModel = Provider.of<ClinicViewModel>(
                    context,
                    listen: false,
                  );
                  clinicViewModel.fetchClinics(context);
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

  Widget _buildErrorWidget(String error) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              error,
              style: TextStyle(
                color: Colors.red.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final clinicViewModel = Provider.of<ClinicViewModel>(
                context,
                listen: false,
              );
              clinicViewModel.clearError();
            },
            icon: const Icon(Icons.close, color: Colors.red),
          ),
        ],
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
            'Loading clinics...',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }

  Widget _buildClinicModelCard(ClinicModel clinic, bool isMobile) {
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
      child: InkWell(
        onTap: () {
          // Navigate to clinic details
          context.go('/superadmin/clinic-details/${clinic.id ?? ''}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  // Clinic Code Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      clinic.clinicCode,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Status Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Clinic Name
              Text(
                clinic.name,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),

              // Contact Info
              if (clinic.email != null) ...[
                _buildInfoRow(Icons.email_outlined, clinic.email!, isMobile),
                const SizedBox(height: 4),
              ],
              if (clinic.phone != null) ...[
                _buildInfoRow(Icons.phone_outlined, clinic.phone!, isMobile),
                const SizedBox(height: 4),
              ],
              if (clinic.address != null) ...[
                _buildInfoRow(
                  Icons.location_on_outlined,
                  clinic.address!,
                  isMobile,
                ),
                const SizedBox(height: 4),
              ],
              if (clinic.licenseNumber != null) ...[
                _buildInfoRow(
                  Icons.verified_outlined,
                  'License: ${clinic.licenseNumber}',
                  isMobile,
                ),
              ],
            ],
          ),
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

  Widget _buildEmptyState(bool isMobile) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_hospital,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No clinics found',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first clinic to get started',
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}
