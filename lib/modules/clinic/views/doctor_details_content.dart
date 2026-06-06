import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/modules/clinic/viewmodels/doctor_details_viewmodel.dart';
import 'package:drandme/modules/clinic/models/doctor_leave_model.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/core/widgets/app_loader.dart';

// --- VISUAL CONSTANTS (Classy Slate - Web Optimized) ---
const kBgColor = Color(0xFFF1F5F9); // Slate-100
const kCardColor = Colors.white;
const kPrimaryText = Color(0xFF1E293B); // Slate-900
const kSecondaryText = Color(0xFF64748B); // Slate-500
const kAccentColor = Color(0xFF0F766E); // Teal-700
const kBorderColor = Color(0xFFE2E8F0); // Slate-200

// Constant Styles
const kHeaderStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kPrimaryText,
);

class DoctorDetailsContent extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsContent({super.key, required this.doctorId});

  @override
  State<DoctorDetailsContent> createState() => _DoctorDetailsContentState();
}

class _DoctorDetailsContentState extends State<DoctorDetailsContent> {
  // Form State
  bool _isOfflineTimingExpanded = true;
  bool _isOnlineTimingExpanded = false;

  final Map<String, Map<String, TextEditingController>>
  _offlineTimeControllers = {};
  final Map<String, Map<String, TextEditingController>> _onlineTimeControllers =
      {};
  final Map<String, Map<String, TextEditingController>>
  _offlineMaxPatientsControllers = {};
  final Map<String, Map<String, TextEditingController>>
  _onlineMaxPatientsControllers = {};

  late final TextEditingController _offlineFeeController;
  late final TextEditingController _onlineFeeController;

  @override
  void initState() {
    super.initState();
    _offlineFeeController = TextEditingController();
    _onlineFeeController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }

  void _initData() {
    final viewModel = context.read<DoctorDetailsViewModel>();
    final clinicId = context.read<AuthViewModel>().user?.clinicId;
    viewModel
        .initializeDoctorData(doctorId: widget.doctorId, clinicId: clinicId)
        .then((_) {
          if (mounted) _bindViewModelDataToControllers(viewModel);
        });
  }

  @override
  void dispose() {
    _disposeControllers(_offlineTimeControllers);
    _disposeControllers(_onlineTimeControllers);
    _disposeControllers(_offlineMaxPatientsControllers);
    _disposeControllers(_onlineMaxPatientsControllers);
    _offlineFeeController.dispose();
    _onlineFeeController.dispose();
    super.dispose();
  }

  void _disposeControllers(
    Map<String, Map<String, TextEditingController>> controllers,
  ) {
    for (final dayControllers in controllers.values) {
      for (final controller in dayControllers.values) {
        controller.dispose();
      }
    }
  }

  void _bindViewModelDataToControllers(DoctorDetailsViewModel viewModel) {
    final feeValues = viewModel.getConsultationFeeValues();
    if (feeValues != null) {
      _offlineFeeController.text = feeValues.offlineFee;
      _onlineFeeController.text = feeValues.onlineFee;
    }

    // Bind days logic preserved from original
    final selectedOfflineDays = viewModel.getSelectedDays('clinic_visit');
    final selectedOnlineDays = viewModel.getSelectedDays('video_consultation');

    for (final day in DoctorDetailsViewModel.days) {
      if (selectedOfflineDays[day] == true) {
        _bindTimeDataForDay(
          day,
          'clinic_visit',
          _offlineTimeControllers,
          _offlineMaxPatientsControllers,
          viewModel,
        );
      }
      if (selectedOnlineDays[day] == true) {
        _bindTimeDataForDay(
          day,
          'video_consultation',
          _onlineTimeControllers,
          _onlineMaxPatientsControllers,
          viewModel,
        );
      }
    }
  }

  void _bindTimeDataForDay(
    String day,
    String slotType,
    Map<String, Map<String, TextEditingController>> timeControllers,
    Map<String, Map<String, TextEditingController>> maxControllers,
    DoctorDetailsViewModel viewModel,
  ) {
    final timeData = viewModel.getTimeFieldPreFillData(slotType);
    final dayData = timeData[day];
    if (dayData != null) {
      // Ensure controllers exist
      timeControllers.putIfAbsent(
        day,
        () => {
          'morningStart': TextEditingController(),
          'morningEnd': TextEditingController(),
          'afternoonStart': TextEditingController(),
          'afternoonEnd': TextEditingController(),
        },
      );
      maxControllers.putIfAbsent(
        day,
        () => {
          'morningMax': TextEditingController(),
          'afternoonMax': TextEditingController(),
        },
      );

      final timeDay = timeControllers[day]!;
      final maxDay = maxControllers[day]!;

      timeDay['morningStart']!.text = dayData.morningStart;
      timeDay['morningEnd']!.text = dayData.morningEnd;
      timeDay['afternoonStart']!.text = dayData.afternoonStart;
      timeDay['afternoonEnd']!.text = dayData.afternoonEnd;
      maxDay['morningMax']!.text = dayData.morningMax;
      maxDay['afternoonMax']!.text = dayData.afternoonMax;
    }
  }

  // --- Actions ---

  Future<void> _createSlots(String slotType) async {
    final viewModel = context.read<DoctorDetailsViewModel>();
    final authViewModel = context.read<AuthViewModel>();
    final clinicId = authViewModel.user?.clinicId;

    if (clinicId == null) {
      _showSnack('Clinic ID not found', isError: true);
      return;
    }

    final selectedDaysMap = viewModel.getSelectedDays(slotType);
    final controllers = slotType == 'clinic_visit'
        ? _offlineTimeControllers
        : _onlineTimeControllers;
    final maxControllers = slotType == 'clinic_visit'
        ? _offlineMaxPatientsControllers
        : _onlineMaxPatientsControllers;

    // Extract values helper
    Map<String, Map<String, String>> extract(
      Map<String, Map<String, TextEditingController>> c,
    ) {
      return {
        for (final exc in c.entries)
          exc.key: {for (final e in exc.value.entries) e.key: e.value.text},
      };
    }

    try {
      final result = await viewModel.createSlots(
        doctorId: widget.doctorId,
        clinicId: clinicId,
        slotType: slotType,
        selectedDays: selectedDaysMap,
        timeData: DoctorDetailsViewModel.extractTimeData(extract(controllers)),
        maxPatientsData: DoctorDetailsViewModel.extractMaxPatientsData(
          extract(maxControllers),
        ),
      );

      if (result.success) {
        // Refresh updated days
        for (final day in result.updatedDays) {
          await viewModel.loadExistingSlotsForDay(
            doctorId: widget.doctorId,
            day: day,
            slotType: slotType,
            clinicId: clinicId,
            silent: true,
          );
        }
        _showSnack('Slots saved successfully!');
      } else {
        _showSnack(result.error ?? 'Failed to save slots', isError: true);
      }
    } catch (e) {
      _showSnack('Error: $e', isError: true);
    }
  }

  Future<void> _handleSaveFees(DoctorDetailsViewModel viewModel) async {
    final clinicId = context.read<AuthViewModel>().user?.clinicId;
    if (clinicId == null)
      return _showSnack('Clinic ID not found', isError: true);

    final result = await viewModel.validateAndSaveFees(
      clinicId: clinicId,
      offlineFeeText: _offlineFeeController.text.trim(),
      onlineFeeText: _onlineFeeController.text.trim(),
    );

    if (result.success) {
      _showSnack('Fees saved successfully');
    } else {
      _showSnack(result.error ?? 'Failed to save fees', isError: true);
    }
  }

  void _showSnack(String msg, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }



  // --- Build & Layout ---

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorDetailsViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isInitializing) {
          return const Scaffold(
            backgroundColor: kBgColor,
            body: SizedBox.shrink(), // GlobalLoadingOverlay will handle the UI
          );
        }

        if (viewModel.isLoadingDoctor && viewModel.doctorInfo == null) {
          return const Scaffold(
            backgroundColor: kBgColor,
            body: Center(child: AppLoader(size: 60)),
          );
        }

        if (viewModel.error.isNotEmpty &&
            viewModel.doctorInfo == null &&
            viewModel.doctor == null) {
          return Scaffold(
            backgroundColor: kBgColor,
            body: _ErrorView(
              error: viewModel.error,
              onRetry: () => _initData(),
            ),
          );
        }

        return Scaffold(
          backgroundColor: kBgColor,
          body: Column(
            children: [
              Expanded(
                child: _ResponsiveLayoutBuilder(
                  viewModel: viewModel,
                  offlineExpanded: _isOfflineTimingExpanded,
                  onlineExpanded: _isOnlineTimingExpanded,
                  onOfflineToggle: () => setState(
                    () => _isOfflineTimingExpanded = !_isOfflineTimingExpanded,
                  ),
                  onOnlineToggle: () => setState(
                    () => _isOnlineTimingExpanded = !_isOnlineTimingExpanded,
                  ),
                  offlineTimeControllers: _offlineTimeControllers,
                  onlineTimeControllers: _onlineTimeControllers,
                  offlineMaxControllers: _offlineMaxPatientsControllers,
                  onlineMaxControllers: _onlineMaxPatientsControllers,
                  createSlots: _createSlots,
                  offlineFeeController: _offlineFeeController,
                  onlineFeeController: _onlineFeeController,
                  onSaveFees: () => _handleSaveFees(viewModel),
                  doctorId: widget.doctorId,
                ),
              ),
              const _Footer(),
            ],
          ),
        );
      },
    );
  }
}

// --- Layouts ---

class _ResponsiveLayoutBuilder extends StatelessWidget {
  final DoctorDetailsViewModel viewModel;
  final bool offlineExpanded;
  final bool onlineExpanded;
  final VoidCallback onOfflineToggle;
  final VoidCallback onOnlineToggle;
  final Map<String, dynamic> offlineTimeControllers;
  final Map<String, dynamic> onlineTimeControllers;
  final Map<String, dynamic> offlineMaxControllers;
  final Map<String, dynamic> onlineMaxControllers;
  final Function(String) createSlots;
  final TextEditingController offlineFeeController;
  final TextEditingController onlineFeeController;
  final VoidCallback onSaveFees;
  final String doctorId;



  const _ResponsiveLayoutBuilder({
    required this.viewModel,
    required this.offlineExpanded,
    required this.onlineExpanded,
    required this.onOfflineToggle,
    required this.onOnlineToggle,
    required this.offlineTimeControllers,
    required this.onlineTimeControllers,
    required this.offlineMaxControllers,
    required this.onlineMaxControllers,
    required this.createSlots,
    required this.offlineFeeController,
    required this.onlineFeeController,
    required this.onSaveFees,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    // Shared Data extraction
    final doctor = viewModel.doctorInfo ?? viewModel.doctor;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth < 1024;

        final double contentMaxWidth = isMobile
            ? double.infinity
            : (isTablet ? 1200 : 1400);
        final padding = isMobile ? 12.0 : 20.0;

        // Content
        final profile = RepaintBoundary(
          child: _ProfileCard(
            doctor: doctor,
            isMobile: isMobile,
          ),
        );
        final infoCards = RepaintBoundary(
          child: _InfoCards(doctor: doctor, isMobile: isMobile),
        );
        final bio = RepaintBoundary(
          child: _BioCard(doctor: doctor, isMobile: isMobile),
        );

        final timing = RepaintBoundary(
          child: _TimingSection(
            offlineExpanded: offlineExpanded,
            onlineExpanded: onlineExpanded,
            onOfflineToggle: onOfflineToggle,
            onOnlineToggle: onOnlineToggle,
            offlineControllers: offlineTimeControllers,
            onlineControllers: onlineTimeControllers,
            offlineMax: offlineMaxControllers,
            onlineMax: onlineMaxControllers,
            createSlots: createSlots,
            doctorId: doctorId,
          ),
        );

        final fees = RepaintBoundary(
          child: _FeeCard(
            offlineController: offlineFeeController,
            onlineController: onlineFeeController,
            onSave: onSaveFees,
            isSaving: viewModel.isCreating,
          ),
        );

        final leaves = RepaintBoundary(
          child: _LeavesCard(viewModel: viewModel, doctorId: doctorId),
        );

        if (isMobile) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                profile,
                SizedBox(height: 4),
                infoCards,
                SizedBox(height: 4),
                bio,
                SizedBox(height: 4),
                timing,
                SizedBox(height: 4),
                fees,
                SizedBox(height: 4),
                leaves,
              ],
            ),
          );
        }

        // Tablet/Desktop: 2 Column Layout
        return SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: contentMaxWidth),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Col
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        profile,
                        SizedBox(height: 16),
                        infoCards,
                        SizedBox(height: 16),
                        bio,
                        SizedBox(height: 16),
                        timing,
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Right Col
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [fees, SizedBox(height: 16), leaves],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// --- Component Widgets ---

class _ProfileCard extends StatelessWidget {
  final dynamic doctor;
  final bool isMobile;
  const _ProfileCard({
    required this.doctor,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DoctorDetailsViewModel>(context);
    String name = 'Dr. Unknown';
    String spec = 'General Practitioner';
    String? license;
    String joined = viewModel.joinedDate;
    bool isActive = viewModel.currentClinicLink?.isActive ?? true;

    // Extract data safely
    if (doctor != null) {
      // Mapping logic simplified - safely checking types or fields
      // NOTE: We use dynamic access or specific checks to avoid runtime null errors on fields
      try {
        String? fName;
        String? lName;

        try {
          fName = doctor.firstName;
        } catch (_) {}
        try {
          lName = doctor.lastName;
        } catch (_) {}

        if (fName != null && lName != null) {
          name = '$fName $lName';
        } else {
          try {
            if (doctor.fullName != null) name = doctor.fullName!;
          } catch (_) {}
        }

        if (name == 'Dr. Unknown' && fName != null) {
          name = fName;
        }

        try {
          if (doctor.specialization != null) {
            spec = doctor.specialization!;
          }
        } catch (_) {}

        try {
          license = doctor.licenseNumber;
        } catch (_) {}
      } catch (_) {
        // Fallback
      }
    }

    // Correct name format
    if (!name.startsWith('Dr.')) name = 'Dr. $name';

    // Safer initials logic
    String initials = 'D';
    if (name.length > 4) {
      // "Dr. X"
      final parts = name.split(' ');
      if (parts.length > 2) {
        // Dr. First Last -> FL
        final f = parts[1];
        final l = parts[2];
        if (f.isNotEmpty && l.isNotEmpty) {
          initials = '${f[0]}${l[0]}';
        }
      } else if (parts.length == 2) {
        // Dr. Name -> N
        if (parts[1].isNotEmpty) initials = parts[1][0];
      }
    }

    return _SectionContainer(
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: isMobile ? 80 : 100,
                height: isMobile ? 80 : 100,
                decoration: BoxDecoration(
                  color: kAccentColor.withOpacity(0.05),
                  shape: BoxShape.circle,
                  border: Border.all(color: kBorderColor, width: 2),
                ),
                child: ClipOval(
                  child: _buildProfileImage(doctor, initials, isMobile),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _Tag(
                          icon: Icons.verified,
                          label: spec,
                          color: kAccentColor,
                          bg: kAccentColor.withOpacity(0.1),
                        ),
                         if (license != null)
                          _Tag(
                            icon: Icons.badge_outlined,
                            label: 'Lic: $license',
                            color: kSecondaryText,
                            bg: kBorderColor,
                          ),
                        if (!isActive)
                          _Tag(
                            icon: Icons.block,
                            label: 'BANNED / INACTIVE',
                            color: Colors.white,
                            bg: Colors.red,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: kSecondaryText,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Joined on $joined',
                          style: const TextStyle(
                            fontSize: 13,
                            color: kSecondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildProfileImage(dynamic doctor, String initials, bool isMobile) {
    String? profileImagePath;
    if (doctor != null) {
      try {
        profileImagePath = doctor.profileImage;
      } catch (_) {}
    }

    if (profileImagePath == null || profileImagePath.isEmpty) {
      return _buildInitials(initials, isMobile);
    }

    final imageUrl = _getImageUrl(profileImagePath);

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildInitials(initials, isMobile);
      },
    );
  }

  Widget _buildInitials(String initials, bool isMobile) {
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          fontSize: isMobile ? 28 : 36,
          fontWeight: FontWeight.bold,
          color: kAccentColor,
        ),
      ),
    );
  }

  String _getImageUrl(String rawPath) {
    return AppHelpers.ensureImageUrl(rawPath);
  }
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bg;
  const _Tag({
    required this.icon,
    required this.label,
    required this.color,
    required this.bg,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
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
}

class _InfoCards extends StatelessWidget {
  final dynamic doctor;
  final bool isMobile;
  const _InfoCards({required this.doctor, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    // Safe Data Extraction Logic
    String qual = 'N/A';
    String exp = 'N/A';
    String phone = 'N/A';
    String email = 'N/A';

    if (doctor != null) {
      try {
        // Try direct field access if model supports it
        // Or handle as dynamic map if necessary (though here likely model mismatch)
        // We use dynamic handling to avoid runtime crash.
        // Assuming doctor might be DoctorInfo or Doctor model

        // Qualification
        if (_hasField(doctor, 'qualification')) {
          final q = doctor.qualification;
          if (q != null) qual = q.toString();
        }

        

        // Experience
        if (_hasField(doctor, 'experience_years')) {
          final e = doctor.experienceYears;
          if (e != null) exp = '$e Years';
        } else if (_hasField(doctor, 'experience')) {
          final e = doctor.experience;
          if (e != null) exp = e.toString();
        }

        // Phone
        if (_hasField(doctor, 'phone')) {
          final p = doctor.phone;
          if (p != null) phone = p.toString();
        }

        // Email
        if (_hasField(doctor, 'email')) {
          final em = doctor.email;
          if (em != null) email = em.toString();
        }
      } catch (_) {
        // Fallback to defaults if access fails
      }
    }

    final cards = [
      _MiniInfoCard(
        icon: Icons.description,
        color: Colors.green,
        title: 'Qualification',
        value: qual,
      ),
      _MiniInfoCard(
        icon: Icons.work,
        color: Colors.red,
        title: 'Experience',
        value: exp,
      ),
      _MiniInfoCard(
        icon: Icons.phone,
        color: Colors.green,
        title: 'Mobile',
        value: phone,
      ),
      _MiniInfoCard(
        icon: Icons.email,
        color: Colors.blue,
        title: 'Email',
        value: email,
      ),
    ];

    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 4),
              Expanded(child: cards[1]),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(child: cards[2]),
              const SizedBox(width: 4),
              Expanded(child: cards[3]),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: cards[0]),
        const SizedBox(width: 4),
        Expanded(child: cards[1]),
        const SizedBox(width: 4),
        Expanded(child: cards[2]),
        const SizedBox(width: 4),
        Expanded(child: cards[3]),
      ],
    );
  }

  bool _hasField(dynamic object, String fieldName) {
    if (object == null) return false;
    try {
      final map = (object as dynamic).toJson();
      return map.containsKey(fieldName);
    } catch (_) {
      // If no toJson, try to access field directly via dynamic
      try {
        final val = (object as dynamic).qualification; // Just a probe
        return true; 
      } catch (_) {
        return false;
      }
    }
  }
}

class _MiniInfoCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;
  const _MiniInfoCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kBorderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: kSecondaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BioCard extends StatelessWidget {
  final dynamic doctor;
  final bool isMobile;
  const _BioCard({required this.doctor, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    String bioText = 'No biography available for this doctor.';

    if (doctor != null) {
      try {
        final b = (doctor as dynamic).bio;
        if (b != null && b.toString().isNotEmpty) {
          bioText = b.toString();
        }
      } catch (_) {}
    }

    final String bio = bioText; // Mapping for the Text widget below

    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.person_outline,
                  size: 20,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 4),
              const Text('Biography', style: kHeaderStyle),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            bio,
            style: const TextStyle(
              fontSize: 14,
              color: kSecondaryText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimingSection extends StatelessWidget {
  final bool offlineExpanded;
  final bool onlineExpanded;
  final VoidCallback onOfflineToggle;
  final VoidCallback onOnlineToggle;
  final Map<String, dynamic> offlineControllers;
  final Map<String, dynamic> onlineControllers;
  final Map<String, dynamic> offlineMax;
  final Map<String, dynamic> onlineMax;
  final Function(String) createSlots;
  final String doctorId;

  const _TimingSection({
    required this.offlineExpanded,
    required this.onlineExpanded,
    required this.onOfflineToggle,
    required this.onOnlineToggle,
    required this.offlineControllers,
    required this.onlineControllers,
    required this.offlineMax,
    required this.onlineMax,
    required this.createSlots,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TimingAccordian(
          title: 'Offline Consultation Timing',
          isExpanded: offlineExpanded,
          onToggle: onOfflineToggle,
          child: _TimingTable(
            slotType: 'clinic_visit',
            controllers: offlineControllers,
            maxControllers: offlineMax,
            onSave: () => createSlots('clinic_visit'),
            doctorId: doctorId,
          ),
        ),
        const SizedBox(height: 4),
        _TimingAccordian(
          title: 'Online Consultation Timing',
          isExpanded: onlineExpanded,
          onToggle: onOnlineToggle,
          child: _TimingTable(
            slotType: 'video_consultation',
            controllers: onlineControllers,
            maxControllers: onlineMax,
            onSave: () => createSlots('video_consultation'),
            doctorId: doctorId,
          ),
        ),
      ],
    );
  }
}

class _TimingAccordian extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onToggle;
  final Widget child;
  const _TimingAccordian({
    required this.title,
    required this.isExpanded,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kBorderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isExpanded
                    ? kAccentColor.withOpacity(0.05)
                    : Colors.transparent,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(6),
                  bottom: Radius.circular(isExpanded ? 0 : 6),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: kAccentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.access_time,
                      size: 20,
                      color: kAccentColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(title, style: kHeaderStyle),
                  const Spacer(),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: kSecondaryText,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(padding: const EdgeInsets.all(4), child: child),
        ],
      ),
    );
  }
}

class _TimingTable extends StatelessWidget {
  final String slotType;
  final Map<String, dynamic> controllers;
  final Map<String, dynamic> maxControllers;
  final VoidCallback onSave;
  final String doctorId;

  bool isSelectedAny(BuildContext context) {
    final vm = Provider.of<DoctorDetailsViewModel>(context, listen: false);
    return vm.getSelectedDays(slotType).values.any((v) => v == true);
  }

  void _copyToAllSelected(BuildContext context) {
    final vm = Provider.of<DoctorDetailsViewModel>(context, listen: false);
    final selectedDays = vm.getSelectedDays(slotType);
    final mondayTime = controllers['Monday'];
    final mondayMax = maxControllers['Monday'];

    if (mondayTime == null || mondayMax == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please configure Monday's timing first")),
      );
      return;
    }

    for (final day in DoctorDetailsViewModel.days) {
      if (day == 'Monday') continue;
      if (selectedDays[day] == true) {
        controllers.putIfAbsent(day, () => {
          'morningStart': TextEditingController(),
          'morningEnd': TextEditingController(),
          'afternoonStart': TextEditingController(),
          'afternoonEnd': TextEditingController(),
        });
        maxControllers.putIfAbsent(day, () => {
          'morningMax': TextEditingController(),
          'afternoonMax': TextEditingController(),
        });

        final targetTime = controllers[day]!;
        final targetMax = maxControllers[day]!;

        targetTime['morningStart']!.text = mondayTime['morningStart']!.text;
        targetTime['morningEnd']!.text = mondayTime['morningEnd']!.text;
        targetTime['afternoonStart']!.text = mondayTime['afternoonStart']!.text;
        targetTime['afternoonEnd']!.text = mondayTime['afternoonEnd']!.text;
        
        targetMax['morningMax']!.text = mondayMax['morningMax']!.text;
        targetMax['afternoonMax']!.text = mondayMax['afternoonMax']!.text;
      }
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Monday's timing copied to all selected days")),
    );
  }

  const _TimingTable({
    required this.slotType,
    required this.controllers,
    required this.maxControllers,
    required this.onSave,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DoctorDetailsViewModel>(context);
    final isLoading = viewModel.isLoadingExistingSlots;

    return Column(
      children: [
        if (isLoading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Column(
                children: [
                  AppLoader(size: 30),
                  SizedBox(height: 8),
                  Text('Loading session slots...', style: TextStyle(fontSize: 12, color: kSecondaryText)),
                ],
              ),
            ),
          )
        else
          LayoutBuilder(
            builder: (ctx, constraints) {
            final showScroll = constraints.maxWidth < 700;
            final content = Container(
              width: showScroll ? 700 : double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 40),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Days",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: _CenteredHeader(
                            "Morning",
                            sub: ["Start", "End"],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: _CenteredHeader(
                            "Afternoon",
                            sub: ["Start", "End"],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Rows
                  ...DoctorDetailsViewModel.days
                      .map(
                        (day) => _DayRow(
                          day: day,
                          slotType: slotType,
                          controllers: controllers,
                          max: maxControllers,
                          doctorId: doctorId,
                        ),
                      )
                      .toList(),
                ],
              ),
            );

            return Column(
              children: [
                if (isSelectedAny(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () => _copyToAllSelected(context),
                          icon: const Icon(Icons.copy_all, size: 16),
                          label: const Text("Copy Monday's Timing to All Selected", style: TextStyle(fontSize: 11)),
                          style: TextButton.styleFrom(
                            foregroundColor: kAccentColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                showScroll
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: content,
                      )
                    : content,
              ],
            );
          },
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.save, size: 20),
            label: Text('Save $slotType Slots'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CenteredHeader extends StatelessWidget {
  final String title;
  final List<String> sub;
  const _CenteredHeader(this.title, {required this.sub});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Row(
          children: sub
              .map(
                (s) => Expanded(
                  child: Text(
                    s,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _DayRow extends StatelessWidget {
  final String day;
  final String slotType;
  final Map<String, dynamic> controllers;
  final Map<String, dynamic> max;
  final String doctorId;
  const _DayRow({
    required this.day,
    required this.slotType,
    required this.controllers,
    required this.max,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    // Lazily init controllers for this day if missing (should be init in parent but safety first)
    if (!controllers.containsKey(day)) {
      controllers[day] = {
        'morningStart': TextEditingController(),
        'morningEnd': TextEditingController(),
        'afternoonStart': TextEditingController(),
        'afternoonEnd': TextEditingController(),
      };
    }

    // Fallback safe map - though check above ensures it's there
    final timeDay =
        controllers[day] ??
        {
          'morningStart': TextEditingController(),
          'morningEnd': TextEditingController(),
          'afternoonStart': TextEditingController(),
          'afternoonEnd': TextEditingController(),
        };

    return Selector<DoctorDetailsViewModel, bool>(
      selector: (_, vm) => vm.getSelectedDays(slotType)[day] ?? false,
      builder: (ctx, isSelected, _) {
        final vm = ctx.read<DoctorDetailsViewModel>();

        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (val) async {
                  vm.setSelectedDay(day, slotType, val ?? false);
                  if (val == true) {
                    final clinic = ctx.read<AuthViewModel>().user?.clinicId;
                    if (clinic != null) {
                      await vm.loadExistingSlotsForDay(
                        doctorId: doctorId,
                        day: day,
                        slotType: slotType,
                        clinicId: clinic,
                        silent: true,
                      );

                      final tData = vm.getTimeFieldPreFillData(slotType)[day];
                      if (tData != null) {
                        // Safe update with null checks on controllers
                        timeDay['morningStart']?.text = tData.morningStart;
                        timeDay['morningEnd']?.text = tData.morningEnd;
                        timeDay['afternoonStart']?.text = tData.afternoonStart;
                        timeDay['afternoonEnd']?.text = tData.afternoonEnd;
                      }
                    }
                  }
                },
              ),
              Expanded(
                flex: 1,
                child: Text(
                  day,
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: _TimeInput(
                        controller:
                            timeDay['morningStart'] ?? TextEditingController(),
                        enabled: isSelected,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _TimeInput(
                        controller:
                            timeDay['morningEnd'] ?? TextEditingController(),
                        enabled: isSelected,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: _TimeInput(
                        controller:
                            timeDay['afternoonStart'] ??
                            TextEditingController(),
                        enabled: isSelected,
                        isPMDefault: true,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _TimeInput(
                        controller:
                            timeDay['afternoonEnd'] ?? TextEditingController(),
                        enabled: isSelected,
                        isPMDefault: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TimeInput extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;
  final bool isPMDefault;
  const _TimeInput({
    super.key, 
    required this.controller, 
    required this.enabled,
    this.isPMDefault = false,
  });

  @override
  State<_TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<_TimeInput> {
  late String _selectedPeriod;
  late TextEditingController _internalController;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _internalController = TextEditingController();
    _parseInitialValue();
    _internalController.addListener(_onInternalChanged);
    _isInit = true;
  }

  @override
  void didUpdateWidget(_TimeInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller.text != widget.controller.text) {
      _parseInitialValue();
    }
  }

  void _parseInitialValue() {
    final text = widget.controller.text.toUpperCase().trim();
    if (text.isEmpty) {
      _internalController.text = '';
      _selectedPeriod = widget.isPMDefault ? 'PM' : 'AM';
    } else if (text.contains('PM')) {
      _selectedPeriod = 'PM';
      _internalController.text = text.replaceAll('PM', '').trim();
    } else if (text.contains('AM')) {
      _selectedPeriod = 'AM';
      _internalController.text = text.replaceAll('AM', '').trim();
    } else if (text.contains(':')) {
      // 24h format (e.g., "14:30")
      try {
        final parts = text.split(':');
        if (parts.length >= 2) {
          int hour = int.parse(parts[0]);
          final minute = parts[1].padLeft(2, '0');
          
          if (hour >= 12) {
            _selectedPeriod = 'PM';
            if (hour > 12) hour -= 12;
          } else {
            _selectedPeriod = 'AM';
            if (hour == 0) hour = 12;
          }
          _internalController.text = '${hour.toString().padLeft(2, '0')}:$minute';
        } else {
          _internalController.text = text;
          _selectedPeriod = 'AM';
        }
      } catch (_) {
        _internalController.text = text;
        _selectedPeriod = 'AM';
      }
    } else {
      _internalController.text = text;
      _selectedPeriod = 'AM';
    }
  }

  void _onInternalChanged() {
    if (!_isInit) return;
    _updateParent();
  }

  void _updateParent() {
    final time = _internalController.text.trim();
    if (time.isEmpty) {
      widget.controller.text = '';
    } else {
      widget.controller.text = '$time $_selectedPeriod';
    }
  }

  Future<void> _showClockPicker() async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kAccentColor,
              onPrimary: Colors.white,
              onSurface: kPrimaryText,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: kAccentColor),
            ),
          ),
          child: child!,
        );
      },
    );
    if (t != null) {
      setState(() {
        final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
        final minute = t.minute.toString().padLeft(2, '0');
        _internalController.text = '${hour.toString().padLeft(2, '0')}:$minute';
        _selectedPeriod = t.period == DayPeriod.am ? 'AM' : 'PM';
        _updateParent();
      });
    }
  }

  @override
  void dispose() {
    _internalController.removeListener(_onInternalChanged);
    _internalController.dispose();
    super.dispose();
  }

  bool _isValidTime(String text) {
    if (text.isEmpty) return true;
    final parts = text.split(':');
    if (parts.length != 2) return false;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return false;
    if (h < 1 || h > 12) return false;
    if (m < 0 || m > 59) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final isValid = _isValidTime(_internalController.text);
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: widget.enabled ? Colors.white : kBgColor,
        border: Border.all(
          color: !widget.enabled 
              ? kBorderColor 
              : (!isValid ? Colors.red.withOpacity(0.8) : kAccentColor.withOpacity(0.5)),
          width: !isValid ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Clock Icon (Interactable)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.enabled ? _showClockPicker : null,
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.access_time_rounded,
                  size: 16,
                  color: widget.enabled ? kAccentColor : kSecondaryText.withOpacity(0.5),
                ),
              ),
            ),
          ),
          
          // Time Input Field
          Expanded(
            child: TextField(
              controller: _internalController,
              enabled: widget.enabled,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12, 
                color: widget.enabled ? kPrimaryText : kSecondaryText,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9:]')),
                _TimeTextInputFormatter(),
              ],
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'HH:mm',
                hintStyle: TextStyle(color: kSecondaryText, fontSize: 11),
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),

          // AM/PM Dropdown
          if (widget.enabled)
            Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.circular(2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedPeriod,
                  elevation: 2,
                  dropdownColor: Colors.white,
                  items: ['AM', 'PM']
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e, 
                              style: const TextStyle(
                                fontSize: 10, 
                                fontWeight: FontWeight.bold,
                                color: kAccentColor
                              )
                            ),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedPeriod = val;
                        _updateParent();
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_drop_down, size: 14, color: kAccentColor),
                  isDense: true,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TimeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.length > 5) return oldValue;
    
    // Auto-add colon after 2 digits
    if (text.length == 2 && oldValue.text.length == 1) {
      return TextEditingValue(
        text: '$text:',
        selection: TextSelection.collapsed(offset: 3),
      );
    }
    
    // Handle backspace over colon
    if (oldValue.text.length == 3 && text.length == 2 && oldValue.text.endsWith(':')) {
      return TextEditingValue(
        text: text.substring(0, 1),
        selection: TextSelection.collapsed(offset: 1),
      );
    }

    // Limit colons
    if (text.split(':').length > 2) return oldValue;

    return newValue;
  }
}


class _FeeCard extends StatelessWidget {
  final TextEditingController offlineController;
  final TextEditingController onlineController;
  final VoidCallback onSave;
  final bool isSaving;

  const _FeeCard({
    required this.offlineController,
    required this.onlineController,
    required this.onSave,
    required this.isSaving,
  });

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 4),
              const Text('Consultation Fee Management', style: kHeaderStyle),
            ],
          ),
          const SizedBox(height: 16),
          _FeeInput("Offline Consultation Fee", offlineController),
          const SizedBox(height: 4),
          _FeeInput("Online Consultation Fee", onlineController),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSaving ? null : onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _FeeInput(String label, TextEditingController ctrl) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      const SizedBox(height: 4),
      TextField(
        controller: ctrl,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          hintText: 'Enter fee',
        ),
      ),
    ],
  );
}

class _LeavesCard extends StatelessWidget {
  final DoctorDetailsViewModel viewModel;
  final String doctorId;
  const _LeavesCard({required this.viewModel, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 4),
              const Text('Leaves', style: kHeaderStyle),
              const Spacer(),
              if (viewModel.leaveStats != null)
                Text(
                  '${viewModel.leaveStats!.approvedLeaves}/${viewModel.leaveStats!.totalLeaves} Approved',
                  style: const TextStyle(fontSize: 11, color: kSecondaryText),
                ),
            ],
          ),
          if (viewModel.leaveStats != null) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatItem(
                  label: 'Total',
                  count: viewModel.leaveStats!.totalLeaves,
                  color: kPrimaryText,
                  icon: Icons.summarize,
                ),
                _StatItem(
                  label: 'Pending',
                  count: viewModel.leaveStats!.pendingLeaves,
                  color: Colors.orange,
                  icon: Icons.hourglass_empty,
                ),
                _StatItem(
                  label: 'Approved',
                  count: viewModel.leaveStats!.approvedLeaves,
                  color: Colors.green,
                  icon: Icons.check_circle_outline,
                ),
                _StatItem(
                  label: 'Year Days',
                  count: viewModel.leaveStats!.totalDaysThisYear,
                  color: Colors.blue,
                  icon: Icons.calendar_month,
                ),
              ],
            ),
          ],
          const SizedBox(height: 4),
          if (viewModel.isLoadingLeaves)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              ),
            )
          else if (viewModel.leaves.isEmpty)
            _EmptyLeaves(
              onApply: () => _openApplyLeave(context, viewModel, doctorId),
            )
          else
            Column(
              children: [
                ...viewModel.leaves
                    .map(
                      (l) => _LeaveItem(
                        leave: l,
                        onCancel: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Cancel Leave'),
                              content: const Text(
                                'Are you sure you want to cancel this leave?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            final success = await viewModel.cancelLeave(l.id);
                            if (success && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Leave cancelled successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    viewModel.error.isNotEmpty
                                        ? viewModel.error
                                        : 'Failed to cancel leave',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        onEdit: () {
                          showDialog(
                            context: context,
                            builder: (_) => _ApplyLeaveDialog(
                              viewModel: viewModel,
                              doctorId: doctorId,
                              leave: l,
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () =>
                      _openApplyLeave(context, viewModel, doctorId),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryText,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  child: const Text('Apply Leave'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _openApplyLeave(
    BuildContext context,
    DoctorDetailsViewModel vm,
    String docId,
  ) {
    // Replicating just the call, dialog implementation is heavy, assuming standard implementation or kept in original logic if skipped.
    // Since I'm rewriting the file, I must provide the dialog logic or a placeholder.
    // I will use a simplified dialog call for brevity in this response, but fully functional.
    showDialog(
      context: context,
      builder: (_) => _ApplyLeaveDialog(viewModel: vm, doctorId: docId),
    );
  }
}

class _EmptyLeaves extends StatelessWidget {
  final VoidCallback onApply;
  const _EmptyLeaves({required this.onApply});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            'No leaves found',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onApply,
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryText,
              foregroundColor: Colors.white,
            ),
            child: const Text('Apply Leave'),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 14),
            ),
            const SizedBox(height: 4),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _LeaveItem extends StatelessWidget {
  final DoctorLeave leave;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  const _LeaveItem({
    required this.leave,
    required this.onEdit,
    required this.onCancel,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(leave.status);
    final isHalfDay = leave.daysType != 'full_day' && leave.daysType != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Status Strip
            Container(width: 4, color: statusColor),
            const SizedBox(width: 4),
            // Leave Type Icon
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.event_note, color: statusColor, size: 16),
            ),
            const SizedBox(width: 4),
            // Info Sections
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          DoctorDetailsViewModel.formatLeaveType(
                            leave.leaveType,
                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: kPrimaryText,
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Session Indicator with Icon
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1.5,
                          ),
                          decoration: BoxDecoration(
                            color: isHalfDay
                                ? Colors.blue.shade50
                                : Colors.indigo.shade50,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isHalfDay
                                  ? Colors.blue.shade100
                                  : Colors.indigo.shade100,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                leave.daysType == 'morning'
                                    ? Icons.wb_sunny_outlined
                                    : leave.daysType == 'afternoon'
                                    ? Icons.wb_twilight
                                    : Icons.calendar_today_outlined,
                                size: 10,
                                color: isHalfDay
                                    ? Colors.blue.shade700
                                    : Colors.indigo.shade700,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isHalfDay
                                    ? DoctorDetailsViewModel.formatDaysType(
                                        leave.daysType!,
                                      )
                                    : 'Full Day',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: isHalfDay
                                      ? Colors.blue.shade800
                                      : Colors.indigo.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            leave.status.toLowerCase(),
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 10,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${DoctorDetailsViewModel.formatDate(leave.fromDate)}${leave.fromDate != leave.toDate ? ' to ${DoctorDetailsViewModel.formatDate(leave.toDate)}' : ''}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Total Days Badge
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isHalfDay ? '0.5' : leave.totalDays.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const Text(
                    'DAYS',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Actions
            if (leave.status.toLowerCase() == 'pending' ||
                leave.status.toLowerCase() == 'approved')
              PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey.shade400,
                  size: 18,
                ),
                onSelected: (value) {
                  if (value == 'edit') {
                    onEdit();
                  } else if (value == 'cancel') {
                    onCancel();
                  }
                },
                itemBuilder: (context) {
                  final isPending = leave.status.toLowerCase() == 'pending';
                  return [
                    if (isPending)
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 14, color: kPrimaryText),
                            SizedBox(width: 4),
                            Text('Edit', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    const PopupMenuItem(
                      value: 'cancel',
                      child: Row(
                        children: [
                          Icon(Icons.cancel, size: 14, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            'Cancel',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
          ],
        ),
      ),
    );
  }
}

// Dialog for Leave
class _ApplyLeaveDialog extends StatefulWidget {
  final DoctorDetailsViewModel viewModel;
  final String doctorId;
  final DoctorLeave? leave;
  const _ApplyLeaveDialog({
    required this.viewModel,
    required this.doctorId,
    this.leave,
  });

  @override
  State<_ApplyLeaveDialog> createState() => _ApplyLeaveDialogState();
}

class _ApplyLeaveDialogState extends State<_ApplyLeaveDialog> {
  final _formKey = GlobalKey<FormState>();
  String _leaveType = 'casual_leave';
  String _daysType = 'full_day';
  late DateTime _fromDate;
  late DateTime _toDate;
  final TextEditingController _reasonController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    if (widget.leave != null) {
      // Data Migration: If legacy leave had timing in leaveType, move it to _daysType
      final legacyType = widget.leave!.leaveType.toLowerCase();
      if (['morning', 'afternoon', 'full_day'].contains(legacyType)) {
        _leaveType = 'other';
        _daysType = legacyType;
      } else {
        _leaveType = widget.leave!.leaveType;
        _daysType = widget.leave!.daysType ?? 'full_day';
      }
      _fromDate = DateTime.parse(widget.leave!.fromDate);
      _toDate = DateTime.parse(widget.leave!.toDate);
      _reasonController.text = widget.leave!.reason;
    } else {
      _fromDate = DateTime.now();
      _toDate = DateTime.now();
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? _fromDate : _toDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && mounted) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
          if (_toDate.isBefore(_fromDate)) _toDate = picked;
        } else {
          _toDate = picked;
          if (_fromDate.isAfter(_toDate)) _fromDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.leave != null;
    return AlertDialog(
      title: Text(isEdit ? 'Update Leave' : 'Apply Leave'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Leave Type (REASON ONLY)
              DropdownButtonFormField<String>(
                value: _leaveType,
                decoration: const InputDecoration(
                  labelText: 'Leave Type (Reason)',
                  border: OutlineInputBorder(),
                  helperText: 'Select the reason for your leave',
                ),
                items:
                    [
                          'sick_leave',
                          'vacation',
                          'emergency',
                          'casual_leave',
                          'other',
                        ]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.replaceAll('_', ' ').toUpperCase()),
                          ),
                        )
                        .toList(),
                onChanged: (v) => setState(() => _leaveType = v!),
              ),
              const SizedBox(height: 16),

              // Key Dates
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, true),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'From',
                          border: OutlineInputBorder(),
                        ),
                        child: Text("${_fromDate.toLocal()}".split(' ')[0]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, false),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'To',
                          border: OutlineInputBorder(),
                        ),
                        child: Text("${_toDate.toLocal()}".split(' ')[0]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Days Type (DURATION / TIMING)
              DropdownButtonFormField<String>(
                value: _daysType,
                decoration: const InputDecoration(
                  labelText: 'Leave Duration (Timing)',
                  border: OutlineInputBorder(),
                  helperText: 'Which slots should be disabled?',
                ),
                items: [
                  const DropdownMenuItem(
                    value: 'full_day',
                    child: Text('FULL DAY (ALL SLOTS)'),
                  ),
                  const DropdownMenuItem(
                    value: 'morning',
                    child: Text('MORNING ONLY'),
                  ),
                  const DropdownMenuItem(
                    value: 'afternoon',
                    child: Text('AFTERNOON ONLY'),
                  ),
                ],
                onChanged: (v) => setState(() => _daysType = v!),
              ),
              const SizedBox(height: 16),

              // Reason (Reason is MANDATORY per API, min 10 chars)
              TextFormField(
                controller: _reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(),
                  hintText: 'Enter reason for leave (min 10 characters)',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Reason is required';
                  }
                  if (value.trim().length < 10) {
                    return 'Reason must be at least 10 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _submit,
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryText,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
          ),
          child: _isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(widget.leave != null ? 'Update' : 'Apply'),
        ),
      ],
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final clinic = context.read<AuthViewModel>().user?.clinicId;
      if (clinic == null) throw "Clinic ID missing";

      if (widget.leave != null) {
        // Handle Update
        final updateReq = UpdateLeaveRequest(
          doctorId: widget.doctorId,
          clinicId: clinic,
          leaveType: _leaveType,
          fromDate: _fromDate.toString().split(' ')[0],
          toDate: _toDate.toString().split(' ')[0],
          daysType: _daysType,
          reason: _reasonController.text.trim(),
        );

        final success = await widget.viewModel.updateLeave(
          leaveId: widget.leave!.id,
          request: updateReq,
        );

        if (success && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Leave updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (mounted) {
          throw widget.viewModel.error.isNotEmpty
              ? widget.viewModel.error
              : 'Failed to update leave';
        }
      } else {
        // Handle Apply
        final req = ApplyLeaveRequest(
          doctorId: widget.doctorId,
          clinicId: clinic,
          leaveType: _leaveType,
          fromDate: _fromDate.toString().split(' ')[0], // YYYY-MM-DD
          toDate: _toDate.toString().split(' ')[0],
          daysType: _daysType,
          reason: _reasonController.text.trim(),
        );

        final result = await widget.viewModel.applyLeave(req);

        if (result != null && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Leave applied successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (mounted) {
          throw widget.viewModel.error.isNotEmpty
              ? widget.viewModel.error
              : 'Failed to apply leave';
        }
      }
    } catch (e) {
      if (mounted)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }
}

// --- Generic Components ---

class _SectionContainer extends StatelessWidget {
  final Widget child;
  const _SectionContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kBorderColor),
        // OPTIMIZED SHADOW for Web (lower blur, no heavy spread)
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  const _ErrorView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(error, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: const Text(
        'Copyright © 2025 DrMe All rights reserved',
        style: TextStyle(fontSize: 12, color: kSecondaryText),
        textAlign: TextAlign.center,
      ),
    );
  }
}
