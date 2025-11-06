import 'package:flutter/material.dart';

/// Helper functions for appointment-related operations
class AppointmentHelpers {
  /// Format time from 24-hour to 12-hour format
  static String formatTime(String time24) {
    try {
      // Handle ISO timestamp format (0000-01-01T14:45:00Z)
      if (time24.contains('T')) {
        final dateTime = DateTime.parse(time24);
        final hour = dateTime.hour;
        final minute = dateTime.minute;
        final period = hour >= 12 ? 'PM' : 'AM';
        final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
        return '$hour12:${minute.toString().padLeft(2, '0')} $period';
      }

      // Handle HH:MM format
      final parts = time24.split(':');
      int hour = int.parse(parts[0]);
      final minute = parts[1].split('.')[0].split('Z')[0].trim();
      final period = hour >= 12 ? 'PM' : 'AM';
      hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$hour:$minute $period';
    } catch (e) {
      return time24; // Return original if parsing fails
    }
  }

  /// Get user-friendly label for consultation type
  static String getConsultationTypeLabel(String value) {
    switch (value) {
      case 'clinic_visit':
        return '🏥 Clinic Visit';
      case 'video_consultation':
        return '💻 Video Consultation';
      case 'follow-up-via-clinic':
        return '🔄 Follow-Up (Clinic)';
      case 'follow-up-via-video':
        return '🔄 Follow-Up (Video)';
      default:
        return value;
    }
  }

  /// Show error snackbar
  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show success snackbar
  static void showSuccessSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show date picker dialog
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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF007BFF),
              onPrimary: Colors.white,
              onSurface: Color(0xFF333333),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF007BFF),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
