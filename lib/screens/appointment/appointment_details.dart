import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/appointment_details_vm.dart';
import 'package:a/viewModels/authVM.dart';
import 'reschedule_modal.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final String? appointmentId;

  const AppointmentDetailsScreen({super.key, this.appointmentId});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  late AppointmentDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AppointmentDetailsViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    if (widget.appointmentId != null) {
      _viewModel.fetchAppointmentDetails(widget.appointmentId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF666666),
              size: 16,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Appointment Details',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Color(0xFF666666), size: 16),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // For mobile screens, stack vertically
          if (constraints.maxWidth < 768) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildMobileBookingDetailsCard(),
                  const SizedBox(height: 8),
                  _buildMobilePatientDetailsCard(),
                  const SizedBox(height: 8),
                  _buildMobileVitalSignsCard(),
                  const SizedBox(height: 8),
                  _buildMobileAppointmentHistoryCard(),
                  const SizedBox(height: 8),
                  _buildMobileMedicalRecordsCard(),
                  const SizedBox(height: 8),
                  _buildMobilePrescriptionsCard(),
                  const SizedBox(height: 16),
                  _buildFooter(),
                ],
              ),
            );
          }
          // For tablet and desktop, use side-by-side layout matching the image
          else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column - 5 Cards
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildBookingDetailsCard(),
                          const SizedBox(height: 8),
                          _buildPatientDetailsCard(),
                          const SizedBox(height: 8),
                          _buildVitalSignsCard(),
                          const SizedBox(height: 8),
                          // Medical Records and Prescriptions in the same row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildMedicalRecordsCard()),
                              const SizedBox(width: 8),
                              Expanded(child: _buildPrescriptionsCard()),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildFooter(),
                        ],
                      ),
                    ),
                    // Right Column - Appointment History
                    const SizedBox(width: 12),
                    Expanded(flex: 1, child: _buildAppointmentHistoryCard()),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildBookingDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Booking Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Status',
                    style: TextStyle(color: Color(0xFF999999), fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Upcoming',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {},
                        child: const Center(
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Details Layout
          _buildDetailsLayout([
            {'label': 'Appointment ID', 'value': '#837743'},
            {'label': 'Hooked On', 'value': '24-09-2025'},
            {'label': 'Appointment Date', 'value': '30-09-2025'},
            {'label': 'Appointment Time', 'value': '05:30 PM'},
            {'label': 'Doctor Assigned', 'value': 'Dr. Arun Krishna'},
            {'label': 'Department', 'value': 'Cardiology'},
            {
              'label': 'Reason for Visit',
              'value': 'High Blood Pressure Checkup',
            },
            {'label': 'Consultation Type', 'value': 'In-Person'},
          ]),
          const SizedBox(height: 16),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF007BFF),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 16,
                    color: Color(0xFF007BFF),
                  ),
                  label: const Text(
                    'Add More Appointment',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Cancel appointment action
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF333333),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(
                        context,
                      ).modalBarrierDismissLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return RescheduleModal(
                          appointmentId: widget.appointmentId,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Reschedule',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPatientDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Patient Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Personal Details Layout
          _buildPatientDetailsLayout([
            {'label': 'First Name', 'value': 'Safeer'},
            {'label': 'Last Name', 'value': 'Ameen'},
            {'label': 'Age', 'value': '36'},
            {'label': 'Gender', 'value': 'Male', 'hasDropdown': true},
            {'label': 'Email Address', 'value': 'Safeer'},
            {'label': 'Contact Number', 'value': '+91 476738737'},
            {'label': 'Address 1', 'value': 'Safeer'},
            {'label': 'Address 2', 'value': 'Ameen'},
            {'label': 'District', 'value': 'Malappuram', 'hasDropdown': true},
            {'label': 'State', 'value': 'Kerala', 'hasDropdown': true},
            {'label': 'Blood Group', 'value': 'O+', 'hasDropdown': true},
            {'label': 'Smoking Status', 'value': 'No', 'hasDropdown': true},
            {
              'label': 'Alcohol Use',
              'value': 'Malappuram',
              'hasDropdown': true,
            },
            {'label': 'Height (cm)', 'value': '165', 'hasDropdown': true},
            {'label': 'Weight (kg)', 'value': '69', 'hasDropdown': true},
          ]),
        ],
      ),
    );
  }

  Widget _buildVitalSignsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Vital Signs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildVitalSignItem('Blood Pressure', '120/80 mmHg'),
              ),
              const SizedBox(width: 12),
              Expanded(child: _buildVitalSignItem('Temperature', '37°C')),
              const SizedBox(width: 12),
              Expanded(child: _buildVitalSignItem('Pulse', '72 bpm')),
            ],
          ),
          const SizedBox(height: 16),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle vital signs cancellation
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF333333),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle vital signs save
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalRecordsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Medical Records',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildRecordItem('Blood Pressure Report'),
          _buildRecordItem('Blood Sugar Level'),
          _buildRecordItem('ECG Report'),
          _buildRecordItem('ECG Report'),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              '+View More',
              style: TextStyle(
                color: Color(0xFF007BFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Prescriptions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildPrescriptionItem('Amlodipine 2.5mg - morning dose'),
          _buildPrescriptionItem('Amlodipine 2.5mg - morning dose'),
          _buildPrescriptionItem('Amlodipine 2.5mg - morning dose'),
          _buildPrescriptionItem('Amlodipine 2.5mg - morning dose'),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              '+View More',
              style: TextStyle(
                color: Color(0xFF007BFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Appointment History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          // Timeline - Fixed height for better layout
          SizedBox(height: 570, child: _buildTimeline()),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              '+View More',
              style: TextStyle(
                color: Color(0xFF007BFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsLayout(List<Map<String, String>> details) {
    return Column(
      children: [
        // First row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[0]['label']!,
                details[0]['value']!,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                details[1]['label']!,
                details[1]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[2]['label']!,
                details[2]['value']!,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                details[3]['label']!,
                details[3]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Third row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[4]['label']!,
                details[4]['value']!,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                details[5]['label']!,
                details[5]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Fourth row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[6]['label']!,
                details[6]['value']!,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                details[7]['label']!,
                details[7]['value']!,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF999999), fontSize: 11),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPatientDetailsLayout(List<Map<String, dynamic>> details) {
    return Column(
      children: [
        // First row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[0]['label']!,
                details[0]['value']!,
                details[0]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[1]['label']!,
                details[1]['value']!,
                details[1]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[2]['label']!,
                details[2]['value']!,
                details[2]['hasDropdown'] == true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Second row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[3]['label']!,
                details[3]['value']!,
                details[3]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[4]['label']!,
                details[4]['value']!,
                details[4]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[5]['label']!,
                details[5]['value']!,
                details[5]['hasDropdown'] == true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Third row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[6]['label']!,
                details[6]['value']!,
                details[6]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[7]['label']!,
                details[7]['value']!,
                details[7]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[8]['label']!,
                details[8]['value']!,
                details[8]['hasDropdown'] == true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Fourth row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[9]['label']!,
                details[9]['value']!,
                details[9]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[10]['label']!,
                details[10]['value']!,
                details[10]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[11]['label']!,
                details[11]['value']!,
                details[11]['hasDropdown'] == true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Fifth row
        Row(
          children: [
            Expanded(
              child: _buildPatientDetailItem(
                details[12]['label']!,
                details[12]['value']!,
                details[12]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[13]['label']!,
                details[13]['value']!,
                details[13]['hasDropdown'] == true,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPatientDetailItem(
                details[14]['label']!,
                details[14]['value']!,
                details[14]['hasDropdown'] == true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPatientDetailItem(String label, String value, bool hasDropdown) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (hasDropdown)
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF999999),
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVitalSignItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecordItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Color(0xFFFF0000), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Color(0xFF333333), fontSize: 13),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF666666),
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Icon(Icons.medication, color: Color(0xFFFF0000), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Color(0xFF333333), fontSize: 13),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF666666),
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            true,
            true,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildTimelineItem(
            '03/09/2025',
            '06:30 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    String date,
    String time,
    String description,
    bool isFirst,
    bool isUpcoming,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? const Color(0xFFFFD700)
                      : const Color(0xFF32CD32),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isFirst)
                Container(width: 2, height: 35, color: const Color(0xFF32CD32)),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isUpcoming
                        ? const Color(0xFFFFFACD)
                        : const Color(0xFFE0FFE0),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isUpcoming
                          ? const Color(0xFFFFD700)
                          : const Color(0xFF32CD32),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileBookingDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Booking Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Pending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildMobileDetailsLayout([
            {'label': 'Appointment id', 'value': '#657743'},
            {'label': 'Appointment date', 'value': '24-09-2025'},
            {'label': 'Doctor', 'value': 'Dr. Arun Krishna'},
            {
              'label': 'Reason for visit',
              'value': 'High Blood Pressure Checkup',
            },
            {'label': 'Appointment time', 'value': '05:30 PM'},
            {'label': 'Department', 'value': 'Cardiology'},
            {'label': 'Consultation type', 'value': 'In-Person'},
          ]),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF333333),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final screenWidth = MediaQuery.of(context).size.width;
                    final isMobile = screenWidth < 480;

                    if (isMobile) {
                      // Mobile: Show as bottom sheet
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return RescheduleModal(
                            appointmentId: widget.appointmentId,
                          );
                        },
                      );
                    } else {
                      // Tablet/Desktop: Show as right-side sliding panel
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(
                          context,
                        ).modalBarrierDismissLabel,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return RescheduleModal(
                            appointmentId: widget.appointmentId,
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Reschedule',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobilePatientDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Patient Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildMobileDetailsLayout([
            {'label': 'Name', 'value': 'Safeer'},
            {'label': 'Age', 'value': '36'},
            {'label': 'Email id', 'value': 'safeerameen74@gmail.com'},
            {'label': 'Address', 'value': '123, main St, NY'},
            {'label': 'Smoking', 'value': 'No'},
            {'label': 'Height (CM)', 'value': '165'},
            {'label': 'Old Name', 'value': 'Ameen'},
            {'label': 'Gender', 'value': 'Male'},
            {'label': 'Contact Number', 'value': '+91 98400 83922'},
            {'label': 'Blood Group', 'value': 'O+'},
            {'label': 'Alcohol', 'value': 'Occasionally'},
            {'label': 'Weight (KG)', 'value': '69'},
          ]),
        ],
      ),
    );
  }

  Widget _buildMobileVitalSignsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Vital Signs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildMobileDetailsLayout([
            {'label': 'Blood Pressure', 'value': '120/80 mmHg'},
            {'label': 'Pulse', 'value': '72 bpm'},
            {'label': 'Temperature', 'value': '37°C'},
          ]),
        ],
      ),
    );
  }

  Widget _buildMobileAppointmentHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Appointment History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_up,
                color: Color(0xFF666666),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(height: 300, child: _buildMobileTimeline()),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'View More',
              style: TextStyle(
                color: Color(0xFF007BFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileMedicalRecordsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Medical Records',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildMobileRecordItem('Blood Pressure Report', Icons.water_drop),
          _buildMobileRecordItem('Blood Sugar Level', Icons.cake),
          _buildMobileRecordItem('ECG Report', Icons.favorite),
          _buildMobileRecordItem('ECG Report', Icons.favorite),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'View More',
              style: TextStyle(
                color: Color(0xFF007BFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobilePrescriptionsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Prescriptions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildMobilePrescriptionItem('Antiallergic 2.5mg - morning dose'),
          _buildMobilePrescriptionItem('Antiallergic 2.5mg - morning dose'),
          _buildMobilePrescriptionItem('Antiallergic 2.5mg - morning dose'),
          _buildMobilePrescriptionItem('Antiallergic 2.5mg - morning dose'),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'View More',
              style: TextStyle(
                color: Color(0xFF007BFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDetailsLayout(List<Map<String, String>> details) {
    return Column(
      children: details
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      item['label']!,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      item['value']!,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildMobileTimeline() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            true,
            true,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
          _buildMobileTimelineItem(
            '06/09/2025',
            '04:32 PM',
            'High Blood Pressure Checkup',
            false,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTimelineItem(
    String date,
    String time,
    String description,
    bool isFirst,
    bool isUpcoming,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? const Color(0xFFFFD700)
                      : const Color(0xFF32CD32),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isFirst)
                Container(width: 2, height: 30, color: const Color(0xFF32CD32)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isUpcoming
                        ? const Color(0xFFFFFACD)
                        : const Color(0xFFE0FFE0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileRecordItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF0000), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Color(0xFF333333), fontSize: 14),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF666666),
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildMobilePrescriptionItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.medication, color: Color(0xFFFF0000), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Color(0xFF333333), fontSize: 14),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF666666),
            size: 14,
          ),
        ],
      ),
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
    super.dispose();
  }
}
