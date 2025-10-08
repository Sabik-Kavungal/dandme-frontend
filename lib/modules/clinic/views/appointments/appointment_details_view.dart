import 'package:a/modules/clinic/viewmodels/appointments/appointment_details_viewmodel.dart';
import 'package:a/modules/clinic/views/appointments/reschedule_modal_view.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/navigation_helper.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final String? appointmentId;

  const AppointmentDetailsScreen({super.key, this.appointmentId});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  late AppointmentDetailsViewModel _viewModel;
  bool _isEditingPatientDetails = false;

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
        toolbarHeight: 56,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF333333),
            size: 22,
          ),
          onPressed: () => NavigationHelper.goBack(context),
        ),
        title: const Text(
          'Appointment Details',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.print, color: Color(0xFF666666), size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // For mobile screens, stack vertically
          if (constraints.maxWidth < 768) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  _buildMobileBookingDetailsCard(),
                  if (_isEditingPatientDetails) ...[
                    const SizedBox(height: 6),
                    _buildMobilePatientDetailsCard(),
                  ],
                  const SizedBox(height: 6),
                  _buildMobileVitalSignsCard(),
                  const SizedBox(height: 6),
                  _buildMobileAppointmentHistoryCard(),
                  const SizedBox(height: 6),
                  _buildMobileMedicalRecordsCard(),
                  const SizedBox(height: 6),
                  _buildMobilePrescriptionsCard(),
                  const SizedBox(height: 12),
                  _buildFooter(),
                ],
              ),
            );
          }
          // For tablet and desktop, use side-by-side layout matching the image
          else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column - 5 Cards
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildBookingDetailsCard(),
                          if (_isEditingPatientDetails) ...[
                            const SizedBox(height: 6),
                            _buildPatientDetailsCard(),
                          ],
                          const SizedBox(height: 6),
                          _buildVitalSignsCard(),
                          const SizedBox(height: 6),
                          // Medical Records and Prescriptions in the same row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildMedicalRecordsCard()),
                              const SizedBox(width: 6),
                              Expanded(child: _buildPrescriptionsCard()),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildFooter(),
                        ],
                      ),
                    ),
                    // Right Column - Appointment History
                    const SizedBox(width: 8),
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simple Classic Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Booking Details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
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
                      color: _isEditingPatientDetails
                          ? const Color(0xFF6366F1)
                          : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _isEditingPatientDetails
                            ? const Color(0xFF6366F1)
                            : const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            _isEditingPatientDetails =
                                !_isEditingPatientDetails;
                          });
                        },
                        child: Center(
                          child: Icon(
                            _isEditingPatientDetails ? Icons.close : Icons.edit,
                            size: 16,
                            color: _isEditingPatientDetails
                                ? Colors.white
                                : const Color(0xFF666666),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
          // Enhanced Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF6366F1),
                    side: const BorderSide(
                      color: const Color(0xFF6366F1),
                      width: 1.5,
                    ),
                    backgroundColor: const Color(0xFF6366F1).withOpacity(0.05),
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.add_circle_outline_rounded, size: 16),
                  label: const Text(
                    'Add More',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Cancel appointment action
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFDC2626),
                    side: const BorderSide(
                      color: Color(0xFFDC2626),
                      width: 1.5,
                    ),
                    backgroundColor: const Color(0xFFFEF2F2),
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.cancel_outlined, size: 16),
                  label: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: ElevatedButton.icon(
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
                    backgroundColor: const Color(0xFF1F2937),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  icon: const Icon(Icons.event_repeat_rounded, size: 16),
                  label: const Text(
                    'Reschedule',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _isEditingPatientDetails
            ? const Color(0xFFFAFBFC)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _isEditingPatientDetails
              ? const Color(0xFF333333)
              : const Color(0xFFE5E7EB),
          width: _isEditingPatientDetails ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
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
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Patient Details',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    if (_isEditingPatientDetails) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'EDITING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: _isEditingPatientDetails
                      ? const Color(0xFF6366F1)
                      : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _isEditingPatientDetails
                        ? const Color(0xFF6366F1)
                        : const Color(0xFFE0E0E0),
                    width: 1,
                  ),
                  boxShadow: _isEditingPatientDetails
                      ? [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {
                        _isEditingPatientDetails = !_isEditingPatientDetails;
                      });
                    },
                    child: Center(
                      child: Icon(
                        _isEditingPatientDetails ? Icons.close : Icons.edit,
                        size: 16,
                        color: _isEditingPatientDetails
                            ? Colors.white
                            : const Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
          if (_isEditingPatientDetails) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isEditingPatientDetails = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Save patient details
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Patient details updated successfully'),
                        backgroundColor: Color(0xFF10B981),
                      ),
                    );
                    setState(() {
                      _isEditingPatientDetails = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVitalSignsCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
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
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildVitalSignItem('Blood Pressure', '120/80 mmHg'),
              ),
              const SizedBox(width: 8),
              Expanded(child: _buildVitalSignItem('Temperature', '37°C')),
              const SizedBox(width: 8),
              Expanded(child: _buildVitalSignItem('Pulse', '72 bpm')),
            ],
          ),
          const SizedBox(height: 10),
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simple Classic Header
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Appointment History',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '5',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Simple Timeline
          SizedBox(height: 570, child: _buildEnhancedTimeline()),
          const SizedBox(height: 10),
          // Simple View More Link
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'View All History',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedTimeline() {
    final appointments = [
      {
        'date': '03/09/2025',
        'time': '06:30 PM',
        'reason': 'High Blood Pressure Checkup',
        'doctor': 'Dr. Arun Krishna',
        'status': 'Completed',
        'progress': 1.0,
      },
      {
        'date': '15/08/2025',
        'time': '11:00 AM',
        'reason': 'Follow-up Consultation',
        'doctor': 'Dr. Sarah Johnson',
        'status': 'Completed',
        'progress': 1.0,
      },
      {
        'date': '22/07/2025',
        'time': '03:45 PM',
        'reason': 'Diabetes Checkup',
        'doctor': 'Dr. Arun Krishna',
        'status': 'Completed',
        'progress': 1.0,
      },
      {
        'date': '05/06/2025',
        'time': '09:15 AM',
        'reason': 'General Checkup',
        'doctor': 'Dr. Mike Chen',
        'status': 'Completed',
        'progress': 1.0,
      },
      {
        'date': '18/05/2025',
        'time': '02:30 PM',
        'reason': 'Blood Test',
        'doctor': 'Dr. Arun Krishna',
        'status': 'Completed',
        'progress': 1.0,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: appointments
            .asMap()
            .entries
            .map(
              (entry) => _buildEnhancedTimelineItem(
                entry.value['date'] as String,
                entry.value['time'] as String,
                entry.value['reason'] as String,
                entry.value['doctor'] as String,
                entry.value['status'] as String,
                entry.value['progress'] as double,
                entry.key,
                appointments.length,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildEnhancedTimelineItem(
    String date,
    String time,
    String reason,
    String doctor,
    String status,
    double progress,
    int index,
    int totalItems,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simple timeline indicator
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.check, color: Colors.white, size: 14),
                ),
              ),
              if (index < totalItems - 1)
                Container(
                  width: 2,
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  color: const Color(0xFFE5E7EB),
                ),
            ],
          ),
          const SizedBox(width: 10),
          // Enhanced Content Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, const Color(0xFFF8F9FA)],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Status Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.calendar_today_rounded,
                              size: 10,
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF10B981), Color(0xFF059669)],
                          ),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981).withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Text(
                          status,
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  // Reason with Icon
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6366F1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.medical_services_rounded,
                          size: 10,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          reason,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Doctor Info
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5CF6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          size: 9,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          doctor,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF59E0B).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.access_time_rounded,
                          size: 9,
                          color: Color(0xFFF59E0B),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  // Trending Progress Bar with Gradient
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E7EB),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF10B981), Color(0xFF059669)],
                              ),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF10B981,
                                  ).withOpacity(0.4),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[1]['label']!,
                details[1]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Second row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[2]['label']!,
                details[2]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[3]['label']!,
                details[3]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Third row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[4]['label']!,
                details[4]['value']!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _buildDetailItem(
                details[5]['label']!,
                details[5]['value']!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Fourth row
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                details[6]['label']!,
                details[6]['value']!,
              ),
            ),
            const SizedBox(width: 6),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1F2937),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
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
        _isEditingPatientDetails
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF6366F1),
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: value,
                    hintStyle: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    suffixIcon: hasDropdown
                        ? const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF6366F1),
                            size: 20,
                          )
                        : null,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: TextEditingController(text: value),
                ),
              )
            : Container(
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
    // Get icon and color based on vital sign type
    IconData icon;
    Color iconColor;

    if (label.contains('Blood Pressure')) {
      icon = Icons.bloodtype_rounded;
      iconColor = const Color(0xFFEF4444);
    } else if (label.contains('Temperature')) {
      icon = Icons.thermostat_rounded;
      iconColor = const Color(0xFFF59E0B);
    } else if (label.contains('Pulse') || label.contains('Heart')) {
      icon = Icons.favorite_rounded;
      iconColor = const Color(0xFFEC4899);
    } else {
      icon = Icons.monitor_heart_rounded;
      iconColor = const Color(0xFF6366F1);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE5E7EB).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 14, color: iconColor),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1F2937),
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
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
