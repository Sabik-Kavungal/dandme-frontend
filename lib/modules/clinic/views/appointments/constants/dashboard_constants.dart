import 'package:flutter/material.dart';

/// Constants for dashboard screen styling and configuration
class DashboardConstants {
  // Colors
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardBackgroundColor = Colors.white;
  static const Color primaryColor = Color(0xFF007BFF);
  static const Color primaryDarkColor = Color(0xFF0056B3);
  static const Color textPrimaryColor = Color(0xFF333333);
  static const Color textSecondaryColor = Color(0xFF666666);
  static const Color textHintColor = Color(0xFF999999);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Summary card colors
  static const Color todayColor = Color(0xFFB088F0);
  static const Color upcomingColor = Color(0xFFE0F0B0);
  static const Color completedColor = Color(0xFFB0F0B0);
  static const Color cancelledColor = Color(0xFFF0B0B0);

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
  static const double minTableWidth = 1000.0;
  static const double tableHeadingHeight = 36.0;
  static const double tableRowMinHeight = 42.0;
  static const double tableRowMaxHeight = 42.0;

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
