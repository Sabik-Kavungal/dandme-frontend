import 'package:a/modules/superadmin/models/department_model.dart';
import 'package:a/modules/superadmin/viewmodels/department_viewmodel.dart';
import 'package:a/modules/superadmin/views/departments/add_edit_department_view.dart';
import 'package:a/modules/superadmin/views/departments/department_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepartmentsListView extends StatefulWidget {
  const DepartmentsListView({super.key});

  @override
  State<DepartmentsListView> createState() => _DepartmentsListViewState();
}

class _DepartmentsListViewState extends State<DepartmentsListView> {
  String _searchQuery = '';
  bool _showOnlyActive = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final departmentVM = Provider.of<DepartmentViewModel>(
        context,
        listen: false,
      );
      departmentVM.fetchDepartments(context, onlyActive: _showOnlyActive);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;
    final isTablet = screenWidth >= 480 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.category,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Departments',
                            style: TextStyle(
                              fontSize: isMobile ? 20 : 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Manage clinic departments',
                            style: TextStyle(
                              fontSize: isMobile ? 13 : 14,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isMobile)
                      ElevatedButton.icon(
                        onPressed: () => _showAddDepartmentPanel(context),
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text('Add Department'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                // Search and Filter Bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search departments...',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB3B3B3),
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Color(0xFF666666),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFF3B82F6),
                              width: 1.5,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Filter button
                    Container(
                      decoration: BoxDecoration(
                        color: _showOnlyActive
                            ? const Color(0xFF3B82F6)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _showOnlyActive
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFFE0E0E0),
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            setState(() {
                              _showOnlyActive = !_showOnlyActive;
                            });
                            final departmentVM =
                                Provider.of<DepartmentViewModel>(
                                  context,
                                  listen: false,
                                );
                            departmentVM.fetchDepartments(
                              context,
                              onlyActive: _showOnlyActive,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_list,
                                  size: 20,
                                  color: _showOnlyActive
                                      ? Colors.white
                                      : const Color(0xFF666666),
                                ),
                                if (!isMobile) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    'Active Only',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _showOnlyActive
                                          ? Colors.white
                                          : const Color(0xFF666666),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Consumer<DepartmentViewModel>(
              builder: (context, departmentVM, child) {
                if (departmentVM.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (departmentVM.error != null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error loading departments',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            departmentVM.error!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              departmentVM.clearError();
                              departmentVM.fetchDepartments(
                                context,
                                onlyActive: _showOnlyActive,
                              );
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3B82F6),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final filteredDepartments = departmentVM.departments.where((
                  dept,
                ) {
                  if (_searchQuery.isEmpty) return true;
                  final searchLower = _searchQuery.toLowerCase();
                  return dept.name.toLowerCase().contains(searchLower) ||
                      (dept.clinicName?.toLowerCase().contains(searchLower) ??
                          false) ||
                      (dept.description?.toLowerCase().contains(searchLower) ??
                          false);
                }).toList();

                if (filteredDepartments.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF3B82F6,
                              ).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.category_outlined,
                              color: Color(0xFF3B82F6),
                              size: 48,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _searchQuery.isEmpty
                                ? 'No departments found'
                                : 'No matching departments',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _searchQuery.isEmpty
                                ? 'Start by adding your first department'
                                : 'Try adjusting your search criteria',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                          ),
                          if (_searchQuery.isEmpty) ...[
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () => _showAddDepartmentPanel(context),
                              icon: const Icon(Icons.add),
                              label: const Text('Add Department'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3B82F6),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await departmentVM.fetchDepartments(
                      context,
                      onlyActive: _showOnlyActive,
                    );
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.all(isMobile ? 16 : 24),
                    itemCount: filteredDepartments.length,
                    itemBuilder: (context, index) {
                      final department = filteredDepartments[index];
                      return _buildDepartmentCard(
                        context,
                        department,
                        isMobile,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () => _showAddDepartmentPanel(context),
              backgroundColor: const Color(0xFF3B82F6),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildDepartmentCard(
    BuildContext context,
    DepartmentModel department,
    bool isMobile,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DepartmentDetailsView(departmentId: department.id),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 20),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.category,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              department.name,
                              style: TextStyle(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: department.isActive
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFFEF4444),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              department.isActive ? 'Active' : 'Inactive',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (department.clinicName != null)
                        Row(
                          children: [
                            const Icon(
                              Icons.local_hospital,
                              size: 14,
                              color: Color(0xFF666666),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                department.clinicName!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (department.description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          department.description!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Actions
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF666666)),
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showEditDepartmentPanel(context, department);
                    } else if (value == 'delete') {
                      _showDeleteDialog(context, department);
                    } else if (value == 'view') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DepartmentDetailsView(
                            departmentId: department.id,
                          ),
                        ),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'view',
                      child: Row(
                        children: [
                          Icon(Icons.visibility, size: 18),
                          SizedBox(width: 12),
                          Text('View Details'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 12),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 12),
                          Text('Delete', style: TextStyle(color: Colors.red)),
                        ],
                      ),
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

  void _showAddDepartmentPanel(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddEditDepartmentView(),
        opaque: false,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _showEditDepartmentPanel(
    BuildContext context,
    DepartmentModel department,
  ) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddEditDepartmentView(department: department),
        opaque: false,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, DepartmentModel department) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Department'),
        content: Text(
          'Are you sure you want to delete "${department.name}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final departmentVM = Provider.of<DepartmentViewModel>(
                context,
                listen: false,
              );
              final success = await departmentVM.deleteDepartment(
                context,
                department.id,
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Department deleted successfully'
                          : 'Failed to delete department',
                    ),
                    backgroundColor: success
                        ? const Color(0xFF10B981)
                        : const Color(0xFFEF4444),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
