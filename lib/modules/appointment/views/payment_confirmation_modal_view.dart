import 'package:flutter/material.dart';

class PaymentConfirmationModal extends StatefulWidget {
  const PaymentConfirmationModal({super.key});

  @override
  State<PaymentConfirmationModal> createState() =>
      _PaymentConfirmationModalState();
}

class _PaymentConfirmationModalState extends State<PaymentConfirmationModal> {
  String selectedPaymentMethod = 'UPI';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 480;
    final isTablet = screenWidth >= 480 && screenWidth < 1024;

    // Determine modal width
    double modalWidth;
    if (isMobile) {
      modalWidth = screenWidth * 0.9; // 90% on mobile
    } else if (isTablet) {
      modalWidth = 400; // Fixed 400px on tablet
    } else {
      modalWidth = 380; // Fixed 380px on desktop (matching image)
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 24 : 40,
      ),
      child: Container(
        width: modalWidth,
        constraints: BoxConstraints(
          maxWidth: modalWidth,
          maxHeight: screenHeight * 0.9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Scrollable content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 20 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Patient Information
                    _buildPatientInfo(isMobile),
                    const SizedBox(height: 16),

                    // Divider
                    const Divider(color: Color(0xFFE0E0E0), thickness: 1),
                    const SizedBox(height: 16),

                    // Doctor Information
                    _buildDoctorInfo(isMobile),
                    const SizedBox(height: 20),

                    // Consulting Time & Fee
                    _buildConsultingTimeFee(isMobile),
                    const SizedBox(height: 20),

                    // Charges Breakdown
                    _buildChargesBreakdown(isMobile),
                    const SizedBox(height: 20),

                    // Payment Method
                    _buildPaymentMethod(isMobile),
                  ],
                ),
              ),
            ),

            // Fixed bottom buttons
            Container(
              padding: EdgeInsets.all(isMobile ? 20 : 24),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFF0F0F0), width: 1),
                ),
              ),
              child: _buildActionButtons(isMobile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfo(bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Patient Avatar
        Container(
          width: isMobile ? 45 : 50,
          height: isMobile ? 45 : 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5F5),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFF5252), width: 2),
          ),
          child: Icon(
            Icons.person,
            color: const Color(0xFFFF5252),
            size: isMobile ? 20 : 24,
          ),
        ),
        SizedBox(width: isMobile ? 12 : 16),
        // Patient Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Safeer Ameen',
                style: TextStyle(
                  fontSize: isMobile ? 15 : 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Mobile No: 9388277372',
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  color: const Color(0xFF666666),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    'Mo ID: 84375H38',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: const Color(0xFF666666),
                    ),
                  ),
                  SizedBox(width: isMobile ? 12 : 16),
                  Text(
                    'Age: 36 Male',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorInfo(bool isMobile) {
    return Row(
      children: [
        // Doctor Avatar
        Container(
          width: isMobile ? 45 : 50,
          height: isMobile ? 45 : 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5F5),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFF5252), width: 2),
          ),
          child: Icon(
            Icons.person,
            color: const Color(0xFFFF5252),
            size: isMobile ? 20 : 24,
          ),
        ),
        SizedBox(width: isMobile ? 12 : 16),
        // Doctor Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Arun Krishna C',
                style: TextStyle(
                  fontSize: isMobile ? 15 : 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Orthology',
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  color: const Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConsultingTimeFee(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Consulting Time',
          style: TextStyle(
            fontSize: isMobile ? 12 : 13,
            color: const Color(0xFF666666),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Sun 16 July 2023 at 5:00pm',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            Text(
              'INR 900',
              style: TextStyle(
                fontSize: isMobile ? 14 : 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '1h duration, ends at 6:00pm',
          style: TextStyle(
            fontSize: isMobile ? 11 : 12,
            color: const Color(0xFF999999),
          ),
        ),
      ],
    );
  }

  Widget _buildChargesBreakdown(bool isMobile) {
    return Column(
      children: [
        _buildChargeRow('Other Charges', '00.00', isMobile),
        const SizedBox(height: 8),
        _buildChargeRow('Tax', '00.00', isMobile),
        const SizedBox(height: 8),
        _buildChargeRow('Discount', '00.00', isMobile),
        const SizedBox(height: 12),
        const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 1),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
            Text(
              'INR 900',
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChargeRow(String label, String amount, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 13 : 14,
            color: const Color(0xFF666666),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isMobile ? 13 : 14,
            color: const Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment By',
          style: TextStyle(
            fontSize: isMobile ? 13 : 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: isMobile ? 44 : 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
              isExpanded: true,
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
              items: const [
                DropdownMenuItem(value: 'UPI', child: Text('UPI')),
                DropdownMenuItem(
                  value: 'Credit Card',
                  child: Text('Credit Card'),
                ),
                DropdownMenuItem(
                  value: 'Debit Card',
                  child: Text('Debit Card'),
                ),
                DropdownMenuItem(
                  value: 'Net Banking',
                  child: Text('Net Banking'),
                ),
              ],
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF666666),
                size: 20,
              ),
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: const Color(0xFF333333),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Column(
      children: [
        // Pay Now Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Handle payment logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: isMobile ? 14 : 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Pay Now',
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Cancel Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF333333),
              side: const BorderSide(color: Color(0xFFE0E0E0)),
              padding: EdgeInsets.symmetric(vertical: isMobile ? 14 : 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
