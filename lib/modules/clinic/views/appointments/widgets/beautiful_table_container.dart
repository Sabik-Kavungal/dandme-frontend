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
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E293B).withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFF1E293B).withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(width: 1, color: const Color(0xFFE2E8F0).withOpacity(0.6)),
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(6), child: child),
    );
  }
}
