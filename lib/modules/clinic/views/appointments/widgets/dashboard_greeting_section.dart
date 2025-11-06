import 'package:flutter/material.dart';

/// A reusable greeting section with date picker for dashboard
class DashboardGreetingSection extends StatelessWidget {
  final String? selectedDate;
  final VoidCallback onDatePickerTap;
  final VoidCallback? onClearDate;
  final bool isMobile;

  const DashboardGreetingSection({
    super.key,
    this.selectedDate,
    required this.onDatePickerTap,
    this.onClearDate,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final displayDate = selectedDate != null
        ? _formatDate(DateTime.parse(selectedDate!))
        : _formatDate(DateTime.now());

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 12,
        vertical: isMobile ? 6 : 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF059669)],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF10B981).withOpacity(0.4),
                            blurRadius: 4,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hi Arun Krishna, ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF6B7280),
                                letterSpacing: 0.1,
                                height: 1.2,
                              ),
                            ),
                            TextSpan(
                              text: 'Good Morning! ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF111827),
                                letterSpacing: 0,
                                height: 1.2,
                              ),
                            ),
                            TextSpan(
                              text: '✨',
                              style: TextStyle(
                                fontSize: isMobile ? 12 : 14,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Modern date picker button
          InkWell(
            onTap: onDatePickerTap,
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 6 : 8,
                vertical: isMobile ? 4 : 5,
              ),
              decoration: BoxDecoration(
                color: selectedDate != null
                    ? const Color(0xFF6366F1).withOpacity(0.1)
                    : const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: selectedDate != null
                      ? const Color(0xFF6366F1)
                      : const Color(0xFFE5E7EB),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.02),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.calendar_today,
                      color: const Color(0xFF6366F1),
                      size: isMobile ? 9 : 10,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    displayDate,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xFF374151),
                      fontSize: isMobile ? 10 : 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      height: 1.1,
                    ),
                  ),
                  if (selectedDate != null && onClearDate != null) ...[
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: onClearDate,
                      child: Icon(
                        Icons.close,
                        size: isMobile ? 12 : 14,
                        color: const Color(0xFF6366F1),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Format date to display string
  String _formatDate(DateTime date) {
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
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
