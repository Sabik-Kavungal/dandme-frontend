import 'package:flutter/material.dart';
import '../../viewmodels/appointments/new_appointment_viewmodel.dart';
import '../../models/payment_method_model.dart';

class PaymentConfirmationPopup extends StatefulWidget {
  final NewAppointmentViewModel viewModel;

  const PaymentConfirmationPopup({super.key, required this.viewModel});

  @override
  State<PaymentConfirmationPopup> createState() =>
      _PaymentConfirmationPopupState();
}

class _PaymentConfirmationPopupState extends State<PaymentConfirmationPopup> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.payNow;
  PaymentType? _selectedPaymentType;
  // Payment method options
  final List<PaymentMethod> _paymentMethodOptions = [
    PaymentMethod.payNow,
    PaymentMethod.payLater,
    PaymentMethod.wayOff,
  ];

  final List<PaymentType> _paymentTypeOptions = [
    PaymentType.cash,
    PaymentType.card,
    PaymentType.upi,
  ];

  @override
  Widget build(BuildContext context) {
    final selectedPatient = widget.viewModel.selectedClinicPatient;
    final selectedDoctor = widget.viewModel.selectedDoctorObject;
    final selectedSlot = widget.viewModel.selectedSlotDetails;
    final selectedDate = widget.viewModel.selectedSlotDate;

    if (selectedPatient == null ||
        selectedDoctor == null ||
        selectedSlot == null) {
      return const SizedBox.shrink();
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Patient Details Section
              _buildPatientSection(selectedPatient),
              const SizedBox(height: 12),

              // Doctor Details Section
              _buildDoctorSection(selectedDoctor),
              const SizedBox(height: 12),

              // Consulting Time and Cost Section
              _buildConsultingTimeSection(
                selectedDate,
                selectedSlot,
                selectedDoctor,
              ),
              const SizedBox(height: 12),

              // Charges Breakdown Section
              _buildChargesSection(selectedDoctor),
              const SizedBox(height: 12),

              // Payment Method Section
              _buildPaymentMethodSection(),
              const SizedBox(height: 16),

              // Action Buttons
              _buildActionButtons(widget.viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientSection(selectedPatient) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Patient Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              border: Border.all(color: Colors.red.shade200, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.person, color: Colors.red.shade600, size: 32),
          ),
          const SizedBox(width: 16),

          // Patient Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${selectedPatient.firstName} ${selectedPatient.lastName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mobile No: ${selectedPatient.phone}',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                Text(
                  'Mo ID: ${selectedPatient.moId ?? 'N/A'}',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Age and Gender
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Age: ${_calculateAge(selectedPatient.dateOfBirth)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                selectedPatient.gender ?? 'N/A',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorSection(selectedDoctor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Doctor Avatar with Green Dot
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  border: Border.all(color: Colors.red.shade200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.person, color: Colors.red.shade600, size: 32),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Doctor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. ${selectedDoctor.firstName ?? ''} ${selectedDoctor.lastName ?? ''}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  selectedDoctor.specialization ?? 'General Medicine',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsultingTimeSection(
    selectedDate,
    selectedSlot,
    selectedDoctor,
  ) {
    final appointmentTime = _formatAppointmentTime(selectedDate, selectedSlot);
    final endTime = _calculateEndTime(selectedDate, selectedSlot);
    final consultingFee =
        selectedDoctor.clinicSpecificFees?.consultationFeeOffline ??
        selectedDoctor.defaultFees?.consultationFee ??
        900.0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Time Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Consulting Time',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Text(
                  appointmentTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '1h duration, ends at $endTime',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Fee
          Text(
            'INR ${consultingFee.toInt()}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildChargesSection(selectedDoctor) {
    final consultingFee =
        selectedDoctor.clinicSpecificFees?.consultationFeeOffline ??
        selectedDoctor.defaultFees?.consultationFee ??
        900.0;
    final otherCharges = 0.0;
    final tax = 0.0;
    final discount = 0.0;
    final total = consultingFee + otherCharges + tax - discount;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildChargeRow('Other Charges', otherCharges),
          _buildChargeRow('Tax', tax),
          _buildChargeRow('Discount', discount),
          const Divider(height: 16),
          _buildChargeRow('Total', total, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildChargeRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment By',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: () => _showPaymentMethodDialog(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getPaymentMethodDisplayText(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(NewAppointmentViewModel viewModel) {
    return Row(
      children: [
        // Pay Now Button
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              // Validate payment configuration
              final currentPayment = AppointmentPayment(
                method: _selectedPaymentMethod,
                type: _selectedPaymentType,
              );

              if (!currentPayment.isValid) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      currentPayment.validationError ??
                          'Invalid payment configuration',
                    ),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 3),
                  ),
                );
                // Don't close popup, let user select payment type
                return;
              }

              // Update viewmodel with selected payment before creating appointment
              widget.viewModel.setPaymentMethodEnum(_selectedPaymentMethod);
              widget.viewModel.setPaymentType(_selectedPaymentType);

              // Close popup first
              Navigator.of(context).pop();

              // Create appointment with selected payment method
              final result = await viewModel.createSimpleAppointment();

              // Show success dialog if appointment was created
              if (result != null && mounted) {
                _showSuccessDialog(context, result);
              } else if (viewModel.error.isNotEmpty && mounted) {
                // Show error
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('❌ ${viewModel.error}'),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 4),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Pay Now',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Cancel Button
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black, width: 1),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  String _calculateAge(String? dateOfBirth) {
    if (dateOfBirth == null) return 'N/A';

    try {
      final dob = DateTime.parse(dateOfBirth);
      final now = DateTime.now();
      int age = now.year - dob.year;

      if (now.month < dob.month ||
          (now.month == dob.month && now.day < dob.day)) {
        age--;
      }

      return age.toString();
    } catch (e) {
      return 'N/A';
    }
  }

  String _formatAppointmentTime(DateTime selectedDate, selectedSlot) {
    try {
      // Extract time from slot
      String timeStr = selectedSlot.startTime;
      String hourMinute;

      if (timeStr.contains('T')) {
        // ISO format: 0000-01-01T14:45:00Z
        final dateTime = DateTime.parse(timeStr);
        hourMinute =
            '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
      } else {
        // HH:MM format
        final parts = timeStr.split(':');
        hourMinute = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
      }

      // Format date
      final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];

      final weekday = weekdays[selectedDate.weekday - 1];
      final day = selectedDate.day;
      final month = months[selectedDate.month - 1];
      final year = selectedDate.year;

      // Convert to 12-hour format
      final hour = int.parse(hourMinute.split(':')[0]);
      final minute = hourMinute.split(':')[1];
      final period = hour >= 12 ? 'pm' : 'am';
      final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

      return '$weekday $day $month $year at $hour12:$minute$period';
    } catch (e) {
      return 'Date/Time Error';
    }
  }

  String _calculateEndTime(DateTime selectedDate, selectedSlot) {
    try {
      // Extract time from slot
      String timeStr = selectedSlot.startTime;
      String hourMinute;

      if (timeStr.contains('T')) {
        // ISO format: 0000-01-01T14:45:00Z
        final dateTime = DateTime.parse(timeStr);
        hourMinute =
            '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
      } else {
        // HH:MM format
        final parts = timeStr.split(':');
        hourMinute = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
      }

      // Add 1 hour
      final hour = int.parse(hourMinute.split(':')[0]);
      final minute = hourMinute.split(':')[1];
      final endHour = (hour + 1) % 24;

      // Convert to 12-hour format
      final period = endHour >= 12 ? 'pm' : 'am';
      final hour12 = endHour > 12
          ? endHour - 12
          : (endHour == 0 ? 12 : endHour);

      return '$hour12:$minute$period';
    } catch (e) {
      return 'Time Error';
    }
  }

  String _getPaymentMethodDisplayText() {
    final payment = AppointmentPayment(
      method: _selectedPaymentMethod,
      type: _selectedPaymentType,
    );

    if (_selectedPaymentMethod == PaymentMethod.payNow &&
        _selectedPaymentType != null) {
      return '${payment.methodDisplayName} (${payment.typeDisplayName})';
    }
    return payment.methodDisplayName;
  }

  void _showPaymentMethodDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Select Payment Method'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Payment Method Selection
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ..._paymentMethodOptions.map((method) {
                      final isSelected = _selectedPaymentMethod == method;
                      return RadioListTile<PaymentMethod>(
                        title: Row(
                          children: [
                            Text(
                              method.methodIcon,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 8),
                            Text(method.displayName),
                          ],
                        ),
                        value: method,
                        groupValue: _selectedPaymentMethod,
                        onChanged: (value) {
                          setDialogState(() {
                            _selectedPaymentMethod = value!;
                            _selectedPaymentType = null; // Reset payment type
                          });
                          widget.viewModel.setPaymentMethodEnum(value!);
                        },
                      );
                    }).toList(),

                    // Payment Type Selection (only for Pay Now)
                    if (_selectedPaymentMethod == PaymentMethod.payNow) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Payment Type *',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ..._paymentTypeOptions.map((type) {
                        final isSelected = _selectedPaymentType == type;
                        return RadioListTile<PaymentType>(
                          title: Row(
                            children: [
                              Text(
                                type.typeIcon ?? '',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              Text(type.typeDisplayName ?? ''),
                            ],
                          ),
                          value: type,
                          groupValue: _selectedPaymentType,
                          onChanged: (value) {
                            setDialogState(() {
                              _selectedPaymentType = value;
                            });
                            widget.viewModel.setPaymentType(value);
                          },
                        );
                      }).toList(),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, result) {
    final appointment = result.appointment;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 32),
            SizedBox(width: 8),
            Text('Booking Confirmed!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointment successfully booked!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            _buildInfoRow('Booking Number:', appointment.bookingNumber),
            _buildInfoRow('Token Number:', '#${appointment.tokenNumber}'),
            _buildInfoRow('Status:', appointment.status),
            _buildInfoRow('Fee:', '₹${appointment.feeAmount ?? 0}'),
            _buildInfoRow('Payment:', appointment.paymentStatus ?? 'Pending'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to appointments list or payment
            },
            child: Text('View Details'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          Text(
            value?.toString() ?? 'N/A',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
