import 'package:flutter/material.dart';

/// Constants for appointment screen styling and values
class AppointmentConstants {
  // Colors
  static const Color primaryColor = Color(0xFF007BFF);
  static const Color primaryDarkColor = Color(0xFF0056B3);
  static const Color backgroundColor = Color(0xFFF8F8F8);
  static const Color cardBackgroundColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF333333);
  static const Color textSecondaryColor = Color(0xFF666666);
  static const Color textHintColor = Color(0xFF999999);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color dividerColor = Color(0xFFE0E0E0);
  static const Color successColor = Color(0xFF28A745);
  static const Color dangerColor = Color(0xFFE53935);
  static const Color selectedCardColor = Color(0xFFE3F2FD);

  // Follow-up status colors
  static const Color freeFollowUpColor = Colors.green;
  static const Color usedFollowUpColor = Colors.red;
  static const Color paidFollowUpColor = Colors.orange;
  static const Color noAppointmentColor = Colors.grey;

  // Border radius
  static const double cardBorderRadius = 10.0;
  static const double buttonBorderRadius = 8.0;
  static const double inputBorderRadius = 8.0;

  // Spacing
  static const double sectionSpacing = 10.0;
  static const double cardPadding = 14.0;
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 8.0;
  static const double largeSpacing = 16.0;

  // Font sizes
  static const double headingFontSize = 24.0;
  static const double subHeadingFontSize = 14.0;
  static const double bodyFontSize = 13.0;
  static const double smallFontSize = 11.0;

  // Shadow
  static BoxShadow get cardShadow => BoxShadow(
    color: Colors.black.withOpacity(0.04),
    blurRadius: 10,
    offset: const Offset(0, 2),
  );

  // Footer text
  static const String footerText = 'Copyright © 2025 DrMe. All rights reserved';

  // Validation messages
  static const String selectPatientError = '❌ Please select a patient';
  static const String selectDoctorError = '❌ Please select a doctor';
  static const String selectSlotError = '❌ Please select a time slot';

  // Success messages
  static const String appointmentCreatedSuccess =
      '✅ Appointment created successfully! Token: #';
  static const String followUpCreatedSuccess =
      '✅ Follow-up appointment created successfully! Token: #';

  // Date picker settings
  static const int maxDateRangeInDays = 365;
}
