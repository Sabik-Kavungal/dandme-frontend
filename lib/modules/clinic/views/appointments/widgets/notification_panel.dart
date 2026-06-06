import 'package:flutter/material.dart';

/// A premium, high-fidelity notification panel for the clinical dashboard
/// Designed with a 10/10 aesthetic, utilizing Slate tokens and modern design principles.
class NotificationPanel extends StatelessWidget {
  final VoidCallback? onClose;

  const NotificationPanel({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    const hasNotifications = false;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 400, // Slightly wider for better readability
        height: 480, // Sleek, cohesive height for the empty state
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withOpacity(0.08),
              blurRadius: 40,
              offset: const Offset(0, 15),
            ),
            BoxShadow(
              color: const Color(0xFF0F172A).withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            children: [
              // Header
              _buildHeader(context, hasNotifications),
              
              // Notifications List or Empty State
              Expanded(
                child: _buildEmptyState(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool hasNotifications) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                      letterSpacing: -0.6,
                    ),
                  ),
                  if (hasNotifications) ...[
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '2 NEW',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close_rounded, color: Color(0xFF64748B), size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Elegant layered icon container matching the custom design
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC), // Slate 50
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE2E8F0), // Slate 200
                width: 1.5,
              ),
            ),
            child: const Icon(
              Icons.notifications_off_outlined,
              color: Color(0xFF94A3B8), // Slate 400
              size: 36,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "All caught up!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A), // Slate 900
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              "No new notifications at the moment. We'll alert you when there's an update.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF64748B), // Slate 500
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
