// ============================================================================
// DOCTOR MODULE USING UNIVERSAL RESPONSIVE LAYOUT
// ============================================================================
// This file shows how to use the UniversalResponsiveLayout for the doctor role.
// It provides the same responsive behavior as the appointment module but with
// doctor-specific screens and navigation.
// ============================================================================

import 'package:a/core/responsive/universal_responsive_layout.dart';
import 'package:a/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:a/core/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:a/core/config/navigation_helper.dart';

class DoctorModuleView extends StatefulWidget {
  const DoctorModuleView({super.key});

  @override
  State<DoctorModuleView> createState() => _DoctorModuleViewState();
}

class _DoctorModuleViewState extends State<DoctorModuleView> {
  int _selectedIndex = 0; // Default to dashboard
  late DoctorViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DoctorViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<DoctorViewModel>(
        builder: (context, viewModel, child) {
          return UniversalResponsiveLayout(
            config: ModuleConfig(
              moduleName: 'Doctor Portal',
              screens: const [
                DoctorDashboardScreen(),
                DoctorPatientsScreen(),
                DoctorScheduleScreen(),
                DoctorPrescriptionsScreen(),
                DoctorReportsScreen(),
                DoctorProfileScreen(),
              ],
              navigationItems: const [
                ModuleNavItem(
                  title: 'Dashboard',
                  icon: Icons.dashboard,
                  index: 0,
                ),
                ModuleNavItem(title: 'Patients', icon: Icons.people, index: 1),
                ModuleNavItem(
                  title: 'Schedule',
                  icon: Icons.calendar_today,
                  index: 2,
                ),
                ModuleNavItem(
                  title: 'Prescriptions',
                  icon: Icons.medication,
                  index: 3,
                ),
                ModuleNavItem(
                  title: 'Reports',
                  icon: Icons.bar_chart,
                  index: 4,
                ),
                ModuleNavItem(title: 'Profile', icon: Icons.person, index: 5),
              ],
              customHeaderActions: [
                IconButton(
                  onPressed: () => _showNotifications(context),
                  icon: const Icon(Icons.notifications_active),
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
        },
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Doctor Notifications'),
        backgroundColor: AppConstants.primaryColor,
      ),
    );
  }

  void _showQuickActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quick Actions'),
        content: const Text('Quick actions for doctors'),
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
// DOCTOR SCREENS
// ============================================================================

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

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
            color: AppConstants.primaryColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'Doctor Dashboard',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'Welcome to your doctor portal',
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

class DoctorPatientsScreen extends StatelessWidget {
  const DoctorPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
            size: isMobile ? 48 : 64,
            color: AppConstants.successColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'My Patients',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'Manage your patient list',
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

class DoctorScheduleScreen extends StatelessWidget {
  const DoctorScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today,
            size: isMobile ? 48 : 64,
            color: AppConstants.warningColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'My Schedule',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'View and manage your appointments',
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

class DoctorPrescriptionsScreen extends StatelessWidget {
  const DoctorPrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medication,
            size: isMobile ? 48 : 64,
            color: AppConstants.secondaryColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'Prescriptions',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'Manage patient prescriptions',
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

class DoctorReportsScreen extends StatelessWidget {
  const DoctorReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart,
            size: isMobile ? 48 : 64,
            color: AppConstants.infoColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'Reports',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'View medical reports and analytics',
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

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: isMobile ? 48 : 64,
            color: AppConstants.primaryColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            'Doctor Profile',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'Manage your profile information',
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
