import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/config/navigation_helper.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui'; // For blur
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController loginCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _keepMeSignedIn = false;

  // Validation functions
  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email or phone is required';
    }

    final trimmedValue = value.trim();

    // Check if it's an email
    if (trimmedValue.contains('@')) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(trimmedValue)) {
        return 'Please enter a valid email address';
      }
    } else {
      // Check if it's a phone number (basic validation)
      final phoneRegex = RegExp(r'^[+]?[\d\s\-\(\)]{10,}$');
      if (!phoneRegex.hasMatch(trimmedValue)) {
        return 'Please enter a valid phone number';
      }
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

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Terms agreement is implicit by clicking Sign In

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    final success = await authViewModel.login(
      loginCtrl.text.trim(),
      passCtrl.text.trim(),
      context,
    );

    if (!success) {
      // Show error dialog only if login fails
      if (mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("Invalid email/phone or password."),
            actions: [
              TextButton(
                onPressed: () => NavigationHelper.goBack(ctx),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } else {
      // Login was successful - show debug info
      print(
        '✅ Login successful! Authentication state should update automatically.',
      );
      print('Current isAuthenticated: ${authViewModel.isAuthenticated}');
      print('User role: ${authViewModel.userRole}');

      // Force navigation to appropriate dashboard using AuthViewModel method
      if (mounted) {
        final dashboardRoute = authViewModel.getDashboardRoute();
        print('Navigating to dashboard route: $dashboardRoute');

        // Navigate directly to the dashboard route
        context.go(dashboardRoute);
      }
    }
    // Navigation is handled automatically by main.dart based on authentication state
  }

  void _showDisclaimerDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3B30).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFF3B30).withOpacity(0.2),
                      ),
                    ),
                    child: const Icon(
                      Icons.info_outline_rounded,
                      color: Color(0xFFFF3B30),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Disclaimer',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDisclaimerSection(
                        '1. Platform Nature & Scope',
                        'DOCTOR AND ME (“Dr & Me”), operated by DOCTOR AND ME AI TECHNOLOGIES LLP, is a healthcare technology Software-as-a-Service (SaaS) platform. The Platform is designed to enable clinics, hospitals, pharmacies, laboratories, and licensed healthcare professionals to manage appointments, consultations, prescriptions, laboratory reports, billing, insurance, and administrative workflows.\n\nDr & Me does not operate as a medical establishment, hospital, clinic, pharmacy, or laboratory.',
                      ),
                      _buildDisclaimerSection(
                        '2. No Medical Advice or Treatment',
                        'Dr & Me does not provide medical advice, diagnosis, treatment, or clinical services of any kind.\n\nAll medical information, consultations, prescriptions, diagnoses, treatment decisions, and patient care services made available through the Platform are provided solely by independent, licensed healthcare professionals or healthcare organizations using the Platform.\n\nMedical decisions and outcomes remain the sole responsibility of the treating healthcare professional and healthcare establishment.',
                      ),
                      _buildDisclaimerSection(
                        '3. No Doctor–Patient Relationship with the Company',
                        'Use of the Platform does not create a doctor–patient, clinic–patient, or healthcare provider–patient relationship between the user or patient and DOCTOR AND ME AI TECHNOLOGIES LLP.\n\nAny doctor–patient relationship is strictly between the patient and the consulting healthcare professional or healthcare organization.',
                      ),
                      _buildDisclaimerSection(
                        '4. Accuracy of Medical Information',
                        'Dr & Me does not verify, validate, or independently confirm the accuracy, completeness, or correctness of medical data, prescriptions, clinical notes, laboratory results, billing information, or any healthcare content entered or generated by healthcare professionals or clinics on the Platform.\n\nThe Company shall not be responsible for any consequences arising from inaccurate, incomplete, outdated, or incorrect information entered by users of the Platform.',
                      ),
                      _buildDisclaimerSection(
                        '5. Emergency Disclaimer',
                        'The Platform is not intended for medical emergencies.\n\nIf a user or patient is experiencing a medical emergency, they must immediately contact local emergency services or visit the nearest medical facility. Dr & Me shall not be used as a substitute for emergency medical care.',
                      ),
                      _buildDisclaimerSection(
                        '6. Technology & Availability Disclaimer',
                        'The Platform is provided on an “as-is” and “as-available” basis.\n\nWhile reasonable efforts are made to ensure system availability and reliability, Dr & Me does not guarantee uninterrupted access, error-free operation, or continuous availability of the Platform. Service interruptions may occur due to maintenance, technical issues, third-party service failures, force majeure events, or factors beyond the Company’s control.',
                      ),
                      _buildDisclaimerSection(
                        '7. Third-Party Services',
                        'The Platform may integrate with third-party services such as payment gateways, SMS/WhatsApp providers, cloud hosting providers, pharmacies, laboratories, or other service providers.\n\nDr & Me does not control and is not responsible for the availability, accuracy, compliance, or performance of third-party services. Use of such services is subject to the respective third party’s terms and policies.',
                      ),
                      _buildDisclaimerSection(
                        '8. Limitation of Liability',
                        'To the maximum extent permitted by applicable law, DOCTOR AND ME AI TECHNOLOGIES LLP shall not be liable for any direct, indirect, incidental, consequential, or special damages, including but not limited to medical outcomes, loss of data, loss of business, loss of profits, or patient harm arising from:\n\n• Use or inability to use the Platform\n• Clinical decisions made by healthcare professionals\n• Errors or omissions in medical records or prescriptions\n• Unauthorized access or data breaches beyond reasonable control',
                      ),
                      _buildDisclaimerSection(
                        '9. Regulatory & Legal Compliance',
                        'Healthcare organizations, doctors, clinics, hospitals, pharmacies, and laboratories using the Platform are solely responsible for complying with applicable healthcare, medical, insurance, and data protection laws in their respective jurisdictions, including India and GCC countries.\n\nThe Company does not provide legal, medical, or regulatory advice.',
                      ),
                      _buildDisclaimerSection(
                        '10. Acceptance of Disclaimer',
                        'By accessing or using the Dr & Me website, web application, or mobile application, users acknowledge that they have read, understood, and agreed to this Disclaimer, along with the Privacy Policy and Terms & Conditions.',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF3B30).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFFF3B30).withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Information',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'DOCTOR AND ME AI TECHNOLOGIES LLP\nEmail: contactus@doctorandmeonline.com',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Colors.white70,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisclaimerSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFF3B30),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white70,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicyDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3B30).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFF3B30).withOpacity(0.2),
                      ),
                    ),
                    child: const Icon(
                      Icons.privacy_tip_outlined,
                      color: Color(0xFFFF3B30),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Privacy Policy',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDisclaimerSection(
                        'Introduction',
                        'This Privacy Policy explains how DOCTOR AND ME, operated by DOCTOR AND ME AI TECHNOLOGIES LLP ("Company", "we", "our", "us"), collects, uses, stores, processes, and protects information when you access or use our website, web application, mobile application, and related services (collectively, the "Platform").\n\nThe Platform is a global healthcare technology Software-as-a-Service (SaaS) solution designed for clinics, hospitals, pharmacies, laboratories, and healthcare professionals to manage appointments, consultations, prescriptions, pharmacy, laboratory, inpatient, billing, insurance, and administrative workflows.\n\nThis Privacy Policy may be subject to further changes including as may be warranted by change in law. Upon updating the Policy, we may revise the "Updated" date at the bottom of this Policy. We therefore request you to go through our Privacy Policy frequently to be updated with changes incorporated from time to time. Your continued engagement with us will imply your acceptance of such updates to this Policy.\n\nIf you do not agree to the terms of this Privacy Policy, please do not (i) access or use our Platform, (ii) avail of services from us, and do not disclose your information to us.\n\nBy using the Platform, you acknowledge that you have read and understood this Privacy Policy.',
                      ),
                      _buildDisclaimerSection(
                        'Scope & Applicability',
                        'This Privacy Policy applies to:\n• Clinics, hospitals, pharmacies, and laboratories using the Platform\n• Doctors, nurses, pharmacists, lab technicians, receptionists, and administrative staff\n• Patients whose information is processed through the Platform\n• Super Admin and system-level SaaS operations\n\nThis Policy applies globally and follows generally accepted data protection and privacy principles.',
                      ),
                      _buildDisclaimerSection(
                        'Roles & Responsibilities',
                        'Data Controllers: Clinics, hospitals, pharmacies, and laboratories using the Platform act as Data Controllers for patient personal and medical data.\n\nData Processor: DOCTOR AND ME AI TECHNOLOGIES LLP acts as a Data Processor, processing data solely on behalf of the Data Controllers and in accordance with their instructions.',
                      ),
                      _buildDisclaimerSection(
                        'Information We Collect',
                        'Patient Personal Information:\n• Full name, Age or DoB, Gender\n• Mobile number, Email (optional)\n• Appointment, booking, or token number\n\nSensitive Health & Medical Information:\n• Consultation notes and visit history\n• Prescriptions and medication details\n• Laboratory test orders and reports\n• Vital signs (BP, Temp, Pulse, BMI)\n• Allergies, symptoms, and lifestyle indicators\n• Inpatient details and discharge summaries\n\nInsurance Information:\n• Provider name, Policy ID, Validity details\n\nBilling & Payment Information:\n• Consultation, pharmacy, lab, and inpatient billing details\n• Payment mode and transaction reference\n• Important: We do not store card numbers, CVV, or banking credentials.\n\nAccuracy of Information:\nClinics and healthcare providers are solely responsible for ensuring that patient information entered into the Platform is accurate, complete, and compliant with applicable laws.',
                      ),
                      _buildDisclaimerSection(
                        'Technical & Usage Information',
                        '• IP address\n• Device and browser details\n• Login timestamps\n• System activity and audit logs',
                      ),
                      _buildDisclaimerSection(
                        'Purpose of Processing',
                        'We process information for:\n• Appointment scheduling and patient flow\n• Clinical documentation and prescriptions\n• Pharmacy and Inventory management\n• Laboratory processing and reports\n• Inpatient tracking and discharge\n• Billing, invoicing, and insurance workflows\n• System security, auditing, and compliance\n\nWe do not use patient medical data for advertising or marketing.',
                      ),
                      _buildDisclaimerSection(
                        'Access Control & Multi-Tenant Segregation',
                        'The Platform operates as a multi-tenant SaaS system. Each organization is assigned a unique identifier. Data is logically segregated; users from one clinic cannot access data belonging to another. Access is enforced through role-based access control (RBAC).\n\nEmployees of DOCTOR AND ME AI TECHNOLOGIES LLP do not have routine access to patient data. Limited access occurs only for maintenance, support, or legal compliance under strict confidentiality.',
                      ),
                      _buildDisclaimerSection(
                        'Cloud Infrastructure & Data Hosting',
                        'The Platform is hosted entirely on Amazon Web Services (AWS) cloud infrastructure. We do not store Platform data on local or personal servers. AWS provides industry-standard security controls, and we implement additional application-level protections.',
                      ),
                      _buildDisclaimerSection(
                        'Data Retention & Security',
                        'Records are retained according to clinic policy and healthcare regulations. We implement administrative, technical, and organizational safeguards including HTTPS/SSL encryption and secure authentication.\n\nWhile we implement industry-standard measures, no method of storage is completely secure. The Company shall not be liable for incidents beyond its reasonable control.',
                      ),
                      _buildDisclaimerSection(
                        'Contact Information',
                        'DOCTOR AND ME AI TECHNOLOGIES LLP\nEmail: contactus@doctorandmeonline.com\n\nPolicy Date: 01-01-2025\nLast Updated: 01-01-2025',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTermsConditionsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3B30).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFF3B30).withOpacity(0.2),
                      ),
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: Color(0xFFFF3B30),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Terms & Conditions',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF3B30).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFFF3B30).withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          'Effective Date: 01-01-2026',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF3B30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'These Terms and Conditions ("Terms") govern the access to and use of the DOCTOR AND ME platform (the "Platform"), operated by DOCTOR AND ME AI TECHNOLOGIES LLP ("Company", "we", "our", "us"). By accessing or using the Platform, you agree to be bound by these Terms.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildDisclaimerSection(
                        '1. Nature of the Platform',
                        'DOCTOR AND ME is a software-as-a-service (SaaS) technology platform that enables clinics, hospitals, doctors, pharmacies, laboratories, and related healthcare providers to manage appointments, patient records, prescriptions, billing, pharmacy, laboratory, and inpatient workflows.\n\nThe Platform does not provide medical advice, diagnosis, or treatment. All clinical decisions are made solely by licensed healthcare professionals.\n\nThe use of the Platform does not create a doctor-patient, clinic-patient, or healthcare provider-patient relationship between the Company and any user or patient.',
                      ),
                      _buildDisclaimerSection(
                        '2. Eligibility',
                        'You must be legally capable of entering into a binding contract to use the Platform. Healthcare providers must hold all valid licenses, registrations, and approvals required under applicable laws in their jurisdiction.',
                      ),
                      _buildDisclaimerSection(
                        '3. User Roles and Accounts',
                        'The Platform supports multiple user roles: Clinic Admin, Doctor, Nurse, Receptionist, Pharmacist, Lab Technician, Billing Staff, and Super Admin. Each user is responsible for maintaining the confidentiality of login credentials.',
                      ),
                      _buildDisclaimerSection(
                        '4. Clinic and Organization Responsibilities',
                        'Organizations using the Platform agree that:\n• They act as the data controller for patient data.\n• They are responsible for obtaining all required patient consents.\n• They must comply with healthcare, data protection, insurance, and medical record laws (including Indian DPDP Act and GCC regulations).',
                      ),
                      _buildDisclaimerSection(
                        '5. Patient Data & Privacy',
                        'Use of patient data is governed by our Privacy Policy. The Company acts as a data processor and processes data only on documented instructions from Healthcare Organizations.',
                      ),
                      _buildDisclaimerSection(
                        '6. Access Control & Data Segregation',
                        'The Platform is a multi-tenant system. Each organization accesses only its own data. Logical data segregation and role-based access controls are implemented to prevent unauthorized access.',
                      ),
                      _buildDisclaimerSection(
                        '7. Data Hosting & Residency',
                        'The Platform uses secure cloud infrastructure. Data may be stored or processed in multiple geographic regions. Organizations are responsible for complying with local data residency requirements.',
                      ),
                      _buildDisclaimerSection(
                        '8. Intellectual Property',
                        'All intellectual property rights in the Platform, including software, trademarks, logos, and content, are owned by DOCTOR AND ME AI TECHNOLOGIES LLP.',
                      ),
                      _buildDisclaimerSection(
                        '9. Disclaimers & Availability',
                        'The Platform is provided on an "as-is" basis. We do not guarantee uninterrupted availability, especially where disruptions arise from third-party services, maintenance, or force majeure events.',
                      ),
                      _buildDisclaimerSection(
                        '10. Contact Information',
                        'DOCTOR AND ME AI TECHNOLOGIES LLP\nEmail: contactus@doctorandmeonline.com\n\nBy using the Platform, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHealthcareResponsibilitiesDialog() {
    _showPolicyDialog(
      title: 'Healthcare Partner Responsibilities',
      icon: Icons.medical_services_outlined,
      content:
          'Healthcare Partner Responsibilities content will be displayed here.\n\nThis section will detail the responsibilities and obligations of healthcare partners using the platform.',
    );
  }

  void _showPolicyDialog({
    required String title,
    required IconData icon,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3B30).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFF3B30).withOpacity(0.2),
                      ),
                    ),
                    child: Icon(icon, color: const Color(0xFFFF3B30), size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.white70,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1000;

    return Scaffold(
      backgroundColor: const Color(0xFF000000), // Premium Black
      body: Stack(
        children: [
          // Background Pattern (visible on both, but obscured on desktop right side)
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/neural-pattern-dark.png',
                fit: BoxFit.cover,
                errorBuilder: (c, o, s) => Container(color: Colors.black),
              ),
            ),
          ),

          isDesktop
              ? _buildDesktopExperience(context, authViewModel)
              : _buildMobileExperience(context, authViewModel),
        ],
      ),
    );
  }

  Widget _buildDesktopExperience(
    BuildContext context,
    AuthViewModel authViewModel,
  ) {
    return Row(
      children: [
        // Left Side: Login Form
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              // Breathing Glow Background
              const Positioned(
                top: -100,
                left: -100,
                child: _AnimatedBackgroundGlow(),
              ),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 40,
                  ),
                  child: _buildFormSection(
                    context,
                    authViewModel,
                    isCompact: false,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Right Side: VR Image with Overlay
        Expanded(
          flex: 6,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/1seeee.png',
                fit: BoxFit.cover,
                color: const Color(0xFFFF3B30).withOpacity(0.1),
                colorBlendMode: BlendMode.overlay,
                errorBuilder: (c, o, s) =>
                    Container(color: const Color(0xFF111111)),
              ),

              // Dynamic Light Source (Top Right)
              const Positioned(
                top: -150,
                right: -150,
                child: _AnimatedBackgroundGlow(),
              ),

              // Pattern Texture
              Positioned.fill(
                child: Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    'assets/neural-pattern-dark.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Gradient Overlay for Text Readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xFF000000),
                      const Color(0xFF000000).withOpacity(0.7),
                      const Color(0xFF000000).withOpacity(0.2),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
              ),
              // Optional Content Overlay
              Positioned(
                bottom: 60,
                left: 60,
                right: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF3B30),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.devices_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Unified Healthcare Access',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'One Account.\nEverywhere you practice.',
                      style: GoogleFonts.outfit(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Seamlessly access patient data across Web, Mobile, and Desktop.',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.8),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        _buildStat('iOS/Android', 'Mobile App'),
                        const SizedBox(width: 32),
                        _buildStat('Web/Desktop', 'Workstation'),
                        const SizedBox(width: 32),
                        _buildStat('Real-time', 'Sync'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileExperience(
    BuildContext context,
    AuthViewModel authViewModel,
  ) {
    return Stack(
      children: [
        // Centered Glow
        const Positioned.fill(child: Center(child: _AnimatedBackgroundGlow())),
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 450),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(
                  0.05,
                ), // Increased Glass opacity
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: RepaintBoundary(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12,
                      sigmaY: 12,
                    ), // Smoother blur
                    child: _buildFormSection(
                      context,
                      authViewModel,
                      isCompact: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection(
    BuildContext context,
    AuthViewModel authViewModel, {
    required bool isCompact,
  }) {
    const red = Color(0xFFFF3B30);
    const white = Color(0xFFFFFFFF);
    const lightGray = Color(0xFFAAAAAA);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        _FadeSlide(
          delay: 0,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go('/'),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo2.png',
                    width: 75,
                    height: 74,
                    fit: BoxFit.contain,
                  ),
                  // const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/appbartextdr&me.png',
                        height: 26,
                        color: white,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'Professional Suite',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: white.withOpacity(0.5),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        _FadeSlide(
          delay: 0.1,
          child: Text(
            'Portal Access',
            style: GoogleFonts.outfit(
              fontSize: isCompact ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: white,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _FadeSlide(
          delay: 0.2,
          child: Text(
            'Secure login for healthcare providers.',
            style: GoogleFonts.inter(fontSize: 16, color: lightGray),
          ),
        ),
        const SizedBox(height: 48),

        // Form
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FadeSlide(
                delay: 0.3,
                child: _buildModernInput(
                  controller: loginCtrl,
                  hint: 'Email or Phone',
                  icon: Icons.alternate_email_rounded,
                  validator: _validateEmailOrPhone,
                ),
              ),
              const SizedBox(height: 20),
              _FadeSlide(
                delay: 0.4,
                child: _buildModernInput(
                  controller: passCtrl,
                  hint: 'Password',
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  validator: _validatePassword,
                ),
              ),
              const SizedBox(height: 24),
              _FadeSlide(
                delay: 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            value: _keepMeSignedIn,
                            onChanged: (v) =>
                                setState(() => _keepMeSignedIn = v ?? false),
                            activeColor: red,
                            side: BorderSide(
                              color: white.withOpacity(0.3),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Remember me',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: lightGray,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Terms and Conditions Notice (Implicit Agreement)
              _FadeSlide(
                delay: 0.55,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.verified_user_outlined,
                          color: white.withOpacity(0.7),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Wrap(
                          children: [
                            Text(
                              'By signing in, I confirm that I agree to the ',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: lightGray,
                                height: 1.5,
                              ),
                            ),
                            InkWell(
                              onTap: _showPrivacyPolicyDialog,
                              child: Text(
                                'Privacy Policy',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Text(
                              ', ',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: lightGray,
                                height: 1.5,
                              ),
                            ),
                            InkWell(
                              onTap: _showTermsConditionsDialog,
                              child: Text(
                                'Terms & Conditions',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Text(
                              ', ',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: lightGray,
                                height: 1.5,
                              ),
                            ),
                            InkWell(
                              onTap: _showDisclaimerDialog,
                              child: Text(
                                'Disclaimer',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Text(
                              ', and ',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: lightGray,
                                height: 1.5,
                              ),
                            ),
                            InkWell(
                              onTap: _showHealthcareResponsibilitiesDialog,
                              child: Text(
                                'Healthcare Partner Responsibilities',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Text(
                              '.',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: lightGray,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Login Button
              _FadeSlide(
                delay: 0.6,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF3B30), Color(0xFFFF6B6B)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: red.withOpacity(0.4),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: authViewModel.isLoading ? null : _handleLogin,
                      child: Center(
                        child: authViewModel.isLoading
                            ? const AppLoader(
                                size: 24,
                                strokeWidth: 2.5,
                                color: white,
                              )
                            : Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Footer
              _FadeSlide(
                delay: 0.7,
                child: Center(
                  child: Text(
                    '© 2025 Dr&Me Inc.   •   Privacy   •   Terms',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.3),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModernInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && _obscurePassword,
      validator: validator,
      style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
      cursorColor: const Color(0xFFFF3B30),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.07), // Premium Lighter Glass
        prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.5)),
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.white.withOpacity(0.3)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF3B30), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF3B30)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF3B30), width: 1.5),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white.withOpacity(0.4),
                ),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              )
            : null,
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class _FadeSlide extends StatelessWidget {
  final Widget child;
  final double delay;

  const _FadeSlide({required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutQuart,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: child,
    );
  }
}

class _AnimatedBackgroundGlow extends StatefulWidget {
  const _AnimatedBackgroundGlow();

  @override
  State<_AnimatedBackgroundGlow> createState() =>
      _AnimatedBackgroundGlowState();
}

class _AnimatedBackgroundGlowState extends State<_AnimatedBackgroundGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFF3B30).withOpacity(0.15 * _controller.value),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.6],
              ),
            ),
          );
        },
      ),
    );
  }
}
