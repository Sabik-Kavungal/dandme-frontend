// ============================================================================
// ORGANIZATION ADMIN MODULE USING UNIVERSAL RESPONSIVE LAYOUT
// ============================================================================
// This file provides the same responsive behavior as other modules but with
// organization admin-specific screens and navigation.
// ============================================================================

import 'package:a/core/responsive/universal_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:a/core/config/navigation_helper.dart';

class OrganizationAdminModuleView extends StatefulWidget {
  const OrganizationAdminModuleView({super.key});

  @override
  State<OrganizationAdminModuleView> createState() =>
      _OrganizationAdminModuleViewState();
}

class _OrganizationAdminModuleViewState extends State<OrganizationAdminModuleView> {
  int _selectedIndex = 0; // Default to dashboard

  @override
  Widget build(BuildContext context) {
    return UniversalResponsiveLayout(
      config: ModuleConfig(
        moduleName: 'Organization Admin',
        screens: const [
          OrgDashboardScreen(),
          OrgClinicsScreen(),
          OrgDoctorsScreen(),
          OrgStaffScreen(),
          OrgReportsScreen(),
          OrgSettingsScreen(),
        ],
        navigationItems: const [
          ModuleNavItem(title: 'Dashboard', icon: Icons.dashboard, index: 0),
          ModuleNavItem(title: 'Clinics', icon: Icons.local_hospital, index: 1),
          ModuleNavItem(
            title: 'Doctors',
            icon: Icons.medical_services,
            index: 2,
          ),
          ModuleNavItem(title: 'Staff', icon: Icons.people, index: 3),
          ModuleNavItem(title: 'Reports', icon: Icons.bar_chart, index: 4),
          ModuleNavItem(title: 'Settings', icon: Icons.settings, index: 5),
        ],
        customHeaderActions: [
          IconButton(
            onPressed: () => _showOrgAlerts(context),
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
          ),
          IconButton(
            onPressed: () => _showOrgTools(context),
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Org Tools',
          ),
        ],
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

  void _showOrgAlerts(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Organization Alerts')));
  }

  void _showOrgTools(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Organization Tools')));
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
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
// ORGANIZATION ADMIN SCREENS
// ============================================================================

class OrgDashboardScreen extends StatelessWidget {
  const OrgDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Organization Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage your organization',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class OrgClinicsScreen extends StatelessWidget {
  const OrgClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_hospital, size: 64, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Clinics Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage organization clinics',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class OrgDoctorsScreen extends StatelessWidget {
  const OrgDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medical_services, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'Doctors Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage organization doctors',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class OrgStaffScreen extends StatelessWidget {
  const OrgStaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'Staff Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage organization staff',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class OrgReportsScreen extends StatelessWidget {
  const OrgReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 64, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'Organization Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'View organization analytics',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class OrgSettingsScreen extends StatelessWidget {
  const OrgSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Organization Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Configure organization settings',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
