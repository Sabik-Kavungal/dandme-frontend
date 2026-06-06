import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_dashboard_model.dart';

// --- VISUAL CONSTANTS FOR CLASSY SLATE MATCH ---
const kBgColor = Color(0xFFFFFFFF); // Pure White Background for pastel contrast
const kCardColor = Colors.white;
const kPrimaryText = Color(0xFF0F172A); // Deep Slate 900
const kSecondaryText = Color(0xFF475569); // Slate 600
const kBlueColor = Color(0xFF0284C7); // Professional Sky/Health Blue
const kOrangeColor = Color(0xFFD97706); // Soft Amber
const kPurpleColor = Color(0xFF4F46E5); // Trustworthy Indigo
const kGreenColor = Color(0xFF059669); // Clean Emerald
const kRedColor = Color(0xFFDC2626); // Alert Crimson
const kBorderColor = Color(0xFFE2E8F0); // Subtle Slate 200 Border
const kCardRadius = 10.0; // Reduced radius for sharper look

class ClinicAdminDashboard extends StatefulWidget {
  final Function(String)? onNavigate;

  const ClinicAdminDashboard({super.key, this.onNavigate});

  @override
  State<ClinicAdminDashboard> createState() => _ClinicAdminDashboardState();
}

class _ClinicAdminDashboardState extends State<ClinicAdminDashboard> {
  late AppointmentDashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AppointmentDashboardViewModel(
      Provider.of<AuthViewModel>(context, listen: false),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadClinicDashboard();
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<AppointmentDashboardViewModel>(
        builder: (context, viewModel, child) {
          final dashboardData = viewModel.clinicDashboardData;

          return Material(
            color: kBgColor,
            child: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox.shrink(),
                            _DashboardDateRangeSelector(viewModel: viewModel),

                          ],
                        ),
                        const SizedBox(height: 6),
                        _StatsCardsRow(data: dashboardData),
                        const SizedBox(height: 6),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 900) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: _AppointmentsListCard(
                                      data: dashboardData,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    flex: 1,
                                    child: _PharmacyLabSection(
                                      data: dashboardData,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  _AppointmentsListCard(data: dashboardData),
                                  const SizedBox(height: 6),
                                  _PharmacyLabSection(data: dashboardData),
                                ],
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 6),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 900) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: _PatientsDonutCard(
                                      data: dashboardData,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    flex: 2,
                                    child: _StaffAttendanceCard(
                                      data: dashboardData,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  _PatientsDonutCard(data: dashboardData),
                                  const SizedBox(height: 20),
                                  _StaffAttendanceCard(data: dashboardData),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

// Stats Cards Row
class _StatsCardsRow extends StatelessWidget {
  final ClinicDashboardData? data;
  const _StatsCardsRow({this.data});

  @override
  Widget build(BuildContext context) {
    final totalAppts = data?.totalAppointments.toString() ?? "0";
    final totalTrend = data?.totalAppointmentsTrend ?? "+0.0%";

    final completedTotal = data?.completedAppointments.total.toString() ?? "0";
    final completedTrend = data?.completedAppointments.trend ?? "+0.0%";

    final String revenueStr = data?.totalRevenue.toStringAsFixed(2) ?? "0.00";
    final income = "₹$revenueStr";
    final incomeTrend = data?.totalRevenueTrend ?? "+0.0%";

    final clinicVisits =
        data?.completedAppointments.clinicVisits.toString() ?? "0";
    final onlineVisits =
        data?.completedAppointments.onlineVisits.toString() ?? "0";

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: _StatCard(
                  title: "Total Appointments",
                  value: totalAppts,
                  badge: totalTrend,
                  iconColor: kBlueColor,
                  icon: Icons.calendar_today_rounded,
                  waveStyle: 0,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _CompletedAppointmentsCard(
                  total: completedTotal,
                  trend: completedTrend,
                  clinicVisits: clinicVisits,
                  onlineVisits: onlineVisits,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _StatCard(
                  title: "Business Volume",
                  value: income,
                  badge: incomeTrend,
                  iconColor: kPurpleColor,
                  icon: Icons.account_balance_wallet_outlined,
                  waveStyle: 1,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              _StatCard(
                title: "Total Appointments",
                value: totalAppts,
                badge: totalTrend,
                iconColor: kBlueColor,
                icon: Icons.calendar_today_rounded,
                waveStyle: 0,
              ),
              const SizedBox(height: 12),
              _CompletedAppointmentsCard(
                total: completedTotal,
                trend: completedTrend,
                clinicVisits: clinicVisits,
                onlineVisits: onlineVisits,
              ),
              const SizedBox(height: 12),
              _StatCard(
                title: "Business Volume",
                value: income,
                badge: incomeTrend,
                iconColor: kPurpleColor,
                icon: Icons.account_balance_wallet_outlined,
                waveStyle: 1,
              ),
            ],
          );
        }
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String badge;
  final Color iconColor;
  final IconData icon;
  final int waveStyle;

  const _StatCard({
    required this.title,
    required this.value,
    required this.badge,
    required this.iconColor,
    required this.icon,
    this.waveStyle = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105, 
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(kCardRadius),
        border: Border.all(color: kBorderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: const TextStyle(
                          color: kSecondaryText,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: const TextStyle(
                          color: kPrimaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: badge.startsWith('-')
                      ? kRedColor.withOpacity(0.1)
                      : kGreenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: badge.startsWith('-') ? kRedColor : kGreenColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 36,
            width: double.infinity,
            child: CustomPaint(
              painter: _WaveChartPainter(color: iconColor, style: waveStyle),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompletedAppointmentsCard extends StatelessWidget {
  final String total;
  final String trend;
  final String clinicVisits;
  final String onlineVisits;

  const _CompletedAppointmentsCard({
    required this.total,
    required this.trend,
    required this.clinicVisits,
    required this.onlineVisits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105, 
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(kCardRadius),
        border: Border.all(color: kBorderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kOrangeColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.assignment_turned_in_outlined,
                      color: kOrangeColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "COMPLETED APPOINTMENTS",
                        style: TextStyle(
                          color: kSecondaryText,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        total,
                        style: const TextStyle(
                          color: kPrimaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: trend.startsWith('-')
                      ? kRedColor.withOpacity(0.1)
                      : kGreenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  trend,
                  style: TextStyle(
                    color: trend.startsWith('-') ? kRedColor : kGreenColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSubStat(
                Icons.videocam_outlined,
                "Video Consult",
                onlineVisits,
              ),
              _buildSubStat(
                Icons.local_hospital_outlined,
                "Hospital Consult",
                clinicVisits,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubStat(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: kSecondaryText),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                color: kSecondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: kPrimaryText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AppointmentsListCard extends StatelessWidget {
  final ClinicDashboardData? data;
  const _AppointmentsListCard({this.data});

  @override
  Widget build(BuildContext context) {
    final doctors = data?.doctorsList ?? [];

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(kCardRadius),
        border: Border.all(color: kBorderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Appointments List",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryText,
                  letterSpacing: -0.3,
                ),
              ),
              InkWell(
                onTap: () => context.go('/clinic/appointments'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kBorderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryText,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                flex: 3,
                child: Text(
                  "DOCTOR NAME",
                  style: TextStyle(
                    fontSize: 9,
                    color: kSecondaryText,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "APPT",
                  style: TextStyle(
                    fontSize: 9,
                    color: kSecondaryText,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "DONE",
                  style: TextStyle(
                    fontSize: 9,
                    color: kSecondaryText,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "AMOUNT (₹)",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 9,
                    color: kSecondaryText,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: kBorderColor),
          if (doctors.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "No appointments found.",
                  style: TextStyle(color: kSecondaryText),
                ),
              ),
            )
          else
            ...doctors.map(
              (doc) => _buildRow(
                doc.doctorName,
                doc.totalAppointments.toString(),
                doc.completed.toString(),
                doc.revenue.toStringAsFixed(2),
                doc.doctorImage,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String name,
    String appointment,
    String completed,
    String amount,
    String image,
  ) {
    final initials = name.isNotEmpty ? name[0].toUpperCase() : "D";

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kCardRadius),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                // Standardized Slate-50 Identity Box
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC), // Slate 50
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: Color(0xFF475569), // Slate 600
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        "Clinical Staff",
                        style: TextStyle(
                          fontSize: 9,
                          color: kSecondaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              appointment,
              style: const TextStyle(fontSize: 11, color: kSecondaryText),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              completed,
              style: const TextStyle(fontSize: 11, color: kSecondaryText),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              amount,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: kPrimaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PharmacyLabSection extends StatelessWidget {
  final ClinicDashboardData? data;
  const _PharmacyLabSection({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _InfoSectionCard(
          title: "Pharmacy",
          items: [
            _InfoItem(
              label: "Total Sales Today (₹)",
              value: "0.00",
              subtext: "0% Since Last Week",
              iconData: Icons.local_pharmacy_rounded,
              iconColor: kBlueColor,
            ),
            _InfoItem(
              label: "Current Stock Value (₹)",
              value: "0.00",
              subtext: "0% Since Last Week",
              iconData: Icons.inventory_2_rounded,
              iconColor: kPurpleColor,
            ),
          ],
        ),
        SizedBox(height: 12), // Reduced height
        _InfoSectionCard(
          title: "Laboratory",
          items: [
            _InfoItem(
              label: "Total Lab Sales Today (₹)",
              value: "0.00",
              subtext: "0% Since Last Week",
              iconData: Icons.science_rounded,
              iconColor: kPurpleColor,
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _InfoSectionCard({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(kCardRadius),
        border: Border.all(color: kBorderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kPrimaryText,
            ),
          ),
          const SizedBox(height: 12),
          ...items.map(
            (e) =>
                Padding(padding: const EdgeInsets.only(bottom: 12), child: e),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final String subtext;
  final IconData iconData;
  final Color iconColor;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.subtext,
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: iconColor, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 9,
                      color: kSecondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                subtext,
                style: TextStyle(
                  fontSize: 8,
                  color: kGreenColor.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PatientsDonutCard extends StatelessWidget {
  final ClinicDashboardData? data;
  const _PatientsDonutCard({this.data});

  @override
  Widget build(BuildContext context) {
    final activity = data?.patientsActivity;
    final total = activity?.total ?? 0;
    final newPatients = activity?.newPatients ?? 0;
    final returning = activity?.returning ?? 0;

    double progress = total > 0 ? (newPatients / total) : 0.0;

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(kCardRadius),
        border: Border.all(color: kBorderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Patients Activity",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryText,
                  letterSpacing: -0.3,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: const [
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryText,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 14,
                      color: kSecondaryText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 12,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.grey[300]!,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 12,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          kPrimaryText,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$total",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                            color: kPrimaryText,
                          ),
                        ),
                        const Text(
                          "TOTAL",
                          style: TextStyle(
                            fontSize: 7,
                            color: kSecondaryText,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildActivityRow(
            dotColor: kPrimaryText,
            label: "New Patients Today",
            value: "$newPatients",
          ),
          const SizedBox(height: 8),
          _buildActivityRow(
            dotColor: Colors.grey[400]!,
            label: "Returning Patients",
            value: "$returning",
          ),
        ],
      ),
    );
  }

  Widget _buildActivityRow({
    required Color dotColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: kSecondaryText,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: kPrimaryText,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _StaffAttendanceCard extends StatelessWidget {
  final ClinicDashboardData? data;
  const _StaffAttendanceCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Staff Attendance Rate",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryText,
                  letterSpacing: -0.3,
                ),
              ),
              const Text(
                "0%",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kBlueColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                flex: 3,
                child: Text(
                  "STAFF TYPE",
                  style: TextStyle(
                    color: kSecondaryText,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "TOTAL",
                  style: TextStyle(
                    color: kSecondaryText,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "ON DUTY",
                  style: TextStyle(
                    color: kSecondaryText,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildStaffRow(
            bgColor: kPurpleColor,
            label: "Doctors",
            total: "0",
            onDuty: "0",
          ),
          const SizedBox(height: 10),
          _buildStaffRow(
            bgColor: kBlueColor,
            label: "Clinical Staff",
            total: "0",
            onDuty: "0",
          ),
        ],
      ),
    );
  }

  Widget _buildStaffRow({
    required Color bgColor,
    required String label,
    required String total,
    required String onDuty,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: bgColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                color: bgColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              total,
              style: const TextStyle(
                color: kPrimaryText,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              onDuty,
              style: TextStyle(
                color: bgColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _WaveChartPainter extends CustomPainter {
  final Color color;
  final int style;
  _WaveChartPainter({required this.color, this.style = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();

    // Healthcare-contextual patterns
    if (style == 0) {
      // Total Appointments - Steady heartbeat rhythm
      path.moveTo(0, size.height * 0.65);
      path.cubicTo(
        size.width * 0.15,
        size.height * 0.65,
        size.width * 0.2,
        size.height * 0.45,
        size.width * 0.25,
        size.height * 0.55,
      );
      path.cubicTo(
        size.width * 0.3,
        size.height * 0.65,
        size.width * 0.5,
        size.height * 0.7,
        size.width * 0.65,
        size.height * 0.6,
      );
      path.cubicTo(
        size.width * 0.8,
        size.height * 0.5,
        size.width * 0.9,
        size.height * 0.65,
        size.width,
        size.height * 0.6,
      );
    } else {
      // Business Volume - Smooth growth curve
      path.moveTo(0, size.height * 0.75);
      path.cubicTo(
        size.width * 0.25,
        size.height * 0.65,
        size.width * 0.4,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.55,
      );
      path.cubicTo(
        size.width * 0.75,
        size.height * 0.6,
        size.width * 0.85,
        size.height * 0.45,
        size.width,
        size.height * 0.5,
      );
    }

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, paint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Date range selector — single button that opens a compact popup dialog
class _DashboardDateRangeSelector extends StatelessWidget {
  final AppointmentDashboardViewModel viewModel;
  const _DashboardDateRangeSelector({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final label = viewModel.dashboardRangeLabel ?? 'Select Date';
    final hasRange = viewModel.dashboardRangeLabel != null;

    return GestureDetector(
      onTap: () => _showDatePopup(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: hasRange ? kBlueColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: hasRange ? kBlueColor : kBorderColor,
            width: 1.5,
          ),
          boxShadow: hasRange
              ? [
                  BoxShadow(
                    color: kBlueColor.withOpacity(0.20),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_month_rounded,
              size: 15,
              color: hasRange ? Colors.white : kSecondaryText,
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: hasRange ? Colors.white : kSecondaryText,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 15,
              color: hasRange ? Colors.white : kSecondaryText,
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.25),
      builder: (ctx) => _DateRangeDialog(viewModel: viewModel),
    );
  }
}

/// Compact popup dialog for date range selection
class _DateRangeDialog extends StatefulWidget {
  final AppointmentDashboardViewModel viewModel;
  const _DateRangeDialog({required this.viewModel});

  @override
  State<_DateRangeDialog> createState() => _DateRangeDialogState();
}

class _DateRangeDialogState extends State<_DateRangeDialog> {
  DateTime? _startDate;
  DateTime? _endDate;
  String? _activePreset;

  static const _presets = [
    ('Today', 0),
    ('Yesterday', 1),
    ('Last 7 Days', 7),
    ('Last 30 Days', 30),
  ];

  @override
  void initState() {
    super.initState();
    _activePreset = widget.viewModel.dashboardRangeLabel;
  }

  String _fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  String _display(DateTime d) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${d.day} ${months[d.month]} ${d.year}';
  }

  void _selectPreset(String label, int daysBack) {
    final now = DateTime.now();
    DateTime start, end;
    if (daysBack == 0) {
      start = end = now;
    } else if (daysBack == 1) {
      start = end = now.subtract(const Duration(days: 1));
    } else {
      start = now.subtract(Duration(days: daysBack - 1));
      end = now;
    }
    setState(() {
      _activePreset = label;
      _startDate = null;
      _endDate = null;
    });
    widget.viewModel.setDashboardDateRange(
      startDate: _fmt(start),
      endDate: _fmt(end),
      label: label,
    );
    Navigator.of(context).pop();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initial = isStart
        ? (_startDate ?? now.subtract(const Duration(days: 6)))
        : (_endDate ?? now);
    final first = isStart ? DateTime(2020) : (_startDate ?? DateTime(2020));
    final last = isStart ? (_endDate ?? now) : now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isBefore(first)
          ? first
          : initial.isAfter(last)
              ? last
              : initial,
      firstDate: first,
      lastDate: last,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(
            primary: kBlueColor,
            onPrimary: Colors.white,
            onSurface: kPrimaryText,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: kBlueColor),
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      setState(() {
        _activePreset = null;
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _applyCustom() {
    if (_startDate == null || _endDate == null) return;
    final days = _endDate!.difference(_startDate!).inDays + 1;
    widget.viewModel.setDashboardDateRange(
      startDate: _fmt(_startDate!),
      endDate: _fmt(_endDate!),
      label: '$days day${days == 1 ? '' : 's'}',
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final canApply = _startDate != null && _endDate != null;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 12,
      child: Container(
        width: 380,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kBlueColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.date_range_rounded,
                      color: kBlueColor, size: 18),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Select Date Range',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryText,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close_rounded,
                      size: 20, color: kSecondaryText),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Quick presets
            const Text(
              'QUICK SELECT',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: kSecondaryText,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _presets.map((p) {
                final isActive = _activePreset == p.$1;
                return GestureDetector(
                  onTap: () => _selectPreset(p.$1, p.$2),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isActive ? kBlueColor : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isActive ? kBlueColor : kBorderColor,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      p.$1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : kSecondaryText,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 18),
            const Divider(height: 1, color: kBorderColor),
            const SizedBox(height: 16),

            // Custom range
            const Text(
              'CUSTOM RANGE',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: kSecondaryText,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // Start date
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(isStart: true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _startDate != null
                              ? kBlueColor
                              : kBorderColor,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'FROM',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: kSecondaryText,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _startDate != null
                                ? _display(_startDate!)
                                : 'Pick start date',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _startDate != null
                                  ? kPrimaryText
                                  : const Color(0xFFCBD5E1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.arrow_forward_rounded,
                      size: 16, color: kSecondaryText),
                ),
                // End date
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(isStart: false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              _endDate != null ? kBlueColor : kBorderColor,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TO',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: kSecondaryText,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _endDate != null
                                ? _display(_endDate!)
                                : 'Pick end date',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _endDate != null
                                  ? kPrimaryText
                                  : const Color(0xFFCBD5E1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Action buttons
            Row(
              children: [
                // Clear
                if (widget.viewModel.dashboardRangeLabel != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.viewModel.clearDashboardDateRange();
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kSecondaryText,
                        side: const BorderSide(color: kBorderColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text('Clear',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                    ),
                  ),
                if (widget.viewModel.dashboardRangeLabel != null)
                  const SizedBox(width: 10),
                // Apply custom
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: canApply ? _applyCustom : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlueColor,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: kBorderColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Apply Range',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardAlertBanner extends StatefulWidget {
  const _DashboardAlertBanner();

  @override
  State<_DashboardAlertBanner> createState() => _DashboardAlertBannerState();
}

class _DashboardAlertBannerState extends State<_DashboardAlertBanner> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB), // Elegant soft amber/yellow background
        borderRadius: BorderRadius.circular(10), // Matching 10px kCardRadius
        border: Border.all(
          color: const Color(0xFFFDE68A), // Light amber border
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD97706).withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFFDE68A).withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFFD97706),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "URGENT CLINIC ACTION REQUIRED",
                  style: TextStyle(
                    color: Color(0xFFB45309), // Amber 700
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "There are 3 pending lab report approvals and 2 patient queue delay notifications that require immediate clinical review.",
                  style: TextStyle(
                    color: Color(0xFF78350F), // Amber 900
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isVisible = false;
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFDE68A)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Color(0xFFB45309),
                  size: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


