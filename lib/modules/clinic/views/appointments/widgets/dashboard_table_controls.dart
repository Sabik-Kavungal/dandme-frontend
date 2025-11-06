import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'dashboard_tab.dart';

/// Dashboard table controls including tabs, search, and filters
class DashboardTableControls extends StatelessWidget {
  final AppointmentDashboardViewModel viewModel;
  final bool isTablet;

  const DashboardTableControls({
    super.key,
    required this.viewModel,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tabs and New Appointment button
        _buildTabsRow(),
        const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 1),
        SizedBox(height: isTablet ? 6 : 8),
        // Search and filter controls
        _buildSearchAndFilterRow(),
      ],
    );
  }

  /// Build tabs row with New Appointment button
  Widget _buildTabsRow() {
    return Row(
      children: [
        DashboardTab(
          title: 'All',
          isSelected: viewModel.selectedTab == 0,
          onTap: () => viewModel.setSelectedTab(0),
        ),
        SizedBox(width: isTablet ? 6 : 8),
        DashboardTab(
          title: 'Patients',
          isSelected: viewModel.selectedTab == 1,
          onTap: () => viewModel.setSelectedTab(1),
        ),
        SizedBox(width: isTablet ? 6 : 8),
        DashboardTab(
          title: 'Doctors',
          isSelected: viewModel.selectedTab == 2,
          onTap: () => viewModel.setSelectedTab(2),
        ),
        const Spacer(),
        // New Appointment Button
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 8 : 10,
              vertical: isTablet ? 3 : 4,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isTablet ? 4 : 5),
            ),
          ),
          icon: Icon(Icons.add, size: isTablet ? 11 : 12),
          label: Text(
            'New Appointment',
            style: TextStyle(fontSize: isTablet ? 10 : 11),
          ),
        ),
      ],
    );
  }

  /// Build search and filter row
  Widget _buildSearchAndFilterRow() {
    return Row(
      children: [
        // ✅ Doctor Filter Dropdown (left)
        _buildDoctorFilterDropdown(),
        const SizedBox(width: 6),
        // ✅ Search Bar (right)
        Expanded(
          child: Container(
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              onChanged: (value) => viewModel.setSearchQuery(value),
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 11, color: Color(0xFF666666)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF666666),
                  size: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// ✅ Build doctor filter dropdown
  Widget _buildDoctorFilterDropdown() {
    return Container(
      height: 32,
      constraints: const BoxConstraints(minWidth: 180, maxWidth: 220),
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
                            color: Color(0xFF6366F1),
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
                              color: Color(0xFF6366F1),
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

  // (Filter button and view toggle removed per design update)
}
