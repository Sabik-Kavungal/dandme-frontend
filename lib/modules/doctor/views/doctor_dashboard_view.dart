import 'package:flutter/material.dart';
import 'package:a/core/utils/app_helpers.dart';
import 'package:a/core/constants/app_constants.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Scaffold(
      backgroundColor: AppConstants.scaffoldBackground,
      appBar: AppBar(
        title: const Text("Doctor Dashboard"),
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
              color: AppConstants.infoColor,
              borderRadius: BorderRadius.circular(AppConstants.radiusL),
            ),
            child: Icon(
              Icons.medical_services,
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
                  "Doctor Dashboard",
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.darkColor,
                  ),
                ),
                SizedBox(height: AppConstants.spacingXS),
                Text(
                  "Manage your patients and schedule",
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
          ? AppConstants.spacingL
          : AppConstants.spacingL,
      mainAxisSpacing: isMobile ? AppConstants.spacingL : AppConstants.spacingL,
      children: [
        _buildStatCard(
          "Today's Patients",
          "12",
          Icons.people,
          AppConstants.successColor,
          isMobile,
        ),
        _buildStatCard(
          "Appointments",
          "8",
          Icons.calendar_today,
          AppConstants.primaryColor,
          isMobile,
        ),
        _buildStatCard(
          "Prescriptions",
          "15",
          Icons.medication,
          AppConstants.infoColor,
          isMobile,
        ),
        _buildStatCard(
          "Reports",
          "3",
          Icons.analytics,
          AppConstants.secondaryColor,
          isMobile,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    bool isMobile,
  ) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: isMobile ? 40 : 50,
            height: isMobile ? 40 : 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Icon(icon, color: color, size: isMobile ? 20 : 24),
          ),
          SizedBox(
            height: isMobile ? AppConstants.spacingM : AppConstants.spacingM,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          SizedBox(height: AppConstants.spacingXS),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 10 : 12,
              color: AppConstants.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
