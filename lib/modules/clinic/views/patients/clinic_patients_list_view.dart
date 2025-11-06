import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart';
import 'package:a/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:a/modules/clinic/views/patients/patient_detail_modal.dart';
import 'package:a/core/config/service.dart';

class ClinicPatientsListView extends StatefulWidget {
  const ClinicPatientsListView({super.key});

  @override
  State<ClinicPatientsListView> createState() => _ClinicPatientsListViewState();
}

class _ClinicPatientsListViewState extends State<ClinicPatientsListView> {
  late final ClinicPatientRepository _repository;
  List<ClinicPatient> _patients = [];
  bool _isLoading = true;
  String _error = '';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _repository = ClinicPatientRepository(ServiceRepo());
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      final token = authViewModel.accessToken;
      final clinicId = authViewModel.user?.clinicId;

      if (token == null || clinicId == null) {
        setState(() {
          _error = 'Authentication required';
          _isLoading = false;
        });
        return;
      }

      // Get all patients
      final response = await _repository.listPatients(
        token: token,
        clinicId: clinicId,
        onlyActive: true,
      );

      if (response != null) {
        setState(() {
          _patients = response.patients;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load patients';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error loading patients: $e';
        _isLoading = false;
      });
    }
  }

  void _showPatientDetails(ClinicPatient patient) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PatientDetailModal(patient: patient),
    );
  }

  List<ClinicPatient> get _filteredPatients {
    if (_searchQuery.isEmpty) return _patients;

    return _patients.where((patient) {
      final fullName = '${patient.firstName} ${patient.lastName}'.toLowerCase();
      final phone = patient.phone.toLowerCase();
      final searchLower = _searchQuery.toLowerCase();

      return fullName.contains(searchLower) || phone.contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinic Patients (${_patients.length})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPatients,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or phone...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Content
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              _error,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadPatients,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_filteredPatients.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty
                  ? 'No patients found'
                  : 'No patients match your search',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _filteredPatients.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final patient = _filteredPatients[index];
        return _PatientCard(
          patient: patient,
          onTap: () => _showPatientDetails(patient),
        );
      },
    );
  }
}

class _PatientCard extends StatelessWidget {
  final ClinicPatient patient;
  final VoidCallback onTap;

  const _PatientCard({required this.patient, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            patient.firstName[0].toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          '${patient.firstName} ${patient.lastName}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('📞 ${patient.phone}'),
            if (patient.moId != null && patient.moId!.isNotEmpty)
              Text('🆔 MO ID: ${patient.moId}'),
            const SizedBox(height: 8),
            // Show follow-up status if exists
            if (patient.followUps.isNotEmpty) _buildFollowUpBadge(),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (patient.appointments.isNotEmpty)
              Chip(
                label: Text(
                  '${patient.appointments.length} ${patient.appointments.length == 1 ? 'appointment' : 'appointments'}',
                  style: const TextStyle(fontSize: 11),
                ),
                backgroundColor: Colors.blue.shade50,
              ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildFollowUpBadge() {
    final activeFollowUp = patient.followUps.firstWhere(
      (fu) => fu.status == 'active',
      orElse: () => patient.followUps.first,
    );

    if (activeFollowUp.status == 'active' && activeFollowUp.isFree) {
      final daysRemaining = activeFollowUp.daysRemaining ?? 0;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '🟢 Free Follow-Up (${daysRemaining} days left)',
          style: TextStyle(
            fontSize: 11,
            color: Colors.green[700],
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    if (activeFollowUp.status == 'used') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '⚠️ Free Follow-Up Used',
          style: TextStyle(
            fontSize: 11,
            color: Colors.orange[700],
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    if (activeFollowUp.status == 'expired') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '⏰ Follow-Up Expired',
          style: TextStyle(
            fontSize: 11,
            color: Colors.orange[700],
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
