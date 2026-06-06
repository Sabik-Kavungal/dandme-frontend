// ============================================================================
// PATIENT MODULE USING UNIVERSAL RESPONSIVE LAYOUT
// ============================================================================
// This file provides the same responsive behavior as other modules but with
// patient-specific screens and navigation.
// ============================================================================

import 'package:drandme/core/responsive/universal_responsive_layout.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/core/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:drandme/core/config/navigation_helper.dart';

class PatientModuleView extends StatefulWidget {
  const PatientModuleView({super.key});

  @override
  State<PatientModuleView> createState() => _PatientModuleViewState();
}

class _PatientModuleViewState extends State<PatientModuleView> {
  int _selectedIndex = 0; // Default to dashboard

  @override
  Widget build(BuildContext context) {
    return UniversalResponsiveLayout(
      config: ModuleConfig(
        moduleName: 'Patient Portal',
        screens: const [
          PatientDashboardScreen(),
          PatientAppointmentsScreen(),
          PatientMedicalHistoryScreen(),
          PatientPrescriptionsScreen(),
          PatientBillingScreen(),
          PatientProfileScreen(),
        ],
        navigationItems: const [
          ModuleNavItem(title: 'Dashboard', icon: Icons.dashboard, index: 0),
          ModuleNavItem(
            title: 'Appointments',
            icon: Icons.calendar_today,
            index: 1,
          ),
          ModuleNavItem(
            title: 'Medical History',
            icon: Icons.history,
            index: 2,
          ),
          ModuleNavItem(
            title: 'Prescriptions',
            icon: Icons.medication,
            index: 3,
          ),
          ModuleNavItem(title: 'Billing', icon: Icons.payment, index: 4),
          ModuleNavItem(title: 'Profile', icon: Icons.person, index: 5),
        ],
        customHeaderActions: [
          IconButton(
            onPressed: () => _showNotifications(context),
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
          ),
          IconButton(
            onPressed: () => _showEmergency(context),
            icon: const Icon(Icons.emergency),
            tooltip: 'Emergency',
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
        content: Text('Patient Notifications'),
        backgroundColor: AppConstants.successColor,
      ),
    );
  }

  void _showEmergency(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency Contact'),
        content: const Text('Call 911 for medical emergencies'),
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
// PATIENT SCREENS
// ============================================================================

class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.dashboard,
            size: isMobile ? 48 : 64,
            color: AppConstants.successColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'Patient Dashboard',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'Welcome to your patient portal',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: AppConstants.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PatientAppointmentsScreen extends StatelessWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'My Appointments',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'View and manage your appointments',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PatientMedicalHistoryScreen extends StatelessWidget {
  const PatientMedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'Medical History',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'View your medical records',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PatientPrescriptionsScreen extends StatelessWidget {
  const PatientPrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medication, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'Prescriptions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('View your prescriptions', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class PatientBillingScreen extends StatelessWidget {
  const PatientBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payment, size: 64, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'Billing',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'View your bills and payments',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.indigo),
          SizedBox(height: 16),
          Text(
            'Patient Profile',
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
