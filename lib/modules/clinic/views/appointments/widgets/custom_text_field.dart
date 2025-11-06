import 'package:flutter/material.dart';

/// A reusable custom text field widget with consistent styling
class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final double scaleFactor;
  final String value;
  final Function(String) onChanged;
  final bool isMobile;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.scaleFactor = 1.0,
    required this.value,
    required this.onChanged,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = isMobile
        ? const Color(0xFF666666)
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
              colors: [Colors.white, const Color(0xFFFAFAFA)],
            ),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: const Color(0xFF999999),
                fontSize: 14 * scaleFactor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12 * scaleFactor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
