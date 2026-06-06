import 'package:drandme/modules/clinic/views/appointments/new_appointment_view_refactored.dart';
import 'package:drandme/modules/organization/models/organization_model.dart';
import 'package:drandme/modules/clinic/models/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Auth imports
import 'package:drandme/modules/auth/views/login_view.dart';
import 'package:drandme/modules/auth/views/profile_view.dart' as auth;
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';

// Module imports
import 'package:drandme/modules/superadmin/views/super_admin_module_view.dart';
import 'package:drandme/modules/organization/views/organization_admin_module_view.dart';
import 'package:drandme/modules/patient/views/patient_module_view.dart';
import 'package:drandme/modules/doctor/views/doctor_module_view.dart';
import 'package:drandme/modules/patient/views/pharmacist_module_view.dart';
import 'package:drandme/modules/clinic/views/clinic_module_view.dart';

// SuperAdmin specific views
import 'package:drandme/modules/superadmin/views/dashboard/super_admin_dashboard_view.dart';
import 'package:drandme/modules/superadmin/views/clinics/add_clinic_new_view.dart';
import 'package:drandme/modules/superadmin/views/clinics/clinics_list_view.dart';
import 'package:drandme/modules/superadmin/views/clinics/clinic_details_view.dart';
import 'package:drandme/modules/superadmin/views/clinics/add_clinic_doctor_link_view.dart';
import 'package:drandme/modules/superadmin/views/clinics/clinic_doctor_links_list_view.dart';
import 'package:drandme/modules/superadmin/views/doctors/add_doctor_view.dart';
import 'package:drandme/modules/superadmin/views/doctors/doctors_list_view.dart';
import 'package:drandme/modules/superadmin/views/organizations/add_organization_view.dart';
import 'package:drandme/modules/superadmin/views/organizations/organizations_list_view.dart';
import 'package:drandme/modules/superadmin/views/organizations/organization_details_view.dart';
import 'package:drandme/modules/superadmin/views/users/users_management_view.dart'
    as users;

// Clinic specific views (includes appointment management)
import 'package:drandme/modules/clinic/views/clinic_admin_dashboard_view.dart';
import 'package:drandme/modules/clinic/views/appointments/appointments_dashboard_view_refactored.dart';

import 'package:drandme/modules/clinic/views/appointments/appointment_details_view.dart';
import 'package:drandme/modules/clinic/views/doctor_details_content.dart';

// Doctor specific views
import 'package:drandme/modules/doctor/views/doctor_dashboard_view.dart';

// Organization specific views
import 'package:drandme/modules/organization/views/organization_admin_dashboard_view.dart';

// Patient specific views
import 'package:drandme/modules/patient/views/pharmacist_dashboard_view.dart';

// Intro/Landing page
import 'package:drandme/views/intro_page.dart';

/// Centralized router configuration using go_router
class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      // Allow access to intro page and login without authentication
      if (!authViewModel.isAuthenticated &&
          state.uri.path != '/login' &&
          state.uri.path != '/') {
        return '/login';
      }

      // If user is authenticated and on login page, redirect to appropriate dashboard
      if (authViewModel.isAuthenticated && state.uri.path == '/login') {
        return authViewModel.getDashboardRoute();
      }

      // Check if authenticated user can access the current route
      if (authViewModel.isAuthenticated &&
          !authViewModel.canAccessRoute(state.uri.path)) {
        // User doesn't have permission for this route, redirect to their dashboard
        return authViewModel.getDashboardRoute();
      }

      return null; // No redirect needed
    },
    routes: [
      // Intro/Landing page (public, no auth required)
      GoRoute(
        path: '/',
        name: 'intro',
        builder: (context, state) => const IntroPage(),
      ),

      // Authentication routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),

      // Profile route
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const auth.ProfileScreen(),
      ),

      // Module routes - each module has its own route tree
      GoRoute(
        path: '/superadmin',
        name: 'superadmin',
        builder: (context, state) => const SuperAdminModuleView(),
        routes: [
          // SuperAdmin specific routes
          GoRoute(
            path: 'dashboard',
            name: 'superadmin-dashboard',
            builder: (context, state) => const SuperAdminDashboardScreen(),
          ),
          GoRoute(
            path: 'organizations',
            name: 'superadmin-organizations',
            builder: (context, state) => const OrganizationsManagementScreen(),
          ),
          GoRoute(
            path: 'clinics',
            name: 'superadmin-clinics',
            builder: (context, state) => const ClinicsManagementScreen(),
          ),
          GoRoute(
            path: 'doctors',
            name: 'superadmin-doctors',
            builder: (context, state) => const DoctorsManagementScreen(),
          ),
          GoRoute(
            path: 'users',
            name: 'superadmin-users',
            builder: (context, state) => const UsersManagementScreenWrapper(),
          ),
          GoRoute(
            path: 'settings',
            name: 'superadmin-settings',
            builder: (context, state) => const SystemSettingsScreen(),
          ),
          GoRoute(
            path: 'reports',
            name: 'superadmin-reports',
            builder: (context, state) => const ReportsScreen(),
          ),
          GoRoute(
            path: 'audit-log',
            name: 'superadmin-audit-log',
            builder: (context, state) => const AuditLogScreen(),
          ),
          // Add screens
          GoRoute(
            path: 'add-organization',
            name: 'superadmin-add-organization',
            builder: (context, state) => const AddOrganizationScreenWrapper(),
          ),
          GoRoute(
            path: 'add-clinic',
            name: 'superadmin-add-clinic',
            builder: (context, state) => const AddClinicScreenWrapper(),
          ),
          GoRoute(
            path: 'add-doctor',
            name: 'superadmin-add-doctor',
            builder: (context, state) => const AddDoctorScreenWrapper(),
          ),
          GoRoute(
            path: 'organization-details/:id',
            name: 'superadmin-organization-details',
            builder: (context, state) {
              final organizationId = state.pathParameters['id']!;
              return OrganizationDetailsScreenWrapper(
                organizationId: organizationId,
              );
            },
          ),
          GoRoute(
            path: 'clinic-details/:id',
            name: 'superadmin-clinic-details',
            builder: (context, state) {
              final clinicId = state.pathParameters['id']!;
              return ClinicDetailsScreenWrapper(clinicId: clinicId);
            },
          ),
          GoRoute(
            path: 'clinic-doctor-links',
            name: 'superadmin-clinic-doctor-links',
            builder: (context, state) =>
                const ClinicDoctorLinksListScreenWrapper(),
          ),
          GoRoute(
            path: 'add-clinic-doctor-link',
            name: 'superadmin-add-clinic-doctor-link',
            builder: (context, state) =>
                const AddClinicDoctorLinkScreenWrapper(),
          ),
        ],
      ),

      GoRoute(
        path: '/clinic',
        name: 'clinic',
        builder: (context, state) => const ClinicModuleView(),
        routes: [
          // Clinic specific routes (includes appointment management)
          GoRoute(
            path: 'dashboard',
            name: 'clinic-dashboard',
            builder: (context, state) => const ClinicAdminDashboard(),
          ),
          GoRoute(
            path: 'appointments',
            name: 'clinic-appointments',
            builder: (context, state) => const AppointmentsDashboard(),
          ),
          GoRoute(
            path: 'appointments/new',
            name: 'clinic-new-appointment',
            builder: (context, state) => const NewAppointmentScreen(),
          ),
          GoRoute(
            path: 'appointments/:id',
            name: 'clinic-appointment-details',
            builder: (context, state) {
              final appointmentId = state.pathParameters['id']!;
              return AppointmentDetailsScreen(appointmentId: appointmentId);
            },
          ),
          GoRoute(
            path: 'doctor-details/:doctorId',
            name: 'clinic-doctor-details',
            builder: (context, state) {
              final doctorId = state.pathParameters['doctorId']!;
              return Scaffold(body: DoctorDetailsContent(doctorId: doctorId));
            },
          ),
        ],
      ),

      GoRoute(
        path: '/doctor',
        name: 'doctor',
        builder: (context, state) => const DoctorModuleView(),
        routes: [
          // Doctor specific routes
          GoRoute(
            path: 'dashboard',
            name: 'doctor-dashboard',
            builder: (context, state) => const DoctorDashboardScreen(),
          ),
        ],
      ),

      GoRoute(
        path: '/organization',
        name: 'organization',
        builder: (context, state) => const OrganizationAdminModuleView(),
        routes: [
          // Organization specific routes
          GoRoute(
            path: 'dashboard',
            name: 'organization-dashboard',
            builder: (context, state) =>
                const OrganizationAdminDashboardScreen(),
          ),
        ],
      ),

      GoRoute(
        path: '/patient',
        name: 'patient',
        builder: (context, state) => const PatientModuleView(),
      ),

      GoRoute(
        path: '/pharmacist',
        name: 'pharmacist',
        builder: (context, state) => const PharmacistModuleView(),
        routes: [
          // Pharmacist specific routes
          GoRoute(
            path: 'dashboard',
            name: 'pharmacist-dashboard',
            builder: (context, state) => const PharmacistDashboard(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page "${state.uri.path}" does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/login'),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    ),
  );

  /// Get the router instance
  static GoRouter get router => _router;

  /// Get dashboard route based on user role (deprecated - use AuthViewModel.getDashboardRoute())
  @Deprecated('Use AuthViewModel.getDashboardRoute() instead')
  static String _getDashboardRouteForRole(String? role) {
    switch (role?.toLowerCase()) {
      case 'super_admin':
        return '/superadmin';
      case 'clinic_admin':
        return '/clinic';
      case 'organization_admin':
        return '/organization';
      case 'patient':
        return '/patient';
      case 'doctor':
        return '/doctor';
      case 'pharmacist':
        return '/pharmacist';
      default:
        return '/clinic'; // Default to clinic module for appointment management
    }
  }

  /// Navigate to dashboard based on role (enhanced version)
  static void goToDashboard(BuildContext context, {String? role}) {
    if (role != null) {
      // Use the legacy method if role is explicitly provided
      context.go(_getDashboardRouteForRole(role));
    } else {
      // Use AuthViewModel to get the current user's dashboard route
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      context.go(authViewModel.getDashboardRoute());
    }
  }

  /// Navigate to login
  static void goToLogin(BuildContext context) {
    context.go('/login');
  }

  /// Navigate to profile
  static void goToProfile(BuildContext context) {
    context.go('/profile');
  }

  /// Navigate to specific module
  static void goToModule(BuildContext context, String module) {
    context.go('/$module');
  }

  /// Navigate to specific screen within a module
  static void goToModuleScreen(
    BuildContext context,
    String module,
    String screen,
  ) {
    context.go('/$module/$screen');
  }

  /// Navigate to appointment details (uses clinic module)
  static void goToAppointmentDetails(
    BuildContext context,
    String appointmentId, {
    String module = 'clinic',
  }) {
    context.go('/$module/appointments/$appointmentId');
  }

  /// Navigate to new appointment (uses clinic module)
  static void goToNewAppointment(
    BuildContext context, {
    String module = 'clinic',
  }) {
    context.go('/$module/appointments/new');
  }

  /// Navigate back
  static void goBack(BuildContext context) {
    context.pop();
  }

  /// Check if current route matches pattern
  static bool isCurrentRoute(BuildContext context, String route) {
    return GoRouterState.of(context).uri.path == route;
  }

  /// Get current route
  static String getCurrentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  /// Check if current user can access a specific route
  static bool canUserAccessRoute(BuildContext context, String route) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return authViewModel.canAccessRoute(route);
  }

  /// Navigate to route with permission check
  static Future<void> navigateToRoute(
    BuildContext context,
    String route,
  ) async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    if (!authViewModel.isAuthenticated) {
      context.go('/login');
      return;
    }

    if (authViewModel.canAccessRoute(route)) {
      context.go(route);
    } else {
      // User doesn't have permission, redirect to their dashboard
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You don\'t have permission to access this page'),
          backgroundColor: Colors.red,
        ),
      );
      context.go(authViewModel.getDashboardRoute());
    }
  }

  /// Validate session and redirect if necessary
  static Future<void> validateSessionAndRedirect(BuildContext context) async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final isValid = await authViewModel.validateSession(context);

    if (!isValid) {
      context.go('/login');
    }
  }
}

// Placeholder screens for SuperAdmin module (keeping existing functionality)
class SuperAdminDashboardScreen extends StatelessWidget {
  const SuperAdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuperAdminDashboard();
  }
}

class OrganizationsManagementScreen extends StatelessWidget {
  const OrganizationsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrganizationsListScreen();
  }
}

class ClinicsManagementScreen extends StatelessWidget {
  const ClinicsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClinicsListScreen();
  }
}

class DoctorsManagementScreen extends StatelessWidget {
  const DoctorsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorsListScreen();
  }
}

class UsersManagementScreenWrapper extends StatelessWidget {
  const UsersManagementScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return users.UsersManagementScreen();
  }
}

class SystemSettingsScreen extends StatelessWidget {
  const SystemSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('System Settings - Coming Soon')),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Reports - Coming Soon')));
  }
}

class AuditLogScreen extends StatelessWidget {
  const AuditLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Audit Log - Coming Soon')));
  }
}

// Placeholder screens for Doctor module
class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorDashboard();
  }
}

// Placeholder screens for Organization module
class OrganizationAdminDashboardScreen extends StatelessWidget {
  const OrganizationAdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrganizationAdminDashboard();
  }
}

// Add screens for SuperAdmin
class AddOrganizationScreenWrapper extends StatelessWidget {
  const AddOrganizationScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddOrganizationScreen();
  }
}

class AddClinicScreenWrapper extends StatelessWidget {
  const AddClinicScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddClinicScreen();
  }
}

class AddDoctorScreenWrapper extends StatelessWidget {
  const AddDoctorScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AddDoctorScreen();
  }
}

class OrganizationDetailsScreenWrapper extends StatelessWidget {
  final String organizationId;

  const OrganizationDetailsScreenWrapper({
    super.key,
    required this.organizationId,
  });

  @override
  Widget build(BuildContext context) {
    return OrganizationDetailsScreen(
      organization: OrganizationModel(id: organizationId, name: 'Organization'),
    );
  }
}

class ClinicDetailsScreenWrapper extends StatelessWidget {
  final String clinicId;

  const ClinicDetailsScreenWrapper({super.key, required this.clinicId});

  @override
  Widget build(BuildContext context) {
    return ClinicDetailsScreen(
      clinic: ClinicModel(
        id: clinicId,
        name: 'Clinic',
        clinicCode: 'CLINIC',
        organizationId: 'org-1',
      ),
    );
  }
}

class ClinicDoctorLinksListScreenWrapper extends StatelessWidget {
  const ClinicDoctorLinksListScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClinicDoctorLinksListScreen();
  }
}

class AddClinicDoctorLinkScreenWrapper extends StatelessWidget {
  const AddClinicDoctorLinkScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AddClinicDoctorLinkScreen();
  }
}
