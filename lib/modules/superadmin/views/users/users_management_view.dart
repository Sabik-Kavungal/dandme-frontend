import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/superadmin/views/clinics/add_clinic_doctor_link_view.dart';
import 'package:drandme/modules/superadmin/views/clinics/clinic_doctor_links_list_view.dart';
import 'package:drandme/modules/superadmin/views/users/users_list_view.dart';
import 'package:drandme/modules/superadmin/views/roles/roles_list_view.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';

class UsersManagementScreen extends StatelessWidget {
  const UsersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
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
            const Text(
              'User Management Options',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
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
                    subtitle: 'Manage user accounts and permissions',
                    icon: Icons.people,
                    color: Colors.greenAccent,
                    onTap: () => _navigateToUsers(context),
                  ),
                  _buildManagementCard(
                    context: context,
                    title: 'User Roles',
                    subtitle: 'Configure user roles and permissions',
                    icon: Icons.admin_panel_settings,
                    color: Colors.orangeAccent,
                    onTap: () => _navigateToRoles(context),
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ClinicDoctorLinksListScreen(),
      ),
    );
  }

  void _navigateToAddLink(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const AddClinicDoctorLinkScreen();
      },
    ).then((_) {
      // Refresh links list after adding
      final clinicViewModel = Provider.of<ClinicViewModel>(
        context,
        listen: false,
      );
      clinicViewModel.refreshLinks(context);
    });
  }

  void _navigateToUsers(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const UsersListView()));
  }

  void _navigateToRoles(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const RolesListView()));
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This feature is coming soon!'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
