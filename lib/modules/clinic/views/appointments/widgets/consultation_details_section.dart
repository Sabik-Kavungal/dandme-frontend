import 'package:flutter/material.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

/// Compact consultation details section with improved UX
class ConsultationDetailsSection extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final bool isMobile;

  const ConsultationDetailsSection({
    super.key,
    required this.viewModel,
    this.scaleFactor = 1.0,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form fields only - no header
          if (isMobile)
            _buildMobileLayout()
          else
            LayoutBuilder(
              builder: (context, constraints) {
                // Check if it's a tablet (600-1024px)
                if (constraints.maxWidth < 1024 &&
                    constraints.maxWidth >= 600) {
                  return _buildTabletLayout();
                } else {
                  return _buildWebLayout();
                }
              },
            ),
        ],
      ),
    );
  }

  /// Tablet layout (all dropdowns in same row)
  Widget _buildTabletLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildCompactDropdown(
            label: 'Consultation Type',
            value: viewModel.selectedConsultationType,
            onChanged: (value) => viewModel.setConsultationType(value!),
            items: viewModel.consultationTypesList,
            icon: Icons.category,
            color: const Color(0xFF6366F1),
          ),
        ),
        SizedBox(width: 8 * scaleFactor),
        Expanded(
          flex: 2,
          child: _buildCompactDropdown(
            label: 'Department',
            value: viewModel.selectedDepartment,
            onChanged: (value) => viewModel.setDepartment(value!),
            items: viewModel.departments
                .map((dept) => dept.name ?? 'Orthology')
                .toList(),
            icon: Icons.business,
            color: const Color(0xFF8B5CF6),
          ),
        ),
        SizedBox(width: 8 * scaleFactor),
        Expanded(
          flex: 3,
          child: _buildCompactDropdown(
            label: 'Doctor',
            value: viewModel.selectedDoctor,
            onChanged: (value) => viewModel.setDoctor(value!),
            items: viewModel.clinicDoctors.isEmpty
                ? ['Loading...']
                : viewModel.clinicDoctors
                      .map(
                        (doctor) =>
                            doctor.fullName ??
                            '${doctor.firstName} ${doctor.lastName}',
                      )
                      .toList(),
            icon: Icons.person,
            color: const Color(0xFF10B981),
          ),
        ),
      ],
    );
  }

  /// Web layout (compact horizontal row)
  Widget _buildWebLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildCompactDropdown(
            label: 'Consultation Type',
            value: viewModel.selectedConsultationType,
            onChanged: (value) => viewModel.setConsultationType(value!),
            items: viewModel.consultationTypesList,
            icon: Icons.category,
            color: const Color(0xFF6366F1),
          ),
        ),
        SizedBox(width: 8 * scaleFactor),
        Expanded(
          flex: 2,
          child: _buildCompactDropdown(
            label: 'Department',
            value: viewModel.selectedDepartment,
            onChanged: (value) => viewModel.setDepartment(value!),
            items: viewModel.departments
                .map((dept) => dept.name ?? 'Orthology')
                .toList(),
            icon: Icons.business,
            color: const Color(0xFF8B5CF6),
          ),
        ),
        SizedBox(width: 8 * scaleFactor),
        Expanded(
          flex: 3,
          child: _buildCompactDropdown(
            label: 'Doctor',
            value: viewModel.selectedDoctor,
            onChanged: (value) => viewModel.setDoctor(value!),
            items: viewModel.clinicDoctors.isEmpty
                ? ['Loading...']
                : viewModel.clinicDoctors
                      .map(
                        (doctor) =>
                            doctor.fullName ??
                            '${doctor.firstName} ${doctor.lastName}',
                      )
                      .toList(),
            icon: Icons.person,
            color: const Color(0xFF10B981),
          ),
        ),
      ],
    );
  }

  /// Mobile layout (compact vertical column)
  Widget _buildMobileLayout() {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: _buildCompactDropdown(
                label: 'Consultation Type',
                value: viewModel.selectedConsultationType,
                onChanged: (value) => viewModel.setConsultationType(value!),
                items: viewModel.consultationTypesList,
                icon: Icons.category,
                color: const Color(0xFF6366F1),
                isMobile: true,
              ),
            ),
            SizedBox(width: 6 * scaleFactor), // Reduced spacing
            Flexible(
              flex: 1,
              child: _buildCompactDropdown(
                label: 'Department',
                value: viewModel.selectedDepartment,
                onChanged: (value) => viewModel.setDepartment(value!),
                items: viewModel.departments
                    .map((dept) => dept.name ?? 'Orthology')
                    .toList(),
                icon: Icons.business,
                color: const Color(0xFF8B5CF6),
                isMobile: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 12 * scaleFactor),
        _buildCompactDropdown(
          label: 'Doctor',
          value: viewModel.selectedDoctor,
          onChanged: (value) => viewModel.setDoctor(value!),
          items: viewModel.clinicDoctors.isEmpty
              ? ['Loading...']
              : viewModel.clinicDoctors
                    .map(
                      (doctor) =>
                          doctor.fullName ??
                          '${doctor.firstName} ${doctor.lastName}',
                    )
                    .toList(),
          icon: Icons.person,
          color: const Color(0xFF10B981),
          isMobile: true,
        ),
      ],
    );
  }

  /// Build compact dropdown with better UX
  Widget _buildCompactDropdown({
    required String label,
    required String value,
    required Function(String?)? onChanged,
    required List<String> items,
    required IconData icon,
    required Color color,
    bool isMobile = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14 * scaleFactor, color: color),
            SizedBox(width: 4 * scaleFactor),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12 * scaleFactor,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF6B7280),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 6 * scaleFactor),
        Container(
          height: 36 * scaleFactor,
          constraints: BoxConstraints(maxWidth: double.infinity, minWidth: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6 * scaleFactor),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                onChanged: onChanged,
                isExpanded: true, // Fix overflow by expanding dropdown
                items: items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          _getDisplayLabel(item, label),
                          style: TextStyle(
                            fontSize: 13 * scaleFactor,
                            color: const Color(0xFF374151),
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    )
                    .toList(),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFF9CA3AF),
                  size: 18 * scaleFactor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Helper method to get user-friendly labels
  String _getDisplayLabel(String value, String label) {
    // Add "Dr." prefix for doctor names
    if (label.toLowerCase().contains('doctor') &&
        !value.startsWith('Dr.') &&
        value != 'Loading...') {
      return 'Dr. $value';
    }

    // Consultation type labels with emojis
    switch (value) {
      case 'clinic_visit':
        return '🏥 Clinic Visit';
      case 'video_consultation':
        return '💻 Video Call';
      case 'follow-up-via-clinic':
        return '🔄 Follow-Up';
      case 'follow-up-via-video':
        return '🔄 Video Follow-Up';
      default:
        return value;
    }
  }
}
