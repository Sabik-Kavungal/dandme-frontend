import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import '../constants/dashboard_constants.dart';

/// Dashboard table controls including tabs, search, and filters
/// Optimized with debouncing and RepaintBoundary
class DashboardTableControls extends StatelessWidget {
  final AppointmentDashboardViewModel viewModel;
  final bool isTablet;
  final VoidCallback? onNewAppointment;
  final DateTime? selectedDate;
  final VoidCallback onDatePickerTap;
  final VoidCallback? onClearDate;

  const DashboardTableControls({
    super.key,
    required this.viewModel,
    this.isTablet = false,
    this.onNewAppointment,
    this.selectedDate,
    required this.onDatePickerTap,
    this.onClearDate,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmallMobile = MediaQuery.of(context).size.width < 380;

    // Isolate repaint scope for controls and provide Material context
    return Material(
      color: Colors.transparent,
      child: RepaintBoundary(
        child: Column(
          children: [
            // Tabs and New Appointment button
            _buildTabsRow(context, isSmallMobile),
            Divider(
              color: DashboardConstants.borderColor,
              thickness: 1,
              height: 1,
            ),
            SizedBox(height: isTablet ? 6 : 8),
            // Search and filter controls
            _buildSearchAndFilterRow(isSmallMobile),
          ],
        ),
      ),
    );
  }

  /// Build tabs row with New Appointment button
  Widget _buildTabsRow(BuildContext context, bool isSmallMobile) {
    final newAppointmentCallback =
        onNewAppointment ??
        () => GoRouter.of(context).go('/clinic/appointments/new');

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Date Picker Button
        Flexible(
          child: SizedBox(
            height: 32, 
            child: _buildDatePicker(context, isSmallMobile)
          ),
        ),
        SizedBox(width: isSmallMobile ? 4 : 8),
        // New Appointment Button
        SizedBox(
          height: 32,
          child: ElevatedButton.icon(
            onPressed: newAppointmentCallback,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isSmallMobile ? 6 : (isTablet ? 8 : 10),
                vertical: 0,
              ),
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isTablet ? 4 : 5),
              ),
            ),
            icon: Icon(Icons.add, size: isSmallMobile ? 10 : (isTablet ? 11 : 12)),
            label: Text(
              isSmallMobile ? 'New' : 'New Appointment',
              style: TextStyle(fontSize: isSmallMobile ? 9 : (isTablet ? 10 : 11)),
            ),
          ),
        ),
      ],
    );
  }

  /// Build search and filter row
  Widget _buildSearchAndFilterRow(bool isSmallMobile) {
    return Row(
      children: [
        // ✅ Doctor Filter Dropdown (left)
        _buildDoctorFilterDropdown(isSmallMobile),
        SizedBox(width: isSmallMobile ? 4 : 6),
        // ✅ Patient Filter Dropdown
        _buildPatientFilterDropdown(isSmallMobile),
        SizedBox(width: isSmallMobile ? 4 : 6),
        // ✅ Booking Mode Filter Dropdown
        _buildBookingModeFilterDropdown(isSmallMobile),
        SizedBox(width: isSmallMobile ? 4 : 6),
        // ✅ Search Bar (right)
        Expanded(
          child: _DebouncedSearchField(
            onChanged: (value) => viewModel.setSearchQuery(value),
          ),
        ),
      ],
    );
  }

  /// ✅ Build doctor filter dropdown
  Widget _buildDoctorFilterDropdown(bool isSmallMobile) {
    return Container(
      height: 32,
      constraints: BoxConstraints(
        minWidth: isSmallMobile ? 110 : 180, 
        maxWidth: isSmallMobile ? 130 : 220
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Consumer<AppointmentDashboardViewModel>(
        builder: (context, viewModel, child) {
          // Show loading state
          if (viewModel.isLoadingDoctors) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: viewModel.selectedDoctor ?? 'all',
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 14,
                  color: Color(0xFF666666),
                ),
                style: const TextStyle(fontSize: 11, color: Color(0xFF333333)),
                items: [
                  // All Doctors option
                  DropdownMenuItem<String>(
                    value: 'all',
                    child: Row(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 14,
                          color: Color(0xFF666666),
                        ),
                        const SizedBox(width: 6),
                        const Text('All Doctors'),
                      ],
                    ),
                  ),
                  // Divider
                  const DropdownMenuItem<String>(
                    enabled: false,
                    child: Divider(height: 1),
                  ),
                  // Doctor options
                  ...viewModel.clinicDoctors.map((doctor) {
                    final doctorId = doctor.doctorId ?? doctor.id ?? '';
                    if (doctorId.isEmpty) return null;
                    final doctorName =
                        doctor.fullName ??
                        '${doctor.firstName ?? ''} ${doctor.lastName ?? ''}'
                            .trim();
                    return DropdownMenuItem<String>(
                      value: doctorId,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 14,
                            color: Color(0xFF666666),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              doctorName,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).whereType<DropdownMenuItem<String>>(),
                ],
                selectedItemBuilder: (BuildContext context) {
                  // Return custom display for each item (for when dropdown is open)
                  final items = <Widget>[];

                  // All Doctors option
                  items.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.people,
                            size: 14,
                            color: DashboardConstants.primaryColor,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              'All Doctors',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  // Divider (disabled item, won't be selectable)
                  items.add(const SizedBox.shrink());

                  // Doctor options
                  for (final doctor in viewModel.clinicDoctors) {
                    final doctorId = doctor.doctorId ?? doctor.id ?? '';
                    if (doctorId.isEmpty) continue;
                    final doctorName =
                        doctor.fullName ??
                        '${doctor.firstName ?? ''} ${doctor.lastName ?? ''}'
                            .trim();
                    items.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 14,
                              color: DashboardConstants.primaryColor,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                doctorName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return items;
                },
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    viewModel.setDoctorFilter(
                      newValue == 'all' ? null : newValue,
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// ✅ Build booking mode filter dropdown (Walk-in vs Normal)
  Widget _buildBookingModeFilterDropdown(bool isSmallMobile) {
    return Container(
      height: 32,
      constraints: BoxConstraints(
        minWidth: isSmallMobile ? 85 : 120, 
        maxWidth: isSmallMobile ? 105 : 140
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: viewModel.selectedBookingMode ?? 'all',
          padding: const EdgeInsets.symmetric(horizontal: 8),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 14,
            color: Color(0xFF666666),
          ),
          style: const TextStyle(fontSize: 11, color: Color(0xFF333333)),
          items: [
            const DropdownMenuItem<String>(
              value: 'all',
              child: Row(
                children: [
                  Icon(Icons.list_alt, size: 14, color: Color(0xFF666666)),
                  SizedBox(width: 6),
                  Text('All Types'),
                ],
              ),
            ),
            const DropdownMenuItem<String>(
              value: 'walk_in',
              child: Row(
                children: [
                  Icon(
                    Icons.directions_walk,
                    size: 14,
                    color: Color(0xFF666666),
                  ),
                  SizedBox(width: 6),
                  Text('Walk-in'),
                ],
              ),
            ),
            const DropdownMenuItem<String>(
              value: 'slot',
              child: Row(
                children: [
                  Icon(Icons.schedule, size: 14, color: Color(0xFF666666)),
                  SizedBox(width: 6),
                  Text('Normal'),
                ],
              ),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              viewModel.setBookingModeFilter(
                newValue == 'all' ? null : newValue,
              );
            }
          },
        ),
      ),
    );
  }

  /// ✅ Build patient filter dropdown
  Widget _buildPatientFilterDropdown(bool isSmallMobile) {
    return Container(
      height: 32,
      constraints: BoxConstraints(
        minWidth: isSmallMobile ? 90 : 140, 
        maxWidth: isSmallMobile ? 110 : 170
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Consumer<AppointmentDashboardViewModel>(
        builder: (context, viewModel, child) {
          final patients = viewModel.uniquePatientsInAppointments;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: viewModel.selectedPatientId ?? 'all',
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 14,
                  color: Color(0xFF666666),
                ),
                style: const TextStyle(fontSize: 11, color: Color(0xFF333333)),
                items: [
                  // All Patients option
                  const DropdownMenuItem<String>(
                    value: 'all',
                    child: Row(
                      children: [
                        Icon(
                          Icons.assignment_ind_rounded,
                          size: 14,
                          color: Color(0xFF666666),
                        ),
                        SizedBox(width: 6),
                        Text('All Patients'),
                      ],
                    ),
                  ),
                  if (patients.isNotEmpty) ...[
                    // Divider
                    const DropdownMenuItem<String>(
                      enabled: false,
                      child: Divider(height: 1),
                    ),
                    // Patient options
                    ...patients.map((p) {
                      final id = p['id']!;
                      final name = p['name']!;
                      final number = p['number']!;
                      return DropdownMenuItem<String>(
                        value: id,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_outline_rounded,
                              size: 14,
                              color: Color(0xFF666666),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  if (number.isNotEmpty)
                                    Text(
                                      number,
                                      style: const TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFF888888),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ],
                selectedItemBuilder: (BuildContext context) {
                  final items = <Widget>[];

                  // All Patients option
                  items.add(
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.assignment_ind_rounded,
                            size: 14,
                            color: DashboardConstants.primaryColor,
                          ),
                          SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              'All Patients',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  if (patients.isNotEmpty) {
                    items.add(const SizedBox.shrink());

                    for (final p in patients) {
                      final name = p['name']!;
                      items.add(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.person_outline_rounded,
                                size: 14,
                                color: DashboardConstants.primaryColor,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }

                  return items;
                },
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    viewModel.setPatientFilter(
                      newValue == 'all' ? null : newValue,
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, bool isSmallMobile) {
    final displayDate = selectedDate != null
        ? _formatDate(selectedDate!)
        : _formatDate(DateTime.now());

    return InkWell(
      onTap: onDatePickerTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: isSmallMobile ? 6 : (isTablet ? 8 : 10)),
        decoration: BoxDecoration(
          color: selectedDate != null
              ? DashboardConstants.primaryColor.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(isTablet ? 4 : 5),
          border: Border.all(
            color: selectedDate != null
                ? DashboardConstants.primaryColor
                : DashboardConstants.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_today,
              color: selectedDate != null
                  ? DashboardConstants.primaryColor
                  : DashboardConstants.textSecondaryColor,
              size: isTablet ? 11 : 12,
            ),
            SizedBox(width: isTablet ? 4 : 6),
            Text(
              displayDate,
              style: TextStyle(
                fontSize: isTablet ? 10 : 11,
                fontWeight: FontWeight.w600,
                color: selectedDate != null
                    ? DashboardConstants.primaryColor
                    : DashboardConstants.textPrimaryColor,
              ),
            ),
            if (selectedDate != null && onClearDate != null) ...[
              SizedBox(width: isTablet ? 4 : 6),
              InkWell(
                onTap: onClearDate,
                child: Icon(
                  Icons.close,
                  size: isTablet ? 12 : 14,
                  color: DashboardConstants.primaryColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
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
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

/// A debounced search field to prevent excessive API calls
class _DebouncedSearchField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const _DebouncedSearchField({required this.onChanged});

  @override
  State<_DebouncedSearchField> createState() => _DebouncedSearchFieldState();
}

class _DebouncedSearchFieldState extends State<_DebouncedSearchField> {
  Timer? _debounce;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: DashboardConstants.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: _controller,
        onChanged: _onSearchChanged,
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 11,
            color: DashboardConstants.textSecondaryColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: DashboardConstants.textSecondaryColor,
            size: 14,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 9, // Centered vertically
          ),
          isDense: true,
        ),
      ),
    );
  }
}
