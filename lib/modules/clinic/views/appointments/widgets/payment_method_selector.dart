import 'package:flutter/material.dart';
import 'package:a/modules/clinic/models/payment_method_model.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';

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
    return Wrap(
      spacing: 8 * scaleFactor,
      runSpacing: 8 * scaleFactor,
      children: PaymentMethodOptions.allMethods.map((method) {
        final isSelected = viewModel.selectedPaymentMethodEnum == method;
        return GestureDetector(
          onTap: () {
            viewModel.setPaymentMethodEnum(method);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(
              horizontal: 8 * scaleFactor,
              vertical: 5 * scaleFactor,
            ),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? const LinearGradient(
                      colors: [Color(0xFFF1F5F9), Color(0xFFE2E8F0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isSelected ? null : Colors.white,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF94A3B8)
                    : const Color(0xFFE5E7EB),
                width: isSelected ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (isSelected) ...[
                  BoxShadow(
                    color: const Color(0xFF64748B).withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: const Color(0xFF64748B).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                    spreadRadius: 2,
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
                        ? const LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [Color(0xFFF8F9FA), Color(0xFFE5E7EB)],
                          ),
                    shape: BoxShape.circle,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: const Color(0xFF3B82F6).withOpacity(0.4),
                              blurRadius: 6,
                              spreadRadius: 0.5,
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    method.methodIcon,
                    style: TextStyle(fontSize: 14 * scaleFactor),
                  ),
                ),
                SizedBox(width: 6 * scaleFactor),
                // Method name with enhanced styling
                Text(
                  method.displayName,
                  style: TextStyle(
                    fontSize: 11.5 * scaleFactor,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? const Color(0xFF1E293B)
                        : const Color(0xFF64748B),
                    letterSpacing: 0.3,
                  ),
                ),
                // Animated checkmark for selected state
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
                          color: const Color(0xFF10B981).withOpacity(0.4),
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
          ),
        );
      }).toList(),
    );
  }
}
