/// Role-Based Provider Configuration
///
/// This file manages dynamic provider loading based on user roles.
/// Only providers relevant to the user's role are loaded, improving
/// performance and reducing unnecessary API calls.

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// ViewModel imports
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/modules/organization/viewmodels/organization_viewmodel.dart';
import 'package:a/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:a/modules/clinic/viewmodels/clinic_settings_viewmodel.dart';
import 'package:a/modules/clinic/viewmodels/doctor_details_viewmodel.dart';
import 'package:a/modules/clinic/viewmodels/slot_configuration_viewmodel.dart';
import 'package:a/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:a/modules/superadmin/viewmodels/user_management_viewmodel.dart';
import 'package:a/modules/superadmin/viewmodels/role_management_viewmodel.dart';
import 'package:a/modules/superadmin/viewmodels/department_viewmodel.dart';

/// Defines which providers should be loaded for each role
class RoleBasedProviders {
  /// Get providers for a specific user role
  ///
  /// This method returns only the providers that are necessary for
  /// the given user role, optimizing performance and resource usage.
  ///
  /// [authViewModel] - Pre-initialized AuthViewModel instance
  /// [userRole] - The role of the logged-in user
  /// [lazy] - Whether to create providers lazily (default: true)
  static List<SingleChildWidget> getProvidersForRole({
    required AuthViewModel authViewModel,
    String? userRole,
    bool lazy = true,
  }) {
    // Always include AuthViewModel
    final providers = <SingleChildWidget>[
      ChangeNotifierProvider<AuthViewModel>.value(value: authViewModel),
    ];

    // If no role is specified (not logged in), return only AuthViewModel
    if (userRole == null || userRole.isEmpty) {
      return providers;
    }

    // Load role-specific providers
    final roleSpecificProviders = _getProvidersByRole(
      userRole,
      lazy,
      authViewModel,
    );
    providers.addAll(roleSpecificProviders);

    return providers;
  }

  /// Get providers based on specific role
  static List<SingleChildWidget> _getProvidersByRole(
    String role,
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    final normalizedRole = role.toLowerCase();

    switch (normalizedRole) {
      case 'super_admin':
        return _getSuperAdminProviders(lazy, authViewModel);

      case 'organization_admin':
        return _getOrganizationAdminProviders(lazy, authViewModel);

      case 'clinic_admin':
        return _getClinicAdminProviders(lazy, authViewModel);

      case 'doctor':
        return _getDoctorProviders(lazy, authViewModel);

      case 'patient':
        return _getPatientProviders(lazy, authViewModel);

      case 'pharmacist':
        return _getPharmacistProviders(lazy, authViewModel);

      default:
        // For unknown roles, provide basic functionality
        return _getBasicProviders(lazy, authViewModel);
    }
  }

  /// Super Admin has access to all system features
  static List<SingleChildWidget> _getSuperAdminProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<OrganizationViewModel>(
        create: (context) => OrganizationViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DoctorViewModel>(
        create: (context) => DoctorViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<UserManagementViewModel>(
        create: (context) => UserManagementViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<RoleManagementViewModel>(
        create: (context) => RoleManagementViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DepartmentViewModel>(
        create: (context) => DepartmentViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, DoctorDetailsViewModel>(
        create: (context) => DoctorDetailsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? DoctorDetailsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, ClinicSettingsViewModel>(
        create: (context) => ClinicSettingsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? ClinicSettingsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, SlotConfigurationViewModel>(
        create: (context) => SlotConfigurationViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? SlotConfigurationViewModel(auth),
        lazy: lazy,
      ),
    ];
  }

  /// Organization Admin has access to organization-level features
  static List<SingleChildWidget> _getOrganizationAdminProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<OrganizationViewModel>(
        create: (context) => OrganizationViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DoctorViewModel>(
        create: (context) => DoctorViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<UserManagementViewModel>(
        create: (context) => UserManagementViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DepartmentViewModel>(
        create: (context) => DepartmentViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, DoctorDetailsViewModel>(
        create: (context) => DoctorDetailsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? DoctorDetailsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, ClinicSettingsViewModel>(
        create: (context) => ClinicSettingsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? ClinicSettingsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, SlotConfigurationViewModel>(
        create: (context) => SlotConfigurationViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? SlotConfigurationViewModel(auth),
        lazy: lazy,
      ),
    ];
  }

  /// Clinic Admin has access to clinic management features
  static List<SingleChildWidget> _getClinicAdminProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DoctorViewModel>(
        create: (context) => DoctorViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DepartmentViewModel>(
        create: (context) => DepartmentViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, DoctorDetailsViewModel>(
        create: (context) => DoctorDetailsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? DoctorDetailsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, ClinicSettingsViewModel>(
        create: (context) => ClinicSettingsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? ClinicSettingsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, SlotConfigurationViewModel>(
        create: (context) => SlotConfigurationViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? SlotConfigurationViewModel(auth),
        lazy: lazy,
      ),
    ];
  }

  /// Doctor has access to patient management and appointments
  static List<SingleChildWidget> _getDoctorProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<DoctorViewModel>(
        create: (context) => DoctorViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, DoctorDetailsViewModel>(
        create: (context) => DoctorDetailsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? DoctorDetailsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, ClinicSettingsViewModel>(
        create: (context) => ClinicSettingsViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? ClinicSettingsViewModel(auth),
        lazy: lazy,
      ),
      ChangeNotifierProxyProvider<AuthViewModel, SlotConfigurationViewModel>(
        create: (context) => SlotConfigurationViewModel(authViewModel),
        update: (context, auth, previous) =>
            previous ?? SlotConfigurationViewModel(auth),
        lazy: lazy,
      ),
    ];
  }

  /// Patient has access to appointment booking and records
  static List<SingleChildWidget> _getPatientProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
      ChangeNotifierProvider<DoctorViewModel>(
        create: (context) => DoctorViewModel(),
        lazy: lazy,
      ),
    ];
  }

  /// Pharmacist has access to pharmacy-related features
  static List<SingleChildWidget> _getPharmacistProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
    ];
  }

  /// Basic providers for unknown/guest roles
  static List<SingleChildWidget> _getBasicProviders(
    bool lazy,
    AuthViewModel authViewModel,
  ) {
    return [
      ChangeNotifierProvider<ClinicViewModel>(
        create: (context) => ClinicViewModel(),
        lazy: lazy,
      ),
    ];
  }

  /// Get a human-readable list of loaded providers for a role
  /// Useful for debugging and logging
  static List<String> getProviderNamesForRole(String? role) {
    if (role == null || role.isEmpty) {
      return ['AuthViewModel'];
    }

    final normalizedRole = role.toLowerCase();
    final providerNames = ['AuthViewModel'];

    switch (normalizedRole) {
      case 'super_admin':
        providerNames.addAll([
          'OrganizationViewModel',
          'ClinicViewModel',
          'DoctorViewModel',
          'UserManagementViewModel',
          'RoleManagementViewModel',
          'DepartmentViewModel',
          'DoctorDetailsViewModel',
          'ClinicSettingsViewModel',
          'SlotConfigurationViewModel',
        ]);
        break;

      case 'organization_admin':
        providerNames.addAll([
          'OrganizationViewModel',
          'ClinicViewModel',
          'DoctorViewModel',
          'UserManagementViewModel',
          'DepartmentViewModel',
          'DoctorDetailsViewModel',
          'ClinicSettingsViewModel',
          'SlotConfigurationViewModel',
        ]);
        break;

      case 'clinic_admin':
        providerNames.addAll([
          'ClinicViewModel',
          'DoctorViewModel',
          'DepartmentViewModel',
          'DoctorDetailsViewModel',
          'ClinicSettingsViewModel',
          'SlotConfigurationViewModel',
        ]);
        break;

      case 'doctor':
        providerNames.addAll([
          'DoctorViewModel',
          'ClinicViewModel',
          'DoctorDetailsViewModel',
          'ClinicSettingsViewModel',
          'SlotConfigurationViewModel',
        ]);
        break;

      case 'patient':
        providerNames.addAll(['ClinicViewModel', 'DoctorViewModel']);
        break;

      case 'pharmacist':
        providerNames.addAll(['ClinicViewModel']);
        break;

      default:
        providerNames.addAll(['ClinicViewModel']);
    }

    return providerNames;
  }

  /// Log loaded providers for debugging
  static void logLoadedProviders(String? role) {
    final providers = getProviderNamesForRole(role);
    print('🔐 Loading providers for role: ${role ?? "guest"}');
    print('📦 Loaded providers: ${providers.join(", ")}');
    print('✅ Total providers loaded: ${providers.length}');
  }
}
