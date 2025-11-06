import 'package:flutter/material.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart';
import 'package:intl/intl.dart';

class PatientDetailModal extends StatelessWidget {
  final ClinicPatient patient;

  const PatientDetailModal({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Text(
                          patient.firstName[0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${patient.firstName} ${patient.lastName}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '📞 ${patient.phone}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // MO ID
                      if (patient.moId != null && patient.moId!.isNotEmpty) ...[
                        _buildInfoRow('🆔 MO ID', patient.moId!),
                        const SizedBox(height: 16),
                      ],

                      // Doctors Section - Show unique doctors from appointments
                      _buildDoctorsSection(),

                      // Follow-ups Section
                      if (patient.followUps.isNotEmpty) ...[
                        _buildSectionTitle(
                          'Follow-Ups (${patient.followUps.length})',
                        ),
                        const SizedBox(height: 12),
                        ...patient.followUps.map(
                          (fu) => _buildFollowUpCard(fu),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Appointments Section
                      if (patient.appointments.isNotEmpty) ...[
                        _buildSectionTitle(
                          'Appointments (${patient.appointments.length})',
                        ),
                        const SizedBox(height: 12),
                        ...patient.appointments
                            .take(10)
                            .map((apt) => _buildAppointmentCard(apt)),
                        const SizedBox(height: 24),
                      ] else ...[
                        _buildSectionTitle('Appointments'),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'No appointments yet',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildFollowUpCard(FollowUpDetail fu) {
    Color statusColor = Colors.grey;
    String statusText = fu.status;
    String statusIcon = '📋';

    if (fu.status == 'active') {
      if (fu.isFree) {
        statusColor = Colors.green;
        statusIcon = '🟢';
        statusText = 'Free Follow-Up';
      } else {
        statusColor = Colors.orange;
        statusIcon = '🟠';
        statusText = 'Paid Follow-Up';
      }
    } else if (fu.status == 'used') {
      statusColor = Colors.orange;
      statusIcon = '⚠️';
      statusText = 'Used';
    } else if (fu.status == 'expired') {
      statusColor = Colors.red;
      statusIcon = '⏰';
      statusText = 'Expired';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: statusColor.withOpacity(0.05),
      child: ExpansionTile(
        leading: Text(statusIcon, style: const TextStyle(fontSize: 24)),
        title: Text(
          statusText,
          style: TextStyle(fontWeight: FontWeight.w600, color: statusColor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('👤 Doctor ID: ${fu.doctorId}'),
            Text('🏥 Department ID: ${fu.departmentId}'),
            Text('📅 Valid from: ${_formatDate(fu.validFrom)}'),
            Text('📅 Valid until: ${_formatDate(fu.validUntil)}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Follow-up ID', fu.followUpId),
                _buildDetailRow(
                  'Source Appointment ID',
                  fu.sourceAppointmentId,
                ),
                if (fu.usedAppointmentId != null)
                  _buildDetailRow('Used Appointment ID', fu.usedAppointmentId!),
                _buildDetailRow('Valid from', _formatDate(fu.validFrom)),
                _buildDetailRow('Valid until', _formatDate(fu.validUntil)),
                if (fu.createdAt != null)
                  _buildDetailRow('Created at', _formatDate(fu.createdAt!)),
                if (fu.updatedAt != null)
                  _buildDetailRow('Updated at', _formatDate(fu.updatedAt!)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(AppointmentDetail apt) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(apt.status),
          child: Icon(
            _getStatusIcon(apt.status),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          _formatDateTime(apt.appointmentTime),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Type: ${apt.consultationType}'),
            if (apt.status.isNotEmpty) Text('Status: ${apt.status}'),
            if (apt.feeAmount > 0) Text('Fee: ₹${apt.feeAmount}'),
            if (apt.isFollowUpAppointment)
              const Chip(
                label: Text('Follow-Up', style: TextStyle(fontSize: 10)),
                backgroundColor: Colors.orange,
              ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  IconData _getStatusIcon(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
      case 'confirmed':
        return Icons.check_circle;
      case 'pending':
        return Icons.access_time;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.event;
    }
  }

  String _formatDateTime(String dateTime) {
    try {
      final dt = DateTime.parse(dateTime);
      return DateFormat('MMM dd, yyyy • HH:mm').format(dt);
    } catch (e) {
      return dateTime;
    }
  }

  String _formatDate(String date) {
    try {
      final dt = DateTime.parse(date);
      return DateFormat('MMM dd, yyyy').format(dt);
    } catch (e) {
      return date;
    }
  }

  // Build doctors section
  Widget _buildDoctorsSection() {
    // Get unique doctors from appointments
    final Map<String, Map<String, dynamic>> uniqueDoctors = {};

    for (var apt in patient.appointments) {
      if (apt.doctorId.isNotEmpty && !uniqueDoctors.containsKey(apt.doctorId)) {
        uniqueDoctors[apt.doctorId] = {
          'doctorId': apt.doctorId,
          'doctorName': 'Doctor ${apt.doctorId.substring(0, 8)}',
          'departmentId': apt.departmentId,
          'departmentName': apt.departmentId,
        };
      }
    }

    if (uniqueDoctors.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Doctors (${uniqueDoctors.length})'),
        const SizedBox(height: 12),
        ...uniqueDoctors.values.map(
          (doctorInfo) => _buildDoctorCard(
            doctorInfo['doctorId'] as String,
            doctorInfo['doctorName'] as String,
            doctorInfo['departmentId'] as String?,
            doctorInfo['departmentName'] as String,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildDoctorCard(
    String doctorId,
    String doctorName,
    String? departmentId,
    String departmentName,
  ) {
    // Count appointments with this doctor
    final appointmentCount = patient.appointments
        .where((apt) => apt.doctorId == doctorId)
        .length;

    // Count follow-ups with this doctor
    final matchingFollowUps = patient.followUps.where(
      (fu) =>
          fu.doctorId == doctorId &&
          (departmentId == null || fu.departmentId == departmentId),
    );

    final followUpCount = matchingFollowUps.length;

    // Check if there's an active follow-up
    final activeFollowUp = matchingFollowUps.firstWhere(
      (fu) => fu.status == 'active',
      orElse: () => matchingFollowUps.isNotEmpty
          ? matchingFollowUps.first
          : FollowUpDetail(
              followUpId: '',
              sourceAppointmentId: '',
              doctorId: '',
              departmentId: '',
              status: 'none',
              isFree: false,
              validFrom: '',
              validUntil: '',
            ),
    );

    // Determine style based on status
    bool isFreeFollowUp =
        activeFollowUp.status == 'active' && activeFollowUp.isFree;
    bool isUsed = activeFollowUp.status == 'used';
    bool isExpired = activeFollowUp.status == 'expired';

    Color backgroundColor;
    Color badgeColor;
    String statusText = '';
    IconData statusIcon;

    if (isFreeFollowUp) {
      backgroundColor = const Color(0xFFE8F5E9);
      badgeColor = const Color(0xFF2E7D32);
      statusText = followUpCount > 0
          ? 'Free Follow-Up Active'
          : 'No Active Follow-Up';
      statusIcon = Icons.check_circle;
    } else if (isUsed) {
      backgroundColor = const Color(0xFFFFF3E0);
      badgeColor = const Color(0xFFF57C00);
      statusText = 'Follow-Up Already Used';
      statusIcon = Icons.info;
    } else if (isExpired) {
      backgroundColor = const Color(0xFFFFEBEE);
      badgeColor = const Color(0xFFD32F2F);
      statusText = 'Follow-Up Expired';
      statusIcon = Icons.access_time;
    } else {
      backgroundColor = const Color(0xFFF5F5F5);
      badgeColor = const Color(0xFF757575);
      statusText = 'No Follow-Up Available';
      statusIcon = Icons.info_outline;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [backgroundColor, backgroundColor.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: badgeColor.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.person, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.local_hospital,
                            size: 14,
                            color: badgeColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            departmentName,
                            style: TextStyle(
                              fontSize: 13,
                              color: badgeColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: badgeColor, width: 1.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 14, color: badgeColor),
                      const SizedBox(width: 4),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 11,
                          color: badgeColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Statistics
            Row(
              children: [
                _buildStatChip(
                  '${appointmentCount} ${appointmentCount == 1 ? 'Appointment' : 'Appointments'}',
                  Colors.blue,
                ),
                const SizedBox(width: 8),
                if (followUpCount > 0)
                  _buildStatChip(
                    '${followUpCount} Follow-${followUpCount == 1 ? 'Up' : 'Ups'}',
                    Colors.green,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            color == Colors.blue ? Icons.event : Icons.history,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
