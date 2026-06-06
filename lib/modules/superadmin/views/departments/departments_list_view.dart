import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';
import 'package:drandme/modules/superadmin/viewmodels/department_viewmodel.dart';
import 'package:drandme/modules/superadmin/views/departments/add_edit_department_view.dart';
import 'package:drandme/modules/superadmin/views/departments/department_details_view.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/impressive_appointment_container.dart';
import 'dart:async';

// --- VISUAL CONSTANTS (Elite Healthcare Aesthetic) ---
const kBgColor = Color(0xFFF8FAFC); // Very Light Slate
const kCardBg = Colors.white;
const kPrimaryText = Color(0xFF0F172A); // Slate 900
const kSecondaryText = Color(0xFF64758B); // Slate 500
const kAccentColor = Color(0xFF0F172A); // Deep Executive Navy
const kMedicalRed = Color(0xFFE11D48); // Rose 600 - Medical Accent
const kBorderColor = Color(0xFFE2E8F0); // Slate 200
const kSuccessColor = Color(0xFF10B981); // Emerald 500

class DepartmentsListView extends StatefulWidget {
  const DepartmentsListView({super.key});

  @override
  State<DepartmentsListView> createState() => _DepartmentsListViewState();
}

class _DepartmentsListViewState extends State<DepartmentsListView> {
  // Local state for filtering
  String _searchQuery = '';
  String _selectedFilter = 'All Departments';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final departmentVM = Provider.of<DepartmentViewModel>(
        context,
        listen: false,
      );
      // We pass onlyActive: false initially so we get both active and inactive
      // Then we do client-side filtering below.
      departmentVM.fetchDepartments(onlyActive: false);
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onFilterChanged(String? filter) {
    if (filter != null) {
      setState(() {
        _selectedFilter = filter;
      });
      // Optionally re-fetch if we relied strictly on server-side filters
      // final departmentVM = Provider.of<DepartmentViewModel>(context, listen: false);
      // departmentVM.fetchDepartments(context, onlyActive: _selectedFilter == 'Active');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Slate 100
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(
            8.0,
          ), // Matching padding of other Slate screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ImpressiveAppointmentContainer(
                  child: _DepartmentsContent(
                    searchQuery: _searchQuery,
                    selectedFilter: _selectedFilter,
                    onSearchChanged: _onSearchChanged,
                    onFilterChanged: _onFilterChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DepartmentsContent extends StatelessWidget {
  final String searchQuery;
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;

  const _DepartmentsContent({
    required this.searchQuery,
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 4)),

        // Controls
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RepaintBoundary(
              child: _ControlsPanel(
                selectedFilter: selectedFilter,
                onSearchChanged: onSearchChanged,
                onFilterChanged: onFilterChanged,
              ),
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(top: 4)),

        // Content
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          sliver: Consumer<DepartmentViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.isLoading) {
                return const SliverFillRemaining(
                  child: Center(child: AppLoader(size: 50, strokeWidth: 3)),
                );
              }

              if (viewModel.error != null) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Error: ${viewModel.error}",
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => viewModel.fetchDepartments(
                            onlyActive: selectedFilter == 'Active',
                          ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return _FilteredDepartmentsTable(
                departments: viewModel.departments,
                searchQuery: searchQuery,
                selectedFilter: selectedFilter,
              );
            },
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 2)),
      ],
    );
  }
}

class _FilteredDepartmentsTable extends StatelessWidget {
  final List<DepartmentModel> departments;
  final String searchQuery;
  final String selectedFilter;

  const _FilteredDepartmentsTable({
    required this.departments,
    required this.searchQuery,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    final filteredDepartments = departments.where((dept) {
      final query = searchQuery.toLowerCase();
      final name = dept.name.toLowerCase();
      final description = (dept.description ?? '').toLowerCase();
      final clinicName = (dept.clinicName ?? '').toLowerCase();

      bool matchesFilter = true;
      if (selectedFilter == 'Active') {
        matchesFilter = dept.isActive == true;
      } else if (selectedFilter == 'Inactive') {
        matchesFilter = dept.isActive != true;
      }

      return matchesFilter &&
          (name.contains(query) ||
              description.contains(query) ||
              clinicName.contains(query));
    }).toList();

    if (filteredDepartments.isEmpty) {
      // _EmptyState is a plain box widget, so wrap it directly
      return SliverFillRemaining(
        hasScrollBody: false,
        child: const _EmptyState(),
      );
    }

    // Return TWO slivers via a MultiSliver-compatible approach:
    // Use a single SliverList with the header as index 0
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index == 0) {
              // Header row
              return Column(
                children: [_TableHeader(), const SizedBox(height: 8)],
              );
            }
            final dept = filteredDepartments[index - 1];
            return _DepartmentRow(
              department: dept,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DepartmentDetailsView(departmentId: dept.id),
                  ),
                );
              },
            );
          },
          childCount: filteredDepartments.length + 1, // +1 for header
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBorderColor),
      ),
      child: Row(
        children: const [
          Expanded(
            flex: 3,
            child: Text(
              'DEPARTMENT NAME',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: kSecondaryText,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'CLINIC',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: kSecondaryText,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'DESCRIPTION',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: kSecondaryText,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Center(
              child: Text(
                'STATUS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryText,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                'ACTIONS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryText,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DepartmentRow extends StatefulWidget {
  final DepartmentModel department;
  final VoidCallback onTap;

  const _DepartmentRow({required this.department, required this.onTap});

  @override
  State<_DepartmentRow> createState() => _DepartmentRowState();
}

class _DepartmentRowState extends State<_DepartmentRow> {
  bool _isHovered = false;

  void _showEditDepartmentPanel(
    BuildContext context,
    DepartmentModel department,
  ) {
    Navigator.of(context)
        .push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                AddEditDepartmentView(department: department),
            opaque: false,
            transitionDuration: const Duration(milliseconds: 300),
          ),
        )
        .then((_) {
          if (!mounted) return;
          Provider.of<DepartmentViewModel>(
            context,
            listen: false,
          ).fetchDepartments(onlyActive: false);
        });
  }

  void _showDeleteDialog(BuildContext context, DepartmentModel department) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Department'),
        content: Text('Are you sure you want to delete "${department.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final vm = Provider.of<DepartmentViewModel>(
                context,
                listen: false,
              );
              final success = await vm.deleteDepartment(department.id);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success ? 'Deleted successfully' : (vm.error ?? 'Error'),
                    ),
                    backgroundColor: success ? kSuccessColor : kMedicalRed,
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: kMedicalRed),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFFF1F5F9) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? kMedicalRed.withValues(alpha: 0.2)
                  : kBorderColor,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2FE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.business_rounded,
                        color: Color(0xFF0284C7),
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.department.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryText,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: kBorderColor),
                    ),
                    child: Text(
                      widget.department.clinicName ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 11,
                        color: kSecondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  widget.department.description ?? '---',
                  style: const TextStyle(
                    fontSize: 12,
                    color: kSecondaryText,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 80,
                child: Center(
                  child: _StatusBadge(isActive: widget.department.isActive),
                ),
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: kSecondaryText,
                      ),
                      onPressed: () =>
                          _showEditDepartmentPanel(context, widget.department),
                      visualDensity: VisualDensity.compact,
                      tooltip: 'Edit',
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 18,
                        color: kMedicalRed,
                      ),
                      onPressed: () =>
                          _showDeleteDialog(context, widget.department),
                      visualDensity: VisualDensity.compact,
                      tooltip: 'Delete',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isActive;
  const _StatusBadge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF0FDF4) : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isActive ? const Color(0xFFBBF7D0) : const Color(0xFFFECACA),
          width: 1,
        ),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: isActive ? const Color(0xFF166534) : const Color(0xFF991B1B),
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}

class _ControlsPanel extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;

  const _ControlsPanel({
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: kBorderColor, width: 1.2)),
      ),
      child: Row(
        children: [
          Expanded(child: _DebouncedSearchBar(onChanged: onSearchChanged)),
          const SizedBox(width: 12),
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: kBgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBorderColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedFilter,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: kSecondaryText,
                  size: 20,
                ),
                style: const TextStyle(
                  color: kPrimaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'All Departments',
                    child: Text('All'),
                  ),
                  DropdownMenuItem(value: 'Active', child: Text('Active')),
                  DropdownMenuItem(value: 'Inactive', child: Text('Inactive')),
                ],
                onChanged: onFilterChanged,
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const AddEditDepartmentView(),
                      opaque: false,
                      transitionDuration: const Duration(milliseconds: 300),
                    ),
                  )
                  .then((_) {
                    if (!context.mounted) return;
                    final deptVM = Provider.of<DepartmentViewModel>(
                      context,
                      listen: false,
                    );
                    deptVM.fetchDepartments(onlyActive: false);
                  });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              fixedSize: const Size.fromHeight(44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.add, size: 20),
            label: const Text(
              "New Dept",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DebouncedSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const _DebouncedSearchBar({required this.onChanged});

  @override
  State<_DebouncedSearchBar> createState() => _DebouncedSearchBarState();
}

class _DebouncedSearchBarState extends State<_DebouncedSearchBar> {
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
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.onChanged(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBorderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: kSecondaryText, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              style: const TextStyle(
                fontSize: 13,
                color: kPrimaryText,
                fontFamily: 'Inter',
              ),
              decoration: const InputDecoration(
                hintText: "Search departments...",
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: kSecondaryText,
                  fontFamily: 'Inter',
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    // This is a plain box widget — do NOT return a Sliver here
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.category_outlined, size: 64, color: Color(0xFFCBD5E1)),
          SizedBox(height: 16),
          Text(
            "No departments found matching your criteria",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF64748B),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
