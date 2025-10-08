import 'package:flutter/material.dart';
import 'package:a/core/responsive/universal_responsive_layout.dart';
import 'package:a/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:a/core/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/navigation_helper.dart';

import 'clinic_admin_dashboard_view.dart';
import 'appointments/appointments_dashboard_view.dart';
import 'clinic_settings_view.dart';
import 'doctor_details_content.dart';
import 'package:a/modules/appointment/views/new_appointment_view.dart';

class ClinicModuleView extends StatefulWidget {
  const ClinicModuleView({super.key});

  @override
  State<ClinicModuleView> createState() => _ClinicModuleViewState();
}

class _ClinicModuleViewState extends State<ClinicModuleView> {
  int _selectedIndex = 0; // Default to dashboard
  String? _doctorDetailsId; // Track which doctor details to show
  late ClinicViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ClinicViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final isClinicAdmin = authViewModel.hasRole('clinic_admin');

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<ClinicViewModel>(
        builder: (context, viewModel, child) {
          return UniversalResponsiveLayout(
            config: ModuleConfig(
              moduleName: 'Clinic Management',
              showNewAppointmentButton: isClinicAdmin,
              onNewAppointment: () {
                setState(() {
                  _selectedIndex = 2; // Navigate to New Appointment screen
                });
              },
              screens: [
                // Dashboard Screen (main screen)
                ClinicAdminDashboard(
                  onNavigate: (view) {
                    if (view == 'appointments') {
                      setState(() {
                        _selectedIndex = 1; // Navigate to Appointments screen
                      });
                    }
                  },
                ),

                // Appointments Dashboard (integrated from appointment module)
                AppointmentsDashboard(
                  onNavigate: (view) {
                    if (view == 'new_appointment') {
                      setState(() {
                        _selectedIndex =
                            2; // Navigate to New Appointment screen
                      });
                    } else if (view == 'appointment_details') {
                      // TODO: Handle appointment details navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Appointment Details - coming soon'),
                          backgroundColor: AppConstants.primaryColor,
                        ),
                      );
                    }
                  },
                ),

                // New Appointment Screen
                const NewAppointmentScreen(),

                // Management screens - Placeholder for future features
                const PlaceholderScreen(title: 'Doctors'),
                const PlaceholderScreen(title: 'Staff'),
                const PlaceholderScreen(title: 'Reports'),
                ClinicSettingsScreen(
                  onNavigate: (view) {
                    if (view.startsWith('doctor_details:')) {
                      setState(() {
                        _doctorDetailsId = view.split(':')[1];
                        _selectedIndex = 6; // Navigate to doctor details screen
                      });
                    }
                  },
                ),
                // Doctor Details Screen
                if (_doctorDetailsId != null)
                  DoctorDetailsContent(
                    doctorId: _doctorDetailsId!,
                    onBack: () {
                      setState(() {
                        _doctorDetailsId = null;
                        _selectedIndex = 5; // Go back to Settings
                      });
                    },
                  )
                else
                  const PlaceholderScreen(title: 'Select a Doctor'),
              ],
              navigationItems: const [
                ModuleNavItem(
                  title: 'Dashboard',
                  icon: Icons.home, // Will be overridden by _getIconForItem
                  index: 0,
                ),
                ModuleNavItem(
                  title: 'Appointments',
                  icon: Icons.people, // Will be overridden by _getIconForItem
                  index: 1,
                ),
                ModuleNavItem(
                  title: 'Doctors',
                  icon: Icons.work, // Will be overridden by _getIconForItem
                  index: 2,
                ),
                ModuleNavItem(
                  title: 'Staff',
                  icon: Icons
                      .attach_money, // Will be overridden by _getIconForItem
                  index: 3,
                ),
                ModuleNavItem(
                  title: 'Reports',
                  icon: Icons.schedule, // Will be overridden by _getIconForItem
                  index: 4,
                ),
                ModuleNavItem(
                  title: 'Settings',
                  icon: Icons.settings, // Will be overridden by _getIconForItem
                  index: 5,
                ),
                ModuleNavItem(
                  title: 'Doctor Details',
                  icon: Icons.circle, // Will be overridden by _getIconForItem
                  index: 6,
                ),
              ],
              customFloatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Navigate to new appointment screen
                  setState(() {
                    _selectedIndex = 2; // Navigate to New Appointment screen
                  });
                },
                backgroundColor: AppConstants.primaryColor,
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

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.construction,
            size: isMobile ? 48 : 64,
            color: AppConstants.secondaryColor,
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingS),
          Text(
            'Coming soon...',
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
