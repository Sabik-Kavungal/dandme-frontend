import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

/// A reusable patient card widget displayed in search results
class PatientSearchCard extends StatefulWidget {
  final ClinicPatient patient;
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final VoidCallback onTap;
  final bool isEnabled;

  const PatientSearchCard({
    super.key,
    required this.patient,
    required this.viewModel,
    this.scaleFactor = 1.0,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  State<PatientSearchCard> createState() => _PatientSearchCardState();
}

class _PatientSearchCardState extends State<PatientSearchCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Check if this patient is selected
    final isSelected =
        widget.viewModel.selectedClinicPatient?.id == widget.patient.id;

    // Get status for design
    final statusInfo = _getStatusInfo();
    final shouldShowFollowUp = _shouldShowFollowUpDetails();

    // Determine colors for premium feel
    final baseColor = isSelected ? const Color(0xFFF0F7FF) : Colors.white;
    final borderColor = isSelected
        ? const Color(0xFF3B82F6)
        : (_isHovered ? const Color(0xFFCBD5E1) : const Color(0xFFE2E8F0));
    final accentColor = statusInfo['badgeColor'] as Color;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.isEnabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.isEnabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(
            horizontal: 16 * widget.scaleFactor,
            vertical: 2 * widget.scaleFactor,
          ),
          padding: EdgeInsets.all(8 * widget.scaleFactor),
          decoration: BoxDecoration(
            color: widget.isEnabled ? baseColor : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isEnabled ? borderColor : Colors.grey.shade200,
              width: isSelected ? 2.0 : 1.0,
            ),
            boxShadow: [
              if (widget.isEnabled && (_isHovered || isSelected))
                BoxShadow(
                  color:
                      (isSelected
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFF64748B))
                          .withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Row(
            children: [
              // Patient Avatar Section
              Container(
                width: 32 * widget.scaleFactor,
                height: 32 * widget.scaleFactor,
                decoration: BoxDecoration(
                  color: !widget.isEnabled
                      ? Colors.grey.shade200
                      : (isSelected
                            ? Colors.white
                            : accentColor.withOpacity(0.1)),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF3B82F6).withOpacity(0.2)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.patient.firstName.isNotEmpty
                        ? widget.patient.firstName[0].toUpperCase()
                        : 'P',
                    style: TextStyle(
                      color: !widget.isEnabled
                          ? Colors.grey.shade500
                          : (isSelected
                                ? const Color(0xFF3B82F6)
                                : accentColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * widget.scaleFactor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12 * widget.scaleFactor),

              // Patient Details Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.patient.firstName} ${widget.patient.lastName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13 * widget.scaleFactor,
                              color: widget.isEnabled
                                  ? const Color(0xFF1E293B)
                                  : Colors.grey.shade500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3B82F6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 10 * widget.scaleFactor,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android_rounded,
                          size: 12 * widget.scaleFactor,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.patient.phone,
                          style: TextStyle(
                            fontSize: 12 * widget.scaleFactor,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.badge_outlined,
                          size: 12 * widget.scaleFactor,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.patient.moId ?? 'N/A',
                          style: TextStyle(
                            fontSize: 12 * widget.scaleFactor,
                            color: const Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    // Follow-up status badge
                    if (shouldShowFollowUp) ...[
                      const SizedBox(height: 8),
                      _buildFollowUpStatusBadge(),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build follow-up status badge with remaining days
  Widget _buildFollowUpStatusBadge() {
    if (widget.viewModel.selectedDoctorObject == null) {
      return const SizedBox.shrink();
    }

    final matchingFollowUps = widget.patient.followUps
        .where(
          (fu) =>
              fu.doctorId == widget.viewModel.selectedDoctorObject?.doctorId &&
              (widget.viewModel.selectedDepartmentId == null ||
                  fu.departmentId == widget.viewModel.selectedDepartmentId),
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
    Color color = const Color(0xFF64748B);
    IconData icon = Icons.info_outline;

    if (followUp.status == 'active') {
      final daysRemaining = followUp.daysRemaining ?? 0;
      if (followUp.isFree) {
        text = 'Free Follow-Up ($daysRemaining days left)';
        color = const Color(0xFF10B981); // Emerald-500
        icon = Icons.check_circle_outline;
      } else {
        text = 'Paid Follow-Up';
        color = const Color(0xFFF59E0B); // Amber-500
        icon = Icons.payment_outlined;
      }
    } else if (followUp.status == 'used') {
      text = 'Follow-Up Already Used';
      color = const Color(0xFF64748B);
      icon = Icons.history_rounded;
    } else if (followUp.status == 'expired') {
      text = 'Expired Follow-Up';
      color = const Color(0xFFEF4444); // Red-500
      icon = Icons.event_busy_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14 * widget.scaleFactor, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 10 * widget.scaleFactor,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Check if should show follow-up details based on consultation type
  bool _shouldShowFollowUpDetails() {
    final consultationType = widget.viewModel.selectedConsultationType;
    return consultationType == 'follow-up-via-clinic' ||
        consultationType == 'follow-up-via-video';
  }

  /// Get status info for card design
  Map<String, dynamic> _getStatusInfo() {
    // Default neutral/primary colors for Clinic Visit
    Color badgeColor = const Color(0xFF3B82F6); // Standard Blue
    String statusText = 'Available';

    // ONLY check follow-up status if we are in a follow-up consultation mode
    if (!_shouldShowFollowUpDetails()) {
      return {'badgeColor': badgeColor, 'statusText': statusText};
    }

    if (widget.viewModel.selectedDoctorObject == null) {
      return {
        'badgeColor': const Color(0xFF64748B),
        'statusText': 'Select Doctor',
      };
    }

    try {
      final matchingFollowUps = widget.patient.followUps
          .where(
            (fu) =>
                fu.doctorId ==
                    widget.viewModel.selectedDoctorObject?.doctorId &&
                (widget.viewModel.selectedDepartmentId == null ||
                    fu.departmentId == widget.viewModel.selectedDepartmentId),
          )
          .toList();

      if (matchingFollowUps.isNotEmpty) {
        final followUp = matchingFollowUps.firstWhere(
          (fu) => fu.status == 'active',
          orElse: () => matchingFollowUps.first,
        );

        if (followUp.status == 'active') {
          badgeColor = followUp.isFree
              ? const Color(0xFF10B981)
              : const Color(0xFFF59E0B);
          statusText = followUp.isFree ? 'Free Follow-Up' : 'Paid Follow-Up';
        } else if (followUp.status == 'used') {
          badgeColor = const Color(0xFF64748B);
          statusText = 'Used';
        } else if (followUp.status == 'expired') {
          badgeColor = const Color(0xFFEF4444);
          statusText = 'Expired';
        }
      }
    } catch (e) {
      // Use defaults
    }

    return {'badgeColor': badgeColor, 'statusText': statusText};
  }
}
