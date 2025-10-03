// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:a/viewModels/clinic_vm.dart';
// import 'package:a/viewModels/organization_vm.dart';
// import 'package:a/models/clinic_model.dart';
// import 'package:a/models/organization_model.dart';

// class AddClinicScreen extends StatefulWidget {
//   final String? organizationId;
//   final String? organizationName;

//   const AddClinicScreen({
//     super.key,
//     this.organizationId,
//     this.organizationName,
//   });

//   @override
//   State<AddClinicScreen> createState() => _AddClinicScreenState();
// }

// class _AddClinicScreenState extends State<AddClinicScreen>
//     with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _clinicCodeController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _licenseNumberController =
//       TextEditingController();

//   // Admin form controllers
//   final TextEditingController _adminFirstNameController =
//       TextEditingController();
//   final TextEditingController _adminLastNameController =
//       TextEditingController();
//   final TextEditingController _adminEmailController = TextEditingController();
//   final TextEditingController _adminUsernameController =
//       TextEditingController();
//   final TextEditingController _adminPhoneController = TextEditingController();
//   final TextEditingController _adminPasswordController =
//       TextEditingController();

//   String? _selectedOrganizationId;
//   bool _isLoading = false;
//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _selectedOrganizationId = widget.organizationId;
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
//           CurvedAnimation(
//             parent: _animationController,
//             curve: Curves.easeInOut,
//           ),
//         );
//     _animationController.forward();

//     // Load organizations when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final orgVM = Provider.of<OrganizationViewModel>(context, listen: false);
//       orgVM.fetchOrganizations(context);
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _clinicCodeController.dispose();
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _licenseNumberController.dispose();
//     _adminFirstNameController.dispose();
//     _adminLastNameController.dispose();
//     _adminEmailController.dispose();
//     _adminUsernameController.dispose();
//     _adminPhoneController.dispose();
//     _adminPasswordController.dispose();
//     super.dispose();
//   }

//   void _closePanel() async {
//     await _animationController.reverse();
//     if (mounted) {
//       Navigator.of(context).pop();
//     }
//   }

//   String? _validateOrganization(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select an organization';
//     }
//     return null;
//   }

//   String? _validateClinicCode(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Clinic code is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Clinic code must be at least 2 characters';
//     }
//     if (value.trim().length > 20) {
//       return 'Clinic code must not exceed 20 characters';
//     }
//     return null;
//   }

//   String? _validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Clinic name is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Name must be at least 2 characters';
//     }
//     if (value.trim().length > 255) {
//       return 'Name must not exceed 255 characters';
//     }
//     return null;
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return null;
//     }
//     final emailRegex = RegExp(
//       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//     );
//     if (!emailRegex.hasMatch(value.trim())) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   String? _validatePhone(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return null;
//     }
//     if (value.trim().length != 10) {
//       return 'Phone number must be exactly 10 digits';
//     }
//     if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
//       return 'Phone number must contain only digits';
//     }
//     return null;
//   }

//   String? _validateAddress(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return null;
//     }
//     if (value.trim().length > 500) {
//       return 'Address must not exceed 500 characters';
//     }
//     return null;
//   }

//   String? _validateLicenseNumber(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return null;
//     }
//     if (value.trim().length > 100) {
//       return 'License number must not exceed 100 characters';
//     }
//     return null;
//   }

//   String? _validateAdminFirstName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Admin first name is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Admin first name must be at least 2 characters';
//     }
//     if (value.trim().length > 50) {
//       return 'Admin first name must not exceed 50 characters';
//     }
//     return null;
//   }

//   String? _validateAdminLastName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Admin last name is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Admin last name must be at least 2 characters';
//     }
//     if (value.trim().length > 50) {
//       return 'Admin last name must not exceed 50 characters';
//     }
//     return null;
//   }

//   String? _validateAdminEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Admin email is required';
//     }
//     final emailRegex = RegExp(
//       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//     );
//     if (!emailRegex.hasMatch(value.trim())) {
//       return 'Please enter a valid admin email address';
//     }
//     return null;
//   }

//   String? _validateAdminUsername(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Admin username is required';
//     }
//     if (value.trim().length < 3) {
//       return 'Admin username must be at least 3 characters';
//     }
//     if (value.trim().length > 30) {
//       return 'Admin username must not exceed 30 characters';
//     }
//     return null;
//   }

//   String? _validateAdminPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Admin password is required';
//     }
//     if (value.length < 6) {
//       return 'Admin password must be at least 6 characters';
//     }
//     return null;
//   }

//   String? _validateAdminPhone(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return null; // Admin phone is optional
//     }
//     if (value.trim().length != 10) {
//       return 'Admin phone number must be exactly 10 digits';
//     }
//     if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
//       return 'Admin phone number must contain only digits';
//     }
//     return null;
//   }

//   Future<void> _handleSubmit() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     if (_selectedOrganizationId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please select an organization'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

//       final clinic = ClinicModel(
//         organizationId: _selectedOrganizationId!,
//         clinicCode: _clinicCodeController.text.trim(),
//         name: _nameController.text.trim(),
//         email: _emailController.text.trim().isEmpty
//             ? null
//             : _emailController.text.trim(),
//         phone: _phoneController.text.trim().isEmpty
//             ? null
//             : _phoneController.text.trim(),
//         address: _addressController.text.trim().isEmpty
//             ? null
//             : _addressController.text.trim(),
//         licenseNumber: _licenseNumberController.text.trim().isEmpty
//             ? null
//             : _licenseNumberController.text.trim(),
//         adminFirstName: _adminFirstNameController.text.trim(),
//         adminLastName: _adminLastNameController.text.trim(),
//         adminEmail: _adminEmailController.text.trim(),
//         adminUsername: _adminUsernameController.text.trim(),
//         adminPhone: _adminPhoneController.text.trim().isEmpty
//             ? null
//             : _adminPhoneController.text.trim(),
//         adminPassword: _adminPasswordController.text.trim(),
//       );

//       final success = await clinicVM.addClinic(clinic, context);

//       if (mounted) {
//         if (success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Clinic created successfully!'),
//               backgroundColor: Colors.green,
//             ),
//           );
//           Navigator.of(context).pop();
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(clinicVM.error ?? 'Failed to create clinic'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 480;
//     final isTablet = screenWidth >= 480 && screenWidth < 1024;

//     // Calculate panel width based on screen size
//     double panelWidth;
//     if (isMobile) {
//       panelWidth = screenWidth * 0.85;
//     } else if (isTablet) {
//       panelWidth = 450;
//     } else {
//       panelWidth = 500;
//     }

//     return Material(
//       color: Colors.black.withOpacity(0.5),
//       child: GestureDetector(
//         onTap: _closePanel,
//         child: Stack(
//           children: [
//             // Main content area (dismisses on tap)
//             Container(color: Colors.transparent),
//             // Right side panel
//             Align(
//               alignment: Alignment.centerRight,
//               child: SlideTransition(
//                 position: _slideAnimation,
//                 child: GestureDetector(
//                   onTap: () {}, // Prevent closing when tapping inside panel
//                   child: Container(
//                     width: panelWidth,
//                     height: double.infinity,
//                     constraints: BoxConstraints(
//                       maxWidth: panelWidth,
//                       minWidth: isMobile ? screenWidth * 0.85 : 450,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 20,
//                           offset: const Offset(-2, 0),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         // Header with close button
//                         Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Color(0xFFE0E0E0),
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color(0xFFFF9800),
//                                       Color(0xFFFFB74D),
//                                     ],
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: const Icon(
//                                   Icons.local_hospital,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               const Expanded(
//                                 child: Text(
//                                   'Add Clinic',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF333333),
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: _closePanel,
//                                 icon: const Icon(Icons.close),
//                                 color: const Color(0xFF666666),
//                                 iconSize: 24,
//                                 padding: EdgeInsets.zero,
//                                 constraints: const BoxConstraints(),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Scrollable content
//                         Expanded(
//                           child: SingleChildScrollView(
//                             padding: const EdgeInsets.all(20),
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // Organization Selection or Display
//                                   if (widget.organizationId == null)
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                               'Select Organization',
//                                               style: TextStyle(
//                                                 fontSize: isMobile ? 13 : 14,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: const Color(0xFF333333),
//                                               ),
//                                             ),
//                                             const SizedBox(width: 4),
//                                             const Text(
//                                               '*',
//                                               style: TextStyle(
//                                                 color: Color(0xFFDC2626),
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 8),
//                                         DropdownButtonFormField<String>(
//                                           value: _selectedOrganizationId,
//                                           validator: _validateOrganization,
//                                           decoration: InputDecoration(
//                                             hintText: 'Choose an organization',
//                                             hintStyle: TextStyle(
//                                               color: const Color(0xFFB3B3B3),
//                                               fontSize: isMobile ? 13 : 14,
//                                             ),
//                                             prefixIcon: const Icon(
//                                               Icons.business_outlined,
//                                               size: 20,
//                                               color: Color(0xFF666666),
//                                             ),
//                                             contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                   horizontal: 16,
//                                                   vertical: 14,
//                                                 ),
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               borderSide: const BorderSide(
//                                                 color: Color(0xFFE0E0E0),
//                                               ),
//                                             ),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               borderSide: const BorderSide(
//                                                 color: Color(0xFFE0E0E0),
//                                               ),
//                                             ),
//                                             focusedBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               borderSide: const BorderSide(
//                                                 color: Color(0xFFFF9800),
//                                                 width: 1.5,
//                                               ),
//                                             ),
//                                             errorBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               borderSide: const BorderSide(
//                                                 color: Color(0xFFDC2626),
//                                               ),
//                                             ),
//                                             focusedErrorBorder:
//                                                 OutlineInputBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   borderSide: const BorderSide(
//                                                     color: Color(0xFFDC2626),
//                                                     width: 1.5,
//                                                   ),
//                                                 ),
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                             errorStyle: const TextStyle(
//                                               fontSize: 12,
//                                             ),
//                                           ),
//                                           items: _organizations.map((org) {
//                                             return DropdownMenuItem<String>(
//                                               value: org['id'],
//                                               child: Text(org['name']!),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value) {
//                                             setState(() {
//                                               _selectedOrganizationId = value;
//                                             });
//                                           },
//                                         ),
//                                         const SizedBox(height: 20),
//                                       ],
//                                     )
//                                   else
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Organization',
//                                           style: TextStyle(
//                                             fontSize: isMobile ? 13 : 14,
//                                             fontWeight: FontWeight.w600,
//                                             color: const Color(0xFF333333),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 8),
//                                         Container(
//                                           padding: const EdgeInsets.all(16),
//                                           decoration: BoxDecoration(
//                                             color: const Color(0xFFF0F9FF),
//                                             borderRadius: BorderRadius.circular(
//                                               8,
//                                             ),
//                                             border: Border.all(
//                                               color: const Color(0xFF2196F3),
//                                             ),
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.business,
//                                                 color: Color(0xFF2196F3),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(width: 12),
//                                               Expanded(
//                                                 child: Text(
//                                                   widget.organizationName ??
//                                                       'Selected Organization',
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Color(0xFF333333),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(height: 20),
//                                       ],
//                                     ),

//                                   // Clinic Code (Required)
//                                   _buildTextField(
//                                     label: 'Clinic Code',
//                                     hint:
//                                         'Enter unique clinic code (2-20 characters)',
//                                     controller: _clinicCodeController,
//                                     validator: _validateClinicCode,
//                                     required: true,
//                                     icon: Icons.qr_code_outlined,
//                                     isMobile: isMobile,
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // Clinic Name (Required)
//                                   _buildTextField(
//                                     label: 'Clinic Name',
//                                     hint: 'Enter clinic name',
//                                     controller: _nameController,
//                                     validator: _validateName,
//                                     required: true,
//                                     icon: Icons.local_hospital_outlined,
//                                     isMobile: isMobile,
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // Email (Optional)
//                                   _buildTextField(
//                                     label: 'Email Address',
//                                     hint: 'Enter email address',
//                                     controller: _emailController,
//                                     validator: _validateEmail,
//                                     required: false,
//                                     icon: Icons.email_outlined,
//                                     keyboardType: TextInputType.emailAddress,
//                                     isMobile: isMobile,
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // Phone (Optional)
//                                   _buildTextField(
//                                     label: 'Phone Number',
//                                     hint: 'Enter 10-digit phone number',
//                                     controller: _phoneController,
//                                     validator: _validatePhone,
//                                     required: false,
//                                     icon: Icons.phone_outlined,
//                                     keyboardType: TextInputType.phone,
//                                     isMobile: isMobile,
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // Address (Optional)
//                                   _buildTextField(
//                                     label: 'Address',
//                                     hint: 'Enter clinic address',
//                                     controller: _addressController,
//                                     validator: _validateAddress,
//                                     required: false,
//                                     icon: Icons.location_on_outlined,
//                                     maxLines: 3,
//                                     isMobile: isMobile,
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // License Number (Optional)
//                                   _buildTextField(
//                                     label: 'License Number',
//                                     hint: 'Enter license number',
//                                     controller: _licenseNumberController,
//                                     validator: _validateLicenseNumber,
//                                     required: false,
//                                     icon: Icons.card_membership_outlined,
//                                     isMobile: isMobile,
//                                   ),
//                                   const SizedBox(height: 32),

//                                   // Action Buttons
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: OutlinedButton(
//                                           onPressed: _isLoading
//                                               ? null
//                                               : _closePanel,
//                                           style: OutlinedButton.styleFrom(
//                                             padding: EdgeInsets.symmetric(
//                                               vertical: isMobile ? 14 : 16,
//                                             ),
//                                             side: const BorderSide(
//                                               color: Color(0xFFE0E0E0),
//                                             ),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                           ),
//                                           child: const Text(
//                                             'Cancel',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               color: Color(0xFF333333),
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 12),
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: _isLoading
//                                               ? null
//                                               : _handleSubmit,
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: const Color(
//                                               0xFFFF9800,
//                                             ),
//                                             foregroundColor: Colors.white,
//                                             padding: EdgeInsets.symmetric(
//                                               vertical: isMobile ? 14 : 16,
//                                             ),
//                                             elevation: 0,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                           ),
//                                           child: _isLoading
//                                               ? const SizedBox(
//                                                   height: 20,
//                                                   width: 20,
//                                                   child: CircularProgressIndicator(
//                                                     strokeWidth: 2,
//                                                     valueColor:
//                                                         AlwaysStoppedAnimation<
//                                                           Color
//                                                         >(Colors.white),
//                                                   ),
//                                                 )
//                                               : const Text(
//                                                   'Create Clinic',
//                                                   style: TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w600,
//                                                   ),
//                                                 ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required String hint,
//     required TextEditingController controller,
//     required String? Function(String?)? validator,
//     required bool required,
//     required IconData icon,
//     TextInputType? keyboardType,
//     int maxLines = 1,
//     required bool isMobile,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: isMobile ? 13 : 14,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF333333),
//               ),
//             ),
//             if (required) ...[
//               const SizedBox(width: 4),
//               const Text(
//                 '*',
//                 style: TextStyle(
//                   color: Color(0xFFDC2626),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ],
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           validator: validator,
//           keyboardType: keyboardType,
//           maxLines: maxLines,
//           style: const TextStyle(fontSize: 14),
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: TextStyle(
//               color: const Color(0xFFB3B3B3),
//               fontSize: isMobile ? 13 : 14,
//             ),
//             prefixIcon: Icon(icon, size: 20, color: const Color(0xFF666666)),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: maxLines > 1 ? 16 : 14,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: Color(0xFFFF9800),
//                 width: 1.5,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Color(0xFFDC2626)),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: Color(0xFFDC2626),
//                 width: 1.5,
//               ),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//             errorStyle: const TextStyle(fontSize: 12),
//           ),
//         ),
//       ],
//     );
//   }
// }
