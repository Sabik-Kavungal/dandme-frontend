import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? DashboardConstants.primaryColor
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected
                  ? DashboardConstants.primaryColor
                  : DashboardConstants.textSecondaryColor,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
