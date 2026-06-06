import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/widgets/app_loader.dart';

import 'package:drandme/modules/organization/viewmodels/organization_viewmodel.dart';
import 'package:drandme/modules/organization/models/organization_model.dart';
import 'package:drandme/modules/superadmin/views/organizations/add_organization_view.dart';
import 'package:drandme/modules/superadmin/views/organizations/organization_details_view.dart';
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

class OrganizationsListScreen extends StatefulWidget {
  const OrganizationsListScreen({super.key});

  @override
  State<OrganizationsListScreen> createState() =>
      _OrganizationsListScreenState();
}

class _OrganizationsListScreenState extends State<OrganizationsListScreen> {
  // Local state for filtering
  String _searchQuery = '';
  // Removed filter since organizations do not have simple categories like doctors, but kept variable to match structure
  String _selectedFilter = 'All Organizations';

  @override
  void initState() {
    super.initState();
    // Using simple provider access in initState is safe for fetch
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final orgVM = Provider.of<OrganizationViewModel>(context, listen: false);
      orgVM.fetchOrganizations(context);
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
                  child: _OrganizationsContent(
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

class _OrganizationsContent extends StatelessWidget {
  final String searchQuery;
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;

  const _OrganizationsContent({
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
          sliver: Consumer<OrganizationViewModel>(
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
                          onPressed: () =>
                              viewModel.fetchOrganizations(context),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return _FilteredOrganizationsGrid(
                organizations: viewModel.organizations,
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

class _FilteredOrganizationsGrid extends StatelessWidget {
  final List<OrganizationModel> organizations;
  final String searchQuery;
  final String selectedFilter;

  const _FilteredOrganizationsGrid({
    required this.organizations,
    required this.searchQuery,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    final filteredOrganizations = organizations.where((org) {
      final query = searchQuery.toLowerCase();
      final name = org.name.toLowerCase();
      final email = (org.email ?? '').toLowerCase();

      // Check purely status filtering if selectedFilter changed in future. Default is All.
      bool matchesFilter = true;
      if (selectedFilter == 'Active') {
        matchesFilter = org.isActive == true;
      } else if (selectedFilter == 'Inactive') {
        matchesFilter = org.isActive != true;
      }

      return matchesFilter && (name.contains(query) || email.contains(query));
    }).toList();

    if (filteredOrganizations.isEmpty) {
      return const SliverToBoxAdapter(child: _EmptyState());
    }

    return SliverLayoutBuilder(
      builder: (context, constraints) {
        // High-density grid matching clinic views
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

        double aspectRatio = 0.95; // Shorter vertical height for organizations
        if (constraints.crossAxisExtent < 600) aspectRatio = 0.85;

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: aspectRatio,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final org = filteredOrganizations[index];
            return _ClassicOrganizationCard(
              organization: org,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrganizationDetailsScreen(organization: org),
                  ),
                );
              },
            );
          }, childCount: filteredOrganizations.length),
        );
      },
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Search - Debounced
          Expanded(
            flex: 2,
            child: _DebouncedSearchBar(onChanged: onSearchChanged),
          ),
          const SizedBox(width: 4),

          // Filter Dropdown
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: kBorderColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedFilter,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: kSecondaryText,
                ),
                style: const TextStyle(
                  color: kPrimaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'All Organizations',
                    child: Text('All Organizations'),
                  ),
                  DropdownMenuItem(value: 'Active', child: Text('Active')),
                  DropdownMenuItem(value: 'Inactive', child: Text('Inactive')),
                ],
                onChanged: onFilterChanged,
              ),
            ),
          ),
          const SizedBox(width: 4),

          // Add Button
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
                  return const AddOrganizationScreen();
                },
              ).then((_) {
                if (!context.mounted) return;
                final orgVM = Provider.of<OrganizationViewModel>(
                  context,
                  listen: false,
                );
                orgVM.fetchOrganizations(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              fixedSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            icon: const Icon(Icons.add, size: 16),
            label: const Text(
              "New",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: kBorderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          const Icon(Icons.search, color: kSecondaryText, size: 18),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              style: const TextStyle(fontSize: 12, color: kPrimaryText),
              decoration: const InputDecoration(
                hintText: "Search organizations...",
                hintStyle: TextStyle(fontSize: 12, color: kSecondaryText),
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
      padding: const EdgeInsets.only(top: 60, bottom: 20),
      child: Column(
        children: const [
          Icon(Icons.business_outlined, size: 48, color: kSecondaryText),
          SizedBox(height: 16),
          Text(
            "No organizations found matching your criteria",
            style: TextStyle(
              fontSize: 14,
              color: kSecondaryText,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassicOrganizationCard extends StatefulWidget {
  final OrganizationModel organization;
  final VoidCallback onTap;

  const _ClassicOrganizationCard({
    required this.organization,
    required this.onTap,
  });

  @override
  State<_ClassicOrganizationCard> createState() =>
      _ClassicOrganizationCardState();
}

class _ClassicOrganizationCardState extends State<_ClassicOrganizationCard> {
  bool _isHovered = false;

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            "Confirm Deletion",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Are you sure you want to delete '${widget.organization.name}'?",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 12),
              const Text(
                "This will delete the entire organization, including all associated clinics, admins, and data.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                "Cancel",
                style: TextStyle(color: kSecondaryText),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(dialogContext);
                final orgVM = Provider.of<OrganizationViewModel>(
                  context,
                  listen: false,
                );
                final success = await orgVM.deleteOrganization(
                  widget.organization.id ?? '',
                  context,
                );
                if (success && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Organization deleted successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        orgVM.error ?? "Failed to delete organization",
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Color _getDefaultColor(String name) {
    final colors = [
      const Color(0xFF6366F1), // Indigo
      const Color(0xFFEC4899), // Pink
      const Color(0xFFF59E0B), // Amber
      const Color(0xFF10B981), // Emerald
      const Color(0xFF3B82F6), // Blue
    ];
    return colors[name.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.organization.name;
    final email = widget.organization.email ?? "No Email";
    final isActive = widget.organization.isActive ?? false;
    final themeColor = _getDefaultColor(name);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Clean Organization Header
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeColor.withValues(alpha: 0.04),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Simple Status Indicator
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isActive
                                      ? const Color(0xFF10B981)
                                      : Colors.grey[400],
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isActive ? 'Active' : 'Inactive',
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                  color: kSecondaryText,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),

                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: themeColor.withValues(alpha: 0.1),
                              ),
                              child: Icon(
                                Icons.business,
                                size: 32,
                                color: themeColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. Simple Information Section
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: kPrimaryText,
                            fontFamily: 'Inter',
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          email.toLowerCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: kSecondaryText,
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                                color: _isHovered
                                    ? Colors.red
                                    : kSecondaryText.withValues(alpha: 0.5),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "View Details",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: _isHovered
                                        ? kMedicalRed
                                        : kPrimaryText,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                const SizedBox(width: 4),
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
      ),
    );
  }
}
