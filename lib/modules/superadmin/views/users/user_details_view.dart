import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/superadmin/viewmodels/user_management_viewmodel.dart';
import 'package:a/modules/superadmin/views/users/add_edit_user_view.dart';
import 'package:a/modules/superadmin/views/users/assign_role_dialog.dart';

class UserDetailsView extends StatefulWidget {
  final String userId;

  const UserDetailsView({super.key, required this.userId});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserDetails();
    });
  }

  void _loadUserDetails() {
    final viewModel = Provider.of<UserManagementViewModel>(
      context,
      listen: false,
    );
    viewModel.getUser(context, widget.userId);
    viewModel.getUserActivityLogs(context, widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          Consumer<UserManagementViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.selectedUser != null) {
                return PopupMenuButton<String>(
                  onSelected: (value) =>
                      _handleAction(value, viewModel.selectedUser!),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 20),
                          SizedBox(width: 12),
                          Text('Edit User'),
                        ],
                      ),
                    ),
                    if (viewModel.selectedUser!.isBlocked)
                      const PopupMenuItem(
                        value: 'unblock',
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_open,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Unblock User',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      )
                    else
                      const PopupMenuItem(
                        value: 'block',
                        child: Row(
                          children: [
                            Icon(Icons.block, size: 20, color: Colors.red),
                            SizedBox(width: 12),
                            Text(
                              'Block User',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    if (viewModel.selectedUser!.isActive)
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
                      value: 'change_password',
                      child: Row(
                        children: [
                          Icon(Icons.lock_reset, size: 20),
                          SizedBox(width: 12),
                          Text('Change Password'),
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
                            'Delete User',
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
      body: Consumer<UserManagementViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoadingUser) {
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
                    onPressed: _loadUserDetails,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.selectedUser == null) {
            return const Center(child: Text('User not found'));
          }

          final user = viewModel.selectedUser!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserInfoCard(user),
                const SizedBox(height: 16),
                _buildRolesCard(user),
                const SizedBox(height: 16),
                _buildActivityLogsCard(viewModel),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserInfoCard(user) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: user.isActive
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.red.withValues(alpha: 0.2),
                  child: Text(
                    '${user.firstName[0]}${user.lastName[0]}'.toUpperCase(),
                    style: TextStyle(
                      color: user.isActive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@${user.username}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            _buildInfoRow(Icons.email, 'Email', user.email ?? 'Not provided'),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.phone, 'Phone', user.phone ?? 'Not provided'),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.calendar_today,
              'Date of Birth',
              user.dateOfBirth ?? 'Not provided',
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.people,
              'Gender',
              user.gender ?? 'Not provided',
            ),
            const Divider(height: 32),
            _buildStatusRow(user),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.access_time,
              'Last Login',
              user.lastLogin ?? 'Never',
            ),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.event, 'Created At', user.createdAt),
            if (user.isBlocked && user.blockedReason != null) ...[
              const Divider(height: 32),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.block, color: Colors.red, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Blocked Reason',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(user.blockedReason!),
                  ],
                ),
              ),
            ],
          ],
        ),
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

  Widget _buildStatusRow(user) {
    return Row(
      children: [
        Icon(Icons.circle, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Row(
                children: [
                  if (user.isBlocked)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'BLOCKED',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else if (user.isActive)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'INACTIVE',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRolesCard(user) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Assigned Roles',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _showAssignRoleDialog(),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Assign Role'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (user.roles == null || user.roles!.isEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey[600]),
                    const SizedBox(width: 12),
                    Text(
                      'No roles assigned',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
            else
              ...user.roles!.map((role) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blue.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.admin_panel_settings,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              role.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (role.description != null)
                              Text(
                                role.description!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: [
                                if (role.organizationId != null)
                                  _buildRoleDetailChip(
                                    'Org: ${role.organizationId}',
                                    Icons.business,
                                  ),
                                if (role.clinicId != null)
                                  _buildRoleDetailChip(
                                    'Clinic: ${role.clinicId}',
                                    Icons.local_hospital,
                                  ),
                                if (role.serviceId != null)
                                  _buildRoleDetailChip(
                                    'Service: ${role.serviceId}',
                                    Icons.medical_services,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => _confirmRemoveRole(role.id, role.name),
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        tooltip: 'Remove role',
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

  Widget _buildRoleDetailChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.blue),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildActivityLogsCard(viewModel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (viewModel.isLoadingLogs)
              const Center(child: CircularProgressIndicator())
            else if (viewModel.activityLogs.isEmpty)
              Text(
                'No activity logs',
                style: TextStyle(color: Colors.grey[600]),
              )
            else
              ...viewModel.activityLogs.take(5).map((log) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.history,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              log.actionType,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            log.createdAt,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        log.actionDescription,
                        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                      ),
                      if (log.performedByName != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'By: ${log.performedByName}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(String action, user) async {
    final viewModel = Provider.of<UserManagementViewModel>(
      context,
      listen: false,
    );

    switch (action) {
      case 'edit':
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => AddEditUserView(user: user),
              ),
            )
            .then((_) => _loadUserDetails());
        break;

      case 'block':
        final reason = await _showBlockDialog();
        if (reason != null && mounted) {
          final success = await viewModel.blockUser(
            context,
            widget.userId,
            reason,
          );
          if (success && mounted) {
            _showSuccessMessage('User blocked successfully');
            _loadUserDetails();
          }
        }
        break;

      case 'unblock':
        final confirmed = await _showConfirmDialog(
          'Unblock User',
          'Are you sure you want to unblock this user?',
        );
        if (confirmed && mounted) {
          final success = await viewModel.unblockUser(context, widget.userId);
          if (success && mounted) {
            _showSuccessMessage('User unblocked successfully');
            _loadUserDetails();
          }
        }
        break;

      case 'activate':
        final confirmed = await _showConfirmDialog(
          'Activate User',
          'Are you sure you want to activate this user?',
        );
        if (confirmed && mounted) {
          final success = await viewModel.activateUser(context, widget.userId);
          if (success && mounted) {
            _showSuccessMessage('User activated successfully');
            _loadUserDetails();
          }
        }
        break;

      case 'deactivate':
        final confirmed = await _showConfirmDialog(
          'Deactivate User',
          'Are you sure you want to deactivate this user?',
        );
        if (confirmed && mounted) {
          final success = await viewModel.deactivateUser(
            context,
            widget.userId,
          );
          if (success && mounted) {
            _showSuccessMessage('User deactivated successfully');
            _loadUserDetails();
          }
        }
        break;

      case 'change_password':
        final password = await _showPasswordDialog();
        if (password != null && mounted) {
          final success = await viewModel.adminChangePassword(
            context,
            widget.userId,
            password,
          );
          if (success && mounted) {
            _showSuccessMessage('Password changed successfully');
          }
        }
        break;

      case 'delete':
        final confirmed = await _showConfirmDialog(
          'Delete User',
          'Are you sure you want to delete this user? This action cannot be undone.',
        );
        if (confirmed && mounted) {
          final success = await viewModel.deleteUser(context, widget.userId);
          if (success && mounted) {
            _showSuccessMessage('User deleted successfully');
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

  Future<String?> _showBlockDialog() async {
    final controller = TextEditingController();
    return await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block User'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Reason',
            hintText: 'Enter reason for blocking',
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.length >= 5) {
                Navigator.of(context).pop(controller.text);
              }
            },
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }

  Future<String?> _showPasswordDialog() async {
    final controller = TextEditingController();
    return await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'New Password',
            hintText: 'Enter new password (min 8 characters)',
          ),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.length >= 8) {
                Navigator.of(context).pop(controller.text);
              }
            },
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  Future<void> _showAssignRoleDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AssignRoleDialog(userId: widget.userId),
    );

    if (result == true && mounted) {
      _loadUserDetails();
    }
  }

  Future<void> _confirmRemoveRole(String roleId, String roleName) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 12),
            Text('Remove Role'),
          ],
        ),
        content: Text(
          'Are you sure you want to remove the role "$roleName" from this user?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await _removeRole(roleId, roleName);
    }
  }

  Future<void> _removeRole(String roleId, String roleName) async {
    final viewModel = Provider.of<UserManagementViewModel>(
      context,
      listen: false,
    );

    final success = await viewModel.removeRole(context, widget.userId, roleId);

    if (success && mounted) {
      _showSuccessMessage('Role "$roleName" removed successfully');
      _loadUserDetails();
    } else if (mounted && viewModel.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(viewModel.error!), backgroundColor: Colors.red),
      );
    }
  }
}
