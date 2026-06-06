import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/modules/doctor/models/doctor_model.dart';
import 'package:drandme/modules/doctor/viewmodels/doctor_viewmodel.dart';
import 'package:drandme/modules/superadmin/views/doctors/add_doctor_view.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/impressive_appointment_container.dart';
import 'dart:async';

// --- VISUAL CONSTANTS (Elite Healthcare Aesthetic) ---
const kBgColor = Color(0xFFF8FAFC); // Very Light Slate
const kCardBg = Colors.white;
const kPrimaryText = Color(0xFF0F172A); // Slate 900
const kSecondaryText = Color(0xFF64748B); // Slate 500
const kAccentColor = Color(0xFF0F172A); // Deep Executive Navy
const kMedicalRed = Color(0xFFE11D48); // Rose 600 - Medical Accent
const kBorderColor = Color(0xFFE2E8F0); // Slate 200

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  // Local state for filtering
  String _searchQuery = '';
  String _selectedFilter = 'All Doctors';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorViewModel>(context, listen: false).fetchDoctors();
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
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ImpressiveAppointmentContainer(
                  child: _DoctorsContent(
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

class _DoctorsContent extends StatelessWidget {
  final String searchQuery;
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;

  const _DoctorsContent({
    required this.searchQuery,
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading) {
          return const CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Center(child: AppLoader(size: 50, strokeWidth: 3)),
              ),
            ],
          );
        }

        if (viewModel.error != null) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
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
                        onPressed: () => viewModel.fetchDoctors(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        final specializations =
            viewModel.doctors
                .map((d) => d.specialization)
                .where((s) => s != null && s.isNotEmpty)
                .map((s) => s!)
                .toSet()
                .toList()
              ..sort();

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 4)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _ControlsPanel(
                  selectedFilter: selectedFilter,
                  onSearchChanged: onSearchChanged,
                  onFilterChanged: onFilterChanged,
                  specializations: specializations,
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 12)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              sliver: _FilteredDoctorsGrid(
                doctors: viewModel.doctors,
                searchQuery: searchQuery,
                selectedFilter: selectedFilter,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 2)),
          ],
        );
      },
    );
  }
}

class _FilteredDoctorsGrid extends StatelessWidget {
  final List<DoctorModel> doctors;
  final String searchQuery;
  final String selectedFilter;

  const _FilteredDoctorsGrid({
    required this.doctors,
    required this.searchQuery,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = doctors.where((doctor) {
      final query = searchQuery.toLowerCase();
      final fullName = AppHelpers.getFullName(
        doctor.firstName,
        doctor.lastName,
      ).toLowerCase();
      final email = (doctor.email ?? '').toLowerCase();
      final specialization = (doctor.specialization ?? '').toLowerCase();

      bool matchesFilter =
          selectedFilter == 'All Doctors' ||
          (doctor.specialization != null &&
              doctor.specialization!.toLowerCase() ==
                  selectedFilter.toLowerCase());

      return matchesFilter &&
          (fullName.contains(query) ||
              email.contains(query) ||
              specialization.contains(query));
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
              onEditTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(
                    context,
                  ).modalBarrierDismissLabel,
                  barrierColor: Colors.black.withValues(alpha: 0.5),
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AddDoctorScreen(editDoctor: doctor);
                  },
                ).then((_) {
                  if (!context.mounted) return;
                  Provider.of<DoctorViewModel>(
                    context,
                    listen: false,
                  ).fetchDoctors();
                });
              },
            );
          }, childCount: filteredDoctors.length),
        );
      },
    );
  }
}

class _ClassicDoctorCard extends StatefulWidget {
  final DoctorModel doctor;
  final VoidCallback onEditTap;

  const _ClassicDoctorCard({required this.doctor, required this.onEditTap});

  @override
  State<_ClassicDoctorCard> createState() => _ClassicDoctorCardState();
}

class _ClassicDoctorCardState extends State<_ClassicDoctorCard> {
  bool _isHovered = false;

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: Text(
            "Delete 'Dr. ${AppHelpers.getFullName(widget.doctor.firstName, widget.doctor.lastName)}'?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext);
                final success = await Provider.of<DoctorViewModel>(
                  context,
                  listen: false,
                ).deleteDoctor(widget.doctor.drid ?? '');
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success ? "Deleted successfully" : "Failed to delete",
                      ),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                }
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = AppHelpers.getFullName(
      widget.doctor.firstName,
      widget.doctor.lastName,
    );
    final themeColor = Colors.blue;

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
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeColor.withValues(alpha: 0.05),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: themeColor.withValues(alpha: 0.1),
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
                            AppHelpers.getInitials(
                              widget.doctor.firstName,
                              widget.doctor.lastName,
                            ),
                            style: TextStyle(
                              fontSize: 20,
                              color: themeColor,
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
                      "DR. ${name.toUpperCase()}",
                      style: const TextStyle(
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
                      widget.doctor.specialization?.toUpperCase() ?? "N/A",
                      style: const TextStyle(
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
                        GestureDetector(
                          onTap: () => _confirmDelete(context),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            size: 16,
                            color: kSecondaryText.withValues(alpha: 0.5),
                          ),
                        ),
                        InkWell(
                          onTap: widget.onEditTap,
                          child: Row(
                            children: [
                              Text(
                                "Edit",
                                style: TextStyle(
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
    );
  }
}

class _ControlsPanel extends StatelessWidget {
  final String selectedFilter;
  final List<String> specializations;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;

  const _ControlsPanel({
    required this.selectedFilter,
    required this.specializations,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: _DebouncedSearchBar(onChanged: onSearchChanged),
          ),
          const SizedBox(width: 16),
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
                style: const TextStyle(
                  color: kPrimaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
                items: [
                  const DropdownMenuItem(
                    value: 'All Doctors',
                    child: Text('All Doctors'),
                  ),
                  ...specializations.map(
                    (spec) => DropdownMenuItem(value: spec, child: Text(spec)),
                  ),
                ],
                onChanged: onFilterChanged,
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(
                  context,
                ).modalBarrierDismissLabel,
                barrierColor: Colors.black.withValues(alpha: 0.5),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const AddDoctorScreen();
                },
              ).then((_) {
                if (!context.mounted) return;
                Provider.of<DoctorViewModel>(
                  context,
                  listen: false,
                ).fetchDoctors();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryText,
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
              "New Doctor",
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
                hintText: "Search doctors...",
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.person_search_outlined,
            size: 64,
            color: Color(0xFFCBD5E1),
          ),
          SizedBox(height: 16),
          Text(
            "No doctors found matching your criteria",
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
