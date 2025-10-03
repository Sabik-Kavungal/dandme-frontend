import 'package:flutter/material.dart';
import '../screens/appointment/appointments_dashboard.dart';
import '../screens/appointment/new_appointment.dart';
import '../screens/appointment/appointment_details.dart';

class AppointmentResponsiveLayout extends StatefulWidget {
  const AppointmentResponsiveLayout({super.key});

  @override
  State<AppointmentResponsiveLayout> createState() =>
      _AppointmentResponsiveLayoutState();
}

class _AppointmentResponsiveLayoutState
    extends State<AppointmentResponsiveLayout> {
  int _selectedIndex = 1;
  String _currentView = 'appointments'; // Track current view at top level

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // For mobile screens (width < 600px)
        if (constraints.maxWidth < 600) {
          return MobileLayout(
            selectedIndex: _selectedIndex,
            currentView: _currentView,
            onIndexChanged: (index) {
              setState(() {
                _selectedIndex = index;
                _currentView = 'appointments';
              });
            },
            onViewChanged: (view) {
              setState(() {
                _currentView = view;
              });
            },
          );
        }
        // For tablet screens (600px <= width < 1024px)
        else if (constraints.maxWidth < 1024) {
          return TabletLayout(
            selectedIndex: _selectedIndex,
            currentView: _currentView,
            onIndexChanged: (index) {
              setState(() {
                _selectedIndex = index;
                _currentView = 'appointments';
              });
            },
            onViewChanged: (view) {
              setState(() {
                _currentView = view;
              });
            },
          );
        }
        // For desktop screens (width >= 1024px)
        else {
          return DesktopLayout(
            selectedIndex: _selectedIndex,
            currentView: _currentView,
            onIndexChanged: (index) {
              setState(() {
                _selectedIndex = index;
                _currentView = 'appointments';
              });
            },
            onViewChanged: (view) {
              setState(() {
                _currentView = view;
              });
            },
          );
        }
      },
    );
  }
}

class MobileLayout extends StatefulWidget {
  final int selectedIndex;
  final String currentView;
  final Function(int) onIndexChanged;
  final Function(String) onViewChanged;

  const MobileLayout({
    super.key,
    required this.selectedIndex,
    required this.currentView,
    required this.onIndexChanged,
    required this.onViewChanged,
  });

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  List<Widget> get _screens => [
    const DashboardScreen(),
    AppointmentsDashboard(
      onNavigate: (view) {
        widget.onViewChanged(view);
      },
    ),
    const RolesScreen(),
    const PayrollScreen(),
    const ReportsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60, // Single row height
        flexibleSpace: _buildMobileAppBar(),
      ),
      drawer: _buildMobileDrawer(),
      body: _getCurrentView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onViewChanged('new_appointment');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _getCurrentView() {
    switch (widget.currentView) {
      case 'appointment_details':
        return const AppointmentDetailsScreen();
      case 'new_appointment':
        return const NewAppointmentScreen();
      default:
        return _screens[widget.selectedIndex];
    }
  }

  Widget _buildMobileAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Menu Icon
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Color(0xFF333333), size: 24),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          const SizedBox(width: 12),
          // AeroServe Logo
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF007BFF), Color(0xFF6F42C1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'AeroServe',
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          // Notifications
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF666666),
              size: 24,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8),
          // Profile picture with online indicator
          Stack(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFE0E0E0),
                child: Icon(Icons.person, color: Color(0xFF666666), size: 20),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4CAF50),
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF007BFF), Color(0xFF6F42C1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      'AeroServe',
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            // Navigation items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildMobileNavItem(0, Icons.dashboard, 'Dashboard'),
                  _buildMobileNavItem(1, Icons.calendar_today, 'Appointment'),
                  _buildMobileNavItem(2, Icons.people, 'Roles'),
                  _buildMobileNavItem(3, Icons.payment, 'Payroll'),
                  _buildMobileNavItem(4, Icons.bar_chart, 'Reports'),
                  _buildMobileNavItem(5, Icons.settings, 'Settings'),
                ],
              ),
            ),
            // New Appointment Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    widget.onViewChanged('new_appointment');
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text(
                    'New Appointment',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            // Hospital Information Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.local_hospital,
                        color: Color(0xFF2E7D32),
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pulsecare Hospital',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 1),
                          const Text(
                            '2118, Syracuse, India',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Log out
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black, size: 20),
                    SizedBox(width: 12),
                    Text('Log out', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(int index, IconData icon, String title) {
    final isSelected = widget.selectedIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          widget.onIndexChanged(index);
          Navigator.pop(context); // Close the drawer
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Color(0xFF333333),
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF333333),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabletLayout extends StatefulWidget {
  final int selectedIndex;
  final String currentView;
  final Function(int) onIndexChanged;
  final Function(String) onViewChanged;

  const TabletLayout({
    super.key,
    required this.selectedIndex,
    required this.currentView,
    required this.onIndexChanged,
    required this.onViewChanged,
  });

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  bool _isSidebarExpanded = false;

  List<Widget> get _screens => [
    const DashboardScreen(),
    AppointmentsDashboard(
      onNavigate: (view) {
        widget.onViewChanged(view);
      },
    ),
    const RolesScreen(),
    const PayrollScreen(),
    const ReportsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Collapsible Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarExpanded ? 200 : 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Logo
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF007BFF), Color(0xFF6F42C1)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (_isSidebarExpanded) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'AeroServe',
                              style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Navigation items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        _buildTabletNavItem(0, Icons.dashboard, 'Dashboard'),
                        _buildTabletNavItem(
                          1,
                          Icons.calendar_today,
                          'Appointment',
                        ),
                        _buildTabletNavItem(2, Icons.people, 'Roles'),
                        _buildTabletNavItem(3, Icons.payment, 'Payroll'),
                        _buildTabletNavItem(4, Icons.bar_chart, 'Reports'),
                        _buildTabletNavItem(5, Icons.settings, 'Settings'),
                      ],
                    ),
                  ),
                  // New Appointment Button
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          widget.onViewChanged('new_appointment');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.add, size: 16),
                        label: _isSidebarExpanded
                            ? const Text(
                                'New Appointment',
                                style: TextStyle(fontSize: 13),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  // Hospital Information Card
                  if (_isSidebarExpanded)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.local_hospital,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pulsecare Hospital',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  const Text(
                                    '2118, Syracuse, India',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // Toggle Button
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSidebarExpanded = !_isSidebarExpanded;
                      });
                    },
                    icon: Icon(
                      _isSidebarExpanded
                          ? Icons.chevron_left
                          : Icons.chevron_right,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  // Log out
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 18,
                          ),
                          if (_isSidebarExpanded) ...[
                            const SizedBox(width: 10),
                            const Text(
                              'Log out',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main content
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Back Arrow
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: () {
                              widget.onViewChanged('appointments');
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF666666),
                              size: 16,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Page Title
                        Text(
                          'Appointments',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const Spacer(),
                        // Right side icons and profile
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Color(0xFF666666),
                            size: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Color(0xFF666666),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // User profile picture
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Color(0xFFE0E0E0),
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF666666),
                                size: 20,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4CAF50),
                                  shape: BoxShape.circle,
                                  border: Border.fromBorderSide(
                                    BorderSide(color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        // Hospital info card
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.local_hospital,
                                color: Color(0xFF2E7D32),
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Pulsecare Hospital',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    '2118, Syracuse, India',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Screen content
                Expanded(child: _getCurrentView()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCurrentView() {
    switch (widget.currentView) {
      case 'appointment_details':
        return const AppointmentDetailsScreen();
      case 'new_appointment':
        return const NewAppointmentScreen();
      default:
        return _screens[widget.selectedIndex];
    }
  }

  Widget _buildTabletNavItem(int index, IconData icon, String title) {
    final isSelected = widget.selectedIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: () {
          widget.onIndexChanged(index);
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Color(0xFF333333),
                size: 18,
              ),
              if (_isSidebarExpanded) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF333333),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopLayout extends StatefulWidget {
  final int selectedIndex;
  final String currentView;
  final Function(int) onIndexChanged;
  final Function(String) onViewChanged;

  const DesktopLayout({
    super.key,
    required this.selectedIndex,
    required this.currentView,
    required this.onIndexChanged,
    required this.onViewChanged,
  });

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final bool _isSidebarExpanded = true;

  List<Widget> get _screens => [
    const DashboardScreen(),
    AppointmentsDashboard(
      onNavigate: (view) {
        widget.onViewChanged(view);
      },
    ),
    const RolesScreen(),
    const PayrollScreen(),
    const ReportsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarExpanded ? 200 : 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Logo
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // AeroServe Logo
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF007BFF), Color(0xFF6F42C1)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        if (_isSidebarExpanded) ...[
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'AeroServe',
                              style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),

                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Navigation items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        _buildDesktopNavItem(0, Icons.dashboard, 'Dashboard'),
                        _buildDesktopNavItem(
                          1,
                          Icons.calendar_today,
                          'Appointment',
                        ),
                        _buildDesktopNavItem(2, Icons.people, 'Roles'),
                        _buildDesktopNavItem(3, Icons.payment, 'Payroll'),
                        _buildDesktopNavItem(4, Icons.bar_chart, 'Reports'),
                        _buildDesktopNavItem(5, Icons.settings, 'Settings'),
                      ],
                    ),
                  ),
                  // New Appointment Button
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          widget.onViewChanged('new_appointment');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.add, size: 16),
                        label: _isSidebarExpanded
                            ? const Text(
                                'New Appointment',
                                style: TextStyle(fontSize: 13),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  // Hospital Information Card
                  if (_isSidebarExpanded)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.local_hospital,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pulsecare Hospital',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  const Text(
                                    '2118, Syracuse, India',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // Log out
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 18,
                          ),
                          if (_isSidebarExpanded) ...[
                            const SizedBox(width: 10),
                            const Text(
                              'Log out',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Back Arrow
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: () {
                              widget.onViewChanged('appointments');
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF666666),
                              size: 16,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Page Title
                        Text(
                          'Appointments',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const Spacer(),
                        // Right side icons and profile
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Color(0xFF666666),
                            size: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Color(0xFF666666),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // User profile picture
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Color(0xFFE0E0E0),
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF666666),
                                size: 20,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4CAF50),
                                  shape: BoxShape.circle,
                                  border: Border.fromBorderSide(
                                    BorderSide(color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        // Hospital info card
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.local_hospital,
                                color: Color(0xFF2E7D32),
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Pulsecare Hospital',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    '2118, Syracuse, India',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Screen content
                Expanded(child: _getCurrentView()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCurrentView() {
    switch (widget.currentView) {
      case 'appointment_details':
        return const AppointmentDetailsScreen();
      case 'new_appointment':
        return const NewAppointmentScreen();
      default:
        return _screens[widget.selectedIndex];
    }
  }

  Widget _buildDesktopNavItem(int index, IconData icon, String title) {
    final isSelected = widget.selectedIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: () {
          widget.onIndexChanged(index);
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Color(0xFF333333),
                size: 16,
              ),
              if (_isSidebarExpanded) ...[
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Color(0xFF333333),
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder screens
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard Screen'));
  }
}

class RolesScreen extends StatelessWidget {
  const RolesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Roles Screen'));
  }
}

class PayrollScreen extends StatelessWidget {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Payroll Screen'));
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Reports Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings Screen'));
  }
}
