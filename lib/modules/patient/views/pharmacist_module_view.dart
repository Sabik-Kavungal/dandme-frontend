// ============================================================================
// PHARMACIST MODULE USING UNIVERSAL RESPONSIVE LAYOUT
// ============================================================================
// This file provides the same responsive behavior as other modules but with
// pharmacist-specific screens and navigation.
// ============================================================================

import 'package:a/core/responsive/universal_responsive_layout.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:a/core/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:a/core/config/navigation_helper.dart';

class PharmacistModuleView extends StatefulWidget {
  const PharmacistModuleView({super.key});

  @override
  State<PharmacistModuleView> createState() => _PharmacistModuleViewState();
}

class _PharmacistModuleViewState extends State<PharmacistModuleView> {
  int _selectedIndex = 0; // Default to dashboard

  @override
  Widget build(BuildContext context) {
    return UniversalResponsiveLayout(
      config: ModuleConfig(
        moduleName: 'Pharmacist Portal',
        screens: const [
          PharmacistDashboardScreen(),
          PrescriptionsScreen(),
          InventoryScreen(),
          PatientsScreen(),
          ReportsScreen(),
          ProfileScreen(),
        ],
        navigationItems: const [
          ModuleNavItem(title: 'Dashboard', icon: Icons.dashboard, index: 0),
          ModuleNavItem(
            title: 'Prescriptions',
            icon: Icons.medication,
            index: 1,
          ),
          ModuleNavItem(title: 'Inventory', icon: Icons.inventory, index: 2),
          ModuleNavItem(title: 'Patients', icon: Icons.people, index: 3),
          ModuleNavItem(title: 'Reports', icon: Icons.bar_chart, index: 4),
          ModuleNavItem(title: 'Profile', icon: Icons.person, index: 5),
        ],
        customHeaderActions: [
          IconButton(
            onPressed: () => _showNotifications(context),
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
          ),
          IconButton(
            onPressed: () => _showQuickActions(context),
            icon: const Icon(Icons.flash_on),
            tooltip: 'Quick Actions',
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

  void _showNotifications(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pharmacist Notifications'),
        backgroundColor: AppConstants.secondaryColor,
      ),
    );
  }

  void _showQuickActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quick Actions'),
        content: const Text('Quick actions for pharmacists'),
        actions: [
          TextButton(
            onPressed: () => NavigationHelper.goBack(context),
            child: const Text('Close'),
          ),
        ],
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
              final authViewModel = Provider.of<AuthViewModel>(
                context,
                listen: false,
              );
              authViewModel.logout(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// PHARMACIST SCREENS
// ============================================================================

class PharmacistDashboardScreen extends StatelessWidget {
  const PharmacistDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'Pharmacist Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Welcome to your pharmacist portal',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medication, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Prescriptions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage prescriptions and medications',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory, size: 64, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Inventory',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage pharmacy inventory',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'Patients',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Manage patient records', style: TextStyle(color: Colors.grey)),
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
            'Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('View pharmacy reports', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.indigo),
          SizedBox(height: 16),
          Text(
            'Pharmacist Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage your profile information',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
