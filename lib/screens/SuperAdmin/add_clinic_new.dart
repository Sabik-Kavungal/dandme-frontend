import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/clinic_vm.dart';
import 'package:a/viewModels/organization_vm.dart';
import 'package:a/models/clinic_model.dart';
import 'package:a/models/organization_model.dart';

class AddClinicScreen extends StatefulWidget {
  final String? organizationId;
  final String? organizationName;

  const AddClinicScreen({
    super.key,
    this.organizationId,
    this.organizationName,
  });

  @override
  State<AddClinicScreen> createState() => _AddClinicScreenState();
}

class _AddClinicScreenState extends State<AddClinicScreen> {
  final _formKey = GlobalKey<FormState>();

  // Clinic form controllers
  final TextEditingController _clinicCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _licenseNumberController =
      TextEditingController();

  // Admin form controllers
  final TextEditingController _adminFirstNameController =
      TextEditingController();
  final TextEditingController _adminLastNameController =
      TextEditingController();
  final TextEditingController _adminEmailController = TextEditingController();
  final TextEditingController _adminUsernameController =
      TextEditingController();
  final TextEditingController _adminPhoneController = TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  String? _selectedOrganizationId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedOrganizationId = widget.organizationId;

    // Load organizations when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final orgVM = Provider.of<OrganizationViewModel>(context, listen: false);
      orgVM.fetchOrganizations(context);
    });
  }

  @override
  void dispose() {
    _clinicCodeController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _licenseNumberController.dispose();
    _adminFirstNameController.dispose();
    _adminLastNameController.dispose();
    _adminEmailController.dispose();
    _adminUsernameController.dispose();
    _adminPhoneController.dispose();
    _adminPasswordController.dispose();
    super.dispose();
  }

  // Validation methods
  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Phone is optional
    }
    if (value.trim().length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedOrganizationId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an organization'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

      final clinic = CreateClinicModel(
        organizationId: _selectedOrganizationId!,
        clinicCode: _clinicCodeController.text.trim(),
        name: _nameController.text.trim(),
        email: _emailController.text.trim().isEmpty
            ? null
            : _emailController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        address: _addressController.text.trim().isEmpty
            ? null
            : _addressController.text.trim(),
        licenseNumber: _licenseNumberController.text.trim().isEmpty
            ? null
            : _licenseNumberController.text.trim(),
        adminFirstName: _adminFirstNameController.text.trim(),
        adminLastName: _adminLastNameController.text.trim(),
        adminEmail: _adminEmailController.text.trim(),
        adminUsername: _adminUsernameController.text.trim(),
        adminPhone: _adminPhoneController.text.trim().isEmpty
            ? null
            : _adminPhoneController.text.trim(),
        adminPassword: _adminPasswordController.text.trim(),
      );

      final success = await clinicVM.addClinic(clinic, context);

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Clinic created successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(clinicVM.error ?? 'Failed to create clinic'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Add New Clinic'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
      body: Consumer<OrganizationViewModel>(
        builder: (context, orgVM, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Organization Selection
                  _buildSectionHeader('Organization'),
                  _buildOrganizationDropdown(orgVM.organizations, isMobile),
                  const SizedBox(height: 24),

                  // Clinic Information
                  _buildSectionHeader('Clinic Information'),
                  _buildTextField(
                    controller: _clinicCodeController,
                    label: 'Clinic Code',
                    validator: (value) =>
                        _validateRequired(value, 'Clinic code'),
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _nameController,
                    label: 'Clinic Name',
                    validator: (value) =>
                        _validateRequired(value, 'Clinic name'),
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    validator: _validateEmail,
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Phone',
                    validator: _validatePhone,
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _addressController,
                    label: 'Address',
                    maxLines: 3,
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _licenseNumberController,
                    label: 'License Number',
                    isMobile: isMobile,
                  ),
                  const SizedBox(height: 24),

                  // Admin Information
                  _buildSectionHeader('Admin Information'),
                  _buildTextField(
                    controller: _adminFirstNameController,
                    label: 'Admin First Name',
                    validator: (value) =>
                        _validateRequired(value, 'Admin first name'),
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _adminLastNameController,
                    label: 'Admin Last Name',
                    validator: (value) =>
                        _validateRequired(value, 'Admin last name'),
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _adminEmailController,
                    label: 'Admin Email',
                    validator: _validateEmail,
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _adminUsernameController,
                    label: 'Admin Username',
                    validator: (value) =>
                        _validateRequired(value, 'Admin username'),
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _adminPhoneController,
                    label: 'Admin Phone',
                    validator: _validatePhone,
                    isMobile: isMobile,
                  ),
                  _buildTextField(
                    controller: _adminPasswordController,
                    label: 'Admin Password',
                    validator: _validatePassword,
                    isPassword: true,
                    isMobile: isMobile,
                  ),
                  const SizedBox(height: 32),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text('Creating Clinic...'),
                              ],
                            )
                          : const Text(
                              'Create Clinic',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A1A1A),
        ),
      ),
    );
  }

  Widget _buildOrganizationDropdown(
    List<OrganizationModel> organizations,
    bool isMobile,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedOrganizationId,
        decoration: InputDecoration(
          labelText: 'Select Organization',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isMobile ? 12 : 16,
          ),
        ),
        items: organizations.map((org) {
          return DropdownMenuItem<String>(value: org.id, child: Text(org.name));
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedOrganizationId = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an organization';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    int maxLines = 1,
    bool isPassword = false,
    required bool isMobile,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF3B82F6)),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isMobile ? 12 : 16,
          ),
        ),
      ),
    );
  }
}
