import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/superadmin/viewmodels/role_management_viewmodel.dart';
import 'package:a/modules/superadmin/models/role_model.dart';
import 'dart:convert';

class AddEditRoleView extends StatefulWidget {
  final RoleModel? role;

  const AddEditRoleView({super.key, this.role});

  @override
  State<AddEditRoleView> createState() => _AddEditRoleViewState();
}

class _AddEditRoleViewState extends State<AddEditRoleView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  Map<String, dynamic> _permissions = {};

  @override
  void initState() {
    super.initState();
    if (widget.role != null) {
      _nameController.text = widget.role!.name;
      _descriptionController.text = widget.role!.description ?? '';
      _permissions = Map<String, dynamic>.from(widget.role!.permissions);
    } else {
      // Load permission templates
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final viewModel = Provider.of<RoleManagementViewModel>(
          context,
          listen: false,
        );
        viewModel.getPermissionTemplates(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.role != null;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          isEditMode ? 'Edit Role' : 'Create Role',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Role Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Role Name *',
                      hintText: 'e.g., Custom Admin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.admin_panel_settings),
                    ),
                    enabled: !isEditMode || !widget.role!.isSystemRole,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter role name';
                      }
                      if (value.length < 3) {
                        return 'Role name must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Describe this role',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.description),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Permissions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Configure what actions this role can perform',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  if (!isEditMode) _buildPermissionTemplates(),
                  const SizedBox(height: 16),
                  _buildPermissionsEditor(),
                  const SizedBox(height: 24),
                  Consumer<RoleManagementViewModel>(
                    builder: (context, viewModel, child) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              (isEditMode
                                  ? viewModel.isUpdating
                                  : viewModel.isCreating)
                              ? null
                              : _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.purpleAccent,
                            disabledBackgroundColor: Colors.grey,
                          ),
                          child:
                              (isEditMode
                                  ? viewModel.isUpdating
                                  : viewModel.isCreating)
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  isEditMode ? 'Update Role' : 'Create Role',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionTemplates() {
    return Consumer<RoleManagementViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoadingTemplates) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.permissionTemplates.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Use a template',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: viewModel.permissionTemplates.map((template) {
                return ActionChip(
                  label: Text(template.name),
                  onPressed: () {
                    setState(() {
                      _permissions = Map<String, dynamic>.from(
                        template.permissions,
                      );
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Applied ${template.name} template'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPermissionsEditor() {
    if (_permissions.isEmpty) {
      return Card(
        color: Colors.blue.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Icon(Icons.info_outline, color: Colors.blue, size: 48),
              const SizedBox(height: 8),
              Text(
                'No permissions configured yet',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showAddPermissionDialog,
                child: const Text('Add Permission'),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        ..._permissions.entries.map((entry) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                entry.key,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (entry.value is List)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (entry.value as List).map<Widget>((action) {
                            return Chip(
                              label: Text(action.toString()),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () {
                                setState(() {
                                  (entry.value as List).remove(action);
                                  if ((entry.value as List).isEmpty) {
                                    _permissions.remove(entry.key);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        )
                      else
                        Text(
                          entry.value.toString(),
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                _permissions.remove(entry.key);
                              });
                            },
                            icon: const Icon(Icons.delete, size: 18),
                            label: const Text('Remove'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: _showAddPermissionDialog,
          icon: const Icon(Icons.add),
          label: const Text('Add Permission'),
        ),
      ],
    );
  }

  Future<void> _showAddPermissionDialog() async {
    final resourceController = TextEditingController();
    final List<String> actions = [];
    final actionController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Add Permission'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: resourceController,
                    decoration: const InputDecoration(
                      labelText: 'Resource',
                      hintText: 'e.g., users, roles, clinics',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Actions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: actions.map((action) {
                      return Chip(
                        label: Text(action),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () {
                          setDialogState(() {
                            actions.remove(action);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: actionController,
                          decoration: const InputDecoration(
                            hintText: 'e.g., read, create, update',
                          ),
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              setDialogState(() {
                                actions.add(value);
                                actionController.clear();
                              });
                            }
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (actionController.text.isNotEmpty) {
                            setDialogState(() {
                              actions.add(actionController.text);
                              actionController.clear();
                            });
                          }
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (resourceController.text.isNotEmpty &&
                      actions.isNotEmpty) {
                    setState(() {
                      _permissions[resourceController.text] = actions;
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_permissions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one permission'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final viewModel = Provider.of<RoleManagementViewModel>(
      context,
      listen: false,
    );

    bool success;
    if (widget.role != null) {
      // Update role
      final updateModel = UpdateRoleModel(
        name: _nameController.text,
        description: _descriptionController.text.isNotEmpty
            ? _descriptionController.text
            : null,
        permissions: _permissions,
      );

      success = await viewModel.updateRole(
        context,
        widget.role!.id,
        updateModel,
      );
    } else {
      // Create role
      final createModel = CreateRoleModel(
        name: _nameController.text,
        description: _descriptionController.text.isNotEmpty
            ? _descriptionController.text
            : null,
        permissions: _permissions,
      );

      success = await viewModel.createRole(context, createModel);
    }

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.role != null
                ? 'Role updated successfully'
                : 'Role created successfully',
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop();
    } else if (mounted && viewModel.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(viewModel.error!), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
