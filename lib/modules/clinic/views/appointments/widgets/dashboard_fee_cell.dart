import 'package:flutter/material.dart';

/// A reusable fee status cell widget
class DashboardFeeCell extends StatelessWidget {
  final String? feeStatus;
  final double? feeAmount;
  final String? paymentStatus;
  final VoidCallback? onPayNowTap;

  const DashboardFeeCell({
    super.key,
    required this.feeStatus,
    required this.feeAmount,
    required this.paymentStatus,
    this.onPayNowTap,
  });

  @override
  Widget build(BuildContext context) {
    // If payment is paid, show the fee amount
    if (paymentStatus == 'paid' || feeStatus?.contains('₹') == true) {
      return Text(
        feeStatus ??
            (feeAmount != null ? '₹${feeAmount?.toStringAsFixed(2)}' : '₹0.00'),
        style: const TextStyle(color: Color(0xFF333333), fontSize: 10),
      );
    } else {
      // If payment is pending, show "Pay Now" link
      return GestureDetector(
        onTap: onPayNowTap,
        child: Text(
          feeStatus ?? 'Pay Now',
          style: const TextStyle(
            color: Color(0xFF007BFF),
            fontSize: 10,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }
  }
}
