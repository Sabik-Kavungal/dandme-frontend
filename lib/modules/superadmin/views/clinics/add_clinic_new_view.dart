import 'package:a/modules/clinic/models/clinic_model.dart';
import 'package:a/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:a/modules/organization/models/organization_model.dart';
import 'package:a/modules/organization/viewmodels/organization_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class _AddClinicScreenState extends State<AddClinicScreen>
    with SingleTickerProviderStateMixin {
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
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _selectedOrganizationId = widget.organizationId;

    // Initialize animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationController.forward();

    // Load organizations when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final orgVM = Provider.of<OrganizationViewModel>(context, listen: false);
      orgVM.fetchOrganizations(context);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
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

  void _closePanel() async {
    await _animationController.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  // Validation methods
  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (value.trim().length < 2) {
      return '$fieldName must be at least 2 characters';
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
          backgroundColor: Color(0xFFDC2626),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final clinicViewModel = Provider.of<ClinicViewModel>(
        context,
        listen: false,
      );

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

      final success = await clinicViewModel.addClinic(clinic, context);

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Clinic "${_nameController.text}" created successfully!',
              ),
              backgroundColor: const Color(0xFF10B981),
            ),
          );
          _closePanel();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(clinicViewModel.error ?? 'Failed to create clinic'),
              backgroundColor: const Color(0xFFDC2626),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating clinic: $e'),
            backgroundColor: const Color(0xFFDC2626),
          ),
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
    final isTablet = screenWidth >= 480 && screenWidth < 1024;

    // Calculate panel width based on screen size
    double panelWidth;
    if (isMobile) {
      panelWidth = screenWidth * 0.85;
    } else if (isTablet) {
      panelWidth = 450;
    } else {
      panelWidth = 500;
    }

    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: _closePanel,
        child: Stack(
          children: [
            // Main content area (dismisses on tap)
            Container(color: Colors.transparent),
            // Right side panel
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: () {}, // Prevent closing when tapping inside panel
                  child: Container(
                    width: panelWidth,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: panelWidth,
                      minWidth: isMobile ? screenWidth * 0.85 : 450,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(-2, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header with close button
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B82F6),
                                      Color(0xFF60A5FA),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.local_hospital,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Add Clinic',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: _closePanel,
                                icon: const Icon(Icons.close),
                                color: const Color(0xFF666666),
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ),
                        // Scrollable content
                        Expanded(
                          child: Consumer<OrganizationViewModel>(
                            builder: (context, orgVM, child) {
                              return SingleChildScrollView(
                                padding: const EdgeInsets.all(20),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Organization Selection
                                      _buildOrganizationDropdown(
                                        orgVM.organizations,
                                        isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Clinic Code (Required)
                                      _buildTextField(
                                        label: 'Clinic Code',
                                        hint: 'Enter clinic code',
                                        controller: _clinicCodeController,
                                        validator: (value) => _validateRequired(
                                          value,
                                          'Clinic code',
                                        ),
                                        required: true,
                                        icon: Icons.qr_code_outlined,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Clinic Name (Required)
                                      _buildTextField(
                                        label: 'Clinic Name',
                                        hint: 'Enter clinic name',
                                        controller: _nameController,
                                        validator: (value) => _validateRequired(
                                          value,
                                          'Clinic name',
                                        ),
                                        required: true,
                                        icon: Icons.local_hospital_outlined,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Email (Required)
                                      _buildTextField(
                                        label: 'Email Address',
                                        hint: 'Enter email address',
                                        controller: _emailController,
                                        validator: _validateEmail,
                                        required: true,
                                        icon: Icons.email_outlined,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Phone (Optional)
                                      _buildTextField(
                                        label: 'Phone Number',
                                        hint: 'Enter 10-digit phone number',
                                        controller: _phoneController,
                                        validator: _validatePhone,
                                        required: false,
                                        icon: Icons.phone_outlined,
                                        keyboardType: TextInputType.phone,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Address (Optional)
                                      _buildTextField(
                                        label: 'Address',
                                        hint: 'Enter clinic address',
                                        controller: _addressController,
                                        validator: null,
                                        required: false,
                                        icon: Icons.location_on_outlined,
                                        maxLines: 3,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // License Number (Optional)
                                      _buildTextField(
                                        label: 'License Number',
                                        hint: 'Enter license number',
                                        controller: _licenseNumberController,
                                        validator: null,
                                        required: false,
                                        icon: Icons.card_membership_outlined,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 32),

                                      // Admin Section Header
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: const Color(
                                                  0xFF3B82F6,
                                                ).withValues(alpha: 0.1),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Icon(
                                                Icons.admin_panel_settings,
                                                color: Color(0xFF3B82F6),
                                                size: 16,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Admin Information',
                                              style: TextStyle(
                                                fontSize: isMobile ? 14 : 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF333333),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      // Admin First Name (Required)
                                      _buildTextField(
                                        label: 'Admin First Name',
                                        hint: 'Enter admin first name',
                                        controller: _adminFirstNameController,
                                        validator: (value) => _validateRequired(
                                          value,
                                          'Admin first name',
                                        ),
                                        required: true,
                                        icon: Icons.person_outlined,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Admin Last Name (Required)
                                      _buildTextField(
                                        label: 'Admin Last Name',
                                        hint: 'Enter admin last name',
                                        controller: _adminLastNameController,
                                        validator: (value) => _validateRequired(
                                          value,
                                          'Admin last name',
                                        ),
                                        required: true,
                                        icon: Icons.person_outlined,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Admin Email (Required)
                                      _buildTextField(
                                        label: 'Admin Email',
                                        hint: 'Enter admin email address',
                                        controller: _adminEmailController,
                                        validator: _validateEmail,
                                        required: true,
                                        icon: Icons.email_outlined,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Admin Username (Required)
                                      _buildTextField(
                                        label: 'Admin Username',
                                        hint: 'Enter admin username',
                                        controller: _adminUsernameController,
                                        validator: (value) => _validateRequired(
                                          value,
                                          'Admin username',
                                        ),
                                        required: true,
                                        icon: Icons.account_circle_outlined,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Admin Phone (Optional)
                                      _buildTextField(
                                        label: 'Admin Phone Number',
                                        hint: 'Enter 10-digit phone number',
                                        controller: _adminPhoneController,
                                        validator: _validatePhone,
                                        required: false,
                                        icon: Icons.phone_outlined,
                                        keyboardType: TextInputType.phone,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 20),

                                      // Admin Password (Required)
                                      _buildTextField(
                                        label: 'Admin Password',
                                        hint: 'Enter admin password',
                                        controller: _adminPasswordController,
                                        validator: _validatePassword,
                                        required: true,
                                        icon: Icons.lock_outlined,
                                        isPassword: true,
                                        isMobile: isMobile,
                                      ),
                                      const SizedBox(height: 32),

                                      // Action Buttons
                                      Row(
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: _isLoading
                                                  ? null
                                                  : _closePanel,
                                              style: OutlinedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: isMobile ? 14 : 16,
                                                ),
                                                side: const BorderSide(
                                                  color: Color(0xFFE0E0E0),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF333333),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: _isLoading
                                                  ? null
                                                  : _handleSubmit,
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF3B82F6,
                                                ),
                                                foregroundColor: Colors.white,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: isMobile ? 14 : 16,
                                                ),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: _isLoading
                                                  ? const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                              Color
                                                            >(Colors.white),
                                                      ),
                                                    )
                                                  : const Text(
                                                      'Create Clinic',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
          ],
        ),
      ),
    );
  }

  Widget _buildOrganizationDropdown(
    List<OrganizationModel> organizations,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Organization',
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              '*',
              style: TextStyle(
                color: Color(0xFFDC2626),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedOrganizationId,
          decoration: InputDecoration(
            hintText: 'Select an organization',
            hintStyle: TextStyle(
              color: const Color(0xFFB3B3B3),
              fontSize: isMobile ? 13 : 14,
            ),
            prefixIcon: const Icon(
              Icons.business,
              size: 20,
              color: Color(0xFF666666),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
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
              borderSide: const BorderSide(
                color: Color(0xFF3B82F6),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFDC2626)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFDC2626),
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(fontSize: 12),
          ),
          items: organizations.map((org) {
            return DropdownMenuItem<String>(
              value: org.id,
              child: Text(org.name, style: const TextStyle(fontSize: 14)),
            );
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
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required bool required,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool isPassword = false,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
            if (required) ...[
              const SizedBox(width: 4),
              const Text(
                '*',
                style: TextStyle(
                  color: Color(0xFFDC2626),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          obscureText: isPassword,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFFB3B3B3),
              fontSize: isMobile ? 13 : 14,
            ),
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF666666)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 14,
            ),
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
              borderSide: const BorderSide(
                color: Color(0xFF3B82F6),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFDC2626)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFDC2626),
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
