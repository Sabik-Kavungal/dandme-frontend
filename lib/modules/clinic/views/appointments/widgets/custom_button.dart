import 'package:flutter/material.dart';

/// A reusable custom button widget with consistent styling
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double scaleFactor;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.scaleFactor = 1.0,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? const Color(0xFF2C3E50),
        foregroundColor: foregroundColor ?? Colors.white,
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: 24 * scaleFactor,
              vertical: 12 * scaleFactor,
            ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      child: isLoading
          ? SizedBox(
              height: 18 * scaleFactor,
              width: 18 * scaleFactor,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 14 * scaleFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
