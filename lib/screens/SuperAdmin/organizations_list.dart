import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/organization_vm.dart';
import 'package:a/models/organization_model.dart';
import 'add_organization.dart';
import 'organization_details.dart';

class OrganizationsListScreen extends StatefulWidget {
  const OrganizationsListScreen({super.key});

  @override
  State<OrganizationsListScreen> createState() =>
      _OrganizationsListScreenState();
}

class _OrganizationsListScreenState extends State<OrganizationsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Fetch organizations when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final orgVM = Provider.of<OrganizationViewModel>(context, listen: false);
      orgVM.fetchOrganizations(context);
    });
  }

  List<OrganizationModel> get _filteredOrganizations {
    final orgVM = Provider.of<OrganizationViewModel>(context);
    if (_searchQuery.isEmpty) {
      return orgVM.organizations;
    }
    return orgVM.organizations.where((org) {
      final name = org.name.toLowerCase();
      final email = org.email?.toLowerCase() ?? '';
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || email.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Consumer<OrganizationViewModel>(
        builder: (context, orgVM, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 480;

              return Column(
                children: [
                  // Header
                  _buildHeader(isMobile),

                  // Search Bar
                  _buildSearchBar(isMobile),

                  // Organizations List
                  Expanded(
                    child: orgVM.isLoading
                        ? _buildLoadingState(isMobile)
                        : orgVM.error != null
                        ? _buildErrorState(isMobile, orgVM.error!)
                        : _filteredOrganizations.isEmpty
                        ? _buildEmptyState(isMobile)
                        : ListView.builder(
                            padding: EdgeInsets.all(isMobile ? 16 : 24),
                            itemCount: _filteredOrganizations.length,
                            itemBuilder: (context, index) {
                              final org = _filteredOrganizations[index];
                              return _buildOrganizationCard(org, isMobile);
                            },
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: 16,
      ),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 12),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Organizations',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Manage all organizations',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),

          // Add Organization Button
          ElevatedButton.icon(
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(
                  context,
                ).modalBarrierDismissLabel,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const AddOrganizationScreen();
                },
              ).then((_) {
                // Refresh organizations list after adding
                final orgVM = Provider.of<OrganizationViewModel>(
                  context,
                  listen: false,
                );
                orgVM.fetchOrganizations(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.add, size: 16),
            label: Text(
              'New Organization',
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isMobile) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        isMobile ? 16 : 24,
        16,
        isMobile ? 16 : 24,
        0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search organizations...',
          hintStyle: TextStyle(
            color: const Color(0xFF999999),
            fontSize: isMobile ? 13 : 14,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF666666),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isMobile ? 12 : 16,
          ),
        ),
      ),
    );
  }

  Widget _buildOrganizationCard(OrganizationModel org, bool isMobile) {
    // Get color or use default
    final avatarColor = _getDefaultColor(org.name);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    OrganizationDetailsScreen(organization: org),
              ),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar with colored background
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: avatarColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      org.name[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: _getTextColor(avatarColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Organization Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Organization Name
                      Text(
                        org.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),

                      // Email
                      Text(
                        org.email ?? 'No email provided',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF666666),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),

                      // Badges
                      Row(
                        children: [
                          // License Badge
                          if (org.licenseNumber != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF3E0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'License: ${org.licenseNumber}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFFFF9800),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          const SizedBox(width: 8),
                          // Status Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: org.isActive == true
                                  ? const Color(0xFFE8F5E8)
                                  : const Color(0xFFFFEBEE),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              org.isActive == true ? 'Active' : 'Inactive',
                              style: TextStyle(
                                fontSize: 10,
                                color: org.isActive == true
                                    ? const Color(0xFF2E7D32)
                                    : const Color(0xFFDC2626),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Action Buttons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // View Details Button
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrganizationDetailsScreen(organization: org),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF3B82F6),
                        side: const BorderSide(color: Color(0xFF3B82F6)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('View', style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    // More options icon
                    IconButton(
                      icon: const Icon(Icons.more_horiz, size: 20),
                      color: const Color(0xFF666666),
                      onPressed: () => _showOptionsMenu(context, org),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getDefaultColor(String name) {
    // Assign colors based on name
    final colors = [
      const Color(0xFFE3F2FD), // Light blue
      const Color(0xFFFFEBEE), // Light red
      const Color(0xFFFFF3E0), // Light orange
      const Color(0xFFF3E5F5), // Light purple
    ];
    final index = name.hashCode % colors.length;
    return colors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    // Return contrasting text color based on background
    if (backgroundColor == const Color(0xFFE3F2FD))
      return const Color(0xFF1976D2);
    if (backgroundColor == const Color(0xFFFFEBEE))
      return const Color(0xFFD32F2F);
    if (backgroundColor == const Color(0xFFFFF3E0))
      return const Color(0xFFFF9800);
    if (backgroundColor == const Color(0xFFF3E5F5))
      return const Color(0xFF7B1FA2);
    return const Color(0xFF4CAF50);
  }

  Widget _buildLoadingState(bool isMobile) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading organizations...',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(bool isMobile, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              size: isMobile ? 48 : 64,
              color: const Color(0xFFDC2626),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading organizations',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              error,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: const Color(0xFF666666),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              final orgVM = Provider.of<OrganizationViewModel>(
                context,
                listen: false,
              );
              orgVM.fetchOrganizations(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isMobile) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F9FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.business_outlined,
              size: isMobile ? 48 : 64,
              color: const Color(0xFF2563EB),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No organizations found',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isEmpty
                ? 'Click "New Organization" to add one'
                : 'Try a different search term',
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: const Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsMenu(BuildContext context, OrganizationModel org) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.visibility, color: Color(0xFF2563EB)),
                title: const Text('View Details'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrganizationDetailsScreen(organization: org),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit, color: Color(0xFF4CAF50)),
                title: const Text('Edit Organization'),
                onTap: () {
                  Navigator.pop(context);
                  // Edit organization - not implemented yet
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit functionality coming soon'),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Color(0xFFDC2626)),
                title: const Text('Delete Organization'),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmation(context, org);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, OrganizationModel org) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Delete Organization'),
          content: Text(
            'Are you sure you want to delete "${org.name}"? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Organization "${org.name}" deleted'),
                    backgroundColor: const Color(0xFFDC2626),
                  ),
                );
                // TODO: Implement delete API call
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                elevation: 0,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
