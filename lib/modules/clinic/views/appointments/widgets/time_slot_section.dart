import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'time_slot_card.dart';
import 'time_slot_card_mobile.dart';

/// A reusable time slot section widget showing 2 rows of slots scrolling horizontally
class TimeSlotSection extends StatefulWidget {
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
  State<TimeSlotSection> createState() => _TimeSlotSectionState();
}

class _TimeSlotSectionState extends State<TimeSlotSection> {
  final ScrollController _scrollController = ScrollController();

  void _scroll(double offset) {
    _scrollController.animateTo(
      _scrollController.offset + offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double cardHeight = (widget.isMobile ? 55 : 65) * widget.scaleFactor;
    final double sectionHeight = (cardHeight * 2) + (6 * widget.scaleFactor);

    // Filter slots: Keep only 'Available' and 'Booked' slots. 
    // Exclude 'Blocked' (which represents Time Passed).
    final filteredSlots = widget.slots.where((slot) {
      if (widget.viewModel.originalSlotId == slot.id) return true;
      return slot.status != 'blocked';
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(),
        SizedBox(height: 8 * widget.scaleFactor),
        
        if (filteredSlots.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20 * widget.scaleFactor),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8 * widget.scaleFactor),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Center(
              child: Text(
                'No available slots',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12 * widget.scaleFactor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        else
          // Horizontal Grid - Buttons are now in the header only
          SizedBox(
            height: sectionHeight,
            child: GridView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 rows
                mainAxisSpacing: 8 * widget.scaleFactor,
                crossAxisSpacing: 8 * widget.scaleFactor,
                childAspectRatio: widget.isMobile ? 0.75 : 0.65, // Adjust for width
              ),
              itemCount: filteredSlots.length,
              itemBuilder: (context, index) {
                final slotObj = filteredSlots[index];
                final startTime = _formatTime(slotObj.startTime);
                final endTime = _formatTime(slotObj.endTime);
                final slotTime = '$startTime - $endTime';
                final isSelected = widget.viewModel.selectedSlotId == slotObj.id;
                final isCurrentSlot =
                    widget.viewModel.originalSlotId != null &&
                    widget.viewModel.originalSlotId == slotObj.id;

                return widget.isMobile
                    ? TimeSlotCardMobile(
                        slot: slotObj,
                        isSelected: isSelected,
                        isCurrentSlot: isCurrentSlot,
                        onTap: isCurrentSlot
                            ? null
                            : () {
                                widget.viewModel.setTimeSlot(
                                  slotTime,
                                  slotDetails: slotObj,
                                );
                              },
                        scaleFactor: widget.scaleFactor,
                      )
                    : TimeSlotCard(
                        slot: slotObj,
                        isSelected: isSelected,
                        isCurrentSlot: isCurrentSlot,
                        onTap: isCurrentSlot
                            ? null
                            : () {
                                widget.viewModel.setTimeSlot(
                                  slotTime,
                                  slotDetails: slotObj,
                                );
                              },
                        scaleFactor: widget.scaleFactor,
                      );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildScrollButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4 * widget.scaleFactor),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4 * widget.scaleFactor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 18 * widget.scaleFactor, color: Colors.white),
        onPressed: onPressed,
        constraints: const BoxConstraints(),
        padding: EdgeInsets.all(4 * widget.scaleFactor),
      ),
    );
  }

  /// Build section header with icon and title
  Widget _buildSectionHeader() {
    return Row(
      children: [
        Icon(
          widget.isMorning ? Icons.wb_sunny : Icons.brightness_3,
          size: (widget.isMobile ? 15 : 16) * widget.scaleFactor,
          color: widget.isMorning
              ? Colors.orange.shade600
              : Colors.indigo.shade600,
        ),
        SizedBox(width: 6 * widget.scaleFactor),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 13 * widget.scaleFactor,
            fontWeight: FontWeight.w600,
            color: widget.isMobile
                ? const Color(0xFF334155)
                : const Color(0xFF1E293B),
          ),
        ),
        const Spacer(),
        // Move scroll buttons here
        _buildScrollButton(
          icon: Icons.chevron_left,
          onPressed: () => _scroll(-200),
        ),
        _buildScrollButton(
          icon: Icons.chevron_right,
          onPressed: () => _scroll(200),
        ),
      ],
    );
  }

  /// Helper method to format time (12-hour with AM/PM)
  String _formatTime(String rawTime) {
    try {
      int hour;
      int minute;

      if (rawTime.contains('T')) {
        final dateTime = DateTime.parse(rawTime).toUtc();
        hour = dateTime.hour;
        minute = dateTime.minute;
      } else {
        final segments = rawTime.split(':');
        if (segments.length < 2) return rawTime;
        hour = int.parse(segments[0]);
        minute = int.parse(segments[1].split('.')[0].split('Z')[0].trim());
      }

      final period = hour >= 12 ? 'PM' : 'AM';
      final hour12 = hour % 12 == 0 ? 12 : hour % 12;
      final hourStr = hour12.toString().padLeft(2, '0');
      final minuteStr = minute.toString().padLeft(2, '0');
      return '$hourStr:$minuteStr $period';
    } catch (e) {
      return rawTime;
    }
  }
}
