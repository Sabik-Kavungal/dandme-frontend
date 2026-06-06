import 'package:flutter/material.dart';

/// A reusable custom dropdown field widget with consistent styling
class CustomDropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final Function(String?)? onChanged;
  final double scaleFactor;
  final bool disabled;
  final bool isMobile;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.scaleFactor = 1.0,
    this.disabled = false,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = disabled
        ? const Color(0xFF999999)
        : (isMobile ? const Color(0xFF666666) : const Color(0xFF333333));

    final backgroundColor = disabled ? const Color(0xFFF5F5F5) : Colors.white;

    final borderColor = disabled
        ? const Color(0xFFCCCCCC)
        : const Color(0xFFE0E0E0);

    final textColor = disabled
        ? const Color(0xFF999999)
        : const Color(0xFF333333);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        SizedBox(height: isMobile ? 8 * scaleFactor : 6 * scaleFactor),
        Container(
          height: 40 * scaleFactor,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                backgroundColor,
                backgroundColor,
                const Color(0xFFFAFAFA),
              ],
            ),
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              onChanged: disabled ? null : onChanged,
              padding: EdgeInsets.symmetric(horizontal: 12 * scaleFactor),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_isDoctorField(label))
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.person,
                                size: 16 * scaleFactor,
                                color: const Color(0xFF6366F1),
                              ),
                            ),
                          if (_isDepartmentField(label))
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.business,
                                size: 16 * scaleFactor,
                                color: const Color(0xFF8B5CF6),
                              ),
                            ),
                          Flexible(
                            child: Text(
                              _getDisplayLabel(item, label),
                              style: TextStyle(
                                fontSize: 14 * scaleFactor,
                                color: textColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: disabled
                    ? const Color(0xFFCCCCCC)
                    : const Color(0xFF666666),
                size: 20 * scaleFactor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Check if this is a doctor selection field
  bool _isDoctorField(String label) {
    return label.toLowerCase().contains('doctor');
  }

  /// Check if this is a department selection field
  bool _isDepartmentField(String label) {
    return label.toLowerCase().contains('department');
  }

  /// Helper method to get user-friendly labels
  String _getDisplayLabel(String value, String label) {

    // Consultation type labels
    switch (value) {
      case 'clinic_visit':
        return '🏥 Clinic Visit';
      case 'video_consultation':
        return '💻 Video Consultation';
      case 'follow-up-via-clinic':
        return '🔄 Follow-Up (Clinic)';
      case 'follow-up-via-video':
        return '🔄 Follow-Up (Video)';
      default:
        return value;
    }
  }
}
