import 'package:flutter/material.dart';

/// A reusable status chip for appointment statuses
class DashboardStatusChip extends StatelessWidget {
  final String status;

  const DashboardStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = _getStatusColors(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors['background']!,
            colors['background']!.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(3), // Wolewise standard
        border: Border.all(
          color: (colors['dot'] as Color).withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: colors['dot'],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (colors['dot'] as Color).withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              color: colors['text'],
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  /// Get vivid, modern colors for status
  Map<String, Color> _getStatusColors(String status) {
    final s = status.trim().toLowerCase();
    
    if (s.contains('upcoming') || s.contains('scheduled')) {
      return {
        'text': const Color(0xFF0369A1), // Sky 700
        'dot': const Color(0xFF0EA5E9), // Sky 500
        'background': const Color(0xFFE0F2FE), // Sky 100
      };
    } else if (s.contains('progress') || s.contains('consulting')) {
      return {
        'text': const Color(0xFF7C3AED), // Violet 700
        'dot': const Color(0xFF8B5CF6), // Violet 500
        'background': const Color(0xFFEDE9FE), // Violet 100
      };
    } else if (s.contains('completed') || s.contains('done') || s.contains('success')) {
      return {
        'text': const Color(0xFF15803D), // Green 700
        'dot': const Color(0xFF22C55E), // Green 500
        'background': const Color(0xFFDCFCE7), // Green 100
      };
    } else if (s.contains('cancelled') || s.contains('rejected') || s.contains('no_show') || s.contains('no show')) {
      return {
        'text': const Color(0xFF475569), // Slate 600 (Muted for cancelled)
        'dot': const Color(0xFF94A3B8), // Slate 400
        'background': const Color(0xFFF1F5F9), // Slate 100
      };
    } else if (s.contains('pending') || s.contains('waiting')) {
      return {
        'text': const Color(0xFFB45309), // Amber 700
        'dot': const Color(0xFFF59E0B), // Amber 500
        'background': const Color(0xFFFEF3C7), // Amber 100
      };
    } else if (s.contains('arrived') || s.contains('confirmed') || s.contains('checked_in')) {
      return {
        'text': const Color(0xFF1E40AF), // Indigo 800 (Stronger for Arrived)
        'dot': const Color(0xFF3B82F6), // Blue 500
        'background': const Color(0xFFEFF6FF), // Blue 50
      };
    } else {
      return {
        'text': const Color(0xFF475569), // Slate 600
        'dot': const Color(0xFF64748B), // Slate 500
        'background': const Color(0xFFF1F5F9), // Slate 100
      };
    }
  }
}
