import 'package:flutter/material.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/core/widgets/session_management_widget.dart';
import 'package:drandme/core/config/navigation_helper.dart';

// --- VISUAL CONSTANTS FOR CLASSY SLATE MATCH ---
const kBgColor = Color(0xFFF1F5F9); // Elegant Slate 100 Background
const kCardColor = Colors.white;
const kPrimaryText = Color(0xFF1E293B); // Deep Slate 800 Text
const kSecondaryText = Color(0xFF64748B); // Subtle Slate 500 Text
const kBlueColor = Color(0xFF0284C7); // Professional Sky/Health Blue
const kOrangeColor = Color(0xFFD97706); // Soft Amber
const kPurpleColor = Color(0xFF4F46E5); // Trustworthy Indigo
const kGreenColor = Color(0xFF059669); // Clean Emerald
const kRedColor = Color(0xFFDC2626); // Alert Crimson
const kBorderColor = Color(0xFFE2E8F0); // Subtle Slate 200 Border

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = AppHelpers.isTablet(context);
          final isMobile = AppHelpers.isMobile(context);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Session Management Widget
                const SessionManagementWidget(),

                // Greeting Section
                _buildGreetingSection(isMobile, isTablet),
                const SizedBox(height: 8),

                // Statistics Cards
                _buildStatisticsCards(isMobile, isTablet),
                const SizedBox(height: 8),

                // Management Options
                _buildManagementSection(context, isMobile, isTablet),
                const SizedBox(height: 8),

                // Quick Actions
                _buildQuickActionsSection(context, isMobile, isTablet),
                const SizedBox(height: 8),

                // Footer
                _buildFooter(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGreetingSection(bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Admin Icon
          Container(
            width: isMobile ? 48 : 56,
            height: isMobile ? 48 : 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0284C7), Color(0xFF0369A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0284C7).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.admin_panel_settings,
              color: Colors.white,
              size: isMobile ? 24 : 28,
            ),
          ),
          SizedBox(width: isMobile ? 16 : 20),
          // Greeting Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Super Admin,',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    color: kSecondaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryText,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          // Date Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: kBlueColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBlueColor.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today_rounded,
                  color: kBlueColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  AppHelpers.formatDate(DateTime.now()),
                  style: const TextStyle(
                    color: kBlueColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCards(bool isMobile, bool isTablet) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          // Mobile: 2x2 grid
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: '45',
                      label: 'Organizations',
                      color: kBlueColor,
                      icon: Icons.business,
                      badge: '+12%',
                      waveStyle: 0,
                      isMobile: isMobile,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StatCard(
                      value: '328',
                      label: 'Total Users',
                      color: kGreenColor,
                      icon: Icons.people,
                      badge: '+5%',
                      waveStyle: 1,
                      isMobile: isMobile,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: '156',
                      label: 'Active Clinics',
                      color: kPurpleColor,
                      icon: Icons.local_hospital,
                      badge: '+8%',
                      waveStyle: 1,
                      isMobile: isMobile,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      value: '892',
                      label: 'Appointments',
                      color: kOrangeColor,
                      icon: Icons.calendar_month,
                      badge: '+24%',
                      waveStyle: 0,
                      isMobile: isMobile,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          // Desktop/Tablet: horizontal row
          return Row(
            children: [
              Expanded(
                child: StatCard(
                  value: '45',
                  label: 'Organizations',
                  color: kBlueColor,
                  icon: Icons.business,
                  badge: '+12%',
                  waveStyle: 0,
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: StatCard(
                  value: '328',
                  label: 'Total Users',
                  color: kGreenColor,
                  icon: Icons.people,
                  badge: '+5%',
                  waveStyle: 1,
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: StatCard(
                  value: '156',
                  label: 'Active Clinics',
                  color: kPurpleColor,
                  icon: Icons.local_hospital,
                  badge: '+8%',
                  waveStyle: 1,
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatCard(
                  value: '892',
                  label: 'Appointments',
                  color: kOrangeColor,
                  icon: Icons.calendar_month,
                  badge: '+24%',
                  waveStyle: 0,
                  isMobile: isMobile,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildManagementSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Management Options',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w600,
            color: kPrimaryText,
          ),
        ),
        SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount;
            if (isMobile) {
              crossAxisCount = 2;
            } else if (isTablet) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 3;
            }

            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: isMobile ? 1.0 : 1.2,
              children: [
                ManagementCard(
                  title: 'Organizations',
                  subtitle: 'Manage organizations',
                  icon: Icons.business,
                  color: kBlueColor,
                  onTap: () => _navigateToOrganizations(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'Clinics',
                  subtitle: 'Manage all clinics',
                  icon: Icons.local_hospital,
                  color: kPurpleColor,
                  onTap: () => _navigateToClinics(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'Doctors',
                  subtitle: 'Manage doctors',
                  icon: Icons.medical_services,
                  color: kGreenColor,
                  onTap: () => _navigateToDoctors(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'User Management',
                  subtitle: 'Manage users and links',
                  icon: Icons.people,
                  color: kOrangeColor,
                  onTap: () => _navigateToUserManagement(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'Analytics',
                  subtitle: 'View system statistics',
                  icon: Icons.analytics,
                  color: const Color(0xFF64748B),
                  onTap: () => _navigateToAnalytics(context),
                  isMobile: isMobile,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildQuickActionsSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w600,
            color: kPrimaryText,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildQuickActionRow(
                context: context,
                icon: Icons.notifications_active_outlined,
                title: 'Send Notifications',
                subtitle: 'Send system-wide notifications',
                color: kBlueColor,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Send Notifications feature')),
                  );
                },
                isMobile: isMobile,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: kBorderColor),
              ),
              _buildQuickActionRow(
                context: context,
                icon: Icons.settings_outlined,
                title: 'System Settings',
                subtitle: 'Configure system parameters',
                color: kSecondaryText,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('System Settings feature')),
                  );
                },
                isMobile: isMobile,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: kBorderColor),
              ),
              _buildQuickActionRow(
                context: context,
                icon: Icons.backup_outlined,
                title: 'Backup & Restore',
                subtitle: 'Manage system backups',
                color: kGreenColor,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Backup & Restore feature')),
                  );
                },
                isMobile: isMobile,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required bool isMobile,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: isMobile ? 20 : 22),
            ),
            SizedBox(width: isMobile ? 16 : 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 15,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 13,
                      color: kSecondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: isMobile ? 14 : 16,
              color: kSecondaryText.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Copyright © 2025 Dr&Me. All rights reserved',
        style: TextStyle(color: kSecondaryText, fontSize: 12),
      ),
    );
  }

  void _navigateToOrganizations(BuildContext context) {
    NavigationHelper.goToSuperAdminOrganizations(context);
  }

  void _navigateToClinics(BuildContext context) {
    NavigationHelper.goToSuperAdminClinics(context);
  }

  void _navigateToDoctors(BuildContext context) {
    NavigationHelper.goToSuperAdminDoctors(context);
  }

  void _navigateToUserManagement(BuildContext context) {
    NavigationHelper.goToSuperAdminUsers(context);
  }

  void _navigateToAnalytics(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Analytics Dashboard - Coming soon'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;
  final String badge;
  final int waveStyle;
  final bool isMobile;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
    this.badge = '',
    this.waveStyle = 0,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110, // Uniform height
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
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
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: color, size: 18),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label.toUpperCase(),
                        style: const TextStyle(
                          color: kSecondaryText,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
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
              if (badge.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: kGreenColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: kGreenColor,
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
              painter: _WaveChartPainter(color: color, style: waveStyle),
            ),
          ),
        ],
      ),
    );
  }
}

class ManagementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isMobile;

  const ManagementCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBorderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: isMobile ? 24 : 28),
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 15 : 17,
                fontWeight: FontWeight.w600,
                color: kPrimaryText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: kSecondaryText),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
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

    // Improved curves for smoother visualization
    if (style == 0) {
      path.moveTo(0, size.height * 0.7);
      path.cubicTo(
        size.width * 0.2,
        size.height * 0.7,
        size.width * 0.3,
        size.height * 0.4,
        size.width * 0.5,
        size.height * 0.5,
      );
      path.cubicTo(
        size.width * 0.7,
        size.height * 0.6,
        size.width * 0.8,
        size.height * 0.3,
        size.width,
        size.height * 0.4,
      );
    } else {
      path.moveTo(0, size.height * 0.6);
      path.cubicTo(
        size.width * 0.25,
        size.height * 0.5,
        size.width * 0.5,
        size.height * 0.7,
        size.width * 0.75,
        size.height * 0.4,
      );
      path.lineTo(size.width, size.height * 0.5);
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
