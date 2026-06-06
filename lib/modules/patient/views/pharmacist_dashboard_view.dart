import 'package:flutter/material.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/core/constants/app_constants.dart';

class PharmacistDashboard extends StatelessWidget {
  const PharmacistDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppHelpers.isMobile(context);

    return Scaffold(
      backgroundColor: AppConstants.scaffoldBackground,
      appBar: AppBar(
        title: const Text("Pharmacist Dashboard"),
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
              color: AppConstants.secondaryColor,
              borderRadius: BorderRadius.circular(isMobile ? 25 : 30),
            ),
            child: Icon(
              Icons.local_pharmacy,
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
                  'Pharmacy Management',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.darkColor,
                  ),
                ),
                SizedBox(height: AppConstants.spacingXS),
                Text(
                  'Medication dispensing and inventory',
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
      childAspectRatio: isMobile ? 1.5 : 1.3,
      children: [
        _buildStatCard(
          'Pending Orders',
          '15',
          AppConstants.primaryColor,
          Icons.pending_actions,
          isMobile,
        ),
        _buildStatCard(
          'Dispensed Today',
          '42',
          AppConstants.successColor,
          Icons.medication,
          isMobile,
        ),
        _buildStatCard(
          'Low Stock',
          '8',
          AppConstants.warningColor,
          Icons.warning,
          isMobile,
        ),
        _buildStatCard(
          'Expiring Soon',
          '5',
          AppConstants.dangerColor,
          Icons.schedule,
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
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.all(
        isMobile ? AppConstants.spacingL : AppConstants.spacingL,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 10 : 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
