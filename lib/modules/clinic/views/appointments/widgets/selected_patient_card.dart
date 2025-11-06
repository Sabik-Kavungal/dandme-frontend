import 'package:flutter/material.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

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
    // Get status info for beautiful design
    final statusInfo = _getStatusInfoForCard();

    // Check if should apply follow-up colors based on consultation type
    final shouldShowFollowUpColors = _shouldShowFollowUpColors();

    // Determine border color based on status
    Color borderColor = Colors.grey.shade200;

    // Only apply follow-up colors if consultation type is follow-up
    if (shouldShowFollowUpColors && viewModel.selectedDoctorObject != null) {
      final matchingFollowUps = patient.followUps
          .where(
            (fu) =>
                fu.doctorId == viewModel.selectedDoctorObject?.doctorId &&
                (viewModel.selectedDepartmentId == null ||
                    fu.departmentId == viewModel.selectedDepartmentId),
          )
          .toList();

      if (matchingFollowUps.isNotEmpty) {
        final followUp = matchingFollowUps.firstWhere(
          (fu) => fu.status == 'active',
          orElse: () => matchingFollowUps.first,
        );

        if (followUp.status == 'active') {
          if (followUp.isFree) {
            borderColor = Colors.green.shade300;
          } else {
            borderColor = Colors.orange.shade300;
          }
        } else if (followUp.status == 'used') {
          borderColor = Colors.orange.shade200;
        } else if (followUp.status == 'expired') {
          borderColor = Colors.red.shade200;
        }
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circle icon (like bank icon)
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: statusInfo['badgeColor'] as Color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                patient.firstName[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Patient info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${patient.firstName} ${patient.lastName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF212121),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  patient.phone,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Follow-up status badge (only show for follow-up consultations)
                if (shouldShowFollowUpColors) _buildFollowUpStatusBadge(),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Checkmark + Close button
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Checkmark (always visible for selected patient)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: statusInfo['badgeColor'] as Color,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 15),
              ),
              const SizedBox(width: 8),
              // Close button with red background
              GestureDetector(
                onTap: onDeselect,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Get status info for beautiful card design
  Map<String, dynamic> _getStatusInfoForCard() {
    Color backgroundColor = const Color(0xFFF5F5F5);
    Color badgeColor = const Color(0xFF757575);
    String statusText = '';

    if (viewModel.selectedDoctorObject == null) {
      return {
        'backgroundColor': backgroundColor,
        'badgeColor': badgeColor,
        'statusText': 'Select Doctor First',
      };
    }

    try {
      final matchingFollowUps = patient.followUps
          .where(
            (fu) =>
                fu.doctorId == viewModel.selectedDoctorObject?.doctorId &&
                (viewModel.selectedDepartmentId == null ||
                    fu.departmentId == viewModel.selectedDepartmentId),
          )
          .toList();

      if (matchingFollowUps.isNotEmpty) {
        final followUp = matchingFollowUps.firstWhere(
          (fu) => fu.status == 'active',
          orElse: () => matchingFollowUps.first,
        );

        if (followUp.status == 'active') {
          final daysRemaining = followUp.daysRemaining ?? 0;
          if (followUp.isFree) {
            backgroundColor = const Color(0xFFE8F5E9);
            badgeColor = const Color(0xFF2E7D32);
            statusText = 'Free Follow-Up ($daysRemaining days)';
          } else {
            backgroundColor = const Color(0xFFFFF3E0);
            badgeColor = const Color(0xFFF57C00);
            statusText = 'Paid Follow-Up';
          }
        } else if (followUp.status == 'used') {
          backgroundColor = const Color(0xFFFFF3E0);
          badgeColor = const Color(0xFFF57C00);
          statusText = 'Follow-Up Already Used';
        } else if (followUp.status == 'expired') {
          backgroundColor = const Color(0xFFFFEBEE);
          badgeColor = const Color(0xFFD32F2F);
          statusText = 'Follow-Up Expired';
        }
      } else {
        // Check if has regular appointments
        final hasAppointments = patient.appointments.any(
          (apt) =>
              apt.doctorId == viewModel.selectedDoctorObject?.doctorId &&
              (viewModel.selectedDepartmentId == null ||
                  apt.departmentId == viewModel.selectedDepartmentId),
        );

        if (!hasAppointments) {
          backgroundColor = const Color(0xFFF5F5F5);
          badgeColor = const Color(0xFF757575);
          statusText = 'No Previous Appointment';
        }
      }
    } catch (e) {
      // Use defaults
    }

    return {
      'backgroundColor': backgroundColor,
      'badgeColor': badgeColor,
      'statusText': statusText.isNotEmpty ? statusText : 'Ready to Book',
    };
  }

  /// Build follow-up status badge with remaining days
  Widget _buildFollowUpStatusBadge() {
    if (viewModel.selectedDoctorObject == null) {
      return const SizedBox.shrink();
    }

    final matchingFollowUps = patient.followUps
        .where(
          (fu) =>
              fu.doctorId == viewModel.selectedDoctorObject?.doctorId &&
              (viewModel.selectedDepartmentId == null ||
                  fu.departmentId == viewModel.selectedDepartmentId),
        )
        .toList();

    if (matchingFollowUps.isEmpty) {
      return const SizedBox.shrink();
    }

    final followUp = matchingFollowUps.firstWhere(
      (fu) => fu.status == 'active',
      orElse: () => matchingFollowUps.first,
    );

    String text = '';
    Color bgColor = Colors.grey.shade100;
    Color textColor = Colors.grey.shade700;
    IconData icon = Icons.info;

    if (followUp.status == 'active') {
      final daysRemaining = followUp.daysRemaining ?? 0;
      if (followUp.isFree) {
        text = 'Free Follow-Up ($daysRemaining days left)';
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
        icon = Icons.check_circle;
      } else {
        text = 'Paid Follow-Up';
        bgColor = Colors.orange.shade50;
        textColor = Colors.orange.shade700;
        icon = Icons.payment;
      }
    } else if (followUp.status == 'used') {
      text = 'Follow-Up Already Used';
      bgColor = Colors.orange.shade50;
      textColor = Colors.orange.shade700;
      icon = Icons.check_box;
    } else if (followUp.status == 'expired') {
      text = 'Expired - Book Regular Appointment for Free Follow-Up';
      bgColor = Colors.red.shade50;
      textColor = Colors.red.shade700;
      icon = Icons.schedule;
    } else {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: textColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: textColor),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 9,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Check if should show follow-up colors based on consultation type
  bool _shouldShowFollowUpColors() {
    final consultationType = viewModel.selectedConsultationType;
    return consultationType == 'follow-up-via-clinic' ||
        consultationType == 'follow-up-via-video';
  }
}
