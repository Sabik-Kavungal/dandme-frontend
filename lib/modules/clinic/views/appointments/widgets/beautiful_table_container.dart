import 'package:flutter/material.dart';

/// A clean and modern table container matching NewAppointmentScreen design
class BeautifulTableContainer extends StatelessWidget {
  final Widget child;
  final bool isTablet;

  const BeautifulTableContainer({
    super.key,
    required this.child,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.06),
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
