import 'package:drandme/modules/superadmin/models/department_model.dart';
import 'package:drandme/modules/superadmin/viewmodels/department_viewmodel.dart';
import 'package:drandme/modules/superadmin/views/departments/add_edit_department_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepartmentDetailsView extends StatefulWidget {
  final String departmentId;

  const DepartmentDetailsView({super.key, required this.departmentId});

  @override
  State<DepartmentDetailsView> createState() => _DepartmentDetailsViewState();
}

class _DepartmentDetailsViewState extends State<DepartmentDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final departmentVM = Provider.of<DepartmentViewModel>(
        context,
        listen: false,
      );
      departmentVM.fetchDepartment(widget.departmentId);
      departmentVM.fetchDoctorsByDepartment(widget.departmentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Department Details',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Consumer<DepartmentViewModel>(
            builder: (context, departmentVM, child) {
              if (departmentVM.selectedDepartment != null) {
                return PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF333333)),
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showEditDepartmentPanel(
                        context,
                        departmentVM.selectedDepartment!,
                      );
                    } else if (value == 'delete') {
                      _showDeleteDialog(
                        context,
                        departmentVM.selectedDepartment!,
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 12),
                          Text('Edit Department'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 12),
                          Text(
                            'Delete Department',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Consumer<DepartmentViewModel>(
        builder: (context, departmentVM, child) {
          if (departmentVM.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (departmentVM.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading department',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      departmentVM.error!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        departmentVM.clearError();
                        departmentVM.fetchDepartment(widget.departmentId);
                        departmentVM.fetchDoctorsByDepartment(
                          widget.departmentId,
                        );
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final department = departmentVM.selectedDepartment;
          if (department == null) {
            return const Center(child: Text('Department not found'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await departmentVM.fetchDepartment(widget.departmentId);
              await departmentVM.fetchDoctorsByDepartment(widget.departmentId);
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Department Info Card
                  _buildDepartmentInfoCard(department, isMobile),
                  const SizedBox(height: 24),

                  // Doctors in Department
                  _buildDoctorsSection(context, departmentVM, isMobile),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDepartmentInfoCard(DepartmentModel department, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.category,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      department.name,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: department.isActive
                            ? const Color(0xFF10B981)
                            : const Color(0xFFEF4444),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        department.isActive ? 'Active' : 'Inactive',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Clinic Name
          if (department.clinicName != null) ...[
            _buildInfoRow(
              icon: Icons.local_hospital,
              label: 'Clinic',
              value: department.clinicName!,
              isMobile: isMobile,
            ),
            const SizedBox(height: 16),
          ],

          // Description
          if (department.description != null &&
              department.description!.isNotEmpty) ...[
            _buildInfoRow(
              icon: Icons.description,
              label: 'Description',
              value: department.description!,
              isMobile: isMobile,
            ),
            const SizedBox(height: 16),
          ],

          // Created At
          if (department.createdAt != null) ...[
            _buildInfoRow(
              icon: Icons.calendar_today,
              label: 'Created At',
              value: _formatDate(department.createdAt!),
              isMobile: isMobile,
            ),
            const SizedBox(height: 16),
          ],

          // Updated At
          if (department.updatedAt != null) ...[
            _buildInfoRow(
              icon: Icons.update,
              label: 'Last Updated',
              value: _formatDate(department.updatedAt!),
              isMobile: isMobile,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isMobile,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: const Color(0xFF666666)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
                  color: const Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 15,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorsSection(
    BuildContext context,
    DepartmentViewModel departmentVM,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.medical_services,
              size: 20,
              color: Color(0xFF333333),
            ),
            const SizedBox(width: 8),
            Text(
              'Doctors in Department',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
              ),
            ),
            const Spacer(),
            if (departmentVM.departmentDoctors.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${departmentVM.departmentDoctors.length}',
                  style: const TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),

        if (departmentVM.isLoadingDoctors)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          )
        else if (departmentVM.departmentDoctors.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.medical_services_outlined,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No doctors assigned',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 15,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...departmentVM.departmentDoctors.map(
            (doctor) => _buildDoctorCard(doctor, isMobile),
          ),
      ],
    );
  }

  Widget _buildDoctorCard(DoctorInDepartment doctor, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isMobile ? 14 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: isMobile ? 20 : 24,
            backgroundColor: const Color(0xFF3B82F6),
            child: Text(
              '${doctor.firstName[0]}${doctor.lastName[0]}'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. ${doctor.firstName} ${doctor.lastName}',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor.specialization,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    color: const Color(0xFF666666),
                  ),
                ),
                if (doctor.email.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    doctor.email,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: const Color(0xFF999999),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Status badge
          if (doctor.isMainDoctor)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Main',
                style: TextStyle(
                  color: Color(0xFFF59E0B),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: doctor.isActive
                  ? const Color(0xFF10B981).withValues(alpha: 0.1)
                  : const Color(0xFFEF4444).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              doctor.isActive ? 'Active' : 'Inactive',
              style: TextStyle(
                color: doctor.isActive
                    ? const Color(0xFF10B981)
                    : const Color(0xFFEF4444),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }

  void _showEditDepartmentPanel(
    BuildContext context,
    DepartmentModel department,
  ) {
    Navigator.of(context)
        .push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                AddEditDepartmentView(department: department),
            opaque: false,
            transitionDuration: const Duration(milliseconds: 300),
          ),
        )
        .then((_) {
          // Refresh data after editing
          final departmentVM = Provider.of<DepartmentViewModel>(
            context,
            listen: false,
          );
          departmentVM.fetchDepartment(widget.departmentId);
        });
  }

  void _showDeleteDialog(BuildContext context, DepartmentModel department) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Department'),
        content: Text(
          'Are you sure you want to delete "${department.name}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final departmentVM = Provider.of<DepartmentViewModel>(
                context,
                listen: false,
              );
              final success = await departmentVM.deleteDepartment(
                department.id,
              );
              if (context.mounted) {
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Department deleted successfully'),
                      backgroundColor: Color(0xFF10B981),
                    ),
                  );
                  Navigator.of(context).pop(); // Go back to list
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        departmentVM.error ?? 'Failed to delete department',
                      ),
                      backgroundColor: const Color(0xFFEF4444),
                    ),
                  );
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
