import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/models/doctor_session_slot_model.dart';
import 'package:drandme/core/widgets/app_loader.dart';
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: const Color(0xFFE2E8F0), // Slate 200
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E293B).withValues(alpha: 0.04), // Slate 900
            blurRadius: 12,
            offset: const Offset(0, 3),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
                    color: const Color(0xFF0F766E), // Teal 700 - Classy
                  ),
                  SizedBox(width: 6 * scaleFactor),
                  Text(
                    'Select Date',
                    style: TextStyle(
                      fontSize: 13 * scaleFactor,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF111827), // Gray 900
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
            iconColor: const Color(0xFF0F766E), // Teal 700
          ),
          SizedBox(height: 10 * scaleFactor),

          // Time Slots & Walk-in Toggle
          _buildTimeSlots(),

          // ✅ MOVE WALK-IN ACTION HERE (Beyond/Below Slots)
          if (viewModel.walkinAvailable) ...[
            SizedBox(height: 12 * scaleFactor),
            _buildWalkInAction(),
          ],
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
    // ✅ 1. If Walk-in is already SELECTED, show a message and hide normal slots
    if (viewModel.isWalkIn) {
      return Container(
        padding: EdgeInsets.all(20 * scaleFactor),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9), // Slate 100
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Color(0xFF64748B), size: 20),
            SizedBox(width: 10 * scaleFactor),
            const Expanded(
              child: Text(
                'Walk-in mode is active. You are booking an appointment for today without a fixed time slot.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // ✅ 2. Existing Loading Logic
    if (viewModel.isLoadingSlots) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(12 * scaleFactor),
          child: AppLoader(
            size: 40 * scaleFactor,
            color: const Color(0xFF0F766E),
          ),
        ),
      );
    }

    // ✅ 3. CHECK FOR NO SLOTS
    final hasNoSlots =
        viewModel.groupedTimeSlots == null ||
        (viewModel.groupedTimeSlots!.days.isEmpty) ||
        (viewModel.groupedTimeSlots!.days.every((day) => !day.hasSlots)) ||
        (viewModel.sessionSlotsResponse != null &&
            viewModel.totalAvailableSlots == 0);

    if (hasNoSlots) {
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

  /// ✅ NEW: Build a radio toggle for Walk-in mode when slots are full
  Widget _buildWalkInAction() {
    final isSelected = viewModel.isWalkIn;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * scaleFactor,
        vertical: 8 * scaleFactor,
      ),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFF7ED) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? const Color(0xFFF97316) : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (isSelected) {
            viewModel.setWalkInMode(null);
          } else {
            viewModel.setGeneralWalkInMode();
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20 * scaleFactor,
              height: 20 * scaleFactor,
              child: Radio<bool>(
                // ignore: deprecated_member_use
                value: true,
                // ignore: deprecated_member_use
                groupValue: isSelected,
                activeColor: const Color(0xFFF97316),
                // ignore: deprecated_member_use
                onChanged: (_) {
                  // Toggle state when clicking the radio itself
                  if (isSelected) {
                    viewModel.setWalkInMode(null);
                  } else {
                    viewModel.setGeneralWalkInMode();
                  }
                },
              ),
            ),
            SizedBox(width: 10 * scaleFactor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book as Walk-in',
                  style: TextStyle(
                    fontSize: 13 * scaleFactor,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? const Color(0xFF9A3412)
                        : const Color(0xFF1E293B),
                  ),
                ),
                Text(
                  'Available for today',
                  style: TextStyle(
                    fontSize: 11 * scaleFactor,
                    color: isSelected
                        ? const Color(0xFFEA580C)
                        : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build time slots grouped by morning and afternoon
  /// Enhanced to show sessions if available from API
  Widget _buildTimeSlotsGrouped() {
    // ✅ Try to use session-based grouping if available
    final sessionResponse = viewModel.sessionSlotsResponse;
    if (sessionResponse != null && sessionResponse.slots.isNotEmpty) {
      return _buildSessionBasedSlots(sessionResponse);
    }

    // Fallback to morning/afternoon grouping
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

  /// Build slots grouped by sessions (from API response)
  Widget _buildSessionBasedSlots(ListSessionSlotsResponse sessionResponse) {
    final sections = <Widget>[];
    final selectedDate = viewModel.selectedSlotDate;
    final selectedDateString = _formatDate(selectedDate);

    // Process each slot day
    for (final slotDay in sessionResponse.slots) {
      final isRecurring = slotDay.dayOfWeek != null;
      final resolvedDayName = _resolveDayName(slotDay.dayOfWeek, selectedDate);
      final resolvedDayOfWeek = _resolveDayOfWeek(
        slotDay.dayOfWeek,
        selectedDate.weekday,
      );

      // Process each session
      for (final session in slotDay.sessions) {
        // Convert individual slots to DoctorTimeSlotResponse
        final sessionSlots = session.slots.map((slot) {
          final slotDate = (slotDay.date != null && slotDay.date!.isNotEmpty)
              ? slotDay.date!
              : selectedDateString;
          final doctorId =
              slotDay.doctorId ??
              (viewModel.selectedDoctorObject?.doctorId ??
                  viewModel.selectedDoctorObject?.id ??
                  '');
          final clinicId = slot.clinicId ?? slotDay.clinicId ?? '';

          return DoctorTimeSlotResponse(
            id: slot.id,
            doctorId: doctorId,
            clinicId: clinicId,
            date: slotDate,
            dayOfWeek: resolvedDayOfWeek,
            dayName: resolvedDayName,
            slotType: slotDay.slotType ?? 'clinic_visit',
            startTime: slot.slotStart ?? '00:00',
            endTime: slot.slotEnd ?? '00:00',
            startDateTime: slot.startDatetime,
            endDateTime: slot.endDatetime,
            maxPatients: slot.maxPatients,
            bookedPatients: slot.bookedCount,
            availableSpots: slot.isBookable && !slot.isBooked
                ? slot.availableCount
                : 0,
            isAvailable:
                slot.isBookable && !slot.isBooked && slot.status == 'available',
            isBookable: slot.isBookable,
            status: slot.status,
            displayMessage: slot.displayMessage,
            notes: slot.notes,
            isActive: true,
          );
        }).toList();

        if (sessionSlots.isNotEmpty) {
          final sessionTitle = _buildSessionTitle(
            session.sessionName ?? 'Session',
            session.availableSlots,
            session.generatedSlots,
            isRecurring,
          );

          sections.add(
            TimeSlotSection(
              title: sessionTitle,
              slots: sessionSlots,
              viewModel: viewModel,
              scaleFactor: scaleFactor,
              isMorning: _isMorningSession(
                session.startTime ?? '',
                session.startDatetime,
              ),
              isMobile: isMobile,
            ),
          );

          sections.add(SizedBox(height: 12 * scaleFactor));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections,
    );
  }

  /// Build session title with availability info and recurring badge
  String _buildSessionTitle(
    String sessionName,
    int available,
    int total,
    bool isRecurring,
  ) {
    final recurringBadge = isRecurring ? ' 🔄' : '';
    return '$sessionName ($available/$total available)$recurringBadge';
  }

  /// Check if session is morning session
  bool _isMorningSession(String startTime, [String? startDatetime]) {
    try {
      if (startDatetime != null && startDatetime.isNotEmpty) {
        final dateTime = DateTime.parse(startDatetime).toLocal();
        return dateTime.hour < 12;
      }

      if (startTime.contains('T')) {
        final dateTime = DateTime.parse(startTime);
        return dateTime.hour < 12;
      }

      // Handle AM/PM format (e.g. "01:28 PM")
      final upperStartTime = startTime.toUpperCase();
      if (upperStartTime.contains('PM') || upperStartTime.contains('AM')) {
        final parts = startTime.split(' ');
        if (parts.length >= 2) {
          final timeParts = parts[0].split(':');
          if (timeParts.isNotEmpty) {
            var hour = int.tryParse(timeParts[0]) ?? 0;
            final isPM = parts[1].toUpperCase() == 'PM';
            final isAM = parts[1].toUpperCase() == 'AM';

            if (isPM && hour < 12) hour += 12;
            if (isAM && hour == 12) hour = 0;

            return hour < 12;
          }
        }
      }

      final hourPart = startTime.split(':').first;
      final hour = int.tryParse(hourPart) ?? 0;
      return hour < 12;
    } catch (e) {
      return true; // Default to morning
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _resolveDayName(int? apiDayOfWeek, DateTime selectedDate) {
    const weekdayNames = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    if (apiDayOfWeek != null &&
        apiDayOfWeek >= 0 &&
        apiDayOfWeek < weekdayNames.length) {
      return weekdayNames[apiDayOfWeek];
    }

    return weekdayNames[(selectedDate.weekday % 7)];
  }

  int? _resolveDayOfWeek(int? apiDayOfWeek, int selectedDayOfWeek) {
    if (apiDayOfWeek == null) {
      return selectedDayOfWeek;
    }

    if (apiDayOfWeek == 0) {
      return 7; // Sunday in Dart DateTime
    }

    return apiDayOfWeek;
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
              if (slot.startDateTime != null &&
                  slot.startDateTime!.isNotEmpty) {
                slotDateTime = DateTime.parse(slot.startDateTime!).toLocal();
              } else if (slot.startTime.contains('T')) {
                // ISO format
                slotDateTime = DateTime.parse(slot.startTime).toLocal();
              } else if (slot.startTime.contains('PM') ||
                  slot.startTime.contains('AM')) {
                // AM/PM format
                try {
                  final parts = slot.startTime.split(' ');
                  if (parts.length >= 2) {
                    final timeParts = parts[0].split(':');
                    if (timeParts.length >= 2) {
                      var hour = int.parse(timeParts[0]);
                      final minute = int.parse(timeParts[1]);
                      final isPM = parts[1].toUpperCase() == 'PM';
                      final isAM = parts[1].toUpperCase() == 'AM';

                      if (isPM && hour < 12) hour += 12;
                      if (isAM && hour == 12) hour = 0;

                      slotDateTime = DateTime(
                        slotDate.year,
                        slotDate.month,
                        slotDate.day,
                        hour,
                        minute,
                      );
                    }
                  }
                } catch (e) {
                  // Fallback
                }
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
