import 'package:flutter/material.dart';

/// Auto-expanding notes field widget for appointment booking
class AutoExpandingNotesField extends StatefulWidget {
  final String label;
  final String hint;
  final double scaleFactor;
  final String value;
  final Function(String) onChanged;
  final bool isMobile;
  final FocusNode? focusNode; // ✅ New optional focus node

  const AutoExpandingNotesField({
    super.key,
    required this.label,
    required this.hint,
    this.scaleFactor = 1.0,
    required this.value,
    required this.onChanged,
    this.isMobile = false,
    this.focusNode,
  });

  @override
  State<AutoExpandingNotesField> createState() =>
      _AutoExpandingNotesFieldState();
}

class _AutoExpandingNotesFieldState extends State<AutoExpandingNotesField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void didUpdateWidget(AutoExpandingNotesField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelColor = widget.isMobile
        ? const Color(0xFF64748B) // Slate 500
        : const Color(0xFF334155); // Slate 700

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14 * widget.scaleFactor,
            fontWeight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        SizedBox(
          height: widget.isMobile
              ? 8 * widget.scaleFactor
              : 6 * widget.scaleFactor,
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: 80 * widget.scaleFactor,
            maxHeight: 200 * widget.scaleFactor,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white, Color(0xFFF8FAFC)], // Slate 50
            ),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1), // Slate 200
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1E293B).withOpacity(0.05), // Slate 900
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            maxLines: null, // Allow unlimited lines
            minLines: 3, // Start with 3 lines
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: const Color(0xFF94A3B8), // Slate 400
                fontSize: 14 * widget.scaleFactor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12 * widget.scaleFactor),
            ),
            style: TextStyle(
              fontSize: 14 * widget.scaleFactor,
              height: 1.4, // Line height for better readability
            ),
          ),
        ),
      ],
    );
  }
}
