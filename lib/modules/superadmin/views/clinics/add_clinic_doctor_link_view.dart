import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_model.dart';
import 'package:a/modules/doctor/models/doctor_model.dart';
import 'package:a/modules/doctor/viewmodels/doctor_viewmodel.dart';

class AddClinicDoctorLinkScreen extends StatefulWidget {
  const AddClinicDoctorLinkScreen({super.key});

  @override
  _AddClinicDoctorLinkScreenState createState() =>
      _AddClinicDoctorLinkScreenState();
}

class _AddClinicDoctorLinkScreenState extends State<AddClinicDoctorLinkScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  DoctorModel? _selectedDoctor;
  final List<String> _selectedClinics = [];
  String _searchQuery = '';

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

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

    // Load clinicVM when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
      final doctorVM = Provider.of<DoctorViewModel>(context, listen: false);
      clinicVM.fetchClinics(context);
      doctorVM.fetchDoctors(context);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
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
                                      Color(0xFF8B5CF6),
                                      Color(0xFFA78BFA),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.link,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Create Clinic-Doctor Links',
                                  style: TextStyle(
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
                                  // Doctor Selection Section
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
                                              0xFF8B5CF6,
                                            ).withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.medical_services,
                                            color: Color(0xFF8B5CF6),
                                            size: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Select Doctor',
                                          style: TextStyle(
                                            fontSize: isMobile ? 14 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF333333),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Search Field
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText:
                                          'Search doctor by name or specialization',
                                      hintStyle: const TextStyle(
                                        color: Color(0xFFB3B3B3),
                                        fontSize: 14,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Color(0xFF666666),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                          color: Color(0xFF8B5CF6),
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
                                  const SizedBox(height: 16),

                                  // Doctor List
                                  Consumer<DoctorViewModel>(
                                    builder: (context, doctorVM, child) {
                                      if (doctorVM.isLoading) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(40),
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }

                                      if (doctorVM.error != null) {
                                        return Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.red[50],
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: Colors.red.shade200,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              ),
                                              const SizedBox(height: 8),
                                              Text('Error: ${doctorVM.error}'),
                                              const SizedBox(height: 8),
                                              ElevatedButton(
                                                onPressed: () {
                                                  doctorVM.clearError();
                                                  doctorVM.fetchDoctors(
                                                    context,
                                                  );
                                                },
                                                child: const Text('Retry'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      final filteredDoctors = doctorVM.doctors
                                          .where((doctor) {
                                            if (_searchQuery.isEmpty)
                                              return true;
                                            final searchLower = _searchQuery
                                                .toLowerCase();
                                            return (doctor.firstName
                                                        ?.toLowerCase()
                                                        .contains(
                                                          searchLower,
                                                        ) ==
                                                    true) ||
                                                (doctor.lastName
                                                        ?.toLowerCase()
                                                        .contains(
                                                          searchLower,
                                                        ) ==
                                                    true) ||
                                                (doctor.specialization
                                                        ?.toLowerCase()
                                                        .contains(
                                                          searchLower,
                                                        ) ==
                                                    true) ||
                                                (doctor.email
                                                        ?.toLowerCase()
                                                        .contains(
                                                          searchLower,
                                                        ) ==
                                                    true);
                                          })
                                          .toList();

                                      return Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 200,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFE0E0E0),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: ListView.builder(
                                          itemCount: filteredDoctors.length,
                                          itemBuilder: (context, index) {
                                            final doctor =
                                                filteredDoctors[index];
                                            final isSelected =
                                                _selectedDoctor?.doctorCode ==
                                                doctor.doctorCode;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? const Color(
                                                        0xFF8B5CF6,
                                                      ).withValues(alpha: 0.1)
                                                    : null,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: const Color(
                                                      0xFFE0E0E0,
                                                    ),
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor: isSelected
                                                      ? const Color(0xFF8B5CF6)
                                                      : Colors.blueAccent,
                                                  child: Text(
                                                    _getDoctorInitials(
                                                      doctor.firstName,
                                                      doctor.lastName,
                                                    ),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  _getDoctorFullName(
                                                    doctor.firstName,
                                                    doctor.lastName,
                                                  ),
                                                  style: TextStyle(
                                                    fontWeight: isSelected
                                                        ? FontWeight.w600
                                                        : FontWeight.normal,
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (doctor.specialization !=
                                                        null)
                                                      Text(
                                                        doctor.specialization!,
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    if (doctor.email != null)
                                                      Text(
                                                        doctor.email!,
                                                        style: const TextStyle(
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                trailing: isSelected
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        color: Color(
                                                          0xFF8B5CF6,
                                                        ),
                                                      )
                                                    : null,
                                                onTap: () {
                                                  setState(() {
                                                    _selectedDoctor = doctor;
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 24),

                                  // Clinic Selection Section
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
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.local_hospital,
                                            color: Color(0xFF10B981),
                                            size: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Select Clinics',
                                          style: TextStyle(
                                            fontSize: isMobile ? 14 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF333333),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF10B981),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Text(
                                            '${_selectedClinics.length} selected',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Clinic List
                                  Consumer<ClinicViewModel>(
                                    builder: (context, clinicVM, child) {
                                      if (clinicVM.isLoading) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(40),
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }

                                      if (clinicVM.error != null) {
                                        return Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.red[50],
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: Colors.red.shade200,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              ),
                                              const SizedBox(height: 8),
                                              Text('Error: ${clinicVM.error}'),
                                              const SizedBox(height: 8),
                                              ElevatedButton(
                                                onPressed: () {
                                                  clinicVM.clearError();
                                                  clinicVM.fetchClinics(
                                                    context,
                                                  );
                                                },
                                                child: const Text('Retry'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      return Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 300,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFE0E0E0),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: ListView.builder(
                                          itemCount: clinicVM.clinics.length,
                                          itemBuilder: (context, index) {
                                            final clinic =
                                                clinicVM.clinics[index];
                                            final isSelected = _selectedClinics
                                                .contains(clinic.clinicCode);

                                            return Container(
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? const Color(
                                                        0xFF10B981,
                                                      ).withValues(alpha: 0.1)
                                                    : null,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: const Color(
                                                      0xFFE0E0E0,
                                                    ),
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: CheckboxListTile(
                                                title: Text(
                                                  clinic.name,
                                                  style: TextStyle(
                                                    fontWeight: isSelected
                                                        ? FontWeight.w600
                                                        : FontWeight.normal,
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Code: ${clinic.clinicCode}',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    if (clinic.phone != null)
                                                      Text(
                                                        'Phone: ${clinic.phone!}',
                                                        style: const TextStyle(
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                value: isSelected,
                                                activeColor: const Color(
                                                  0xFF10B981,
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (value == true) {
                                                      _selectedClinics.add(
                                                        clinic.clinicCode,
                                                      );
                                                    } else {
                                                      _selectedClinics.remove(
                                                        clinic.clinicCode,
                                                      );
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 32),

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
                                        child: Consumer<ClinicViewModel>(
                                          builder: (context, clinicVM, child) {
                                            final canSubmit =
                                                _selectedDoctor != null &&
                                                _selectedClinics.isNotEmpty;
                                            return ElevatedButton(
                                              onPressed:
                                                  (clinicVM.isLinking ||
                                                      !canSubmit)
                                                  ? null
                                                  : () => _createLinks(context),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF8B5CF6,
                                                ),
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
                                              child: clinicVM.isLinking
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
                                                      'Create ${_selectedClinics.length} Link${_selectedClinics.length > 1 ? 's' : ''}',
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

  String _getDoctorInitials(String? firstName, String? lastName) {
    String first = firstName?.isNotEmpty == true
        ? firstName![0].toUpperCase()
        : 'D';
    String last = lastName?.isNotEmpty == true
        ? lastName![0].toUpperCase()
        : 'R';
    return '$first$last';
  }

  String _getDoctorFullName(String? firstName, String? lastName) {
    if (firstName != null && lastName != null) {
      return 'Dr. $firstName $lastName';
    } else if (firstName != null) {
      return 'Dr. $firstName';
    } else if (lastName != null) {
      return 'Dr. $lastName';
    } else {
      return 'Dr. Unknown';
    }
  }

  void _createLinks(BuildContext context) async {
    final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

    // Validate doctor has required IDs
    if (_selectedDoctor?.userId == null || _selectedDoctor!.userId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Selected doctor does not have a valid User ID'),
          backgroundColor: Color(0xFFDC2626),
        ),
      );
      return;
    }

    if (_selectedDoctor?.drid == null || _selectedDoctor!.drid!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error: Selected doctor does not have a valid Doctor ID',
          ),
          backgroundColor: Color(0xFFDC2626),
        ),
      );
      return;
    }

    bool allSuccess = true;
    int successCount = 0;
    List<String> failedClinics = [];

    for (String clinicCode in _selectedClinics) {
      final clinic = clinicVM.clinics.firstWhere(
        (c) => c.clinicCode == clinicCode,
        orElse: () => ClinicModel(
          organizationId: 'temp',
          clinicCode: clinicCode,
          name: 'Unknown Clinic',
        ),
      );

      if (clinic.id == null || clinic.id!.isEmpty) {
        failedClinics.add('${clinic.name} (No valid ID)');
        allSuccess = false;
        continue;
      }

      final success = await clinicVM.addClinicDoctorLinkSimple(
        clinic.id!, // clinic_id for API
        _selectedDoctor!.drid!, // doctor_id for API
        context,
      );

      if (success) {
        successCount++;
      } else {
        failedClinics.add(clinic.name);
        allSuccess = false;
      }
    }

    if (mounted) {
      if (allSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successfully created $successCount clinic-doctor link${successCount > 1 ? 's' : ''}!',
            ),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        _closePanel();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Created $successCount link(s). Failed: ${failedClinics.join(', ')}',
            ),
            backgroundColor: const Color(0xFFF59E0B),
          ),
        );
      }
    }
  }
}
