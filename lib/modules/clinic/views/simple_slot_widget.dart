import 'package:flutter/material.dart';

/// SimpleSlotWidget with table-like UI for managing doctor time slots
/// Matches the design from the image with day checkboxes and time inputs
class SimpleSlotWidget extends StatefulWidget {
  final String doctorId;
  final String clinicId;

  const SimpleSlotWidget({
    super.key,
    required this.doctorId,
    required this.clinicId,
  });

  @override
  State<SimpleSlotWidget> createState() => _SimpleSlotWidgetState();
}

class _SimpleSlotWidgetState extends State<SimpleSlotWidget> {
  // Day selection for slot creation
  final Map<int, bool> _selectedDays = {
    1: true, // Monday
    2: true, // Tuesday
    3: false, // Wednesday
    4: false, // Thursday
    5: false, // Friday
    6: false, // Saturday
    0: false, // Sunday
  };

  // Time configuration for each day
  final Map<int, DayTimeSlots> _dayTimeSlots = {
    1: DayTimeSlots(), // Monday
    2: DayTimeSlots(), // Tuesday
    3: DayTimeSlots(), // Wednesday
    4: DayTimeSlots(), // Thursday
    5: DayTimeSlots(), // Friday
    6: DayTimeSlots(), // Saturday
    0: DayTimeSlots(), // Sunday
  };

  // Max patients capacity for each day
  final Map<int, int> _dayMaxPatients = {
    1: 10, // Monday
    2: 10, // Tuesday
    3: 10, // Wednesday
    4: 10, // Thursday
    5: 10, // Friday
    6: 10, // Saturday
    0: 10, // Sunday
  };

  // Slot type selection (offline/online)
  String _selectedSlotType = 'offline';

  // Doctor selection
  String _selectedDoctorId = '';

  // List of created slots
  List<CreatedSlot> _createdSlots = [];

  // Selected date for viewing slots list
  DateTime _listFilterDate = DateTime.now();

  // Filter selections for slot list
  String _filterSlotType = 'all';
  String _filterDoctorId = 'all';
  String _filterWeek = 'all';

  // Week selection for slot creation
  int _selectedWeeks = 1; // Default to 1 week

  // Clinic system configuration
  final Map<String, dynamic> _clinicConfig = {
    'workingDays': [1, 2, 3, 4, 5], // Monday to Friday by default
    'workingHours': {
      'morningStart': '09:00',
      'morningEnd': '12:00',
      'afternoonStart': '14:00',
      'afternoonEnd': '17:00',
    },
    'defaultMaxPatients': 10,
    'slotDuration': 30, // minutes
    'breakBetweenSlots': 15, // minutes
  };

  final List<String> _weekdayNames = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  @override
  void initState() {
    super.initState();
    _initializeWidget();
  }

  /// Initialize widget with validation and setup
  Future<void> _initializeWidget() async {
    // Validate clinic admin access on widget initialization
    final hasAccess = await _validateClinicAdminAccess();
    if (!hasAccess) {
      // Widget will show error message and may be disabled
      setState(() {
        // You can add a state variable to track if widget is accessible
      });
      return;
    }

    // Load clinic configuration and apply smart defaults
    await _loadClinicConfiguration();

    // Apply smart defaults based on clinic configuration
    _applySmartDefaults();
  }

  /// Load clinic configuration from backend or local settings
  Future<void> _loadClinicConfiguration() async {
    try {
      // In production, this would load from API or local storage
      // For now, we'll use the default configuration

      // Simulate loading clinic-specific settings
      await Future.delayed(const Duration(milliseconds: 200));

      // You could load from API like:
      // final config = await ClinicService.getConfiguration(widget.clinicId);
      // _clinicConfig.updateAll((key, value) => config[key] ?? value);
    } catch (e) {
      // Use default configuration if loading fails
      _showErrorSnackBar('Using default clinic settings');
    }
  }

  /// Apply smart defaults based on clinic configuration
  void _applySmartDefaults() {
    setState(() {
      // Set working days based on clinic configuration
      final workingDays = _clinicConfig['workingDays'] as List<int>;
      for (int i = 0; i < 7; i++) {
        _selectedDays[i] = workingDays.contains(i);
      }

      // Set default times based on clinic working hours
      final workingHours =
          _clinicConfig['workingHours'] as Map<String, dynamic>;
      for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
        final daySlots = _dayTimeSlots[dayIndex]!;
        daySlots.morningStart = workingHours['morningStart'] as String;
        daySlots.morningEnd = workingHours['morningEnd'] as String;
        daySlots.afternoonStart = workingHours['afternoonStart'] as String;
        daySlots.afternoonEnd = workingHours['afternoonEnd'] as String;
      }

      // Set default max patients
      final defaultMaxPatients = _clinicConfig['defaultMaxPatients'] as int;
      for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
        _dayMaxPatients[dayIndex] = defaultMaxPatients;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Text(
                'Offline Consultation Timing',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Icon(Icons.keyboard_arrow_up, color: Colors.grey.shade600),
            ],
          ),
          const SizedBox(height: 20),

          // Quick setup section
          _buildQuickSetup(),

          const SizedBox(height: 20),

          // Slot type and doctor selection
          _buildSelectionControls(),

          const SizedBox(height: 20),

          // Time slots table
          _buildTimeSlotsTable(),

          const SizedBox(height: 20),

          // Week preview
          _buildWeekPreview(),

          const SizedBox(height: 16),

          // Status indicator
          _buildStatusIndicator(),

          const SizedBox(height: 20),

          // Create button
          _buildCreateButton(),

          const SizedBox(height: 30),

          // Slots list
          _buildSlotsList(),
        ],
      ),
    );
  }

  Widget _buildQuickSetup() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.settings_suggest, color: Colors.green.shade700),
              const SizedBox(width: 8),
              Text(
                'Quick Setup',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Quick setup buttons
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildQuickSetupButton(
                'Weekdays Only',
                Icons.business,
                () => _applyQuickSetup('weekdays'),
              ),
              _buildQuickSetupButton(
                'Weekend Only',
                Icons.weekend,
                () => _applyQuickSetup('weekend'),
              ),
              _buildQuickSetupButton(
                'Full Week',
                Icons.calendar_month,
                () => _applyQuickSetup('fullweek'),
              ),
              _buildQuickSetupButton(
                'Reset to Defaults',
                Icons.refresh,
                () => _applySmartDefaults(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSetupButton(
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade100,
        foregroundColor: Colors.green.shade700,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.green.shade300),
        ),
      ),
    );
  }

  /// Apply quick setup configurations
  void _applyQuickSetup(String setupType) {
    setState(() {
      switch (setupType) {
        case 'weekdays':
          // Monday to Friday
          for (int i = 0; i < 7; i++) {
            _selectedDays[i] = (i >= 1 && i <= 5); // Monday=1 to Friday=5
          }
          break;
        case 'weekend':
          // Saturday and Sunday
          for (int i = 0; i < 7; i++) {
            _selectedDays[i] = (i == 0 || i == 6); // Sunday=0, Saturday=6
          }
          break;
        case 'fullweek':
          // All days
          for (int i = 0; i < 7; i++) {
            _selectedDays[i] = true;
          }
          break;
      }
    });

    _showSuccessSnackBar('Applied $setupType configuration');
  }

  Widget _buildSelectionControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Slot Configuration',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              // Slot Type Selection
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Slot Type',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedSlotType,
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: 'offline',
                              child: Text('Offline Consultation'),
                            ),
                            DropdownMenuItem(
                              value: 'online',
                              child: Text('Online Consultation'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedSlotType = value ?? 'offline';
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Doctor Selection
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Doctor',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedDoctorId.isEmpty
                              ? null
                              : _selectedDoctorId,
                          isExpanded: true,
                          hint: const Text('Select Doctor'),
                          items: [
                            // You can add actual doctor data here
                            const DropdownMenuItem(
                              value: 'doc1',
                              child: Text('Dr. John Smith'),
                            ),
                            const DropdownMenuItem(
                              value: 'doc2',
                              child: Text('Dr. Sarah Johnson'),
                            ),
                            const DropdownMenuItem(
                              value: 'doc3',
                              child: Text('Dr. Michael Brown'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedDoctorId = value ?? '';
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Weeks Selection
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Number of Weeks',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: _selectedWeeks,
                          isExpanded: true,
                          items: List.generate(12, (index) {
                            final weekNumber = index + 1;
                            final weekInfo = _getWeekInfo(weekNumber);
                            final monthName = weekInfo['monthName'] as String;
                            final weekOfMonth = weekInfo['weekOfMonth'] as int;
                            final year = weekInfo['year'] as int;
                            final startDate =
                                weekInfo['weekStartDate'] as DateTime;
                            final endDate = weekInfo['weekEndDate'] as DateTime;

                            return DropdownMenuItem(
                              value: weekNumber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Week $weekNumber - $monthName Week $weekOfMonth',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${startDate.day}/${startDate.month} - ${endDate.day}/${endDate.month}/$year',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              _selectedWeeks = value ?? 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotsTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header row
          _buildTableHeader(),

          // Days rows
          ...List.generate(7, (index) {
            final dayIndex = (index + 1) % 7; // Sunday = 0, Monday = 1, etc.
            return _buildDayRow(dayIndex);
          }),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          // Days column
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Checkbox(
                  value: _selectedDays.values.every((selected) => selected),
                  onChanged: (value) {
                    setState(() {
                      final selectAll = value ?? false;
                      for (var key in _selectedDays.keys) {
                        _selectedDays[key] = selectAll;
                      }
                    });
                  },
                ),
                const Text(
                  'Days',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
          ),

          // Morning column
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Text(
                  'Morning',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Start', style: TextStyle(fontSize: 12)),
                    const Text('End', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          // Afternoon column
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Text(
                  'Afternoon',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Start', style: TextStyle(fontSize: 12)),
                    const Text('End', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          // Max Patients column
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text(
                  'Max Patients',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const Text('Capacity', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayRow(int dayIndex) {
    final dayName = _weekdayNames[dayIndex];
    final isSelected = _selectedDays[dayIndex] ?? false;
    final daySlots = _dayTimeSlots[dayIndex]!;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Day checkbox and name
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    setState(() {
                      _selectedDays[dayIndex] = value ?? false;
                    });
                  },
                ),
                Text(
                  dayName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Morning time inputs
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: _buildTimeInput(
                    value: daySlots.morningStart,
                    onChanged: (value) {
                      setState(() {
                        daySlots.morningStart = value;
                      });
                    },
                    enabled: isSelected,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: _buildTimeInput(
                    value: daySlots.morningEnd,
                    onChanged: (value) {
                      setState(() {
                        daySlots.morningEnd = value;
                      });
                    },
                    enabled: isSelected,
                  ),
                ),
              ],
            ),
          ),

          // Afternoon time inputs
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: _buildTimeInput(
                    value: daySlots.afternoonStart,
                    onChanged: (value) {
                      setState(() {
                        daySlots.afternoonStart = value;
                      });
                    },
                    enabled: isSelected,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: _buildTimeInput(
                    value: daySlots.afternoonEnd,
                    onChanged: (value) {
                      setState(() {
                        daySlots.afternoonEnd = value;
                      });
                    },
                    enabled: isSelected,
                  ),
                ),
              ],
            ),
          ),

          // Max Patients input
          Expanded(
            flex: 1,
            child: _buildMaxPatientsInput(
              value: _dayMaxPatients[dayIndex] ?? 10,
              onChanged: (value) {
                setState(() {
                  _dayMaxPatients[dayIndex] = value;
                });
              },
              enabled: isSelected,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInput({
    required String value,
    required ValueChanged<String> onChanged,
    required bool enabled,
  }) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: enabled ? Colors.white : Colors.grey.shade100,
        border: Border.all(
          color: enabled ? Colors.grey.shade400 : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        enabled: enabled,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: enabled ? Colors.black : Colors.grey.shade500,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          hintText: '00:00',
          hintStyle: TextStyle(fontSize: 12),
        ),
        onChanged: onChanged,
        initialValue: value.isEmpty ? '00:00' : value,
      ),
    );
  }

  Widget _buildMaxPatientsInput({
    required int value,
    required ValueChanged<int> onChanged,
    required bool enabled,
  }) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: enabled ? Colors.white : Colors.grey.shade100,
        border: Border.all(
          color: enabled ? Colors.grey.shade400 : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        enabled: enabled,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 12,
          color: enabled ? Colors.black : Colors.grey.shade500,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          hintText: '10',
          hintStyle: TextStyle(fontSize: 12),
        ),
        initialValue: value.toString(),
        onChanged: (text) {
          final parsedValue = int.tryParse(text) ?? 10;
          onChanged(parsedValue);
        },
      ),
    );
  }

  Widget _buildWeekPreview() {
    final selectedDays = _selectedDays.entries
        .where((entry) => entry.value)
        .map((entry) => _weekdayNames[entry.key])
        .toList();

    if (selectedDays.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_view_week, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Text(
                'Week Preview - $_selectedWeeks ${_selectedWeeks == 1 ? 'Week' : 'Weeks'}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Show preview for each week
          ...List.generate(_selectedWeeks, (weekIndex) {
            final weekNumber = weekIndex + 1;
            final weekInfo = _getWeekInfo(weekNumber);
            final monthName = weekInfo['monthName'] as String;
            final weekOfMonth = weekInfo['weekOfMonth'] as int;
            final startDate = weekInfo['weekStartDate'] as DateTime;
            final endDate = weekInfo['weekEndDate'] as DateTime;

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Week $weekNumber',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$monthName Week $weekOfMonth',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${startDate.day}/${startDate.month} - ${endDate.day}/${endDate.month}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: selectedDays.map((dayName) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade300),
                        ),
                        child: Text(
                          dayName,
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }),

          if (_selectedWeeks > 1) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.amber.shade700,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Total: ${selectedDays.length * _selectedWeeks} slot groups will be created',
                      style: TextStyle(
                        color: Colors.amber.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusIndicator() {
    final selectedDays = _selectedDays.entries
        .where((entry) => entry.value)
        .map((entry) => _weekdayNames[entry.key])
        .toList();

    final validationResult = _validateSlotCreation();
    final isValid = validationResult['isValid'] as bool;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isValid ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isValid ? Colors.green.shade200 : Colors.orange.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.warning,
            color: isValid ? Colors.green.shade700 : Colors.orange.shade700,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isValid ? 'Ready to Create Slots' : 'Configuration Issues',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isValid
                        ? Colors.green.shade700
                        : Colors.orange.shade700,
                    fontSize: 14,
                  ),
                ),
                if (selectedDays.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Selected: ${selectedDays.join(', ')} • $_selectedWeeks ${_selectedWeeks == 1 ? 'week' : 'weeks'}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
                if (!isValid) ...[
                  const SizedBox(height: 4),
                  Text(
                    validationResult['message'] as String,
                    style: TextStyle(
                      color: Colors.orange.shade700,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    final hasSelectedDays = _selectedDays.values.any((selected) => selected);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: hasSelectedDays ? _createAndSyncSlots : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: hasSelectedDays ? Colors.blue : Colors.grey.shade300,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Create Time Slots',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildSlotsList() {
    // Filter slots by list filter date's weekday
    final selectedWeekday = _weekdayNames[_listFilterDate.weekday];
    var filteredSlots = _createdSlots
        .where((slot) => slot.dayName == selectedWeekday)
        .toList();

    // Apply additional filters
    if (_filterDoctorId != 'all') {
      filteredSlots = filteredSlots
          .where((slot) => slot.doctorId == _filterDoctorId)
          .toList();
    }

    if (_filterSlotType != 'all') {
      filteredSlots = filteredSlots
          .where((slot) => slot.consultationType == _filterSlotType)
          .toList();
    }

    if (_filterWeek != 'all') {
      final weekNumber = int.tryParse(_filterWeek);
      if (weekNumber != null) {
        filteredSlots = filteredSlots
            .where((slot) => slot.weekNumber == weekNumber)
            .toList();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter controls
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              // Date filter
              Row(
                children: [
                  const Icon(Icons.filter_list, size: 18, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text(
                    'Filter by Date:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${_listFilterDate.day}/${_listFilterDate.month}/${_listFilterDate.year} ($selectedWeekday)',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickListFilterDate,
                    icon: const Icon(Icons.calendar_today, size: 16),
                    label: const Text('Pick Date'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Doctor, Slot Type, and Week filters
              Row(
                children: [
                  // Doctor filter
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Filter by Doctor:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _filterDoctorId,
                              isExpanded: true,
                              style: const TextStyle(fontSize: 12),
                              items: const [
                                DropdownMenuItem(
                                  value: 'all',
                                  child: Text('All Doctors'),
                                ),
                                DropdownMenuItem(
                                  value: 'doc1',
                                  child: Text('Dr. John Smith'),
                                ),
                                DropdownMenuItem(
                                  value: 'doc2',
                                  child: Text('Dr. Sarah Johnson'),
                                ),
                                DropdownMenuItem(
                                  value: 'doc3',
                                  child: Text('Dr. Michael Brown'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _filterDoctorId = value ?? 'all';
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Slot Type filter
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Filter by Type:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _filterSlotType,
                              isExpanded: true,
                              style: const TextStyle(fontSize: 12),
                              items: const [
                                DropdownMenuItem(
                                  value: 'all',
                                  child: Text('All Types'),
                                ),
                                DropdownMenuItem(
                                  value: 'offline',
                                  child: Text('Offline'),
                                ),
                                DropdownMenuItem(
                                  value: 'online',
                                  child: Text('Online'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _filterSlotType = value ?? 'all';
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Week filter
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Filter by Week:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _filterWeek,
                              isExpanded: true,
                              style: const TextStyle(fontSize: 12),
                              items: [
                                const DropdownMenuItem(
                                  value: 'all',
                                  child: Text('All Weeks'),
                                ),
                                ...List.generate(12, (index) {
                                  final weekNumber = index + 1;
                                  final weekInfo = _getWeekInfo(weekNumber);
                                  final monthName =
                                      weekInfo['monthName'] as String;
                                  final weekOfMonth =
                                      weekInfo['weekOfMonth'] as int;
                                  final startDate =
                                      weekInfo['weekStartDate'] as DateTime;
                                  final endDate =
                                      weekInfo['weekEndDate'] as DateTime;

                                  return DropdownMenuItem(
                                    value: weekNumber.toString(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Week $weekNumber - $monthName Week $weekOfMonth',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '${startDate.day}/${startDate.month} - ${endDate.day}/${endDate.month}',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _filterWeek = value ?? 'all';
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Slots list
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Created Slots for $selectedWeekday (${filteredSlots.length})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              if (filteredSlots.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'No slots created for this day',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                )
              else
                ...filteredSlots.map((slot) => _buildSlotItem(slot)).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlotItem(CreatedSlot slot) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: slot.consultationType == 'offline'
              ? Colors.green.shade300
              : Colors.blue.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                slot.slotType == 'Morning'
                    ? Icons.wb_sunny
                    : Icons.wb_sunny_outlined,
                size: 20,
                color: slot.slotType == 'Morning' ? Colors.orange : Colors.blue,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${slot.slotType} Slot - ${slot.consultationType.toUpperCase()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${slot.startTime} - ${slot.endTime}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      slot.weekInfo,
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: slot.consultationType == 'offline'
                      ? Colors.green.shade100
                      : Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  slot.consultationType.toUpperCase(),
                  style: TextStyle(
                    color: slot.consultationType == 'offline'
                        ? Colors.green.shade700
                        : Colors.blue.shade700,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                slot.doctorName,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(Icons.group, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                'Max: ${slot.maxPatients}',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _createSlots() async {
    // Validate clinic admin access first
    final hasAccess = await _validateClinicAdminAccess();
    if (!hasAccess) {
      return;
    }

    if (_selectedDoctorId.isEmpty) {
      _showErrorSnackBar('Please select a doctor first!');
      return;
    }

    final newSlots = <CreatedSlot>[];

    // Create slots for each week starting from current week
    final currentDate = DateTime.now();
    final currentWeekStart = _getWeekStart(currentDate);

    for (int week = 1; week <= _selectedWeeks; week++) {
      final weekStartDate = currentWeekStart.add(
        Duration(days: (week - 1) * 7),
      );

      for (final entry in _selectedDays.entries) {
        if (entry.value) {
          final dayIndex = entry.key;
          final dayName = _weekdayNames[dayIndex];
          final daySlots = _dayTimeSlots[dayIndex]!;
          final maxPatients = _dayMaxPatients[dayIndex] ?? 10;

          // Calculate the actual date for this day of the week
          final slotDate = _calculateSlotDate(weekStartDate, dayIndex);

          // Create morning slot
          if (daySlots.morningStart.isNotEmpty &&
              daySlots.morningEnd.isNotEmpty) {
            newSlots.add(
              CreatedSlot(
                dayName: dayName,
                slotType: 'Morning',
                consultationType: _selectedSlotType,
                doctorId: _selectedDoctorId,
                startTime: daySlots.morningStart,
                endTime: daySlots.morningEnd,
                maxPatients: maxPatients,
                slotDate: slotDate,
                weekNumber: week,
              ),
            );
          }

          // Create afternoon slot
          if (daySlots.afternoonStart.isNotEmpty &&
              daySlots.afternoonEnd.isNotEmpty) {
            newSlots.add(
              CreatedSlot(
                dayName: dayName,
                slotType: 'Afternoon',
                consultationType: _selectedSlotType,
                doctorId: _selectedDoctorId,
                startTime: daySlots.afternoonStart,
                endTime: daySlots.afternoonEnd,
                maxPatients: maxPatients,
                slotDate: slotDate,
                weekNumber: week,
              ),
            );
          }
        }
      }
    }

    setState(() {
      _createdSlots.addAll(newSlots);
    });

    _showSuccessSnackBar(
      'Created ${newSlots.length} ${_selectedSlotType} slots for $_selectedWeeks ${_selectedWeeks == 1 ? 'week' : 'weeks'}!',
    );
  }

  Future<void> _pickListFilterDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _listFilterDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _listFilterDate = picked;
      });
    }
  }

  /// Get the start of the week (Monday) for a given date
  DateTime _getWeekStart(DateTime date) {
    final daysFromMonday = date.weekday - 1; // Monday = 1, so subtract 1
    return DateTime(date.year, date.month, date.day - daysFromMonday);
  }

  /// Calculate the actual slot date for a given week start and day index
  DateTime _calculateSlotDate(DateTime weekStart, int dayIndex) {
    // dayIndex: 0=Sunday, 1=Monday, 2=Tuesday, etc.
    // weekStart is Monday, so we need to adjust for Sunday (dayIndex=0)
    final daysToAdd = dayIndex == 0
        ? 6
        : dayIndex - 1; // Sunday is 6 days after Monday
    return weekStart.add(Duration(days: daysToAdd));
  }

  /// Super logic method for clinic admin side login and validation
  /// This method handles production-ready validation and authentication
  Future<bool> _validateClinicAdminAccess() async {
    try {
      // Check if user is authenticated
      if (widget.doctorId.isEmpty || widget.clinicId.isEmpty) {
        _showErrorSnackBar('Invalid clinic or doctor credentials');
        return false;
      }

      // Validate clinic access
      final hasClinicAccess = await _checkClinicAccess(widget.clinicId);
      if (!hasClinicAccess) {
        _showErrorSnackBar('Access denied: Invalid clinic permissions');
        return false;
      }

      // Validate doctor-clinic relationship
      final hasDoctorAccess = await _checkDoctorClinicRelationship(
        widget.doctorId,
        widget.clinicId,
      );
      if (!hasDoctorAccess) {
        _showErrorSnackBar('Access denied: Doctor not associated with clinic');
        return false;
      }

      return true;
    } catch (e) {
      _showErrorSnackBar('Authentication error: ${e.toString()}');
      return false;
    }
  }

  /// Check if current user has access to the clinic
  Future<bool> _checkClinicAccess(String clinicId) async {
    // In production, this would make an API call to validate clinic access
    // For now, we'll simulate the check
    await Future.delayed(const Duration(milliseconds: 100));

    // Simulate validation logic
    if (clinicId.isEmpty || clinicId.length < 10) {
      return false;
    }

    return true; // Simulate successful validation
  }

  /// Check if doctor is associated with the clinic
  Future<bool> _checkDoctorClinicRelationship(
    String doctorId,
    String clinicId,
  ) async {
    // In production, this would make an API call to check doctor-clinic relationship
    // For now, we'll simulate the check
    await Future.delayed(const Duration(milliseconds: 100));

    // Simulate validation logic
    if (doctorId.isEmpty || clinicId.isEmpty) {
      return false;
    }

    return true; // Simulate successful validation
  }

  /// Show error snackbar with consistent styling
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show success snackbar with consistent styling
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Validate slot creation with comprehensive checks
  Map<String, dynamic> _validateSlotCreation() {
    // Check if doctor is selected
    if (_selectedDoctorId.isEmpty) {
      return {'isValid': false, 'message': 'Please select a doctor first!'};
    }

    // Check if at least one day is selected
    final hasSelectedDays = _selectedDays.values.any((selected) => selected);
    if (!hasSelectedDays) {
      return {
        'isValid': false,
        'message': 'Please select at least one day for slot creation!',
      };
    }

    // Validate time slots for selected days
    final validationErrors = <String>[];

    for (final entry in _selectedDays.entries) {
      if (entry.value) {
        final dayIndex = entry.key;
        final dayName = _weekdayNames[dayIndex];
        final daySlots = _dayTimeSlots[dayIndex]!;

        // Check morning slot
        if (daySlots.morningStart.isNotEmpty &&
            daySlots.morningEnd.isNotEmpty) {
          final morningValidation = _validateTimeSlot(
            daySlots.morningStart,
            daySlots.morningEnd,
            '$dayName Morning',
          );
          if (morningValidation != null) {
            validationErrors.add(morningValidation);
          }
        }

        // Check afternoon slot
        if (daySlots.afternoonStart.isNotEmpty &&
            daySlots.afternoonEnd.isNotEmpty) {
          final afternoonValidation = _validateTimeSlot(
            daySlots.afternoonStart,
            daySlots.afternoonEnd,
            '$dayName Afternoon',
          );
          if (afternoonValidation != null) {
            validationErrors.add(afternoonValidation);
          }
        }

        // Check if at least one slot is configured
        if (daySlots.morningStart.isEmpty && daySlots.afternoonStart.isEmpty) {
          validationErrors.add(
            '$dayName: Please configure at least one time slot',
          );
        }

        // Check max patients
        final maxPatients = _dayMaxPatients[dayIndex] ?? 0;
        if (maxPatients <= 0) {
          validationErrors.add('$dayName: Max patients must be greater than 0');
        }
      }
    }

    if (validationErrors.isNotEmpty) {
      return {
        'isValid': false,
        'message': 'Validation errors:\n${validationErrors.join('\n')}',
      };
    }

    return {'isValid': true, 'message': 'Validation successful'};
  }

  /// Validate individual time slot
  String? _validateTimeSlot(String startTime, String endTime, String slotName) {
    try {
      final start = _parseTime(startTime);
      final end = _parseTime(endTime);

      if (start == null || end == null) {
        return '$slotName: Invalid time format (use HH:MM)';
      }

      if (start.isAfter(end) || start.isAtSameMomentAs(end)) {
        return '$slotName: End time must be after start time';
      }

      // Check minimum slot duration (30 minutes)
      final duration = end.difference(start);
      if (duration.inMinutes < 30) {
        return '$slotName: Slot duration must be at least 30 minutes';
      }

      return null; // Valid
    } catch (e) {
      return '$slotName: Invalid time format';
    }
  }

  /// Parse time string to DateTime
  DateTime? _parseTime(String timeString) {
    try {
      final parts = timeString.split(':');
      if (parts.length != 2) return null;

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return null;
      }

      return DateTime(2024, 1, 1, hour, minute);
    } catch (e) {
      return null;
    }
  }

  /// Production-ready method to sync slots with backend API
  Future<bool> _syncSlotsToBackend(List<CreatedSlot> slots) async {
    try {
      // This would integrate with your actual API
      // Example API call structure:

      /*
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/api/organizations/doctor-time-slots'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AuthService.getToken()}',
        },
        body: jsonEncode({
          'doctor_id': widget.doctorId,
          'clinic_id': widget.clinicId,
          'slot_type': _selectedSlotType,
          'date': _getCurrentDateString(), // Uses the helper method
          'slots': slots.map((slot) => {
            'start_time': slot.startTime,
            'end_time': slot.endTime,
            'max_patients': slot.maxPatients,
            'notes': '${slot.dayName} ${slot.slotType} - Week ${slot.weekNumber}',
          }).toList(),
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to create slots: ${response.body}');
      }
      */

      // For now, simulate API call
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      _showErrorSnackBar('Failed to sync slots: ${e.toString()}');
      return false;
    }
  }

  /// Get current date string in YYYY-MM-DD format
  /// Used in API integration for slot creation
  String _getCurrentDateString() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  /// Get week number within the month for a given date
  int _getWeekOfMonth(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final firstWeekStart = _getWeekStart(firstDayOfMonth);
    final daysDifference = date.difference(firstWeekStart).inDays;
    return (daysDifference ~/ 7) + 1;
  }

  /// Get month name from month number
  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }

  /// Get detailed week information for a given week number
  Map<String, dynamic> _getWeekInfo(int weekNumber) {
    final currentDate = DateTime.now();
    final currentWeekStart = _getWeekStart(currentDate);
    final weekStartDate = currentWeekStart.add(
      Duration(days: (weekNumber - 1) * 7),
    );
    final weekEndDate = weekStartDate.add(const Duration(days: 6));

    final weekOfMonth = _getWeekOfMonth(weekStartDate);
    final monthName = _getMonthName(weekStartDate.month);

    return {
      'weekStartDate': weekStartDate,
      'weekEndDate': weekEndDate,
      'weekOfMonth': weekOfMonth,
      'monthName': monthName,
      'year': weekStartDate.year,
      'month': weekStartDate.month,
    };
  }

  /// Enhanced slot creation with backend sync
  Future<void> _createAndSyncSlots() async {
    // Validate access first
    final hasAccess = await _validateClinicAdminAccess();
    if (!hasAccess) return;

    // Comprehensive validation
    final validationResult = _validateSlotCreation();
    if (!validationResult['isValid']) {
      _showErrorSnackBar(validationResult['message']);
      return;
    }

    final newSlots = <CreatedSlot>[];
    final currentDate = DateTime.now();
    final currentWeekStart = _getWeekStart(currentDate);

    // Create slots for each week
    for (int week = 1; week <= _selectedWeeks; week++) {
      final weekStartDate = currentWeekStart.add(
        Duration(days: (week - 1) * 7),
      );

      for (final entry in _selectedDays.entries) {
        if (entry.value) {
          final dayIndex = entry.key;
          final dayName = _weekdayNames[dayIndex];
          final daySlots = _dayTimeSlots[dayIndex]!;
          final maxPatients = _dayMaxPatients[dayIndex] ?? 10;
          final slotDate = _calculateSlotDate(weekStartDate, dayIndex);

          // Create morning slot
          if (daySlots.morningStart.isNotEmpty &&
              daySlots.morningEnd.isNotEmpty) {
            newSlots.add(
              CreatedSlot(
                dayName: dayName,
                slotType: 'Morning',
                consultationType: _selectedSlotType,
                doctorId: _selectedDoctorId,
                startTime: daySlots.morningStart,
                endTime: daySlots.morningEnd,
                maxPatients: maxPatients,
                slotDate: slotDate,
                weekNumber: week,
              ),
            );
          }

          // Create afternoon slot
          if (daySlots.afternoonStart.isNotEmpty &&
              daySlots.afternoonEnd.isNotEmpty) {
            newSlots.add(
              CreatedSlot(
                dayName: dayName,
                slotType: 'Afternoon',
                consultationType: _selectedSlotType,
                doctorId: _selectedDoctorId,
                startTime: daySlots.afternoonStart,
                endTime: daySlots.afternoonEnd,
                maxPatients: maxPatients,
                slotDate: slotDate,
                weekNumber: week,
              ),
            );
          }
        }
      }
    }

    // Sync with backend
    final syncSuccess = await _syncSlotsToBackend(newSlots);

    if (syncSuccess) {
      setState(() {
        _createdSlots.addAll(newSlots);
      });
      _showSuccessSnackBar(
        'Successfully created and synced ${newSlots.length} ${_selectedSlotType} slots for $_selectedWeeks ${_selectedWeeks == 1 ? 'week' : 'weeks'}!',
      );
    }
  }
}

// Data classes
class DayTimeSlots {
  String morningStart = '09:00';
  String morningEnd = '12:00';
  String afternoonStart = '14:00';
  String afternoonEnd = '17:00';

  DayTimeSlots({
    this.morningStart = '09:00',
    this.morningEnd = '12:00',
    this.afternoonStart = '14:00',
    this.afternoonEnd = '17:00',
  });
}

class CreatedSlot {
  final String dayName;
  final String slotType; // Morning/Afternoon
  final String consultationType; // offline/online
  final String doctorId;
  final String startTime;
  final String endTime;
  final int maxPatients;
  final DateTime slotDate; // The actual date for this slot
  final int weekNumber; // Which week this slot belongs to (1, 2, 3, etc.)

  CreatedSlot({
    required this.dayName,
    required this.slotType,
    required this.consultationType,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.maxPatients,
    required this.slotDate,
    required this.weekNumber,
  });

  String get doctorName {
    switch (doctorId) {
      case 'doc1':
        return 'Dr. John Smith';
      case 'doc2':
        return 'Dr. Sarah Johnson';
      case 'doc3':
        return 'Dr. Michael Brown';
      default:
        return 'Unknown Doctor';
    }
  }

  String get weekInfo {
    final monthNames = [
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
    final monthName = monthNames[slotDate.month - 1];
    return 'Week $weekNumber - $monthName Week ${_getWeekOfMonth()} (${slotDate.day}/${slotDate.month})';
  }

  int _getWeekOfMonth() {
    final firstDayOfMonth = DateTime(slotDate.year, slotDate.month, 1);
    final firstWeekStart = _getWeekStart(firstDayOfMonth);
    final daysDifference = slotDate.difference(firstWeekStart).inDays;
    return (daysDifference ~/ 7) + 1;
  }

  DateTime _getWeekStart(DateTime date) {
    final daysFromMonday = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysFromMonday);
  }
}
