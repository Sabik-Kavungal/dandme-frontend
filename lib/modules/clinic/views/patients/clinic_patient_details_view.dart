import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/patient_full_details_model.dart';
import 'package:drandme/modules/clinic/repositories/clinic_patient_repository.dart';
import 'package:drandme/core/config/service.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:drandme/modules/clinic/views/appointments/widgets/impressive_appointment_container.dart';

// --- SAAS STYLE CONSTANTS ---
class SaaSStyles {
  static const Color primaryColor = Color(0xFF1E293B);
  static const Color backgroundColor = Color(0xFFF1F5F9);
  static const Color cardBackground = Colors.white;
  static const Color borderColor = Color(0xFFE2E8F0);
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64758B);
  static const Color accentColor = Color(0xFF3B82F6);
  static const Color successColor = Color(0xFF10B981);
  static const Color warningColor = Color(0xFFF59E0B);
}

class ClinicPatientDetailsView extends StatefulWidget {
  final String patientId;

  const ClinicPatientDetailsView({super.key, required this.patientId});

  @override
  State<ClinicPatientDetailsView> createState() =>
      _ClinicPatientDetailsViewState();
}

class _ClinicPatientDetailsViewState extends State<ClinicPatientDetailsView>
    with SingleTickerProviderStateMixin {
  late final ClinicPatientRepository _repository;
  PatientFullDetailsResponse? _details;
  bool _isLoading = true;
  String _error = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _repository = ClinicPatientRepository(ServiceRepo());
    _tabController = TabController(length: 3, vsync: this);
    _loadPatientDetails();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadPatientDetails() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      final token = authViewModel.accessToken;

      if (token == null) {
        if (mounted) {
          setState(() {
            _error = 'Authentication required';
            _isLoading = false;
          });
        }
        return;
      }

      final response = await _repository.getPatientFullDetails(
        token: token,
        patientId: widget.patientId,
      );

      if (mounted) {
        if (response != null) {
          setState(() {
            _details = response;
            _isLoading = false;
          });
        } else {
          setState(() {
            _error = 'Failed to load patient details';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Error loading details: $e';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: SaaSStyles.backgroundColor,
        child: const Center(child: AppLoader(size: 50, strokeWidth: 3)),
      );
    }

    if (_error.isNotEmpty) {
      return Container(
        color: SaaSStyles.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
              const SizedBox(height: 16),
              Text(
                _error,
                style: TextStyle(color: Colors.red[700], fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SaaSStyles.accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _loadPatientDetails,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_details == null) {
      return Container(
        color: SaaSStyles.backgroundColor,
        child: const Center(child: Text('Patient details not available.')),
      );
    }

    return Container(
      color: SaaSStyles.backgroundColor,
      padding: const EdgeInsets.all(8),
      child: ImpressiveAppointmentContainer(
        child: Column(
          children: [
            _buildHeaderSection(_details!.patientInfo),
            _buildTopStatsRow(_details!),
            const SizedBox(height: 8),
            _buildCustomTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMedicalDetailsTab(_details!),
                  _buildDoctorsVisitedTab(_details!.doctorVisits),
                  _buildTimelineTab(_details!.visitTimeline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(PatientInfo info) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            SaaSStyles.backgroundColor.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: SaaSStyles.accentColor.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: SaaSStyles.accentColor.withValues(alpha: 0.1),
              child: Text(
                info.fullName.isNotEmpty ? info.fullName[0].toUpperCase() : 'P',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: SaaSStyles.accentColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        info.fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: SaaSStyles.textPrimary,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _showEditPatientDialog(info),
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: SaaSStyles.accentColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    _buildHeaderBadge(Icons.phone, info.phone),
                    if (info.moid.isNotEmpty)
                      _buildHeaderBadge(Icons.badge, 'MOID: ${info.moid}'),
                    _buildHeaderBadge(Icons.wc, info.gender),
                    if (info.address.isNotEmpty)
                      _buildHeaderBadge(Icons.location_on_outlined, info.address),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: SaaSStyles.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: SaaSStyles.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: SaaSStyles.textSecondary),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: SaaSStyles.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopStatsRow(PatientFullDetailsResponse details) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildPremiumStatCard(
              'TOTAL APPOINTMENTS',
              details.totalAppointments.toString(),
              Icons.calendar_today,
              const Color(0xFF6366F1), // Indigo
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildPremiumStatCard(
              'TOTAL REVENUE',
              'Rs. ${details.totalSpent.toStringAsFixed(0)}',
              Icons.payments_outlined,
              const Color(0xFF10B981), // Emerald
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildPremiumStatCard(
              'PATIENT METRICS',
              '${details.patientInfo.age}y • ${details.patientInfo.bloodGroup.isEmpty ? '-' : details.patientInfo.bloodGroup}',
              Icons.analytics_outlined,
              const Color(0xFFF59E0B), // Amber
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumStatCard(
    String title,
    String value,
    IconData icon,
    Color accent,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SaaSStyles.borderColor),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 14, color: accent),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: SaaSStyles.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: SaaSStyles.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: SaaSStyles.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SaaSStyles.borderColor),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: SaaSStyles.textSecondary,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: SaaSStyles.primaryColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        indicatorColor: Colors.transparent,
        tabs: const [
          Tab(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.medical_information, size: 14),
                SizedBox(width: 6),
                Text(
                  'Medical',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Tab(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people_outline, size: 14),
                SizedBox(width: 6),
                Text(
                  'Doctors',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Tab(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history_toggle_off, size: 14),
                SizedBox(width: 6),
                Text(
                  'Timeline',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalDetailsTab(PatientFullDetailsResponse details) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader(Icons.monitor_heart, 'RECENT VITAL SIGNS'),
        const SizedBox(height: 16),
        if (details.recentVitals.isEmpty)
          _buildEmptyState('No vitals recorded recently.')
        else
          ...details.recentVitals.map((v) => _buildVitalCard(v)),

        const SizedBox(height: 32),
        _buildSectionHeader(Icons.history_edu, 'MEDICAL HISTORY & NOTES'),
        const SizedBox(height: 16),
        _buildExpandingInfoCard(
          'History',
          details.patientInfo.medicalHistory,
          Icons.description_outlined,
          Colors.blueGrey,
        ),
        const SizedBox(height: 16),
        _buildExpandingInfoCard(
          'Allergies & Sensitivities',
          details.patientInfo.allergies,
          Icons.warning_amber_rounded,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 18, color: SaaSStyles.textPrimary),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: SaaSStyles.textPrimary,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: SaaSStyles.borderColor, thickness: 1)),
      ],
    );
  }

  Widget _buildVitalCard(VitalSignSummary v) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SaaSStyles.borderColor),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: SaaSStyles.backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 10,
                  color: SaaSStyles.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Recorded on ${v.recordedAt}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: SaaSStyles.textSecondary,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                _buildVitalMetric(
                  'BP',
                  v.bloodPressure,
                  'mmHg',
                  Icons.monitor_heart,
                  Colors.red,
                ),
                _buildVitalMetric(
                  'PULSE',
                  v.pulseRate.toString(),
                  'bpm',
                  Icons.favorite,
                  Colors.pink,
                ),
                _buildVitalMetric(
                  'TEMP',
                  '${v.temperature}°',
                  'C',
                  Icons.thermostat,
                  Colors.orange,
                ),
                _buildVitalMetric(
                  'WEIGHT',
                  v.weightKg.toString(),
                  'kg',
                  Icons.scale,
                  Colors.blue,
                ),
                _buildVitalMetric(
                  'SPO2',
                  '${v.spo2}%',
                  '%',
                  Icons.bloodtype,
                  Colors.indigo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVitalMetric(
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    if (value == '0' || value == '0.0' || value == '0%' || value.isEmpty) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 14, color: color),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w900,
                color: SaaSStyles.textSecondary,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: SaaSStyles.textPrimary,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 10,
                    color: SaaSStyles.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandingInfoCard(
    String title,
    String content,
    IconData icon,
    Color color,
  ) {
    final text = content.isEmpty
        ? 'No data specifically recorded for this section.'
        : content;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SaaSStyles.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: color,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              height: 1.4,
              color: SaaSStyles.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsVisitedTab(List<DoctorVisitSummary> doctorVisits) {
    if (doctorVisits.isEmpty) {
      return _buildEmptyState('No consultation history found.');
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: doctorVisits.length,
      itemBuilder: (context, index) {
        final summary = doctorVisits[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: SaaSStyles.borderColor),
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: SaaSStyles.accentColor.withValues(alpha: 0.1),
              child: const Icon(
                Icons.person_outline,
                color: SaaSStyles.accentColor,
                size: 18,
              ),
            ),
            title: Text(
              summary.doctorName,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13,
                color: SaaSStyles.textPrimary,
              ),
            ),
            subtitle: Text(
              '${summary.totalVisits} Visits • Rs. ${summary.totalPaid.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 11,
                color: SaaSStyles.textSecondary,
              ),
            ),
            children: [
              Container(
                color: SaaSStyles.backgroundColor.withValues(alpha: 0.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    _buildMiniBadge(
                      'WALK-INS: ${summary.walkinVisits}',
                      Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    _buildMiniBadge(
                      'REGULAR: ${summary.normalVisits}',
                      Colors.purple,
                    ),
                    const Spacer(),
                    Text(
                      summary.departmentName,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: SaaSStyles.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              ...summary.appointments.map(
                (appt) => _buildAppointmentListItem(appt),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppointmentListItem(DetailAppointment appt) {
    final isWalkin = appt.type == 'walk_in';
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: SaaSStyles.borderColor)),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: (isWalkin ? Colors.blue : const Color(0xFF10B981))
                .withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isWalkin ? Icons.directions_walk : Icons.calendar_today,
            size: 14,
            color: isWalkin ? Colors.blue : const Color(0xFF10B981),
          ),
        ),
        title: Text(
          '${appt.date} • ${appt.time}',
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 12,
            color: SaaSStyles.textPrimary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              'Dx: ${appt.diagnosis.isEmpty ? "Pending" : appt.diagnosis}',
              style: const TextStyle(
                fontSize: 11,
                color: SaaSStyles.textSecondary,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(
                  Icons.sync_alt,
                  size: 8,
                  color: SaaSStyles.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Follow-up: ${appt.followupStatus}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: appt.followupStatus.toLowerCase() == 'active'
                        ? SaaSStyles.successColor
                        : SaaSStyles.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildStatusBadge(appt.status),
            const SizedBox(height: 4),
            Text(
              'Rs. ${appt.feeAmount.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                color: appt.paymentStatus == 'completed'
                    ? SaaSStyles.successColor
                    : SaaSStyles.warningColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'completed':
        color = SaaSStyles.successColor;
        break;
      case 'waiting':
        color = SaaSStyles.warningColor;
        break;
      default:
        color = SaaSStyles.textSecondary;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
    );
  }

  Widget _buildMiniBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
    );
  }

  Widget _buildTimelineTab(List<TimelineEventSummary> timeline) {
    if (timeline.isEmpty) {
      return _buildEmptyState('No historical events recorded.');
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: timeline.length,
      itemBuilder: (context, index) {
        final event = timeline[index];
        final isLast = index == timeline.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: SaaSStyles.accentColor,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: SaaSStyles.accentColor.withValues(alpha: 0.2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 1.5,
                        color: SaaSStyles.borderColor,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.date,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: SaaSStyles.textSecondary,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: SaaSStyles.borderColor),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.description,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: SaaSStyles.textPrimary,
                              ),
                            ),
                            if (event.type.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              _buildMiniBadge(
                                event.type.toUpperCase(),
                                SaaSStyles.textSecondary,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: SaaSStyles.textSecondary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              color: SaaSStyles.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditPatientDialog(PatientInfo info) {
    final firstNameController = TextEditingController(text: info.firstName);
    final lastNameController = TextEditingController(text: info.lastName);
    final phoneController = TextEditingController(text: info.phone);
    final historyController = TextEditingController(text: info.medicalHistory);
    final allergiesController = TextEditingController(text: info.allergies);
    final ageController = TextEditingController(text: info.age.toString());
    final addressController = TextEditingController(text: info.address);

    String? selectedGender = info.gender.isNotEmpty ? info.gender : null;
    String? selectedBloodGroup = info.bloodGroup.isNotEmpty
        ? info.bloodGroup
        : null;

    final genders = ['Male', 'Female', 'Other'];
    final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DialogTitleBar(
                title: 'Edit Patient Profile',
                onClose: () => Navigator.pop(context),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: StatefulBuilder(
                    builder: (context, setDialogState) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _DialogField(
                                label: 'First Name',
                                hint: 'Enter first name',
                                controller: firstNameController,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _DialogField(
                                label: 'Last Name',
                                hint: 'Enter last name',
                                controller: lastNameController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _DialogField(
                          label: 'Phone Number',
                          hint: 'Enter phone number',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 16),
                        _DialogField(
                          label: 'Address',
                          hint: 'Enter address',
                          controller: addressController,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _DialogField(
                                label: 'Age',
                                hint: '0',
                                controller: ageController,
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
                                  _buildDialogDropdown(
                                    value: genders.contains(selectedGender)
                                        ? selectedGender
                                        : null,
                                    items: genders,
                                    onChanged: (v) => setDialogState(
                                      () => selectedGender = v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const _DialogLabel('Blood Group'),
                        const SizedBox(height: 6),
                        _buildDialogDropdown(
                          value: bloodGroups.contains(selectedBloodGroup)
                              ? selectedBloodGroup
                              : null,
                          items: bloodGroups,
                          onChanged: (v) =>
                              setDialogState(() => selectedBloodGroup = v),
                        ),
                        const SizedBox(height: 16),
                        _DialogField(
                          label: 'Medical History',
                          hint: 'Enter medical history...',
                          controller: historyController,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 16),
                        _DialogField(
                          label: 'Allergies',
                          hint: 'Enter known allergies...',
                          controller: allergiesController,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _DialogActions(
                onCancel: () => Navigator.pop(context),
                onSave: () async {
                  final input = UpdatePatientInput(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phone: phoneController.text,
                    medicalHistory: historyController.text,
                    allergies: allergiesController.text,
                    age: int.tryParse(ageController.text),
                    gender: selectedGender,
                    bloodGroup: selectedBloodGroup,
                    address: addressController.text.trim(),
                  );
                  Navigator.pop(context);
                  await _updatePatientDetails(input);
                },
                saveLabel: 'Save Changes',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updatePatientDetails(UpdatePatientInput input) async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final token = authViewModel.accessToken;
    if (token == null) return;

    setState(() => _isLoading = true);
    try {
      final repository = ClinicPatientRepository(ServiceRepo());
      final updated = await repository.updatePatient(
        token: token,
        patientId: widget.patientId,
        updates: input.toJson(),
      );

      if (updated != null && mounted) {
        _loadPatientDetails();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Patient updated successfully'),
            backgroundColor: SaaSStyles.successColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Update failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildDialogDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: const Text(
            'Select',
            style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: Color(0xFF6B7280),
          ),
          style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A2E)),
          items: items
              .map((g) => DropdownMenuItem(value: g, child: Text(g)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// ─── Dialog Helper Widgets ─────────────────────────────────────────────────────

class _DialogTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback onClose;
  const _DialogTitleBar({required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 8, 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(
              Icons.close_rounded,
              size: 18,
              color: Color(0xFF6B7280),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

class _DialogLabel extends StatelessWidget {
  final String text;
  const _DialogLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A2E),
    ),
  );
}

class _DialogField extends StatelessWidget {
  final String label, hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLines;

  const _DialogField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DialogLabel(label),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A2E)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 13,
            ),
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _DialogActions extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final String saveLabel;

  const _DialogActions({
    required this.onCancel,
    required this.onSave,
    required this.saveLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF6B7280),
                side: const BorderSide(color: Color(0xFFE5E7EB)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                saveLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
