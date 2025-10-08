// ============================================================================
// UNIVERSAL RESPONSIVE LAYOUT
// ============================================================================
// This file provides a reusable responsive layout that uses the same
// responsive logic as AppointmentResponsiveLayout but allows different
// modules to configure their own sidebar data while maintaining identical
// responsive behavior across all modules.
//
// USAGE:
// - Import this file in any module
// - Wrap your module content with UniversalResponsiveLayout
// - Configure module-specific data (name, navigation, screens)
// - Get the same responsive behavior as AppointmentResponsiveLayout
// ============================================================================

import 'package:flutter/material.dart';
import 'package:a/core/config/navigation_helper.dart';

/// Module configuration data for the universal responsive layout
class ModuleConfig {
  final String moduleName;
  final List<Widget> screens;
  final List<ModuleNavItem> navigationItems;
  final Widget? customLogo;
  final Widget? customHospitalInfo;
  final List<Widget>? customHeaderActions;
  final Widget? customFloatingActionButton;
  final VoidCallback? onLogout;
  final bool showNewAppointmentButton;
  final VoidCallback? onNewAppointment;

  const ModuleConfig({
    required this.moduleName,
    required this.screens,
    required this.navigationItems,
    this.customLogo,
    this.customHospitalInfo,
    this.customHeaderActions,
    this.customFloatingActionButton,
    this.onLogout,
    this.showNewAppointmentButton = false,
    this.onNewAppointment,
  });
}

/// Navigation item for modules
class ModuleNavItem {
  final String title;
  final IconData icon;
  final int index;

  const ModuleNavItem({
    required this.title,
    required this.icon,
    required this.index,
  });
}

/// Universal responsive layout that reuses the same responsive logic
/// as AppointmentResponsiveLayout but allows different module configurations
class UniversalResponsiveLayout extends StatefulWidget {
  final ModuleConfig config;
  final int selectedIndex;
  final Function(int) onNavigationChanged;

  const UniversalResponsiveLayout({
    super.key,
    required this.config,
    this.selectedIndex = 1,
    required this.onNavigationChanged,
  });

  @override
  State<UniversalResponsiveLayout> createState() =>
      _UniversalResponsiveLayoutState();
}

class _UniversalResponsiveLayoutState extends State<UniversalResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use the same responsive logic as AppointmentResponsiveLayout
        // Mobile screens (width < 600px)
        if (constraints.maxWidth < 600) {
          return _MobileLayout(
            config: widget.config,
            selectedIndex: widget.selectedIndex,
            onNavigationChanged: widget.onNavigationChanged,
          );
        }
        // Tablet screens (600px <= width < 1024px)
        else if (constraints.maxWidth < 1024) {
          return _TabletLayout(
            config: widget.config,
            selectedIndex: widget.selectedIndex,
            onNavigationChanged: widget.onNavigationChanged,
          );
        }
        // Desktop screens (width >= 1024px)
        else {
          return _DesktopLayout(
            config: widget.config,
            selectedIndex: widget.selectedIndex,
            onNavigationChanged: widget.onNavigationChanged,
          );
        }
      },
    );
  }
}

// ============================================================================
// REUSABLE COMPONENTS
// ============================================================================

/// App logo component
class _AppLogo extends StatelessWidget {
  final double size;
  final double borderRadius;

  const _AppLogo({this.size = 32.0, this.borderRadius = 8.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF007BFF), // Blue color matching the image
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CustomPaint(painter: _TrianglePainter(), size: Size(size, size)),
    );
  }
}

/// Custom painter for the triangular/arrow-like logo
class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    // Create a triangular/arrow-like shape
    path.moveTo(size.width * 0.2, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.8);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Hospital info card component
class _HospitalInfoCard extends StatelessWidget {
  final bool isCompact;
  final bool showBackground;

  const _HospitalInfoCard({this.isCompact = false, this.showBackground = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isCompact ? 8 : 10),
      decoration: showBackground
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFF8F9FA), const Color(0xFFF1F3F5)],
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isCompact ? 28 : 32,
            height: isCompact ? 28 : 32,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF10B981), Color(0xFF059669)],
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(
              Icons.local_hospital_rounded,
              color: Colors.white,
              size: isCompact ? 14 : 16,
            ),
          ),
          SizedBox(width: isCompact ? 8 : 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pulsecare Hospital',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2937),
                    fontSize: isCompact ? 11 : 12,
                    letterSpacing: 0.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (!isCompact) const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: isCompact ? 10 : 11,
                      color: const Color(0xFF6B7280),
                    ),
                    const SizedBox(width: 2),
                    Flexible(
                      child: Text(
                        '2118, Syracuse, India',
                        style: TextStyle(
                          fontSize: isCompact ? 9 : 10,
                          color: const Color(0xFF6B7280),
                          letterSpacing: 0.1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// User profile component
class _UserProfile extends StatelessWidget {
  final double avatarRadius;
  final bool showOnlineIndicator;
  final bool showUserInfo;

  const _UserProfile({
    this.avatarRadius = 18.0,
    this.showOnlineIndicator = true,
    this.showUserInfo = false,
  });

  @override
  Widget build(BuildContext context) {
    if (showUserInfo) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF6366F1).withOpacity(0.2),
                      const Color(0xFF8B5CF6).withOpacity(0.2),
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFF6366F1).withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person_rounded,
                    color: const Color(0xFF6366F1),
                    size: avatarRadius * 0.9,
                  ),
                ),
              ),
              if (showOnlineIndicator)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: avatarRadius * 0.55,
                    height: avatarRadius * 0.55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF059669)],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Dr. Arun Krishna',
                style: TextStyle(
                  color:
                      Theme.of(context).textTheme.bodyLarge?.color ??
                      const Color(0xFF1F2937),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                ),
              ),
              Text(
                'MBBS, MA, MD',
                style: TextStyle(
                  color:
                      Theme.of(context).textTheme.bodySmall?.color ??
                      const Color(0xFF6B7280),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF6366F1).withOpacity(0.2),
                const Color(0xFF8B5CF6).withOpacity(0.2),
              ],
            ),
            border: Border.all(
              color: const Color(0xFF6366F1).withOpacity(0.3),
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.person_rounded,
              color: const Color(0xFF6366F1),
              size: avatarRadius * 0.9,
            ),
          ),
        ),
        if (showOnlineIndicator)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: avatarRadius * 0.55,
              height: avatarRadius * 0.55,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF059669)],
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Navigation item component
class _NavigationItem extends StatelessWidget {
  final ModuleNavItem item;
  final bool isSelected;
  final bool showLabel;
  final Function(int) onTap;

  const _NavigationItem({
    required this.item,
    required this.isSelected,
    required this.showLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(item.index),
        borderRadius: BorderRadius.circular(8),
        splashColor: isSelected
            ? Colors.white.withOpacity(0.08)
            : Colors.black.withOpacity(0.04),
        highlightColor: isSelected
            ? Colors.white.withOpacity(0.04)
            : Colors.black.withOpacity(0.02),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: showLabel ? 10 : 10,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1F2937), Color(0xFF111827)],
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: isSelected
                ? Border.all(
                    color: const Color(0xFF374151).withOpacity(0.6),
                    width: 0.5,
                  )
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                      spreadRadius: -2,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                      spreadRadius: -1,
                    ),
                  ]
                : null,
          ),
          child: showLabel
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon with luxurious styling
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.2),
                                  Colors.white.withOpacity(0.12),
                                ],
                              )
                            : null,
                        color: isSelected ? null : const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : null,
                      ),
                      child: _getIconForItem(item.title, isSelected),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF374151),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          fontSize: 13.5,
                          letterSpacing: isSelected ? 0.2 : 0.1,
                          height: 1.2,
                        ),
                        child: Text(
                          item.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 6),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF10B981), Color(0xFF059669)],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981).withOpacity(0.5),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                )
              : Center(
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.12),
                              ],
                            )
                          : null,
                      color: isSelected ? null : const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                    child: _getIconForItem(item.title, isSelected),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _getIconForItem(String title, bool isSelected) {
    // Use the icon provided by the module, not hardcoded ones
    Color iconColor = isSelected ? Colors.white : const Color(0xFF6B7280);
    return Icon(item.icon, color: iconColor, size: 17);
  }
}

// ============================================================================
// MOBILE LAYOUT
// ============================================================================

class _MobileLayout extends StatefulWidget {
  final ModuleConfig config;
  final int selectedIndex;
  final Function(int) onNavigationChanged;

  const _MobileLayout({
    required this.config,
    required this.selectedIndex,
    required this.onNavigationChanged,
  });

  @override
  State<_MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<_MobileLayout> {
  List<int> _navigationHistory = [0]; // Start with first screen

  @override
  void didUpdateWidget(_MobileLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Add current index to history if it's different from the last one
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      if (!_navigationHistory.contains(widget.selectedIndex)) {
        _navigationHistory.add(widget.selectedIndex);
      }
    }
  }

  void _goBack() {
    if (_navigationHistory.length > 1) {
      // Remove current screen from history
      _navigationHistory.removeLast();
      // Go to previous screen
      int previousIndex = _navigationHistory.last;
      widget.onNavigationChanged(previousIndex);
    } else {
      // If no history, go to first screen
      widget.onNavigationChanged(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60, // Standard height for single header
        flexibleSpace: Builder(
          builder: (BuildContext scaffoldContext) {
            return _buildMobileAppBar(scaffoldContext);
          },
        ),
      ),
      drawer: _buildMobileDrawer(context),
      body: widget.config.screens[widget.selectedIndex],
      floatingActionButton:
          widget.config.customFloatingActionButton ??
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.black,
            child: const Icon(Icons.add, color: Colors.white),
          ),
    );
  }

  Widget _buildMobileAppBar(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Menu/Hamburger Icon (always show to open drawer)
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.menu,
                  color: const Color(0xFF333333),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Back Arrow (only show if not on first screen or has navigation history)
            if (widget.selectedIndex > 0 || _navigationHistory.length > 1) ...[
              GestureDetector(
                onTap: _goBack, // Use step-by-step back navigation
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: const Color(0xFF666666),
                    size: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],

            // Page Title (dynamic based on selected screen)
            Expanded(
              child: Text(
                _getScreenTitle(widget.selectedIndex),
                style: theme.textTheme.titleLarge?.copyWith(
                  color:
                      theme.textTheme.bodyLarge?.color ??
                      const Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),

            // Settings Icon
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color:
                    theme.textTheme.bodyMedium?.color ??
                    const Color(0xFF666666),
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),

            // Notifications
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color:
                    theme.textTheme.bodyMedium?.color ??
                    const Color(0xFF666666),
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 8),

            // User Profile with info
            const _UserProfile(
              avatarRadius: 18,
              showOnlineIndicator: true,
              showUserInfo: true,
            ),
          ],
        ),
      ),
    );
  }

  String _getScreenTitle(int index) {
    if (index < widget.config.navigationItems.length) {
      return widget.config.navigationItems[index].title;
    }
    return 'Unknown Screen';
  }

  Widget _buildMobileDrawer(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, const Color(0xFFFAFBFC)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Enhanced Header Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFFF8F9FA), const Color(0xFFFFFFFF)],
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xFFE5E7EB).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child:
                          widget.config.customLogo ??
                          const _AppLogo(size: 24, borderRadius: 6),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'AeroServe',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF1F2937),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          letterSpacing: -0.3,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Navigation Items with enhanced styling
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: widget.config.navigationItems
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: _NavigationItem(
                            item: item,
                            isSelected: widget.selectedIndex == item.index,
                            showLabel: true,
                            onTap: (index) {
                              widget.onNavigationChanged(index);
                              NavigationHelper.goBack(context);
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              // Enhanced Action Buttons Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  border: Border(
                    top: BorderSide(
                      color: const Color(0xFFE5E7EB).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    // Enhanced New Appointment Button (only for clinic admin)
                    if (widget.config.showNewAppointmentButton) ...[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1F2937), Color(0xFF111827)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: widget.config.onNewAppointment ?? () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEF4444),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'New Appointment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Hospital Information Card
                    widget.config.customHospitalInfo ??
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFFE5E7EB),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const _HospitalInfoCard(
                            isCompact: false,
                            showBackground: false,
                          ),
                        ),

                    const SizedBox(height: 16),

                    // Enhanced Logout Section
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          widget.config.onLogout?.call();
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF2F2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFFFECACA),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: const Color(0xFFDC2626),
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  color: const Color(0xFFDC2626),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// TABLET LAYOUT
// ============================================================================

class _TabletLayout extends StatefulWidget {
  final ModuleConfig config;
  final int selectedIndex;
  final Function(int) onNavigationChanged;

  const _TabletLayout({
    required this.config,
    required this.selectedIndex,
    required this.onNavigationChanged,
  });

  @override
  State<_TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<_TabletLayout> {
  bool _isSidebarExpanded = false;
  List<int> _navigationHistory = [0]; // Start with first screen

  @override
  void didUpdateWidget(_TabletLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Add current index to history if it's different from the last one
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      if (!_navigationHistory.contains(widget.selectedIndex)) {
        _navigationHistory.add(widget.selectedIndex);
      }
    }
  }

  void _goBack() {
    if (_navigationHistory.length > 1) {
      // Remove current screen from history
      _navigationHistory.removeLast();
      // Go to previous screen
      int previousIndex = _navigationHistory.last;
      widget.onNavigationChanged(previousIndex);
    } else {
      // If no history, go to first screen
      widget.onNavigationChanged(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Enhanced Collapsible Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _isSidebarExpanded ? 260 : 72,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(4, 0),
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(2, 0),
                    spreadRadius: -2,
                  ),
                ],
                border: Border(
                  right: BorderSide(
                    color: const Color(0xFFE5E7EB).withOpacity(0.6),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // Enhanced Header Section
                  Container(
                    padding: EdgeInsets.all(_isSidebarExpanded ? 16 : 14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [const Color(0xFFF8F9FA), Colors.white],
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFFE5E7EB).withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.all(_isSidebarExpanded ? 6 : 5),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6366F1).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child:
                              widget.config.customLogo ??
                              _AppLogo(
                                size: _isSidebarExpanded ? 22 : 20,
                                borderRadius: 6,
                              ),
                        ),
                        if (_isSidebarExpanded) ...[
                          const SizedBox(width: 10),
                          Flexible(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 150),
                              opacity: _isSidebarExpanded ? 1.0 : 0.0,
                              child: Text(
                                'AeroServe',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: const Color(0xFF1F2937),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      letterSpacing: -0.3,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Navigation Items
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: _isSidebarExpanded ? 12 : 8,
                        vertical: 8,
                      ),
                      children: widget.config.navigationItems
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: _NavigationItem(
                                item: item,
                                isSelected: widget.selectedIndex == item.index,
                                showLabel: _isSidebarExpanded,
                                onTap: widget.onNavigationChanged,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Enhanced Action Buttons Section
                  Padding(
                    padding: EdgeInsets.all(_isSidebarExpanded ? 12 : 8),
                    child: Column(
                      children: [
                        // Enhanced New Appointment Button (only for clinic admin)
                        if (widget.config.showNewAppointmentButton) ...[
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF1F2937), Color(0xFF111827)],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: widget.config.onNewAppointment ?? () {},
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: _isSidebarExpanded ? 12 : 10,
                                  ),
                                  child: _isSidebarExpanded
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFEF4444),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                size: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              'New Appointment',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEF4444),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        if (_isSidebarExpanded)
                          widget.config.customHospitalInfo ??
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.03),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const _HospitalInfoCard(
                                  isCompact: true,
                                  showBackground: false,
                                ),
                              ),
                      ],
                    ),
                  ),

                  // Enhanced Sidebar Controls
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFFAFBFC),
                          const Color(0xFFF8F9FA),
                        ],
                      ),
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xFFE5E7EB).withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Enhanced Expand/Collapse Button
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isSidebarExpanded = !_isSidebarExpanded;
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  _isSidebarExpanded
                                      ? Icons.chevron_left_rounded
                                      : Icons.chevron_right_rounded,
                                  color: const Color(0xFF6366F1),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Enhanced Logout Button
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            _isSidebarExpanded ? 12 : 10,
                            0,
                            _isSidebarExpanded ? 12 : 10,
                            12,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: widget.config.onLogout,
                              borderRadius: BorderRadius.circular(10),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                padding: EdgeInsets.symmetric(
                                  horizontal: _isSidebarExpanded ? 12 : 0,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFEF2F2),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFFECACA),
                                    width: 1,
                                  ),
                                ),
                                child: _isSidebarExpanded
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.logout_rounded,
                                            color: const Color(0xFFDC2626),
                                            size: 16,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Log out',
                                            style: TextStyle(
                                              color: const Color(0xFFDC2626),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Icon(
                                        Icons.logout_rounded,
                                        color: const Color(0xFFDC2626),
                                        size: 18,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                // Enhanced Modern AppBar
                Container(
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFFAFBFC)],
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFFE5E7EB).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Modern Back Button
                          if (widget.selectedIndex > 0 ||
                              _navigationHistory.length > 1) ...[
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: _goBack,
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF9FAFB),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Color(0xFF374151),
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],

                          // Enhanced Page Title with Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF6366F1).withOpacity(0.08),
                                  const Color(0xFF8B5CF6).withOpacity(0.08),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _getScreenTitle(widget.selectedIndex),
                              style: const TextStyle(
                                color: Color(0xFF1F2937),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                          const Spacer(),

                          // Custom Header Actions
                          if (widget.config.customHeaderActions != null)
                            ...widget.config.customHeaderActions!,

                          // Modern Settings Button
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.settings_rounded,
                                  color: Color(0xFF6B7280),
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Modern Notifications with Badge
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Icon(
                                      Icons.notifications_rounded,
                                      color: Color(0xFF6B7280),
                                      size: 18,
                                    ),
                                    Positioned(
                                      right: -4,
                                      top: -4,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFEF4444),
                                              Color(0xFFDC2626),
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Enhanced User Profile
                          const _UserProfile(
                            avatarRadius: 18,
                            showOnlineIndicator: true,
                            showUserInfo: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Screen content
                Expanded(child: widget.config.screens[widget.selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getScreenTitle(int index) {
    if (index < widget.config.navigationItems.length) {
      return widget.config.navigationItems[index].title;
    }
    return 'Unknown Screen';
  }
}

// ============================================================================
// DESKTOP LAYOUT
// ============================================================================

class _DesktopLayout extends StatefulWidget {
  final ModuleConfig config;
  final int selectedIndex;
  final Function(int) onNavigationChanged;

  const _DesktopLayout({
    required this.config,
    required this.selectedIndex,
    required this.onNavigationChanged,
  });

  @override
  State<_DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<_DesktopLayout> {
  List<int> _navigationHistory = [0]; // Start with first screen

  @override
  void didUpdateWidget(_DesktopLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Add current index to history if it's different from the last one
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      if (!_navigationHistory.contains(widget.selectedIndex)) {
        _navigationHistory.add(widget.selectedIndex);
      }
    }
  }

  void _goBack() {
    if (_navigationHistory.length > 1) {
      // Remove current screen from history
      _navigationHistory.removeLast();
      // Go to previous screen
      int previousIndex = _navigationHistory.last;
      widget.onNavigationChanged(previousIndex);
    } else {
      // If no history, go to first screen
      widget.onNavigationChanged(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Enhanced Fixed Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 240,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, const Color(0xFFFAFBFC)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(4, 0),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(2, 0),
                  ),
                ],
                border: Border(
                  right: BorderSide(
                    color: const Color(0xFFE5E7EB).withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // Enhanced Header Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [const Color(0xFFF8F9FA), Colors.white],
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFFE5E7EB).withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6366F1).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child:
                              widget.config.customLogo ??
                              const _AppLogo(size: 22, borderRadius: 6),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'AeroServe',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: const Color(0xFF1F2937),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  letterSpacing: -0.3,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Navigation Items with enhanced spacing
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      children: widget.config.navigationItems
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: _NavigationItem(
                                item: item,
                                isSelected: widget.selectedIndex == item.index,
                                showLabel: true,
                                onTap: widget.onNavigationChanged,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Enhanced Action Buttons Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xFFE5E7EB).withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Enhanced New Appointment Button (only for clinic admin)
                        if (widget.config.showNewAppointmentButton) ...[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF1F2937), Color(0xFF111827)],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: widget.config.onNewAppointment ?? () {},
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEF4444),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'New Appointment',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        // Hospital Info Card
                        widget.config.customHospitalInfo ??
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const _HospitalInfoCard(
                                isCompact: true,
                                showBackground: false,
                              ),
                            ),

                        const SizedBox(height: 12),

                        // Enhanced Logout Button
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: widget.config.onLogout,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEF2F2),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFFECACA),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout_rounded,
                                    color: const Color(0xFFDC2626),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Log out',
                                    style: TextStyle(
                                      color: const Color(0xFFDC2626),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
                // Enhanced Modern AppBar
                Container(
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFFAFBFC)],
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFFE5E7EB).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Modern Back Button
                          if (widget.selectedIndex > 0 ||
                              _navigationHistory.length > 1) ...[
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: _goBack,
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF9FAFB),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Color(0xFF374151),
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                          ],

                          // Enhanced Page Title with Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF6366F1).withOpacity(0.08),
                                  const Color(0xFF8B5CF6).withOpacity(0.08),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _getScreenTitle(widget.selectedIndex),
                              style: const TextStyle(
                                color: Color(0xFF1F2937),
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          const Spacer(),

                          // Custom Header Actions
                          if (widget.config.customHeaderActions != null)
                            ...widget.config.customHeaderActions!,

                          // Modern Settings Button
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.settings_rounded,
                                  color: Color(0xFF6B7280),
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Modern Notifications with Badge
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Icon(
                                      Icons.notifications_rounded,
                                      color: Color(0xFF6B7280),
                                      size: 18,
                                    ),
                                    Positioned(
                                      right: -4,
                                      top: -4,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFEF4444),
                                              Color(0xFFDC2626),
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),

                          // Enhanced User Profile
                          const _UserProfile(
                            avatarRadius: 18,
                            showOnlineIndicator: true,
                            showUserInfo: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Screen content
                Expanded(child: widget.config.screens[widget.selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getScreenTitle(int index) {
    if (index < widget.config.navigationItems.length) {
      return widget.config.navigationItems[index].title;
    }
    return 'Unknown Screen';
  }
}
