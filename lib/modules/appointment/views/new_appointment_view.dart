import 'package:a/modules/appointment/viewmodels/new_appointment_viewmodel.dart';
import 'package:a/modules/appointment/views/payment_confirmation_modal_view.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  late NewAppointmentViewModel _viewModel;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = NewAppointmentViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    _viewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<NewAppointmentViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFF8F8F8),
            body: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive scaling for big screens
                final isLargeScreen = constraints.maxWidth > 1200;
                final scaleFactor = isLargeScreen ? 0.9 : 1.0;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 480;

                    if (isMobile) {
                      return _buildMobileLayout(viewModel, scaleFactor);
                    } else {
                      return _buildWebLayout(viewModel, scaleFactor);
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileLayout(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Appointments Title

          // New Appointments Title
          Text(
            'New Appointments',
            style: TextStyle(
              fontSize: 18 * scaleFactor,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(height: 16 * scaleFactor),

          // Consultation Details Section
          _buildMobileConsultationDetailsSection(viewModel, scaleFactor),
          SizedBox(height: 20 * scaleFactor),

          // Available Slots Section
          _buildMobileAvailableSlotsSection(viewModel, scaleFactor),
          SizedBox(height: 20 * scaleFactor),

          // Search Patient Section
          _buildMobileSearchPatientSection(viewModel, scaleFactor),
          SizedBox(height: 20 * scaleFactor),

          // Payment Method Section
          _buildMobilePaymentMethodSection(viewModel, scaleFactor),
          SizedBox(height: 20 * scaleFactor),

          // Book Now Button
          _buildMobileBookNowButton(viewModel, scaleFactor),
          SizedBox(height: 30 * scaleFactor),

          // Footer
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildWebLayout(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16 * scaleFactor),
      child: Container(
        padding: EdgeInsets.all(16 * scaleFactor),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Appointments Title
            Text(
              'New Appointments',
              style: TextStyle(
                fontSize: 24 * scaleFactor,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
              ),
            ),
            SizedBox(height: 12 * scaleFactor),
            Divider(color: const Color(0xFFE0E0E0), thickness: 1),
            SizedBox(height: 12 * scaleFactor),

            // Consultation Details Section
            _buildConsultationDetailsSection(scaleFactor, viewModel),
            SizedBox(height: 12 * scaleFactor),
            Divider(color: const Color(0xFFE0E0E0), thickness: 1),
            SizedBox(height: 12 * scaleFactor),

            // Available Slots Section
            _buildAvailableSlotsSection(scaleFactor, viewModel),
            SizedBox(height: 12 * scaleFactor),
            Divider(color: const Color(0xFFE0E0E0), thickness: 1),
            SizedBox(height: 12 * scaleFactor),

            // Search Patient Section
            _buildSearchPatientSection(scaleFactor, viewModel),
            SizedBox(height: 12 * scaleFactor),
            Divider(color: const Color(0xFFE0E0E0), thickness: 1),
            SizedBox(height: 12 * scaleFactor),

            // Payment Method Section
            _buildPaymentMethodSection(scaleFactor, viewModel),
            SizedBox(height: 12 * scaleFactor),

            // Book Now Button
            _buildBookNowButton(scaleFactor, viewModel),
            SizedBox(height: 20 * scaleFactor),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationDetailsSection(
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildDropdownField(
            'consultation type',
            viewModel.selectedConsultationType,
            (value) => viewModel.setConsultationType(value!),
            scaleFactor,
            viewModel.consultationTypes
                .map((type) => type.name ?? 'Video')
                .toList(),
          ),
        ),
        SizedBox(width: 6 * scaleFactor),
        Expanded(
          child: _buildDropdownField(
            'Select Department',
            viewModel.selectedDepartment,
            (value) => viewModel.setDepartment(value!),
            scaleFactor,
            viewModel.departments
                .map((dept) => dept.name ?? 'Orthology')
                .toList(),
          ),
        ),
        SizedBox(width: 6 * scaleFactor),
        Expanded(
          child: _buildDropdownField(
            'Select Doctor',
            viewModel.selectedDoctor,
            (value) => viewModel.setDoctor(value!),
            scaleFactor,
            viewModel.doctors
                .map((doctor) => '${doctor.firstName} ${doctor.lastName}')
                .toList(),
          ),
        ),
        SizedBox(width: 6 * scaleFactor),
        Expanded(
          child: _buildTextField(
            'Reason or Add Notes',
            'Add Patient Note',
            scaleFactor,
            viewModel.patientNotes,
            (value) => viewModel.setPatientNotes(value),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableSlotsSection(
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Slots',
          style: TextStyle(
            fontSize: 16 * scaleFactor,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 6 * scaleFactor),
        // Date Picker and Legend Row
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12 * scaleFactor,
                vertical: 8 * scaleFactor,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '16,July',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 14 * scaleFactor,
                    ),
                  ),
                  SizedBox(width: 6 * scaleFactor),
                  Icon(
                    Icons.calendar_today,
                    size: 16 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Legend
            Row(
              children: [
                Container(
                  width: 12 * scaleFactor,
                  height: 12 * scaleFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F7ED),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 3 * scaleFactor),
                Text(
                  'Available Slots',
                  style: TextStyle(
                    fontSize: 12 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                ),
                SizedBox(width: 12 * scaleFactor),
                Container(
                  width: 12 * scaleFactor,
                  height: 12 * scaleFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE7E7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 3 * scaleFactor),
                Text(
                  'Booked Slots',
                  style: TextStyle(
                    fontSize: 12 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                ),
                SizedBox(width: 12 * scaleFactor),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12 * scaleFactor),

        // Time Slots
        _buildTimeSlotSection(
          'Morning Slots',
          [
            '08:00 AM',
            '08:30 AM',
            '09:00 AM',
            '09:30 AM',
            '10:00 AM',
            '10:30 AM',
            '11:00 AM',
            '11:30 AM',
            '12:00 AM',
            '12:30 AM',
          ],
          scaleFactor,
          viewModel,
        ),
        SizedBox(height: 6 * scaleFactor),
        _buildTimeSlotSection(
          'Afternoon Slots',
          [
            '01:00 PM',
            '01:30 PM',
            '02:00 PM',
            '02:30 PM',
            '03:00 PM',
            '03:30 PM',
            '04:00 PM',
            '04:30 PM',
            '05:00 PM',
            '05:30 PM',
          ],
          scaleFactor,
          viewModel,
        ),
      ],
    );
  }

  Widget _buildSearchPatientSection(
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Patient',
          style: TextStyle(
            fontSize: 16 * scaleFactor,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 6 * scaleFactor),
        Row(
          children: [
            // Radio Buttons
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: viewModel.isMobileSearch,
                  onChanged: (value) => viewModel.setSearchType(value!),
                  activeColor: const Color(0xFF007BFF),
                ),
                Text('Mobile No', style: TextStyle(fontSize: 14 * scaleFactor)),
                SizedBox(width: 12 * scaleFactor),
                Radio<bool>(
                  value: false,
                  groupValue: viewModel.isMobileSearch,
                  onChanged: (value) => viewModel.setSearchType(value!),
                  activeColor: const Color(0xFF007BFF),
                ),
                Text('Mo ID', style: TextStyle(fontSize: 14 * scaleFactor)),
              ],
            ),
            SizedBox(width: 12 * scaleFactor),
            // Search Input
            Expanded(
              child: Container(
                height: 40 * scaleFactor,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => viewModel.setSearchQuery(value),
                  decoration: InputDecoration(
                    hintText: '123-123-123',
                    hintStyle: TextStyle(
                      color: const Color(0xFF999999),
                      fontSize: 14 * scaleFactor,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF666666),
                      size: 20 * scaleFactor,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12 * scaleFactor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12 * scaleFactor),
            // Add New Patient Button
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF333333),
                side: const BorderSide(color: Color(0xFFE0E0E0)),
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * scaleFactor,
                  vertical: 8 * scaleFactor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(
                Icons.add,
                size: 16 * scaleFactor,
                color: const Color(0xFFE53935),
              ),
              label: Text(
                'Add New Patient',
                style: TextStyle(fontSize: 14 * scaleFactor),
              ),
            ),
          ],
        ),
        // Search Results
        if (viewModel.searchResults.isNotEmpty) ...[
          SizedBox(height: 6 * scaleFactor),
          Container(
            constraints: BoxConstraints(maxHeight: 200 * scaleFactor),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.searchResults.length,
              itemBuilder: (context, index) {
                final patient = viewModel.searchResults[index];
                return ListTile(
                  title: Text('${patient.firstName} ${patient.lastName}'),
                  subtitle: Text(patient.phone ?? ''),
                  onTap: () => viewModel.selectPatient(patient),
                );
              },
            ),
          ),
        ],
        // Selected Patient
        if (viewModel.selectedPatient != null) ...[
          SizedBox(height: 6 * scaleFactor),
          Container(
            padding: EdgeInsets.all(12 * scaleFactor),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.person, color: const Color(0xFF1976D2)),
                SizedBox(width: 6 * scaleFactor),
                Expanded(
                  child: Text(
                    'Selected: ${viewModel.selectedPatient!.firstName} ${viewModel.selectedPatient!.lastName}',
                    style: TextStyle(
                      color: const Color(0xFF1976D2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPaymentMethodSection(
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 16 * scaleFactor,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 6 * scaleFactor),
        Row(
          children: [
            Radio<String>(
              value: 'Pay Later',
              groupValue: viewModel.selectedPaymentMethod,
              onChanged: (value) => viewModel.setPaymentMethod(value!),
              activeColor: const Color(0xFF007BFF),
            ),
            Text('Pay Later', style: TextStyle(fontSize: 14 * scaleFactor)),
            SizedBox(width: 12 * scaleFactor),
            Radio<String>(
              value: 'Pay Now',
              groupValue: viewModel.selectedPaymentMethod,
              onChanged: (value) => viewModel.setPaymentMethod(value!),
              activeColor: const Color(0xFF007BFF),
            ),
            Text('Pay Now', style: TextStyle(fontSize: 14 * scaleFactor)),
            SizedBox(width: 12 * scaleFactor),
            Radio<String>(
              value: 'Way Off',
              groupValue: viewModel.selectedPaymentMethod,
              onChanged: (value) => viewModel.setPaymentMethod(value!),
              activeColor: const Color(0xFF007BFF),
            ),
            Text('Way Off', style: TextStyle(fontSize: 14 * scaleFactor)),
          ],
        ),
      ],
    );
  }

  Widget _buildBookNowButton(
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: viewModel.isCreating
            ? null
            : () async {
                final appointment = await viewModel.createAppointment();
                if (appointment != null) {
                  // Always show payment confirmation modal
                  showDialog(
                    context: context,
                    builder: (context) => const PaymentConfirmationModal(),
                  );
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 24 * scaleFactor,
            vertical: 12 * scaleFactor,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: viewModel.isCreating
            ? SizedBox(
                height: 20 * scaleFactor,
                width: 20 * scaleFactor,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 16 * scaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    String value,
    Function(String?) onChanged,
    double scaleFactor,
    List<String> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 6 * scaleFactor),
        Container(
          height: 40 * scaleFactor,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              onChanged: onChanged,
              padding: EdgeInsets.symmetric(horizontal: 12 * scaleFactor),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 14 * scaleFactor),
                      ),
                    ),
                  )
                  .toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF666666),
                size: 20 * scaleFactor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    double scaleFactor,
    String value,
    Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 6 * scaleFactor),
        Container(
          height: 40 * scaleFactor,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: const Color(0xFF999999),
                fontSize: 14 * scaleFactor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12 * scaleFactor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotSection(
    String title,
    List<String> slots,
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 6 * scaleFactor),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: slots.map((slot) {
              final isSelected = slot == viewModel.selectedTimeSlot;
              final isBooked = ['12:30 AM', '04:30 PM'].contains(slot);
              final isUnavailable = [
                '11:00 AM',
                '11:30 AM',
                '12:00 AM',
                '01:00 PM',
                '03:00 PM',
                '03:30 PM',
                '04:00 PM',
              ].contains(slot);

              Color backgroundColor;
              Color textColor;

              if (isSelected) {
                backgroundColor = Colors.black;
                textColor = Colors.white;
              } else if (isBooked) {
                backgroundColor = const Color(0xFFFDE7E7);
                textColor = const Color(0xFFD32F2F);
              } else if (isUnavailable) {
                backgroundColor = const Color(0xFFF5F5F5);
                textColor = const Color(0xFF9E9E9E);
              } else {
                backgroundColor = const Color(0xFFE6F7ED);
                textColor = const Color(0xFF388E3C);
              }

              return Container(
                margin: EdgeInsets.only(right: 8 * scaleFactor),
                child: InkWell(
                  onTap: isBooked || isUnavailable
                      ? null
                      : () {
                          viewModel.setTimeSlot(slot);
                        },
                  child: Container(
                    width: 100 * scaleFactor,
                    height: 60 * scaleFactor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8 * scaleFactor,
                      vertical: 8 * scaleFactor,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: isUnavailable
                          ? Border.all(color: const Color(0xFFE0E0E0))
                          : null,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          slot,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12 * scaleFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2 * scaleFactor),
                        Text(
                          'Available Slots',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white.withOpacity(0.8)
                                : isUnavailable
                                ? const Color(0xFFBDBDBD)
                                : isBooked
                                ? const Color(0xFFEF5350)
                                : const Color(0xFF66BB6A),
                            fontSize: 10 * scaleFactor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileConsultationDetailsSection(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMobileDropdownField(
          'consultation type',
          viewModel.selectedConsultationType,
          (value) => viewModel.setConsultationType(value!),
          scaleFactor,
          viewModel.consultationTypes
              .map((type) => type.name ?? 'Video')
              .toList(),
        ),
        SizedBox(height: 16 * scaleFactor),
        _buildMobileDropdownField(
          'Select Department',
          viewModel.selectedDepartment,
          (value) => viewModel.setDepartment(value!),
          scaleFactor,
          viewModel.departments
              .map((dept) => dept.name ?? 'Orthology')
              .toList(),
        ),
        SizedBox(height: 16 * scaleFactor),
        _buildMobileDropdownField(
          'Select Doctor',
          viewModel.selectedDoctor,
          (value) => viewModel.setDoctor(value!),
          scaleFactor,
          viewModel.doctors
              .map((doctor) => '${doctor.firstName} ${doctor.lastName}')
              .toList(),
        ),
        SizedBox(height: 16 * scaleFactor),
        _buildMobileTextField(
          'Reason or Add Notes',
          'Add Patient Note',
          scaleFactor,
          viewModel.patientNotes,
          (value) => viewModel.setPatientNotes(value),
        ),
      ],
    );
  }

  Widget _buildMobileAvailableSlotsSection(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Slots',
          style: TextStyle(
            fontSize: 16 * scaleFactor,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 12 * scaleFactor),
        // Date Picker and Legend Row
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12 * scaleFactor,
                vertical: 8 * scaleFactor,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '16,July',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 14 * scaleFactor,
                    ),
                  ),
                  SizedBox(width: 8 * scaleFactor),
                  Icon(
                    Icons.calendar_today,
                    size: 16 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Legend
            Row(
              children: [
                Container(
                  width: 12 * scaleFactor,
                  height: 12 * scaleFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F7ED),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 3 * scaleFactor),
                Text(
                  'Available Slots',
                  style: TextStyle(
                    fontSize: 12 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                ),
                SizedBox(width: 12 * scaleFactor),
                Container(
                  width: 12 * scaleFactor,
                  height: 12 * scaleFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE7E7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 3 * scaleFactor),
                Text(
                  'Booked Slots',
                  style: TextStyle(
                    fontSize: 12 * scaleFactor,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16 * scaleFactor),

        // Time Slots
        _buildMobileTimeSlotSection(
          'Morning Slots',
          [
            '08:00 AM',
            '08:30 AM',
            '09:00 AM',
            '09:30 AM',
            '10:00 AM',
            '10:30 AM',
            '11:00 AM',
            '11:30 AM',
            '12:00 AM',
            '12:30 AM',
          ],
          scaleFactor,
          viewModel,
        ),
        SizedBox(height: 12 * scaleFactor),
        _buildMobileTimeSlotSection(
          'Afternoon Slots',
          [
            '01:00 PM',
            '01:30 PM',
            '02:00 PM',
            '02:30 PM',
            '03:00 PM',
            '03:30 PM',
            '04:00 PM',
            '04:30 PM',
            '05:00 PM',
            '05:30 PM',
          ],
          scaleFactor,
          viewModel,
        ),
      ],
    );
  }

  Widget _buildMobileSearchPatientSection(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Patient',
          style: TextStyle(
            fontSize: 16 * scaleFactor,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 12 * scaleFactor),
        Row(
          children: [
            // Radio Buttons
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: viewModel.isMobileSearch,
                  onChanged: (value) => viewModel.setSearchType(value!),
                  activeColor: const Color(0xFF007BFF),
                ),
                Text('Mobile No', style: TextStyle(fontSize: 14 * scaleFactor)),
                SizedBox(width: 16 * scaleFactor),
                Radio<bool>(
                  value: false,
                  groupValue: viewModel.isMobileSearch,
                  onChanged: (value) => viewModel.setSearchType(value!),
                  activeColor: const Color(0xFF007BFF),
                ),
                Text('Mo ID', style: TextStyle(fontSize: 14 * scaleFactor)),
              ],
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: 12 * scaleFactor),
        Row(
          children: [
            // Search Input
            Expanded(
              child: Container(
                height: 40 * scaleFactor,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => viewModel.setSearchQuery(value),
                  decoration: InputDecoration(
                    hintText: '123-123-123',
                    hintStyle: TextStyle(
                      color: const Color(0xFF999999),
                      fontSize: 14 * scaleFactor,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF666666),
                      size: 20 * scaleFactor,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12 * scaleFactor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12 * scaleFactor),
            // Add New Patient Button
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF333333),
                side: const BorderSide(color: Color(0xFFE0E0E0)),
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * scaleFactor,
                  vertical: 8 * scaleFactor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(
                Icons.add,
                size: 16 * scaleFactor,
                color: const Color(0xFFE53935),
              ),
              label: Text(
                'Add New Patient',
                style: TextStyle(fontSize: 14 * scaleFactor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobilePaymentMethodSection(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 16 * scaleFactor,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 12 * scaleFactor),
        Row(
          children: [
            Radio<String>(
              value: 'Pay Later',
              groupValue: viewModel.selectedPaymentMethod,
              onChanged: (value) => viewModel.setPaymentMethod(value!),
              activeColor: const Color(0xFF007BFF),
            ),
            Text('Pay Later', style: TextStyle(fontSize: 14 * scaleFactor)),
            SizedBox(width: 16 * scaleFactor),
            Radio<String>(
              value: 'Pay Now',
              groupValue: viewModel.selectedPaymentMethod,
              onChanged: (value) => viewModel.setPaymentMethod(value!),
              activeColor: const Color(0xFF007BFF),
            ),
            Text('Pay Now', style: TextStyle(fontSize: 14 * scaleFactor)),
            SizedBox(width: 16 * scaleFactor),
            Radio<String>(
              value: 'Way Off',
              groupValue: viewModel.selectedPaymentMethod,
              onChanged: (value) => viewModel.setPaymentMethod(value!),
              activeColor: const Color(0xFF007BFF),
            ),
            Text('Way Off', style: TextStyle(fontSize: 14 * scaleFactor)),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileBookNowButton(
    NewAppointmentViewModel viewModel,
    double scaleFactor,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: viewModel.isCreating
            ? null
            : () async {
                final appointment = await viewModel.createAppointment();
                if (appointment != null) {
                  // Always show payment confirmation modal
                  showDialog(
                    context: context,
                    builder: (context) => const PaymentConfirmationModal(),
                  );
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 24 * scaleFactor,
            vertical: 12 * scaleFactor,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: viewModel.isCreating
            ? SizedBox(
                height: 20 * scaleFactor,
                width: 20 * scaleFactor,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 16 * scaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildMobileDropdownField(
    String label,
    String value,
    Function(String?) onChanged,
    double scaleFactor,
    List<String> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF666666),
          ),
        ),
        SizedBox(height: 8 * scaleFactor),
        Container(
          height: 40 * scaleFactor,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              onChanged: onChanged,
              padding: EdgeInsets.symmetric(horizontal: 12 * scaleFactor),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 14 * scaleFactor),
                      ),
                    ),
                  )
                  .toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF666666),
                size: 20 * scaleFactor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTextField(
    String label,
    String hint,
    double scaleFactor,
    String value,
    Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF666666),
          ),
        ),
        SizedBox(height: 8 * scaleFactor),
        Container(
          height: 40 * scaleFactor,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: const Color(0xFF999999),
                fontSize: 14 * scaleFactor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12 * scaleFactor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTimeSlotSection(
    String title,
    List<String> slots,
    double scaleFactor,
    NewAppointmentViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF666666),
          ),
        ),
        SizedBox(height: 8 * scaleFactor),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: slots.map((slot) {
              final isSelected = slot == viewModel.selectedTimeSlot;
              final isBooked = ['12:30 AM', '04:30 PM'].contains(slot);
              final isUnavailable = [
                '11:00 AM',
                '11:30 AM',
                '12:00 AM',
                '01:00 PM',
                '03:00 PM',
                '03:30 PM',
                '04:00 PM',
              ].contains(slot);

              Color backgroundColor;
              Color textColor;

              if (isSelected) {
                backgroundColor = Colors.black;
                textColor = Colors.white;
              } else if (isBooked) {
                backgroundColor = const Color(0xFFFDE7E7);
                textColor = const Color(0xFFD32F2F);
              } else if (isUnavailable) {
                backgroundColor = const Color(0xFFF5F5F5);
                textColor = const Color(0xFF9E9E9E);
              } else {
                backgroundColor = const Color(0xFFE6F7ED);
                textColor = const Color(0xFF388E3C);
              }

              return Container(
                margin: EdgeInsets.only(right: 8 * scaleFactor),
                child: InkWell(
                  onTap: isBooked || isUnavailable
                      ? null
                      : () {
                          viewModel.setTimeSlot(slot);
                        },
                  child: Container(
                    width: 100 * scaleFactor,
                    height: 60 * scaleFactor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8 * scaleFactor,
                      vertical: 8 * scaleFactor,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: isUnavailable
                          ? Border.all(color: const Color(0xFFE0E0E0))
                          : null,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          slot,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12 * scaleFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1 * scaleFactor),
                        Text(
                          'Available Slots',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white.withOpacity(0.8)
                                : isUnavailable
                                ? const Color(0xFFBDBDBD)
                                : isBooked
                                ? const Color(0xFFEF5350)
                                : const Color(0xFF66BB6A),
                            fontSize: 10 * scaleFactor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 DrMe. All rights reserved',
        style: TextStyle(color: Color(0xFF999999), fontSize: 12),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    searchController.dispose();
    super.dispose();
  }
}
