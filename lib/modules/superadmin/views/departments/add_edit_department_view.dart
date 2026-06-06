import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';
import 'package:drandme/modules/superadmin/viewmodels/department_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditDepartmentView extends StatefulWidget {
  final DepartmentModel? department;

  const AddEditDepartmentView({super.key, this.department});

  @override
  State<AddEditDepartmentView> createState() => _AddEditDepartmentViewState();
}

class _AddEditDepartmentViewState extends State<AddEditDepartmentView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  String? _selectedClinicId;
  bool _isActive = true;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  bool get isEditMode => widget.department != null;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _nameController = TextEditingController(
      text: widget.department?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.department?.description ?? '',
    );

    if (widget.department != null) {
      _selectedClinicId = widget.department!.clinicId;
      _isActive = widget.department!.isActive;
    }

    // Initialize animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationController.forward();

    // Load clinics when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
      clinicVM.fetchClinics(context);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _closePanel() async {
    await _animationController.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;
    final isTablet = screenWidth >= 480 && screenWidth < 1024;

    // Calculate panel width based on screen size
    double panelWidth;
    if (isMobile) {
      panelWidth = screenWidth * 0.85;
    } else if (isTablet) {
      panelWidth = 500;
    } else {
      panelWidth = 600;
    }

    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: _closePanel,
        child: Stack(
          children: [
            // Main content area (dismisses on tap)
            Container(color: Colors.transparent),
            // Right side panel
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: () {}, // Prevent closing when tapping inside panel
                  child: Container(
                    width: panelWidth,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: panelWidth,
                      minWidth: isMobile ? screenWidth * 0.85 : 500,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(-2, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header with close button
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B82F6),
                                      Color(0xFF60A5FA),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.category,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  isEditMode
                                      ? 'Edit Department'
                                      : 'Add Department',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: _closePanel,
                                icon: const Icon(Icons.close),
                                color: const Color(0xFF666666),
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ),
                        // Scrollable content
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Clinic Selection (only for create mode)
                                  if (!isEditMode) ...[
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                0xFF10B981,
                                              ).withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: const Icon(
                                              Icons.local_hospital,
                                              color: Color(0xFF10B981),
                                              size: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Select Clinic',
                                            style: TextStyle(
                                              fontSize: isMobile ? 14 : 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF333333),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            '*',
                                            style: TextStyle(
                                              color: Color(0xFFDC2626),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Consumer<ClinicViewModel>(
                                      builder: (context, clinicVM, child) {
                                        if (clinicVM.isLoading) {
                                          return const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }

                                        return DropdownButtonFormField<String>(
                                          value: _selectedClinicId,
                                          decoration: InputDecoration(
                                            hintText: 'Select a clinic',
                                            hintStyle: const TextStyle(
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 14,
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.local_hospital,
                                              size: 20,
                                              color: Color(0xFF666666),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 14,
                                                ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFE0E0E0),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFE0E0E0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color(0xFF3B82F6),
                                                width: 1.5,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          items: clinicVM.clinics.map((clinic) {
                                            return DropdownMenuItem<String>(
                                              value: clinic.id,
                                              child: Text(clinic.name),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedClinicId = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please select a clinic';
                                            }
                                            return null;
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 24),
                                  ],

                                  // Department Name
                                  _buildTextField(
                                    label: 'Department Name',
                                    hint: 'Enter department name',
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Department name is required';
                                      }
                                      if (value.trim().length < 2) {
                                        return 'Name must be at least 2 characters';
                                      }
                                      if (value.trim().length > 100) {
                                        return 'Name must not exceed 100 characters';
                                      }
                                      return null;
                                    },
                                    required: true,
                                    icon: Icons.category,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Description
                                  _buildTextField(
                                    label: 'Description',
                                    hint:
                                        'Enter department description (optional)',
                                    controller: _descriptionController,
                                    validator: null,
                                    required: false,
                                    icon: Icons.description,
                                    maxLines: 4,
                                    isMobile: isMobile,
                                  ),
                                  const SizedBox(height: 20),

                                  // Active Status (only for edit mode)
                                  if (isEditMode) ...[
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8F9FA),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: _isActive
                                                  ? const Color(
                                                      0xFF10B981,
                                                    ).withValues(alpha: 0.1)
                                                  : const Color(
                                                      0xFFEF4444,
                                                    ).withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Icon(
                                              _isActive
                                                  ? Icons.check_circle
                                                  : Icons.cancel,
                                              color: _isActive
                                                  ? const Color(0xFF10B981)
                                                  : const Color(0xFFEF4444),
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Department Status',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF333333),
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  _isActive
                                                      ? 'Department is active'
                                                      : 'Department is inactive',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF666666),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Switch(
                                            value: _isActive,
                                            onChanged: (value) {
                                              setState(() {
                                                _isActive = value;
                                              });
                                            },
                                            activeColor: const Color(
                                              0xFF10B981,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],

                                  const SizedBox(height: 12),

                                  // Action Buttons
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: _closePanel,
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              vertical: isMobile ? 14 : 16,
                                            ),
                                            side: const BorderSide(
                                              color: Color(0xFFE0E0E0),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF333333),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Consumer<DepartmentViewModel>(
                                          builder: (context, departmentVM, child) {
                                            final isProcessing = isEditMode
                                                ? departmentVM.isUpdating
                                                : departmentVM.isCreating;
                                            return ElevatedButton(
                                              onPressed: isProcessing
                                                  ? null
                                                  : () => _submitForm(context),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: isMobile ? 14 : 16,
                                                ),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: isProcessing
                                                  ? const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                              Color
                                                            >(Colors.white),
                                                      ),
                                                    )
                                                  : Text(
                                                      isEditMode
                                                          ? 'Update Department'
                                                          : 'Create Department',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required bool required,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
            if (required) ...[
              const SizedBox(width: 4),
              const Text(
                '*',
                style: TextStyle(
                  color: Color(0xFFDC2626),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFFB3B3B3),
              fontSize: isMobile ? 13 : 14,
            ),
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF666666)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF3B82F6),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFDC2626)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFDC2626),
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  void _submitForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final departmentVM = Provider.of<DepartmentViewModel>(
      context,
      listen: false,
    );

    bool success;
    if (isEditMode) {
      // Update department
      final input = UpdateDepartmentInput(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        isActive: _isActive,
      );
      success = await departmentVM.updateDepartment(
        widget.department!.id,
        input,
      );
    } else {
      // Create department
      if (_selectedClinicId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a clinic'),
            backgroundColor: Color(0xFFEF4444),
          ),
        );
        return;
      }

      final input = CreateDepartmentInput(
        clinicId: _selectedClinicId!,
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );
      success = await departmentVM.createDepartment(input);
    }

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEditMode
                  ? 'Department updated successfully'
                  : 'Department created successfully',
            ),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        _closePanel();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              departmentVM.error ??
                  (isEditMode
                      ? 'Failed to update department'
                      : 'Failed to create department'),
            ),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }
}
