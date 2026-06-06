import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

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
        borderRadius: BorderRadius.circular(3),
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
          if (isMobile) _buildMobileLayout() else _buildWebLayout(),
        ],
      ),
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
            items: [
              'Select Department',
              ...viewModel.departments.map((dept) => dept.name ?? 'Orthology')
            ],
            icon: Icons.business,
            color: const Color(0xFF8B5CF6),
          ),
        ),
        SizedBox(width: 8 * scaleFactor),
        Expanded(flex: 3, child: _buildDoctorDropdown()),
      ],
    );
  }

  /// Mobile layout (compact vertical column)
  Widget _buildMobileLayout() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
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
            SizedBox(width: 8 * scaleFactor),
            Expanded(
              child: _buildCompactDropdown(
                label: 'Department',
                value: viewModel.selectedDepartment,
                onChanged: (value) => viewModel.setDepartment(value!),
                    items: [
                      'Select Department',
                      ...viewModel.departments
                          .map((dept) => dept.name ?? 'Orthology')
                    ],
                icon: Icons.business,
                color: const Color(0xFF8B5CF6),
                isMobile: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 12 * scaleFactor),
        _buildDoctorDropdown(isMobile: true),
      ],
    );
  }

  /// Dedicated Doctor Dropdown that handles loading state
  Widget _buildDoctorDropdown({bool isMobile = false}) {
    final isLoading = viewModel.isLoadingDoctors;
    // Show hint if no department has been selected yet
    final noDeptSelected = viewModel.noDepartmentSelectedYet;
    final noDoctors =
        !isLoading &&
        !noDeptSelected &&
        (viewModel.clinicDoctors.isEmpty ||
            viewModel.selectedDoctor == 'No doctors available' ||
            viewModel.selectedDoctor == 'Error loading doctors');

    // Determine what to show in dropdown
    final String hintText = noDeptSelected
        ? 'Select a department first'
        : isLoading
        ? 'Loading...'
        : noDoctors
        ? 'No doctors in this department'
        : viewModel.selectedDoctor;

    final List<String> doctorItems = (isLoading || noDeptSelected || noDoctors)
        ? [hintText]
        : [
            if (viewModel.selectedDoctor == 'Select Doctor') 'Select Doctor',
            ...viewModel.clinicDoctors.map(
              (doctor) =>
                  doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}',
            ),
          ];

    final isDisabled = isLoading || noDeptSelected || noDoctors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              size: 14 * scaleFactor,
              color: const Color(0xFF10B981),
            ),
            SizedBox(width: 4 * scaleFactor),
            Text(
              'Doctor',
              style: TextStyle(
                fontSize: 12 * scaleFactor,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF6B7280),
              ),
            ),
            if (isLoading) ...[
              SizedBox(width: 6 * scaleFactor),
              const SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: Color(0xFF10B981),
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 6 * scaleFactor),
        Container(
          height: 36 * scaleFactor,
          decoration: BoxDecoration(
            color: isDisabled ? const Color(0xFFF9FAFB) : Colors.white,
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF10B981).withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: hintText,
              // Disable until department is selected and doctors loaded
              onChanged: isDisabled
                  ? null
                  : (value) => viewModel.setDoctor(value!),
              padding: EdgeInsets.symmetric(horizontal: 10 * scaleFactor),
              items: doctorItems
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 13 * scaleFactor,
                          color: isDisabled
                              ? const Color(0xFF9CA3AF)
                              : const Color(0xFF374151),
                          fontWeight: FontWeight.w500,
                          fontStyle: noDeptSelected
                              ? FontStyle.italic
                              : FontStyle.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
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
            Text(
              label,
              style: TextStyle(
                fontSize: 12 * scaleFactor,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
        SizedBox(height: 6 * scaleFactor),
        Container(
          height: 36 * scaleFactor,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              onChanged: onChanged,
              padding: EdgeInsets.symmetric(horizontal: 10 * scaleFactor),
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
      ],
    );
  }

  /// Helper method to get user-friendly labels
  String _getDisplayLabel(String value, String label) {
    // Add "Dr." prefix for doctor names
    if (label.toLowerCase().contains('doctor') &&
        !value.startsWith('Dr.') &&
        value != 'Loading...' &&
        value != 'Select Doctor') {
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
