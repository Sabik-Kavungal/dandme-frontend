import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:drandme/modules/clinic/viewmodels/clinic_settings_viewmodel.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/impressive_appointment_container.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/beautiful_table_container.dart';

/// Simple SaaS-Style Clinic Settings Screen
/// Clean, minimal design with reduced spacing

// ============================================================================
// STYLE CONSTANTS
// ============================================================================

class SaaSStyles {
  // Simple Black, White & Gray Color Palette
  static const Color primaryColor = Color(0xFF000000); // Black
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textMuted = Color(0xFF999999);

  // Status Colors - Matching appointments dashboard
  static const Color activeColor = Color(0xFF2E7D32);
  static const Color activeDotColor = Color(0xFF4CAF50);
  static const Color activeBg = Color(0xFFE8F5E8);

  static const Color inactiveColor = Color(0xFFD32F2F);
  static const Color inactiveDotColor = Color(0xFFF44336);
  static const Color inactiveBg = Color(0xFFFFEBEE);

  static const Color leaveColor = Color(0xFFF57C00);
  static const Color leaveDotColor = Color(0xFFFFC107);
  static const Color leaveBg = Color(0xFFFFF3E0);
}

// ============================================================================
// MAIN WIDGET
// ============================================================================

class ClinicSettingsScreen extends StatefulWidget {
  final Function(String)? onNavigate;

  const ClinicSettingsScreen({super.key, this.onNavigate});

  @override
  State<ClinicSettingsScreen> createState() => _ClinicSettingsScreenState();
}

class _ClinicSettingsScreenState extends State<ClinicSettingsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load data on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<ClinicSettingsViewModel>();
      viewModel.loadClinicDoctors();
      viewModel.loadStaffMembers();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<ClinicSettingsViewModel>().searchDoctors(
      _searchController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClinicSettingsViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          color: const Color(0xFFF1F5F9),
          padding: const EdgeInsets.all(4),
          child: ImpressiveAppointmentContainer(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActionBar(viewModel),
                  const SizedBox(height: 12),
                  _buildStaffTable(viewModel),
                  const SizedBox(height: 16),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionBar(ClinicSettingsViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        if (isMobile) {
          return Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 8),
              SizedBox(width: double.infinity, child: _buildAddButton()),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: _buildSearchBar()),
            const SizedBox(width: 8),
            _buildAddButton(),
          ],
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: Color(0xFF64748B), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                hintText: 'Search staff members...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionButton('Add Staff', Icons.add, () async {
          await _showAddStaffSheet();
        }),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return SizedBox(
      height: 44,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 16),
        label: Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  // Two-step Add Staff: Step 1 → GET /admin/staff/roles, Step 2 → POST /admin/staff
  Future<void> _showAddStaffSheet() async {
    final viewModel = context.read<ClinicSettingsViewModel>();

    // Step 1: fetch roles (no-op if already cached)
    await viewModel.fetchStaffRoles();

    if (!mounted) return;

    // Controllers
    final firstNameCtrl = TextEditingController();
    final lastNameCtrl = TextEditingController();
    final usernameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final departmentCtrl = TextEditingController();
    final joiningDateCtrl = TextEditingController(); // displayed as text

    String? selectedStaffType; // snake_case value from StaffRole.name
    DateTime? selectedDate;
    bool isSubmitting = false;

    // Snapshot the (now-fetched) roles into a plain local list.
    // We do NOT read from viewModel inside StatefulBuilder because
    // StatefulBuilder does NOT listen to ChangeNotifier — reading
    // viewModel.staffRoles inside the builder would never refresh.
    List<StaffRole> availableRoles = List.from(viewModel.staffRoles);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Header ──────────────────────────────────────
                  Row(
                    children: [
                      const Text(
                        'Add Clinic Staff',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(ctx),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // ── Role Dropdown (Step 1 data) ──────────────────
                  const Text(
                    'Role / Staff Type *',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      border: Border.all(color: SaaSStyles.borderColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedStaffType,
                        hint: const Text(
                          'Select a role…',
                          style: TextStyle(
                            fontSize: 12,
                            color: SaaSStyles.textMuted,
                          ),
                        ),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                        style: const TextStyle(
                          fontSize: 13,
                          color: SaaSStyles.textPrimary,
                        ),
                        items: availableRoles.map((role) {
                          return DropdownMenuItem<String>(
                            value: role.name,
                            child: Text(role.displayLabel),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setModalState(() => selectedStaffType = val),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── Username * ───────────────────────────────────
                  _buildTextField(
                    'Username *',
                    'e.g. johndoe (min 3 chars)',
                    controller: usernameCtrl,
                  ),
                  const SizedBox(height: 12),

                  // ── Email ────────────────────────────────────────
                  _buildTextField(
                    'Email',
                    'john.doe@clinic.com',
                    controller: emailCtrl,
                  ),
                  const SizedBox(height: 12),

                  // ── Phone ────────────────────────────────────────
                  _buildTextField(
                    'Phone',
                    '10-digit number',
                    controller: phoneCtrl,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),

                  // ── Password * ───────────────────────────────────
                  _buildTextField(
                    'Password *',
                    'Min 8 characters',
                    controller: passwordCtrl,
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),

                  // ── Department ───────────────────────────────────
                  _buildTextField(
                    'Department',
                    'e.g. Front Desk',
                    controller: departmentCtrl,
                  ),
                  const SizedBox(height: 12),

                  // ── Joining Date (date picker) ────────────────────
                  const Text(
                    'Joining Date',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: ctx,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2035),
                      );
                      if (picked != null) {
                        setModalState(() {
                          selectedDate = picked;
                          joiningDateCtrl.text =
                              '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                        });
                      }
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        border: Border.all(color: SaaSStyles.borderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: SaaSStyles.textMuted,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            joiningDateCtrl.text.isEmpty
                                ? 'Select date (YYYY-MM-DD)'
                                : joiningDateCtrl.text,
                            style: TextStyle(
                              fontSize: 12,
                              color: joiningDateCtrl.text.isEmpty
                                  ? SaaSStyles.textMuted
                                  : SaaSStyles.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Submit ───────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: isSubmitting
                          ? null
                          : () async {
                              // Validate required fields
                              // First name is now optional as per documentation update.
                              if (usernameCtrl.text.trim().length < 3) {
                                _showSheetSnack(
                                  ctx,
                                  'Username must be at least 3 characters',
                                );
                                return;
                              }
                              if (passwordCtrl.text.length < 8) {
                                _showSheetSnack(
                                  ctx,
                                  'Password must be at least 8 characters',
                                );
                                return;
                              }
                              if (selectedStaffType == null) {
                                _showSheetSnack(ctx, 'Please select a role');
                                return;
                              }
                              final phone = phoneCtrl.text.trim();
                              if (phone.isNotEmpty && phone.length != 10) {
                                _showSheetSnack(
                                  ctx,
                                  'Phone must be exactly 10 digits',
                                );
                                return;
                              }

                              setModalState(() => isSubmitting = true);

                              final vm = ctx.read<ClinicSettingsViewModel>();
                              final success = await vm.createStaffMember(
                                firstName: firstNameCtrl.text.trim(),
                                lastName: lastNameCtrl.text.trim().isNotEmpty
                                    ? lastNameCtrl.text.trim()
                                    : null,
                                username: usernameCtrl.text.trim(),
                                email: emailCtrl.text.trim().isNotEmpty
                                    ? emailCtrl.text.trim()
                                    : null,
                                phone: phone.isNotEmpty ? phone : null,
                                password: passwordCtrl.text,
                                staffType: selectedStaffType!,
                                department:
                                    departmentCtrl.text.trim().isNotEmpty
                                    ? departmentCtrl.text.trim()
                                    : null,
                                joiningDate: joiningDateCtrl.text.isNotEmpty
                                    ? joiningDateCtrl.text
                                    : null,
                                permissions: const [],
                              );

                              if (ctx.mounted) {
                                setModalState(() => isSubmitting = false);
                                if (success) {
                                  Navigator.pop(ctx);
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${_formatRoleName(selectedStaffType!)} added successfully',
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  _showSheetSnack(
                                    ctx,
                                    vm.error.isNotEmpty
                                        ? vm.error
                                        : 'Failed to add staff',
                                  );
                                }
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Add Member',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Formats a snake_case role name into Title Case for display.
  String _formatRoleName(String name) {
    return name
        .split('_')
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() + w.substring(1) : w)
        .join(' ');
  }

  /// Shows a SnackBar from within a bottom sheet context.
  void _showSheetSnack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg)));
  }

  Widget _buildTextField(
    String label,
    String hint, {
    TextEditingController? controller,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            border: Border.all(color: SaaSStyles.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: SaaSStyles.textMuted,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // DOCTORS TABLE
  // ============================================================================

  // ============================================================================
  // STAFF TABLE
  // ============================================================================

  Widget _buildStaffTable(ClinicSettingsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'All Staff Members',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SaaSStyles.textPrimary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: SaaSStyles.activeBg,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${viewModel.staffMembers.length} staff',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: SaaSStyles.activeColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (viewModel.staffMembers.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "No staff members found.",
                style: TextStyle(color: SaaSStyles.textSecondary),
              ),
            ),
          )
        else
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _buildMobileStaffListView(viewModel);
              }
              return BeautifulTableContainer(
                isTablet: constraints.maxWidth < 900,
                child: _buildDesktopStaffTable(
                  context,
                  constraints.maxWidth,
                  viewModel,
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildDesktopStaffTable(
    BuildContext context,
    double maxWidth,
    ClinicSettingsViewModel viewModel,
  ) {
    const double minTableWidth = 700.0;

    final tableWidget = Theme(
      data: Theme.of(context).copyWith(
        dividerColor: const Color(0xFFE2E8F0),
        dataTableTheme: DataTableThemeData(
          headingRowColor: WidgetStateProperty.all(const Color(0xFFF8F9FA)),
          dataRowColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              return const Color(0xFF3B82F6).withOpacity(0.05);
            }
            return null;
          }),
        ),
      ),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
        headingRowHeight: 44,
        horizontalMargin: maxWidth < 1200 ? 24 : 32,
        columnSpacing: maxWidth < 1200 ? 24 : 32,
        headingTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
        dataTextStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xFF1E293B),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
        dataRowMinHeight: 60,
        dataRowMaxHeight: 60,
        columns: const [
          DataColumn(label: _TableHeader('ID')),
          DataColumn(label: _TableHeader('STAFF NAME')),
          DataColumn(label: _TableHeader('ROLE')),
          DataColumn(label: _TableHeader('CONTACT')),
          DataColumn(label: _TableHeader('STATUS')),
          DataColumn(label: Text('')),
        ],
        rows: viewModel.staffMembers
            .asMap()
            .entries
            .map(
              (entry) =>
                  _buildStaffDataRow(context, entry.key + 1, entry.value),
            )
            .toList(),
        showBottomBorder: false,
        dividerThickness: 0,
      ),
    );

    if (maxWidth < minTableWidth) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(width: minTableWidth, child: tableWidget),
      );
    }

    return SizedBox(width: maxWidth, child: tableWidget);
  }

  DataRow _buildStaffDataRow(BuildContext context, int index, dynamic staff) {
    return DataRow(
      cells: [
        DataCell(
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            ),
            alignment: Alignment.center,
            child: Text(
              index.toString().padLeft(2, '0'),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF475569),
                fontSize: 12,
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getDefaultColor(staff.fullName),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    staff.initial,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _getTextColor(_getDefaultColor(staff.fullName)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                staff.fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFBFDBFE), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.badge_outlined,
                  size: 12,
                  color: Color(0xFF2563EB),
                ),
                const SizedBox(width: 4),
                Text(
                  staff.displayRole,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF1D4ED8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 12,
                    color: Color(0xFF64748B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    staff.displayEmail,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF334155),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.phone_outlined,
                    size: 12,
                    color: Color(0xFF64748B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    staff.displayPhone,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(_buildStatusBadge('Active')),
        DataCell(
          IconButton(
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1464748B),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.visibility_outlined,
                size: 16,
                color: Color(0xFF64748B),
              ),
            ),
            padding: EdgeInsets.zero,
            onPressed: staff.id != null
                ? () => _showStaffDetailsDialog(context, staff.id!)
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileStaffListView(ClinicSettingsViewModel viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.staffMembers.length,
      itemBuilder: (context, index) {
        final staff = viewModel.staffMembers[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: staff.id != null
                  ? () => _showStaffDetailsDialog(context, staff.id!)
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _getDefaultColor(staff.fullName),
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          staff.initial,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: _getTextColor(
                              _getDefaultColor(staff.fullName),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            staff.fullName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFFBFDBFE),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              staff.displayRole,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF1D4ED8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Color(0xFFCBD5E1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    Color bgColor;

    switch (status) {
      case 'Active':
        color = const Color(0xFF10B981);
        bgColor = const Color(0xFFD1FAE5);
        break;
      case 'Inactive':
        color = const Color(0xFFEF4444);
        bgColor = const Color(0xFFFEE2E2);
        break;
      case 'On leave':
        color = const Color(0xFFF59E0B);
        bgColor = const Color(0xFFFEF3C7);
        break;
      default:
        color = const Color(0xFF64748B);
        bgColor = const Color(0xFFF1F5F9);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            status,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Color _getDefaultColor(String name) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFEBEE),
      const Color(0xFFFFF3E0),
      const Color(0xFFF3E5F5),
    ];
    final index = name.isNotEmpty ? name.hashCode % colors.length : 0;
    return colors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    if (backgroundColor == const Color(0xFFE3F2FD))
      return const Color(0xFF1976D2);
    if (backgroundColor == const Color(0xFFFFEBEE))
      return const Color(0xFFD32F2F);
    if (backgroundColor == const Color(0xFFFFF3E0))
      return const Color(0xFFFF9800);
    if (backgroundColor == const Color(0xFFF3E5F5))
      return const Color(0xFF7B1FA2);
    return const Color(0xFF4CAF50);
  }

  Future<void> _showStaffDetailsDialog(
    BuildContext context,
    String staffId,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    final viewModel = context.read<ClinicSettingsViewModel>();
    final details = await viewModel.getStaffDetails(staffId);

    if (context.mounted) {
      Navigator.pop(context); // close loader
    }

    if (details == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load staff details')),
        );
      }
      return;
    }

    if (!context.mounted) return;

    // Show modern detail/edit dialog
    showDialog(
      context: context,
      builder: (context) => _StaffManagementDialog(staff: details),
    );
  }

  // ============================================================================
  // FOOTER
  // ============================================================================

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 Dr&Me. All rights reserved.',
        style: TextStyle(fontSize: 11, color: SaaSStyles.textMuted),
      ),
    );
  }
}

// ============================================================================
// STAFF MANAGEMENT DIALOG
// ============================================================================

class _StaffManagementDialog extends StatefulWidget {
  final StaffMember staff;

  const _StaffManagementDialog({required this.staff});

  @override
  State<_StaffManagementDialog> createState() => _StaffManagementDialogState();
}

class _StaffManagementDialogState extends State<_StaffManagementDialog> {
  bool _isEditing = false;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _departmentController;
  late String _selectedRole;
  late bool _isActive;
  late List<String> _permissions;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.staff.firstName);
    _lastNameController = TextEditingController(text: widget.staff.lastName);
    _emailController = TextEditingController(text: widget.staff.email);
    _phoneController = TextEditingController(text: widget.staff.phone);
    _passwordController = TextEditingController();
    _departmentController = TextEditingController(
      text: widget.staff.department ?? '',
    );
    _selectedRole = widget.staff.role;
    _isActive = widget.staff.isActive;
    _permissions = List.from(widget.staff.permissions);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    setState(() => _isSaving = true);
    final viewModel = context.read<ClinicSettingsViewModel>();

    final request = UpdateStaffRequest(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      password: _passwordController.text.isNotEmpty
          ? _passwordController.text
          : null,
      staffType: _selectedRole,
      department: _departmentController.text.isNotEmpty
          ? _departmentController.text
          : null,
      isActive: _isActive,
      permissions: _permissions,
    );

    final success = await viewModel.updateStaffMember(
      widget.staff.userId ?? widget.staff.id ?? '',
      request,
    );

    if (context.mounted) {
      setState(() => _isSaving = false);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Staff profile updated successfully!'),
            backgroundColor: SaaSStyles.activeColor,
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 32,
        vertical: isMobile ? 12 : 48,
      ),
      child: Container(
        width: isMobile ? double.infinity : 700,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Header Section
            _buildHeader(),

            // 2. Main Content (Scrollable)
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    if (!_isEditing) _buildViewProfile() else _buildEditForm(),
                  ],
                ),
              ),
            ),

            // 3. Footer Action Bar
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF8FAFC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: Row(
        children: [
          _buildAvatar(widget.staff.fullName, widget.staff.initial, 64),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.staff.fullName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _buildRoleBadge(_selectedRole),
                    const SizedBox(width: 8),
                    _buildStatusBadge(_isActive),
                  ],
                ),
              ],
            ),
          ),
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Color(0xFF64748B)),
              onPressed: () => setState(() => _isEditing = true),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String name, String initial, double size) {
    final avatarColor = _getDefaultColor(name);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: avatarColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          initial,
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.w800,
            color: _getTextColor(avatarColor),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleBadge(String role) {
    Color color;
    switch (role.toLowerCase()) {
      case 'doctor':
        color = const Color(0xFF8B5CF6);
        break;
      case 'pharmacist':
        color = const Color(0xFF10B981);
        break;
      case 'nurse':
        color = const Color(0xFFF59E0B);
        break;
      case 'receptionist':
        color = const Color(0xFF3B82F6);
        break;
      default:
        color = const Color(0xFF64748B);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        role.replaceAll('_', ' ').toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    final color = isActive ? const Color(0xFF10B981) : const Color(0xFFEF4444);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            isActive ? 'ACTIVE' : 'INACTIVE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Staff Overview'),
        const SizedBox(height: 16),
        _buildDetailGrid(),
        const SizedBox(height: 32),
        _buildSectionTitle('Access Permissions'),
        const SizedBox(height: 16),
        _buildPermissionsList(false),
      ],
    );
  }

  Widget _buildDetailGrid() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        _buildInfoItem(
          Icons.alternate_email_rounded,
          'Username',
          widget.staff.username,
        ),
        _buildInfoItem(
          Icons.email_outlined,
          'Email Address',
          widget.staff.displayEmail,
        ),
        _buildInfoItem(
          Icons.phone_outlined,
          'Phone Number',
          widget.staff.displayPhone,
        ),
        _buildInfoItem(
          Icons.business_rounded,
          'Department',
          widget.staff.department ?? 'Not Assigned',
        ),
        _buildInfoItem(
          Icons.calendar_today_rounded,
          'Joining Date',
          widget.staff.joiningDate ?? 'Not Set',
        ),
        _buildInfoItem(
          Icons.history_rounded,
          'Member Since',
          widget.staff.createdAt != null
              ? '${widget.staff.createdAt!.day}/${widget.staff.createdAt!.month}/${widget.staff.createdAt!.year}'
              : 'Unknown',
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return SizedBox(
      width: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF94A3B8)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF94A3B8),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Personal Information'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildTextField('First Name', _firstNameController),
            ),
            const SizedBox(width: 16),
            Expanded(child: _buildTextField('Last Name', _lastNameController)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                'Email',
                _emailController,
                icon: Icons.email_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextField(
                'Phone',
                _phoneController,
                icon: Icons.phone_outlined,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        _buildSectionTitle('Security'),
        const SizedBox(height: 16),
        _buildTextField(
          'New Password',
          _passwordController,
          isPassword: true,
          helperText: 'Leave empty to keep current password',
        ),
        const SizedBox(height: 32),
        _buildSectionTitle('Professional Details'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildRoleDropdown()),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextField(
                'Department',
                _departmentController,
                icon: Icons.business_outlined,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        _buildSectionTitle('Permissions & Access'),
        const SizedBox(height: 16),
        _buildPermissionsList(true),
        const SizedBox(height: 32),
        _buildSectionTitle('Account Status'),
        const SizedBox(height: 12),
        SwitchListTile(
          value: _isActive,
          onChanged: (v) => setState(() => _isActive = v),
          title: Text(_isActive ? 'Account Active' : 'Account Deactivated'),
          subtitle: Text(
            _isActive
                ? 'Staff can login and perform allowed actions.'
                : 'Access is completely restricted.',
          ),
          activeColor: SaaSStyles.activeColor,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E293B),
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(child: Divider(color: Color(0xFFF1F5F9))),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    IconData? icon,
    bool isPassword = false,
    String? helperText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: icon != null ? Icon(icon, size: 18) : null,
            hintText: 'Enter ${label.toLowerCase()}',
            helperText: helperText,
            helperStyle: const TextStyle(fontSize: 10),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF3B82F6),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'STAFF ROLE',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedRole,
              items:
                  [
                        'doctor',
                        'nurse',
                        'pharmacist',
                        'receptionist',
                        'lab_technician',
                        'billing_staff',
                      ]
                      .map(
                        (r) => DropdownMenuItem(
                          value: r,
                          child: Text(
                            r.replaceAll('_', ' ').toUpperCase(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (v) => setState(() => _selectedRole = v!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionsList(bool editable) {
    const allPerms = {
      'view_patient_history': 'View Patient History',
      'manage_inventory': 'Manage Inventory',
      'process_billing': 'Process Billing',
      'access_reports': 'Access Reports',
      'manage_appointments': 'Manage Appointments',
    };

    if (!editable && _permissions.isEmpty) {
      return const Text(
        'No special permissions assigned.',
        style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: allPerms.entries.map((e) {
        final isSelected = _permissions.contains(e.key);
        if (!editable && !isSelected) return const SizedBox.shrink();

        return InkWell(
          onTap: editable
              ? () {
                  setState(() {
                    if (isSelected)
                      _permissions.remove(e.key);
                    else
                      _permissions.add(e.key);
                  });
                }
              : null,
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFFE2E8F0),
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected
                      ? Icons.check_circle_rounded
                      : Icons.add_circle_outline_rounded,
                  size: 16,
                  color: isSelected
                      ? const Color(0xFF3B82F6)
                      : const Color(0xFF94A3B8),
                ),
                const SizedBox(width: 8),
                Text(
                  e.value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? const Color(0xFF1E40AF)
                        : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        border: Border(top: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          if (_isEditing)
            ElevatedButton(
              onPressed: _isSaving ? null : _handleSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F172A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: _isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Save Changes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
            ),
        ],
      ),
    );
  }

  Color _getDefaultColor(String name) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFEBEE),
      const Color(0xFFFFF3E0),
      const Color(0xFFF3E5F5),
    ];
    final index = name.isNotEmpty ? name.hashCode % colors.length : 0;
    return colors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    if (backgroundColor == const Color(0xFFE3F2FD))
      return const Color(0xFF1976D2);
    if (backgroundColor == const Color(0xFFFFEBEE))
      return const Color(0xFFD32F2F);
    if (backgroundColor == const Color(0xFFFFF3E0))
      return const Color(0xFFFF9800);
    if (backgroundColor == const Color(0xFFF3E5F5))
      return const Color(0xFF7B1FA2);
    return const Color(0xFF4CAF50);
  }
}

class _ClassicStaffCard extends StatefulWidget {
  final dynamic staff;
  final VoidCallback onTap;

  const _ClassicStaffCard({Key? key, required this.staff, required this.onTap})
    : super(key: key);

  @override
  State<_ClassicStaffCard> createState() => _ClassicStaffCardState();
}

class _ClassicStaffCardState extends State<_ClassicStaffCard> {
  bool _isHovered = false;

  static const _defaultShadow = [
    BoxShadow(color: Color(0x08000000), blurRadius: 2, offset: Offset(0, 1)),
  ];

  static const _hoverShadow = [
    BoxShadow(color: Color(0x1F6366F1), blurRadius: 8, offset: Offset(0, 4)),
  ];

  Color _getDefaultColor(String name) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFEBEE),
      const Color(0xFFFFF3E0),
      const Color(0xFFF3E5F5),
    ];
    final index = name.isNotEmpty ? name.hashCode % colors.length : 0;
    return colors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    if (backgroundColor == const Color(0xFFE3F2FD))
      return const Color(0xFF1976D2);
    if (backgroundColor == const Color(0xFFFFEBEE))
      return const Color(0xFFD32F2F);
    if (backgroundColor == const Color(0xFFFFF3E0))
      return const Color(0xFFFF9800);
    if (backgroundColor == const Color(0xFFF3E5F5))
      return const Color(0xFF7B1FA2);
    return const Color(0xFF4CAF50);
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.staff.fullName.trim();
    final role = widget.staff.displayRole;

    final borderColor = _isHovered
        ? const Color(0xFF3B82F6).withValues(alpha: 0.5)
        : const Color(0xFFE2E8F0);
    final avatarColor = _getDefaultColor(name);

    return RepaintBoundary(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: borderColor, width: 1),
              boxShadow: _isHovered ? _hoverShadow : _defaultShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Top Section (Medical Profile Banner)
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: avatarColor.withValues(alpha: 0.3),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Medical Watermark
                        Positioned(
                          right: -10,
                          top: -10,
                          child: Icon(
                            Icons.monitor_heart_outlined,
                            size: 80,
                            color: avatarColor.withValues(alpha: 0.5),
                          ),
                        ),
                        // Status Badge
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFDF5),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: const Color(0xFF10B981),
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF10B981),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 3),
                                const Text(
                                  "Active",
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF047857),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Overlapping Avatar
                        Positioned(
                          left: 12,
                          bottom: -24,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: avatarColor,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                name.isNotEmpty ? name[0].toUpperCase() : "S",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: _getTextColor(avatarColor),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. Info Section
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                      top: 32.0,
                      bottom: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E293B),
                            fontFamily: 'Inter',
                            height: 1.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.badge_outlined,
                              size: 10,
                              color: Color(0xFF3B82F6),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                role.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF3B82F6),
                                  letterSpacing: 0.5,
                                  fontFamily: 'Inter',
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "View Profile",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF3B82F6),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: _isHovered
                                  ? const Color(0xFF3B82F6)
                                  : const Color(0xFF64758B),
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

class _TableHeader extends StatelessWidget {
  final String title;

  const _TableHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 11,
          color: Color(0xFF64748B),
          letterSpacing: 1.2,
          fontFamily: 'Inter',
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
