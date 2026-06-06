import 'package:flutter/material.dart';

/// A reusable consultation type pill widget
class DashboardConsultationPill extends StatelessWidget {
  final String type;

  const DashboardConsultationPill({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final config = _getTypeConfig(type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (config['backgroundColor'] as Color),
            (config['backgroundColor'] as Color).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: (config['textColor'] as Color).withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            config['icon'] as IconData,
            size: 11,
            color: config['textColor'] as Color,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              type.replaceAll('_', ' ').toUpperCase(),
              style: TextStyle(
                color: config['textColor'] as Color,
                fontWeight: FontWeight.w800,
                fontSize: 10.5,
                letterSpacing: 1.2,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// Get vivid configuration for consultation type
  Map<String, dynamic> _getTypeConfig(String type) {
    final normalizedType = type.toLowerCase();

    if (normalizedType.contains('online') || normalizedType.contains('video')) {
      return {
        'backgroundColor': const Color(0xFFF0FDF4), // Green 50
        'textColor': const Color(0xFF15803D), // Green 700
        'icon': Icons.videocam_rounded,
      };
    } else if (normalizedType.contains('follow')) {
      return {
        'backgroundColor': const Color(0xFFFAF5FF), // Purple 50
        'textColor': const Color(0xFF7E22CE), // Purple 700
        'icon': Icons.loop_rounded,
      };
    } else {
      // Clinic Visit / Default
      return {
        'backgroundColor': const Color(0xFFEFF6FF), // Blue 50
        'textColor': const Color(0xFF1D4ED8), // Blue 700
        'icon': Icons.apartment_rounded,
      };
    }
  }
}
