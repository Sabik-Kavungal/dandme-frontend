import 'package:drandme/modules/organization/models/organization_model.dart';
import 'package:drandme/modules/organization/viewmodels/organization_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddOrganizationScreen extends StatefulWidget {
  const AddOrganizationScreen({super.key});

  @override
  State<AddOrganizationScreen> createState() => _AddOrganizationScreenState();
}

class _AddOrganizationScreenState extends State<AddOrganizationScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _licenseNumberController =
      TextEditingController();

  // Admin fields
  final TextEditingController _adminEmailController = TextEditingController();
  final TextEditingController _adminUsernameController =
      TextEditingController();
  final TextEditingController _adminPhoneController = TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  bool _isLoading = false;
  bool _obscureAdminPassword = true;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _licenseNumberController.dispose();
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

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Organization name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (value.trim().length > 255) {
      return 'Name must not exceed 255 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Optional field
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
      return null; // Optional field
    }
    if (value.trim().length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Optional field
    }
    if (value.trim().length > 500) {
      return 'Address must not exceed 500 characters';
    }
    return null;
  }

  String? _validateLicenseNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Optional field
    }
    if (value.trim().length > 100) {
      return 'License number must not exceed 100 characters';
    }
    return null;
  }

  // Admin field validators

  String? _validateAdminEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Admin email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateAdminUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Admin username is required';
    }
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? _validateAdminPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Optional field
    }
    if (value.trim().length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  String? _validateAdminPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Admin password is required';
    }
    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final orgVM = Provider.of<OrganizationViewModel>(context, listen: false);

      final organization = OrganizationModel(
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
        adminFirstName: '',
        adminLastName: '',
        adminEmail: _adminEmailController.text.trim(),
        adminUsername: _adminUsernameController.text.trim(),
        adminPhone: _adminPhoneController.text.trim().isEmpty
            ? null
            : _adminPhoneController.text.trim(),
        adminPassword: _adminPasswordController.text.trim(),
      );

      final success = await orgVM.addOrganization(organization, context);

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Organization "${_nameController.text}" created successfully!',
              ),
              backgroundColor: const Color(0xFF4CAF50),
            ),
          );
          _closePanel();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to create organization: ${orgVM.error ?? "Unknown error"}',
              ),
              backgroundColor: const Color(0xFFDC2626),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating organization: $e'),
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
      color: Colors.black.withOpacity(0.5),
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
                          color: Colors.black.withOpacity(0.2),
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
                                      Color(0xFF4CAF50),
                                      Color(0xFF66BB6A),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.business,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Add Organization',
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
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Organization Name (Required)
                                  _buildTextField(
                                    label: 'Organization Name',
                                    hint: 'Enter organization name',
                                    controller: _nameController,
                                    validator: _validateName,
                                    required: true,
                                    icon: Icons.business_outlined,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Email (Optional)
                                  _buildTextField(
                                    label: 'Email Address',
                                    hint: 'Enter email address',
                                    controller: _emailController,
                                    validator: _validateEmail,
                                    required: false,
                                    icon: Icons.email_outlined,
                                    keyboardType: TextInputType.emailAddress,
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
                                    hint: 'Enter organization address',
                                    controller: _addressController,
                                    validator: _validateAddress,
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
                                    validator: _validateLicenseNumber,
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
                                            ).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
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

                                  // Admin Email (Required)
                                  _buildTextField(
                                    label: 'Admin Email',
                                    hint: 'Enter admin email address',
                                    controller: _adminEmailController,
                                    validator: _validateAdminEmail,
                                    required: true,
                                    icon: Icons.email_outlined,
                                    keyboardType: TextInputType.emailAddress,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Admin Username (Required)
                                  _buildTextField(
                                    label: 'Admin Username',
                                    hint: 'Enter admin username',
                                    controller: _adminUsernameController,
                                    validator: _validateAdminUsername,
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
                                    validator: _validateAdminPhone,
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
                                    validator: _validateAdminPassword,
                                    required: true,
                                    icon: Icons.lock_outlined,
                                    isPassword: true,
                                    obscureText: _obscureAdminPassword,
                                    onToggleVisibility: () {
                                      setState(() {
                                        _obscureAdminPassword =
                                            !_obscureAdminPassword;
                                      });
                                    },
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
                                              0xFF4CAF50,
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
                                                  'Create Organization',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
    bool? obscureText,
    VoidCallback? onToggleVisibility,
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
          obscureText: obscureText ?? isPassword,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFFB3B3B3),
              fontSize: isMobile ? 13 : 14,
            ),
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF666666)),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                      color: const Color(0xFF666666),
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
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
                color: Color(0xFF4CAF50),
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
