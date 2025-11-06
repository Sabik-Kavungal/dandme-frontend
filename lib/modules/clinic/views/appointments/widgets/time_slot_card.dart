import 'package:flutter/material.dart';
import 'package:a/modules/clinic/models/doctor_time_slot_model.dart';
import 'dart:math' as dart_math;

/// A reusable time slot card widget (Web version)
class TimeSlotCard extends StatelessWidget {
  final DoctorTimeSlotResponse slot;
  final bool isSelected;
  final VoidCallback? onTap;
  final double scaleFactor;

  const TimeSlotCard({
    super.key,
    required this.slot,
    required this.isSelected,
    this.onTap,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = _formatTime(slot.startTime);

    // Check if slot is in the past for today
    final isPastSlotForToday = _isPastSlotForToday(slot);
    final isPastSlot =
        slot.status == 'expired' ||
        !slot.isBookable ||
        isPastSlotForToday; // Check for past slots including today's past times
    final isBooked =
        slot.bookedPatients >= slot.maxPatients || !slot.isAvailable;
    final isClickable = !isBooked && !isPastSlot;

    // Sidebar-style colors
    Color backgroundColor;
    Color textColor;
    Color? borderColor;

    if (isSelected && !isPastSlot) {
      backgroundColor = const Color(
        0xFF1E293B,
      ); // Changed from green back to black
      textColor = Colors.white;
      borderColor = const Color(0xFF1E293B); // Changed from green back to black
    } else if (isPastSlot) {
      backgroundColor = const Color(0xFFF5F5F5); // Gray for past slots
      textColor = const Color(0xFF9CA3AF);
      borderColor = const Color(0xFFE5E7EB);
    } else if (isBooked) {
      backgroundColor = const Color(0xFFFFF5F5); // Lighter red
      textColor = const Color(0xFFEF4444);
      borderColor = const Color(0xFFFECDD3);
    } else {
      backgroundColor = const Color(
        0xFFF0FDF4,
      ); // Keep light green for available
      textColor = const Color(0xFF059669); // Keep green text for available
      borderColor = const Color(
        0xFFBBF7D0,
      ); // Keep light green border for available
    }

    return Container(
      margin: EdgeInsets.only(right: 6 * scaleFactor),
      child: InkWell(
        onTap: isClickable ? onTap : null,
        child: Opacity(
          opacity: (isBooked || isPastSlot)
              ? 0.6
              : 1.0, // Apply opacity to past slots too
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 90,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor, width: isBooked ? 2 : 1),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFF1E293B).withOpacity(
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
                      painter: _TimeSlotWavePainter(
                        isSelected: isSelected,
                        isBooked:
                            isBooked ||
                            isPastSlot, // Include past slots in booked state
                      ),
                    ),
                  ),
                  // Content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        startTime,
                        style: TextStyle(
                          color: isSelected ? Colors.white : textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isPastSlot
                            ? (isPastSlotForToday
                                  ? 'Past'
                                  : slot.displayMessage)
                            : (isBooked
                                  ? 'Booked'
                                  : (isSelected ? 'Selected' : 'Available')),
                        style: TextStyle(
                          color: isSelected && !isPastSlot
                              ? Colors.white70
                              : (isBooked || isPastSlot
                                    ? textColor
                                    : textColor.withOpacity(0.7)),
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Check if slot time is in the past for today's date
  bool _isPastSlotForToday(DoctorTimeSlotResponse slot) {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      // Parse slot date (YYYY-MM-DD format)
      if (slot.date.isEmpty) return false;
      final slotDateParts = slot.date.split('-');
      if (slotDateParts.length != 3) return false;

      final slotDate = DateTime(
        int.parse(slotDateParts[0]),
        int.parse(slotDateParts[1]),
        int.parse(slotDateParts[2]),
      );

      // If slot is not for today, don't mark as past
      if (slotDate.year != today.year ||
          slotDate.month != today.month ||
          slotDate.day != today.day) {
        return false;
      }

      // Parse slot start time
      DateTime? slotDateTime;
      if (slot.startTime.contains('T')) {
        // ISO format
        slotDateTime = DateTime.parse(slot.startTime).toLocal();
      } else {
        // HH:MM:SS or HH:MM format
        final timeParts = slot.startTime.split(':');
        if (timeParts.length >= 2) {
          final hour = int.parse(timeParts[0]);
          final minute = int.parse(timeParts[1]);
          slotDateTime = DateTime(
            slotDate.year,
            slotDate.month,
            slotDate.day,
            hour,
            minute,
          );
        }
      }

      if (slotDateTime == null) return false;

      // Check if slot time has passed
      return slotDateTime.isBefore(now);
    } catch (e) {
      // If parsing fails, don't mark as past
      return false;
    }
  }

  /// Helper method to format time (convert 24h to 12h format)
  String _formatTime(String time24) {
    try {
      if (time24.contains('T')) {
        final dateTime = DateTime.parse(time24).toLocal();
        final hour = dateTime.hour;
        final minute = dateTime.minute;
        final period = hour >= 12 ? 'PM' : 'AM';
        final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
        return '$hour12:${minute.toString().padLeft(2, '0')} $period';
      }

      final parts = time24.split(':');
      int hour = int.parse(parts[0]);
      final minute = parts[1].split('.')[0].split('Z')[0].trim();
      final period = hour >= 12 ? 'PM' : 'AM';
      hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$hour:$minute $period';
    } catch (e) {
      return time24;
    }
  }
}

/// Custom painter for subtle wave pattern in time slots
class _TimeSlotWavePainter extends CustomPainter {
  final bool isSelected;
  final bool isBooked;

  _TimeSlotWavePainter({required this.isSelected, required this.isBooked});

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
            : const Color(0xFF64748B).withOpacity(0.03);

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
