import 'dart:math' as dart_math;

import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';

/// A reusable time slot card widget (Mobile version with more details)
/// reusable time slot card widget (Mobile version with more details)
class TimeSlotCardMobile extends StatelessWidget {
  final DoctorTimeSlotResponse slot;
  final bool isSelected;
  final bool isCurrentSlot; // ✅ New flag
  final VoidCallback? onTap;
  final double scaleFactor;

  const TimeSlotCardMobile({
    super.key,
    required this.slot,
    required this.isSelected,
    this.isCurrentSlot = false,
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
    final isDisabled = !isBookable;

    // Sidebar-style color scheme
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (isCurrentSlot) {
      // ✅ Current Booking (Indigo)
      backgroundColor = const Color(0xFFEEF2FF);
      borderColor = const Color(0xFFC7D2FE);
      textColor = const Color(0xFF4F46E5);
    } else if (!isBookable) {
      if (status == 'blocked') {
        if (slot.displayMessage.toLowerCase().contains('leave')) {
          // 🏖️ Doctor on Leave (Amber/Orange)
          backgroundColor = const Color(0xFFFFF7ED); // Amber 50
          borderColor = const Color(0xFFFED7AA); // Orange 200
          textColor = const Color(0xFFC2410C); // Orange 700
        } else {
          // 🕰️ Past Time / Blocked (Slate/Gray)
          backgroundColor = const Color(0xFFF8FAFC); // Slate 50
          borderColor = const Color(0xFFE2E8F0); // Slate 200
          textColor = const Color(0xFF94A3B8); // Slate 400
        }
      } else {
        // 🚫 Fully Booked (Red)
        backgroundColor = const Color(0xFFFEF2F2); // Red 50
        borderColor = const Color(0xFFFECACA); // Red 200
        textColor = const Color(0xFFDC2626); // Red 600
      }
    } else if (isSelected) {
      // ✅ Selected (Slate Dark)
      backgroundColor = const Color(0xFF1E293B);
      borderColor = const Color(0xFF1E293B);
      textColor = Colors.white;
    } else {
      // ✨ Available (Emerald Green)
      backgroundColor = const Color(0xFFECFDF5); // Emerald 50
      borderColor = const Color(0xFFA7F3D0); // Emerald 200
      textColor = const Color(0xFF065F46); // Emerald 800
    }

    return InkWell(
      onTap: (isDisabled && !isCurrentSlot) || isCurrentSlot ? null : onTap,
      child: Opacity(
        opacity: (isDisabled && !isCurrentSlot)
            ? 0.6
            : 1.0, // Apply opacity only to disabled slots, not current
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Container(
            // Removed fixed minHeight to prevent RenderFlex overflow
            padding: EdgeInsets.symmetric(
              horizontal: 6 * scaleFactor,
              vertical: 6 * scaleFactor,
            ),
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
                              : const Color(0xFF1E293B).withOpacity(
                                  0.3,
                                ), // Changed from green back to black
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
                      painter: _TimeSlotWavePainterMobile(
                        isSelected: isSelected && !isDisabled,
                        isBooked: isDisabled,
                        isCurrent: isCurrentSlot, // ✅ Correctly named parameter
                      ),
                    ),
                  ),
                  // Content - Mobile: Only start time for compact display
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          startTime, // Only show start time on mobile
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12 * scaleFactor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4 * scaleFactor),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5 * scaleFactor,
                            vertical: 2 * scaleFactor,
                          ),
                          decoration: BoxDecoration(
                            color: isCurrentSlot
                                ? const Color(0xFF4F46E5) // Indigo 600
                                : borderColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isDisabled && !isCurrentSlot) ...[
                                Icon(
                                  (status == 'blocked')
                                      ? Icons.access_time
                                      : Icons.block,
                                  size: 10 * scaleFactor,
                                  color: textColor,
                                ),
                                SizedBox(width: 3 * scaleFactor),
                              ],
                              Text(
                                isCurrentSlot
                                    ? 'Current'
                                    : (isDisabled
                                          ? (slot.displayMessage.isNotEmpty
                                                ? (slot.displayMessage.toLowerCase() == 'fully booked' ? 'Booked' : slot.displayMessage)
                                                : (status == 'blocked'
                                                      ? 'Time Passed'
                                                      : 'Booked'))
                                          : (slot.displayMessage.isNotEmpty
                                                ? slot.displayMessage
                                                : 'Available')),
                                style: TextStyle(
                                  color: isCurrentSlot ? Colors.white : textColor,
                                  fontSize: 7.5 * scaleFactor,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
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
        // Handle ISO8601 string - convert to local for display
        final dateTime = DateTime.parse(rawTime).toLocal();
        hour = dateTime.hour;
        minute = dateTime.minute;
      } else {
        // Handle HH:MM:SS
        final segments = rawTime.split(':');
        if (segments.length < 2) return rawTime;
        hour = int.parse(segments[0]);
        minute = int.parse(segments[1].split('.')[0].split('Z')[0].trim());
      }

      final period = hour >= 12 ? 'PM' : 'AM';
      // 12-hour clock logic
      final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
      final hourStr = hour12.toString().padLeft(2, '0');
      final minuteStr = minute.toString().padLeft(2, '0');
      return '$hourStr:$minuteStr $period';
    } catch (e) {
      return rawTime;
    }
  }
}

/// Custom painter for subtle wave pattern in mobile time slots
class _TimeSlotWavePainterMobile extends CustomPainter {
  final bool isSelected;
  final bool isBooked;
  final bool isCurrent; // ✅ new flag

  _TimeSlotWavePainterMobile({
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
      path.moveTo(0, size.height * 0.15);
      for (double i = 0; i <= size.width; i++) {
        path.lineTo(
          i,
          size.height * 0.15 +
              6 * dart_math.sin((i / size.width) * 2 * dart_math.pi),
        );
      }
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      path.close();
      canvas.drawPath(path, paint);

      final path2 = Path();
      path2.moveTo(0, size.height * 0.85);
      for (double i = 0; i <= size.width; i++) {
        path2.lineTo(
          i,
          size.height * 0.85 +
              6 *
                  dart_math.sin(
                    (i / size.width) * 2 * dart_math.pi + dart_math.pi,
                  ),
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
    path1.moveTo(0, size.height * 0.2);
    for (double i = 0; i <= size.width; i++) {
      path1.lineTo(
        i,
        size.height * 0.2 +
            10 *
                dart_math.sin((i / size.width) * 3 * dart_math.pi) *
                dart_math.sin((i / size.width) * dart_math.pi),
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
    path2.moveTo(0, size.height * 0.35);
    for (double i = 0; i <= size.width; i++) {
      path2.lineTo(
        i,
        size.height * 0.35 +
            8 *
                dart_math.sin(
                  (i / size.width) * 4 * dart_math.pi + dart_math.pi / 3,
                ),
      );
    }
    path2.lineTo(size.width, size.height * 0.65);
    for (double i = size.width; i >= 0; i--) {
      path2.lineTo(
        i,
        size.height * 0.65 +
            8 * dart_math.sin((i / size.width) * 4 * dart_math.pi),
      );
    }
    path2.close();
    canvas.drawPath(path2, paint2);

    // Layer 3: Dramatic bottom wave
    final paint3 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFEF4444).withOpacity(0.08);

    final path3 = Path();
    path3.moveTo(0, size.height * 0.8);
    for (double i = 0; i <= size.width; i++) {
      path3.lineTo(
        i,
        size.height * 0.8 +
            10 *
                dart_math.sin(
                  (i / size.width) * 3 * dart_math.pi + dart_math.pi,
                ) *
                dart_math.sin((i / size.width) * dart_math.pi + dart_math.pi),
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
