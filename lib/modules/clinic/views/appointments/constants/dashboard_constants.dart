import 'package:flutter/material.dart';

/// Constants for dashboard screen styling and configuration
class DashboardConstants {
  // Colors - Synchronized with ClinicAdminDashboard (Pixel Perfect Match)
  static const Color backgroundColor = Colors.white; // Pure white for pastel cards
  static const Color cardBackgroundColor = Colors.white;
  static const Color primaryColor = Color(0xFF3B82F6); // kBlueColor
  static const Color primaryDarkColor = Color(0xFF1D4ED8);
  static const Color textPrimaryColor = Color(0xFF1E293B); // kPrimaryText
  static const Color textSecondaryColor = Color(0xFF64758B); // kSecondaryText
  static const Color textHintColor = Color(0xFF94A3B8);
  static const Color borderColor = Color(0xFFE2E8F0); // kBorderColor
  static const Color dividerColor = Color(0xFFE2E8F0);

  // Summary card colors — exact pastel match from design screenshot
  static const Color todayColor     = Color(0xFFE0D7F5);
  static const Color arrivedColor   = Color(0xFFF5F2C8);
  static const Color completedColor = Color(0xFFD0F0D0);
  static const Color cancelledColor = Color(0xFFFAD5DA);

  // Border radius
  static const double cardBorderRadius = 8.0;
  static const double buttonBorderRadius = 5.0;
  static const double chipBorderRadius = 5.0;

  // Spacing
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 8.0;
  static const double largeSpacing = 16.0;
  static const double sectionSpacing = 10.0;

  // Font sizes
  static const double headingFontSize = 14.0;
  static const double bodyFontSize = 11.0;
  static const double smallFontSize = 10.0;
  static const double tinyFontSize = 8.0;

  // Table configuration
  static const double minTableWidth = 1100.0;
  static const double tableHeadingHeight = 32.0;
  static const double tableRowMinHeight = 52.0;
  static const double tableRowMaxHeight = 52.0;

  // Responsive breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 1024.0;
  static const double desktopBreakpoint = 1200.0;

  // Shadow
  static BoxShadow get cardShadow => BoxShadow(
    color: Colors.black.withOpacity(0.02),
    blurRadius: 4,
    offset: const Offset(0, 1),
  );

  // Footer text
  static const String footerText = 'Copyright © 2025 DrMe. All rights reserved';
}
