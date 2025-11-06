import 'package:flutter/material.dart';

/// A reusable status chip for appointment statuses
class DashboardStatusChip extends StatelessWidget {
  final String status;

  const DashboardStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = _getStatusColors(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: colors['dot'],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            status,
            style: TextStyle(
              color: colors['text'],
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Get colors for status
  Map<String, Color> _getStatusColors(String status) {
    switch (status) {
      case 'Upcoming':
        return {
          'text': const Color(0xFFF57C00),
          'dot': const Color(0xFFFFC107),
          'background': const Color(0xFFFFF3E0),
        };
      case 'Completed':
        return {
          'text': const Color(0xFF2E7D32),
          'dot': const Color(0xFF4CAF50),
          'background': const Color(0xFFE8F5E8),
        };
      case 'Cancelled':
        return {
          'text': const Color(0xFFD32F2F),
          'dot': const Color(0xFFF44336),
          'background': const Color(0xFFFFEBEE),
        };
      default:
        return {
          'text': const Color(0xFF666666),
          'dot': const Color(0xFF666666),
          'background': const Color(0xFFF5F5F5),
        };
    }
  }
}
