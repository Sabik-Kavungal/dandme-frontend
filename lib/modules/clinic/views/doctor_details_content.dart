import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/clinic/viewmodels/doctor_details_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_doctor_links_model.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/models/doctor_session_slot_model.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'dart:convert';

/// Doctor Details Content Widget
///
/// This widget displays the doctor details content that matches the exact UI design
/// from the screenshot with navigation header, doctor profile, and consultation details.

class DoctorDetailsContent extends StatefulWidget {
  final String doctorId;
  final VoidCallback? onBack;

  const DoctorDetailsContent({super.key, required this.doctorId, this.onBack});

  @override
  State<DoctorDetailsContent> createState() => _DoctorDetailsContentState();
}

class _DoctorDetailsContentState extends State<DoctorDetailsContent> {
  bool _isOfflineTimingExpanded = true;
  bool _isOnlineTimingExpanded = false;

  final List<String> _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final Map<String, bool> _selectedDays = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  // Time slot creation state
  final Map<String, Map<String, TextEditingController>>
  _offlineTimeControllers = {};
  final Map<String, Map<String, TextEditingController>> _onlineTimeControllers =
      {};

  // Max patients controllers for offline and online
  final Map<String, Map<String, TextEditingController>>
  _offlineMaxPatientsControllers = {};
  final Map<String, Map<String, TextEditingController>>
  _onlineMaxPatientsControllers = {};

  // Existing slots cache by day and slot type (now stores session slots)
  final Map<String, Map<String, List<DoctorSlotSession>>> _existingSessions =
      {};
  bool _isLoadingExistingSlots = false;

  // Helper method to get day of week number (Monday = 1, Sunday = 7)
  int _getDayOfWeekNumber(String day) {
    switch (day) {
      case 'Monday':
        return 1;
      case 'Tuesday':
        return 2;
      case 'Wednesday':
        return 3;
      case 'Thursday':
        return 4;
      case 'Friday':
        return 5;
      case 'Saturday':
        return 6;
      case 'Sunday':
        return 7;
      default:
        return 1;
    }
  }

  // Get next occurrence of a specific day
  DateTime _getNextOccurrenceOfDay(String day) {
    final now = DateTime.now();
    final targetDayOfWeek = _getDayOfWeekNumber(day);
    final currentDayOfWeek = now.weekday;

    int daysToAdd;
    if (targetDayOfWeek > currentDayOfWeek) {
      // Day is later this week
      daysToAdd = targetDayOfWeek - currentDayOfWeek;
    } else if (targetDayOfWeek < currentDayOfWeek) {
      // Day is next week
      daysToAdd = 7 - currentDayOfWeek + targetDayOfWeek;
    } else {
      // Same day - use next week
      daysToAdd = 7;
    }

    return DateTime(
      now.year,
      now.month,
      now.day,
    ).add(Duration(days: daysToAdd));
  }

  // Load existing sessions for a specific day
  Future<void> _loadExistingSlotsForDay(String day, String slotType) async {
    if (_isLoadingExistingSlots) return;

    setState(() {
      _isLoadingExistingSlots = true;
    });

    try {
      final viewModel = context.read<DoctorDetailsViewModel>();
      final authViewModel = context.read<AuthViewModel>();
      final clinicId = authViewModel.user?.clinicId;

      if (clinicId == null) return;

      // Get the next occurrence date for this day
      final nextDate = _getNextOccurrenceOfDay(day);
      final dateString =
          '${nextDate.year}-${nextDate.month.toString().padLeft(2, '0')}-${nextDate.day.toString().padLeft(2, '0')}';

      print('🔍 Loading existing sessions for $day ($dateString) - $slotType');

      // Call viewmodel method to fetch session slots
      final sessionSlots = await viewModel.listSessionSlotsForDate(
        doctorId: widget.doctorId,
        clinicId: clinicId,
        slotType: slotType,
        date: dateString,
      );

      if (sessionSlots != null && sessionSlots.slots.isNotEmpty) {
        // Extract all sessions from all slot days
        final allSessions = sessionSlots.slots
            .expand((slotDay) => slotDay.sessions)
            .toList();

        setState(() {
          if (!_existingSessions.containsKey(day)) {
            _existingSessions[day] = {};
          }
          _existingSessions[day]![slotType] = allSessions;

          // Pre-fill the time fields with existing session data
          _preFillTimeFieldsFromSessions(day, slotType, allSessions);
        });

        print(
          '✅ Found ${allSessions.length} existing sessions for $day ($slotType)',
        );
        for (final session in allSessions) {
          print(
            '   - ${session.sessionName}: ${session.startTime} to ${session.endTime} (${session.generatedSlots} slots)',
          );
        }
      } else {
        setState(() {
          if (!_existingSessions.containsKey(day)) {
            _existingSessions[day] = {};
          }
          _existingSessions[day]![slotType] = [];
        });
        print('ℹ️ No existing sessions found for $day ($slotType)');
      }
    } catch (e) {
      print('❌ Error loading existing sessions: $e');
    } finally {
      setState(() {
        _isLoadingExistingSlots = false;
      });
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    _offlineTimeControllers.forEach((day, controllers) {
      controllers.forEach((key, controller) => controller.dispose());
    });
    _onlineTimeControllers.forEach((day, controllers) {
      controllers.forEach((key, controller) => controller.dispose());
    });
    _offlineMaxPatientsControllers.forEach((day, controllers) {
      controllers.forEach((key, controller) => controller.dispose());
    });
    _onlineMaxPatientsControllers.forEach((day, controllers) {
      controllers.forEach((key, controller) => controller.dispose());
    });
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Load doctor details and time slots on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<DoctorDetailsViewModel>();
      viewModel.loadDoctorDetails(widget.doctorId);
      viewModel.loadDoctorTimeSlots(widget.doctorId);
      // Load existing slots for all days to auto-check and pre-fill
      _loadAllExistingSlots();
    });
  }

  // Load existing slots for all days and auto-check/pre-fill
  Future<void> _loadAllExistingSlots() async {
    print('');
    print('╔════════════════════════════════════════════════════════════════╗');
    print('║     LOADING ALL EXISTING SLOTS FOR AUTO-FILL                  ║');
    print('╚════════════════════════════════════════════════════════════════╝');
    print('');

    final viewModel = context.read<DoctorDetailsViewModel>();
    final authViewModel = context.read<AuthViewModel>();
    final clinicId = authViewModel.user?.clinicId;

    if (clinicId == null) return;

    // Load for all days in both offline and online
    for (String day in _days) {
      // Load clinic visit slots
      await _loadAndPreFillSlotsForDay(
        day,
        'clinic_visit',
        clinicId,
        viewModel,
      );

      // Load video consultation slots
      await _loadAndPreFillSlotsForDay(
        day,
        'video_consultation',
        clinicId,
        viewModel,
      );
    }

    print('✅ Finished loading and pre-filling all existing slots');
    print('');
  }

  // Load and pre-fill slots for a specific day and slot type
  Future<void> _loadAndPreFillSlotsForDay(
    String day,
    String slotType,
    String clinicId,
    DoctorDetailsViewModel viewModel,
  ) async {
    try {
      // Get the next occurrence date for this day
      final nextDate = _getNextOccurrenceOfDay(day);
      final dateString =
          '${nextDate.year}-${nextDate.month.toString().padLeft(2, '0')}-${nextDate.day.toString().padLeft(2, '0')}';

      // Call viewmodel method to fetch session slots
      final sessionSlots = await viewModel.listSessionSlotsForDate(
        doctorId: widget.doctorId,
        clinicId: clinicId,
        slotType: slotType,
        date: dateString,
      );

      if (sessionSlots != null && sessionSlots.slots.isNotEmpty) {
        // Extract all sessions from all slot days
        final allSessions = sessionSlots.slots
            .expand((slotDay) => slotDay.sessions)
            .toList();

        if (allSessions.isNotEmpty) {
          setState(() {
            // Store existing sessions
            if (!_existingSessions.containsKey(day)) {
              _existingSessions[day] = {};
            }
            _existingSessions[day]![slotType] = allSessions;

            // Auto-check the day checkbox if it has slots
            _selectedDays[day] = true;

            // Pre-fill time fields
            _preFillTimeFieldsFromSessions(day, slotType, allSessions);
          });

          print(
            '✅ $day ($slotType): Found ${allSessions.length} sessions - Auto-checked and pre-filled',
          );
        }
      }
    } catch (e) {
      print('⚠️ Error loading slots for $day ($slotType): $e');
    }
  }

  // Pre-fill time fields from existing sessions
  void _preFillTimeFieldsFromSessions(
    String day,
    String slotType,
    List<DoctorSlotSession> sessions,
  ) {
    // Find morning and afternoon sessions
    DoctorSlotSession? morningSession;
    DoctorSlotSession? afternoonSession;

    for (var session in sessions) {
      final sessionName = (session.sessionName ?? '').toLowerCase();
      if (sessionName.contains('morning')) {
        morningSession = session;
      } else if (sessionName.contains('afternoon')) {
        afternoonSession = session;
      }
    }

    // Pre-fill controllers
    final controllers = slotType == 'clinic_visit'
        ? _offlineTimeControllers
        : _onlineTimeControllers;
    final maxPatientsControllers = slotType == 'clinic_visit'
        ? _offlineMaxPatientsControllers
        : _onlineMaxPatientsControllers;

    // Initialize controllers for this day if not already done
    if (!controllers.containsKey(day)) {
      controllers[day] = {
        'morningStart': TextEditingController(),
        'morningEnd': TextEditingController(),
        'afternoonStart': TextEditingController(),
        'afternoonEnd': TextEditingController(),
      };
    }
    if (!maxPatientsControllers.containsKey(day)) {
      maxPatientsControllers[day] = {
        'morningMax': TextEditingController(),
        'afternoonMax': TextEditingController(),
      };
    }

    // Fill morning session data
    if (morningSession != null) {
      controllers[day]!['morningStart']!.text = morningSession.startTime ?? '';
      controllers[day]!['morningEnd']!.text = morningSession.endTime ?? '';
      maxPatientsControllers[day]!['morningMax']!.text = morningSession
          .maxPatients
          .toString();
      print(
        '   - Morning: ${morningSession.startTime} to ${morningSession.endTime} (Max: ${morningSession.maxPatients})',
      );
    }

    // Fill afternoon session data
    if (afternoonSession != null) {
      controllers[day]!['afternoonStart']!.text =
          afternoonSession.startTime ?? '';
      controllers[day]!['afternoonEnd']!.text = afternoonSession.endTime ?? '';
      maxPatientsControllers[day]!['afternoonMax']!.text = afternoonSession
          .maxPatients
          .toString();
      print(
        '   - Afternoon: ${afternoonSession.startTime} to ${afternoonSession.endTime} (Max: ${afternoonSession.maxPatients})',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorDetailsViewModel>(
      builder: (context, viewModel, child) {
        // Show loading state
        if (viewModel.isLoadingDoctor) {
          return Container(
            color: const Color(0xFFF5F5F5),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Loading doctor details...',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }

        // Show error state
        if (viewModel.error.isNotEmpty &&
            viewModel.doctorInfo == null &&
            viewModel.doctor == null) {
          return Container(
            color: const Color(0xFFF5F5F5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading doctor details',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () =>
                        viewModel.loadDoctorDetails(widget.doctorId),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          color: const Color(0xFFF5F5F5), // Light grey background
          child: Column(
            children: [
              _buildNavigationHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDoctorProfileSection(
                            viewModel.doctorInfo ?? viewModel.doctor,
                          ),
                          const SizedBox(height: 24),
                          _buildInformationCards(
                            viewModel.doctorInfo ?? viewModel.doctor,
                          ),
                          const SizedBox(height: 24),
                          _buildBiographySection(
                            viewModel.doctorInfo ?? viewModel.doctor,
                          ),
                          const SizedBox(height: 24),
                          _buildConsultationDetailsSection(),
                          if (viewModel.clinicLinks.isNotEmpty) ...[
                            const SizedBox(height: 24),
                            _buildClinicLinksSection(viewModel.clinicLinks),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildFooter(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavigationHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Doctor Linking',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Role Manage',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorProfileSection(dynamic doctor) {
    String doctorName;
    String specialization;
    String email;
    String? doctorId;
    String? licenseNumber;

    // Handle new DoctorInfo model
    if (doctor is DoctorInfo) {
      doctorName = '${doctor.firstName} ${doctor.lastName}';
      specialization = doctor.specialization ?? 'General Practitioner';
      email = doctor.email ?? 'N/A';
      doctorId = doctor.doctorId;
      licenseNumber = doctor.licenseNumber;
    }
    // Handle legacy Doctor model
    else if (doctor is Doctor) {
      doctorName =
          doctor.fullName ??
          (doctor.firstName != null && doctor.lastName != null
              ? '${doctor.firstName} ${doctor.lastName}'
              : 'Dr. Unknown');
      specialization = doctor.specialization ?? 'General Practitioner';
      email = doctor.email ?? 'N/A';
      doctorId = doctor.id;
      licenseNumber = null;
    }
    // Fallback
    else {
      doctorName = 'Dr. Unknown';
      specialization = 'General Practitioner';
      email = 'N/A';
      doctorId = null;
      licenseNumber = null;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Doctor Avatar
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              doctorName.split(' ').length >= 2
                  ? '${doctorName.split(' ')[0][0]}${doctorName.split(' ')[1][0]}'
                  : doctorName.length >= 2
                  ? doctorName.substring(0, 2)
                  : 'DR',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Doctor Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getSpecializationIcon(specialization),
                          size: 16,
                          color: Colors.red.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          specialization,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              if (licenseNumber != null) ...[
                Text(
                  'License No: $licenseNumber',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 2),
              ],
              Text(
                'ID: ${doctorId ?? 'N/A'}',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 2),
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        // Edit Button
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 16, color: Colors.grey),
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  IconData _getSpecializationIcon(String specialization) {
    switch (specialization.toLowerCase()) {
      case 'cardiology':
        return Icons.favorite;
      case 'ent':
      case 'ent specialist':
        return Icons.hearing;
      case 'orthopedics':
        return Icons.accessibility;
      case 'pediatrics':
        return Icons.child_care;
      case 'neurology':
        return Icons.psychology;
      case 'dermatology':
        return Icons.face;
      case 'ophthalmology':
        return Icons.visibility;
      default:
        return Icons.medical_services;
    }
  }

  Widget _buildInformationCards(dynamic doctor) {
    String qualification;
    String experience;
    String phone;
    String email;

    // Handle new DoctorInfo model
    if (doctor is DoctorInfo) {
      qualification = 'MBBS'; // Default for new API
      experience = '5+ years'; // Default for new API
      phone = doctor.phone ?? 'N/A';
      email = doctor.email ?? 'N/A';
    }
    // Handle legacy Doctor model
    else if (doctor is Doctor) {
      qualification = doctor.qualification ?? 'MBBS';
      experience = doctor.experience ?? '5+ years';
      phone = doctor.phone ?? 'N/A';
      email = doctor.email ?? 'N/A';
    }
    // Fallback
    else {
      qualification = 'MBBS';
      experience = '5+ years';
      phone = 'N/A';
      email = 'N/A';
    }

    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            icon: Icons.school,
            iconColor: Colors.green,
            title: 'Qualification',
            value: qualification,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.work,
            iconColor: Colors.red,
            title: 'Experience',
            value: experience,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.phone,
            iconColor: Colors.green,
            title: 'Mobile Number',
            value: phone,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.email,
            iconColor: Colors.blue,
            title: 'Email',
            value: email,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBiographySection(dynamic doctor) {
    String doctorName;
    String specialization;
    String qualification;

    // Handle new DoctorInfo model
    if (doctor is DoctorInfo) {
      doctorName = '${doctor.firstName} ${doctor.lastName}';
      specialization = doctor.specialization ?? 'General Practitioner';
      qualification = 'MBBS'; // Default for new API
    }
    // Handle legacy Doctor model
    else if (doctor is Doctor) {
      doctorName =
          doctor.fullName ??
          (doctor.firstName != null && doctor.lastName != null
              ? '${doctor.firstName} ${doctor.lastName}'
              : 'Dr. Unknown');
      specialization = doctor.specialization ?? 'General Practitioner';
      qualification = doctor.qualification ?? 'MBBS';
    }
    // Fallback
    else {
      doctorName = 'Dr. Unknown';
      specialization = 'General Practitioner';
      qualification = 'MBBS';
    }

    final bio =
        'Dr. $doctorName is a highly qualified $specialization with extensive experience in the field. $qualification graduate with expertise in providing comprehensive medical care to patients.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Biography',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          bio,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildConsultationDetailsSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column - Consultation Timing
        Expanded(flex: 2, child: _buildConsultationTimingSection()),
        const SizedBox(width: 24),
        // Right Column - Fee Management
        Expanded(flex: 1, child: _buildFeeManagementSection()),
      ],
    );
  }

  Widget _buildConsultationTimingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Info message about automatic date selection
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Select days below. Slots will be created for the next occurrence of each selected day.',
                  style: TextStyle(fontSize: 13, color: Colors.blue.shade900),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        _buildTimingSection(
          title: 'Offline Consultation Timing',
          isExpanded: _isOfflineTimingExpanded,
          onToggle: () => setState(
            () => _isOfflineTimingExpanded = !_isOfflineTimingExpanded,
          ),
          child: _buildTimingTable(slotType: 'clinic_visit'),
        ),
        const SizedBox(height: 16),
        _buildTimingSection(
          title: 'Online Consultation Timing',
          isExpanded: _isOnlineTimingExpanded,
          onToggle: () => setState(
            () => _isOnlineTimingExpanded = !_isOnlineTimingExpanded,
          ),
          child: _buildTimingTable(slotType: 'video_consultation'),
        ),
      ],
    );
  }

  Widget _buildTimingSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onToggle,
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Spacer(),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
        if (isExpanded) ...[const SizedBox(height: 16), child],
      ],
    );
  }

  Widget _buildTimingTable({required String slotType}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 40), // Space for checkbox column
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Days',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Morning (Start - End)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Max',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Afternoon (Start - End)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Max',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // Days rows
              ..._days.map((day) => _buildDayRow(day, slotType)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Save button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _createSlots(slotType),
            icon: const Icon(Icons.save),
            label: Text(
              'Save ${slotType == 'clinic_visit' ? 'Clinic Visit' : 'Video Consultation'} Slots',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayRow(String day, String slotType) {
    final isSelected = _selectedDays[day] ?? false;

    // Get or create controllers for this day and slot type
    final controllers = slotType == 'clinic_visit'
        ? _offlineTimeControllers
        : _onlineTimeControllers;
    if (!controllers.containsKey(day)) {
      controllers[day] = {
        'morningStart': TextEditingController(),
        'morningEnd': TextEditingController(),
        'afternoonStart': TextEditingController(),
        'afternoonEnd': TextEditingController(),
      };
    }

    // Get or create max patients controllers
    final maxPatientsControllers = slotType == 'clinic_visit'
        ? _offlineMaxPatientsControllers
        : _onlineMaxPatientsControllers;
    if (!maxPatientsControllers.containsKey(day)) {
      maxPatientsControllers[day] = {
        'morningMax': TextEditingController(),
        'afternoonMax': TextEditingController(),
      };
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (value) async {
                  setState(() {
                    _selectedDays[day] = value ?? false;
                  });

                  // Load existing slots when day is checked
                  if (value == true) {
                    await _loadExistingSlotsForDay(day, slotType);
                  }
                },
                activeColor: Colors.blue,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? const Color(0xFF1A1A1A)
                        : Colors.grey.shade600,
                  ),
                ),
              ),
              // Morning slots
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeInputWithPicker(
                      isSelected,
                      controllers[day]!['morningStart']!,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: Colors.grey.shade400,
                    ),
                    _buildTimeInputWithPicker(
                      isSelected,
                      controllers[day]!['morningEnd']!,
                    ),
                  ],
                ),
              ),
              // Morning max patients
              Expanded(
                flex: 1,
                child: _buildMaxPatientsInput(
                  isSelected,
                  maxPatientsControllers[day]!['morningMax']!,
                ),
              ),
              // Afternoon slots
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeInputWithPicker(
                      isSelected,
                      controllers[day]!['afternoonStart']!,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: Colors.grey.shade400,
                    ),
                    _buildTimeInputWithPicker(
                      isSelected,
                      controllers[day]!['afternoonEnd']!,
                    ),
                  ],
                ),
              ),
              // Afternoon max patients
              Expanded(
                flex: 1,
                child: _buildMaxPatientsInput(
                  isSelected,
                  maxPatientsControllers[day]!['afternoonMax']!,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeInputWithPicker(
    bool isEnabled,
    TextEditingController controller,
  ) {
    return GestureDetector(
      onTap: isEnabled
          ? () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                controller.text =
                    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
              }
            }
          : null,
      child: Container(
        width: 60,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
          color: isEnabled ? Colors.white : Colors.grey.shade100,
        ),
        child: TextField(
          controller: controller,
          enabled: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '00:00',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ),
    );
  }

  Widget _buildMaxPatientsInput(
    bool isEnabled,
    TextEditingController controller,
  ) {
    return Center(
      child: Container(
        width: 45,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
          color: isEnabled ? Colors.white : Colors.grey.shade100,
        ),
        child: TextField(
          controller: controller,
          enabled: isEnabled,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '1',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
          onChanged: (value) {
            // Validate input is a number
            if (value.isNotEmpty) {
              final number = int.tryParse(value);
              if (number == null || number < 1) {
                controller.text = '1';
                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _createSlots(String slotType) async {
    print('');
    print('╔════════════════════════════════════════════════════════════════╗');
    print('║     STARTING CREATE SLOTS PROCESS                             ║');
    print('╚════════════════════════════════════════════════════════════════╝');
    print('📍 Slot Type: $slotType');
    print('👨‍⚕️ Doctor ID: ${widget.doctorId}');
    print('');

    // Validation - check if any days are selected
    final selectedDaysList = _selectedDays.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    print('📅 Selected Days: ${selectedDaysList.join(', ')}');
    print('');

    if (selectedDaysList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one day'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final viewModel = context.read<DoctorDetailsViewModel>();
    final authViewModel = context.read<AuthViewModel>();
    final clinicId = authViewModel.user?.clinicId;

    if (clinicId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Clinic ID not found'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final controllers = slotType == 'clinic_visit'
        ? _offlineTimeControllers
        : _onlineTimeControllers;

    final maxPatientsControllers = slotType == 'clinic_visit'
        ? _offlineMaxPatientsControllers
        : _onlineMaxPatientsControllers;

    // Show loading dialog
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
                Text('Creating slots for selected days...'),
              ],
            ),
          ),
        ),
      ),
    );

    int totalCreated = 0;
    int totalFailed = 0;
    final List<String> createdDates = [];
    final List<String> errorMessages = [];

    // Create slots for each selected day
    for (final day in selectedDaysList) {
      if (!controllers.containsKey(day)) continue;

      final dayControllers = controllers[day]!;
      final dayMaxPatients = maxPatientsControllers[day];

      // Get next occurrence of this day and day_of_week number
      final nextDate = _getNextOccurrenceOfDay(day);
      final dayOfWeekNumber = _getDayOfWeekNumber(day);
      final dateString =
          '${nextDate.year}-${nextDate.month.toString().padLeft(2, '0')}-${nextDate.day.toString().padLeft(2, '0')}';

      final List<SessionDefinition> daySessions = [];

      // Morning session
      final morningStart = dayControllers['morningStart']!.text;
      final morningEnd = dayControllers['morningEnd']!.text;
      if (morningStart.isNotEmpty && morningEnd.isNotEmpty) {
        final morningMax =
            int.tryParse(dayMaxPatients?['morningMax']?.text ?? '1') ?? 1;
        daySessions.add(
          SessionDefinition(
            sessionName: 'Morning Session',
            startTime: morningStart,
            endTime: morningEnd,
            maxPatients: morningMax,
            slotIntervalMinutes: 5, // Default 5-minute intervals
          ),
        );
      }

      // Afternoon session
      final afternoonStart = dayControllers['afternoonStart']!.text;
      final afternoonEnd = dayControllers['afternoonEnd']!.text;
      if (afternoonStart.isNotEmpty && afternoonEnd.isNotEmpty) {
        final afternoonMax =
            int.tryParse(dayMaxPatients?['afternoonMax']?.text ?? '1') ?? 1;
        daySessions.add(
          SessionDefinition(
            sessionName: 'Afternoon Session',
            startTime: afternoonStart,
            endTime: afternoonEnd,
            maxPatients: afternoonMax,
            slotIntervalMinutes: 5, // Default 5-minute intervals
          ),
        );
      }

      // Skip if no sessions for this day
      if (daySessions.isEmpty) continue;

      // Create the input for session-based slots
      final input = CreateSessionSlotsInput(
        doctorId: widget.doctorId,
        clinicId: clinicId,
        slotType: slotType,
        slotDuration: 5,
        date: dateString,
        isAvailable: true,
        sessions: daySessions,
      );

      // Print detailed input
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print('║     CREATING SESSION-BASED SLOTS FOR $day                     ');
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📅 Date: $dateString');
      print('📆 Day of Week: $dayOfWeekNumber ($day)');
      print('👨‍⚕️ Doctor ID: ${widget.doctorId}');
      print('🏥 Clinic ID: $clinicId');
      print('📍 Slot Type: $slotType');
      print('⏱️ Slot Duration: 5 minutes');
      print('📊 Number of Sessions: ${daySessions.length}');
      print('');
      print('📋 Session Details:');
      for (int i = 0; i < daySessions.length; i++) {
        final session = daySessions[i];
        print('  Session ${i + 1}: ${session.sessionName}');
        print('    ⏰ Time: ${session.startTime} - ${session.endTime}');
        print('    👥 Max Patients: ${session.maxPatients}');
        print('    ⏱️ Interval: ${session.slotIntervalMinutes} min');
        if (session.notes != null) print('    📝 Notes: ${session.notes}');
      }
      print('');

      // Print JSON Request
      print('📤 API REQUEST (JSON):');
      print('─────────────────────────────────────────────────────────────');
      final requestJson = {
        'doctor_id': widget.doctorId,
        'clinic_id': clinicId,
        'slot_type': slotType,
        'slot_duration': 5,
        'date': dateString,
        'is_available': true,
        'sessions': daySessions
            .map(
              (session) => {
                'session_name': session.sessionName,
                'start_time': session.startTime,
                'end_time': session.endTime,
                'max_patients': session.maxPatients,
                'slot_interval_minutes': session.slotIntervalMinutes,
                if (session.notes != null) 'notes': session.notes,
              },
            )
            .toList(),
      };
      print(const JsonEncoder.withIndent('  ').convert(requestJson));
      print('─────────────────────────────────────────────────────────────');
      print('');

      // Call session API for this day
      final response = await viewModel.createSessionSlots(input);

      // Print response
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print('║     API RESPONSE FOR $day                                     ');
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      if (response != null && response.success) {
        print('✅ Response received: ${response.message}');
        print('📅 Date: ${response.data.date}');
        print('📊 Sessions Created: ${response.data.sessions.length}');
        print('');
        for (final session in response.data.sessions) {
          print('  📋 ${session.sessionName}:');
          print('     ⏰ ${session.startTime} - ${session.endTime}');
          print('     👥 Max Patients: ${session.maxPatients}');
          print('     🎫 Generated Slots: ${session.generatedSlots}');
          print('     ✅ Available: ${session.availableSlots}');
          print('     📌 Booked: ${session.bookedSlots}');
        }
        print('');

        // Print JSON Response
        print('📥 API RESPONSE (JSON):');
        print('─────────────────────────────────────────────────────────────');
        final responseJson = {
          'success': response.success,
          'message': response.message,
          'data': {
            'id': response.data.id,
            'doctor_id': response.data.doctorId,
            'clinic_id': response.data.clinicId,
            'date': response.data.date,
            'day_of_week': response.data.dayOfWeek,
            'slot_type': response.data.slotType,
            'sessions': response.data.sessions
                .map(
                  (s) => {
                    'session_name': s.sessionName,
                    'start_time': s.startTime,
                    'end_time': s.endTime,
                    'max_patients': s.maxPatients,
                    'generated_slots': s.generatedSlots,
                    'available_slots': s.availableSlots,
                    'booked_slots': s.bookedSlots,
                  },
                )
                .toList(),
          },
        };
        print(const JsonEncoder.withIndent('  ').convert(responseJson));
        print('─────────────────────────────────────────────────────────────');
        print('');

        // Count total generated slots
        final totalGenerated = response.data.sessions.fold<int>(
          0,
          (sum, session) => sum + session.generatedSlots,
        );
        totalCreated += totalGenerated;
        createdDates.add('$day ($dateString) - $totalGenerated slots');
      } else {
        print('❌ Response is null or failed - API call failed');
        if (response != null) {
          print('   Message: ${response.message}');
        }
        print('');
        totalFailed += daySessions.length;
        errorMessages.add('$day: Failed to create sessions');
      }
    }

    // Close loading dialog
    if (mounted) Navigator.of(context).pop();

    // Print final summary
    print('');
    print('╔════════════════════════════════════════════════════════════════╗');
    print('║     FINAL SUMMARY - CREATE SLOTS                              ║');
    print('╚════════════════════════════════════════════════════════════════╝');
    print('📊 Total Created: $totalCreated slots');
    print('❌ Total Failed: $totalFailed slots');
    print('📅 Days Processed: ${selectedDaysList.length}');
    print('✅ Successful Days: ${createdDates.length}');
    if (createdDates.isNotEmpty) {
      print('');
      print('📋 Created Dates:');
      for (final dateInfo in createdDates) {
        print('  - $dateInfo');
      }
    }
    print('');
    print('════════════════════════════════════════════════════════════════');
    print('');

    // Show result
    if (totalCreated > 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successfully created $totalCreated slots\nDays: ${createdDates.join(', ')}',
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } else {
      if (mounted) {
        // Show detailed error messages
        final errorText = errorMessages.isNotEmpty
            ? 'Failed to create slots:\n${errorMessages.take(3).join('\n')}'
            : 'Failed to create slots. Please check the time inputs.';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorText),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 7),
            action: SnackBarAction(
              label: 'Dismiss',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );

        // Show helpful dialog for conflict errors
        if (errorMessages.any(
          (msg) =>
              msg.contains('already has slots') || msg.contains('Conflict'),
        )) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            if (mounted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.orange),
                      SizedBox(width: 8),
                      Text('Time Slot Conflict'),
                    ],
                  ),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The doctor already has time slots scheduled for this date.',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'To resolve this:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• Choose a different date for the slots'),
                      Text('• Select different time ranges'),
                      Text('• Delete existing slots for this date first'),
                      Text('• Check if slots exist in another clinic'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Got it'),
                    ),
                  ],
                ),
              );
            }
          });
        }
      }
    }

    // Show warning if some failed
    if (totalFailed > 0 && totalCreated > 0) {
      if (mounted) {
        await Future.delayed(const Duration(milliseconds: 500));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Warning: $totalFailed slots failed\n${errorMessages.take(2).join('\n')}',
            ),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 6),
          ),
        );
      }
    }
  }

  Widget _buildFeeManagementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Consultation Fee Management',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        _buildFeeInput('Online Consultation Fee', '200'),
        const SizedBox(height: 16),
        _buildFeeInput('Offline Consultation Fee', '250'),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Link to Our Hospital',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeeInput(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: value),
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClinicLinksSection(List<ClinicLink> clinicLinks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Clinic Links & Fees',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        ...clinicLinks.map((clinicLink) => _buildClinicLinkCard(clinicLink)),
      ],
    );
  }

  Widget _buildClinicLinkCard(ClinicLink clinicLink) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clinic header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: clinicLink.isActive
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  clinicLink.isActive ? 'Active' : 'Inactive',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: clinicLink.isActive
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Link ID: ${clinicLink.linkId}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Clinic info
          Text(
            clinicLink.clinic.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Code: ${clinicLink.clinic.clinicCode}',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          if (clinicLink.clinic.address != null) ...[
            const SizedBox(height: 4),
            Text(
              clinicLink.clinic.address!,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
          const SizedBox(height: 12),
          // Fees section
          Row(
            children: [
              Expanded(
                child: _buildFeeCard(
                  'Offline Fee',
                  clinicLink.fees.consultationFeeOffline?.toString() ?? 'N/A',
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildFeeCard(
                  'Online Fee',
                  clinicLink.fees.consultationFeeOnline?.toString() ?? 'N/A',
                  Colors.green,
                ),
              ),
              if (clinicLink.fees.followUpFee != null) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: _buildFeeCard(
                    'Follow-up Fee',
                    clinicLink.fees.followUpFee.toString(),
                    Colors.orange,
                  ),
                ),
              ],
            ],
          ),
          if (clinicLink.notes != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Notes: ${clinicLink.notes}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFeeCard(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount == 'N/A' ? amount : '₹$amount',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Text(
        'Copyright © 2025 DelMe All rights reserved',
        style: TextStyle(fontSize: 12, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
