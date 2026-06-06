import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/appointment_list_item_model.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:drandme/modules/clinic/models/payment_method_model.dart';

class ExistingPaymentDialog extends StatefulWidget {
  final AppointmentListItem appointment;
  final AppointmentDashboardViewModel viewModel;

  const ExistingPaymentDialog({
    super.key,
    required this.appointment,
    required this.viewModel,
  });

  @override
  State<ExistingPaymentDialog> createState() => _ExistingPaymentDialogState();
}

class _ExistingPaymentDialogState extends State<ExistingPaymentDialog> {
  PaymentMethod _selectedMethod = PaymentMethod.payNow;
  PaymentType _selectedType = PaymentType.cash;
  bool _isProcessing = false;

  // Elite SaaS Design Tokens
  final _kPrimary = const Color(0xFF0F172A); // Slate Deep
  final _kAccent = const Color(0xFF3B82F6); // Modern Blue
  final _kSuccess = const Color(0xFF10B981);
  final _kBg = const Color(0xFFF8FAFC);
  final _kBorder = const Color(0xFFE2E8F0);
  final _kSub = const Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 400, // Compact width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header: Precise & Compact ────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 12, 0),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: _kAccent.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.account_balance_wallet_rounded, color: _kAccent, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Record Payment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Text(
                          'Ref: ${widget.appointment.bookingNumber}',
                          style: TextStyle(
                            fontSize: 11,
                            color: _kSub.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded, color: _kSub.withOpacity(0.5), size: 18),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ─── Clinical Summary: Elite Card ──────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _kBg.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: _kBorder.withOpacity(0.6)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: _kPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          widget.appointment.patientName.isNotEmpty 
                            ? widget.appointment.patientName[0].toUpperCase() 
                            : 'P',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.appointment.patientName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          Text(
                            'Consultation · Dr. ${widget.appointment.doctorName.split(' ').last}',
                            style: TextStyle(
                              fontSize: 10.5,
                              color: _kSub,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '₹${widget.appointment.feeAmount?.toStringAsFixed(0) ?? '0'}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: _kAccent,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ─── Selection: Precise Instrument Style ───────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAYMENT METHOD',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: _kSub.withOpacity(0.6),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildOption(
                    type: PaymentType.cash,
                    icon: Icons.payments_rounded,
                    label: 'Cash Payment',
                    desc: 'Physical currency',
                    activeColor: const Color(0xFF10B981),
                  ),
                  const SizedBox(height: 8),
                  _buildOption(
                    type: PaymentType.card,
                    icon: Icons.credit_card_rounded,
                    label: 'Card (POS)',
                    desc: 'Swipe or Tap',
                    activeColor: const Color(0xFF6366F1),
                  ),
                  const SizedBox(height: 8),
                  _buildOption(
                    type: PaymentType.upi,
                    icon: Icons.qr_code_scanner_rounded,
                    label: 'UPI / QR Scan',
                    desc: 'Digital Transfer',
                    activeColor: const Color(0xFFF59E0B),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ─── Footer: High-Contrast CTA ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: _isProcessing ? null : _handleConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _kPrimary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _isProcessing
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5, 
                            color: Colors.white,
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline_rounded, size: 16),
                            SizedBox(width: 8),
                            Text(
                              'Confirm Payment',
                              style: TextStyle(
                                fontWeight: FontWeight.w800, 
                                fontSize: 13.5,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required PaymentType type,
    required IconData icon,
    required String label,
    required String desc,
    required Color activeColor,
  }) {
    final isSelected = _selectedType == type;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _selectedType = type),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? activeColor.withOpacity(0.03) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? activeColor : _kBorder,
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isSelected ? activeColor : _kBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon, 
                    color: isSelected ? Colors.white : _kSub.withOpacity(0.8), 
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12.5,
                          color: isSelected ? activeColor : _kPrimary,
                        ),
                      ),
                      Text(
                        desc,
                        style: TextStyle(
                          fontSize: 10,
                          color: _kSub.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_rounded, color: activeColor, size: 18)
                else
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: _kBorder, width: 1.5),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleConfirm() async {
    setState(() => _isProcessing = true);
    
    try {
      final success = await widget.viewModel.confirmExistingPayment(
        appointmentId: widget.appointment.id,
        paymentMethod: _selectedType.name, // e.g., 'cash', 'card', or 'upi'
        paidAmount: widget.appointment.feeAmount ?? 0.0,
      );

      if (success && mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.verified_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 10),
                const Text(
                  'Transaction successfully recorded',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                ),
              ],
            ),
            backgroundColor: _kSuccess,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }
}
