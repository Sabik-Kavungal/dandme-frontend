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

import 'dart:ui';
import 'package:drandme/modules/clinic/views/appointments/widgets/notification_panel.dart';
import 'package:flutter/material.dart';
import 'package:drandme/core/utils/app_helpers.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_model.dart';
import 'package:drandme/modules/clinic/viewmodels/clinic_viewmodel.dart';
import 'package:provider/provider.dart';

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
  final Map<int, String> extraScreenTitles;
  final Map<int, int>
  screenParentMapping; // Maps child/detail screen index -> parent nav index

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
    this.extraScreenTitles = const {},
    this.screenParentMapping = const {},
  });
}

/// Navigation item for modules
class ModuleNavItem {
  final String title;
  final IconData icon;
  final int index;
  final List<ModuleNavItem>? children;
  final String? badge;

  const ModuleNavItem({
    required this.title,
    required this.icon,
    required this.index,
    this.children,
    this.badge,
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


/// User profile component
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

  String _formatRole(String role) {
    final roleMap = {
      'super_admin': 'Super Admin',
      'organization_admin': 'Organization Admin',
      'clinic_admin': 'Clinic Admin',
      'doctor': 'Doctor',
      'patient': 'Patient',
      'pharmacist': 'Pharmacist',
    };
    return roleMap[role.toLowerCase()] ?? role;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authVM, _) {
        final userName = authVM.user?.fullName ?? 'User';
        final userRole = authVM.userRole ?? authVM.user?.role ?? 'Role';

        if (showUserInfo) {
          return _PremiumProfileContainer(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    RepaintBoundary(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6366F1).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0F172A).withOpacity(0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: avatarRadius,
                            backgroundColor: const Color(0xFFF8FAFC),
                            child: Text(
                              authVM.user?.initials ?? 'U',
                              style: TextStyle(
                                color: const Color(0xFF0F172A),
                                fontSize: avatarRadius * 0.7,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (showOnlineIndicator)
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: RepaintBoundary(
                          child: Container(
                            width: avatarRadius * 0.6,
                            height: avatarRadius * 0.6,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF10B981), Color(0xFF059669)],
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Color(0xFF0F172A),
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      _formatRole(userRole),
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: Color(0xFF94A3B8),
                ),
              ],
            ),
          );
        }

        return RepaintBoundary(
          child: Stack(
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
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _PremiumProfileContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _PremiumProfileContainer({required this.child, required this.onTap});

  @override
  State<_PremiumProfileContainer> createState() => _PremiumProfileContainerState();
}

class _PremiumProfileContainerState extends State<_PremiumProfileContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFFF8FAFC) : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered ? const Color(0xFFE2E8F0) : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Navigation item component
/// Styled Sidebar Navigation Item
class _NavigationItem extends StatefulWidget {
  final ModuleNavItem item;
  final bool isSelected;
  final bool isSidebarExpanded;
  final Function(int) onTap;
  final VoidCallback? onExpandSidebar;
  final ValueNotifier<int?>? openMenuNotifier;
  final int currentSelectedIndex; // Add this to know global selection

  const _NavigationItem({
    required this.item,
    required this.isSelected,
    required this.isSidebarExpanded,
    required this.onTap,
    this.onExpandSidebar,
    this.openMenuNotifier,
    this.currentSelectedIndex = -1, // Default
  });

  @override
  State<_NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<_NavigationItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isHovered = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late AnimationController _hoverController;
  late Animation<double> _hoverScale;

  @override
  void initState() {
    super.initState();
    _checkInitialExpansion();
    widget.openMenuNotifier?.addListener(_handleMenuStateChange);
    
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _hoverScale = Tween<double>(begin: 1.0, end: 1.015).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void didUpdateWidget(_NavigationItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentSelectedIndex != oldWidget.currentSelectedIndex) {
      _checkInitialExpansion();
    }
  }

  void _checkInitialExpansion() {
    bool isPathActive = false;
    if (widget.item.children != null && widget.item.children!.isNotEmpty) {
      isPathActive = widget.item.children!.any(
        (child) => child.index == widget.currentSelectedIndex,
      );
    }

    if (widget.isSelected || (isPathActive && widget.isSidebarExpanded)) {
      _isExpanded = true;
    }
  }

  void _handleMenuStateChange() {
    if (widget.openMenuNotifier == null) return;
    if (widget.openMenuNotifier!.value != widget.item.index) {
      _removeOverlay();
    }
  }

  @override
  void dispose() {
    widget.openMenuNotifier?.removeListener(_handleMenuStateChange);
    _hoverController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showFloatingMenu(BuildContext context, List<ModuleNavItem> children) {
    _removeOverlay();

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = Offset(size.width + 10, 0);

    widget.openMenuNotifier?.value = widget.item.index;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: offset,
          showWhenUnlinked: false,
          child: RepaintBoundary(
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              shadowColor: Colors.black.withOpacity(0.05),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        widget.item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF0284C7),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF1F5F9),
                    ),
                    ...children.map((child) {
                      final isChildSelected =
                          widget.currentSelectedIndex == child.index;

                      return InkWell(
                        onTap: () {
                          _removeOverlay();
                          widget.openMenuNotifier?.value = null;
                          widget.onTap(child.index);
                        },
                        hoverColor: const Color(0xFFF8FAFC),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isChildSelected
                                ? const Color(0xFFE0F2FE)
                                : null,
                          ),
                          child: Text(
                            child.title,
                            style: TextStyle(
                              fontSize: 13,
                              color: isChildSelected
                                  ? const Color(0xFF0284C7)
                                  : const Color(0xFF334155),
                              fontWeight: isChildSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    final hasChildren =
        widget.item.children != null && widget.item.children!.isNotEmpty;
    bool isPathActive = false;
    if (hasChildren) {
      isPathActive = widget.item.children!.any(
        (child) => child.index == widget.currentSelectedIndex,
      );
    }

    const inactiveIconColor = Color(0xFF64748B);

    return CompositedTransformTarget(
      link: _layerLink,
      child: Tooltip(
        message: !widget.isSidebarExpanded ? widget.item.title : '',
        waitDuration: const Duration(milliseconds: 500),
        preferBelow: false,
        verticalOffset: 20,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        child: MouseRegion(
          onEnter: (_) {
            if (mounted) setState(() => _isHovered = true);
            _hoverController.forward();
          },
          onExit: (_) {
            if (mounted) setState(() => _isHovered = false);
            _hoverController.reverse();
          },
          cursor: SystemMouseCursors.click,
          child: ScaleTransition(
            scale: _hoverScale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RepaintBoundary(
                  child: InkWell(
                    onTap: () {
                      if (hasChildren) {
                        if (!widget.isSidebarExpanded) {
                          _showFloatingMenu(context, widget.item.children!);
                        } else {
                          if (mounted) setState(() => _isExpanded = !_isExpanded);
                        }
                      } else {
                        widget.onTap(widget.item.index);
                      }
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeOutExpo,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.isSidebarExpanded ? 12 : 8,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: (widget.isSelected || isPathActive)
                            ? const LinearGradient(
                                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : _isHovered 
                                ? const LinearGradient(
                                    colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                        boxShadow: (widget.isSelected || isPathActive)
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF0F172A).withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : null,
                        border: Border.all(
                          color: (widget.isSelected || isPathActive)
                              ? const Color(0xFF0F172A)
                              : _isHovered ? const Color(0xFFE2E8F0) : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: widget.isSidebarExpanded 
                            ? MainAxisSize.max 
                            : MainAxisSize.min,
                        mainAxisAlignment: widget.isSidebarExpanded
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          RepaintBoundary(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: EdgeInsets.all(widget.isSidebarExpanded ? 0 : 4),
                              decoration: !widget.isSidebarExpanded ? BoxDecoration(
                                color: (widget.isSelected || isPathActive) 
                                    ? Colors.white.withOpacity(0.15) 
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ) : null,
                              child: Icon(
                                widget.item.icon,
                                size: 20,
                                color: (widget.isSelected || isPathActive)
                                    ? Colors.white
                                    : _isHovered ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                              ),
                            ),
                          ),
                          if (widget.isSidebarExpanded) ...[
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: (widget.isSelected || isPathActive)
                                      ? FontWeight.w700
                                      : FontWeight.w600,
                                  color: (widget.isSelected || isPathActive)
                                      ? Colors.white
                                      : _isHovered ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                            if (widget.item.badge != null)
                              _ItemBadge(
                                badge: widget.item.badge!,
                                isSelected: widget.isSelected,
                              )
                            else if (hasChildren)
                              RepaintBoundary(
                                child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 200),
                                  turns: _isExpanded ? 0.5 : 0,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 16,
                                    color: (widget.isSelected || isPathActive)
                                        ? Colors.white.withOpacity(0.8)
                                        : _isHovered ? const Color(0xFF0F172A) : inactiveIconColor,
                                  ),
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                if (hasChildren && _isExpanded && widget.isSidebarExpanded)
                  RepaintBoundary(
                    child: Container(
                      margin: const EdgeInsets.only(left: 26),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFF1F5F9),
                            width: 1.5,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.item.children!.map((child) {
                          return _SubNavigationItem(
                            title: child.title,
                            isSelected: widget.currentSelectedIndex == child.index,
                            onTap: () => widget.onTap(child.index),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemBadge extends StatelessWidget {
  final String badge;
  final bool isSelected;

  const _ItemBadge({required this.badge, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white.withOpacity(0.15)
            : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected 
            ? Colors.white.withOpacity(0.2)
            : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Text(
        badge,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: isSelected ? Colors.white : const Color(0xFF0F172A),
        ),
      ),
    );
  }
}

class _SubNavigationItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SubNavigationItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_SubNavigationItem> createState() => _SubNavigationItemState();
}

class _SubNavigationItemState extends State<_SubNavigationItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _isHovered ? const Color(0xFFF8FAFC) : Colors.transparent,
          ),
          child: Row(
            children: [
              RepaintBoundary(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: widget.isSelected ? 6 : 0,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  margin: EdgeInsets.only(right: widget.isSelected ? 10 : 0),
                ),
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: widget.isSelected ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _DisconnectButton extends StatefulWidget {
  final VoidCallback? onTap;

  const _DisconnectButton({this.onTap});

  @override
  State<_DisconnectButton> createState() => _DisconnectButtonState();
}

class _DisconnectButtonState extends State<_DisconnectButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: _isHovered ? const Color(0xFFFEF2F2) : const Color(0xFFF1F5F9),
            border: Border.all(
              color: _isHovered ? const Color(0xFFFECACA) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              RepaintBoundary(
                child: Icon(
                  Icons.power_settings_new_rounded,
                  size: 20,
                  color: _isHovered ? const Color(0xFFDC2626) : Colors.black,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Disconnect",
                  style: TextStyle(
                    color: _isHovered ? const Color(0xFFDC2626) : Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarFooterAction extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final String? tooltip;
  final bool isDanger;

  const _SidebarFooterAction({
    required this.icon,
    this.onTap,
    this.tooltip,
    this.isDanger = false,
  });

  @override
  State<_SidebarFooterAction> createState() => _SidebarFooterActionState();
}

class _SidebarFooterActionState extends State<_SidebarFooterAction> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.isDanger ? const Color(0xFFDC2626) : const Color(0xFF64748B);
    final hoverColor = widget.isDanger ? const Color(0xFFFEF2F2) : const Color(0xFFF8FAFC);
    final borderColor = widget.isDanger ? const Color(0xFFFECACA) : const Color(0xFFE2E8F0);

    return Tooltip(
      message: widget.tooltip ?? '',
      preferBelow: false,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isHovered ? hoverColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isHovered ? borderColor : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: RepaintBoundary(
              child: Icon(
                widget.icon,
                size: 22,
                color: _isHovered ? (widget.isDanger ? const Color(0xFFDC2626) : const Color(0xFF0F172A)) : baseColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Notification Panel Logic
  final LayerLink _notificationLayerLink = LayerLink();
  OverlayEntry? _notificationOverlay;

  void _toggleNotification(BuildContext context) {
    if (_notificationOverlay != null) {
      _notificationOverlay!.remove();
      _notificationOverlay = null;
    } else {
      final overlay = Overlay.of(context);
      final screenWidth = MediaQuery.of(context).size.width;
      _notificationOverlay = OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Barrier to close on outside tap
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _notificationOverlay?.remove();
                  _notificationOverlay = null;
                },
                behavior: HitTestBehavior.translucent,
              ),
            ),
            Positioned(
              width: screenWidth > 420 ? 380 : (screenWidth * 0.9),
              child: CompositedTransformFollower(
                link: _notificationLayerLink,
                showWhenUnlinked: false,
                offset: Offset(screenWidth > 420 ? -340 : -(screenWidth * 0.78), 50),
                child: Material(
                  color: Colors.transparent,
                  child: NotificationPanel(
                    onClose: () {
                      _notificationOverlay?.remove();
                      _notificationOverlay = null;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      overlay.insert(_notificationOverlay!);
    }
  }

  @override
  void dispose() {
    if (_notificationOverlay != null) {
      _notificationOverlay!.remove();
      _notificationOverlay = null;
    }
    super.dispose();
  }

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
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: _IntegratedModuleHeader(
          config: widget.config,
          selectedIndex: widget.selectedIndex,
          showHamburger: true,
          onHamburgerTap: () => _scaffoldKey.currentState?.openDrawer(),
          showBackButton:
              widget.selectedIndex > 0 || _navigationHistory.length > 1,
          onBack: _goBack,
          isMobile: true,
          onNotificationTap: () => _toggleNotification(context),
          notificationLayerLink: _notificationLayerLink,
        ),
      ),
      drawer: _buildMobileDrawer(context),
      body: widget.config.screens[widget.selectedIndex],
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            RepaintBoundary(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                  ),
                ),
                child: Consumer2<AuthViewModel, ClinicViewModel>(
                  builder: (context, authVM, clinicVM, _) {
                    final userClinicId = authVM.user?.clinicId;
                    ClinicModel? userClinic;
                    if (userClinicId != null && clinicVM.clinics.isNotEmpty) {
                      try {
                        userClinic = clinicVM.clinics
                            .firstWhere((c) => c.id == userClinicId);
                      } catch (_) {}
                    }
                    final clinicName =
                        userClinic?.name ?? authVM.user?.firstName ?? 'Clinic';
                    final clinicLogo = userClinic?.logo ?? authVM.user?.logo;
                    final initials =
                        clinicName.isNotEmpty ? clinicName[0].toUpperCase() : 'C';

                    return Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFE2E8F0),
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: clinicLogo != null && clinicLogo.isNotEmpty
                                ? Image.network(
                                    AppHelpers.ensureImageUrl(clinicLogo),
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Center(
                                      child: Text(
                                        initials,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      initials,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                clinicName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1E293B),
                                  letterSpacing: -0.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                authVM.user?.role ?? 'Clinic',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF64748B),
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: RepaintBoundary(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: widget.config.navigationItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: _NavigationItem(
                        item: item,
                        isSelected: widget.selectedIndex == item.index,
                        isSidebarExpanded: true,
                        currentSelectedIndex: widget.selectedIndex,
                        onTap: (index) {
                          widget.onNavigationChanged(index);
                          _scaffoldKey.currentState?.closeDrawer();
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            RepaintBoundary(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
                child: InkWell(
                  onTap: widget.config.onLogout,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.power_settings_new_rounded,
                          size: 22,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Disconnect',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
  final ValueNotifier<int?> _openMenuNotifier = ValueNotifier<int?>(null);
  
  // Notification Panel Logic
  final LayerLink _notificationLayerLink = LayerLink();
  OverlayEntry? _notificationOverlay;
  
  void _toggleNotification(BuildContext context) {
    if (_notificationOverlay != null) {
      _notificationOverlay!.remove();
      _notificationOverlay = null;
    } else {
      final overlay = Overlay.of(context);
      _notificationOverlay = OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Barrier to close on outside tap
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _notificationOverlay?.remove();
                  _notificationOverlay = null;
                },
                behavior: HitTestBehavior.translucent,
              ),
            ),
            Positioned(
              width: 380,
              child: CompositedTransformFollower(
                link: _notificationLayerLink,
                showWhenUnlinked: false,
                offset: const Offset(-340, 50),
                child: Material(
                  color: Colors.transparent,
                  child: NotificationPanel(
                    onClose: () {
                      _notificationOverlay?.remove();
                      _notificationOverlay = null;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      overlay.insert(_notificationOverlay!);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authVM = Provider.of<AuthViewModel>(context, listen: false);
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

      if (authVM.user?.clinicId != null &&
          clinicVM.clinics.isEmpty &&
          !clinicVM.isLoading) {
        clinicVM.fetchClinics(context);
      }
    });
  }

  @override
  void dispose() {
    if (_notificationOverlay != null) {
      _notificationOverlay!.remove();
      _notificationOverlay = null;
    }
    _openMenuNotifier.dispose();
    super.dispose();
  }

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
          RepaintBoundary(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutExpo,
              width: _isSidebarExpanded ? 260 : 72,
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  right: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(4, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // HEADER - Clinic Logo & Name
                  RepaintBoundary(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Consumer2<AuthViewModel, ClinicViewModel>(
                        builder: (context, authVM, clinicVM, _) {
                          final userClinicId = authVM.user?.clinicId;
                          ClinicModel? userClinic;

                          if (userClinicId != null &&
                              clinicVM.clinics.isNotEmpty) {
                            try {
                              userClinic = clinicVM.clinics.firstWhere(
                                (c) => c.id == userClinicId,
                              );
                            } catch (_) {}
                          }

                          final clinicName =
                              userClinic?.name ??
                              authVM.user?.firstName ??
                              "Clinic";
                          final clinicLogo =
                              userClinic?.logo ?? authVM.user?.logo;
                          final initials = clinicName.isNotEmpty
                              ? clinicName[0].toUpperCase()
                              : "C";

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Circular Logo
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B82F6),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFE2E8F0),
                                    width: 1.5,
                                  ),
                                ),
                                child: ClipOval(
                                  child:
                                      clinicLogo != null &&
                                          clinicLogo.isNotEmpty
                                      ? Image.network(
                                          AppHelpers.ensureImageUrl(clinicLogo),
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(
                                                    child: Text(
                                                      initials,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                        )
                                      : Center(
                                          child: Text(
                                            initials,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              if (_isSidebarExpanded)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      clinicName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF1E293B),
                                        letterSpacing: -0.5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // NAVIGATION
                  Expanded(
                    child: RepaintBoundary(
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        children: widget.config.navigationItems
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                ),
                                child: _NavigationItem(
                                  item: item,
                                  isSelected:
                                      widget.selectedIndex == item.index,
                                  isSidebarExpanded: _isSidebarExpanded,
                                  onTap: widget.onNavigationChanged,
                                  onExpandSidebar: () {
                                    if (mounted) {
                                      setState(() {
                                        _isSidebarExpanded = true;
                                      });
                                    }
                                  },
                                  openMenuNotifier: _openMenuNotifier,
                                  currentSelectedIndex: widget.selectedIndex,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),

                  // FOOTER
                  RepaintBoundary(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          _SidebarFooterAction(
                            icon: _isSidebarExpanded
                                ? Icons.chevron_left_rounded
                                : Icons.chevron_right_rounded,
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  _isSidebarExpanded = !_isSidebarExpanded;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          if (_isSidebarExpanded)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: _DisconnectButton(onTap: widget.config.onLogout),
                            )
                          else
                            _SidebarFooterAction(
                              icon: Icons.logout_rounded,
                              onTap: widget.config.onLogout,
                              isDanger: true,
                              tooltip: 'Logout',
                            ),
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
                // Enhanced Tablet AppBar (Classy & Responsive)
                _IntegratedModuleHeader(
                  config: widget.config,
                  selectedIndex: widget.selectedIndex,
                  showBackButton:
                      widget.selectedIndex > 0 || _navigationHistory.length > 1,
                  onBack: _goBack,
                  isTablet: true,
                  onNotificationTap: () => _toggleNotification(context),
                  notificationLayerLink: _notificationLayerLink,
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
  late List<int> _navigationHistory;
  bool _isSidebarExpanded = true; // Default to expanded on desktop
  final ValueNotifier<int?> _openMenuNotifier = ValueNotifier<int?>(null);
  
  // Notification Panel Logic
  final LayerLink _notificationLayerLink = LayerLink();
  OverlayEntry? _notificationOverlay;
  
  void _toggleNotification(BuildContext context) {
    if (_notificationOverlay != null) {
      _notificationOverlay!.remove();
      _notificationOverlay = null;
    } else {
      final overlay = Overlay.of(context);
      _notificationOverlay = OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Barrier to close on outside tap
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _notificationOverlay?.remove();
                  _notificationOverlay = null;
                },
                behavior: HitTestBehavior.translucent,
              ),
            ),
            Positioned(
              width: 380,
              child: CompositedTransformFollower(
                link: _notificationLayerLink,
                showWhenUnlinked: false,
                offset: const Offset(-340, 50),
                child: Material(
                  color: Colors.transparent,
                  child: NotificationPanel(
                    onClose: () {
                      _notificationOverlay?.remove();
                      _notificationOverlay = null;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      overlay.insert(_notificationOverlay!);
    }
  }

  @override
  void dispose() {
    if (_notificationOverlay != null) {
      _notificationOverlay!.remove();
      _notificationOverlay = null;
    }
    _openMenuNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Initialize history: start with Dashboard (0)
    // If selectedIndex is not 0, add it too so we can go back to Dashboard.
    if (widget.selectedIndex == 0) {
      _navigationHistory = [0];
    } else {
      _navigationHistory = [0, widget.selectedIndex];
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authVM = Provider.of<AuthViewModel>(context, listen: false);
      final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

      if (authVM.user?.clinicId != null &&
          clinicVM.clinics.isEmpty &&
          !clinicVM.isLoading) {
        clinicVM.fetchClinics(context);
      }
    });
  }

  @override
  void didUpdateWidget(_DesktopLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      // Check if the NEW index is a "Root" item (Sidebar Item)
      // We assume items NOT in screenParentMapping are root items.
      final isDetailScreen = widget.config.screenParentMapping.containsKey(
        widget.selectedIndex,
      );

      if (!isDetailScreen) {
        // IMPROVED: If navigating to a Root Sidebar item, RESET history.
        // This ensures clicking a new tab clears the "Back" stack of the previous tab.
        // We always keep '0' (Dashboard) as the absolute base if desired,
        // but for now, let's just make the new root the start of history.
        if (widget.selectedIndex == 0) {
          _navigationHistory = [0];
        } else {
          _navigationHistory = [0, widget.selectedIndex];
        }
      } else {
        // It's a Detail Screen -> specific logic
        // 1. If we pressed "Back", we effectively just popped, so don't re-add.
        //    (We handle this by checking if the new index is the one *before* top).
        //    But wait, `didUpdateWidget` triggers after `setState`.
        //    We simply ADD to history here. The `_goBack` method handles removing.
        //    To avoid duplicates if we navigate internally:
        if (_navigationHistory.last != widget.selectedIndex) {
          _navigationHistory.add(widget.selectedIndex);
        }
      }
    }
  }

  void _goBack() {
    if (_navigationHistory.length > 1) {
      // Remove current screen
      _navigationHistory.removeLast();
      // Get the distinct previous screen
      final previousIndex = _navigationHistory.last;

      // Update parent without triggering history add (handled by checking `last` in logic,
      // but simpler to just call the callback)
      widget.onNavigationChanged(previousIndex);
    } else {
      // If history is exhausted or at root, go to Dashboard (0)
      if (widget.selectedIndex != 0) {
        widget.onNavigationChanged(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Enhanced Collapsible Sidebar with Performance Optimization
          RepaintBoundary(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutExpo,
              width: _isSidebarExpanded ? 260 : 72,
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  right: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withOpacity(0.04),
                    blurRadius: 40,
                    offset: const Offset(8, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // HEADER: CLINIC LOGO + NAME
                  RepaintBoundary(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Consumer2<AuthViewModel, ClinicViewModel>(
                        builder: (context, authVM, clinicVM, _) {
                          final userClinicId = authVM.user?.clinicId;
                          ClinicModel? userClinic;

                          if (userClinicId != null &&
                              clinicVM.clinics.isNotEmpty) {
                            try {
                              userClinic = clinicVM.clinics.firstWhere(
                                (c) => c.id == userClinicId,
                              );
                            } catch (_) {}
                          }

                          final clinicName =
                              userClinic?.name ??
                              authVM.user?.firstName ??
                              "Clinic";
                          final clinicLogo =
                              userClinic?.logo ?? authVM.user?.logo;
                          final initials = clinicName.isNotEmpty
                              ? clinicName[0].toUpperCase()
                              : "C";

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B82F6),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFE2E8F0),
                                    width: 1.5,
                                  ),
                                ),
                                child: ClipOval(
                                  child:
                                      clinicLogo != null && clinicLogo.isNotEmpty
                                      ? Image.network(
                                          AppHelpers.ensureImageUrl(clinicLogo),
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(
                                                    child: Text(
                                                      initials,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                        )
                                      : Center(
                                          child: Text(
                                            initials,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              if (_isSidebarExpanded) ...[
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    clinicName,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF1E293B),
                                      letterSpacing: -0.5,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // NAVIGATION LIST
                  Expanded(
                    child: RepaintBoundary(
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        children: widget.config.navigationItems.map((item) {
                          final parentIndex = widget
                              .config
                              .screenParentMapping[widget.selectedIndex];
                          final effectiveIndex =
                              parentIndex ?? widget.selectedIndex;

                          bool isChildActive = false;
                          if (item.children != null) {
                            isChildActive = item.children!.any(
                              (child) => child.index == effectiveIndex,
                            );
                          }

                          return _NavigationItem(
                            item: item,
                            isSelected:
                                effectiveIndex == item.index || isChildActive,
                            isSidebarExpanded: _isSidebarExpanded,
                            onTap: widget.onNavigationChanged,
                            currentSelectedIndex: effectiveIndex,
                            openMenuNotifier: _openMenuNotifier,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // FOOTER: DARK MODE + PROFILE
                  RepaintBoundary(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          _SidebarFooterAction(
                            icon: _isSidebarExpanded
                                ? Icons.chevron_left_rounded
                                : Icons.chevron_right_rounded,
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  _isSidebarExpanded = !_isSidebarExpanded;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          if (_isSidebarExpanded)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: _DisconnectButton(onTap: widget.config.onLogout),
                            )
                          else
                            _SidebarFooterAction(
                              icon: Icons.logout_rounded,
                              onTap: widget.config.onLogout,
                              isDanger: true,
                              tooltip: 'Logout',
                            ),
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
                _IntegratedModuleHeader(
                  config: widget.config,
                  selectedIndex: widget.selectedIndex,
                  showBackButton:
                      widget.selectedIndex > 0 || _navigationHistory.length > 1,
                  onBack: _goBack,
                  onNotificationTap: () => _toggleNotification(context),
                  notificationLayerLink: _notificationLayerLink,
                ),

                // Screen content
                // Screen content with repaint boundary for extreme performance
                Expanded(
                  child: RepaintBoundary(
                    child: widget.config.screens[widget.selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenMetadata {
  final String title;
  final String? parentTitle;

  _ScreenMetadata({required this.title, this.parentTitle});
}

/// A sophisticated unified header optimized for all screen sizes
class _IntegratedModuleHeader extends StatelessWidget {
  final ModuleConfig config;
  final int selectedIndex;
  final VoidCallback? onBack;
  final bool showBackButton;
  final bool showHamburger;
  final VoidCallback? onHamburgerTap;
  final bool isMobile;
  final bool isTablet;
  final VoidCallback? onNotificationTap;
  final LayerLink? notificationLayerLink;

  const _IntegratedModuleHeader({
    required this.config,
    required this.selectedIndex,
    this.onBack,
    this.showBackButton = false,
    this.showHamburger = false,
    this.onHamburgerTap,
    this.isMobile = false,
    this.isTablet = false,
    this.onNotificationTap,
    this.notificationLayerLink,
  });

  _ScreenMetadata _getScreenMetadata() {
    // 1. Check custom titles first
    final customTitle = config.extraScreenTitles[selectedIndex];
    if (customTitle != null && customTitle.isNotEmpty) {
      final parentIndex = config.screenParentMapping[selectedIndex];
      String? parentTitle;
      if (parentIndex != null) {
        for (final item in config.navigationItems) {
          if (item.index == parentIndex) {
            parentTitle = item.title;
            break;
          }
        }
      }
      return _ScreenMetadata(title: customTitle, parentTitle: parentTitle);
    }

    // 2. Search in navigation items
    for (final item in config.navigationItems) {
      if (item.index == selectedIndex) {
        return _ScreenMetadata(title: item.title, parentTitle: "Menu");
      }
      if (item.children != null) {
        for (final child in item.children!) {
          if (child.index == selectedIndex) {
            return _ScreenMetadata(title: child.title, parentTitle: item.title);
          }
        }
      }
    }
    return _ScreenMetadata(title: 'Unknown Screen', parentTitle: null);
  }

  @override
  Widget build(BuildContext context) {
    final metadata = _getScreenMetadata();
    final isDesktop = !isMobile && !isTablet;

    return RepaintBoundary(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            width: double.infinity,
            height: isMobile ? 64 : (isTablet ? 72 : 78),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              border: const Border(
                bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : (isTablet ? 16 : 32),
                ),
                child: Row(
                  children: [
                    if (showHamburger) ...[
                      _buildHeaderIconButton(
                        Icons.menu_rounded,
                        onTap: onHamburgerTap,
                        isVerySmall: isMobile,
                      ),
                      const SizedBox(width: 8),
                    ],
                    if (showBackButton && onBack != null) ...[
                      _buildHeaderIconButton(
                        Icons.arrow_back_rounded,
                        onTap: onBack,
                        isVerySmall: isMobile,
                        showBorder: !isMobile,
                      ),
                      SizedBox(width: isMobile ? 8 : 16),
                    ],
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isMobile) ...[
                            Row(
                              children: [
                                Text(
                                  metadata.parentTitle ?? "Home",
                                  style: const TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    size: 12,
                                    color: Color(0xFFCBD5E1),
                                  ),
                                ),
                                Text(
                                  metadata.title,
                                  style: const TextStyle(
                                    color: Color(0xFF64748B),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                          ],
                          Text(
                            metadata.title,
                            style: TextStyle(
                              color: const Color(0xFF0F172A),
                              fontWeight: FontWeight.w800,
                              fontSize: isMobile ? 16 : (isTablet ? 19 : 24),
                              letterSpacing: -0.6,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (isDesktop) ...[const SizedBox(width: 20), _buildSearchBar()],
                    const SizedBox(width: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isMobile) ...[
                          if (notificationLayerLink != null)
                            CompositedTransformTarget(
                              link: notificationLayerLink!,
                              child: _buildHeaderAction(
                                Icons.notifications_outlined,
                                hasBadge: false,
                                onTap: onNotificationTap,
                              ),
                            )
                          else
                            _buildHeaderAction(
                              Icons.notifications_outlined,
                              hasBadge: false,
                              onTap: onNotificationTap,
                            ),
                          const SizedBox(width: 12),
                        ] else ...[
                          if (notificationLayerLink != null)
                            CompositedTransformTarget(
                              link: notificationLayerLink!,
                              child: _buildHeaderAction(
                                Icons.notifications_outlined,
                                hasBadge: false,
                                onTap: onNotificationTap,
                              ),
                            )
                          else
                            _buildHeaderAction(
                              Icons.notifications_outlined,
                              hasBadge: false,
                              onTap: onNotificationTap,
                            ),
                          const SizedBox(width: 12),
                          if (isDesktop) ...[
                            _buildHeaderAction(Icons.settings_outlined),
                            const SizedBox(width: 16),
                          ],
                          Container(
                            width: 1.5,
                            height: 32,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        _UserProfile(
                          avatarRadius: isMobile ? 14 : 20,
                          showOnlineIndicator: true,
                          showUserInfo: isDesktop || (isTablet && !isMobile),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIconButton(
    IconData icon, {
    VoidCallback? onTap,
    bool isVerySmall = false,
    bool showBorder = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(isVerySmall ? 6 : 8),
          decoration: BoxDecoration(
            color: showBorder ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: showBorder
                ? Border.all(color: const Color(0xFFE2E8F0))
                : null,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF475569),
            size: isVerySmall ? 18 : 20,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderAction(IconData icon,
      {bool hasBadge = false, VoidCallback? onTap}) {
    return _HoverActionIcon(
      icon: icon,
      hasBadge: hasBadge,
      onTap: onTap,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: Color(0xFF64748B), size: 18),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Search anything...",
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Text(
              "/",
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverActionIcon extends StatefulWidget {
  final IconData icon;
  final bool hasBadge;
  final VoidCallback? onTap;

  const _HoverActionIcon({
    required this.icon,
    this.hasBadge = false,
    this.onTap,
  });

  @override
  State<_HoverActionIcon> createState() => _HoverActionIconState();
}

class _HoverActionIconState extends State<_HoverActionIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _isHovered ? 1.05 : 1.0,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFFF8FAFC) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? const Color(0xFFE2E8F0) : const Color(0xFFF1F5F9),
              width: 1.5,
            ),
            boxShadow: _isHovered ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ] : [],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              splashColor: const Color(0xFFF1F5F9),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    widget.icon, 
                    color: _isHovered ? const Color(0xFF0F172A) : const Color(0xFF64748B), 
                    size: 20,
                  ),
                  if (widget.hasBadge)
                    Positioned(
                      top: 10,
                      right: 11,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  }


/// A premium healthcare empty state component
class HealthcareEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const HealthcareEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFF1F5F9), width: 2),
              ),
              child: Icon(
                icon,
                size: 40,
                color: const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 320,
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  actionLabel!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
