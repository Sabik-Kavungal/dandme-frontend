import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'section_container.dart';
import 'section_header.dart';
import 'payment_method_selector.dart';

/// Payment method section with payment options
class PaymentMethodSection extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final double scaleFactor;

  const PaymentMethodSection({
    super.key,
    required this.viewModel,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      scaleFactor: scaleFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: Icons.payment,
            title: 'Payment Method',
            scaleFactor: scaleFactor,
            iconColor: const Color(0xFF28A745),
          ),
          SizedBox(height: (scaleFactor > 1 ? 12 : 8) * scaleFactor),
          PaymentMethodSelector(viewModel: viewModel, scaleFactor: scaleFactor),
        ],
      ),
    );
  }
}
