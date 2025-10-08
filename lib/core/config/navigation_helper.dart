import 'package:flutter/material.dart';
import 'package:a/core/config/app_router.dart';

/// Navigation helper class to provide easy access to navigation methods
/// This class wraps the AppRouter methods for easier usage throughout the app
class NavigationHelper {
  /// Navigate to dashboard based on user role
  static void goToDashboard(BuildContext context, String? role) {
    AppRouter.goToDashboard(context, role: role);
  }

  /// Navigate to login screen
  static void goToLogin(BuildContext context) {
    AppRouter.goToLogin(context);
  }

  /// Navigate to profile screen
  static void goToProfile(BuildContext context) {
    AppRouter.goToProfile(context);
  }

  /// Navigate to specific module
  static void goToModule(BuildContext context, String module) {
    AppRouter.goToModule(context, module);
  }

  /// Navigate to specific screen within a module
  static void goToModuleScreen(
    BuildContext context,
    String module,
    String screen,
  ) {
    AppRouter.goToModuleScreen(context, module, screen);
  }

  /// Navigate to appointment details
  static void goToAppointmentDetails(
    BuildContext context,
    String appointmentId, {
    String module = 'appointment',
  }) {
    AppRouter.goToAppointmentDetails(context, appointmentId, module: module);
  }

  /// Navigate to new appointment screen
  static void goToNewAppointment(
    BuildContext context, {
    String module = 'appointment',
  }) {
    AppRouter.goToNewAppointment(context, module: module);
  }

  /// Navigate back
  static void goBack(BuildContext context) {
    AppRouter.goBack(context);
  }

  /// Check if current route matches pattern
  static bool isCurrentRoute(BuildContext context, String route) {
    return AppRouter.isCurrentRoute(context, route);
  }

  /// Get current route
  static String getCurrentRoute(BuildContext context) {
    return AppRouter.getCurrentRoute(context);
  }

  /// Navigate to superadmin dashboard
  static void goToSuperAdminDashboard(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'dashboard');
  }

  /// Navigate to clinic dashboard
  static void goToClinicDashboard(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'clinic', 'dashboard');
  }

  /// Navigate to doctor dashboard
  static void goToDoctorDashboard(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'doctor', 'dashboard');
  }

  /// Navigate to organization dashboard
  static void goToOrganizationDashboard(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'organization', 'dashboard');
  }

  /// Navigate to pharmacist dashboard
  static void goToPharmacistDashboard(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'pharmacist', 'dashboard');
  }

  /// Navigate to appointments dashboard
  static void goToAppointmentsDashboard(
    BuildContext context, {
    String module = 'appointment',
  }) {
    AppRouter.goToModuleScreen(context, module, 'appointments');
  }

  /// Navigate to superadmin organizations
  static void goToSuperAdminOrganizations(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'organizations');
  }

  /// Navigate to superadmin clinics
  static void goToSuperAdminClinics(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'clinics');
  }

  /// Navigate to superadmin doctors
  static void goToSuperAdminDoctors(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'doctors');
  }

  /// Navigate to superadmin users
  static void goToSuperAdminUsers(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'users');
  }

  /// Navigate to superadmin settings
  static void goToSuperAdminSettings(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'settings');
  }

  /// Navigate to superadmin reports
  static void goToSuperAdminReports(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'reports');
  }

  /// Navigate to superadmin audit log
  static void goToSuperAdminAuditLog(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'audit-log');
  }

  /// Navigate to add organization screen
  static void goToAddOrganization(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'add-organization');
  }

  /// Navigate to add clinic screen
  static void goToAddClinic(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'add-clinic');
  }

  /// Navigate to add doctor screen
  static void goToAddDoctor(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'add-doctor');
  }

  /// Navigate to organization details
  static void goToOrganizationDetails(
    BuildContext context,
    String organizationId,
  ) {
    AppRouter.goToModuleScreen(
      context,
      'superadmin',
      'organization-details/$organizationId',
    );
  }

  /// Navigate to clinic details
  static void goToClinicDetails(BuildContext context, String clinicId) {
    AppRouter.goToModuleScreen(
      context,
      'superadmin',
      'clinic-details/$clinicId',
    );
  }

  /// Navigate to clinic doctor links
  static void goToClinicDoctorLinks(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'clinic-doctor-links');
  }

  /// Navigate to add clinic doctor link
  static void goToAddClinicDoctorLink(BuildContext context) {
    AppRouter.goToModuleScreen(context, 'superadmin', 'add-clinic-doctor-link');
  }
}
