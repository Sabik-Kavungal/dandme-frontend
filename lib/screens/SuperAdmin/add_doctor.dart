import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/doctor_vm.dart';
import 'package:a/models/doctor_model.dart';

class AddDoctorScreen extends StatefulWidget {
  final DoctorModel? editDoctor;
  AddDoctorScreen({this.editDoctor});

  @override
  _AddDoctorScreenState createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  final _formKey = GlobalKey<FormState>();

  // Base fields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Doctor fields
  TextEditingController doctorCodeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController consultationFeeController = TextEditingController();
  TextEditingController followUpFeeController = TextEditingController();
  TextEditingController followUpDaysController = TextEditingController();

  // Mode selection
  bool isExistingUser = false;
  TextEditingController userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editDoctor != null) {
      _populateFields();
    }
  }

  void _populateFields() {
    final doctor = widget.editDoctor!;
    firstNameController.text = doctor.firstName ?? '';
    lastNameController.text = doctor.lastName ?? '';
    emailController.text = doctor.email ?? '';
    usernameController.text = doctor.username ?? '';
    phoneController.text = doctor.phone ?? '';
    doctorCodeController.text = doctor.doctorCode ?? '';
    specializationController.text = doctor.specialization ?? '';
    licenseController.text = doctor.licenseNumber ?? '';
    consultationFeeController.text = doctor.consultationFee?.toString() ?? '';
    followUpFeeController.text = doctor.followUpFee?.toString() ?? '';
    followUpDaysController.text = doctor.followUpDays?.toString() ?? '';
    userIdController.text = doctor.userId ?? '';

    // Determine mode based on whether userId is present
    isExistingUser = doctor.userId != null && doctor.userId!.isNotEmpty;
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
          widget.editDoctor == null ? 'Add New Doctor' : 'Edit Doctor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mode Selection
                  Text(
                    "User Selection Mode",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          RadioListTile<bool>(
                            title: Text('Create New User'),
                            subtitle: Text(
                              'Create a new user account for this doctor',
                            ),
                            value: false,
                            groupValue: isExistingUser,
                            onChanged: (value) {
                              setState(() {
                                isExistingUser = value!;
                              });
                            },
                            activeColor: Colors.blueAccent,
                          ),
                          RadioListTile<bool>(
                            title: Text('Use Existing User'),
                            subtitle: Text('Link to an existing user account'),
                            value: true,
                            groupValue: isExistingUser,
                            onChanged: (value) {
                              setState(() {
                                isExistingUser = value!;
                              });
                            },
                            activeColor: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Existing User Fields
                  if (isExistingUser) ...[
                    Text(
                      "Existing User Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: userIdController,
                      decoration: inputDecoration('User ID'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 24),
                  ],

                  // New User Fields
                  if (!isExistingUser) ...[
                    Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: firstNameController,
                      decoration: inputDecoration('First Name'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: lastNameController,
                      decoration: inputDecoration('Last Name'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: inputDecoration('Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: usernameController,
                      decoration: inputDecoration('Username'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      decoration: inputDecoration('Phone Number'),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: inputDecoration('Password'),
                      validator: (value) {
                        if (widget.editDoctor == null) {
                          return value == null || value.isEmpty
                              ? 'Required'
                              : null;
                        }
                        return null; // Optional for editing
                      },
                    ),
                    SizedBox(height: 24),
                  ],

                  // Doctor Details
                  Text(
                    "Doctor Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: doctorCodeController,
                    decoration: inputDecoration('Doctor Code'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: specializationController,
                    decoration: inputDecoration('Specialization'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: licenseController,
                    decoration: inputDecoration('License Number'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: consultationFeeController,
                    decoration: inputDecoration('Consultation Fee'),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: followUpFeeController,
                    decoration: inputDecoration('Follow Up Fee'),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: followUpDaysController,
                    decoration: inputDecoration('Follow Up Days'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Consumer<DoctorViewModel>(
                      builder: (context, doctorVM, child) {
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
                          onPressed: doctorVM.isAdding
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    _saveDoctor(context);
                                  }
                                },
                          child: doctorVM.isAdding
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
                                  widget.editDoctor == null
                                      ? 'Add Doctor'
                                      : 'Save Changes',
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
        ),
      ),
    );
  }

  void _saveDoctor(BuildContext context) async {
    final doctorVM = Provider.of<DoctorViewModel>(context, listen: false);

    // Create DoctorModel based on mode
    DoctorModel doctor;

    if (isExistingUser) {
      doctor = DoctorModel(
        userId: userIdController.text,
        doctorCode: doctorCodeController.text,
        specialization: specializationController.text,
        licenseNumber: licenseController.text,
        consultationFee: double.tryParse(consultationFeeController.text),
        followUpFee: double.tryParse(followUpFeeController.text),
        followUpDays: int.tryParse(followUpDaysController.text),
      );
    } else {
      doctor = DoctorModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        username: usernameController.text,
        phone: phoneController.text,
        password: passwordController.text.isNotEmpty
            ? passwordController.text
            : null,
        doctorCode: doctorCodeController.text,
        specialization: specializationController.text,
        licenseNumber: licenseController.text,
        consultationFee: double.tryParse(consultationFeeController.text),
        followUpFee: double.tryParse(followUpFeeController.text),
        followUpDays: int.tryParse(followUpDaysController.text),
      );
    }

    final success = await doctorVM.addDoctor(doctor, context);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.editDoctor == null
                ? 'Doctor added successfully!'
                : 'Doctor updated successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${doctorVM.error ?? 'Failed to save doctor'}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    doctorCodeController.dispose();
    specializationController.dispose();
    licenseController.dispose();
    consultationFeeController.dispose();
    followUpFeeController.dispose();
    followUpDaysController.dispose();
    userIdController.dispose();
    super.dispose();
  }
}
