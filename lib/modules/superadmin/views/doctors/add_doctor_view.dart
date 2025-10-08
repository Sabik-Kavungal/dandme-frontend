import 'package:a/modules/doctor/models/doctor_model.dart';
import 'package:a/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController doctorCodeController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController consultationFeeController =
      TextEditingController();
  final TextEditingController followUpFeeController = TextEditingController();
  final TextEditingController followUpDaysController = TextEditingController();

  // Mode selection
  bool isExistingUser = false;
  final TextEditingController userIdController = TextEditingController();

  // Loading state
  bool _isLoading = false;

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
    doctorCodeController.dispose();
    specializationController.dispose();
    licenseController.dispose();
    consultationFeeController.dispose();
    followUpFeeController.dispose();
    followUpDaysController.dispose();
    userIdController.dispose();
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

  void _saveDoctor(BuildContext context) async {
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

      // Create DoctorModel based on mode
      DoctorModel doctor;

      if (isExistingUser) {
        doctor = DoctorModel(
          userId: userIdController.text.trim(),
          doctorCode: doctorCodeController.text.trim(),
          specialization: specializationController.text.trim().isEmpty
              ? null
              : specializationController.text.trim(),
          licenseNumber: licenseController.text.trim().isEmpty
              ? null
              : licenseController.text.trim(),
          consultationFee: consultationFeeController.text.trim().isEmpty
              ? null
              : double.tryParse(consultationFeeController.text.trim()),
          followUpFee: followUpFeeController.text.trim().isEmpty
              ? null
              : double.tryParse(followUpFeeController.text.trim()),
          followUpDays: followUpDaysController.text.trim().isEmpty
              ? null
              : int.tryParse(followUpDaysController.text.trim()),
        );
      } else {
        doctor = DoctorModel(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          username: usernameController.text.trim(),
          phone: phoneController.text.trim().isEmpty
              ? null
              : phoneController.text.trim(),
          password: passwordController.text.isNotEmpty
              ? passwordController.text
              : null,
          doctorCode: doctorCodeController.text.trim(),
          specialization: specializationController.text.trim().isEmpty
              ? null
              : specializationController.text.trim(),
          licenseNumber: licenseController.text.trim().isEmpty
              ? null
              : licenseController.text.trim(),
          consultationFee: consultationFeeController.text.trim().isEmpty
              ? null
              : double.tryParse(consultationFeeController.text.trim()),
          followUpFee: followUpFeeController.text.trim().isEmpty
              ? null
              : double.tryParse(followUpFeeController.text.trim()),
          followUpDays: followUpDaysController.text.trim().isEmpty
              ? null
              : int.tryParse(followUpDaysController.text.trim()),
        );
      }

      final success = await doctorViewModel.addDoctor(doctor, context);

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.editDoctor == null
                    ? 'Doctor added successfully!'
                    : 'Doctor updated successfully!',
              ),
              backgroundColor: const Color(0xFF10B981),
            ),
          );
          _closePanel();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error: ${doctorViewModel.error ?? 'Failed to save doctor'}',
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
            content: Text('Error: $e'),
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
                                  // Mode Selection
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFAF5FF),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFFE9D5FF),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'User Type',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF333333),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isExistingUser = false;
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    12,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: !isExistingUser
                                                        ? const Color(
                                                            0xFF9333EA,
                                                          )
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                    border: Border.all(
                                                      color: !isExistingUser
                                                          ? const Color(
                                                              0xFF9333EA,
                                                            )
                                                          : const Color(
                                                              0xFFE9D5FF,
                                                            ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.person_add,
                                                        size: 16,
                                                        color: !isExistingUser
                                                            ? Colors.white
                                                            : const Color(
                                                                0xFF9333EA,
                                                              ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        'New User',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: !isExistingUser
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xFF9333EA,
                                                                ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isExistingUser = true;
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    12,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: isExistingUser
                                                        ? const Color(
                                                            0xFF9333EA,
                                                          )
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                    border: Border.all(
                                                      color: isExistingUser
                                                          ? const Color(
                                                              0xFF9333EA,
                                                            )
                                                          : const Color(
                                                              0xFFE9D5FF,
                                                            ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.link,
                                                        size: 16,
                                                        color: isExistingUser
                                                            ? Colors.white
                                                            : const Color(
                                                                0xFF9333EA,
                                                              ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        'Existing User',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: isExistingUser
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xFF9333EA,
                                                                ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Conditional User Fields
                                  if (isExistingUser) ...[
                                    // User ID
                                    _buildTextField(
                                      label: 'User ID',
                                      hint: 'Enter existing user ID',
                                      controller: userIdController,
                                      validator: (value) =>
                                          _validateRequired(value, 'User ID'),
                                      required: true,
                                      icon: Icons.badge_outlined,
                                      isMobile: isMobile,
                                    ),
                                    const SizedBox(height: 20),
                                  ] else ...[
                                    // First Name
                                    _buildTextField(
                                      label: 'First Name',
                                      hint: 'Enter first name',
                                      controller: firstNameController,
                                      validator: (value) => _validateRequired(
                                        value,
                                        'First name',
                                      ),
                                      required: true,
                                      icon: Icons.person_outlined,
                                      isMobile: isMobile,
                                    ),
                                    const SizedBox(height: 20),

                                    // Last Name
                                    _buildTextField(
                                      label: 'Last Name',
                                      hint: 'Enter last name',
                                      controller: lastNameController,
                                      validator: (value) =>
                                          _validateRequired(value, 'Last name'),
                                      required: true,
                                      icon: Icons.person_outlined,
                                      isMobile: isMobile,
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
                                      hint: 'Enter password',
                                      controller: passwordController,
                                      validator: (value) =>
                                          _validateRequired(value, 'Password'),
                                      required: true,
                                      icon: Icons.lock_outlined,
                                      isPassword: true,
                                      isMobile: isMobile,
                                    ),
                                    const SizedBox(height: 24),
                                  ],

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

                                  // Doctor Code
                                  _buildTextField(
                                    label: 'Doctor Code',
                                    hint: 'Enter doctor code',
                                    controller: doctorCodeController,
                                    validator: (value) =>
                                        _validateRequired(value, 'Doctor code'),
                                    required: true,
                                    icon: Icons.qr_code_outlined,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

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

                                  // Consultation Fee
                                  _buildTextField(
                                    label: 'Consultation Fee',
                                    hint: 'Enter consultation fee',
                                    controller: consultationFeeController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.attach_money,
                                    keyboardType: TextInputType.number,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Follow-up Fee
                                  _buildTextField(
                                    label: 'Follow-up Fee',
                                    hint: 'Enter follow-up fee',
                                    controller: followUpFeeController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.attach_money,
                                    keyboardType: TextInputType.number,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Follow-up Days
                                  _buildTextField(
                                    label: 'Follow-up Days',
                                    hint: 'Enter follow-up days',
                                    controller: followUpDaysController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.calendar_today_outlined,
                                    keyboardType: TextInputType.number,
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
                                              : () => _saveDoctor(context),
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
