import 'package:flutter/material.dart';
import 'package:a/screens/SuperAdmin/clinic_doctor_links_list.dart';
import 'package:a/screens/SuperAdmin/add_clinic_doctor_link.dart';

class UsersManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'User Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Management Options',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildManagementCard(
                    context: context,
                    title: 'Clinic-Doctor Links',
                    subtitle: 'View and manage clinic-doctor relationships',
                    icon: Icons.link,
                    color: Colors.purpleAccent,
                    onTap: () => _navigateToLinksList(context),
                  ),
                  _buildManagementCard(
                    context: context,
                    title: 'Create New Link',
                    subtitle: 'Add new clinic-doctor relationships',
                    icon: Icons.add_link,
                    color: Colors.blueAccent,
                    onTap: () => _navigateToAddLink(context),
                  ),
                  _buildManagementCard(
                    context: context,
                    title: 'User Accounts',
                    subtitle: 'Manage user accounts and roles',
                    icon: Icons.people,
                    color: Colors.greenAccent,
                    onTap: () => _showComingSoon(context),
                  ),
                  _buildManagementCard(
                    context: context,
                    title: 'User Roles',
                    subtitle: 'Configure user roles and permissions',
                    icon: Icons.admin_panel_settings,
                    color: Colors.orangeAccent,
                    onTap: () => _showComingSoon(context),
                  ),
                  _buildManagementCard(
                    context: context,
                    title: 'Access Control',
                    subtitle: 'Manage system access controls',
                    icon: Icons.security,
                    color: Colors.redAccent,
                    onTap: () => _showComingSoon(context),
                  ),
                  _buildManagementCard(
                    context: context,
                    title: 'Audit Logs',
                    subtitle: 'View system activity logs',
                    icon: Icons.history,
                    color: Colors.tealAccent,
                    onTap: () => _showComingSoon(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
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
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLinksList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClinicDoctorLinksListScreen()),
    );
  }

  void _navigateToAddLink(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddClinicDoctorLinkScreen()),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This feature is coming soon!'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
