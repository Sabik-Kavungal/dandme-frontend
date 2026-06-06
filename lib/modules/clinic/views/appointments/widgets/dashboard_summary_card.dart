import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';

/// A reusable dashboard summary card matching ClinicAdminDashboard style with wave background
class DashboardSummaryCard extends StatelessWidget {
  final String value;
  final String label;
  final Color baseColor;
  final IconData icon;
  final BoxConstraints constraints;
  final VoidCallback? onTap;
  final bool isSelected;
  final int waveStyle; // 0, 1, 2, 3 for different wave patterns

  const DashboardSummaryCard({
    super.key,
    required this.value,
    required this.label,
    required this.baseColor,
    required this.icon,
    required this.constraints,
    this.onTap,
    this.isSelected = false,
    this.waveStyle = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = constraints.maxWidth < 768;

    final cardHeight = isMobile ? 72.0 : 88.0;
    final padding = isMobile ? 12.0 : 14.0;
    final borderRadius = 12.0;

    Widget cardContent = Container(
      height: cardHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: baseColor.withOpacity(0.45),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Subtle wave for depth
          Positioned.fill(
            child: CustomPaint(
              painter: _WaveBackgroundPainter(
                color: Colors.white.withOpacity(0.18),
                style: waveStyle,
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                // White circular icon container
                Container(
                  width: isMobile ? 36 : 42,
                  height: isMobile ? 36 : 42,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: isMobile ? 18 : 22,
                      // Darken the pastel to get a readable icon color
                      color: HSLColor.fromColor(baseColor)
                          .withLightness(0.30)
                          .withSaturation(0.55)
                          .toColor(),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Text — dark for readability on pastel background
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: isMobile ? 9 : 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4A4060),
                          letterSpacing: 0.1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E1830),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: cardContent,
        ),
      );
    }
    return cardContent;
  }
}

/// Custom painter for different wave patterns
class _WaveBackgroundPainter extends CustomPainter {
  final Color color;
  final int style;

  _WaveBackgroundPainter({required this.color, required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Healthcare-contextual wave patterns
    switch (style) {
      case 0: // Today's Appointments - Steady heartbeat rhythm
        path.moveTo(0, size.height * 0.65);
        // Gentle pulse pattern like ECG
        path.cubicTo(
          size.width * 0.15,
          size.height * 0.65,
          size.width * 0.2,
          size.height * 0.45,
          size.width * 0.25,
          size.height * 0.55,
        );
        path.cubicTo(
          size.width * 0.3,
          size.height * 0.65,
          size.width * 0.5,
          size.height * 0.7,
          size.width * 0.65,
          size.height * 0.6,
        );
        path.cubicTo(
          size.width * 0.8,
          size.height * 0.5,
          size.width * 0.9,
          size.height * 0.65,
          size.width,
          size.height * 0.6,
        );
        break;

      case 1: // Arrived Patients - Rising activity wave
        path.moveTo(0, size.height * 0.85);
        // Upward momentum showing patient flow
        path.quadraticBezierTo(
          size.width * 0.25,
          size.height * 0.75,
          size.width * 0.4,
          size.height * 0.55,
        );
        path.quadraticBezierTo(
          size.width * 0.6,
          size.height * 0.3,
          size.width * 0.75,
          size.height * 0.5,
        );
        path.quadraticBezierTo(
          size.width * 0.85,
          size.height * 0.65,
          size.width,
          size.height * 0.55,
        );
        break;

      case 2: // Completed Appointments - Smooth completion curve
        path.moveTo(0, size.height * 0.5);
        // Gentle descending curve showing successful completion
        path.cubicTo(
          size.width * 0.2,
          size.height * 0.45,
          size.width * 0.35,
          size.height * 0.6,
          size.width * 0.5,
          size.height * 0.65,
        );
        path.cubicTo(
          size.width * 0.65,
          size.height * 0.7,
          size.width * 0.8,
          size.height * 0.55,
          size.width,
          size.height * 0.6,
        );
        break;

      case 3: // Cancelled/No Show - Declining irregular pattern
        path.moveTo(0, size.height * 0.6);
        // Irregular drops showing cancellations
        path.lineTo(size.width * 0.15, size.height * 0.7);
        path.lineTo(size.width * 0.25, size.height * 0.85);
        path.lineTo(size.width * 0.4, size.height * 0.75);
        path.lineTo(size.width * 0.55, size.height * 0.9);
        path.lineTo(size.width * 0.7, size.height * 0.8);
        path.lineTo(size.width * 0.85, size.height * 0.85);
        path.lineTo(size.width, size.height * 0.75);
        break;

      default:
        path.moveTo(0, size.height * 0.6);
        path.quadraticBezierTo(
          size.width * 0.5,
          size.height * 0.8,
          size.width,
          size.height * 0.6,
        );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
