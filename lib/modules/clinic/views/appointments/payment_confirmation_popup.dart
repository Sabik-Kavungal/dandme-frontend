import 'package:flutter/material.dart';
import '../../viewmodels/appointments/new_appointment_viewmodel.dart';
import '../../models/payment_method_model.dart';
import '../../models/receipt_model.dart';
import 'widgets/receipt_action_buttons.dart';

// ─── Minimal color palette ────────────────────────────────────────────────────
const _kText = Color(0xFF1A1A2E); // near-black text
const _kSub = Color(0xFF6B7280); // muted label
const _kBorder = Color(0xFFE5E7EB); // thin border
const _kBg = Color(0xFFF9FAFB); // card background
const _kPrimary = Colors.black; // CTA black (one accent only)
const _kSuccess = Color(0xFF059669); // success green

class PaymentConfirmationPopup extends StatefulWidget {
  final NewAppointmentViewModel viewModel;
  final Function(String)? onNavigate;
  final BuildContext parentContext; // ✅ Required for safe dialog transitions

  const PaymentConfirmationPopup({
    super.key,
    required this.viewModel,
    this.onNavigate,
    required this.parentContext,
  });

  @override
  State<PaymentConfirmationPopup> createState() =>
      _PaymentConfirmationPopupState();
}

class _PaymentConfirmationPopupState extends State<PaymentConfirmationPopup> {
  late PaymentMethod _method;
  PaymentType? _type;

  @override
  void initState() {
    super.initState();
    // Initialize from ViewModel
    _method = widget.viewModel.selectedPaymentMethodEnum;
    _type = widget.viewModel.selectedPaymentType;
    
    // Default if not set
    if (_method == PaymentMethod.payNow && _type == null) {
      _type = PaymentType.cash;
    }
  }

  // ─── helpers ──────────────────────────────────────────────────────────────
  String _age(String? dob) {
    if (dob == null) return 'N/A';
    try {
      final d = DateTime.parse(dob);
      final n = DateTime.now();
      int a = n.year - d.year;
      if (n.month < d.month || (n.month == d.month && n.day < d.day)) a--;
      return '$a yrs';
    } catch (_) {
      return 'N/A';
    }
  }

  double _fee(dynamic doc, String type) {
    final online =
        type == 'video_consultation' || type == 'follow-up-via-video';
    
    final offlineFee = doc.clinicSpecificFees?.consultationFeeOffline;
    final onlineFee = doc.clinicSpecificFees?.consultationFeeOnline;
    final defaultFee = doc.defaultFees?.consultationFee;
    
    print('💰 FEE DEBUG:');
    print('   Doctor: ${doc.firstName} ${doc.lastName}');
    print('   Type: $type (Online: $online)');
    print('   Offline Fee: $offlineFee');
    print('   Online Fee: $onlineFee');
    print('   Default Fee: $defaultFee');

    final result = online
        ? (onlineFee ?? defaultFee ?? 0.0)
        : (offlineFee ?? defaultFee ?? 0.0);
        
    print('   RESULT: $result');
    return result;
  }

  String _fmtTime(DateTime date, dynamic slot) {
    try {
      final t = slot.startTime as String;
      final dt = t.contains('T') ? DateTime.parse(t) : null;
      final h = dt?.hour ?? int.parse(t.split(':')[0]);
      final m = dt?.minute ?? int.parse(t.split(':')[1]);
      final p = h >= 12 ? 'PM' : 'AM';
      final h12 = h > 12 ? h - 12 : (h == 0 ? 12 : h);
      const mo = [
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
      return '${date.day} ${mo[date.month - 1]} ${date.year}  ·  '
          '$h12:${m.toString().padLeft(2, '0')} $p';
    } catch (_) {
      return 'N/A';
    }
  }

  String _endTime(dynamic slot) {
    try {
      final t = slot.startTime as String;
      final dt = t.contains('T') ? DateTime.parse(t) : null;
      final h = dt?.hour ?? int.parse(t.split(':')[0]);
      final m = dt?.minute ?? int.parse(t.split(':')[1]);
      final eh = (h + 1) % 24;
      final p = eh >= 12 ? 'PM' : 'AM';
      final h12 = eh > 12 ? eh - 12 : (eh == 0 ? 12 : eh);
      return '$h12:${m.toString().padLeft(2, '0')} $p';
    } catch (_) {
      return 'N/A';
    }
  }

  String _mo(int m) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[m - 1];
  }

  // ─── build ────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final patient = widget.viewModel.selectedClinicPatient;
    final doctor = widget.viewModel.selectedDoctorObject;
    final slot = widget.viewModel.selectedSlotDetails;
    final date = widget.viewModel.selectedSlotDate;
    final cType = widget.viewModel.selectedConsultationType;

    if (patient == null || doctor == null || (slot == null && !widget.viewModel.isWalkIn)) {
      return const SizedBox.shrink();
    }

    final fee = _fee(doctor, cType);

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: SizedBox(
        width: 480,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Title bar ──────────────────────────────────────────────────
            _TitleBar(onClose: () => Navigator.of(context).pop()),

            // ── Body ───────────────────────────────────────────────────────
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Patient row
                    _SectionLabel('Patient'),
                    const SizedBox(height: 6),
                    _PersonRow(
                      initial: patient.firstName.isNotEmpty
                          ? patient.firstName[0].toUpperCase()
                          : '?',
                      name: '${patient.firstName} ${patient.lastName}',
                      sub: patient.phone,
                      trailing: _age(patient.dateOfBirth),
                    ),

                    _Divider(),

                    // Doctor row
                    _SectionLabel('Doctor'),
                    const SizedBox(height: 6),
                    _PersonRow(
                      initial: (doctor.firstName?.isNotEmpty == true)
                          ? doctor.firstName![0].toUpperCase()
                          : 'D',
                      name:
                          'Dr. ${doctor.firstName ?? ''} ${doctor.lastName ?? ''}',
                      sub: doctor.specialization ?? 'General Medicine',
                      // online indicator dot
                      trailing: '● Available',
                      trailingColor: _kSuccess,
                    ),

                    _Divider(),

                    // Appointment slot
                    _SectionLabel('Appointment'),
                    const SizedBox(height: 6),
                    _InfoRow(
                      Icons.calendar_today_outlined,
                      widget.viewModel.isWalkIn
                          ? '${date.day} ${_mo(date.month)} ${date.year} (Walk-in)'
                          : _fmtTime(date, slot),
                    ),
                    if (!widget.viewModel.isWalkIn && slot != null) ...[
                      const SizedBox(height: 4),
                      _InfoRow(
                        Icons.access_time_outlined,
                        'Ends ~ ${_endTime(slot)}',
                      ),
                    ],

                    _Divider(),

                    // Fee summary
                    _SectionLabel('Fee'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Consultation fee',
                          style: TextStyle(fontSize: 13, color: _kSub),
                        ),
                        Text(
                          '₹${fee.toInt()}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _kText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(color: _kBorder, height: 1),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: _kText,
                          ),
                        ),
                        Text(
                          '₹${fee.toInt()}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: _kText,
                          ),
                        ),
                      ],
                    ),

                    _Divider(),

                    // Payment method chooser
                    _SectionLabel('Payment'),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: _kBg,
                        border: Border.all(color: _kBorder),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _method == PaymentMethod.payNow 
                              ? 'pay_now_${_type?.name ?? 'cash'}'
                              : (_method == PaymentMethod.payLater ? 'pay_later' : 'way_off'),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: _kSub,
                          ),
                          underline: const SizedBox.shrink(),
                          selectedItemBuilder: (ctx) {
                            return [
                              'pay_now_cash',
                              'pay_now_card',
                              'pay_now_upi',
                              'pay_later',
                              'way_off',
                            ].map((val) {
                              String label = '';
                              IconData icon = Icons.credit_card_outlined;
                              
                              if (val.startsWith('pay_now')) {
                                final type = val.split('_').last;
                                label = '${type[0].toUpperCase()}${type.substring(1)} Payment';
                              } else if (val == 'pay_later') {
                                label = 'Pay Later (Pending)';
                                icon = Icons.access_time_rounded;
                              } else if (val == 'way_off') {
                                label = 'No Fee (Free/Waived)';
                                icon = Icons.card_giftcard_rounded;
                              }

                              return Row(
                                children: [
                                  Icon(
                                    icon,
                                    size: 18,
                                    color: _kSub,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    label,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: _kText,
                                    ),
                                  ),
                                ],
                              );
                            }).toList();
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'pay_now_cash',
                              child: Text(
                                '💵  Cash',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'pay_now_card',
                              child: Text(
                                '💳  Card',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'pay_now_upi',
                              child: Text(
                                '📱  UPI',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'pay_later',
                              child: Text(
                                '⏰  Pay Later',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'way_off',
                              child: Text(
                                '🆓  No Fee',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                          onChanged: (v) {
                            if (v == null) return;
                            setState(() {
                              if (v.startsWith('pay_now')) {
                                _method = PaymentMethod.payNow;
                                final typeStr = v.split('_').last;
                                _type = PaymentType.values.firstWhere(
                                  (t) => t.name == typeStr,
                                  orElse: () => PaymentType.cash,
                                );
                              } else if (v == 'pay_later') {
                                _method = PaymentMethod.payLater;
                                _type = null;
                              } else if (v == 'way_off') {
                                _method = PaymentMethod.wayOff;
                                _type = null;
                              }
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // ── Actions ────────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: _kBorder)),
              ),
              child: Row(
                children: [
                  // Cancel
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _kSub,
                        side: const BorderSide(color: _kBorder),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Confirm / Pay
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: widget.viewModel.isCreating
                          ? null
                          : _handleConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _kPrimary,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: _kBorder,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: widget.viewModel.isCreating
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              _method == PaymentMethod.payNow
                                  ? 'Confirm & Pay'
                                  : 'Confirm Booking',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── confirm ──────────────────────────────────────────────────────────────
  Future<void> _handleConfirm() async {
    // Capture states before async gap to avoid unmounted context errors
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final pay = AppointmentPayment(method: _method, type: _type);

    if (!pay.isValid) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(pay.validationError ?? 'Please select a payment type'),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      return;
    }

    widget.viewModel.setPaymentMethodEnum(_method);
    widget.viewModel.setPaymentType(_type);

    final result = await widget.viewModel.createSimpleAppointment();
    
    // Check mounted before using setState or local context
    if (!mounted) return;

    if (result != null) {
      widget.viewModel.resetForm(); // ✅ Reset the form to blank state
      
      // Close confirmation dialog using captured navigator
      navigator.pop();
      
      // Show success dialog using parent context (guaranteed to be mounted if view is still there)
      if (widget.parentContext.mounted) {
        _showSuccess(widget.parentContext, result);
      }
    } else if (widget.viewModel.error.isNotEmpty) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('❌ ${widget.viewModel.error}'),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ─── success dialog (Enhanced Sub-Page Model) ──────────────────────────────
  void _showSuccess(BuildContext context, dynamic result) {
    final appt = result.appointment;
    final patient = widget.viewModel.selectedClinicPatient;
    final doctor = widget.viewModel.selectedDoctorObject;
    final doctorName = doctor != null ? 'Dr. ${doctor.firstName ?? ''} ${doctor.lastName ?? ''}' : 'N/A';
    final dept = widget.viewModel.selectedDepartment;
    final date = widget.viewModel.selectedSlotDate;
    final slot = widget.viewModel.selectedSlotDetails;
    final fee = _fee(doctor, widget.viewModel.selectedConsultationType);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => Dialog(
        backgroundColor: Colors.white,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Container(
          width: 440,
          padding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Large Success Icon
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFD1FAE5), width: 4),
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: _kSuccess,
                  size: 44,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Booking Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: _kText,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Token Number #${appt.tokenNumber ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _kSuccess,
                ),
              ),
              const SizedBox(height: 32),

              // Detailed Summary Box
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _kBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _kBorder),
                ),
                child: Column(
                  children: [
                    _SuccessRow('Booking ID', appt.bookingNumber ?? 'N/A'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: _kBorder, height: 1),
                    ),
                    _SuccessRow(
                      'Patient Name',
                      patient != null
                          ? '${patient.firstName} ${patient.lastName}'
                          : 'N/A',
                    ),
                    const SizedBox(height: 12),
                    _SuccessRow('Doctor', doctorName),
                    const SizedBox(height: 12),
                    _SuccessRow('Department', dept),
                    const SizedBox(height: 12),
                    _SuccessRow(
                      'Slot',
                      widget.viewModel.isWalkIn 
                          ? 'Walk-in' 
                          : '${date.day} ${_mo(date.month)} - ${_fmtTime(date, slot).split(' ').sublist(2).join(' ')}'
                    ),
                    const SizedBox(height: 12),
                    _SuccessRow('Amount', '₹${fee.toStringAsFixed(0)}'),
                    const SizedBox(height: 12),
                    _SuccessRow(
                      'Payment Status',
                      (appt.paymentStatus ?? 'Paid').toUpperCase(),
                      isStatus: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- Receipt Actions ---
              ReceiptActionButtons(
                receipt: ReceiptModel(
                  receiptNumber: appt.bookingNumber ?? 'REC-${DateTime.now().millisecondsSinceEpoch}',
                  appointmentId: appt.id ?? appt.bookingNumber ?? 'N/A',
                  bookingNumber: appt.bookingNumber ?? 'N/A',
                  patientName: patient != null ? '${patient.firstName} ${patient.lastName}' : 'N/A',
                  patientAge: patient?.age?.toString() ?? 'N/A',
                  patientGender: patient?.gender ?? 'N/A',
                  patientPhone: patient?.phone,
                  doctorName: doctorName,
                  department: dept ?? 'General',
                  clinicName: 'DR & ME HEALTHCARE',
                  clinicAddress: 'Health City, Medical District, India',
                  clinicPhone: '+91 98765 43210',
                  tokenNumber: appt.tokenNumber ?? 'N/A',
                  consultationType: widget.viewModel.selectedConsultationType,
                  appointmentDate: date != null ? "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}" : 'N/A',
                  appointmentTime: slot != null ? (slot.startTime ?? 'N/A') : 'N/A',
                  visitMode: widget.viewModel.selectedConsultationType.contains('video') ? 'Online' : 'In-Clinic',
                  bookingType: widget.viewModel.isWalkIn ? 'Walk-in' : 'Regular',
                  paymentMethod: _method.toString().split('.').last.toUpperCase(),
                  transactionId: appt.id ?? '', 
                  consultationFee: fee,
                  additionalCharges: 0.0,
                  discount: 0.0,
                  tax: 0.0,
                  totalAmount: fee,
                  paymentStatus: appt.paymentStatus ?? 'Paid',
                  bookingStatus: appt.bookingStatus ?? 'Confirmed',
                  generatedAt: DateTime.now(),
                ),
              ),
              
              const SizedBox(height: 24),

              // Done Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // 1. Close success dialog
                    Navigator.of(dialogCtx).pop();

                    // 2. Trigger navigation back to list
                    if (widget.onNavigate != null) {
                      widget.onNavigate!('appointments_list');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Small reusable widgets ───────────────────────────────────────────────────

class _TitleBar extends StatelessWidget {
  final VoidCallback onClose;
  const _TitleBar({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 8, 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: _kBorder)),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Confirm Appointment',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _kText,
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close_rounded, size: 18, color: _kSub),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text.toUpperCase(),
    style: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: _kSub,
      letterSpacing: 0.8,
    ),
  );
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 14),
    child: Divider(color: _kBorder, height: 1),
  );
}

class _PersonRow extends StatelessWidget {
  final String initial, name, sub, trailing;
  final Color? trailingColor;
  const _PersonRow({
    required this.initial,
    required this.name,
    required this.sub,
    required this.trailing,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: _kBg,
            border: Border.all(color: _kBorder),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              initial,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: _kText,
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
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _kText,
                ),
              ),
              const SizedBox(height: 2),
              Text(sub, style: const TextStyle(fontSize: 11, color: _kSub)),
            ],
          ),
        ),
        Text(
          trailing,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: trailingColor ?? _kSub,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: _kSub),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 13, color: _kText)),
      ],
    );
  }
}

class _SuccessRow extends StatelessWidget {
  final String label;
  final dynamic value;
  final bool isStatus;

  const _SuccessRow(this.label, this.value, {this.isStatus = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: _kSub, fontWeight: FontWeight.w500),
        ),
        if (isStatus)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              value?.toString() ?? 'N/A',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _kSuccess,
              ),
            ),
          )
        else
          Text(
            value?.toString() ?? 'N/A',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _kText,
            ),
          ),
      ],
    );
  }
}
