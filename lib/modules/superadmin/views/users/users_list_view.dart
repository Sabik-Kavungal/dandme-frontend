import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/modules/superadmin/models/user_model_admin.dart';
import 'package:drandme/modules/superadmin/viewmodels/user_management_viewmodel.dart';
import 'package:drandme/modules/superadmin/views/users/add_edit_user_view.dart';
import 'package:drandme/modules/superadmin/views/users/user_details_view.dart';
import 'package:drandme/modules/superadmin/views/users/assign_role_dialog.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/impressive_appointment_container.dart';
import 'dart:async';

// --- VISUAL CONSTANTS (Classy Slate) ---
const kBgColor = Color(0xFFF1F5F9);
const kCardBg = Colors.white;
const kPrimaryText = Color(0xFF1E293B);
const kSecondaryText = Color(0xFF64758B);
const kAccentColor = Color(0xFF3B82F6);
const kBorderColor = Color(0xFFE2E8F0);

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  String _searchQuery = '';
  String _selectedFilter = 'All Users';
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUsers();
    });
  }

  void _loadUsers() {
    final viewModel = Provider.of<UserManagementViewModel>(
      context,
      listen: false,
    );

    bool? isActive;
    bool? isBlocked;

    if (_selectedFilter == 'Active') {
      isActive = true;
      isBlocked = false;
    } else if (_selectedFilter == 'Blocked') {
      isBlocked = true;
    } else if (_selectedFilter == 'Inactive') {
      isActive = false;
    }

    viewModel.listUsers(
      context,
      page: _currentPage,
      search: _searchQuery.isNotEmpty ? _searchQuery : null,
      isActive: isActive,
      isBlocked: isBlocked,
    );
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });
    _loadUsers();
  }

  void _onFilterChanged(String? filter) {
    if (filter != null) {
      setState(() {
        _selectedFilter = filter;
        _currentPage = 1;
      });
      _loadUsers();
    }
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ImpressiveAppointmentContainer(
                  child: _UsersContent(
                    searchQuery: _searchQuery,
                    selectedFilter: _selectedFilter,
                    onSearchChanged: _onSearchChanged,
                    onFilterChanged: _onFilterChanged,
                    onPageChanged: _onPageChanged,
                    refreshAction: _loadUsers,
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

class _UsersContent extends StatelessWidget {
  final String searchQuery;
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;
  final ValueChanged<int> onPageChanged;
  final VoidCallback refreshAction;

  const _UsersContent({
    required this.searchQuery,
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
    required this.onPageChanged,
    required this.refreshAction,
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
                refreshAction: refreshAction,
              ),
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(top: 4)),

        // Content
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          sliver: Consumer<UserManagementViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.isLoading && viewModel.users.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: AppLoader(size: 50, strokeWidth: 3)),
                );
              }

              if (viewModel.error != null && viewModel.users.isEmpty) {
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
                          onPressed: refreshAction,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (viewModel.users.isEmpty) {
                return const SliverFillRemaining(child: _EmptyState());
              }

              return _UsersHorizontalGrid(
                users: viewModel.users,
                refreshAction: refreshAction,
              );
            },
          ),
        ),

        // Pagination
        SliverToBoxAdapter(
          child: Consumer<UserManagementViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.pagination == null || viewModel.users.isEmpty) {
                return const SizedBox.shrink();
              }
              final pag = viewModel.pagination!;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: kSecondaryText,
                      ),
                      onPressed: pag.page > 1
                          ? () => onPageChanged(pag.page - 1)
                          : null,
                    ),
                    Text(
                      'Page ${pag.page} of ${pag.totalPages}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: kPrimaryText,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_right,
                        color: kSecondaryText,
                      ),
                      onPressed: pag.page < pag.totalPages
                          ? () => onPageChanged(pag.page + 1)
                          : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 2)),
      ],
    );
  }
}

class _UsersHorizontalGrid extends StatelessWidget {
  final List<UserModelAdmin> users;
  final VoidCallback refreshAction;

  const _UsersHorizontalGrid({
    required this.users,
    required this.refreshAction,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1; // Default to horizontal list style
        if (constraints.crossAxisExtent > 800) {
          crossAxisCount = 2; // Split into 2 columns on wide screens
        } else if (constraints.crossAxisExtent > 1400) {
          crossAxisCount = 3;
        }

        // Extremely low aspect ratio to force a horizontal rectangle pill card
        double aspectRatio = constraints.crossAxisExtent < 600 ? 3.0 : 4.5;

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: aspectRatio,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final user = users[index];
            return _LandscapeUserCard(user: user, refreshAction: refreshAction);
          }, childCount: users.length),
        );
      },
    );
  }
}

class _ControlsPanel extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onFilterChanged;
  final VoidCallback refreshAction;

  const _ControlsPanel({
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
    required this.refreshAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
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
                    value: 'All Users',
                    child: Text('All Users'),
                  ),
                  DropdownMenuItem(value: 'Active', child: Text('Active')),
                  DropdownMenuItem(value: 'Inactive', child: Text('Inactive')),
                  DropdownMenuItem(value: 'Blocked', child: Text('Blocked')),
                ],
                onChanged: onFilterChanged,
              ),
            ),
          ),
          const SizedBox(width: 4),

          // Add Button
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => const AddEditUserView(),
                    ),
                  )
                  .then((_) {
                    if (context.mounted) refreshAction();
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
              "New User",
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
    _debounce = Timer(const Duration(milliseconds: 500), () {
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
                hintText: "Search users by name, email or username...",
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
          Icon(Icons.people_alt_outlined, size: 48, color: kSecondaryText),
          SizedBox(height: 16),
          Text(
            "No users found matching your criteria",
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

// Custom specialized horizontal design for User cards. Distinct from the vertical classic cards.
class _LandscapeUserCard extends StatefulWidget {
  final UserModelAdmin user;
  final VoidCallback refreshAction;

  const _LandscapeUserCard({required this.user, required this.refreshAction});

  @override
  State<_LandscapeUserCard> createState() => _LandscapeUserCardState();
}

class _LandscapeUserCardState extends State<_LandscapeUserCard> {
  bool _isHovered = false;

  static const _defaultShadow = [
    BoxShadow(color: Color(0x08000000), blurRadius: 2, offset: Offset(0, 1)),
  ];

  static const _hoverShadow = [
    BoxShadow(
      color: Color(0x1A14B8A6),
      blurRadius: 8,
      offset: Offset(0, 4),
    ), // Teal hue hover
  ];

  @override
  Widget build(BuildContext context) {
    final name = '${widget.user.firstName ?? ''} ${widget.user.lastName ?? ''}'
        .trim();
    final displayName = name.isNotEmpty
        ? name
        : (widget.user.email ?? widget.user.username);

    // Status color selection
    Color statusColor;
    String statusText;
    if (widget.user.isBlocked) {
      statusColor = const Color(0xFFEF4444);
      statusText = "Blocked";
    } else if (widget.user.isActive) {
      statusColor = const Color(0xFF10B981);
      statusText = "Active";
    } else {
      statusColor = const Color(0xFFF59E0B);
      statusText = "Inactive";
    }

    return RepaintBoundary(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) =>
                        UserDetailsView(userId: widget.user.id),
                  ),
                )
                .then((_) => widget.refreshAction());
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: _isHovered
                    ? statusColor.withValues(alpha: 0.5)
                    : kBorderColor,
                width: 1,
              ),
              boxShadow: _isHovered ? _hoverShadow : _defaultShadow,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Avatar Ring
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: statusColor.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    color: statusColor.withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: Text(
                      displayName.isNotEmpty
                          ? displayName[0].toUpperCase()
                          : 'U',
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // 2. Info Block
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryText,
                          fontFamily: 'Inter',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '@${widget.user.username}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: kSecondaryText,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Role tags
                      if (widget.user.roles != null &&
                          widget.user.roles!.isNotEmpty)
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: widget.user.roles!
                              .map((r) => _RolePill(role: r.name))
                              .toList(),
                        )
                      else
                        const Text(
                          "No Roles",
                          style: TextStyle(
                            fontSize: 10,
                            color: kSecondaryText,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                    ],
                  ),
                ),

                // 3. Status Badge & Actions Overlay
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: statusColor.withValues(alpha: 0.5),
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),

                    PopupMenuButton<String>(
                      onSelected: (val) {
                        if (val == 'view') {
                          Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UserDetailsView(userId: widget.user.id),
                                ),
                              )
                              .then((_) => widget.refreshAction());
                        } else if (val == 'assign_role') {
                          showDialog<bool>(
                            context: context,
                            builder: (context) =>
                                AssignRoleDialog(userId: widget.user.id),
                          ).then((res) {
                            if (res == true) widget.refreshAction();
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        size: 16,
                        color: kSecondaryText,
                      ),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'view',
                          child: Text(
                            'View Details',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'assign_role',
                          child: Text(
                            'Assign Role',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RolePill extends StatelessWidget {
  final String role;
  const _RolePill({required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // Slate 100
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: kBorderColor, width: 0.5),
      ),
      child: Text(
        role.replaceAll('_', ' ').toUpperCase(),
        style: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: kSecondaryText,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
