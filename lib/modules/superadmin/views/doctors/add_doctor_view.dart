import 'package:drandme/modules/doctor/models/doctor_model.dart';
import 'package:drandme/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' as io;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddDoctorScreen extends StatefulWidget {
  final DoctorModel? editDoctor;
  const AddDoctorScreen({super.key, this.editDoctor});

  @override
  State<AddDoctorScreen> createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  // Base fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Doctor fields
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController consultationFeeController =
      TextEditingController();
  final TextEditingController followUpFeeController = TextEditingController();
  final TextEditingController followUpDaysController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController experienceYearsController =
      TextEditingController();
  final TextEditingController bioController = TextEditingController();

  // Loading state
  bool _isLoading = false;
  bool _obscurePassword = true;

  XFile? _profileImageFile;
  final ImagePicker _picker = ImagePicker();

  // Animation
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

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

    if (widget.editDoctor != null) {
      _populateFields();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    specializationController.dispose();
    licenseController.dispose();
    consultationFeeController.dispose();
    followUpFeeController.dispose();
    followUpDaysController.dispose();
    qualificationController.dispose();
    experienceYearsController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void _closePanel() async {
    await _animationController.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  void _populateFields() {
    final doctor = widget.editDoctor!;
    firstNameController.text = doctor.firstName ?? '';
    lastNameController.text = doctor.lastName ?? '';
    emailController.text = doctor.email ?? '';
    usernameController.text = doctor.username ?? '';
    phoneController.text = doctor.phone ?? '';
    specializationController.text = doctor.specialization ?? '';
    licenseController.text = doctor.licenseNumber ?? '';
    consultationFeeController.text = doctor.consultationFee?.toString() ?? '';
    followUpFeeController.text = doctor.followUpFee?.toString() ?? '';
    followUpDaysController.text = doctor.followUpDays?.toString() ?? '';
    qualificationController.text = doctor.qualification ?? '';
    experienceYearsController.text = doctor.experienceYears?.toString() ?? '';
    bioController.text = doctor.bio ?? '';
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
      return null; // Optional
    }
    if (value.trim().length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImageFile = image;
      });
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final doctorViewModel = Provider.of<DoctorViewModel>(
        context,
        listen: false,
      );

      final doctor = DoctorModel(
        // User fields
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        username: usernameController.text.trim(),
        password: passwordController.text.isNotEmpty
            ? passwordController.text.trim()
            : null,
        phone: phoneController.text.trim().isEmpty
            ? null
            : phoneController.text.trim(),

        // Link existing user if not creating new
        userId: widget.editDoctor?.userId,

        // Doctor fields
        specialization: specializationController.text.trim(),
        licenseNumber: licenseController.text.trim(),
        consultationFee:
            double.tryParse(consultationFeeController.text.trim()) ?? 0.0,
        followUpFee: followUpFeeController.text.trim().isEmpty
            ? null
            : double.tryParse(followUpFeeController.text.trim()),
        followUpDays: followUpDaysController.text.trim().isEmpty
            ? null
            : int.tryParse(followUpDaysController.text.trim()),
        qualification: qualificationController.text.trim(),
        experienceYears:
            int.tryParse(experienceYearsController.text.trim()) ?? 0,
        bio: bioController.text.trim(),
      );

      bool isSuccess = false;
      String? message;

      if (widget.editDoctor != null) {
        // Update existing doctor
        isSuccess = await doctorViewModel.updateDoctor(
          widget.editDoctor!.drid!,
          doctor,
          _profileImageFile,
        );
        message = isSuccess ? 'Doctor profile updated successfully!' : null;
      } else {
        // Add new doctor
        final result = await doctorViewModel.addDoctor(
          doctor,
          _profileImageFile,
        );
        isSuccess = result != null;
        message = isSuccess
            ? 'Doctor "${firstNameController.text} ${lastNameController.text}" added successfully! Your unique doctor ID is: $result'
            : null;
      }

      if (mounted) {
        if (isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message ?? 'Success'),
              backgroundColor: const Color(0xFF10B981),
            ),
          );
          _closePanel();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(doctorViewModel.error ?? 'Operation failed'),
              backgroundColor: const Color(0xFFDC2626),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding doctor: $e'),
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
                                      Color(0xFF9333EA),
                                      Color(0xFFA855F7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.medical_services,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  widget.editDoctor == null
                                      ? 'Add Doctor'
                                      : 'Edit Doctor',
                                  style: const TextStyle(
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
                                  // Profile Image Picker
                                  Center(
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF3F4F6),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFFE5E7EB),
                                              width: 2,
                                            ),
                                            image: _profileImageFile != null
                                                ? DecorationImage(
                                                    image: kIsWeb
                                                        ? NetworkImage(
                                                            _profileImageFile!
                                                                .path,
                                                          )
                                                        : FileImage(
                                                                io.File(
                                                                  _profileImageFile!
                                                                      .path,
                                                                ),
                                                              )
                                                              as ImageProvider,
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ),
                                          child: _profileImageFile == null
                                              ? const Icon(
                                                  Icons.person,
                                                  size: 50,
                                                  color: Color(0xFF9CA3AF),
                                                )
                                              : null,
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: InkWell(
                                            onTap: _pickImage,
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF9333EA),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.camera_alt,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Profile Fields
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildTextField(
                                          label: 'First Name',
                                          hint: 'First name',
                                          controller: firstNameController,
                                          validator: (value) =>
                                              _validateRequired(
                                                value,
                                                'First name',
                                              ),
                                          required: true,
                                          icon: Icons.person_outline,
                                          isMobile: isMobile,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _buildTextField(
                                          label: 'Last Name',
                                          hint: 'Last name',
                                          controller: lastNameController,
                                          validator: (value) =>
                                              _validateRequired(
                                                value,
                                                'Last name',
                                              ),
                                          required: true,
                                          icon: Icons.person_outline,
                                          isMobile: isMobile,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  // Email
                                  _buildTextField(
                                    label: 'Email Address',
                                    hint: 'Enter email address',
                                    controller: emailController,
                                    validator: _validateEmail,
                                    required: true,
                                    icon: Icons.email_outlined,
                                    keyboardType: TextInputType.emailAddress,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Username
                                  _buildTextField(
                                    label: 'Username',
                                    hint: 'Enter username',
                                    controller: usernameController,
                                    validator: (value) =>
                                        _validateRequired(value, 'Username'),
                                    required: true,
                                    icon: Icons.account_circle_outlined,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Phone
                                  _buildTextField(
                                    label: 'Phone Number',
                                    hint: 'Enter 10-digit phone number',
                                    controller: phoneController,
                                    validator: _validatePhone,
                                    required: false,
                                    icon: Icons.phone_outlined,
                                    keyboardType: TextInputType.phone,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Password
                                  _buildTextField(
                                    label: 'Password',
                                    hint: widget.editDoctor != null
                                        ? 'Enter new password (optional)'
                                        : 'Enter password',
                                    controller: passwordController,
                                    validator: widget.editDoctor == null
                                        ? (value) => _validateRequired(
                                            value,
                                            'Password',
                                          )
                                        : null,
                                    required: widget.editDoctor == null,
                                    icon: Icons.lock_outlined,
                                    isPassword: true,
                                    obscureText: _obscurePassword,
                                    onToggleVisibility: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 24),

                                  // Doctor Information Section Header
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
                                              0xFF9333EA,
                                            ).withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.medical_information,
                                            color: Color(0xFF9333EA),
                                            size: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Doctor Information',
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

                                  // Specialization
                                  _buildTextField(
                                    label: 'Specialization',
                                    hint: 'Enter specialization',
                                    controller: specializationController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.school_outlined,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // License Number
                                  _buildTextField(
                                    label: 'License Number',
                                    hint: 'Enter license number',
                                    controller: licenseController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.card_membership_outlined,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Qualification
                                  _buildTextField(
                                    label: 'Qualification',
                                    hint: 'e.g. MBBS, MD (Pediatrics)',
                                    controller: qualificationController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.history_edu_outlined,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Experience Years
                                  _buildTextField(
                                    label: 'Experience (Years)',
                                    hint: 'e.g. 12',
                                    controller: experienceYearsController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.work_history_outlined,
                                    keyboardType: TextInputType.number,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Bio
                                  _buildTextField(
                                    label: 'Biography',
                                    hint: 'Enter professional bio',
                                    controller: bioController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.text_snippet_outlined,
                                    maxLines: 4,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 16),

                                  // Information note about fees
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEEF2FF),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFFC7D2FE),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.info_outline,
                                          color: Color(0xFF6366F1),
                                          size: 20,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            'Consultation fees will be set when linking this doctor to a clinic.',
                                            style: TextStyle(
                                              fontSize: isMobile ? 11 : 12,
                                              color: const Color(0xFF4338CA),
                                              height: 1.3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                              0xFF9333EA,
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
                                              : Text(
                                                  widget.editDoctor == null
                                                      ? 'Add Doctor'
                                                      : 'Update Doctor',
                                                  style: const TextStyle(
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
                color: Color(0xFF9333EA),
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
