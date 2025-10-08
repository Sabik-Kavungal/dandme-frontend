import 'package:a/core/responsive/universal_responsive_layout.dart';
import 'package:a/modules/appointment/viewmodels/appointment_dashboard_viewmodel.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/navigation_helper.dart';

import 'appointments_dashboard_view.dart';
import 'appointment_details_view.dart';
import 'new_appointment_view.dart';

class AppointmentModuleView extends StatefulWidget {
  const AppointmentModuleView({super.key});

  @override
  State<AppointmentModuleView> createState() => _AppointmentModuleViewState();
}

class _AppointmentModuleViewState extends State<AppointmentModuleView> {
  int _selectedIndex = 1; // Default to appointments dashboard
  late AppointmentDashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AppointmentDashboardViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    _viewModel.initializeDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<AppointmentDashboardViewModel>(
        builder: (context, viewModel, child) {
          return UniversalResponsiveLayout(
            config: ModuleConfig(
              moduleName: 'Appointments',
              screens: [
                // Dashboard Screen
                const DashboardScreen(),

                // Appointments Dashboard (main screen)
                AppointmentsDashboard(
                  onNavigate: (view) {
                    if (view == 'appointment_details') {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    } else if (view == 'new_appointment') {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }
                  },
                ),

                // Appointment Details Screen
                const AppointmentDetailsScreen(),

                // New Appointment Screen
                const NewAppointmentScreen(),

                // Other screens - Placeholder for future features
                const PlaceholderScreen(title: 'Roles'),
                const PlaceholderScreen(title: 'Payroll'),
                const PlaceholderScreen(title: 'Reports'),
                const PlaceholderScreen(title: 'Settings'),
              ],
              navigationItems: const [
                ModuleNavItem(
                  title: 'Dashboard',
                  icon: Icons.dashboard,
                  index: 0,
                ),
                ModuleNavItem(
                  title: 'Appointments',
                  icon: Icons.calendar_today,
                  index: 1,
                ),
                ModuleNavItem(title: 'Roles', icon: Icons.people, index: 4),
                ModuleNavItem(title: 'Payroll', icon: Icons.payment, index: 5),
                ModuleNavItem(
                  title: 'Reports',
                  icon: Icons.bar_chart,
                  index: 6,
                ),
                ModuleNavItem(
                  title: 'Settings',
                  icon: Icons.settings,
                  index: 7,
                ),
              ],
              customFloatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3; // Navigate to new appointment
                  });
                },
                backgroundColor: Colors.black,
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
        },
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    // Handle logout logic
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

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Overview and analytics will be displayed here',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.construction, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Coming soon...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
