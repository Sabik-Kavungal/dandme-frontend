import 'package:flutter/material.dart';
import 'dart:math';

/// A reusable dashboard summary card with gradient and wave pattern
class DashboardSummaryCard extends StatelessWidget {
  final String value;
  final String label;
  final Color baseColor;
  final IconData icon;
  final BoxConstraints constraints;
  final VoidCallback? onTap;
  final bool isSelected;

  const DashboardSummaryCard({
    super.key,
    required this.value,
    required this.label,
    required this.baseColor,
    required this.icon,
    required this.constraints,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = constraints.maxWidth < 768;
    final cardType = _getCardType(label);
    final cardHeight = isMobile ? 70.0 : 75.0;
    final iconSize = isMobile ? 21.0 : 25.0;
    final iconInnerSize = isMobile ? 11.0 : 13.0;
    final padding = isMobile ? 6.0 : 8.0;
    final borderRadius = 5.0;

    Widget cardContent = Container(
      height: cardHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: _getCardGradient(cardType, baseColor),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: isSelected
              ? _getIconColor(cardType).withOpacity(0.6)
              : Colors.white.withOpacity(0.8),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: _getIconColor(cardType).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Wavy background pattern
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: CustomPaint(
              size: Size(100, cardHeight),
              painter: _getWavyPainter(cardType),
            ),
          ),
          // Grid pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPatternPainter(
                color: _getTextColor(cardType).withOpacity(0.05),
                strokeWidth: 0.5,
              ),
            ),
          ),
          // Content
          Row(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: iconInnerSize,
                  color: _getIconColor(cardType),
                ),
              ),
              SizedBox(width: isMobile ? 8 : 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w900,
                        color: _getTextColor(cardType),
                        letterSpacing: -0.5,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: isMobile ? 1 : 1),
                    Flexible(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 11,
                          color: _getTextColor(cardType).withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: cardContent,
      );
    }
    return cardContent;
  }

  /// Get card type from label
  String _getCardType(String label) {
    final labelLower = label.toLowerCase();
    if (labelLower.contains('confirmed')) return 'confirmed';
    if (labelLower.contains('pending')) return 'pending';
    if (labelLower.contains('arrived')) return 'arrived';
    if (labelLower.contains('completed')) return 'completed';
    if (labelLower.contains('cancelled') || labelLower.contains('no show'))
      return 'cancelled';
    if (labelLower.contains('no_show') || labelLower.contains('no-show'))
      return 'no_show';
    if (labelLower.contains('today')) return 'today';
    if (labelLower.contains('upcoming')) return 'upcoming';
    return 'default';
  }

  /// Get gradient colors for card type - Modern light theme with subtle black accents
  LinearGradient _getCardGradient(String cardType, Color baseColor) {
    switch (cardType) {
      case 'confirmed':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFEBF8FF), // Very light blue
            Color(0xFFDBEAFE), // Light blue
            Color(0xFFBFDBFE), // Medium light blue
          ],
        );
      case 'pending':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFF7ED), // Very light orange
            Color(0xFFFFEDD5), // Light orange
            Color(0xFFFFE4B5), // Medium light orange
          ],
        );
      case 'arrived':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE0F7FA), // Very light cyan
            Color(0xFFB2EBF2), // Light cyan
            Color(0xFF80DEEA), // Medium light cyan
          ],
        );
      case 'completed':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF0FDF4), // Very light green
            Color(0xFFDCFCE7), // Light green
            Color(0xFFBBF7D0), // Medium light green
          ],
        );
      case 'cancelled':
      case 'no_show':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFEF2F2), // Very light red
            Color(0xFFFEE2E2), // Light red
            Color(0xFFFECACA), // Medium light red
          ],
        );
      case 'today':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFC), // Very light slate
            Color(0xFFF1F5F9), // Light slate
            Color(0xFFE2E8F0), // Medium light slate
          ],
        );
      case 'upcoming':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF0F9FF), // Very light blue
            Color(0xFFE0F2FE), // Light blue
            Color(0xFFBAE6FD), // Medium light blue
          ],
        );
      default:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFAFAFA), // Very light gray
            Color(0xFFF4F4F5), // Light gray
            Color(0xFFE4E4E7), // Medium light gray
          ],
        );
    }
  }

  /// Get icon color for card type - Modern subtle black accents
  Color _getIconColor(String cardType) {
    switch (cardType) {
      case 'confirmed':
        return const Color(0xFF2563EB); // Blue 600
      case 'pending':
        return const Color(0xFFF59E0B); // Amber 500
      case 'arrived':
        return const Color(0xFF0891B2); // Cyan 700
      case 'completed':
        return const Color(0xFF16A34A); // Green 600 - success green
      case 'cancelled':
      case 'no_show':
        return const Color(0xFFDC2626); // Red 600 - alert red
      case 'today':
        return const Color(0xFF475569); // Slate 600 - subtle dark
      case 'upcoming':
        return const Color(0xFF0284C7); // Blue 600 - professional blue
      default:
        return const Color(0xFF374151); // Gray 700 - neutral dark
    }
  }

  /// Get text color for card type - Dark text for light backgrounds
  Color _getTextColor(String cardType) {
    switch (cardType) {
      case 'confirmed':
        return const Color(0xFF1E3A8A); // Blue 900
      case 'pending':
        return const Color(0xFF92400E); // Amber 800
      case 'arrived':
        return const Color(0xFF164E63); // Cyan 900
      case 'completed':
        return const Color(0xFF14532D); // Green 900 - strong dark green
      case 'cancelled':
      case 'no_show':
        return const Color(0xFF7F1D1D); // Red 900 - strong dark red
      case 'today':
        return const Color(0xFF1E293B); // Slate 800 - strong dark
      case 'upcoming':
        return const Color(0xFF0C4A6E); // Blue 900 - strong dark blue
      default:
        return const Color(0xFF111827); // Gray 900 - strong dark
    }
  }

  /// Get wavy painter for card type
  CustomPainter _getWavyPainter(String cardType) {
    switch (cardType) {
      case 'confirmed':
        return _UpcomingWavyPainter(); // Reuse upcoming pattern for confirmed
      case 'pending':
        return _DefaultWavyPainter();
      case 'arrived':
        return _CompletedWavyPainter();
      case 'completed':
        return _CompletedWavyPainter();
      case 'cancelled':
      case 'no_show':
        return _CancelledWavyPainter();
      case 'today':
        return _TodayWavyPainter();
      case 'upcoming':
        return _UpcomingWavyPainter();
      default:
        return _DefaultWavyPainter();
    }
  }
}

/// Grid pattern painter
class _GridPatternPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _GridPatternPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const double spacing = 20.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Today's wave pattern
class _TodayWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF475569).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = const Color(0xFF475569).withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.4;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 6) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.3 * sin(x / size.width * 4 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 8 * pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.3 * sin(0)) +
          (waveHeight * 0.2 * sin(0)),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.3 * sin(x / size.width * 4 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 8 * pi));
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Upcoming wave pattern
class _UpcomingWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0284C7).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = const Color(0xFF0284C7).withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.5;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 5) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.4 * sin(x / size.width * 3 * pi)) +
          (x / size.width * waveHeight * 0.3);
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.4 * sin(0)) +
          (0 / size.width * waveHeight * 0.3),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.4 * sin(x / size.width * 3 * pi)) +
          (x / size.width * waveHeight * 0.3);
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Completed wave pattern
class _CompletedWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF16A34A).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = const Color(0xFF16A34A).withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.35;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 8) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.5 * sin(x / size.width * 2 * pi)) +
          (waveHeight * 0.3 * sin(x / size.width * 6 * pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.5 * sin(0)) +
          (waveHeight * 0.3 * sin(0)),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.5 * sin(x / size.width * 2 * pi)) +
          (waveHeight * 0.3 * sin(x / size.width * 6 * pi));
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Cancelled wave pattern
class _CancelledWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFDC2626).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final wavePaint = Paint()
      ..color = const Color(0xFFDC2626).withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final waveHeight = size.height * 0.45;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 6) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.6 * sin(x / size.width * 5 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 10 * pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    final wavePath = Path();
    wavePath.moveTo(
      0,
      size.height -
          waveHeight +
          (waveHeight * 0.6 * sin(0)) +
          (waveHeight * 0.2 * sin(0)),
    );

    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.6 * sin(x / size.width * 5 * pi)) +
          (waveHeight * 0.2 * sin(x / size.width * 10 * pi));
      wavePath.lineTo(x, y);
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Default wave pattern
class _DefaultWavyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF374151).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = size.height * 0.3;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 10) {
      final y =
          size.height -
          waveHeight +
          (waveHeight * 0.5 * (1 + sin(x / size.width * 2 * pi)));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
