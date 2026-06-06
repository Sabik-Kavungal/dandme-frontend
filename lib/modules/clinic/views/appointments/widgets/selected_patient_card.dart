import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

/// A compact card showing the selected patient with status badge
class SelectedPatientCard extends StatelessWidget {
  final ClinicPatient patient;
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final VoidCallback onDeselect;

  const SelectedPatientCard({
    super.key,
    required this.patient,
    required this.viewModel,
    this.scaleFactor = 1.0,
    required this.onDeselect,
  });

  @override
  Widget build(BuildContext context) {
    // Check if should show follow-up
    final shouldShowFollowUp = _shouldShowFollowUp();

    final primaryBlue = const Color(0xFF3B82F6);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4 * scaleFactor,
        vertical: 2 * scaleFactor,
      ),
      padding: EdgeInsets.all(10 * scaleFactor),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryBlue.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Patient Avatar
            Container(
              width: 36 * scaleFactor,
              height: 36 * scaleFactor,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryBlue.withOpacity(0.2),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  patient.firstName.isNotEmpty
                      ? patient.firstName[0].toUpperCase()
                      : 'P',
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16 * scaleFactor,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
            SizedBox(width: 12 * scaleFactor),

            // Patient Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        '${patient.firstName} ${patient.lastName}',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14 * scaleFactor,
                          color: const Color(0xFF1E293B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          'SELECTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8 * scaleFactor,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_iphone_rounded,
                        size: 12 * scaleFactor,
                        color: const Color(0xFF64748B),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        patient.phone,
                        style: TextStyle(
                          fontSize: 12 * scaleFactor,
                          color: const Color(0xFF64748B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.badge_outlined,
                        size: 12 * scaleFactor,
                        color: const Color(0xFF64748B),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        patient.moId ?? 'N/A',
                        style: TextStyle(
                          fontSize: 12 * scaleFactor,
                          color: const Color(0xFF64748B),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  if (shouldShowFollowUp) ...[
                    const SizedBox(height: 10),
                    _buildFollowUpStatusBadge(),
                  ],
                ],
              ),
            ),

            // Action Divider
            Container(
              width: 1,
              margin: EdgeInsets.symmetric(
                horizontal: 16 * scaleFactor,
                vertical: 8 * scaleFactor,
              ),
              color: primaryBlue.withOpacity(0.1),
            ),

            // Deselect Action
            GestureDetector(
              onTap: onDeselect,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: EdgeInsets.all(10 * scaleFactor),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFEF4444).withOpacity(0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFEF4444).withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    color: const Color(0xFFEF4444),
                    size: 20 * scaleFactor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowUpStatusBadge() {
    if (viewModel.selectedDoctorObject == null) return const SizedBox.shrink();

    final matchingFollowUps = patient.followUps
        .where(
          (fu) =>
              fu.doctorId == viewModel.selectedDoctorObject?.doctorId &&
              (viewModel.selectedDepartmentId == null ||
                  fu.departmentId == viewModel.selectedDepartmentId),
        )
        .toList();

    if (matchingFollowUps.isEmpty) return const SizedBox.shrink();

    final followUp = matchingFollowUps.firstWhere(
      (fu) => fu.status == 'active',
      orElse: () => matchingFollowUps.first,
    );

    String text = '';
    Color color = const Color(0xFF64748B);
    IconData icon = Icons.info_outline;

    if (followUp.status == 'active') {
      final daysRemaining = followUp.daysRemaining ?? 0;
      if (followUp.isFree) {
        text = 'Free Follow-Up ($daysRemaining days left)';
        color = const Color(0xFF10B981);
        icon = Icons.check_circle_outline;
      } else {
        text = 'Paid Follow-Up';
        color = const Color(0xFFF59E0B);
        icon = Icons.payment_outlined;
      }
    } else if (followUp.status == 'used') {
      text = 'Follow-Up Already Used';
      color = const Color(0xFF64748B);
      icon = Icons.history_rounded;
    } else if (followUp.status == 'expired') {
      text = 'Expired Follow-Up';
      color = const Color(0xFFEF4444);
      icon = Icons.event_busy_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12 * scaleFactor, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 10 * scaleFactor,
              color: color,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowFollowUp() {
    final type = viewModel.selectedConsultationType;
    return type == 'follow-up-via-clinic' || type == 'follow-up-via-video';
  }
}
