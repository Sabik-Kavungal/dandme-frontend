import 'package:flutter/material.dart';

/// A reusable tab widget for dashboard navigation
class DashboardTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DashboardTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected
                ? const Color(0xFF007BFF)
                : const Color(0xFF666666),
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
