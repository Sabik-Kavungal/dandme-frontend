import 'package:flutter/material.dart';

/// A reusable container widget for sections with impressive styling
class SectionContainer extends StatelessWidget {
  final Widget child;
  final double scaleFactor;
  final EdgeInsetsGeometry? padding;

  const SectionContainer({
    super.key,
    required this.child,
    this.scaleFactor = 1.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      padding: padding ?? EdgeInsets.all(8 * scaleFactor),
      child: child,
    );
  }
}
