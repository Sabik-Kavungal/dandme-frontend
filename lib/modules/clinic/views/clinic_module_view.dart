import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_patients_viewmodel.dart';
import 'package:drandme/modules/clinic/views/appointments/new_appointment_view_refactored.dart';
import 'package:flutter/material.dart';
import 'package:drandme/core/responsive/universal_responsive_layout.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/core/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/config/navigation_helper.dart';

import 'clinic_admin_dashboard_view.dart';
import 'appointments/appointment_details_view.dart';
import 'appointments/appointments_dashboard_view_refactored.dart';
import 'clinic_settings_view.dart';
import 'doctor_details_content.dart';
import 'doctors/clinic_doctors_list_view.dart';
import 'patients/clinic_patients_list_view.dart';
import 'patients/clinic_patient_details_view.dart' as import_patient;
import 'package:drandme/modules/clinic/viewmodels/clinic_patients_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_doctors_viewmodel.dart';
import 'package:drandme/core/widgets/logout_dialog.dart';

class ClinicModuleView extends StatefulWidget {
  const ClinicModuleView({super.key});

  @override
  State<ClinicModuleView> createState() => _ClinicModuleViewState();
}

class _ClinicModuleViewState extends State<ClinicModuleView> {
  int _selectedIndex = 0; // Default to dashboard
  String? _doctorDetailsId; // Track which doctor details to show
  String? _patientDetailsId; // Track which patient details to show
  String? _selectedAppointmentId;
  String? _selectedClinicPatientId;
  late ClinicViewModel _viewModel;
  late ClinicPatientsViewModel _patientsViewModel;
  late ClinicDoctorsViewModel _doctorsViewModel;
  late AppointmentDashboardViewModel _appointmentDashboardViewModel;

  @override
  void initState() {
    super.initState();
    final authVM = Provider.of<AuthViewModel>(context, listen: false);
    _viewModel = ClinicViewModel();
    _patientsViewModel = ClinicPatientsViewModel(authVM);
    _doctorsViewModel = ClinicDoctorsViewModel(authVM);
    _appointmentDashboardViewModel = AppointmentDashboardViewModel(authVM);
    
    // ✅ PREFETCH: Start loading dashboard data immediately after login
    // This ensures that by the time the user clicks the Appointments tab,
    // the data is either already there or very close to finished.
    _appointmentDashboardViewModel.initializeSimpleDashboard();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final isClinicAdmin = authViewModel.hasRole('clinic_admin');

    final navigationItems = const [
      ModuleNavItem(
        title: 'Dashboard',
        icon: Icons.grid_view_rounded,
        index: 0,
      ),
      ModuleNavItem(
        title: 'Appointments',
        icon: Icons.calendar_today_rounded,
        index: 1,
      ),
      ModuleNavItem(
        title: 'Patients',
        icon: Icons.personal_injury_rounded,
        index: 10,
      ),
      ModuleNavItem(
        title: 'Staff',
        icon: Icons.people_alt_rounded,
        index: 2,
        children: [
          ModuleNavItem(
            title: 'Doctors',
            icon: Icons.medical_services_rounded,
            index: 3,
          ),
          ModuleNavItem(
            title: 'Nurses',
            icon: Icons.monitor_heart_rounded,
            index: 4,
          ),
          ModuleNavItem(
            title: 'Admin',
            icon: Icons.admin_panel_settings_rounded,
            index: 5,
          ),
        ],
      ),
      ModuleNavItem(
        title: 'Reports',
        icon: Icons.bar_chart_rounded,
        index: 6,
        children: [
          ModuleNavItem(
            title: 'Financial',
            icon: Icons.attach_money_rounded,
            index: 7,
          ),
          ModuleNavItem(
            title: 'Medical',
            icon: Icons.analytics_rounded,
            index: 8,
          ),
        ],
      ),
      ModuleNavItem(title: 'Settings', icon: Icons.settings_rounded, index: 9),
    ];

    // Indices for hidden/dynamic screens
    final doctorDetailsIndex = 11;
    final newAppointmentIndex = 12;
    final appointmentDetailsIndex = 13;
    final patientDetailsIndex = 14;

    final screens = [
      // 0: Dashboard Screen
      ClinicAdminDashboard(
        onNavigate: (view) {
          if (view == 'appointments') {
            if (!mounted) return;
            setState(() {
              _selectedIndex = 1;
            });
          }
        },
      ),

      // 1: Appointments Dashboard
      AppointmentsDashboard(
        onNavigate: (view) {
          if (view == 'new_appointment') {
            if (!mounted) return;
            setState(() {
              _doctorDetailsId = null;
              _patientDetailsId = null;
              _selectedAppointmentId = null;
              _selectedClinicPatientId = null;
              _selectedIndex = newAppointmentIndex;
            });
            return;
          }

          if (view.startsWith('appointment_details:')) {
            final payload = view.substring('appointment_details:'.length);
            final parts = payload.split('|');

            if (parts.isNotEmpty && parts[0].isNotEmpty) {
              final appointmentId = parts[0];
              final clinicPatientId =
                  parts.length >= 2 && parts[1].isNotEmpty ? parts[1] : null;

              if (!mounted) return;
              setState(() {
                _doctorDetailsId = null;
                _patientDetailsId = null;
                _selectedAppointmentId = appointmentId;
                _selectedClinicPatientId = clinicPatientId;
                _selectedIndex = appointmentDetailsIndex;
              });
            }
          }
        },
      ),

      // 2: Staff Parent (Placeholder or redirect)
      const PlaceholderScreen(title: 'Staff Overview'),

      // 3: Doctors List View
      ClinicDoctorsListView(
        onNavigate: (view) {
          if (view.startsWith('doctor_details:')) {
            if (!mounted) return;
            setState(() {
              _doctorDetailsId = view.split(':')[1];
              _selectedIndex = doctorDetailsIndex;
            });
          }
        },
      ),

      // 4: Nurses
      const PlaceholderScreen(title: 'Nurses Directory'),

      // 5: Admin
      const PlaceholderScreen(title: 'Admin Staff'),

      // 6: Reports Parent
      const PlaceholderScreen(title: 'Reports Dashboard'),

      // 7: Financial Reports
      const PlaceholderScreen(title: 'Financial Reports'),

      // 8: Medical Reports
      const PlaceholderScreen(title: 'Medical Reports'),

      // 9: Settings
      ClinicSettingsScreen(
        onNavigate: (view) {
          // Handle settings nav if needed
        },
      ),

      // 10: Patients List
      ClinicPatientsListView(
        onNavigate: (view) {
          if (view.startsWith('patient_details:')) {
            if (!mounted) return;
            setState(() {
              _patientDetailsId = view.split(':')[1];
              _selectedIndex = patientDetailsIndex;
            });
          }
        },
      ),

      // 10: Doctor Details
      if (_doctorDetailsId != null)
        DoctorDetailsContent(doctorId: _doctorDetailsId!)
      else
        const PlaceholderScreen(title: 'Select a Doctor'),

      // 11: New Appointment
      NewAppointmentScreen(
        onNavigate: (view) {
          if (view == 'appointments_list') {
            if (!mounted) return;
            setState(() {
              _selectedIndex = 1; // Back to AppointmentsDashboard
            });
            // ✅ Trigger REFRESH to show the new appointment
            _appointmentDashboardViewModel.refreshSimpleAppointments();
          }
        },
      ),

      // 12: Appointment Details
      if (_selectedAppointmentId != null && _selectedClinicPatientId != null)
        AppointmentDetailsScreen(
          appointmentId: _selectedAppointmentId!,
          clinicPatientId: _selectedClinicPatientId!,
        )
      else if (_selectedAppointmentId != null)
        // Fallback if patient ID is missing (should verify if this constructor allows null patientId?)
        // Checked previous code: AppointmentDetailsScreen requires clinicPatientId
        Container(child: Center(child: Text("Error: Missing Patient ID")))
      else
        const PlaceholderScreen(title: 'Select an Appointment'),

      // 13 / 14: Patient Details
      if (_patientDetailsId != null)
        import_patient.ClinicPatientDetailsView(patientId: _patientDetailsId!)
      else
        const PlaceholderScreen(title: 'Select a Patient'),
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _viewModel),
        ChangeNotifierProvider.value(value: _patientsViewModel),
        ChangeNotifierProvider.value(value: _doctorsViewModel),
        ChangeNotifierProvider.value(value: _appointmentDashboardViewModel),
      ],
      child: Consumer<ClinicViewModel>(
        builder: (context, viewModel, child) {
          return UniversalResponsiveLayout(
            config: ModuleConfig(
              moduleName: 'Clinic Management',
              showNewAppointmentButton: isClinicAdmin,
              onNewAppointment: () {
                if (!mounted) return;
                setState(() {
                  _doctorDetailsId = null;
                  _patientDetailsId = null;
                  _selectedAppointmentId = null;
                  _selectedClinicPatientId = null;
                  _selectedIndex = newAppointmentIndex;
                });
              },
              extraScreenTitles: {
                newAppointmentIndex: 'New Appointment',
                appointmentDetailsIndex: 'Appointment Details',
                doctorDetailsIndex: 'Doctor Details',
                patientDetailsIndex: 'Patient Details',
              },
              screenParentMapping: {
                doctorDetailsIndex: 3, // Map Doctor Details -> Doctors List
                patientDetailsIndex: 10, // Map Patient Details -> Patients List
                appointmentDetailsIndex:
                    1, // Map Appointment Details -> Appointments Dashboard
                newAppointmentIndex:
                    1, // Map New Appointment -> Appointments Dashboard (optional)
              },
              screens: screens,
              navigationItems: navigationItems,
              onLogout: () => _handleLogout(context),
            ),
            selectedIndex: _selectedIndex,
            onNavigationChanged: (index) {
              if (!mounted) return;
              
              // ✅ Refresh appointments dashboard when returning to appointments tab (1) from sub-pages
              if (index == 1 && (_selectedIndex == 13 || _selectedIndex == 12)) {
                _appointmentDashboardViewModel.refreshSimpleAppointments();
                _appointmentDashboardViewModel.loadClinicDashboard();
              }

              setState(() {
                _selectedIndex = index;
                if (index != doctorDetailsIndex) {
                  _doctorDetailsId = null;
                }
                if (index != patientDetailsIndex) {
                  _patientDetailsId = null;
                }
                if (index != appointmentDetailsIndex) {
                  _selectedAppointmentId = null;
                  _selectedClinicPatientId = null;
                }
              });
            },
          );
        },
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => LogoutDialog(
        onLogout: () async {
          final authViewModel = Provider.of<AuthViewModel>(
            context,
            listen: false,
          );
          await authViewModel.logout(context);
          if (context.mounted) {
            NavigationHelper.goToLogin(context);
          }
        },
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
