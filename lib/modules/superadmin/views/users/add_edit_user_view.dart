import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/superadmin/viewmodels/user_management_viewmodel.dart';
import 'package:drandme/modules/superadmin/models/user_model_admin.dart';

class AddEditUserView extends StatefulWidget {
  final UserModelAdmin? user;

  const AddEditUserView({super.key, this.user});

  @override
  State<AddEditUserView> createState() => _AddEditUserViewState();
}

class _AddEditUserViewState extends State<AddEditUserView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  String? _selectedGender;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _firstNameController.text = widget.user!.firstName ?? '';
      _lastNameController.text = widget.user!.lastName ?? '';
      _emailController.text = widget.user!.email ?? '';
      _usernameController.text = widget.user!.username;
      _phoneController.text = widget.user!.phone ?? '';
      _dateOfBirthController.text = widget.user!.dateOfBirth ?? '';
      _selectedGender = widget.user!.gender;
      _isActive = widget.user!.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.user != null;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          isEditMode ? 'Edit User' : 'Add User',
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
                    'Personal Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                    enabled: !isEditMode, // Username cannot be edited
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      if (value.length < 3) {
                        return 'Username must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateOfBirthController,
                    decoration: InputDecoration(
                      labelText: 'Date of Birth (YYYY-MM-DD)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.people),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'male', child: Text('Male')),
                      DropdownMenuItem(value: 'female', child: Text('Female')),
                      DropdownMenuItem(value: 'other', child: Text('Other')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  if (!isEditMode) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Security',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password *',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                  const SizedBox(height: 24),
                  const Text(
                    'Status',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Active'),
                    subtitle: const Text(
                      'User can login and access the system',
                    ),
                    value: _isActive,
                    onChanged: (value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  Consumer<UserManagementViewModel>(
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
                            backgroundColor: Colors.blueAccent,
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
                                  isEditMode ? 'Update User' : 'Create User',
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

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final viewModel = Provider.of<UserManagementViewModel>(
      context,
      listen: false,
    );

    bool success;
    if (widget.user != null) {
      // Update user
      final updateModel = UpdateUserModelAdmin(
        firstName: _firstNameController.text.isNotEmpty
            ? _firstNameController.text
            : null,
        lastName: _lastNameController.text.isNotEmpty
            ? _lastNameController.text
            : null,
        email: _emailController.text.isNotEmpty ? _emailController.text : null,
        phone: _phoneController.text.isNotEmpty ? _phoneController.text : null,
        dateOfBirth: _dateOfBirthController.text.isNotEmpty
            ? _dateOfBirthController.text
            : null,
        gender: _selectedGender,
      );

      success = await viewModel.updateUser(
        context,
        widget.user!.id,
        updateModel,
      );
    } else {
      // Create user
      final createModel = CreateUserModelAdmin(
        firstName: _firstNameController.text.isNotEmpty
            ? _firstNameController.text
            : null,
        lastName: _lastNameController.text.isNotEmpty
            ? _lastNameController.text
            : null,
        email: _emailController.text.isNotEmpty ? _emailController.text : null,
        username: _usernameController.text,
        phone: _phoneController.text.isNotEmpty ? _phoneController.text : null,
        password: _passwordController.text,
        dateOfBirth: _dateOfBirthController.text.isNotEmpty
            ? _dateOfBirthController.text
            : null,
        gender: _selectedGender,
        isActive: _isActive,
      );

      success = await viewModel.createUser(context, createModel);
    }

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.user != null
                ? 'User updated successfully'
                : 'User created successfully',
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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }
}
