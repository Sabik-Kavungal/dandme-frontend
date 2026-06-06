import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/models/payment_method_model.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

/// A reusable payment method selector widget
class PaymentMethodSelector extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;

  const PaymentMethodSelector({
    super.key,
    required this.viewModel,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    // Current state from ViewModel
    final isWalkInActive = viewModel.isWalkIn;

    return Wrap(
      spacing: 8 * scaleFactor,
      runSpacing: 8 * scaleFactor,
      children: _buildPaymentWidgets(isWalkInActive),
    );
  }

  /// ✅ Refactored: Logic for building payment chips
  List<Widget> _buildPaymentWidgets(bool isWalkInActive) {
    final widgets = <Widget>[];

    if (isWalkInActive) {
      // ✅ Mode 1: Walk-in is TOGGLED ON
      // Show ONLY the Walk-in button as the selected option
      widgets.add(
        GestureDetector(
          onTap: () {
            // Allow toggling off from the chip as well
            viewModel.setWalkInMode(null);
          },
          child: _buildPaymentOptionChip(
            isSelected: true,
            icon: '🚶',
            label: 'Walk-in',
            isWalkIn: true,
          ),
        ),
      );
    } else {
      // ✅ Mode 2: Standard Appointment
      // Show standard payment methods (Walk-in button is hidden until radio toggled)
      for (final method in PaymentMethodOptions.allMethods) {
        final isSelected = viewModel.selectedPaymentMethodEnum == method;
        widgets.add(
          GestureDetector(
            onTap: () => viewModel.setPaymentMethodEnum(method),
            child: _buildPaymentOptionChip(
              isSelected: isSelected,
              icon: method.methodIcon,
              label: method.displayName,
              isWalkIn: false,
            ),
          ),
        );
      }
    }

    return widgets;
  }

  Widget _buildPaymentOptionChip({
    required bool isSelected,
    required String icon,
    required String label,
    required bool isWalkIn,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
        horizontal: 8 * scaleFactor,
        vertical: 5 * scaleFactor,
      ),
      decoration: BoxDecoration(
        gradient: isSelected
            ? (isWalkIn
                  ? const LinearGradient(
                      colors: [
                        Color(0xFFFFF7ED),
                        Color(0xFFFFE4E6),
                      ], // Light Orange for Walk-in
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : const LinearGradient(
                      colors: [Color(0xFFF1F5F9), Color(0xFFE2E8F0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ))
            : null,
        color: isSelected ? null : Colors.white,
        border: Border.all(
          color: isSelected
              ? (isWalkIn ? const Color(0xFFF97316) : const Color(0xFF94A3B8))
              : const Color(0xFFE5E7EB),
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          if (isSelected) ...[
            BoxShadow(
              color:
                  (isWalkIn ? const Color(0xFFF97316) : const Color(0xFF64748B))
                      .withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 3),
              spreadRadius: 1,
            ),
          ] else
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon with gradient background
          Container(
            padding: EdgeInsets.all(4 * scaleFactor),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? (isWalkIn
                        ? const LinearGradient(
                            colors: [
                              Color(0xFFF97316),
                              Color(0xFFEA580C),
                            ], // Orange for Walk-in
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ))
                  : const LinearGradient(
                      colors: [Color(0xFFF8F9FA), Color(0xFFE5E7EB)],
                    ),
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color:
                            (isWalkIn
                                    ? const Color(0xFFF97316)
                                    : const Color(0xFF3B82F6))
                                .withOpacity(0.4),
                        blurRadius: 6,
                        spreadRadius: 0.5,
                      ),
                    ]
                  : null,
            ),
            child: Text(icon, style: TextStyle(fontSize: 14 * scaleFactor)),
          ),
          SizedBox(width: 6 * scaleFactor),
          // Method name
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5 * scaleFactor,
              fontWeight: FontWeight.w700,
              color: isSelected
                  ? (isWalkIn
                        ? const Color(0xFF9A3412)
                        : const Color(0xFF1E293B))
                  : const Color(0xFF64748B),
              letterSpacing: 0.3,
            ),
          ),
          // Checkmark
          if (isSelected) ...[
            SizedBox(width: 5 * scaleFactor),
            Container(
              padding: EdgeInsets.all(2 * scaleFactor),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF059669)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withValues(alpha: 0.4),
                    blurRadius: 4,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Icon(
                Icons.check_rounded,
                size: 11 * scaleFactor,
                color: Colors.white,
                weight: 900,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
