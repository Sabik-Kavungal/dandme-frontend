import 'package:flutter/material.dart';
import 'package:a/core/responsive/universal_responsive_layout.dart';
import 'package:a/modules/superadmin/views/clinics/clinics_list_view.dart';
import 'package:a/modules/superadmin/views/dashboard/super_admin_dashboard_view.dart';
import 'package:a/modules/superadmin/views/doctors/doctors_list_view.dart';
import 'package:a/modules/superadmin/views/organizations/organizations_list_view.dart';
import 'package:a/modules/superadmin/views/users/users_management_view.dart';
import 'package:a/core/config/navigation_helper.dart';

class SuperAdminModuleView extends StatefulWidget {
  const SuperAdminModuleView({super.key});

  @override
  State<SuperAdminModuleView> createState() => _SuperAdminModuleViewState();
}

class _SuperAdminModuleViewState extends State<SuperAdminModuleView> {
  int _selectedIndex = 0; // Default to dashboard

  @override
  Widget build(BuildContext context) {
    return UniversalResponsiveLayout(
      config: ModuleConfig(
        moduleName: 'Super Admin',
        screens: const [
          SuperAdminDashboardScreen(),
          OrganizationsManagementScreen(),
          ClinicsManagementScreen(),
          DoctorsManagementScreen(),
          UsersManagementScreen(),
          SystemSettingsScreen(),
          ReportsScreen(),
          AuditLogScreen(),
        ],
        navigationItems: const [
          ModuleNavItem(title: 'Dashboard', icon: Icons.dashboard, index: 0),
          ModuleNavItem(title: 'Organizations', icon: Icons.business, index: 1),
          ModuleNavItem(title: 'Clinics', icon: Icons.local_hospital, index: 2),
          ModuleNavItem(
            title: 'Doctors',
            icon: Icons.medical_services,
            index: 3,
          ),
          ModuleNavItem(title: 'Users', icon: Icons.people, index: 4),
          ModuleNavItem(title: 'Settings', icon: Icons.settings, index: 5),
          ModuleNavItem(title: 'Reports', icon: Icons.bar_chart, index: 6),
          ModuleNavItem(title: 'Audit Log', icon: Icons.history, index: 7),
        ],
        customHeaderActions: [
          IconButton(
            onPressed: () => _showSystemAlerts(context),
            icon: const Icon(Icons.warning),
            tooltip: 'System Alerts',
          ),
          IconButton(
            onPressed: () => _showAdminTools(context),
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Admin Tools',
          ),
          IconButton(
            onPressed: () => _showQuickActions(context),
            icon: const Icon(Icons.flash_on),
            tooltip: 'Quick Actions',
          ),
        ],
        customFloatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateMenu(context),
          backgroundColor: Colors.red,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        onLogout: () => _handleLogout(context),
      ),
      selectedIndex: _selectedIndex,
      onNavigationChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  void _showSystemAlerts(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('System Alerts')));
  }

  void _showAdminTools(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Admin Tools')));
  }

  void _showQuickActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quick Actions'),
        content: const Text('Quick actions for super admin'),
        actions: [
          TextButton(
            onPressed: () => NavigationHelper.goBack(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCreateMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create New',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.business, color: Colors.blue),
              title: const Text('Organization'),
              onTap: () {
                NavigationHelper.goBack(context);
                NavigationHelper.goToAddOrganization(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital, color: Colors.green),
              title: const Text('Clinic'),
              onTap: () {
                NavigationHelper.goBack(context);
                NavigationHelper.goToAddClinic(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.orange),
              title: const Text('Doctor'),
              onTap: () {
                NavigationHelper.goBack(context);
                NavigationHelper.goToAddDoctor(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => NavigationHelper.goBack(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Add logout logic here
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// SUPER ADMIN SCREENS
// ============================================================================

class SuperAdminDashboardScreen extends StatelessWidget {
  const SuperAdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuperAdminDashboard(); // Use existing dashboard
  }
}

class OrganizationsManagementScreen extends StatelessWidget {
  const OrganizationsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrganizationsListScreen(); // Use existing organizations list
  }
}

class ClinicsManagementScreen extends StatelessWidget {
  const ClinicsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClinicsListScreen(); // Use existing clinics list
  }
}

class DoctorsManagementScreen extends StatelessWidget {
  const DoctorsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorsListScreen(); // Use existing doctors list
  }
}

class SystemSettingsScreen extends StatelessWidget {
  const SystemSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'System Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Configure system-wide settings',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 64, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'System Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Generate and view system reports',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class AuditLogScreen extends StatelessWidget {
  const AuditLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'Audit Log',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'View system activity and audit trail',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
