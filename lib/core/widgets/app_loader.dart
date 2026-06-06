import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'package:drandme/core/utils/loading_manager.dart';

/// A high-end, healthcare-inspired loading indicator for 2026.
/// Features a double-ring gradient animation with a heartbeat pulse.
class AppLoader extends StatefulWidget {
  final double size;
  final Color? color;
  final double strokeWidth;
  final bool showMessage;
  final String? message;

  const AppLoader({
    super.key,
    this.size = 40.0,
    this.color,
    this.strokeWidth = 3.0,
    this.showMessage = false,
    this.message,
  });

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loaderColor = widget.color ?? const Color(0xFF2C3E50);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _rotationController,
              _pulseController,
            ]),
            builder: (context, child) {
              return CustomPaint(
                painter: _Classic2026Painter(
                  rotationValue: _rotationController.value,
                  pulseValue: _pulseController.value,
                  color: loaderColor,
                  strokeWidth: widget.strokeWidth,
                ),
              );
            },
          ),
        ),
        if (widget.showMessage && widget.message != null) ...[
          const SizedBox(height: 16),
          Text(
            widget.message!,
            style: TextStyle(
              color: loaderColor.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              decoration:
                  TextDecoration.none, // Prevent yellow underline in overlay
            ),
          ),
        ],
      ],
    );
  }
}

class _Classic2026Painter extends CustomPainter {
  final double rotationValue;
  final double pulseValue;
  final Color color;
  final double strokeWidth;

  _Classic2026Painter({
    required this.rotationValue,
    required this.pulseValue,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // 1. Background Track (Static)
    final trackPaint = Paint()
      ..color = color.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, trackPaint);

    // 2. Heartbeat Pulse Glow
    final glowPaint = Paint()
      ..color = color.withOpacity(0.1 * (1 - pulseValue))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * (0.5 + pulseValue * 0.5), glowPaint);

    // 3. Rotating Gradient Ring
    final ringPaint = Paint()
      ..shader = SweepGradient(
        colors: [color.withOpacity(0.0), color.withOpacity(0.2), color],
        stops: const [0.0, 0.5, 1.0],
        transform: GradientRotation(rotationValue * 2 * math.pi),
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      rotationValue * 2 * math.pi,
      math.pi * 1.2,
      false,
      ringPaint,
    );

    // 4. Center Hub (Heartbeat Hub)
    final hubPaint = Paint()
      ..color = color.withOpacity(0.8 + (pulseValue * 0.2))
      ..style = PaintingStyle.fill;

    // Draw center hub
    canvas.drawCircle(
      center,
      strokeWidth * 1.5 * (1 + pulseValue * 0.2),
      hubPaint,
    );

    // Draw white plus inside hub
    if (size.width > 20) {
      final plusPaint = Paint()
        ..color = Colors.white
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.round;

      final pSize = strokeWidth * 0.7;
      canvas.drawLine(
        Offset(center.dx - pSize, center.dy),
        Offset(center.dx + pSize, center.dy),
        plusPaint,
      );
      canvas.drawLine(
        Offset(center.dx, center.dy - pSize),
        Offset(center.dx, center.dy + pSize),
        plusPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _Classic2026Painter oldDelegate) {
    return oldDelegate.rotationValue != rotationValue ||
        oldDelegate.pulseValue != pulseValue;
  }
}

/// A global overlay that listens to LoadingManager and shows the premium loader.
class GlobalLoadingOverlay extends StatelessWidget {
  final Widget child;

  const GlobalLoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: LoadingManager.isLoading,
      builder: (context, isLoading, _) {
        return Stack(
          children: [
            child,
            if (isLoading)
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 300),
                builder: (context, opacity, _) {
                  return Opacity(
                    opacity: opacity,
                    child: Container(
                      color: Colors.white.withOpacity(0.4),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Center(
                          child: ValueListenableBuilder<String?>(
                            valueListenable: LoadingManager.message,
                            builder: (context, message, _) {
                              return AppLoader(
                                size: 70,
                                strokeWidth: 4,
                                showMessage: true,
                                message: message ?? 'Please Wait...',
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

/// A specialized loader for healthcare context with heartbeat pulse.
class HealthcareLoadingScreen extends StatelessWidget {
  final String? message;

  const HealthcareLoadingScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLoader(
              size: 100,
              strokeWidth: 5,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 32),
            Text(
              message ?? 'Loading Healthcare Suite...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[800],
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Securely connecting to patient records',
              style: TextStyle(fontSize: 14, color: Colors.blueGrey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
