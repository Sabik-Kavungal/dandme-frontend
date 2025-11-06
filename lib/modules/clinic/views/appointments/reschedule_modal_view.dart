import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:a/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';

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

    // Initialize the viewmodel and load appointment data
    _viewModel.initialize().then((_) {
      if (widget.appointmentId != null) {
        _viewModel.loadAppointmentForReschedule(widget.appointmentId!);
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    // Slide animation from right (for desktop/tablet right-side panel)
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

  void _closePanel() async {
    await _animationController.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 480;
    final isTablet = screenWidth >= 480 && screenWidth < 1024;

    // Check if actually being shown as bottom sheet by checking route
    final route = ModalRoute.of(context);
    final showAsBottomSheet = isMobile && route != null;

    if (showAsBottomSheet) {
      // Mobile Bottom Sheet Layout
      return Container(
        height: screenHeight * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Header with drag handle
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                ),
              ),
              child: Column(
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  // Title and close button
                  Row(
                    children: [
                      const Text(
                        'Reschedule',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _closePanel,
                        icon: const Icon(Icons.close),
                        color: const Color(0xFF666666),
                        iconSize: 24,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildFormContent(isMobile),
              ),
            ),
          ],
        ),
      );
    }

    // Desktop/Tablet Right-Side Panel Layout
    double panelWidth;
    if (isTablet) {
      panelWidth = 400;
    } else {
      panelWidth = 440;
    }

    return Material(
      color: Colors.black.withOpacity(0.5),
      child: GestureDetector(
        onTap: _closePanel,
        child: Stack(
          children: [
            // Main content area (dismisses on tap)
            Container(color: Colors.transparent),
            // Right side panel
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: () {}, // Prevent closing when tapping inside panel
                  child: Container(
                    width: panelWidth,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: panelWidth,
                      minWidth: 400,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(-2, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header with close button
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'Reschedule',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: _closePanel,
                                icon: const Icon(Icons.close),
                                color: const Color(0xFF666666),
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ),
                        // Scrollable content
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: _buildFormContent(false),
                          ),
                        ),
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

  Widget _buildFormContent(bool isMobile) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<NewAppointmentViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select Department
              _buildSectionTitle('Select Department'),
              const SizedBox(height: 8),
              _buildDepartmentDropdown(viewModel),
              const SizedBox(height: 20),

              // Select Doctor
              _buildSectionTitle('Select Doctor'),
              const SizedBox(height: 8),
              _buildDoctorDropdown(viewModel),
              const SizedBox(height: 20),

              // Reason or Add Notes
              _buildSectionTitle('Reason or Add Notes'),
              const SizedBox(height: 8),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Add Patient Note',
                    hintStyle: TextStyle(color: Color(0xFF999999)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  maxLines: 3,
                  controller: TextEditingController(
                    text: viewModel.patientNotes,
                  ),
                  onChanged: viewModel.setPatientNotes,
                ),
              ),
              const SizedBox(height: 24),

              // Available Slots
              _buildSectionTitle('Available Slots'),
              const SizedBox(height: 16),

              // Date Selector
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          viewModel.selectedDate,
                          style: const TextStyle(color: Color(0xFF333333)),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF666666),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Legend
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A90E2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Current Slot',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Available Slots',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDE7E7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Booked Slots',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios, size: 16),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Time Slots
              _buildTimeSlotsSection(viewModel),
              const SizedBox(height: 20),

              // Add More Appointment Button
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF333333),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Add More Appointment'),
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _closePanel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF333333),
                        side: const BorderSide(color: Color(0xFFE0E0E0)),
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 14 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: viewModel.isCreating
                          ? null
                          : () async {
                              if (widget.appointmentId != null) {
                                final success = await viewModel
                                    .rescheduleAppointment(
                                      widget.appointmentId!,
                                    );
                                if (success && mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Appointment rescheduled successfully',
                                      ),
                                      backgroundColor: Color(0xFF10B981),
                                    ),
                                  );
                                  _closePanel();
                                } else if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(viewModel.error),
                                      backgroundColor: const Color(0xFFDC2626),
                                    ),
                                  );
                                }
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 14 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: viewModel.isCreating
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF333333),
      ),
    );
  }

  Widget _buildDepartmentDropdown(NewAppointmentViewModel viewModel) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: viewModel.selectedDepartment.isNotEmpty
              ? viewModel.selectedDepartment
              : null,
          onChanged: (value) {
            if (value != null) {
              viewModel.setDepartment(value);
            }
          },
          padding: const EdgeInsets.symmetric(horizontal: 12),
          isExpanded: true,
          items: viewModel.departments.map((department) {
            return DropdownMenuItem(
              value: department.name ?? '',
              child: Text(department.name ?? ''),
            );
          }).toList(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF666666),
            size: 20,
          ),
          style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
        ),
      ),
    );
  }

  Widget _buildDoctorDropdown(NewAppointmentViewModel viewModel) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: viewModel.selectedDoctor.isNotEmpty
              ? viewModel.selectedDoctor
              : null,
          onChanged: (value) {
            if (value != null) {
              viewModel.setDoctor(value);
            }
          },
          padding: const EdgeInsets.symmetric(horizontal: 12),
          isExpanded: true,
          items: viewModel.doctors.map((doctor) {
            final doctorName = '${doctor.firstName} ${doctor.lastName}';
            return DropdownMenuItem(value: doctorName, child: Text(doctorName));
          }).toList(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF666666),
            size: 20,
          ),
          style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
        ),
      ),
    );
  }

  Widget _buildTimeSlotsSection(NewAppointmentViewModel viewModel) {
    final morningSlots = viewModel.morningSlots;
    final afternoonSlots = viewModel.afternoonSlots;

    if (morningSlots.isEmpty && afternoonSlots.isEmpty) {
      return const Center(
        child: Text(
          'No available slots for selected date',
          style: TextStyle(color: Color(0xFF666666)),
        ),
      );
    }

    return Column(
      children: [
        if (morningSlots.isNotEmpty) ...[
          _buildTimeSlotSection('Morning Slots', morningSlots, viewModel),
          const SizedBox(height: 16),
        ],
        if (afternoonSlots.isNotEmpty) ...[
          _buildTimeSlotSection('Afternoon Slots', afternoonSlots, viewModel),
        ],
      ],
    );
  }

  Widget _buildTimeSlotSection(
    String title,
    List<DoctorTimeSlotResponse> slots,
    NewAppointmentViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: slots.length,
            itemBuilder: (context, index) {
              final slot = slots[index];
              final formattedTime = _formatTimeForDisplay(slot.startTime);

              // Check if this slot is selected (by ID to be precise)
              final isSelected = viewModel.selectedSlotId == slot.id;

              final availableSpots = slot.availableSpots;
              final isBooked = availableSpots <= 0;

              Color backgroundColor;
              Color textColor;
              Color subTextColor;
              String statusText;

              if (isSelected) {
                // Selected slot (auto-selected or user-selected) - BLUE
                backgroundColor = const Color(0xFF4A90E2); // Blue for selected
                textColor = Colors.white;
                subTextColor = Colors.white70;
                statusText = 'Current Slot';
              } else if (isBooked) {
                // Booked by others (red)
                backgroundColor = const Color(0xFFFFEBEE);
                textColor = const Color(0xFFD32F2F);
                subTextColor = const Color(0xFFEF5350);
                statusText = 'Booked';
              } else {
                // Available slots (green)
                backgroundColor = const Color(0xFFE8F5E8);
                textColor = const Color(0xFF2E7D32);
                subTextColor = const Color(0xFF66BB6A);
                statusText = 'Available';
              }

              return Container(
                width: 90,
                margin: const EdgeInsets.only(right: 12),
                child: InkWell(
                  onTap: isBooked
                      ? null
                      : () {
                          viewModel.setTimeSlot(
                            formattedTime,
                            slotDetails: slot,
                          );
                        },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected
                          ? null
                          : Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formattedTime,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          statusText,
                          style: TextStyle(color: subTextColor, fontSize: 10),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _formatTimeForDisplay(String time) {
    try {
      // Handle ISO timestamp format (0000-01-01T14:45:00Z)
      if (time.contains('T')) {
        final dateTime = DateTime.parse(time);
        final hour = dateTime.hour;
        final minute = dateTime.minute.toString().padLeft(2, '0');

        final period = hour >= 12 ? 'PM' : 'AM';
        final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

        return '$displayHour:$minute $period';
      }

      // Handle HH:MM:SS format
      final parts = time.split(':');
      if (parts.length >= 2) {
        final hour = int.parse(parts[0]);
        final minute = parts[1];

        final period = hour >= 12 ? 'PM' : 'AM';
        final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

        return '$displayHour:$minute $period';
      }

      return time;
    } catch (e) {
      print('⚠️ Error formatting time: $time - $e');
      return time;
    }
  }
}
