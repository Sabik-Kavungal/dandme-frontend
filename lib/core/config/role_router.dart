import 'package:flutter/material.dart';
import 'package:a/modules/superadmin/views/super_admin_module_view.dart';
import 'package:a/modules/organization/views/organization_admin_module_view.dart';
import 'package:a/modules/patient/views/patient_module_view.dart';
import 'package:a/modules/doctor/views/doctor_module_view.dart';
import 'package:a/modules/patient/views/pharmacist_module_view.dart';

import 'package:a/modules/clinic/views/clinic_module_view.dart';
import 'package:a/core/constants/app_constants.dart';
import 'package:a/core/config/app_router.dart';

class RoleRouter {
  static Widget getDashboardByRole(String? role) {
    switch (role?.toLowerCase()) {
      case 'super_admin':
        return const SuperAdminModuleView();
      case 'clinic_admin':
        return const ClinicModuleView();
      case 'organization_admin':
        return const OrganizationAdminModuleView();
      case 'patient':
        return const PatientModuleView();
      case 'doctor':
        return const DoctorModuleView();
      case 'pharmacist':
        return const PharmacistModuleView();
      default:
        return const ClinicModuleView();
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
        return AppConstants.dangerColor;
      case 'patient':
        return AppConstants.successColor;
      case 'organization_admin':
        return AppConstants.primaryColor;
      case 'clinic_admin':
        return AppConstants.successColor;
      case 'doctor':
        return AppConstants.infoColor;
      case 'pharmacist':
        return AppConstants.secondaryColor;
      default:
        return AppConstants.secondaryColor;
    }
  }

  /// Navigate to dashboard based on role using go_router
  static void navigateToDashboard(BuildContext context, String? role) {
    AppRouter.goToDashboard(context, role: role);
  }

  /// Navigate to specific module using go_router
  static void navigateToModule(BuildContext context, String module) {
    AppRouter.goToModule(context, module);
  }

  /// Navigate to specific screen within a module using go_router
  static void navigateToModuleScreen(
    BuildContext context,
    String module,
    String screen,
  ) {
    AppRouter.goToModuleScreen(context, module, screen);
  }

  /// Navigate to login using go_router
  static void navigateToLogin(BuildContext context) {
    AppRouter.goToLogin(context);
  }

  /// Navigate to profile using go_router
  static void navigateToProfile(BuildContext context) {
    AppRouter.goToProfile(context);
  }

  /// Navigate back using go_router
  static void navigateBack(BuildContext context) {
    AppRouter.goBack(context);
  }
}
