import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/clinic_vm.dart';
import 'package:a/models/clinic_doctor_link_model.dart';

class ClinicDoctorLinksListScreen extends StatefulWidget {
  @override
  _ClinicDoctorLinksListScreenState createState() => _ClinicDoctorLinksListScreenState();
}

class _ClinicDoctorLinksListScreenState extends State<ClinicDoctorLinksListScreen> {
  @override
  void initState() {
    super.initState();
    // Load clinic-doctor links when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
      clinicVM.refreshLinks(context);
    });
  }

  Color getLinkColor() {
    return Colors.purpleAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'Clinic-Doctor Links',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.black54),
            tooltip: 'Refresh',
            onPressed: () {
              final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
              clinicVM.refreshLinks(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black54),
            tooltip: 'Filter',
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<ClinicViewModel>(
        builder: (context, clinicVM, child) {
          if (clinicVM.isLoadingLinks) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
              ),
            );
          }

          if (clinicVM.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.redAccent),
                  SizedBox(height: 16),
                  Text(
                    'Error: ${clinicVM.error}',
                    style: TextStyle(fontSize: 16, color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      clinicVM.clearError();
                      clinicVM.refreshLinks(context);
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (clinicVM.clinicDoctorLinks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link_off, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No clinic-doctor links found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create your first clinic-doctor link to get started',
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: clinicVM.clinicDoctorLinks.length,
              itemBuilder: (context, index) {
                final link = clinicVM.clinicDoctorLinks[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with status
                        Row(
                          children: [
                            Icon(
                              Icons.link,
                              color: link.isActive == true ? Colors.green : Colors.red,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Link #${link.linkId ?? (index + 1)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: link.isActive == true ? Colors.green : Colors.red,
                              ),
                            ),
                            Spacer(),
                            if (link.createdAt != null)
                              Text(
                                _formatDate(link.createdAt!),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Clinic Info
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.local_hospital,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Clinic',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    link.clinic.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Code: ${link.clinic.clinicCode}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Doctor Info
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.medical_services,
                                color: Colors.greenAccent,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doctor',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    _getDoctorFullName(link.doctor.firstName, link.doctor.lastName),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    link.doctor.specialization ?? 'General Practitioner',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  if (link.doctor.email != null) ...[
                                    SizedBox(height: 2),
                                    Text(
                                      link.doctor.email!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Action Buttons
                        Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () => _toggleLinkStatus(context, link, index),
                              icon: Icon(
                                link.isActive == true ? Icons.visibility_off : Icons.visibility,
                                size: 16,
                                color: Colors.orange,
                              ),
                              label: Text(
                                link.isActive == true ? 'Deactivate' : 'Activate',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            SizedBox(width: 8),
                            TextButton.icon(
                              onPressed: () => _showDeleteConfirmation(context, link, index),
                              icon: Icon(Icons.delete, size: 16, color: Colors.red),
                              label: Text('Delete', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
                          ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        tooltip: 'Add Link',
        child: Icon(Icons.add, size: 28),
        onPressed: () {
          Navigator.pushNamed(context, '/add-clinic-doctor-link');
        },
      ),
    );
  }

  String _getDoctorFullName(String firstName, String lastName) {
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return 'Dr. $firstName $lastName';
    } else if (firstName.isNotEmpty) {
      return 'Dr. $firstName';
    } else if (lastName.isNotEmpty) {
      return 'Dr. $lastName';
    } else {
      return 'Dr. Unknown';
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  void _toggleLinkStatus(BuildContext context, ClinicDoctorLinkResponse link, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Toggle status functionality will be implemented'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, ClinicDoctorLinkResponse link, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Link'),
          content: Text(
            'Are you sure you want to delete the link between "${link.clinic.name}" and "${_getDoctorFullName(link.doctor.firstName, link.doctor.lastName)}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement delete functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Delete functionality not implemented yet'),
                    backgroundColor: Colors.orange,
                  ),
                );
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
                        );
      },
    );
  }
}
