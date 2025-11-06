import 'package:flutter/material.dart';

/// Auto-expanding notes field widget for appointment booking
class AutoExpandingNotesField extends StatefulWidget {
  final String label;
  final String hint;
  final double scaleFactor;
  final String value;
  final Function(String) onChanged;
  final bool isMobile;

  const AutoExpandingNotesField({
    super.key,
    required this.label,
    required this.hint,
    this.scaleFactor = 1.0,
    required this.value,
    required this.onChanged,
    this.isMobile = false,
  });

  @override
  State<AutoExpandingNotesField> createState() =>
      _AutoExpandingNotesFieldState();
}

class _AutoExpandingNotesFieldState extends State<AutoExpandingNotesField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelColor = widget.isMobile
        ? const Color(0xFF666666)
        : const Color(0xFF333333);

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
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            maxLines: null, // Allow unlimited lines
            minLines: 3, // Start with 3 lines
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: const Color(0xFF999999),
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
