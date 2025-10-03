import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/clinic_vm.dart';
import 'package:a/viewModels/doctor_vm.dart';
import 'package:a/models/clinic_model.dart';
import 'package:a/models/doctor_model.dart';

class AddClinicDoctorLinkScreen extends StatefulWidget {
  @override
  _AddClinicDoctorLinkScreenState createState() =>
      _AddClinicDoctorLinkScreenState();
}

class _AddClinicDoctorLinkScreenState extends State<AddClinicDoctorLinkScreen> {
  final _formKey = GlobalKey<FormState>();

  DoctorModel? _selectedDoctor;
  List<String> _selectedClinics = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load clinicVM when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
      final doctorVM = Provider.of<DoctorViewModel>(context, listen: false);
      clinicVM.fetchClinics(context);
      doctorVM.fetchDoctors(context);
    });
  }

  InputDecoration inputDecoration(String label) => InputDecoration(
    labelText: label,
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'Create Clinic-Doctor Links',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Selection Card
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Doctor",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Search Doctor:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: inputDecoration(
                          'Search doctor by name or specialization',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      Consumer<DoctorViewModel>(
                        builder: (context, doctorVM, child) {
                          if (doctorVM.isLoading) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (doctorVM.error != null) {
                            return Card(
                              color: Colors.red[50],
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Icon(Icons.error, color: Colors.red),
                                    SizedBox(height: 8),
                                    Text('Error: ${doctorVM.error}'),
                                    SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        doctorVM.clearError();
                                        doctorVM.fetchDoctors(context);
                                      },
                                      child: Text('Retry'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          final filteredDoctors = doctorVM.doctors.where((
                            doctor,
                          ) {
                            if (_searchQuery.isEmpty) return true;
                            final searchLower = _searchQuery.toLowerCase();
                            return (doctor.firstName?.toLowerCase().contains(
                                      searchLower,
                                    ) ==
                                    true) ||
                                (doctor.lastName?.toLowerCase().contains(
                                      searchLower,
                                    ) ==
                                    true) ||
                                (doctor.specialization?.toLowerCase().contains(
                                      searchLower,
                                    ) ==
                                    true) ||
                                (doctor.email?.toLowerCase().contains(
                                      searchLower,
                                    ) ==
                                    true);
                          }).toList();

                          return Container(
                            height: 200,
                            child: ListView.builder(
                              itemCount: filteredDoctors.length,
                              itemBuilder: (context, index) {
                                final doctor = filteredDoctors[index];
                                final isSelected =
                                    _selectedDoctor?.doctorCode ==
                                    doctor.doctorCode;

                                return Card(
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  color: isSelected ? Colors.blue[50] : null,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.blueAccent,
                                      child: Text(
                                        _getDoctorInitials(
                                          doctor.firstName,
                                          doctor.lastName,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      _getDoctorFullName(
                                        doctor.firstName,
                                        doctor.lastName,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (doctor.specialization != null)
                                          Text(doctor.specialization!),
                                        if (doctor.email != null)
                                          Text(
                                            doctor.email!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                      ],
                                    ),
                                    trailing: isSelected
                                        ? Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                          )
                                        : null,
                                    onTap: () {
                                      setState(() {
                                        _selectedDoctor = doctor;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Clinic Selection Card
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Clinics",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16),
                      Consumer<ClinicViewModel>(
                        builder: (context, clinicVM, child) {
                          if (clinicVM.isLoading) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (clinicVM.error != null) {
                            return Card(
                              color: Colors.red[50],
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Icon(Icons.error, color: Colors.red),
                                    SizedBox(height: 8),
                                    Text('Error: ${clinicVM.error}'),
                                    SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        clinicVM.clearError();
                                        clinicVM.fetchClinics(context);
                                      },
                                      child: Text('Retry'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Container(
                                constraints: BoxConstraints(maxHeight: 300),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: clinicVM.clinics.length,
                                  itemBuilder: (context, index) {
                                    final clinic = clinicVM.clinics[index];
                                    final isSelected = _selectedClinics
                                        .contains(clinic.clinicCode ?? '');

                                    return Card(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      color: isSelected
                                          ? Colors.green[50]
                                          : null,
                                      child: CheckboxListTile(
                                        title: Text(
                                          clinic.name ?? 'Unknown Clinic',
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Code: ${clinic.clinicCode ?? 'N/A'}',
                                            ),
                                            if (clinic.phone != null)
                                              Text('Phone: ${clinic.phone!}'),
                                          ],
                                        ),
                                        value: isSelected,
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == true) {
                                              if (clinic.clinicCode != null) {
                                                _selectedClinics.add(
                                                  clinic.clinicCode!,
                                                );
                                              }
                                            } else {
                                              _selectedClinics.remove(
                                                clinic.clinicCode ?? '',
                                              );
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Selected Clinics: ${_selectedClinics.length}',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Submit Button
              Center(
                child: Consumer<ClinicViewModel>(
                  builder: (context, clinicVM, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed:
                          (clinicVM.isLinking ||
                              _selectedDoctor == null ||
                              _selectedClinics.isEmpty)
                          ? null
                          : () => _createLinks(context),
                      child: clinicVM.isLinking
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              'Create Links (${_selectedClinics.length} clinic(s))',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDoctorInitials(String? firstName, String? lastName) {
    String first = firstName?.isNotEmpty == true
        ? firstName![0].toUpperCase()
        : 'D';
    String last = lastName?.isNotEmpty == true
        ? lastName![0].toUpperCase()
        : 'R';
    return '$first$last';
  }

  String _getDoctorFullName(String? firstName, String? lastName) {
    if (firstName != null && lastName != null) {
      return 'Dr. $firstName $lastName';
    } else if (firstName != null) {
      return 'Dr. $firstName';
    } else if (lastName != null) {
      return 'Dr. $lastName';
    } else {
      return 'Dr. Unknown';
    }
  }

  void _createLinks(BuildContext context) async {
    final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

    // Validate doctor has required IDs
    if (_selectedDoctor?.userId == null || _selectedDoctor!.userId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: Selected doctor does not have a valid User ID'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_selectedDoctor?.drid == null || _selectedDoctor!.drid!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: Selected doctor does not have a valid Doctor ID',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    bool allSuccess = true;
    int successCount = 0;
    List<String> failedClinics = [];

    for (String clinicCode in _selectedClinics) {
      final clinic = clinicVM.clinics.firstWhere(
        (c) => c.clinicCode == clinicCode,
        orElse: () => ClinicModel(
          organizationId: 'temp',
          clinicCode: clinicCode,
          name: 'Unknown Clinic',
        ),
      );

      if (clinic.id == null || clinic.id!.isEmpty) {
        failedClinics.add('${clinic.name ?? clinicCode} (No valid ID)');
        allSuccess = false;
        continue;
      }

      final success = await clinicVM.addClinicDoctorLinkSimple(
        clinic.id!, // clinic_id for API
        _selectedDoctor!.drid!, // doctor_id for API
        context,
      );

      if (success) {
        successCount++;
      } else {
        failedClinics.add(clinic.name ?? clinicCode);
        allSuccess = false;
      }
    }

    if (allSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Successfully created $successCount clinic-doctor link(s)',
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Created $successCount link(s) successfully. '
            'Failed for: ${failedClinics.join(', ')}',
          ),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}
