import 'package:flutter/material.dart';
import 'package:a/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'time_slot_card.dart';
import 'time_slot_card_mobile.dart';

/// A reusable time slot section widget showing morning or afternoon slots
class TimeSlotSection extends StatelessWidget {
  final String title;
  final List<DoctorTimeSlotResponse> slots;
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;
  final bool isMorning;
  final bool isMobile;

  const TimeSlotSection({
    super.key,
    required this.title,
    required this.slots,
    required this.viewModel,
    this.scaleFactor = 1.0,
    this.isMorning = true,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(),
        SizedBox(height: 8 * scaleFactor),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: slots.map((slotObj) {
              final startTime = _formatTime(slotObj.startTime);
              final endTime = _formatTime(slotObj.endTime);
              final slotTime = '$startTime - $endTime';
              final isSelected = viewModel.selectedSlotId == slotObj.id;

              return isMobile
                  ? TimeSlotCardMobile(
                      slot: slotObj,
                      isSelected: isSelected,
                      onTap: () {
                        viewModel.setTimeSlot(slotTime, slotDetails: slotObj);
                      },
                      scaleFactor: scaleFactor,
                    )
                  : TimeSlotCard(
                      slot: slotObj,
                      isSelected: isSelected,
                      onTap: () {
                        viewModel.setTimeSlot(slotTime, slotDetails: slotObj);
                      },
                      scaleFactor: scaleFactor,
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// Build section header with icon and title
  Widget _buildSectionHeader() {
    return Row(
      children: [
        Icon(
          isMorning ? Icons.wb_sunny : Icons.brightness_3,
          size: (isMobile ? 15 : 16) * scaleFactor,
          color: isMorning ? Colors.orange.shade600 : Colors.indigo.shade600,
        ),
        SizedBox(width: 6 * scaleFactor),
        Text(
          title,
          style: TextStyle(
            fontSize: 13 * scaleFactor,
            fontWeight: FontWeight.w600,
            color: isMobile ? const Color(0xFF444444) : const Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  /// Helper method to format time
  String _formatTime(String time24) {
    try {
      if (time24.contains('T')) {
        final dateTime = DateTime.parse(time24);
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

