import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_doctors_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_doctors_model.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:drandme/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:drandme/modules/doctor/models/doctor_model.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/impressive_appointment_container.dart';
import 'package:drandme/modules/superadmin/repositories/department_repository.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

// --- VISUAL CONSTANTS (Elite Healthcare Aesthetic) ---
const kBgColor = Color(0xFFFFFFFF); // Pure White Background
const kCardBg = Colors.white;
const kPrimaryText = Color(0xFF0F172A); // Slate 900
const kSecondaryText = Color(0xFF64748B); // Slate 500
const kAccentColor = Color(0xFF0F172A); // Deep Executive Navy
const kMedicalRed = Color(0xFFE11D48); // Rose 600 - Medical Accent
const kBorderColor = Color(0xFFE2E8F0); // Slate 200
const kSuccessColor = Color(0xFF10B981); // Emerald 500

class ClinicDoctorsListView extends StatefulWidget {
  final Function(String)? onNavigate;

  const ClinicDoctorsListView({super.key, this.onNavigate});

  @override
  State<ClinicDoctorsListView> createState() => _ClinicDoctorsListViewState();
}

class _ClinicDoctorsListViewState extends State<ClinicDoctorsListView> {
  late ClinicDoctorsViewModel _viewModel;
  // Local state for filtering
  String _searchQuery = '';
  String _selectedFilter = 'All Departments';

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<ClinicDoctorsViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadAllData();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ClinicDoctorsViewModel>(context);
    return Container(
      color: kBgColor,
      padding: const EdgeInsets.all(4),
      child: ImpressiveAppointmentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _DoctorsContent(
                searchQuery: _searchQuery,
                selectedFilter: _selectedFilter,
                onSearchChanged: _onSearchChanged,
                onFilterChanged: _onFilterChanged,
                onNavigate: widget.onNavigate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorsContent extends StatelessWidget {
  final String searchQuery;
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;
  final Function(String)? onNavigate;

  const _DoctorsContent({
    required this.searchQuery,
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Spacing (matching appointments dashboard)
        const SliverPadding(padding: EdgeInsets.only(top: 4)),

        // Controls (Pinned or Box)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RepaintBoundary(
              child: Consumer<ClinicDoctorsViewModel>(
                builder: (context, vm, _) => _ControlsPanel(
                  selectedFilter: selectedFilter,
                  onSearchChanged: onSearchChanged,
                  onFilterChanged: onFilterChanged,
                  departments: vm.departments.map((d) => d.name).toList(),
                ),
              ),
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(top: 4)),

        // Content
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          // Use Selector to rebuild only when data or loading changes
          sliver: Consumer<ClinicDoctorsViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.isLoading) {
                return const SliverFillRemaining(
                  child: Center(child: AppLoader(size: 50, strokeWidth: 3)),
                );
              }

              if (viewModel.error != null) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Error: ${viewModel.error}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              return _FilteredDoctorsGrid(
                doctors: viewModel.doctors,
                searchQuery: searchQuery,
                selectedFilter: selectedFilter,
                onNavigate: onNavigate,
              );
            },
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 2)),
      ],
    );
  }
}

class _FilteredDoctorsGrid extends StatelessWidget {
  final List<ClinicDoctorModel> doctors;
  final String searchQuery;
  final String selectedFilter;
  final Function(String)? onNavigate;

  const _FilteredDoctorsGrid({
    required this.doctors,
    required this.searchQuery,
    required this.selectedFilter,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = doctors.where((doc) {
      final query = searchQuery.toLowerCase();
      final name = (doc.fullName ?? doc.firstName ?? '').toLowerCase();
      final spec = (doc.specialization ?? '').toLowerCase();

      bool matchesSearch = name.contains(query) || spec.contains(query);
      bool matchesFilter = true;
      if (selectedFilter != 'All Departments') {
        matchesFilter =
            (doc.specialization != null &&
            doc.specialization!.toLowerCase() == selectedFilter.toLowerCase());
      }
      return matchesSearch && matchesFilter;
    }).toList();

    if (filteredDoctors.isEmpty) {
      return const SliverToBoxAdapter(child: _EmptyState());
    }

    return SliverLayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 7;
        if (constraints.crossAxisExtent < 600) {
          crossAxisCount = 2;
        } else if (constraints.crossAxisExtent < 900) {
          crossAxisCount = 3;
        } else if (constraints.crossAxisExtent < 1200) {
          crossAxisCount = 5;
        } else if (constraints.crossAxisExtent < 1600) {
          crossAxisCount = 6;
        }

        double aspectRatio = 0.85;
        if (constraints.crossAxisExtent < 600) aspectRatio = 0.75;

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: aspectRatio,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final doctor = filteredDoctors[index];
            return _ClassicDoctorCard(
              doctor: doctor,
              onTap: () {
                if (onNavigate != null && doctor.doctorId != null) {
                  onNavigate!('doctor_details:${doctor.doctorId}');
                }
              },
            );
          }, childCount: filteredDoctors.length),
        );
      },
    );
  }
}

class _ClassicDoctorCard extends StatefulWidget {
  final ClinicDoctorModel doctor;
  final VoidCallback onTap;

  const _ClassicDoctorCard({required this.doctor, required this.onTap});

  @override
  State<_ClassicDoctorCard> createState() => _ClassicDoctorCardState();
}

class _ClassicDoctorCardState extends State<_ClassicDoctorCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final name =
        widget.doctor.fullName ??
        "${widget.doctor.firstName} ${widget.doctor.lastName}".trim();
    final avatarColor = Colors.blue;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? kMedicalRed.withValues(alpha: 0.5)
                : kBorderColor,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: _isHovered ? 12 : 6,
              offset: Offset(0, _isHovered ? 6 : 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: avatarColor.withValues(alpha: 0.05),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: avatarColor.withValues(alpha: 0.1),
                      backgroundImage:
                          (widget.doctor.profileImage != null &&
                              widget.doctor.profileImage!.isNotEmpty)
                          ? NetworkImage(
                              AppHelpers.ensureImageUrl(
                                widget.doctor.profileImage!,
                              ),
                            )
                          : null,
                      child:
                          (widget.doctor.profileImage == null ||
                              widget.doctor.profileImage!.isEmpty)
                          ? Text(
                              (widget.doctor.firstName?.isNotEmpty == true
                                  ? widget.doctor.firstName![0].toUpperCase()
                                  : "?"),
                              style: TextStyle(
                                fontSize: 20,
                                color: avatarColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 11,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: kPrimaryText,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.doctor.specialization?.toUpperCase() ??
                            "GENERAL PHYSICIAN",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.doctor.isActive
                                  ? kSuccessColor
                                  : Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Profile",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: _isHovered
                                      ? kMedicalRed
                                      : kPrimaryText,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 10,
                                color: _isHovered
                                    ? kMedicalRed
                                    : kSecondaryText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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

class _ControlsPanel extends StatelessWidget {
  final String selectedFilter;
  final List<String> departments;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;

  const _ControlsPanel({
    required this.selectedFilter,
    required this.departments,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Search - Debounced
          Expanded(
            flex: 4,
            child: _DebouncedSearchBar(onChanged: onSearchChanged),
          ),
          const SizedBox(width: 16),

          // Filter Dropdown
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBorderColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedFilter,
                icon: const Icon(
                  Icons.tune_rounded,
                  color: kSecondaryText,
                  size: 16,
                ),
                borderRadius: BorderRadius.circular(8),
                dropdownColor: Colors.white,
                style: GoogleFonts.plusJakartaSans(
                  color: kPrimaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                items: [
                  const DropdownMenuItem(
                    value: 'All Departments',
                    child: Text('All Departments'),
                  ),
                  ...departments.map(
                    (dept) => DropdownMenuItem(value: dept, child: Text(dept)),
                  ),
                ],
                onChanged: onFilterChanged,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Add Button
          Material(
            color: kPrimaryText,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () async {
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => const _AddDoctorDialog(),
                );

                if (result == true && context.mounted) {
                  context.read<ClinicDoctorsViewModel>().loadDoctors();
                }
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Add Doctor",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBorderColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: kSecondaryText, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: kPrimaryText,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Search by physician name or expertise...",
                hintStyle: GoogleFonts.inter(
                  fontSize: 13,
                  color: kSecondaryText.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.person_search_outlined,
            size: 48,
            color: kSecondaryText,
          ),
          const SizedBox(height: 16),
          Text(
            "No doctors found matching your criteria",
            style: GoogleFonts.inter(fontSize: 13, color: kSecondaryText),
          ),
        ],
      ),
    );
  }
}

class _AddDoctorDialog extends StatefulWidget {
  const _AddDoctorDialog();

  @override
  State<_AddDoctorDialog> createState() => _AddDoctorDialogState();
}

class _AddDoctorDialogState extends State<_AddDoctorDialog> {
  String _searchQuery = '';
  DoctorModel? _selectedDoctor;
  bool _isPooling = false;

  // Department state
  List<DepartmentModel> _departments = [];
  DepartmentModel? _selectedDepartment;
  bool _isLoadingDepartments = false;

  final DepartmentRepository _departmentRepository = DepartmentRepository();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DoctorViewModel>().fetchDoctors();
      _loadDepartments();
    });
  }

  Future<void> _loadDepartments() async {
    setState(() => _isLoadingDepartments = true);
    try {
      final authVM = context.read<AuthViewModel>();
      final token = authVM.accessToken;
      final clinicId = authVM.user?.clinicId;
      if (token == null) return;

      final depts = await _departmentRepository.listDepartments(
        token: token,
        clinicId: clinicId,
        onlyActive: true,
      );

      if (mounted && depts != null) {
        setState(() {
          _departments = depts;
          if (depts.isNotEmpty) {
            _selectedDepartment = depts.first;
          }
        });
      }
    } catch (e) {
      print('Error loading departments: $e');
    } finally {
      if (mounted) setState(() => _isLoadingDepartments = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 850, // Wider for two-column layout
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 40,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Left Column: Selection Form ---
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  _DialogTitleBar(
                    title: 'Add Doctor to Clinic',
                    onClose: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle('1. Target Department'),
                          const SizedBox(height: 12),
                          _buildDepartmentDropdown(),
                          const SizedBox(height: 24),
                          _buildSectionTitle(
                            '2. Select Doctor (Global Directory)',
                          ),
                          const SizedBox(height: 12),
                          _buildSearchField(),
                          const SizedBox(height: 16),
                          _buildDoctorList(),
                        ],
                      ),
                    ),
                  ),
                  _buildFooterActions(),
                ],
              ),
            ),

            // --- Right Column: Preview Panel ---
            Expanded(
              flex: 3,
              child: Container(
                color: const Color(0xFFF8FAFC),
                child: _DoctorPreviewPanel(
                  doctor: _selectedDoctor,
                  department: _selectedDepartment,
                  isLoading: _isPooling,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: kPrimaryText,
        letterSpacing: 0.3,
        fontFamily: 'Inter',
      ),
    );
  }

  Widget _buildDepartmentDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kBorderColor),
      ),
      child: _isLoadingDepartments
          ? const _LoadingSmall(label: 'Fetching departments...')
          : _departments.isEmpty
          ? const _EmptySmall(label: 'No departments available')
          : DropdownButtonHideUnderline(
              child: DropdownButton<DepartmentModel>(
                value: _selectedDepartment,
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: kAccentColor,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryText,
                  fontFamily: 'Inter',
                ),
                items: _departments.map((dept) {
                  return DropdownMenuItem<DepartmentModel>(
                    value: dept,
                    child: Text(dept.name),
                  );
                }).toList(),
                onChanged: (dept) {
                  setState(() {
                    _selectedDepartment = dept;
                    _selectedDoctor = null; // Clear selection on department change
                  });
                },
              ),
            ),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      onChanged: (v) => setState(() => _searchQuery = v),
      style: const TextStyle(fontSize: 14, color: kPrimaryText),
      decoration: InputDecoration(
        hintText: 'Search by name or specialization...',
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 20,
          color: kSecondaryText,
        ),
        filled: true,
        fillColor: const Color(0xFFF1F5F9),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: kBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: kAccentColor, width: 2),
        ),
      ),
    );
  }

  Widget _buildDoctorList() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kBorderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Consumer<DoctorViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading)
            return const Center(child: CircularProgressIndicator());

          final filtered = vm.doctors.where((doc) {
            final q = _searchQuery.toLowerCase();
            final name = '${doc.firstName ?? ''} ${doc.lastName ?? ''}'
                .toLowerCase();
            final spec = (doc.specialization ?? '').toLowerCase();
            return name.contains(q) || spec.contains(q);
          }).toList();

          // Sort so matching specialization doctors are at the top
          if (_selectedDepartment != null) {
            final deptName = _selectedDepartment!.name.toLowerCase().trim();
            filtered.sort((a, b) {
              final aSpec = (a.specialization ?? '').toLowerCase().trim();
              final bSpec = (b.specialization ?? '').toLowerCase().trim();
              final aMatches = aSpec == deptName;
              final bMatches = bSpec == deptName;
              if (aMatches && !bMatches) return -1;
              if (!aMatches && bMatches) return 1;
              return 0;
            });
          }

          if (filtered.isEmpty)
            return const _EmptySmall(label: 'No doctors found');

          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: filtered.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: kBorderColor),
            itemBuilder: (context, index) {
              final doc = filtered[index];
              final isSelected = _selectedDoctor?.drid == doc.drid;

              return ListTile(
                onTap: () => setState(() => _selectedDoctor = doc),
                selected: isSelected,
                selectedTileColor: kAccentColor.withValues(alpha: 0.05),
                leading: CircleAvatar(
                  backgroundColor: isSelected
                      ? kAccentColor
                      : const Color(0xFFF1F5F9),
                  radius: 20,
                  child: Text(
                    (doc.firstName ?? 'D')[0].toUpperCase(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : kPrimaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                title: Text(
                  'Dr. ${doc.firstName ?? ''} ${doc.lastName ?? ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                subtitle: Text(
                  doc.specialization ?? 'General Practitioner',
                  style: const TextStyle(fontSize: 12, color: kSecondaryText),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedDepartment != null &&
                        (doc.specialization ?? '').toLowerCase().trim() ==
                            _selectedDepartment!.name.toLowerCase().trim())
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF5),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: const Color(0xFF10B981).withValues(alpha: 0.2),
                          ),
                        ),
                        child: const Text(
                          'MATCHES',
                          style: TextStyle(
                            color: Color(0xFF065F46),
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: kAccentColor,
                            size: 22,
                          )
                        : const Icon(
                            Icons.chevron_right,
                            size: 18,
                            color: kBorderColor,
                          ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFooterActions() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: kBorderColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: const BorderSide(color: kBorderColor),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: kSecondaryText,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed:
                  (_selectedDoctor == null ||
                      _selectedDepartment == null ||
                      _isPooling)
                  ? null
                  : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryText,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: _isPooling
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Add Doctor to Clinic',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final clinicId = context.read<AuthViewModel>().user?.clinicId;
    if (clinicId == null ||
        _selectedDoctor?.drid == null ||
        _selectedDepartment == null)
      return;

    setState(() => _isPooling = true);
    final success = await context
        .read<ClinicViewModel>()
        .addClinicDoctorLinkSimple(
          clinicId,
          _selectedDoctor!.drid!,
          context,
          departmentId: _selectedDepartment!.id,
        );

    if (mounted) {
      setState(() => _isPooling = false);
      if (success) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Doctor added to ${_selectedDepartment!.name} successfully',
            ),
          ),
        );
      }
    }
  }
}

// ─── Shared Dialog Widgets (Same as patient details) ──────────────────────────

// --- Supporting Widgets for the Dialog ---

class _DoctorPreviewPanel extends StatelessWidget {
  final DoctorModel? doctor;
  final DepartmentModel? department;
  final bool isLoading;

  const _DoctorPreviewPanel({
    this.doctor,
    this.department,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (doctor == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_search_rounded,
                size: 64,
                color: Color(0xFFCBD5E1),
              ),
              SizedBox(height: 16),
              Text(
                'Select a doctor from the list to see preview details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondaryText,
                  fontSize: 14,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      );
    }

    final avatarColor = _getDefaultColor(
      '${doctor!.firstName} ${doctor!.lastName}',
    );

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Avatar
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: avatarColor,
              border: Border.all(color: Colors.white, width: 6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Text(
                (doctor!.firstName ?? 'D')[0].toUpperCase(),
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: _getTextColor(avatarColor),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Dr. ${doctor!.firstName ?? ''} ${doctor!.lastName ?? ''}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: kPrimaryText,
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            doctor!.specialization ?? 'General Practitioner',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: kAccentColor,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 48),

          // Details Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kBorderColor),
            ),
            child: Column(
              children: [
                _buildPreviewRow(
                  Icons.email_outlined,
                  doctor!.email ?? 'No email',
                ),
                const Divider(height: 24),
                _buildPreviewRow(
                  Icons.phone_outlined,
                  doctor!.phone ?? 'No phone',
                ),
                if (department != null) ...[
                  const Divider(height: 24),
                  _buildPreviewRow(
                    Icons.business_rounded,
                    department!.name,
                    label: 'Department',
                  ),
                ],
              ],
            ),
          ),
          const Spacer(),
          if (isLoading)
            const Text(
              'Assigning doctor to clinic...',
              style: TextStyle(
                fontSize: 13,
                color: kAccentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Color _getDefaultColor(String name) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFEBEE),
      const Color(0xFFFFF3E0),
      const Color(0xFFF3E5F5),
    ];
    final index = name.isNotEmpty ? name.hashCode % colors.length : 0;
    return colors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    if (backgroundColor == const Color(0xFFE3F2FD))
      return const Color(0xFF1976D2);
    if (backgroundColor == const Color(0xFFFFEBEE))
      return const Color(0xFFD32F2F);
    if (backgroundColor == const Color(0xFFFFF3E0))
      return const Color(0xFFFF9800);
    if (backgroundColor == const Color(0xFFF3E5F5))
      return const Color(0xFF7B1FA2);
    return const Color(0xFF4CAF50);
  }

  Widget _buildPreviewRow(IconData icon, String value, {String? label}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: kSecondaryText),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null)
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: kSecondaryText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoadingSmall extends StatelessWidget {
  final String label;
  const _LoadingSmall({required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: kSecondaryText),
          ),
        ],
      ),
    );
  }
}

class _EmptySmall extends StatelessWidget {
  final String label;
  const _EmptySmall({required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: 16,
              color: kSecondaryText,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: kSecondaryText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback onClose;
  const _DialogTitleBar({required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 16, 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kBorderColor)),
      ),
      child: Row(
        children: [
          const Icon(Icons.public_rounded, size: 20, color: kPrimaryText),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kPrimaryText,
                fontFamily: 'Inter',
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(
              Icons.close_rounded,
              size: 22,
              color: kSecondaryText,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
