/// App Providers Configuration
///
/// This file centralizes all Provider configurations for the application.
/// It makes the provider setup reusable and easier to manage as the app grows.
///
/// IMPORTANT: This class now supports role-based provider loading.
/// Use getProvidersForRole() for optimal performance with role-based access.

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// ViewModel imports
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/organization/viewmodels/organization_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:drandme/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:drandme/modules/superadmin/viewmodels/user_management_viewmodel.dart';
import 'package:drandme/modules/superadmin/viewmodels/role_management_viewmodel.dart';
import 'package:drandme/modules/superadmin/viewmodels/department_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/doctor_details_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_settings_viewmodel.dart';

// Role-based provider configuration
import 'package:drandme/core/config/role_based_providers.dart';

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
  static List<SingleChildWidget> getProviders({
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
        create: (context) => DoctorViewModel(authViewModel),
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

      // Department Provider
      ChangeNotifierProvider<DepartmentViewModel>(
        create: (context) => DepartmentViewModel(authViewModel),
        lazy: lazy,
      ),

      // Doctor Details Provider (requires AuthViewModel)
      ChangeNotifierProxyProvider<AuthViewModel, DoctorDetailsViewModel>(
        create: (context) => DoctorDetailsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? DoctorDetailsViewModel(auth),
        lazy: lazy,
      ),

      // Clinic Settings Provider (requires AuthViewModel)
      ChangeNotifierProxyProvider<AuthViewModel, ClinicSettingsViewModel>(
        create: (context) => ClinicSettingsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? ClinicSettingsViewModel(auth),
        lazy: lazy,
      ),
    ];
  }

  /// Get providers for testing with mock data
  ///
  /// This method is useful for widget tests and integration tests
  /// where you want to provide mock implementations.
  static List<SingleChildWidget> getTestProviders({
    required AuthViewModel authViewModel,
    OrganizationViewModel? organizationViewModel,
    ClinicViewModel? clinicViewModel,
    DoctorViewModel? doctorViewModel,
    UserManagementViewModel? userManagementViewModel,
    RoleManagementViewModel? roleManagementViewModel,
    DepartmentViewModel? departmentViewModel,
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
          create: (context) => DoctorViewModel(authViewModel),
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

      if (departmentViewModel != null)
        ChangeNotifierProvider<DepartmentViewModel>.value(
          value: departmentViewModel,
        )
      else
        ChangeNotifierProvider<DepartmentViewModel>(
          create: (context) => DepartmentViewModel(authViewModel),
          lazy: true,
        ),
    ];
  }

  /// Get providers for development with lazy loading
  ///
  /// This method creates providers that are initialized only when
  /// first accessed, which can improve app startup performance.
  static List<SingleChildWidget> getLazyProviders({
    required AuthViewModel authViewModel,
  }) {
    return getProviders(authViewModel: authViewModel, lazy: true);
  }

  /// Get providers for production with eager loading
  ///
  /// This method creates providers that are initialized immediately,
  /// which can improve runtime performance but may slow startup.
  static List<SingleChildWidget> getEagerProviders({
    required AuthViewModel authViewModel,
  }) {
    return getProviders(authViewModel: authViewModel, lazy: false);
  }

  /// Get providers based on user role (RECOMMENDED)
  ///
  /// This method loads only the providers necessary for the given user role,
  /// significantly improving performance and reducing unnecessary API calls.
  ///
  /// [authViewModel] - Pre-initialized AuthViewModel instance
  /// [userRole] - The role of the logged-in user (e.g., 'super_admin', 'doctor')
  /// [lazy] - Whether to create providers lazily (default: true)
  ///
  /// Example:
  /// ```dart
  /// AppProviders.getProvidersForRole(
  ///   authViewModel: authViewModel,
  ///   userRole: 'doctor',
  /// );
  /// ```
  static List<SingleChildWidget> getProvidersForRole({
    required AuthViewModel authViewModel,
    String? userRole,
    bool lazy = true,
  }) {
    // Log what providers are being loaded
    RoleBasedProviders.logLoadedProviders(userRole);

    return RoleBasedProviders.getProvidersForRole(
      authViewModel: authViewModel,
      userRole: userRole,
      lazy: lazy,
    );
  }

  /// Get providers for the current user's role from authViewModel
  ///
  /// This is a convenience method that extracts the role from the
  /// authViewModel and loads appropriate providers.
  ///
  /// [authViewModel] - Pre-initialized AuthViewModel instance
  /// [lazy] - Whether to create providers lazily (default: true)
  static List<SingleChildWidget> getProvidersForCurrentUser({
    required AuthViewModel authViewModel,
    bool lazy = true,
  }) {
    final userRole = authViewModel.user?.role;
    return getProvidersForRole(
      authViewModel: authViewModel,
      userRole: userRole,
      lazy: lazy,
    );
  }
}

/// Provider Configuration Extensions
///
/// These extensions provide convenient methods for different
/// provider configurations based on environment or use case.
extension ProviderConfigurations on AppProviders {
  /// Get providers optimized for development (loads all providers)
  static List<SingleChildWidget> development({
    required AuthViewModel authViewModel,
  }) {
    return AppProviders.getLazyProviders(authViewModel: authViewModel);
  }

  /// Get providers optimized for production (loads all providers)
  static List<SingleChildWidget> production({
    required AuthViewModel authViewModel,
  }) {
    return AppProviders.getEagerProviders(authViewModel: authViewModel);
  }

  /// Get role-based providers for development (RECOMMENDED)
  ///
  /// This is the recommended approach for development as it loads only
  /// the necessary providers based on user role.
  static List<SingleChildWidget> developmentRoleBased({
    required AuthViewModel authViewModel,
    String? userRole,
  }) {
    return AppProviders.getProvidersForRole(
      authViewModel: authViewModel,
      userRole: userRole,
      lazy: true,
    );
  }

  /// Get role-based providers for production (RECOMMENDED)
  ///
  /// This is the recommended approach for production as it loads only
  /// the necessary providers based on user role with eager loading.
  static List<SingleChildWidget> productionRoleBased({
    required AuthViewModel authViewModel,
    String? userRole,
  }) {
    return AppProviders.getProvidersForRole(
      authViewModel: authViewModel,
      userRole: userRole,
      lazy: false,
    );
  }

  /// Get providers optimized for testing
  static List<SingleChildWidget> testing({
    required AuthViewModel authViewModel,
    OrganizationViewModel? organizationViewModel,
    ClinicViewModel? clinicViewModel,
    DoctorViewModel? doctorViewModel,
    UserManagementViewModel? userManagementViewModel,
    RoleManagementViewModel? roleManagementViewModel,
    DepartmentViewModel? departmentViewModel,
  }) {
    return AppProviders.getTestProviders(
      authViewModel: authViewModel,
      organizationViewModel: organizationViewModel,
      clinicViewModel: clinicViewModel,
      doctorViewModel: doctorViewModel,
      userManagementViewModel: userManagementViewModel,
      roleManagementViewModel: roleManagementViewModel,
      departmentViewModel: departmentViewModel,
    );
  }
}
