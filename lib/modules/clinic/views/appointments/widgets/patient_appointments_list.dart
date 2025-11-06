import 'package:flutter/material.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

/// Widget to display patient's appointments and follow-ups
class PatientAppointmentsList extends StatelessWidget {
  final ClinicPatient patient;
  final NewAppointmentViewModel viewModel;

  const PatientAppointmentsList({
    super.key,
    required this.patient,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Use the new method to get complete patient details
    final patientDetails = viewModel.getPatientDetailsWithAppointments();

    final appointments =
        patientDetails['appointments'] as List<AppointmentDetail>;
    final followUps = patientDetails['followUps'] as List<FollowUpDetail>;
    final hasAppointments = patientDetails['hasAppointments'] as bool;
    final hasFollowUps = patientDetails['hasFollowUps'] as bool;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Appointments Section
          ExpansionTile(
            leading: const Icon(Icons.event_note),
            title: Text('Appointments (${appointments.length})'),
            children: [
              if (hasAppointments)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final apt = appointments[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getStatusColor(apt.status),
                        child: Icon(
                          _getStatusIcon(apt.status),
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      title: Text(_formatDateTime(apt.appointmentTime)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type: ${apt.consultationType}'),
                          Text('Status: ${apt.status}'),
                          if (apt.feeAmount > 0) Text('Fee: ₹${apt.feeAmount}'),
                        ],
                      ),
                      trailing: apt.isFollowUpAppointment
                          ? const Chip(
                              label: Text('Follow-Up'),
                              backgroundColor: Colors.orange,
                            )
                          : const Chip(
                              label: Text('Regular'),
                              backgroundColor: Colors.blue,
                            ),
                    );
                  },
                )
              else
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No appointments found'),
                ),
            ],
          ),

          // Follow-Ups Section
          ExpansionTile(
            leading: const Icon(Icons.refresh),
            title: Text('Follow-Ups (${followUps.length})'),
            children: [
              if (hasFollowUps)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: followUps.length,
                  itemBuilder: (context, index) {
                    final fu = followUps[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getFollowUpStatusColor(fu.status),
                        child: Icon(
                          fu.isFree ? Icons.free_breakfast : Icons.money,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      title: Text(fu.status.toUpperCase()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Valid From: ${fu.validFrom}'),
                          Text('Valid Until: ${fu.validUntil}'),
                          if (fu.daysRemaining != null)
                            Text('Days Remaining: ${fu.daysRemaining}'),
                        ],
                      ),
                      trailing: fu.isFree
                          ? const Chip(
                              label: Text('FREE'),
                              backgroundColor: Colors.green,
                            )
                          : const Chip(
                              label: Text('PAID'),
                              backgroundColor: Colors.orange,
                            ),
                    );
                  },
                )
              else
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No follow-ups found'),
                ),
            ],
          ),

          // Follow-Up Eligibility Check Button
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _showFollowUpEligibility(context),
            icon: const Icon(Icons.medical_information),
            label: const Text('Check Follow-Up Eligibility'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16), // Extra padding at bottom
        ],
      ),
    );
  }

  void _showFollowUpEligibility(BuildContext context) {
    // ✅ Use the new method to check eligibility
    final eligibility = viewModel.checkFollowUpBookingEligibility();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Follow-Up Eligibility'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: ${eligibility['status']}'),
            const SizedBox(height: 8),
            Text('Eligible: ${eligibility['eligible']}'),
            const SizedBox(height: 8),
            Text('Is Free: ${eligibility['isFree']}'),
            const SizedBox(height: 8),
            Text('Message: ${eligibility['message']}'),
            if (eligibility['daysRemaining'] != null)
              Text('Days Remaining: ${eligibility['daysRemaining']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (eligibility['eligible'] == true)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Trigger follow-up booking flow
              },
              child: Text(
                eligibility['isFree'] == true ? 'Book FREE' : 'Book PAID',
              ),
            ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'confirmed':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'confirmed':
        return Icons.check_circle;
      case 'completed':
        return Icons.done;
      case 'cancelled':
        return Icons.cancel;
      case 'pending':
        return Icons.schedule;
      default:
        return Icons.info;
    }
  }

  Color _getFollowUpStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'used':
        return Colors.blue;
      case 'expired':
        return Colors.red;
      case 'renewed':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _formatDateTime(String dateTime) {
    try {
      final dt = DateTime.parse(dateTime);
      return '${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute}';
    } catch (e) {
      return dateTime;
    }
  }
}
