import 'package:flutter/material.dart';

/// Helper functions for dashboard operations
class DashboardHelpers {
  /// Format date to display string
  static String formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  /// Show date picker dialog with custom theme
  static Future<DateTime?> showDatePickerDialog({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6366F1),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF374151),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  /// Get greeting based on time of day
  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  /// Check if screen is mobile
  static bool isMobile(BoxConstraints constraints) {
    return constraints.maxWidth < 600;
  }

  /// Check if screen is tablet
  static bool isTablet(BoxConstraints constraints) {
    return constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
  }

  /// Check if screen is desktop
  static bool isDesktop(BoxConstraints constraints) {
    return constraints.maxWidth >= 1024;
  }

  /// Handle navigation to appointment details
  static void handleNavigation({
    required BuildContext context,
    required dynamic
    appointment, // Using dynamic to support different model versions if any
    required dynamic viewModel,
    String? Function(String)? onNavigate,
  }) {
    if (appointment.id == null || appointment.id.isEmpty) return;

    // Explicit access with fallbacks
    String? clinicPatientId =
        appointment.clinicPatientId ?? appointment.patientId;

    if (onNavigate != null) {
      final patientIdPart = clinicPatientId ?? '';
      final navigationPayload =
          'appointment_details:${appointment.id}|$patientIdPart';
      onNavigate(navigationPayload);
      viewModel.loadSimpleAppointments?.call(refresh: true);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text("Appointment Details (Fallback)")),
        ),
        // Note: Real routing should be handled by the app's router
      ),
    );
  }
}
