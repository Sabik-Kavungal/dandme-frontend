import 'package:flutter/material.dart';

/// Unified button widget for consistent styling across all appointment buttons
/// Supports: Pick Date, Add Patient, Book Now buttons
class UnifiedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double scaleFactor;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;

  const UnifiedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.scaleFactor = 1.0,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundColor != null
              ? [backgroundColor!, backgroundColor!]
              : [const Color(0xFF1E293B), const Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: (backgroundColor ?? const Color(0xFF1E293B)).withOpacity(
              0.25,
            ),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: foregroundColor ?? Colors.white,
          shadowColor: Colors.transparent,
          padding:
              padding ??
              EdgeInsets.symmetric(
                horizontal: 10 * scaleFactor,
                vertical: 6 * scaleFactor,
              ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 0,
        ),
        icon: isLoading
            ? SizedBox(
                height: 14 * scaleFactor,
                width: 14 * scaleFactor,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : icon != null
            ? Container(
                width: 20 * scaleFactor,
                height: 20 * scaleFactor,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFEF4444),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 12 * scaleFactor,
                  color: const Color(0xFFEF4444),
                ),
              )
            : const SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 12 * scaleFactor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// Factory method for Pick Date button
  factory UnifiedButton.pickDate({
    required VoidCallback? onPressed,
    required double scaleFactor,
  }) {
    return UnifiedButton(
      text: 'Pick Date',
      icon: Icons.calendar_today,
      onPressed: onPressed,
      scaleFactor: scaleFactor,
    );
  }

  /// Factory method for Add Patient button
  factory UnifiedButton.addPatient({
    required VoidCallback? onPressed,
    required double scaleFactor,
  }) {
    return UnifiedButton(
      text: 'Add Patient',
      icon: Icons.person_add,
      onPressed: onPressed,
      scaleFactor: scaleFactor,
    );
  }

  /// Factory method for Book Now button
  factory UnifiedButton.bookNow({
    required VoidCallback? onPressed,
    required double scaleFactor,
    bool isLoading = false,
  }) {
    return UnifiedButton(
      text: 'Book Now',
      icon: Icons.check_circle,
      onPressed: onPressed,
      scaleFactor: scaleFactor,
      isLoading: isLoading,
    );
  }
}
