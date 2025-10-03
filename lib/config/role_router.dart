import 'package:flutter/material.dart';
import 'package:a/screens/SuperAdmin/super_admin_dashboard.dart';
import 'package:a/screens/dashboards/organization_admin_dashboard.dart';
import 'package:a/screens/dashboards/clinic_admin_dashboard.dart';
import 'package:a/screens/dashboards/doctor_dashboard.dart';
import 'package:a/screens/dashboards/pharmacist_dashboard.dart';
import 'package:a/widgets/respo_appoiments _all_screen.dart';

class RoleRouter {
  static Widget getDashboardByRole(String? role) {
    switch (role?.toLowerCase()) {
      case 'super_admin':
        return const SuperAdminDashboard();
      case 'clinic_admin':
        return const AppointmentResponsiveLayout();
      case 'organization_admin':
        return const OrganizationAdminDashboard();
      case 'patient':
        return const ClinicAdminDashboard();
      case 'doctor':
        return const DoctorDashboard();
      case 'pharmacist':
        return const PharmacistDashboard();
      default:
        return const AppointmentResponsiveLayout();
    }
  }

  static String getRoleDisplayName(String? role) {
    switch (role?.toLowerCase()) {
      case 'super_admin':
        return 'Super Admin';
      case 'patient':
        return 'Patient';
      case 'organization_admin':
        return 'Organization Admin';
      case 'clinic_admin':
        return 'Clinic Admin';
      case 'doctor':
        return 'Doctor';
      case 'pharmacist':
        return 'Pharmacist';
      default:
        return 'User';
    }
  }

  static Color getRoleColor(String? role) {
    switch (role?.toLowerCase()) {
      case 'super_admin':
        return const Color(0xFFDC3545);
      case 'patient':
        return const Color(0xFF20C997);
      case 'organization_admin':
        return const Color(0xFF007BFF);
      case 'clinic_admin':
        return const Color(0xFF28A745);
      case 'doctor':
        return const Color(0xFF17A2B8);
      case 'pharmacist':
        return const Color(0xFF6F42C1);
      default:
        return const Color(0xFF6C757D);
    }
  }
}
