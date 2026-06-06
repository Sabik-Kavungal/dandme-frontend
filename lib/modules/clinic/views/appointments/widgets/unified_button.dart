import 'package:flutter/material.dart';
import 'package:drandme/core/widgets/app_loader.dart';

/// A unified button component that adheres to the Classy Slate design language.
/// Provides factory constructors for common button types used in the appointment flow.
class UnifiedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final bool isPrimary;
  final bool isLoading;
  final double scaleFactor;
  final Color? customColor;
  final bool isSmall;

  const UnifiedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.isPrimary = true,
    this.isLoading = false,
    this.scaleFactor = 1.0,
    this.customColor,
    this.isSmall = false,
  });

  /// Factory for a "Pick Date" button (Classy Slate Outlined style)
  factory UnifiedButton.pickDate({
    required VoidCallback onPressed,
    double scaleFactor = 1.0,
  }) {
    return UnifiedButton(
      onPressed: onPressed,
      text: 'Pick Date',
      icon: Icons.calendar_month,
      isPrimary: false, // Outlined
      scaleFactor: scaleFactor,
      isSmall: true,
      customColor: const Color(0xFF0F766E), // Teal 700 - Classy Accent
    );
  }

  /// Factory for a general "Primary" action button
  factory UnifiedButton.primary({
    required VoidCallback onPressed,
    required String text,
    double scaleFactor = 1.0,
    bool isLoading = false,
  }) {
    return UnifiedButton(
      onPressed: onPressed,
      text: text,
      isPrimary: true,
      scaleFactor: scaleFactor,
      isLoading: isLoading,
    );
  }

  /// Factory for "Add Patient" button
  factory UnifiedButton.addPatient({
    required VoidCallback onPressed,
    double scaleFactor = 1.0,
  }) {
    return UnifiedButton(
      onPressed: onPressed,
      text: 'New Patient',
      icon: Icons.person_add,
      isPrimary: true, // Primary action
      scaleFactor: scaleFactor,
      isSmall: true, // Compact
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return _buildPrimaryButton(context);
    } else {
      return _buildOutlinedButton(context);
    }
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return SizedBox(
      height: (isSmall ? 36 : 48) * scaleFactor,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E293B), // Slate 900
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: const Color(0xFF1E293B).withOpacity(0.3),
          padding: EdgeInsets.symmetric(
            horizontal: (isSmall ? 16 : 24) * scaleFactor,
            vertical: 0,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        child: isLoading
            ? SizedBox(
                width: 20 * scaleFactor,
                height: 20 * scaleFactor,
                child: AppLoader(size: 20 * scaleFactor, color: Colors.white),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18 * scaleFactor),
                    SizedBox(width: 8 * scaleFactor),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: (isSmall ? 13 : 15) * scaleFactor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context) {
    final color = customColor ?? const Color(0xFF334155); // Slate 700 default

    return SizedBox(
      height: (isSmall ? 32 : 44) * scaleFactor,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color.withOpacity(0.3), width: 1),
          padding: EdgeInsets.symmetric(
            horizontal: (isSmall ? 12 : 20) * scaleFactor,
            vertical: 0,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          backgroundColor: Colors.transparent, // Clean look
        ),
        child: isLoading
            ? SizedBox(
                width: 20 * scaleFactor,
                height: 20 * scaleFactor,
                child: AppLoader(size: 20 * scaleFactor, color: color),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: (isSmall ? 14 : 16) * scaleFactor),
                    SizedBox(width: 6 * scaleFactor),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: (isSmall ? 12 : 14) * scaleFactor,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
