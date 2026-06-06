import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/auth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/core/config/navigation_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    authViewModel.getProfile(context); // fetch profile when screen opens
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF333333),
        elevation: 0,
      ),
      body: authViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : authViewModel.user == null
          ? const Center(child: Text("No profile data"))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Compact Profile Header
                  _buildCompactProfileHeader(authViewModel),
                  const SizedBox(height: 12),

                  // Main Profile Content
                  Expanded(
                    child: _buildCompactProfileContent(authViewModel, context),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildCompactProfileHeader(AuthViewModel authViewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          // Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFA060F0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                authViewModel.user?.firstName?.substring(0, 1) ?? "?",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${authViewModel.user?.firstName ?? ''} ${authViewModel.user?.lastName ?? ''}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  authViewModel.user?.email ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 8),
                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: authViewModel.user?.isActive == true
                        ? const Color(0xFFA0F0A0)
                        : const Color(0xFFF0A0A0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: authViewModel.user?.isActive == true
                              ? const Color(0xFF28A745)
                              : const Color(0xFFDC3545),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        authViewModel.user?.isActive == true
                            ? "Active"
                            : "Inactive",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Edit Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 20, color: Color(0xFF666666)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactProfileContent(
    AuthViewModel authViewModel,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Info Grid
          Expanded(flex: 3, child: _buildCompactInfoGrid(authViewModel)),
          const SizedBox(height: 16),
          // Action Buttons
          Expanded(
            flex: 2,
            child: _buildCompactActionButtons(authViewModel, context),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactInfoGrid(AuthViewModel authViewModel) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4.0,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        final items = [
          {'label': 'Username', 'value': authViewModel.user?.username ?? '-'},
          {'label': 'Phone', 'value': authViewModel.user?.phone ?? '-'},
          {'label': 'DOB', 'value': authViewModel.user?.dateOfBirth ?? '-'},
          {'label': 'Gender', 'value': authViewModel.user?.gender ?? '-'},
          {
            'label': 'Role',
            'value': authViewModel.user?.role ?? 'Not assigned',
          },
          {
            'label': 'Organization',
            'value': authViewModel.user?.organizationId ?? 'Not assigned',
          },
          {
            'label': 'Clinic',
            'value': authViewModel.user?.clinicId ?? 'Not assigned',
          },
          {
            'label': 'Service',
            'value': authViewModel.user?.serviceId ?? 'Not assigned',
          },
        ];

        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item['label']!,
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['value']!,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompactActionButtons(
    AuthViewModel authViewModel,
    BuildContext context,
  ) {
    return Column(
      children: [
        // Action Buttons Row
        Row(
          children: [
            Expanded(
              child: _buildCompactButton(
                icon: Icons.refresh,
                label: authViewModel.isLoading ? "Loading..." : "Refresh",
                color: const Color(0xFFA060F0),
                isLoading: authViewModel.isLoading,
                onPressed: () async {
                  await authViewModel.getProfile(context);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildCompactButton(
                icon: Icons.autorenew,
                label: authViewModel.isRefreshing ? "Refreshing..." : "Token",
                color: const Color(0xFFD9F0A0),
                isLoading: authViewModel.isRefreshing,
                onPressed: () async {
                  final success = await authViewModel.manualRefreshToken();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? "Token refreshed successfully"
                            : "Token refresh failed",
                      ),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Debug Buttons Row 1
        Row(
          children: [
            Expanded(
              child: _buildCompactButton(
                icon: Icons.bug_report,
                label: "Test Endpoint",
                color: const Color(0xFFA0F0A0),
                isLoading: false,
                onPressed: () async {
                  await authViewModel.testProfileEndpoint(context);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildCompactButton(
                icon: Icons.info_outline,
                label: "Check Role",
                color: const Color(0xFF6F42C1),
                isLoading: false,
                onPressed: () {
                  authViewModel.showUserRoleInfo(context);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Debug Buttons Row 2
        SizedBox(
          width: double.infinity,
          child: _buildCompactButton(
            icon: Icons.storage,
            label: "Check Token Storage",
            color: const Color(0xFF17A2B8),
            isLoading: false,
            onPressed: () async {
              await authViewModel.showTokenStorageInfo(context);
            },
          ),
        ),
        const SizedBox(height: 12),
        // Logout Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: authViewModel.isLoading
                ? null
                : () async {
                    await authViewModel.logout(context);
                    NavigationHelper.goToLogin(context);
                  },
            icon: authViewModel.isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(Icons.logout, size: 18),
            label: Text(
              authViewModel.isLoading ? "Logging out..." : "Logout",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF0A0A0),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactButton({
    required IconData icon,
    required String label,
    required Color color,
    required bool isLoading,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Icon(icon, size: 16),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
