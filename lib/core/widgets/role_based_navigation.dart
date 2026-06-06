import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';

/// Widget that provides role-based navigation functionality
class RoleBasedNavigation {
  /// Navigate to a route only if user has permission
  static Future<void> navigateIfAllowed(
    BuildContext context,
    String route, {
    bool showPermissionDeniedMessage = true,
  }) async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    if (!authViewModel.isAuthenticated) {
      context.go('/login');
      return;
    }

    if (authViewModel.canAccessRoute(route)) {
      context.go(route);
    } else if (showPermissionDeniedMessage) {
      _showPermissionDeniedMessage(context);
    }
  }

  /// Show permission denied message
  static void _showPermissionDeniedMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('You don\'t have permission to access this page'),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// Get navigation items based on user role
  static List<NavigationItem> getNavigationItems(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final role = authViewModel.userRole?.toLowerCase();

    switch (role) {
      case 'super_admin':
        return _getSuperAdminNavigationItems();
      case 'organization_admin':
        return _getOrganizationAdminNavigationItems();
      case 'clinic_admin':
        return _getClinicAdminNavigationItems();
      case 'doctor':
        return _getDoctorNavigationItems();
      case 'patient':
        return _getPatientNavigationItems();
      case 'pharmacist':
        return _getPharmacistNavigationItems();
      default:
        return _getDefaultNavigationItems();
    }
  }

  /// Super Admin navigation items
  static List<NavigationItem> _getSuperAdminNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/superadmin',
        icon: Icons.dashboard,
        permission: 'view_system',
      ),
      NavigationItem(
        title: 'Organizations',
        route: '/superadmin/organizations',
        icon: Icons.business,
        permission: 'manage_organizations',
      ),
      NavigationItem(
        title: 'Clinics',
        route: '/superadmin/clinics',
        icon: Icons.local_hospital,
        permission: 'manage_clinics',
      ),
      NavigationItem(
        title: 'Doctors',
        route: '/superadmin/doctors',
        icon: Icons.medical_services,
        permission: 'manage_doctors',
      ),
      NavigationItem(
        title: 'Users',
        route: '/superadmin/users',
        icon: Icons.people,
        permission: 'manage_users',
      ),
      NavigationItem(
        title: 'Reports',
        route: '/superadmin/reports',
        icon: Icons.assessment,
        permission: 'view_reports',
      ),
      NavigationItem(
        title: 'Settings',
        route: '/superadmin/settings',
        icon: Icons.settings,
        permission: 'system_settings',
      ),
    ];
  }

  /// Organization Admin navigation items
  static List<NavigationItem> _getOrganizationAdminNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/organization',
        icon: Icons.dashboard,
        permission: 'view_organization',
      ),
      NavigationItem(
        title: 'Clinics',
        route: '/organization/clinics',
        icon: Icons.local_hospital,
        permission: 'manage_clinics',
      ),
      NavigationItem(
        title: 'Reports',
        route: '/organization/reports',
        icon: Icons.assessment,
        permission: 'view_reports',
      ),
      NavigationItem(
        title: 'Users',
        route: '/organization/users',
        icon: Icons.people,
        permission: 'manage_users',
      ),
    ];
  }

  /// Clinic Admin navigation items
  static List<NavigationItem> _getClinicAdminNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/clinic',
        icon: Icons.dashboard,
        permission: 'view_clinic',
      ),
      NavigationItem(
        title: 'Appointments',
        route: '/clinic/appointments',
        icon: Icons.calendar_today,
        permission: 'manage_appointments',
      ),
      NavigationItem(
        title: 'Doctors',
        route: '/clinic/doctors',
        icon: Icons.medical_services,
        permission: 'manage_doctors',
      ),
      NavigationItem(
        title: 'Patients',
        route: '/clinic/patients',
        icon: Icons.people,
        permission: 'manage_patients',
      ),
      NavigationItem(
        title: 'Reports',
        route: '/clinic/reports',
        icon: Icons.assessment,
        permission: 'view_clinic_reports',
      ),
    ];
  }

  /// Doctor navigation items
  static List<NavigationItem> _getDoctorNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/doctor',
        icon: Icons.dashboard,
        permission: 'view_appointments',
      ),
      NavigationItem(
        title: 'Appointments',
        route: '/doctor/appointments',
        icon: Icons.calendar_today,
        permission: 'view_appointments',
      ),
      NavigationItem(
        title: 'Patients',
        route: '/doctor/patients',
        icon: Icons.people,
        permission: 'view_patients',
      ),
      NavigationItem(
        title: 'Schedule',
        route: '/doctor/schedule',
        icon: Icons.schedule,
        permission: 'view_schedule',
      ),
    ];
  }

  /// Patient navigation items
  static List<NavigationItem> _getPatientNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/patient',
        icon: Icons.dashboard,
        permission: 'view_own_appointments',
      ),
      NavigationItem(
        title: 'Appointments',
        route: '/patient/appointments',
        icon: Icons.calendar_today,
        permission: 'view_own_appointments',
      ),
      NavigationItem(
        title: 'Book Appointment',
        route: '/patient/book',
        icon: Icons.add_circle,
        permission: 'book_appointments',
      ),
      NavigationItem(
        title: 'Profile',
        route: '/profile',
        icon: Icons.person,
        permission: 'view_own_profile',
      ),
    ];
  }

  /// Pharmacist navigation items
  static List<NavigationItem> _getPharmacistNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/pharmacist',
        icon: Icons.dashboard,
        permission: 'view_prescriptions',
      ),
      NavigationItem(
        title: 'Prescriptions',
        route: '/pharmacist/prescriptions',
        icon: Icons.medication,
        permission: 'view_prescriptions',
      ),
      NavigationItem(
        title: 'Inventory',
        route: '/pharmacist/inventory',
        icon: Icons.inventory,
        permission: 'manage_inventory',
      ),
      NavigationItem(
        title: 'Patients',
        route: '/pharmacist/patients',
        icon: Icons.people,
        permission: 'view_patient_medications',
      ),
    ];
  }

  /// Default navigation items
  static List<NavigationItem> _getDefaultNavigationItems() {
    return [
      NavigationItem(
        title: 'Dashboard',
        route: '/appointment',
        icon: Icons.dashboard,
        permission: 'view_appointments',
      ),
    ];
  }
}

/// Navigation item model
class NavigationItem {
  final String title;
  final String route;
  final IconData icon;
  final String permission;

  const NavigationItem({
    required this.title,
    required this.route,
    required this.icon,
    required this.permission,
  });
}

/// Widget that renders role-based navigation menu
class RoleBasedNavigationMenu extends StatelessWidget {
  final Function(String)? onItemTap;
  final bool showIcons;

  const RoleBasedNavigationMenu({
    super.key,
    this.onItemTap,
    this.showIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        final navigationItems = RoleBasedNavigation.getNavigationItems(context);

        return Column(
          children: navigationItems.map((item) {
            final hasPermission = authViewModel.hasPermission(item.permission);

            return ListTile(
              leading: showIcons ? Icon(item.icon) : null,
              title: Text(item.title),
              enabled: hasPermission,
              onTap: hasPermission
                  ? () {
                      if (onItemTap != null) {
                        onItemTap!(item.route);
                      } else {
                        RoleBasedNavigation.navigateIfAllowed(
                          context,
                          item.route,
                        );
                      }
                    }
                  : null,
              selected: GoRouterState.of(
                context,
              ).uri.path.startsWith(item.route),
            );
          }).toList(),
        );
      },
    );
  }
}

/// Widget that shows user role information
class UserRoleInfo extends StatelessWidget {
  const UserRoleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        if (!authViewModel.isAuthenticated) {
          return const SizedBox.shrink();
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text('Name: ${authViewModel.user?.fullName ?? 'Unknown'}'),
                Text('Role: ${authViewModel.getRoleDisplayName()}'),
                Text('Access Level: ${authViewModel.accessLevel}'),
                if (authViewModel.hasElevatedPrivileges)
                  const Chip(
                    label: Text('Admin'),
                    backgroundColor: Colors.red,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                if (authViewModel.isHealthcareProvider)
                  const Chip(
                    label: Text('Healthcare Provider'),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
