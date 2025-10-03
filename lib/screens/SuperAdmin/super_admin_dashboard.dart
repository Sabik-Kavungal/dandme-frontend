import 'package:flutter/material.dart';
import 'organizations_list.dart';
import 'clinics_list.dart';
import 'doctors_list.dart';
import 'users_management.dart';
import 'package:a/widgets/session_management_widget.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Super Admin Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: const [CompactSessionStatus(), SizedBox(width: 16)],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth < 1024;
          final isMobile = constraints.maxWidth < 480;

          return SingleChildScrollView(
            padding: EdgeInsets.all(isTablet ? 12 : 16),
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
                  '${DateTime.now().day} ${_getMonthName(DateTime.now().month)} ${DateTime.now().year}',
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
                    child: _buildStatCard(
                      '45',
                      'Organizations',
                      const Color(0xFFB088F0),
                      Icons.business,
                      isMobile,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      '328',
                      'Total Users',
                      const Color(0xFFE0F0B0),
                      Icons.people,
                      isMobile,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      '156',
                      'Active Clinics',
                      const Color(0xFFB0F0B0),
                      Icons.local_hospital,
                      isMobile,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      '892',
                      'Total Appointments',
                      const Color(0xFFF0B0B0),
                      Icons.calendar_month,
                      isMobile,
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
                child: _buildStatCard(
                  '45',
                  'Organizations',
                  const Color(0xFFB088F0),
                  Icons.business,
                  isMobile,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  '328',
                  'Total Users',
                  const Color(0xFFE0F0B0),
                  Icons.people,
                  isMobile,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  '156',
                  'Active Clinics',
                  const Color(0xFFB0F0B0),
                  Icons.local_hospital,
                  isMobile,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  '892',
                  'Total Appointments',
                  const Color(0xFFF0B0B0),
                  Icons.calendar_month,
                  isMobile,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    Color color,
    IconData icon,
    bool isMobile,
  ) {
    final cardHeight = isMobile ? 80.0 : 85.0;
    final iconSize = isMobile ? 28.0 : 32.0;
    final iconInnerSize = isMobile ? 14.0 : 16.0;
    final padding = isMobile ? 8.0 : 12.0;

    return Container(
      height: cardHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, size: iconInnerSize, color: Colors.white),
          ),
          SizedBox(width: isMobile ? 8 : 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                ),
                SizedBox(height: isMobile ? 1 : 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 9 : 10,
                    color: const Color(0xFF666666),
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
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
              crossAxisSpacing: isMobile ? 12 : 16,
              mainAxisSpacing: isMobile ? 12 : 16,
              childAspectRatio: isMobile ? 1.0 : 1.1,
              children: [
                _buildManagementCard(
                  context: context,
                  title: 'Organizations',
                  subtitle: 'Manage organizations',
                  icon: Icons.business,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                  ),
                  onTap: () => _navigateToOrganizations(context),
                  isMobile: isMobile,
                ),
                _buildManagementCard(
                  context: context,
                  title: 'Clinics',
                  subtitle: 'Manage all clinics',
                  icon: Icons.local_hospital,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
                  ),
                  onTap: () => _navigateToClinics(context),
                  isMobile: isMobile,
                ),
                _buildManagementCard(
                  context: context,
                  title: 'Doctors',
                  subtitle: 'Manage doctors',
                  icon: Icons.medical_services,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
                  ),
                  onTap: () => _navigateToDoctors(context),
                  isMobile: isMobile,
                ),
                _buildManagementCard(
                  context: context,
                  title: 'User Management',
                  subtitle: 'Manage users and links',
                  icon: Icons.people,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
                  ),
                  onTap: () => _navigateToUserManagement(context),
                  isMobile: isMobile,
                ),
                _buildManagementCard(
                  context: context,
                  title: 'Analytics',
                  subtitle: 'View system statistics',
                  icon: Icons.analytics,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
                  ),
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

  Widget _buildManagementCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
    required bool isMobile,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 12 : 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 8 : 10),
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: gradient.colors.first.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: isMobile ? 18 : 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
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
          ],
        ),
      ),
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
          padding: EdgeInsets.all(isMobile ? 14 : 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
                color: const Color(0xFF2563EB),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Send Notifications feature')),
                  );
                },
                isMobile: isMobile,
              ),
              Divider(color: const Color(0xFFE0E0E0), height: 24),
              _buildQuickActionRow(
                context: context,
                icon: Icons.settings,
                title: 'System Settings',
                subtitle: 'Configure system parameters',
                color: const Color(0xFF64748B),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('System Settings feature')),
                  );
                },
                isMobile: isMobile,
              ),
              Divider(color: const Color(0xFFE0E0E0), height: 24),
              _buildQuickActionRow(
                context: context,
                icon: Icons.backup,
                title: 'Backup & Restore',
                subtitle: 'Manage system backups',
                color: const Color(0xFF10B981),
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
            SizedBox(width: isMobile ? 10 : 12),
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

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  void _navigateToOrganizations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrganizationsListScreen()),
    );
  }

  // void _navigateToUsers(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => UsersListScreen()),
  //   );
  // }

  void _navigateToClinics(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ClinicsListScreen()),
    );
  }

  void _navigateToDoctors(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DoctorsListScreen()),
    );
  }

  void _navigateToUserManagement(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UsersManagementScreen()),
    );
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
