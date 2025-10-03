import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/doctor_vm.dart';
import 'package:a/models/doctor_model.dart';
import 'package:a/screens/SuperAdmin/add_doctor.dart';

class DoctorsListScreen extends StatefulWidget {
  @override
  _DoctorsListScreenState createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  @override
  void initState() {
    super.initState();
    // Load doctors when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final doctorVM = Provider.of<DoctorViewModel>(context, listen: false);
      doctorVM.fetchDoctors(context);
    });
  }

  Color getDoctorColor() {
    return Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'Doctors Management',
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
              final doctorVM = Provider.of<DoctorViewModel>(
                context,
                listen: false,
              );
              doctorVM.refresh(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<DoctorViewModel>(
        builder: (context, doctorVM, child) {
          if (doctorVM.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            );
          }

          if (doctorVM.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.redAccent),
                  SizedBox(height: 16),
                  Text(
                    'Error: ${doctorVM.error}',
                    style: TextStyle(fontSize: 16, color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      doctorVM.clearError();
                      doctorVM.fetchDoctors(context);
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (doctorVM.doctors.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_services_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No doctors found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Add your first doctor to get started',
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: doctorVM.doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctorVM.doctors[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: getDoctorColor(),
                      child: Text(
                        _getInitials(doctor.firstName, doctor.lastName),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      _getFullName(doctor.firstName, doctor.lastName),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (doctor.email != null)
                          Text(
                            doctor.email!,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        if (doctor.specialization != null) ...[
                          SizedBox(height: 4),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: getDoctorColor().withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              doctor.specialization!.toUpperCase(),
                              style: TextStyle(
                                color: getDoctorColor(),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                        if (doctor.consultationFee != null) ...[
                          SizedBox(height: 4),
                          Text(
                            'Fee: \$${doctor.consultationFee!.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blueAccent),
                          tooltip: 'Edit',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    AddDoctorScreen(editDoctor: doctor),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          tooltip: 'Delete',
                          onPressed: () {
                            _showDeleteConfirmation(context, doctor, index);
                          },
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
        backgroundColor: Colors.blueAccent,
        tooltip: 'Add Doctor',
        child: Icon(Icons.add, size: 28),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddDoctorScreen()),
          );
        },
      ),
    );
  }

  String _getInitials(String? firstName, String? lastName) {
    String first = firstName?.isNotEmpty == true
        ? firstName![0].toUpperCase()
        : 'D';
    String last = lastName?.isNotEmpty == true
        ? lastName![0].toUpperCase()
        : 'R';
    return '$first$last';
  }

  String _getFullName(String? firstName, String? lastName) {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    } else if (firstName != null) {
      return firstName;
    } else if (lastName != null) {
      return lastName;
    } else {
      return 'Dr. Unknown';
    }
  }

  void _showDeleteConfirmation(
    BuildContext context,
    DoctorModel doctor,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Doctor'),
          content: Text(
            'Are you sure you want to delete ${_getFullName(doctor.firstName, doctor.lastName)}?',
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
