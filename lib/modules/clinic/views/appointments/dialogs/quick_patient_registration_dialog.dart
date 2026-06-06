import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/country_code_dropdown.dart';

// ─── Supported country codes ──────────────────────────────────────────────────
const List<CountryCode> countryCodes = [
  CountryCode(name: 'India', code: 'IN', flag: '🇮🇳', dialCode: '+91'),
  CountryCode(name: 'UAE', code: 'AE', flag: '🇦🇪', dialCode: '+971'),
  CountryCode(name: 'Saudi Arabia', code: 'SA', flag: '🇸🇦', dialCode: '+966'),
];

// ─── Same design tokens as payment_confirmation_popup ─────────────────────────
const _kText = Color(0xFF1A1A2E);
const _kSub = Color(0xFF6B7280);
const _kBorder = Color(0xFFE5E7EB);
const _kBg = Color(0xFFF9FAFB);
const _kFocus = Colors.black;

class QuickPatientRegistrationDialog extends StatefulWidget {
  final NewAppointmentViewModel viewModel;
  const QuickPatientRegistrationDialog({super.key, required this.viewModel});

  @override
  State<QuickPatientRegistrationDialog> createState() =>
      _QuickPatientRegistrationDialogState();
}

class _QuickPatientRegistrationDialogState
    extends State<QuickPatientRegistrationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  CountryCode _countryCode = defaultCountryCode;
  String? _gender;
  bool _submitting = false;

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _phoneCtrl.dispose();
    _ageCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            _TitleBar(onClose: () => Navigator.pop(context)),

            // ── Form body ──────────────────────────────────────────────────
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.70,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Name ─────────────────────────────────────────────
                      _Field(
                        label: 'Name *',
                        hint: '',
                        controller: _firstNameCtrl,
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                      const SizedBox(height: 14),

                      // ── Phone ─────────────────────────────────────────────
                      _Label('Phone Number *'),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Country code picker
                          Container(
                            height: 46,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: _kBg,
                              border: Border.all(color: _kBorder),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CountryCode>(
                                value: _countryCode,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 16,
                                  color: _kSub,
                                ),
                                items: countryCodes
                                    .map(
                                      (c) => DropdownMenuItem(
                                        value: c,
                                        child: Text(
                                          '${c.flag} ${c.dialCode}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _countryCode = v!),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _Field(
                              label: '',
                              hint: '',
                              controller: _phoneCtrl,
                              keyboardType: TextInputType.phone,
                              validator: (v) => (v == null || v.trim().isEmpty)
                                  ? 'Required'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // ── Age + Gender row ──────────────────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: _Field(
                              label: 'Age',
                              hint: '',
                              controller: _ageCtrl,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _Label('Gender'),
                                const SizedBox(height: 6),
                                Container(
                                  height: 46,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _kBg,
                                    border: Border.all(color: _kBorder),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _gender,
                                      isExpanded: true,
                                      hint: const Text(
                                        'Select',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: _kSub,
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 16,
                                        color: _kSub,
                                        ),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: _kText,
                                      ),
                                      items: ['Male', 'Female', 'Other']
                                          .map(
                                            (g) => DropdownMenuItem(
                                              value: g,
                                              child: Text(g),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (v) =>
                                          setState(() => _gender = v),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // ── Address ──────────────────────────────────────────
                      _Field(
                        label: 'Address',
                        hint: '',
                        controller: _addressCtrl,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // ── Action buttons ─────────────────────────────────────────────
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
                      onPressed: _submitting
                          ? null
                          : () => Navigator.pop(context),
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
                  // Register
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _submitting ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: _kBorder,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _submitting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Register Patient',
                              style: TextStyle(
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

  // ─── submit ───────────────────────────────────────────────────────────────
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);

    final newPatient = await widget.viewModel.createClinicPatient(
      firstName: _firstNameCtrl.text.trim(),
      lastName: '',
      phone: '${_countryCode.dialCode}${_phoneCtrl.text.trim()}',
      age: _ageCtrl.text.isEmpty ? null : int.tryParse(_ageCtrl.text),
      gender: _gender,
      address: _addressCtrl.text.trim(),
    );

    if (!mounted) return;
    setState(() => _submitting = false);

    if (newPatient != null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ ${newPatient.firstName} ${newPatient.lastName} registered!',
          ),
          backgroundColor: const Color(0xFF059669),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ ${widget.viewModel.error}'),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }
}

// ─── Small shared widgets ─────────────────────────────────────────────────────

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
              'Register New Patient',
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

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) => text.isEmpty
      ? const SizedBox.shrink()
      : Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _kText,
          ),
        );
}

class _Field extends StatelessWidget {
  final String label, hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _Field({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[_Label(label), const SizedBox(height: 6)],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(fontSize: 13, color: _kText),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, color: _kSub),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 13,
            ),
            filled: true,
            fillColor: _kBg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _kBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _kBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _kFocus, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            errorStyle: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}

/// Helper function to open the dialog
void showQuickPatientRegistrationDialog(
  BuildContext context,
  NewAppointmentViewModel viewModel,
) {
  showDialog(
    context: context,
    builder: (_) => QuickPatientRegistrationDialog(viewModel: viewModel),
  );
}
