import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:drandme/modules/clinic/views/appointments/constants/dashboard_constants.dart';
import 'dashboard_summary_card.dart';

/// Dashboard summary cards section showing appointment statistics
class DashboardSummarySection extends StatelessWidget {
  final AppointmentDashboardViewModel viewModel;
  final BoxConstraints constraints;

  const DashboardSummarySection({
    super.key,
    required this.viewModel,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = constraints.maxWidth < 768;
    final totalAppointments = viewModel.summaryTotalAppointments;
    final arrivedPatients = viewModel.summaryArrivedAppointments;
    final completedAppointments = viewModel.summaryCompletedAppointments;

    final paymentTotal = viewModel.paymentTotal;
    final paymentCash = viewModel.paymentCash;
    final paymentCard = viewModel.paymentCard;
    final paymentUpi = viewModel.paymentUpi;

    if (isMobile) {
      return _buildMobileLayout(
        totalAppointments,
        arrivedPatients,
        completedAppointments,
        paymentTotal,
        paymentCash,
        paymentCard,
        paymentUpi,
      );
    } else {
      return _buildDesktopLayout(
        totalAppointments,
        arrivedPatients,
        completedAppointments,
        paymentTotal,
        paymentCash,
        paymentCard,
        paymentUpi,
      );
    }
  }

  /// Build mobile layout (2x2 grid)
  Widget _buildMobileLayout(
    int totalAppointments,
    int arrived,
    int completed,
    double total,
    double cash,
    double card,
    double upi,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DashboardSummaryCard(
                value: '$totalAppointments',
                label: 'Today\'s Appointments',
                baseColor: DashboardConstants.todayColor,
                icon: Icons.calendar_today_rounded,
                constraints: constraints,
                waveStyle: 0,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DashboardSummaryCard(
                value: '$arrived',
                label: 'Arrived Patients',
                baseColor: DashboardConstants.arrivedColor,
                icon: Icons.how_to_reg_rounded,
                constraints: constraints,
                waveStyle: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: DashboardSummaryCard(
                value: '$completed',
                label: 'Completed Appointments',
                baseColor: DashboardConstants.completedColor,
                icon: Icons.check_circle_rounded,
                constraints: constraints,
                waveStyle: 2,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DashboardPaymentSummaryCard(
                total: total,
                cash: cash,
                card: card,
                upi: upi,
                constraints: constraints,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build desktop layout (horizontal row)
  Widget _buildDesktopLayout(
    int totalAppointments,
    int arrived,
    int completed,
    double total,
    double cash,
    double card,
    double upi,
  ) {
    return Row(
      children: [
        Expanded(
          child: DashboardSummaryCard(
            value: '$totalAppointments',
            label: 'Today\'s Appointments',
            baseColor: DashboardConstants.todayColor,
            icon: Icons.calendar_today_rounded,
            constraints: constraints,
            waveStyle: 0,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DashboardSummaryCard(
            value: '$arrived',
            label: 'Arrived Patients',
            baseColor: DashboardConstants.arrivedColor,
            icon: Icons.how_to_reg_rounded,
            constraints: constraints,
            waveStyle: 1,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DashboardSummaryCard(
            value: '$completed',
            label: 'Completed Appointments',
            baseColor: DashboardConstants.completedColor,
            icon: Icons.check_circle_rounded,
            constraints: constraints,
            waveStyle: 2,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DashboardPaymentSummaryCard(
            total: total,
            cash: cash,
            card: card,
            upi: upi,
            constraints: constraints,
          ),
        ),
      ],
    );
  }
}

/// A premium, beautiful card showing total collection with a detailed breakdown (UPI, Cash, Card)
class DashboardPaymentSummaryCard extends StatelessWidget {
  final double total;
  final double cash;
  final double card;
  final double upi;
  final BoxConstraints constraints;

  const DashboardPaymentSummaryCard({
    super.key,
    required this.total,
    required this.cash,
    required this.card,
    required this.upi,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = constraints.maxWidth < 768;
    final cardHeight = isMobile ? 72.0 : 88.0;
    final padding = isMobile ? 8.0 : 12.0;
    final borderRadius = 12.0;

    // Soft sky-blue — "collections/money" pastel, harmonious with the other 4 cards
    const baseColor = Color(0xFFB8DCF0);
    const iconColor = Color(0xFF1A5F8A); // dark teal for icon readability
    const labelColor = Color(0xFF2A4A60);
    const valueColor = Color(0xFF0E2A40);

    String formatAmount(double amount) {
      if (amount >= 1000) {
        return '₹${(amount / 1000).toStringAsFixed(1)}k';
      }
      return '₹${amount.toStringAsFixed(0)}';
    }

    return Container(
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
          // Subtle white wave
          Positioned.fill(
            child: CustomPaint(
              painter: _PaymentWaveBackgroundPainter(
                color: Colors.white.withOpacity(0.18),
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                // Left: icon + total
                Expanded(
                  flex: isMobile ? 4 : 5,
                  child: Row(
                    children: [
                      // White circle icon
                      Container(
                        width: isMobile ? 32 : 40,
                        height: isMobile ? 32 : 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.currency_rupee_rounded,
                            size: 18,
                            color: iconColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Label + amount
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Collections",
                              style: TextStyle(
                                fontSize: isMobile ? 9 : 10,
                                fontWeight: FontWeight.w600,
                                color: labelColor,
                                letterSpacing: 0.1,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              formatAmount(total),
                              style: TextStyle(
                                fontSize: isMobile ? 16 : 20,
                                fontWeight: FontWeight.bold,
                                color: valueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Vertical divider
                Container(
                  width: 1,
                  height: cardHeight * 0.5,
                  color: Colors.white.withOpacity(0.50),
                ),
                SizedBox(width: isMobile ? 6 : 10),

                // Right: UPI / Cash / Card breakdown
                Expanded(
                  flex: isMobile ? 3 : 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBreakdownRow('UPI',  formatAmount(upi),  const Color(0xFF6B8FD4), labelColor, isMobile),
                      const SizedBox(height: 2),
                      _buildBreakdownRow('Cash', formatAmount(cash), const Color(0xFF4FAD82), labelColor, isMobile),
                      const SizedBox(height: 2),
                      _buildBreakdownRow('Card', formatAmount(card), const Color(0xFFD4906A), labelColor, isMobile),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(String mode, String value, Color dotColor, Color textColor, bool isMobile) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: isMobile ? 4 : 6),
        Text(
          mode,
          style: TextStyle(
            fontSize: isMobile ? 8.5 : 9.5,
            fontWeight: FontWeight.w500,
            color: textColor.withOpacity(0.75),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 8.5 : 9.5,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

/// Custom painter for payment wave background
class _PaymentWaveBackgroundPainter extends CustomPainter {
  final Color color;

  _PaymentWaveBackgroundPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.7,
      size.width * 0.45,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.3,
      size.width * 0.8,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.6,
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
