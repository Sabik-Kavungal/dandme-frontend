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
    final cleanFeeStatus = feeStatus?.trim().toLowerCase() ?? '';
    final cleanPaymentStatus = paymentStatus?.trim().toLowerCase() ?? '';
    final isPaid = cleanPaymentStatus == 'paid' || cleanFeeStatus.contains('paid');
    final primaryLabel = isPaid ? 'PAID' : (paymentStatus?.toUpperCase() ?? 'PENDING');
    final displayAmount = feeAmount != null ? '₹${feeAmount!.toStringAsFixed(2)}' : '₹0.00';
    
    // Logic to decide if we should show the secondary line
    bool showSecondary = false;
    String secondaryText = feeStatus ?? displayAmount;
    
    if (isPaid) {
      if (cleanFeeStatus != 'paid' && cleanFeeStatus != 'confirmed' && cleanFeeStatus.isNotEmpty) {
        showSecondary = true;
      } else if (feeAmount != null && feeAmount! > 0) {
        showSecondary = true;
        secondaryText = displayAmount;
      }
    } else {
      if (cleanFeeStatus != 'pending' && cleanFeeStatus.isNotEmpty) {
        showSecondary = true;
      } else {
        showSecondary = true;
        secondaryText = 'Pay Now';
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: isPaid ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              primaryLabel,
              style: TextStyle(
                color: isPaid ? const Color(0xFF059669) : const Color(0xFFD97706),
                fontSize: 9,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        if (showSecondary)
          isPaid
              ? Padding(
                  padding: const EdgeInsets.only(top: 1, left: 12),
                  child: Text(
                    secondaryText,
                    style: const TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onPayNowTap,
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: const Color(0xFF3B82F6).withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              size: 10,
                              color: Color(0xFF2563EB),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Color(0xFF2563EB),
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}
