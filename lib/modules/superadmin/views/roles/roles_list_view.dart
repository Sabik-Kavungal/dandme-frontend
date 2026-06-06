import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/superadmin/viewmodels/role_management_viewmodel.dart';
import 'package:drandme/modules/superadmin/views/roles/add_edit_role_view.dart';
import 'package:drandme/modules/superadmin/views/roles/role_details_view.dart';

class RolesListView extends StatefulWidget {
  const RolesListView({super.key});

  @override
  State<RolesListView> createState() => _RolesListViewState();
}

class _RolesListViewState extends State<RolesListView> {
  final TextEditingController _searchController = TextEditingController();
  bool? _selectedIsActive;
  bool? _selectedIsSystemRole;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRoles();
    });
  }

  void _loadRoles() {
    final viewModel = Provider.of<RoleManagementViewModel>(context, listen: false);
    viewModel.listRoles(
      context,
      page: _currentPage,
      search: _searchController.text,
      isActive: _selectedIsActive,
      isSystemRole: _selectedIsSystemRole,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Role Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadRoles,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFiltersSection(),
          Expanded(
            child: Consumer<RoleManagementViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                        const SizedBox(height: 16),
                        Text(
                          viewModel.error!,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _loadRoles,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (viewModel.roles.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.admin_panel_settings_outlined,
                            size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No roles found',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: viewModel.roles.length,
                        itemBuilder: (context, index) {
                          final role = viewModel.roles[index];
                          return _buildRoleCard(role);
                        },
                      ),
                    ),
                    if (viewModel.pagination != null)
                      _buildPagination(viewModel.pagination!),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddRole,
        icon: const Icon(Icons.add),
        label: const Text('Add Role'),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }

  Widget _buildFiltersSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search roles...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  onSubmitted: (_) => _loadRoles(),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _loadRoles,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Search'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(
                  label: 'Active',
                  selected: _selectedIsActive == true,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIsActive = selected ? true : null;
                      _loadRoles();
                    });
                  },
                ),
                const SizedBox(width: 8),
                _buildFilterChip(
                  label: 'Inactive',
                  selected: _selectedIsActive == false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIsActive = selected ? false : null;
                      _loadRoles();
                    });
                  },
                ),
                const SizedBox(width: 8),
                _buildFilterChip(
                  label: 'System Roles',
                  selected: _selectedIsSystemRole == true,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIsSystemRole = selected ? true : null;
                      _loadRoles();
                    });
                  },
                ),
                const SizedBox(width: 8),
                _buildFilterChip(
                  label: 'Custom Roles',
                  selected: _selectedIsSystemRole == false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIsSystemRole = selected ? false : null;
                      _loadRoles();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool selected,
    required Function(bool) onSelected,
  }) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      selectedColor: Colors.purpleAccent.withValues(alpha: 0.2),
      checkmarkColor: Colors.purpleAccent,
    );
  }

  Widget _buildRoleCard(role) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _navigateToRoleDetails(role.id),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: role.isActive
                          ? Colors.purple.withValues(alpha: 0.1)
                          : Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.admin_panel_settings,
                      color: role.isActive ? Colors.purple : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                role.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (role.isSystemRole)
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'SYSTEM',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (role.description != null)
                          Text(
                            role.description!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  if (role.isActive)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'ACTIVE',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'INACTIVE',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.people, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    '${role.usersCount ?? 0} users',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    'Created: ${role.createdAt}',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPagination(pagination) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Page $_currentPage of ${pagination.totalPages}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              IconButton(
                onPressed: _currentPage > 1
                    ? () {
                        setState(() {
                          _currentPage--;
                        });
                        _loadRoles();
                      }
                    : null,
                icon: const Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: _currentPage < pagination.totalPages
                    ? () {
                        setState(() {
                          _currentPage++;
                        });
                        _loadRoles();
                      }
                    : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToAddRole() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddEditRoleView(),
      ),
    ).then((_) => _loadRoles());
  }

  void _navigateToRoleDetails(String roleId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoleDetailsView(roleId: roleId),
      ),
    ).then((_) => _loadRoles());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

