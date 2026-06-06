import 'package:flutter/material.dart';

/// A badge to display the booking mode (Slot vs Walk-in)
class BookingModeBadge extends StatelessWidget {
  final String? bookingMode;
  final double scaleFactor;

  const BookingModeBadge({
    super.key,
    required this.bookingMode,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final isWalkIn = bookingMode == 'walk_in';

    if (!isWalkIn) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8 * scaleFactor,
        vertical: 4 * scaleFactor,
      ),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.orange.shade200, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.directions_walk,
            size: 12 * scaleFactor,
            color: Colors.orange.shade700,
          ),
          SizedBox(width: 4 * scaleFactor),
          Text(
            'WALK-IN',
            style: TextStyle(
              fontSize: 9 * scaleFactor,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade800,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
