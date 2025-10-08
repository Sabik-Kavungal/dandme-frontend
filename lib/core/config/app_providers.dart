/// App Providers Configuration
///
/// This file centralizes all Provider configurations for the application.
/// It makes the provider setup reusable and easier to manage as the app grows.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ViewModel imports
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/organization/viewmodels/organization_viewmodel.dart';
import 'package:a/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:a/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:a/modules/superadmin/viewmodels/user_management_viewmodel.dart';
import 'package:a/modules/superadmin/viewmodels/role_management_viewmodel.dart';

/// Application Providers Configuration
///
/// This class provides a centralized way to configure all providers
/// used throughout the application. It supports both lazy and eager
/// provider initialization.
class AppProviders {
  /// Get the list of all providers for the application
  ///
  /// [authViewModel] - Pre-initialized AuthViewModel instance
  /// [lazy] - Whether to create providers lazily (default: false)
  static List<ChangeNotifierProvider> getProviders({
    required AuthViewModel authViewModel,
    bool lazy = false,
  }) {
    return [
      // Auth Provider - Pre-initialized with tokens
      ChangeNotifierProvider<AuthViewModel>.value(value: authViewModel),

      // Organization Provider
      ChangeNotifierProvider<OrganizationViewModel>(
        create: (context) => OrganizationViewModel(),
        lazy: lazy,
      ),

      // Clinic Provider
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),

      // Doctor Provider
      ChangeNotifierProvider<DoctorViewModel>(
        create: (context) => DoctorViewModel(),
        lazy: lazy,
      ),

      // User Management Provider
      ChangeNotifierProvider<UserManagementViewModel>(
        create: (context) => UserManagementViewModel(),
        lazy: lazy,
      ),

      // Role Management Provider
      ChangeNotifierProvider<RoleManagementViewModel>(
        create: (context) => RoleManagementViewModel(),
        lazy: lazy,
      ),
    ];
  }

  /// Get providers for testing with mock data
  ///
  /// This method is useful for widget tests and integration tests
  /// where you want to provide mock implementations.
  static List<ChangeNotifierProvider> getTestProviders({
    required AuthViewModel authViewModel,
    OrganizationViewModel? organizationViewModel,
    ClinicViewModel? clinicViewModel,
    DoctorViewModel? doctorViewModel,
    UserManagementViewModel? userManagementViewModel,
    RoleManagementViewModel? roleManagementViewModel,
  }) {
    return [
      ChangeNotifierProvider<AuthViewModel>.value(value: authViewModel),

      if (organizationViewModel != null)
        ChangeNotifierProvider<OrganizationViewModel>.value(
          value: organizationViewModel,
        )
      else
        ChangeNotifierProvider<OrganizationViewModel>(
          create: (context) => OrganizationViewModel(),
          lazy: true,
        ),

      if (clinicViewModel != null)
        ChangeNotifierProvider<ClinicViewModel>.value(value: clinicViewModel)
      else
        ChangeNotifierProvider<ClinicViewModel>(
          create: (context) => ClinicViewModel(),
          lazy: true,
        ),

      if (doctorViewModel != null)
        ChangeNotifierProvider<DoctorViewModel>.value(value: doctorViewModel)
      else
        ChangeNotifierProvider<DoctorViewModel>(
          create: (context) => DoctorViewModel(),
          lazy: true,
        ),

      if (userManagementViewModel != null)
        ChangeNotifierProvider<UserManagementViewModel>.value(
          value: userManagementViewModel,
        )
      else
        ChangeNotifierProvider<UserManagementViewModel>(
          create: (context) => UserManagementViewModel(),
          lazy: true,
        ),

      if (roleManagementViewModel != null)
        ChangeNotifierProvider<RoleManagementViewModel>.value(
          value: roleManagementViewModel,
        )
      else
        ChangeNotifierProvider<RoleManagementViewModel>(
          create: (context) => RoleManagementViewModel(),
          lazy: true,
        ),
    ];
  }

  /// Get providers for development with lazy loading
  ///
  /// This method creates providers that are initialized only when
  /// first accessed, which can improve app startup performance.
  static List<ChangeNotifierProvider> getLazyProviders({
    required AuthViewModel authViewModel,
  }) {
    return getProviders(authViewModel: authViewModel, lazy: true);
  }

  /// Get providers for production with eager loading
  ///
  /// This method creates providers that are initialized immediately,
  /// which can improve runtime performance but may slow startup.
  static List<ChangeNotifierProvider> getEagerProviders({
    required AuthViewModel authViewModel,
  }) {
    return getProviders(authViewModel: authViewModel, lazy: false);
  }
}

/// Provider Configuration Extensions
///
/// These extensions provide convenient methods for different
/// provider configurations based on environment or use case.
extension ProviderConfigurations on AppProviders {
  /// Get providers optimized for development
  static List<ChangeNotifierProvider> development({
    required AuthViewModel authViewModel,
  }) {
    return AppProviders.getLazyProviders(authViewModel: authViewModel);
  }

  /// Get providers optimized for production
  static List<ChangeNotifierProvider> production({
    required AuthViewModel authViewModel,
  }) {
    return AppProviders.getEagerProviders(authViewModel: authViewModel);
  }

  /// Get providers optimized for testing
  static List<ChangeNotifierProvider> testing({
    required AuthViewModel authViewModel,
    OrganizationViewModel? organizationViewModel,
    ClinicViewModel? clinicViewModel,
    DoctorViewModel? doctorViewModel,
    UserManagementViewModel? userManagementViewModel,
    RoleManagementViewModel? roleManagementViewModel,
  }) {
    return AppProviders.getTestProviders(
      authViewModel: authViewModel,
      organizationViewModel: organizationViewModel,
      clinicViewModel: clinicViewModel,
      doctorViewModel: doctorViewModel,
      userManagementViewModel: userManagementViewModel,
      roleManagementViewModel: roleManagementViewModel,
    );
  }
}
