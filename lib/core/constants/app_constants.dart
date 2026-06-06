// ============================================================================
// SHARED APPLICATION CONSTANTS
// ============================================================================
// This file contains constants that can be shared across all modules.
// ============================================================================

import 'package:flutter/material.dart';

class AppConstants {
  // Server Configuration
  static const String serverUrl = 'https://api.doctorandmeonline.com';
  static const String apiBaseUrl = '$serverUrl/api';

  // Colors
  static const Color primaryColor = Color(0xFF007BFF);
  static const Color secondaryColor = Color(0xFF6C757D);
  static const Color successColor = Color(0xFF28A745);
  static const Color dangerColor = Color(0xFFDC3545);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF17A2B8);
  static const Color lightColor = Color(0xFFF8F9FA);
  static const Color darkColor = Color(0xFF343A40);

  // Background Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Status Colors
  static const Color upcomingColor = Color(0xFFFFC107);
  static const Color completedColor = Color(0xFF28A745);
  static const Color cancelledColor = Color(0xFFDC3545);
  static const Color pendingColor = Color(0xFF6C757D);

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 20.0;
  static const double spacingXXL = 24.0;
  static const double spacingXXXL = 32.0;

  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;

  // Breakpoints
  static const double mobileBreakpoint = 480.0;
  static const double tabletBreakpoint = 768.0;
  static const double desktopBreakpoint = 1024.0;
  static const double largeDesktopBreakpoint = 1200.0;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 50;
}

// Navigation Routes
class AppRoutes {
  // SuperAdmin Routes
  static const String superAdminDashboard = '/superadmin/dashboard';
  static const String superAdminOrganizations = '/superadmin/organizations';
  static const String superAdminClinics = '/superadmin/clinics';
  static const String superAdminDoctors = '/superadmin/doctors';
  static const String superAdminUsers = '/superadmin/users';
  static const String superAdminSettings = '/superadmin/settings';
  static const String superAdminReports = '/superadmin/reports';

  // Appointment Routes
  static const String appointmentDashboard = '/appointments/dashboard';
  static const String newAppointment = '/appointments/new';
  static const String appointmentDetails = '/appointments/details';
  static const String appointmentPayment = '/appointments/payment';

  // Other Module Routes
  static const String clinicDashboard = '/clinic/dashboard';
  static const String doctorDashboard = '/doctor/dashboard';
  static const String patientDashboard = '/patient/dashboard';
  static const String organizationDashboard = '/organization/dashboard';
}

// API Endpoints
class AppEndpoints {
  // SuperAdmin Endpoints
  static const String organizations = '/api/organizations';
  static const String clinics = '/api/clinics';
  static const String doctors = '/api/doctors';
  static const String users = '/api/users';
  static const String superAdminDashboard = '/api/superadmin/dashboard';

  // Appointment Endpoints
  static const String appointments = '/api/appointments';
  static const String appointmentSummary = '/api/appointments/summary';
  static const String departments = '/api/departments';
  static const String patients = '/api/patients';
  static const String payments = '/api/payments';
}

// Common Data Lists
class AppData {
  // Time Slots
  static const List<String> morningSlots = [
    '08:00 AM',
    '08:30 AM',
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
  ];

  static const List<String> afternoonSlots = [
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
  ];

  // Status Types
  static const List<String> appointmentStatuses = [
    'Scheduled',
    'Confirmed',
    'In Progress',
    'Completed',
    'Cancelled',
    'No Show',
  ];

  // Payment Methods
  static const List<String> paymentMethods = [
    'Pay Now',
    'Pay Later',
    'Insurance',
    'Cash',
    'Card',
  ];

  // Consultation Types
  static const List<String> consultationTypes = [
    'In-Person',
    'Video Call',
    'Phone Call',
    'Follow-up',
  ];

  // Departments
  static const List<String> departments = [
    'Cardiology',
    'Dermatology',
    'Neurology',
    'Orthopedics',
    'Pediatrics',
    'General Medicine',
    'Emergency',
    'Surgery',
  ];
}
