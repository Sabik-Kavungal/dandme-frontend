import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:a/modules/clinic/views/appointments/widgets/country_code_dropdown.dart';
import 'package:a/modules/clinic/views/appointments/widgets/unified_button.dart';

/// Impressive patient registration dialog with age, gender, and date of birth
class QuickPatientRegistrationDialog extends StatefulWidget {
  final NewAppointmentViewModel viewModel;

  const QuickPatientRegistrationDialog({super.key, required this.viewModel});

  @override
  State<QuickPatientRegistrationDialog> createState() =>
      _QuickPatientRegistrationDialogState();
}

class _QuickPatientRegistrationDialogState
    extends State<QuickPatientRegistrationDialog> {
  CountryCode _selectedCountryCode = defaultCountryCode;
  DateTime? _selectedDateOfBirth;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final phoneController = TextEditingController();
    final ageController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Impressive header with gradient
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Register New Patient',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Form content
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                        controller: firstNameController,
                        label: 'First Name *',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'First name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: lastNameController,
                        label: 'Last Name *',
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Last name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      PhoneNumberField(
                        phoneController: phoneController,
                        label: 'Phone Number *',
                        hint: 'Enter phone number',
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Phone number is required';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 16),

                      // Age field
                      TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          hintText: 'Enter age',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF1E293B),
                              width: 2,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.cake,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Gender dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF1E293B),
                              width: 2,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.wc,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                        items: ['Male', 'Female', 'Other'].map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // Date of Birth field
                      InkWell(
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().subtract(
                              const Duration(days: 365 * 25),
                            ),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              _selectedDateOfBirth = date;
                            });
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            hintText: _selectedDateOfBirth == null
                                ? 'Select date of birth'
                                : DateFormat(
                                    'MMM dd, yyyy',
                                  ).format(_selectedDateOfBirth!),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF1E293B),
                                width: 2,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFFEF4444),
                            ),
                          ),
                          child: Text(
                            _selectedDateOfBirth == null
                                ? 'Select date of birth'
                                : DateFormat(
                                    'MMM dd, yyyy',
                                  ).format(_selectedDateOfBirth!),
                            style: TextStyle(
                              color: _selectedDateOfBirth == null
                                  ? Colors.grey[600]
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Action buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      firstNameController.dispose();
                      lastNameController.dispose();
                      phoneController.dispose();
                      ageController.dispose();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 12),
                  UnifiedButton(
                    text: 'Register Patient',
                    icon: Icons.check_circle,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await _handleRegistration(
                          context,
                          firstNameController,
                          lastNameController,
                          phoneController,
                          ageController.text.isEmpty
                              ? null
                              : int.tryParse(ageController.text),
                        );
                      }
                    },
                    scaleFactor: 1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build impressive text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1E293B), width: 2),
        ),
        prefixIcon: Icon(icon, color: const Color(0xFFEF4444)),
      ),
      validator: validator,
    );
  }

  /// Handle patient registration
  Future<void> _handleRegistration(
    BuildContext context,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController phoneController,
    int? age,
  ) async {
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Registering patient...'),
              ],
            ),
          ),
        ),
      ),
    );

    // Create patient with enhanced fields
    final newPatient = await widget.viewModel.createClinicPatient(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phone: '${_selectedCountryCode.dialCode}${phoneController.text.trim()}',
      age: age,
      gender: _selectedGender,
      dateOfBirth: _selectedDateOfBirth?.toIso8601String(),
    );

    // Close loading dialog
    Navigator.pop(context);

    if (newPatient != null) {
      // Success - close registration dialog
      firstNameController.dispose();
      lastNameController.dispose();
      phoneController.dispose();
      Navigator.pop(context);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ Patient ${newPatient.firstName} ${newPatient.lastName} registered successfully!',
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '❌ Failed to register patient. ${widget.viewModel.error}',
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }
}

/// Helper function to show the dialog
void showQuickPatientRegistrationDialog(
  BuildContext context,
  NewAppointmentViewModel viewModel,
) {
  showDialog(
    context: context,
    builder: (context) => QuickPatientRegistrationDialog(viewModel: viewModel),
  );
}
