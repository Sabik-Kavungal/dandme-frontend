import 'package:flutter/material.dart';

/// A reusable consultation type pill widget
class DashboardConsultationPill extends StatelessWidget {
  final String type;

  const DashboardConsultationPill({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final config = _getTypeConfig(type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: config['backgroundColor'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            config['icon'] as IconData,
            size: 9,
            color: config['textColor'] as Color,
          ),
          const SizedBox(width: 2),
          Flexible(
            child: Text(
              type,
              style: TextStyle(
                color: config['textColor'] as Color,
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// Get configuration for consultation type
  Map<String, dynamic> _getTypeConfig(String type) {
    switch (type.toLowerCase()) {
      case 'clinic visit':
        return {
          'backgroundColor': const Color(0xFFE3F2FD),
          'textColor': const Color(0xFF1976D2),
          'icon': Icons.local_hospital,
        };
      case 'follow up':
        return {
          'backgroundColor': const Color(0xFFF3E5F5),
          'textColor': const Color(0xFF7B1FA2),
          'icon': Icons.calendar_today,
        };
      case 'online consultation':
        return {
          'backgroundColor': const Color(0xFFE8F5E8),
          'textColor': const Color(0xFF2E7D32),
          'icon': Icons.videocam,
        };
      default:
        return {
          'backgroundColor': const Color(0xFFE3F2FD),
          'textColor': const Color(0xFF1976D2),
          'icon': Icons.local_hospital,
        };
    }
  }
}
