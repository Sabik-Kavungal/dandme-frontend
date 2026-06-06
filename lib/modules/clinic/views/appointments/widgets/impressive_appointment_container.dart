import 'package:flutter/material.dart';

/// An impressive container for the appointment booking screen
class ImpressiveAppointmentContainer extends StatelessWidget {
  final Widget child;
  final double scaleFactor;

  const ImpressiveAppointmentContainer({
    super.key,
    required this.child,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(width: 1, color: const Color(0xFFE5E7EB)),
      ),
      child: child,
    );
  }
}
