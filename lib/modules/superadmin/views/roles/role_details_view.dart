import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/superadmin/viewmodels/role_management_viewmodel.dart';
import 'package:drandme/modules/superadmin/views/roles/add_edit_role_view.dart';

class RoleDetailsView extends StatefulWidget {
  final String roleId;

  const RoleDetailsView({super.key, required this.roleId});

  @override
  State<RoleDetailsView> createState() => _RoleDetailsViewState();
}

class _RoleDetailsViewState extends State<RoleDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRoleDetails();
    });
  }

  void _loadRoleDetails() {
    final viewModel = Provider.of<RoleManagementViewModel>(
      context,
      listen: false,
    );
    viewModel.getRole(context, widget.roleId);
    viewModel.getRoleUsers(context, widget.roleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Role Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          Consumer<RoleManagementViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.selectedRole != null &&
                  !viewModel.selectedRole!.isSystemRole) {
                return PopupMenuButton<String>(
                  onSelected: (value) =>
                      _handleAction(value, viewModel.selectedRole!),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 20),
                          SizedBox(width: 12),
                          Text('Edit Role'),
                        ],
                      ),
                    ),
                    if (viewModel.selectedRole!.isActive)
                      const PopupMenuItem(
                        value: 'deactivate',
                        child: Row(
                          children: [
                            Icon(Icons.cancel, size: 20, color: Colors.orange),
                            SizedBox(width: 12),
                            Text(
                              'Deactivate',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                      )
                    else
                      const PopupMenuItem(
                        value: 'activate',
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Activate',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 20, color: Colors.red),
                          SizedBox(width: 12),
                          Text(
                            'Delete Role',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Consumer<RoleManagementViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoadingRole) {
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
                    onPressed: _loadRoleDetails,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.selectedRole == null) {
            return const Center(child: Text('Role not found'));
          }

          final role = viewModel.selectedRole!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRoleInfoCard(role),
                const SizedBox(height: 16),
                _buildPermissionsCard(role),
                const SizedBox(height: 16),
                _buildUsersCard(viewModel),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRoleInfoCard(role) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.admin_panel_settings,
                    color: Colors.purple,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (role.description != null)
                        Text(
                          role.description!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatChip(
                  icon: Icons.people,
                  label: 'Users',
                  value: '${role.usersCount ?? 0}',
                  color: Colors.blue,
                ),
                _buildStatChip(
                  icon: role.isActive ? Icons.check_circle : Icons.cancel,
                  label: 'Status',
                  value: role.isActive ? 'Active' : 'Inactive',
                  color: role.isActive ? Colors.green : Colors.red,
                ),
                _buildStatChip(
                  icon: role.isSystemRole ? Icons.shield : Icons.person,
                  label: 'Type',
                  value: role.isSystemRole ? 'System' : 'Custom',
                  color: role.isSystemRole ? Colors.orange : Colors.purple,
                ),
              ],
            ),
            const Divider(height: 32),
            _buildInfoRow(Icons.event, 'Created At', role.createdAt),
            if (role.updatedAt != null) ...[
              const SizedBox(height: 12),
              _buildInfoRow(Icons.update, 'Updated At', role.updatedAt!),
            ],
            if (role.isSystemRole) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 20),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'System roles cannot be modified or deleted',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionsCard(role) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Permissions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (role.permissions.isEmpty)
              Text(
                'No permissions configured',
                style: TextStyle(color: Colors.grey[600]),
              )
            else
              ...role.permissions.entries.map((entry) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.purple.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.purple.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (entry.value is List)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (entry.value as List).map<Widget>((action) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.purple.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                action.toString(),
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      else
                        Text(
                          entry.value.toString(),
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersCard(viewModel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Assigned Users',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (viewModel.isLoadingRoleUsers)
              const Center(child: CircularProgressIndicator())
            else if (viewModel.roleUsers.isEmpty)
              Text(
                'No users assigned to this role',
                style: TextStyle(color: Colors.grey[600]),
              )
            else
              ...viewModel.roleUsers.take(10).map((user) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: user.isActive
                            ? Colors.green.withValues(alpha: 0.2)
                            : Colors.red.withValues(alpha: 0.2),
                        child: Text(
                          '${user.firstName[0]}${user.lastName[0]}'
                              .toUpperCase(),
                          style: TextStyle(
                            color: user.isActive ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '@${user.username}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: user.isActive
                              ? Colors.green.withValues(alpha: 0.1)
                              : Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          user.isActive ? 'ACTIVE' : 'INACTIVE',
                          style: TextStyle(
                            color: user.isActive ? Colors.green : Colors.red,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(String action, role) async {
    final viewModel = Provider.of<RoleManagementViewModel>(
      context,
      listen: false,
    );

    switch (action) {
      case 'edit':
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => AddEditRoleView(role: role),
              ),
            )
            .then((_) => _loadRoleDetails());
        break;

      case 'activate':
        final confirmed = await _showConfirmDialog(
          'Activate Role',
          'Are you sure you want to activate this role?',
        );
        if (confirmed && mounted) {
          final success = await viewModel.activateRole(context, widget.roleId);
          if (success && mounted) {
            _showSuccessMessage('Role activated successfully');
            _loadRoleDetails();
          }
        }
        break;

      case 'deactivate':
        final confirmed = await _showConfirmDialog(
          'Deactivate Role',
          'Are you sure you want to deactivate this role?',
        );
        if (confirmed && mounted) {
          final success = await viewModel.deactivateRole(
            context,
            widget.roleId,
          );
          if (success && mounted) {
            _showSuccessMessage('Role deactivated successfully');
            _loadRoleDetails();
          }
        }
        break;

      case 'delete':
        final confirmed = await _showConfirmDialog(
          'Delete Role',
          'Are you sure you want to delete this role? This action cannot be undone.',
        );
        if (confirmed && mounted) {
          final success = await viewModel.deleteRole(context, widget.roleId);
          if (success && mounted) {
            _showSuccessMessage('Role deleted successfully');
            Navigator.of(context).pop();
          }
        }
        break;
    }
  }

  Future<bool> _showConfirmDialog(String title, String message) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Confirm'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}
