import 'package:flutter/material.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

/// A horizontal date selector widget showing available dates
class HorizontalDateSelector extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;

  const HorizontalDateSelector({
    super.key,
    required this.viewModel,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    if (viewModel.availableDates.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 65 * scaleFactor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.availableDates.length,
        itemBuilder: (context, index) {
          final date = viewModel.availableDates[index];
          final isSelected =
              date.day == viewModel.selectedSlotDate.day &&
              date.month == viewModel.selectedSlotDate.month &&
              date.year == viewModel.selectedSlotDate.year;

          final isToday =
              date.day == DateTime.now().day &&
              date.month == DateTime.now().month &&
              date.year == DateTime.now().year;

          return GestureDetector(
            onTap: () => viewModel.selectSlotDate(date),
            child: Container(
              width: 55 * scaleFactor,
              margin: EdgeInsets.only(right: 8 * scaleFactor),
              decoration: _buildDateContainerDecoration(isSelected),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDayName(date, isSelected),
                  SizedBox(height: 3 * scaleFactor),
                  _buildDayNumber(date, isSelected),
                  SizedBox(height: 2 * scaleFactor),
                  _buildMonthName(date, isSelected),
                  if (isToday) _buildTodayIndicator(isSelected),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Build container decoration for date card with sidebar-style
  BoxDecoration _buildDateContainerDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? const Color(0xFF1E293B) : const Color(0xFFF8F9FA),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: isSelected ? const Color(0xFF1E293B) : const Color(0xFFE5E7EB),
        width: 1,
      ),
      boxShadow: [
        if (isSelected)
          BoxShadow(
            color: const Color(0xFF1E293B).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        else
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
      ],
    );
  }

  /// Build day name text
  Widget _buildDayName(DateTime date, bool isSelected) {
    return Text(
      _getDayName(date.weekday),
      style: TextStyle(
        fontSize: 10 * scaleFactor,
        color: isSelected ? Colors.white : const Color(0xFF666666),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Build day number text
  Widget _buildDayNumber(DateTime date, bool isSelected) {
    return Text(
      date.day.toString(),
      style: TextStyle(
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : const Color(0xFF333333),
      ),
    );
  }

  /// Build month name text
  Widget _buildMonthName(DateTime date, bool isSelected) {
    return Text(
      _getMonthName(date.month),
      style: TextStyle(
        fontSize: 9 * scaleFactor,
        color: isSelected
            ? Colors.white.withOpacity(0.9)
            : const Color(0xFF999999),
      ),
    );
  }

  /// Build today indicator dot
  Widget _buildTodayIndicator(bool isSelected) {
    return Container(
      margin: EdgeInsets.only(top: 1 * scaleFactor),
      width: 3 * scaleFactor,
      height: 3 * scaleFactor,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xFF007BFF),
        shape: BoxShape.circle,
      ),
    );
  }

  /// Get day name from weekday number
  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  /// Get month name from month number
  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
