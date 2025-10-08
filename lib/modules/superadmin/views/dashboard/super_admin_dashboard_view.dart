import 'package:flutter/material.dart';
import 'package:a/modules/superadmin/views/clinics/clinics_list_view.dart';
import 'package:a/modules/superadmin/views/doctors/doctors_list_view.dart';
import 'package:a/modules/superadmin/views/organizations/organizations_list_view.dart';
import 'package:a/modules/superadmin/views/super_admin_module_view.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:a/core/constants/app_constants.dart';
import 'package:a/core/widgets/session_management_widget.dart';
import 'package:a/core/config/navigation_helper.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Super Admin Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: const [CompactSessionStatus(), SizedBox(width: 16)],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = AppHelpers.isTablet(context);
          final isMobile = AppHelpers.isMobile(context);

          return SingleChildScrollView(
            padding: EdgeInsets.all(
              isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Session Management Widget
                const SessionManagementWidget(),

                // Greeting Section
                _buildGreetingSection(isMobile, isTablet),
                SizedBox(height: isTablet ? 16 : 20),

                // Statistics Cards
                _buildStatisticsCards(isMobile, isTablet),
                SizedBox(height: isTablet ? 20 : 24),

                // Management Options
                _buildManagementSection(context, isMobile, isTablet),
                SizedBox(height: isTablet ? 20 : 24),

                // Quick Actions
                _buildQuickActionsSection(context, isMobile, isTablet),
                SizedBox(height: isTablet ? 20 : 24),

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
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : (isTablet ? 12 : 16),
        vertical: isMobile ? 12 : (isTablet ? 10 : 12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Admin Icon
          Container(
            width: isMobile ? 40 : 48,
            height: isMobile ? 40 : 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3B82F6).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.admin_panel_settings,
              color: Colors.white,
              size: isMobile ? 20 : 24,
            ),
          ),
          SizedBox(width: isMobile ? 12 : 16),
          // Greeting Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Super Admin,',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : (isTablet ? 14 : 16),
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : (isTablet ? 20 : 22),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          // Date Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.calendar_today, color: Colors.white, size: 14),
                const SizedBox(width: 4),
                Text(
                  AppHelpers.formatDate(DateTime.now()),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
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
                      color: AppConstants.primaryColor,
                      icon: Icons.business,
                      isMobile: isMobile,
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacingM),
                  Expanded(
                    child: StatCard(
                      value: '328',
                      label: 'Total Users',
                      color: AppConstants.successColor,
                      icon: Icons.people,
                      isMobile: isMobile,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacingM),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: '156',
                      label: 'Active Clinics',
                      color: AppConstants.infoColor,
                      icon: Icons.local_hospital,
                      isMobile: isMobile,
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacingM),
                  Expanded(
                    child: StatCard(
                      value: '892',
                      label: 'Total Appointments',
                      color: AppConstants.warningColor,
                      icon: Icons.calendar_month,
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
                  color: AppConstants.primaryColor,
                  icon: Icons.business,
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(width: AppConstants.spacingM),
              Expanded(
                child: StatCard(
                  value: '328',
                  label: 'Total Users',
                  color: AppConstants.successColor,
                  icon: Icons.people,
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(width: AppConstants.spacingM),
              Expanded(
                child: StatCard(
                  value: '156',
                  label: 'Active Clinics',
                  color: AppConstants.infoColor,
                  icon: Icons.local_hospital,
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(width: AppConstants.spacingM),
              Expanded(
                child: StatCard(
                  value: '892',
                  label: 'Total Appointments',
                  color: AppConstants.warningColor,
                  icon: Icons.calendar_month,
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
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
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
              crossAxisSpacing: isMobile
                  ? AppConstants.spacingM
                  : AppConstants.spacingL,
              mainAxisSpacing: isMobile
                  ? AppConstants.spacingM
                  : AppConstants.spacingL,
              childAspectRatio: isMobile ? 1.0 : 1.1,
              children: [
                ManagementCard(
                  title: 'Organizations',
                  subtitle: 'Manage organizations',
                  icon: Icons.business,
                  color: AppConstants.successColor,
                  onTap: () => _navigateToOrganizations(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'Clinics',
                  subtitle: 'Manage all clinics',
                  icon: Icons.local_hospital,
                  color: AppConstants.warningColor,
                  onTap: () => _navigateToClinics(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'Doctors',
                  subtitle: 'Manage doctors',
                  icon: Icons.medical_services,
                  color: AppConstants.infoColor,
                  onTap: () => _navigateToDoctors(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'User Management',
                  subtitle: 'Manage users and links',
                  icon: Icons.people,
                  color: AppConstants.secondaryColor,
                  onTap: () => _navigateToUserManagement(context),
                  isMobile: isMobile,
                ),
                ManagementCard(
                  title: 'Analytics',
                  subtitle: 'View system statistics',
                  icon: Icons.analytics,
                  color: AppConstants.secondaryColor,
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
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
        Container(
          padding: EdgeInsets.all(isMobile ? 14 : AppConstants.spacingL),
          decoration: BoxDecoration(
            color: AppConstants.cardBackground,
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildQuickActionRow(
                context: context,
                icon: Icons.email,
                title: 'Send Notifications',
                subtitle: 'Send system-wide notifications',
                color: AppConstants.primaryColor,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Send Notifications feature')),
                  );
                },
                isMobile: isMobile,
              ),
              Divider(
                color: AppConstants.dividerColor,
                height: AppConstants.spacingXXL,
              ),
              _buildQuickActionRow(
                context: context,
                icon: Icons.settings,
                title: 'System Settings',
                subtitle: 'Configure system parameters',
                color: AppConstants.secondaryColor,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('System Settings feature')),
                  );
                },
                isMobile: isMobile,
              ),
              Divider(
                color: AppConstants.dividerColor,
                height: AppConstants.spacingXXL,
              ),
              _buildQuickActionRow(
                context: context,
                icon: Icons.backup,
                title: 'Backup & Restore',
                subtitle: 'Manage system backups',
                color: AppConstants.successColor,
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
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 8 : 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: isMobile ? 16 : 18),
            ),
            SizedBox(
              width: isMobile ? AppConstants.spacingS : AppConstants.spacingM,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: isMobile ? 12 : 14,
              color: const Color(0xFF999999),
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
        style: TextStyle(color: Color(0xFF999999), fontSize: 12),
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
        backgroundColor: Color(0xFF9C27B0),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;
  final bool isMobile;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        isMobile ? AppConstants.spacingM : AppConstants.spacingL,
      ),
      decoration: BoxDecoration(
        color: AppConstants.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 6 : 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: isMobile ? 16 : 20),
              ),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.darkColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingS),
          Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: AppConstants.secondaryColor,
              fontWeight: FontWeight.w500,
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
      borderRadius: BorderRadius.circular(AppConstants.radiusL),
      child: Container(
        padding: EdgeInsets.all(
          isMobile ? AppConstants.spacingM : AppConstants.spacingL,
        ),
        decoration: BoxDecoration(
          color: AppConstants.cardBackground,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 8 : 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: isMobile ? 20 : 24),
            ),
            const SizedBox(height: AppConstants.spacingM),
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: AppConstants.darkColor,
              ),
            ),
            const SizedBox(height: AppConstants.spacingXS),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: isMobile ? 11 : 12,
                color: AppConstants.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
