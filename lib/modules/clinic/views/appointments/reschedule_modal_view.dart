import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/models/doctor_session_slot_model.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:intl/intl.dart';
import 'widgets/time_slot_section.dart';

const kBgColor = Color(0xFFF4F8FB);
const kCardColor = Colors.white;
const kPrimaryText = Color(0xFF1B2A41);
const kSecondaryText = Color(0xFF6B7C93);
const kAccentColor = Color(0xFF1B2A41); // Medical Blue
const kSuccessColor = Color(0xFF16A34A);
const kErrorColor = Color(0xFFDC2626);
const kBorderColor = Color(0xFFE6EEF5);

class RescheduleModal extends StatefulWidget {
  final String? appointmentId;

  const RescheduleModal({super.key, this.appointmentId});

  @override
  State<RescheduleModal> createState() => _RescheduleModalState();
}

class _RescheduleModalState extends State<RescheduleModal>
    with SingleTickerProviderStateMixin {
  late NewAppointmentViewModel _viewModel;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _viewModel = NewAppointmentViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );

    _viewModel.initialize().then((_) {
      if (widget.appointmentId != null) {
        _viewModel.loadAppointmentForReschedule(widget.appointmentId!);
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _closePanel({bool didReschedule = false}) async {
    await _animationController.reverse();
    if (mounted) {
      Navigator.of(context).pop(didReschedule);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;
    final panelWidth = isMobile ? screenWidth : 460.0;

    return Material(
      color: Colors.black.withOpacity(0.4),
      child: GestureDetector(
        onTap: () => _closePanel(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: panelWidth,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF4F8FB), Color(0xFFEAF3FA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(-6, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildHeader(),
                        Expanded(child: _buildFormContent(isMobile)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= HEADER =================

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: kBorderColor)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kAccentColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: kAccentColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          const Text(
            'Reschedule Appointment',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: kPrimaryText,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => _closePanel(),
            icon: const Icon(Icons.close_rounded),
            color: kSecondaryText,
          ),
        ],
      ),
    );
  }

  /// ================= FORM =================

  Widget _buildFormContent(bool isMobile) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<NewAppointmentViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: kAccentColor),
            );
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader(
                        '1',
                        'Select New Date',
                        Icons.calendar_month_rounded,
                      ),
                      const SizedBox(height: 16),
                      _buildDatePicker(context, viewModel),
                      const SizedBox(height: 30),
                      _buildSectionHeader(
                        '2',
                        'Consultation Type',
                        Icons.local_hospital_rounded,
                      ),
                      const SizedBox(height: 16),
                      _buildConsultationTypeSelector(viewModel),
                      const SizedBox(height: 30),
                      _buildSectionHeader(
                        '3',
                        'Select Time Slot',
                        Icons.access_time_filled_rounded,
                      ),
                      const SizedBox(height: 16),
                      _buildSlotsLegend(),
                      const SizedBox(height: 16),
                      _buildTimeSlotsSection(viewModel, isMobile),
                      const SizedBox(height: 30),
                      const Text(
                        'Reason for Rescheduling (Optional)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryText,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildReasonBox(viewModel),
                    ],
                  ),
                ),
              ),
              _buildFooter(viewModel),
            ],
          );
        },
      ),
    );
  }

  Widget _buildReasonBox(NewAppointmentViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: TextEditingController(text: viewModel.patientNotes)
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: viewModel.patientNotes.length),
          ),
        onChanged: viewModel.setPatientNotes,
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: 'e.g., Schedule conflict...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildFooter(NewAppointmentViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: kBorderColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => _closePanel(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text("Cancel"),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed:
                  viewModel.isCreating || viewModel.selectedSlotId == null
                  ? null
                  : () async {
                      if (widget.appointmentId != null) {
                        final success = await viewModel.rescheduleAppointment(
                          widget.appointmentId!,
                        );

                        if (success && mounted) {
                          await _closePanel(didReschedule: true);
                        }
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor,
                elevation: 4,
                shadowColor: kAccentColor.withOpacity(0.3),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: viewModel.isCreating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Confirm Reschedule',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String number, String title, IconData icon) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kAccentColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: kAccentColor.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: kPrimaryText,
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(
    BuildContext context,
    NewAppointmentViewModel viewModel,
  ) {
    final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
    DateTime selectedDate;
    try {
      selectedDate = viewModel.selectedSlotDate;
    } catch (e) {
      selectedDate = DateTime.now();
    }

    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 90)),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: kAccentColor,
                  onPrimary: Colors.white,
                  onSurface: kPrimaryText,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(foregroundColor: kAccentColor),
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          viewModel.selectDateAndReloadSlots(picked);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kBorderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: kAccentColor,
              size: 22,
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appointment Date',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kSecondaryText,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dateFormat.format(selectedDate),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryText,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: kSecondaryText,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationTypeSelector(NewAppointmentViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: viewModel.selectedConsultationType,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: kSecondaryText,
            size: 24,
          ),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: kPrimaryText,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              viewModel.setConsultationType(newValue);
            }
          },
          items: [
            _buildDropdownItem(
              'clinic_visit',
              'Clinic Visit',
              Icons.person_pin_circle_rounded,
            ),
            _buildDropdownItem(
              'video_consultation',
              'Video Consultation',
              Icons.video_camera_front_rounded,
            ),
            // Add other types if needed
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(
    String value,
    String label,
    IconData icon,
  ) {
    return DropdownMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: kAccentColor),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSlotsLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildLegendItem(kAccentColor, 'Selected', true),
        const SizedBox(width: 4),
        _buildLegendItem(
          const Color(0xFFF0FDF4),
          'Available',
          true,
          hasBorder: true,
        ),
        const SizedBox(width: 4),
        _buildLegendItem(const Color(0xFFFEF2F2), 'Booked', true),
      ],
    );
  }

  Widget _buildLegendItem(
    Color color,
    String label,
    bool isCircle, {
    bool hasBorder = false,
  }) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            border: hasBorder ? Border.all(color: kBorderColor) : null,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: kSecondaryText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotsSection(
    NewAppointmentViewModel viewModel,
    bool isMobile,
  ) {
    if (viewModel.isLoadingSlots) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: const Center(
          child: CircularProgressIndicator(color: kAccentColor, strokeWidth: 2),
        ),
      );
    }

    if (viewModel.groupedTimeSlots == null ||
        (viewModel.groupedTimeSlots!.days.isEmpty) ||
        (viewModel.groupedTimeSlots!.days.every((day) => !day.hasSlots))) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kBorderColor, style: BorderStyle.solid),
        ),
        child: Column(
          children: [
            Icon(
              Icons.event_busy_rounded,
              size: 48,
              color: kSecondaryText.withOpacity(0.3),
            ),
            const SizedBox(height: 4),
            const Text(
              'No time slots available for this date.',
              style: TextStyle(
                color: kPrimaryText,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Please select a different date or doctor.',
              style: TextStyle(color: kSecondaryText, fontSize: 13),
            ),
          ],
        ),
      );
    }

    // ✅ Try to use session-based grouping if available (Similar to NewAppointmentView)
    final sessionResponse = viewModel.sessionSlotsResponse;
    if (sessionResponse != null && sessionResponse.slots.isNotEmpty) {
      return _buildSessionBasedSlots(sessionResponse, viewModel, isMobile);
    }

    // Fallback logic
    final morningSlots = viewModel.morningSlots;
    final afternoonSlots = viewModel.afternoonSlots;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (morningSlots.isNotEmpty) ...[
          TimeSlotSection(
            title: 'Morning Slots',
            slots: morningSlots,
            viewModel: viewModel,
            isMorning: true,
            isMobile: isMobile,
          ),
          const SizedBox(height: 4),
        ],
        if (afternoonSlots.isNotEmpty) ...[
          TimeSlotSection(
            title: 'Afternoon Slots',
            slots: afternoonSlots,
            viewModel: viewModel,
            isMorning: false,
            isMobile: isMobile,
          ),
        ],
      ],
    );
  }

  /// Build slots grouped by sessions (from API response)
  Widget _buildSessionBasedSlots(
    ListSessionSlotsResponse sessionResponse,
    NewAppointmentViewModel viewModel,
    bool isMobile,
  ) {
    final sections = <Widget>[];
    final selectedDate = viewModel.selectedSlotDate;
    final selectedDateString = _formatDate(selectedDate);
    final scaleFactor = 1.0;

    // Process each slot day
    for (final slotDay in sessionResponse.slots) {
      final isRecurring = slotDay.dayOfWeek != null;
      final resolvedDayName = _resolveDayName(slotDay.dayOfWeek, selectedDate);
      final resolvedDayOfWeek = _resolveDayOfWeek(
        slotDay.dayOfWeek,
        selectedDate.weekday,
      );

      // Process each session
      for (final session in slotDay.sessions) {
        // Convert individual slots to DoctorTimeSlotResponse
        final sessionSlots = session.slots.map((slot) {
          final slotDate = (slotDay.date != null && slotDay.date!.isNotEmpty)
              ? slotDay.date!
              : selectedDateString;
          final doctorId =
              slotDay.doctorId ??
              (viewModel.selectedDoctorObject?.doctorId ??
                  viewModel.selectedDoctorObject?.id ??
                  '');
          final clinicId = slot.clinicId ?? slotDay.clinicId ?? '';

          return DoctorTimeSlotResponse(
            id: slot.id,
            doctorId: doctorId,
            clinicId: clinicId,
            date: slotDate,
            dayOfWeek: resolvedDayOfWeek,
            dayName: resolvedDayName,
            slotType: slotDay.slotType ?? 'clinic_visit',
            startTime: slot.slotStart ?? '00:00',
            endTime: slot.slotEnd ?? '00:00',
            startDateTime: slot.startDatetime,
            endDateTime: slot.endDatetime,
            maxPatients: slot.maxPatients,
            bookedPatients: slot.bookedCount,
            availableSpots: slot.isBookable && !slot.isBooked
                ? slot.availableCount
                : 0,
            isAvailable:
                slot.isBookable && !slot.isBooked && slot.status == 'available',
            isBookable: slot.isBookable,
            status: slot.status,
            displayMessage: slot.displayMessage,
            notes: slot.notes,
            isActive: true,
          );
        }).toList();

        if (sessionSlots.isNotEmpty) {
          final sessionTitle = _buildSessionTitle(
            session.sessionName ?? 'Session',
            session.availableSlots,
            session.generatedSlots,
            isRecurring,
          );

          sections.add(
            TimeSlotSection(
              title: sessionTitle,
              slots: sessionSlots,
              viewModel: viewModel,
              scaleFactor: scaleFactor,
              isMorning: _isMorningSession(
                session.startTime ?? '',
                session.startDatetime,
              ),
              isMobile: isMobile,
            ),
          );
          sections.add(const SizedBox(height: 4));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections,
    );
  }

  /// Build session title with availability info and recurring badge
  String _buildSessionTitle(
    String sessionName,
    int available,
    int total,
    bool isRecurring,
  ) {
    final recurringBadge = isRecurring ? ' 🔄' : '';
    return '$sessionName ($available/$total available)$recurringBadge';
  }

  /// Check if session is morning session
  bool _isMorningSession(String startTime, [String? startDatetime]) {
    try {
      if (startDatetime != null && startDatetime.isNotEmpty) {
        final dateTime = DateTime.parse(startDatetime).toLocal();
        return dateTime.hour < 12;
      }

      if (startTime.contains('T')) {
        final dateTime = DateTime.parse(startTime);
        return dateTime.hour < 12;
      }

      // Handle AM/PM format (e.g. "01:28 PM")
      final upperStartTime = startTime.toUpperCase();
      if (upperStartTime.contains('PM') || upperStartTime.contains('AM')) {
        final parts = startTime.split(' ');
        if (parts.length >= 2) {
          final timeParts = parts[0].split(':');
          if (timeParts.isNotEmpty) {
            var hour = int.tryParse(timeParts[0]) ?? 0;
            final isPM = parts[1].toUpperCase() == 'PM';
            final isAM = parts[1].toUpperCase() == 'AM';

            if (isPM && hour < 12) hour += 12;
            if (isAM && hour == 12) hour = 0;

            return hour < 12;
          }
        }
      }

      final hourPart = startTime.split(':').first;
      final hour = int.tryParse(hourPart) ?? 0;
      return hour < 12;
    } catch (e) {
      return true; // Default to morning
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _resolveDayName(int? apiDayOfWeek, DateTime selectedDate) {
    const weekdayNames = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    if (apiDayOfWeek != null &&
        apiDayOfWeek >= 0 &&
        apiDayOfWeek < weekdayNames.length) {
      return weekdayNames[apiDayOfWeek];
    }

    return weekdayNames[(selectedDate.weekday % 7)];
  }

  int? _resolveDayOfWeek(int? apiDayOfWeek, int selectedDayOfWeek) {
    if (apiDayOfWeek == null) {
      return selectedDayOfWeek;
    }

    if (apiDayOfWeek == 0) {
      return 7; // Sunday in Dart DateTime
    }

    return apiDayOfWeek;
  }
}
