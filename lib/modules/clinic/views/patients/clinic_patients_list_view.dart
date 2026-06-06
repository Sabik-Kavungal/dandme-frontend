import 'package:drandme/modules/clinic/views/doctors/clinic_doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'package:drandme/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:drandme/modules/clinic/views/patients/patient_detail_modal.dart';
import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_patients_viewmodel.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/beautiful_table_container.dart';
import 'package:drandme/modules/clinic/views/appointments/constants/dashboard_constants.dart';
import 'package:drandme/modules/clinic/views/appointments/helpers/dashboard_helpers.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

class ClinicPatientsListView extends StatefulWidget {
  final Function(String)? onNavigate;

  const ClinicPatientsListView({super.key, this.onNavigate});

  @override
  State<ClinicPatientsListView> createState() => _ClinicPatientsListViewState();
}

class _ClinicPatientsListViewState extends State<ClinicPatientsListView> {
  late ClinicPatientsViewModel _viewModel;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<ClinicPatientsViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadPatients();
    });
  }

  void _navigateToPatientDetails(ClinicPatient patient) {
    if (widget.onNavigate != null) {
      widget.onNavigate!('patient_details:${patient.id}');
    } else {
      // Fallback
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => PatientDetailModal(patient: patient),
      );
    }
  }

  List<ClinicPatient> get _filteredPatients {
    final patients = _viewModel.patients;
    if (_searchQuery.isEmpty) return patients;

    return patients.where((patient) {
      final fullName = '${patient.firstName} ${patient.lastName}'.toLowerCase();
      final phone = patient.phone.toLowerCase();
      final searchLower = _searchQuery.toLowerCase();

      return fullName.contains(searchLower) ||
          phone.contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ClinicPatientsViewModel>(context);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = DashboardHelpers.isMobile(constraints);
        final isTablet = DashboardHelpers.isTablet(constraints);

        return Material(
          color: DashboardConstants.backgroundColor,
          child: Column(
            children: [
              // Controls Section (Tabs row style)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : (isTablet ? 16 : 24),
                  vertical: 8,
                ),
                child: _buildHeaderRow(context, isTablet),
              ),
              
              Divider(
                color: DashboardConstants.borderColor,
                thickness: 1,
                height: 1,
              ),

              // Search Bar Row (Filter row style)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : (isTablet ? 16 : 24),
                  vertical: 8,
                ),
                child: _buildSearchRow(isTablet),
              ),

              // Table Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : (isTablet ? 16 : 24),
                  ),
                  child: _buildMainContent(isMobile, isTablet, constraints),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderRow(BuildContext context, bool isTablet) {
    return Row(
      children: [
        const Spacer(),
        // New Patient Button
        SizedBox(
          height: 32,
          child: ElevatedButton.icon(
            onPressed: () async {
              final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
              final token = authViewModel.accessToken;
              final clinicId = authViewModel.user?.clinicId;
              if (token == null || clinicId == null) return;
              
              final added = await showDialog<bool>(
                context: context,
                builder: (_) => _AddPatientDialog(
                  repository: ClinicPatientRepository(ServiceRepo()),
                  token: token,
                  clinicId: clinicId,
                ),
              );
              if (added == true) _viewModel.refresh();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 10 : 14,
                vertical: 0,
              ),
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isTablet ? 4 : 5),
              ),
            ),
            icon: Icon(Icons.person_add_rounded, size: isTablet ? 12 : 14),
            label: Text(
              'New Patient',
              style: TextStyle(fontSize: isTablet ? 10 : 11, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchRow(bool isTablet) {
    return Row(
      children: [
        Expanded(
          child: _DebouncedSearchField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent(bool isMobile, bool isTablet, BoxConstraints constraints) {
    if (_viewModel.isLoading && _viewModel.patients.isEmpty) {
      return const Center(child: AppLoader(size: 50, strokeWidth: 3));
    }

    if (_viewModel.error.isNotEmpty && _viewModel.patients.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              _viewModel.error,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: _viewModel.refresh,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_filteredPatients.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_search_outlined,
              size: 48,
              color: Color(0xFFCBD5E1),
            ),
            const SizedBox(height: 16),
            Text(
              'No patients found',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          BeautifulTableContainer(
            isTablet: isTablet,
            child: _PatientsTable(
              patients: _filteredPatients,
              viewModel: _viewModel,
              onPatientTap: _navigateToPatientDetails,
              constraints: constraints,
            ),
          ),
          const SizedBox(height: 16),
          // Footer text
          const Center(
            child: Text(
              DashboardConstants.footerText,
              style: TextStyle(
                color: DashboardConstants.textHintColor,
                fontSize: DashboardConstants.smallFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PatientsTable extends StatefulWidget {
  final List<ClinicPatient> patients;
  final ClinicPatientsViewModel viewModel;
  final Function(ClinicPatient) onPatientTap;
  final BoxConstraints constraints;

  const _PatientsTable({
    required this.patients,
    required this.viewModel,
    required this.onPatientTap,
    required this.constraints,
  });

  @override
  State<_PatientsTable> createState() => _PatientsTableState();
}

class _PatientsTableState extends State<_PatientsTable> {
  final ScrollController _horizontalController = ScrollController();
  bool _showLeftShadow = false;
  bool _showRightShadow = true;

  @override
  void initState() {
    super.initState();
    _horizontalController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleScroll());
  }

  void _handleScroll() {
    if (!_horizontalController.hasClients) return;
    final maxScroll = _horizontalController.position.maxScrollExtent;
    final currentScroll = _horizontalController.offset;
    final bool showLeft = currentScroll > 10;
    final bool showRight = currentScroll < maxScroll - 10;
    if (showLeft != _showLeftShadow || showRight != _showRightShadow) {
      setState(() {
        _showLeftShadow = showLeft;
        _showRightShadow = showRight;
      });
    }
  }

  @override
  void dispose() {
    _horizontalController.removeListener(_handleScroll);
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = DashboardHelpers.isTablet(widget.constraints);
    final bool needsHorizontalScroll = widget.constraints.maxWidth < DashboardConstants.minTableWidth;

    Widget tableWidget = Theme(
      data: Theme.of(context).copyWith(
        dividerColor: const Color(0xFFE2E8F0),
        dataTableTheme: DataTableThemeData(
          headingRowColor: WidgetStateProperty.all(const Color(0xFFF1F5F9)),
          dataRowColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              return DashboardConstants.primaryColor.withOpacity(0.05);
            }
            return null;
          }),
        ),
      ),
      child: DataTable(
        headingRowHeight: DashboardConstants.tableHeadingHeight,
        dataRowMinHeight: DashboardConstants.tableRowMinHeight,
        dataRowMaxHeight: DashboardConstants.tableRowMaxHeight,
        horizontalMargin: 16,
        columnSpacing: 16,
        showCheckboxColumn: false,
        dividerThickness: 0,
        columns: const [
          DataColumn(label: _TableHeader('SL')),
          DataColumn(label: _TableHeader('MOHID')),
          DataColumn(label: _TableHeader('PATIENT NAME')),
          DataColumn(label: _TableHeader('ADDRESS')),
          DataColumn(label: _TableHeader('CREATED DATE')),
          DataColumn(label: _TableHeader('LAST APPT')),
          DataColumn(label: _TableHeader('FOLLOW-UP STATUS')),
          DataColumn(label: Text('')),
        ],
        rows: widget.patients.asMap().entries.map((entry) {
          final index = entry.key;
          final patient = entry.value;
          return _buildDataRow(context, patient, index + 1);
        }).toList(),
      ),
    );

    if (needsHorizontalScroll) {
      return Stack(
        children: [
          Scrollbar(
            controller: _horizontalController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: DashboardConstants.minTableWidth,
                child: tableWidget,
              ),
            ),
          ),
          if (_showLeftShadow)
            Positioned(
              left: 0, top: 0, bottom: 0, width: 40,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white.withOpacity(0.9), Colors.white.withOpacity(0.0)],
                    ),
                  ),
                ),
              ),
            ),
          if (_showRightShadow)
            Positioned(
              right: 0, top: 0, bottom: 0, width: 40,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.white.withOpacity(0.9), Colors.white.withOpacity(0.0)],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    }

    return SizedBox(width: widget.constraints.maxWidth, child: tableWidget);
  }

  DataRow _buildDataRow(BuildContext context, ClinicPatient patient, int index) {
    final name = '${patient.firstName} ${patient.lastName}'.trim();
    final initials = name.isNotEmpty ? name[0].toUpperCase() : 'P';
    
    return DataRow(
      onSelectChanged: (_) => widget.onPatientTap(patient),
      cells: [
        DataCell(Text('#$index', style: _dataStyle)),
        DataCell(Text(patient.moId ?? '-', style: _dataStyle.copyWith(fontWeight: FontWeight.w700))),
        DataCell(_buildPatientCell(name, initials)),
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 150),
            child: Text(
              (patient.address != null && patient.address!.isNotEmpty)
                  ? patient.address!
                  : '-',
              style: _dataStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        DataCell(Text(_formatDate(patient.createdAt), style: _dataStyle)),
        DataCell(Text(_getLastApptDate(patient), style: _dataStyle)),
        DataCell(_buildFollowUpBadge(patient)),
        DataCell(_buildActionCell()),
      ],
    );
  }

  static const _dataStyle = TextStyle(
    fontSize: 11,
    color: DashboardConstants.textPrimaryColor,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  Widget _buildPatientCell(String name, String initials) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDynamicAvatar(name),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            name,
            style: _dataStyle.copyWith(fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildDynamicAvatar(String name) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'P';
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Center(
        child: Text(
          initial,
          style: const TextStyle(
            color: Color(0xFF475569),
            fontSize: 11,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildActionCell() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'View',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: DashboardConstants.textPrimaryColor,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.arrow_forward_rounded,
          size: 12,
          color: DashboardConstants.textSecondaryColor.withOpacity(0.5),
        ),
      ],
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return dateStr.split('T')[0];
    }
  }

  String _getLastApptDate(ClinicPatient patient) {
    if (patient.appointments.isEmpty) return 'No Appts';
    try {
      final sortedAppts = List<AppointmentDetail>.from(patient.appointments);
      sortedAppts.sort((a, b) => b.appointmentTime.compareTo(a.appointmentTime));
      final lastAppt = sortedAppts.first.appointmentTime;
      return _formatDate(lastAppt);
    } catch (e) {
      return 'N/A';
    }
  }

  Widget _buildFollowUpBadge(ClinicPatient patient) {
    if (patient.followUps.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.08),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey.withOpacity(0.15)),
        ),
        child: Text(
          'No Follow-Up',
          style: TextStyle(
            fontSize: 9,
            color: Colors.grey[600],
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    final fu = patient.followUps.firstWhere(
      (f) => f.status == 'active',
      orElse: () => patient.followUps.first,
    );

    String text = '';
    Color color = const Color(0xFF64748B);

    if (fu.status == 'active') {
      if (fu.isFree) {
        text = 'Free Follow-Up (${fu.daysRemaining ?? 0}d)';
        color = const Color(0xFF10B981);
      } else {
        text = 'Paid Follow-Up';
        color = const Color(0xFFF59E0B);
      }
    } else if (fu.status == 'used') {
      text = 'Follow-Up Used';
    } else if (fu.status == 'expired') {
      text = 'Expired';
      color = const Color(0xFFEF4444);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 9,
          color: color,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
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
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 10,
        color: Color(0xFF475569),
        letterSpacing: 1.2,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

class _DebouncedSearchField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const _DebouncedSearchField({required this.onChanged});

  @override
  State<_DebouncedSearchField> createState() => _DebouncedSearchFieldState();
}

class _DebouncedSearchFieldState extends State<_DebouncedSearchField> {
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
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: DashboardConstants.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: _controller,
        onChanged: _onSearchChanged,
        decoration: const InputDecoration(
          hintText: 'Search by name or phone...',
          hintStyle: TextStyle(
            fontSize: 11,
            color: DashboardConstants.textHintColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: DashboardConstants.textHintColor,
            size: 14,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
        ),
      ),
    );
  }
}

// ─── Standalone Add Patient Dialog ────────────────────────────────────────────

const _kDialogText = Color(0xFF1A1A2E);
const _kDialogSub = Color(0xFF6B7280);
const _kDialogBorder = Color(0xFFE5E7EB);
const _kDialogBg = Color(0xFFF9FAFB);
const _kDialogFocus = Colors.black;

class _AddPatientDialog extends StatefulWidget {
  final ClinicPatientRepository repository;
  final String token;
  final String clinicId;

  const _AddPatientDialog({
    required this.repository,
    required this.token,
    required this.clinicId,
  });

  @override
  State<_AddPatientDialog> createState() => _AddPatientDialogState();
}

class _AddPatientDialogState extends State<_AddPatientDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  String _dialCode = '+91';
  String? _gender;
  bool _submitting = false;
  String _error = '';

  static const _dialCodes = [
    ('🇮🇳 +91', '+91'),
    ('🇦🇪 +971', '+971'),
    ('🇸🇦 +966', '+966'),
    ('🇺🇸 +1', '+1'),
    ('🇬🇧 +44', '+44'),
  ];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _lastNameCtrl.dispose();
    _phoneCtrl.dispose();
    _ageCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _submitting = true;
      _error = '';
    });

    try {
      final result = await widget.repository.createPatient(
        token: widget.token,
        clinicId: widget.clinicId,
        firstName: _nameCtrl.text.trim(),
        lastName: _lastNameCtrl.text.trim(),
        phone: '$_dialCode${_phoneCtrl.text.trim()}',
        age: _ageCtrl.text.isEmpty ? null : int.tryParse(_ageCtrl.text),
        gender: _gender?.toLowerCase(),
        address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
      );

      if (!mounted) return;
      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '✅ ${result.patient.firstName} ${result.patient.lastName} registered!',
            ),
            backgroundColor: const Color(0xFF059669),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            duration: const Duration(seconds: 3),
          ),
        );
        Navigator.pop(context, true);
      } else {
        setState(() {
          _error = 'Failed to register patient. Please try again.';
          _submitting = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Title bar ──────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 8, 16),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: _kDialogBorder)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: kMedicalRed.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.person_add_rounded,
                      size: 16,
                      color: kMedicalRed,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Register New Patient',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _kDialogText,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: _kDialogSub,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            // ── Form body ──────────────────────────────────────────────────
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _DialogField(
                              label: 'First Name *',
                              hint: '',
                              controller: _nameCtrl,
                              validator: (v) => (v == null || v.trim().isEmpty)
                                  ? 'Required'
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _DialogField(
                              label: 'Last Name',
                              hint: '',
                              controller: _lastNameCtrl,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      const _DialogLabel('Phone Number *'),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 46,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: _kDialogBg,
                              border: Border.all(color: _kDialogBorder),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _dialCode,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 16,
                                  color: _kDialogSub,
                                ),
                                items: _dialCodes
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e.$2,
                                        child: Text(
                                          e.$1,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _dialCode = v!),
                                          ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _DialogField(
                              label: '',
                              hint: '',
                              controller: _phoneCtrl,
                              keyboardType: TextInputType.phone,
                              validator: (v) => (v == null || v.trim().isEmpty)
                                  ? 'Required'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      Row(
                        children: [
                          Expanded(
                            child: _DialogField(
                              label: 'Age',
                              hint: '',
                              controller: _ageCtrl,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _DialogLabel('Gender'),
                                const SizedBox(height: 6),
                                Container(
                                  height: 46,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _kDialogBg,
                                    border: Border.all(color: _kDialogBorder),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _gender,
                                      isExpanded: true,
                                      hint: const Text(
                                        'Select',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: _kDialogSub,
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 16,
                                        color: _kDialogSub,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: _kDialogText,
                                      ),
                                      items: ['Male', 'Female', 'Other']
                                          .map(
                                            (g) => DropdownMenuItem(
                                              value: g,
                                              child: Text(g),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (v) =>
                                          setState(() => _gender = v),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      _DialogField(
                        label: 'Address',
                        hint: '',
                        controller: _addressCtrl,
                      ),

                      if (_error.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF2F2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFFECACA)),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.error_outline_rounded,
                                size: 16,
                                color: Color(0xFFDC2626),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _error,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFDC2626),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // ── Action buttons ─────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: _kDialogBorder)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _submitting
                          ? null
                          : () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _kDialogSub,
                        side: const BorderSide(color: _kDialogBorder),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _submitting ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: _kDialogBorder,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _submitting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Register Patient',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogLabel extends StatelessWidget {
  final String text;
  const _DialogLabel(this.text);
  @override
  Widget build(BuildContext context) => text.isEmpty
      ? const SizedBox.shrink()
      : Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _kDialogText,
          ),
        );
}

class _DialogField extends StatelessWidget {
  final String label, hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _DialogField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          _DialogLabel(label),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(fontSize: 13, color: _kDialogText),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, color: _kDialogSub),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 13,
            ),
            filled: true,
            fillColor: _kDialogBg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _kDialogBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _kDialogBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _kDialogFocus, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            errorStyle: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}
