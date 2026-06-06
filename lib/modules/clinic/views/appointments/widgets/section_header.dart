import 'package:flutter/material.dart';

/// A reusable section header widget with icon and impressive styling
class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final double scaleFactor;
  final Color? iconColor;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.scaleFactor = 1.0,
    this.iconColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = iconColor ?? const Color(0xFF6366F1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6 * scaleFactor),
              decoration: BoxDecoration(
                color: effectiveColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: effectiveColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Icon(icon, size: 14 * scaleFactor, color: effectiveColor),
            ),
            SizedBox(width: 8 * scaleFactor),
            Text(
              title,
              style: TextStyle(
                fontSize: 13 * scaleFactor,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E293B),
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
