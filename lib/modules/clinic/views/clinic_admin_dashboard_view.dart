import 'package:flutter/material.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:a/core/constants/app_constants.dart';

class ClinicAdminDashboard extends StatelessWidget {
  final Function(String)? onNavigate;

  const ClinicAdminDashboard({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Scaffold(
      backgroundColor: AppConstants.scaffoldBackground,
      appBar: AppBar(
        title: const Text("Clinic Admin"),
        backgroundColor: AppConstants.cardBackground,
        foregroundColor: AppConstants.darkColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
        ),
        child: Column(
          children: [
            // Header Card
            _buildHeaderCard(isMobile),
            SizedBox(
              height: isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
            ),

            // Quick Stats
            Expanded(child: _buildStatsGrid(isMobile)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(
        isMobile ? AppConstants.spacingXL : AppConstants.spacingXXL,
      ),
      decoration: BoxDecoration(
        color: AppConstants.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: isMobile ? 50 : 60,
            height: isMobile ? 50 : 60,
            decoration: BoxDecoration(
              color: AppConstants.successColor,
              borderRadius: BorderRadius.circular(isMobile ? 25 : 30),
            ),
            child: Icon(
              Icons.local_hospital,
              color: Colors.white,
              size: isMobile ? 24 : 30,
            ),
          ),
          SizedBox(
            width: isMobile ? AppConstants.spacingL : AppConstants.spacingL,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clinic Administration',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.darkColor,
                  ),
                ),
                SizedBox(height: AppConstants.spacingXS),
                Text(
                  'Manage clinic operations and staff',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: AppConstants.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(bool isMobile) {
    return GridView.count(
      crossAxisCount: isMobile ? 2 : 3,
      crossAxisSpacing: isMobile
          ? AppConstants.spacingM
          : AppConstants.spacingL,
      mainAxisSpacing: isMobile ? AppConstants.spacingM : AppConstants.spacingL,
      childAspectRatio: isMobile ? 1.4 : 1.5,
      children: [
        _buildStatCard(
          'Today Appointments',
          '32',
          AppConstants.primaryColor,
          Icons.calendar_today,
          isMobile,
          onTap: () => onNavigate?.call('appointments'),
        ),
        _buildStatCard(
          'Doctors',
          '12',
          AppConstants.successColor,
          Icons.medical_services,
          isMobile,
        ),
        _buildStatCard(
          'Staff',
          '28',
          AppConstants.infoColor,
          Icons.people,
          isMobile,
        ),
        _buildStatCard(
          'Revenue',
          '₹85K',
          AppConstants.warningColor,
          Icons.attach_money,
          isMobile,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    Color color,
    IconData icon,
    bool isMobile, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.radiusL),
      child: Container(
        padding: EdgeInsets.all(
          isMobile ? AppConstants.spacingM : AppConstants.spacingL,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(
                isMobile ? AppConstants.spacingS : AppConstants.spacingS,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Icon(icon, size: isMobile ? 16 : 18, color: Colors.white),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: isMobile ? 2 : 4),
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 10 : 11,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
