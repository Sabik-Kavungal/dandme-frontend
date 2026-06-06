import 'dart:math' as dart_math;

import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';

/// A reusable time slot card widget (Web version)
/// reusable time slot card widget (Web version)
class TimeSlotCard extends StatelessWidget {
  final DoctorTimeSlotResponse slot;
  final bool isSelected;
  final bool isCurrentSlot; // ✅ New flag
  final VoidCallback? onTap;
  final double scaleFactor;

  const TimeSlotCard({
    super.key,
    required this.slot,
    required this.isSelected,
    this.isCurrentSlot = false, // Default false
    this.onTap,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = _formatTime(slot.startTime);

    // Use backend flags directly
    final isBookable = slot.isBookable;
    final status = slot.status;

    // Determine disabled state based on backend flags
    // If not bookable, it's disabled. Use status to determine why (blocked, booked, etc.)
    final isDisabled = !isBookable;

    // Sidebar-style colors
    Color backgroundColor;
    Color textColor;
    Color borderColor; // Not nullable

    if (isCurrentSlot) {
      // ✅ Current Booking (Indigo)
      backgroundColor = const Color(0xFFEEF2FF);
      textColor = const Color(0xFF4F46E5);
      borderColor = const Color(0xFFC7D2FE);
    } else if (!isBookable) {
      if (status == 'blocked') {
        if (slot.displayMessage.toLowerCase().contains('leave')) {
          // 🏖️ Doctor on Leave (Amber/Orange - Warning/Hospitality)
          backgroundColor = const Color(0xFFFFF7ED); // Amber 50
          textColor = const Color(0xFFC2410C); // Orange 700
          borderColor = const Color(0xFFFED7AA); // Orange 200
        } else {
          // 🕰️ Past Time / Blocked (Slate/Gray)
          backgroundColor = const Color(0xFFF8FAFC); // Slate 50
          textColor = const Color(0xFF94A3B8); // Slate 400
          borderColor = const Color(0xFFE2E8F0); // Slate 200
        }
      } else {
        // 🚫 Fully Booked (Red)
        backgroundColor = const Color(0xFFFEF2F2); // Red 50
        textColor = const Color(0xFFDC2626); // Red 600
        borderColor = const Color(0xFFFECACA); // Red 200
      }
    } else if (isSelected) {
      // ✅ Selected (Slate Dark)
      backgroundColor = const Color(0xFF1E293B);
      textColor = Colors.white;
      borderColor = const Color(0xFF1E293B);
    } else {
      // ✨ Available (Emerald Green)
      backgroundColor = const Color(0xFFECFDF5); // Emerald 50
      textColor = const Color(0xFF065F46); // Emerald 800
      borderColor = const Color(0xFFA7F3D0); // Emerald 200
    }

    return InkWell(
      onTap: (isDisabled && !isCurrentSlot) || isCurrentSlot ? null : onTap,
      child: Opacity(
        opacity: (isDisabled && !isCurrentSlot) ? 0.6 : 1.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: borderColor,
                  width: (isCurrentSlot || (!isBookable && status != 'blocked'))
                      ? 2
                      : 1,
                ),
                boxShadow: (isSelected && !isDisabled) || isCurrentSlot
                    ? [
                        BoxShadow(
                          color: isCurrentSlot
                              ? const Color(0xFF4F46E5).withOpacity(0.2)
                              : const Color(0xFF1E293B).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Stack(
                children: [
                  // Wave pattern overlay
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _TimeSlotWavePainter(
                        isSelected: isSelected && !isDisabled,
                        isBooked: isDisabled,
                        isCurrent: isCurrentSlot, // ✅ Correctly named parameter
                      ),
                    ),
                  ),
                  // Content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          startTime,
                          style: TextStyle(
                            color: isSelected && !isDisabled && !isCurrentSlot
                                ? Colors.white
                                : textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (isCurrentSlot)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4F46E5), // Indigo 600
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Current',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          )
                        else
                          Text(
                            // Display message from backend or fallback logic
                            isDisabled
                                ? (slot.displayMessage.isNotEmpty
                                      ? (slot.displayMessage.toLowerCase() == 'fully booked' ? 'Booked' : slot.displayMessage)
                                      : (status == 'blocked'
                                            ? 'Unavailable'
                                            : 'Booked'))
                                : (isSelected
                                      ? 'Selected'
                                      : (slot.displayMessage.isNotEmpty
                                            ? slot.displayMessage
                                            : 'Available')),
                            style: TextStyle(
                              color: isSelected && !isDisabled
                                  ? Colors.white70
                                  : textColor.withOpacity(0.8),
                              fontSize: 9,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  /// Helper method to format time (convert to 12h format with AM/PM)
  String _formatTime(String rawTime) {
    try {
      int hour;
      int minute;

      if (rawTime.contains('T')) {
        // Handle ISO8601 string (e.g. 2024-01-01T14:30:00Z)
        // Parse and convert to local time for display
        final dateTime = DateTime.parse(rawTime).toLocal();
        hour = dateTime.hour;
        minute = dateTime.minute;
      } else {
        // Handle HH:MM:SS or HH:MM format
        final segments = rawTime.split(':');
        if (segments.length < 2) return rawTime;
        hour = int.parse(segments[0]);
        minute = int.parse(segments[1].split('.')[0].split('Z')[0].trim());
      }

      final period = hour >= 12 ? 'PM' : 'AM';
      // 12-hour clock logic: 0 -> 12, 13 -> 1, etc.
      final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
      final hourStr = hour12.toString().padLeft(2, '0');
      final minuteStr = minute.toString().padLeft(2, '0');
      return '$hourStr:$minuteStr $period';
    } catch (e) {
      return rawTime;
    }
  }
}

/// Custom painter for subtle wave pattern in time slots
class _TimeSlotWavePainter extends CustomPainter {
  final bool isSelected;
  final bool isBooked;
  final bool isCurrent; // ✅ new flag

  _TimeSlotWavePainter({
    required this.isSelected,
    required this.isBooked,
    this.isCurrent = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (isBooked) {
      // Impressive booked slot design with multiple wave layers
      _drawBookedPattern(canvas, size);
    } else {
      // Simple wave for selected/available
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = isSelected
            ? Colors.white.withOpacity(0.06)
            : const Color(0xFF166534).withOpacity(0.04);

      final path = Path();
      path.moveTo(0, size.height * 0.2);
      for (double i = 0; i <= size.width; i++) {
        path.lineTo(
          i,
          size.height * 0.2 + 8 * Math.sin((i / size.width) * 2 * Math.pi),
        );
      }
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      path.close();
      canvas.drawPath(path, paint);

      final path2 = Path();
      path2.moveTo(0, size.height * 0.8);
      for (double i = 0; i <= size.width; i++) {
        path2.lineTo(
          i,
          size.height * 0.8 +
              8 * Math.sin((i / size.width) * 2 * Math.pi + Math.pi),
        );
      }
      path2.lineTo(size.width, size.height);
      path2.lineTo(0, size.height);
      path2.close();
      canvas.drawPath(path2, paint);
    }
  }

  void _drawBookedPattern(Canvas canvas, Size size) {
    // Layer 1: Dramatic top wave
    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFEF4444).withOpacity(0.08);

    final path1 = Path();
    path1.moveTo(0, size.height * 0.25);
    for (double i = 0; i <= size.width; i++) {
      path1.lineTo(
        i,
        size.height * 0.25 +
            12 *
                Math.sin((i / size.width) * 3 * Math.pi) *
                Math.sin((i / size.width) * Math.pi),
      );
    }
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    canvas.drawPath(path1, paint1);

    // Layer 2: Middle crossing waves
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFEF4444).withOpacity(0.06);

    final path2 = Path();
    path2.moveTo(0, size.height * 0.4);
    for (double i = 0; i <= size.width; i++) {
      path2.lineTo(
        i,
        size.height * 0.4 +
            10 * Math.sin((i / size.width) * 4 * Math.pi + Math.pi / 3),
      );
    }
    path2.lineTo(size.width, size.height * 0.6);
    for (double i = size.width; i >= 0; i--) {
      path2.lineTo(
        i,
        size.height * 0.6 + 10 * Math.sin((i / size.width) * 4 * Math.pi),
      );
    }
    path2.close();
    canvas.drawPath(path2, paint2);

    // Layer 3: Dramatic bottom wave
    final paint3 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFEF4444).withOpacity(0.08);

    final path3 = Path();
    path3.moveTo(0, size.height * 0.75);
    for (double i = 0; i <= size.width; i++) {
      path3.lineTo(
        i,
        size.height * 0.75 +
            12 *
                Math.sin((i / size.width) * 3 * Math.pi + Math.pi) *
                Math.sin((i / size.width) * Math.pi + Math.pi),
      );
    }
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);
    path3.close();
    canvas.drawPath(path3, paint3);

    // Layer 4: Diagonal stripe pattern for "blocked" effect
    final stripePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFEF4444).withOpacity(0.04)
      ..strokeWidth = 1.5;

    for (double i = -size.height; i < size.width; i += 8) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        stripePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Math {
  static double sin(double radians) {
    return dart_math.sin(radians);
  }

  static const double pi = dart_math.pi;
}
