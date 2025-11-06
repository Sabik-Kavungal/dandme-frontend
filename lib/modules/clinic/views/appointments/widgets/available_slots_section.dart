import 'package:flutter/material.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:a/modules/clinic/models/doctor_time_slot_model.dart';
import 'section_header.dart';
import 'horizontal_date_selector.dart';
import 'time_slot_section.dart';
import 'unified_button.dart';

/// Available slots section showing date selector and time slots
class AvailableSlotsSection extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final bool isMobile;
  final VoidCallback onPickDatePressed;

  const AvailableSlotsSection({
    super.key,
    required this.viewModel,
    this.scaleFactor = 1.0,
    this.isMobile = false,
    required this.onPickDatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Changed from green to white
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E7EB), // Changed from green to gray
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFF6366F1,
            ).withOpacity(0.05), // Changed from green to blue
            blurRadius: 12,
            offset: const Offset(0, 3),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(12 * scaleFactor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Select Date Heading with Date Picker Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 18 * scaleFactor,
                    color: const Color(
                      0xFF059669,
                    ), // Darker green for better contrast
                  ),
                  SizedBox(width: 6 * scaleFactor),
                  Text(
                    'Select Date',
                    style: TextStyle(
                      fontSize: 13 * scaleFactor,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF064E3B), // Dark green text
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              _buildPickDateButton(),
            ],
          ),
          SizedBox(height: 10 * scaleFactor),

          // Horizontal Date Selector
          HorizontalDateSelector(
            viewModel: viewModel,
            scaleFactor: scaleFactor,
          ),

          SizedBox(height: 14 * scaleFactor),

          // Available Slots Heading
          SectionHeader(
            icon: Icons.schedule,
            title: 'Available Slots',
            scaleFactor: scaleFactor,
            iconColor: const Color(0xFF059669), // Darker green
          ),
          SizedBox(height: 10 * scaleFactor),

          // Time Slots
          _buildTimeSlots(),
        ],
      ),
    );
  }

  /// Build Pick Date button using unified button
  Widget _buildPickDateButton() {
    return UnifiedButton.pickDate(
      onPressed: onPickDatePressed,
      scaleFactor: scaleFactor,
    );
  }

  /// Build time slots based on loading state and availability
  Widget _buildTimeSlots() {
    if (viewModel.isLoadingSlots) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(12 * scaleFactor),
          child: const CircularProgressIndicator(),
        ),
      );
    }

    if (viewModel.groupedTimeSlots == null ||
        (viewModel.groupedTimeSlots!.days.isEmpty) ||
        (viewModel.groupedTimeSlots!.days.every((day) => !day.hasSlots))) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(12 * scaleFactor),
          child: Text(
            'No time slots available for this date.',
            style: TextStyle(
              fontSize: 13 * scaleFactor,
              color: const Color(0xFF666666),
            ),
          ),
        ),
      );
    }

    return _buildTimeSlotsGrouped();
  }

  /// Build time slots grouped by morning and afternoon
  Widget _buildTimeSlotsGrouped() {
    final morningSlots = viewModel.morningSlots;
    final afternoonSlots = viewModel.afternoonSlots;
    final sections = <Widget>[];

    // Morning section
    if (morningSlots.isNotEmpty) {
      final availableMorningCount = _getAvailableSlotCount(morningSlots);
      sections.add(
        TimeSlotSection(
          title: 'Morning Slots ($availableMorningCount available)',
          slots: morningSlots,
          viewModel: viewModel,
          scaleFactor: scaleFactor,
          isMorning: true,
          isMobile: isMobile,
        ),
      );
      sections.add(SizedBox(height: 12 * scaleFactor));
    }

    // Afternoon section
    if (afternoonSlots.isNotEmpty) {
      final availableAfternoonCount = _getAvailableSlotCount(afternoonSlots);
      sections.add(
        TimeSlotSection(
          title: 'Afternoon Slots ($availableAfternoonCount available)',
          slots: afternoonSlots,
          viewModel: viewModel,
          scaleFactor: scaleFactor,
          isMorning: false,
          isMobile: isMobile,
        ),
      );
      sections.add(SizedBox(height: isMobile ? 8 : 4 * scaleFactor));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections,
    );
  }

  /// Get count of available slots excluding past slots
  int _getAvailableSlotCount(List<DoctorTimeSlotResponse> slots) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return slots.where((slot) {
      // Check if slot is booked
      if (slot.availableSpots <= 0 || !slot.isAvailable) {
        return false;
      }

      // Check if slot date is in the past
      try {
        if (slot.date.isNotEmpty) {
          final slotDateParts = slot.date.split('-');
          if (slotDateParts.length == 3) {
            final slotDate = DateTime(
              int.parse(slotDateParts[0]),
              int.parse(slotDateParts[1]),
              int.parse(slotDateParts[2]),
            );

            // If date is before today, exclude it
            if (slotDate.year < today.year ||
                (slotDate.year == today.year && slotDate.month < today.month) ||
                (slotDate.year == today.year &&
                    slotDate.month == today.month &&
                    slotDate.day < today.day)) {
              return false;
            }

            // If slot is for today, check if time has passed
            if (slotDate.year == today.year &&
                slotDate.month == today.month &&
                slotDate.day == today.day) {
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

              // If time has passed, exclude it
              if (slotDateTime != null && slotDateTime.isBefore(now)) {
                return false;
              }
            }
          }
        }
      } catch (e) {
        // If parsing fails, include the slot to be safe
      }

      return true;
    }).length;
  }
}
