import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/authVM.dart';

/// Service to handle automatic token refresh
class TokenRefreshService {
  static TokenRefreshService? _instance;
  static TokenRefreshService get instance =>
      _instance ??= TokenRefreshService._();

  TokenRefreshService._();

  Timer? _refreshTimer;
  BuildContext? _context;

  /// Start automatic token refresh
  void startAutoRefresh(BuildContext context) {
    _context = context;
    _scheduleNextRefresh();
  }

  /// Stop automatic token refresh
  void stopAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
    _context = null;
  }

  /// Schedule the next token refresh
  void _scheduleNextRefresh() {
    if (_context == null) return;

    final authVM = Provider.of<AuthViewModel>(_context!, listen: false);
    final tokens = authVM.tokens;

    if (tokens == null || tokens.isRefreshTokenExpired) {
      print(
        'TokenRefreshService: Refresh token expired, stopping auto refresh',
      );
      return;
    }

    final timeUntilExpiry = tokens.timeUntilAccessTokenExpires;
    if (timeUntilExpiry == null) {
      print(
        'TokenRefreshService: Cannot determine token expiry, retrying in 5 minutes',
      );
      _scheduleRefreshIn(Duration(minutes: 5));
      return;
    }

    // Refresh token 2 minutes before it expires
    final refreshTime = timeUntilExpiry - Duration(minutes: 2);

    if (refreshTime.isNegative) {
      // Token is already expired or will expire soon, refresh immediately
      print(
        'TokenRefreshService: Token expired or expiring soon, refreshing immediately',
      );
      _refreshToken();
    } else {
      print(
        'TokenRefreshService: Scheduling refresh in ${refreshTime.inMinutes} minutes',
      );
      _scheduleRefreshIn(refreshTime);
    }
  }

  /// Schedule a refresh after a specific duration
  void _scheduleRefreshIn(Duration duration) {
    _refreshTimer?.cancel();
    _refreshTimer = Timer(duration, () {
      _refreshToken();
    });
  }

  /// Refresh the token
  Future<void> _refreshToken() async {
    if (_context == null) return;

    try {
      final authVM = Provider.of<AuthViewModel>(_context!, listen: false);
      print('TokenRefreshService: Attempting to refresh token...');

      final success = await authVM.refreshAccessToken();

      if (success) {
        print('TokenRefreshService: Token refreshed successfully');
        // Schedule the next refresh
        _scheduleNextRefresh();
      } else {
        print(
          'TokenRefreshService: Token refresh failed, retrying in 1 minute',
        );
        // Retry in 1 minute if refresh failed
        _scheduleRefreshIn(Duration(minutes: 1));
      }
    } catch (e) {
      print('TokenRefreshService: Error during token refresh: $e');
      // Retry in 1 minute on error
      _scheduleRefreshIn(Duration(minutes: 1));
    }
  }

  /// Force refresh token immediately
  Future<bool> forceRefresh() async {
    if (_context == null) return false;

    try {
      final authVM = Provider.of<AuthViewModel>(_context!, listen: false);
      final success = await authVM.refreshAccessToken();

      if (success) {
        _scheduleNextRefresh();
      }

      return success;
    } catch (e) {
      print('TokenRefreshService: Error during force refresh: $e');
      return false;
    }
  }

  /// Check if auto refresh is active
  bool get isActive => _refreshTimer != null && _refreshTimer!.isActive;

  /// Get time until next refresh
  Duration? get timeUntilNextRefresh {
    if (_refreshTimer == null || !_refreshTimer!.isActive) return null;

    // This is an approximation since Timer doesn't expose remaining time
    // In a real implementation, you'd track the scheduled time
    return null;
  }
}

/// Widget to automatically start/stop token refresh service
class TokenRefreshManager extends StatefulWidget {
  final Widget child;

  const TokenRefreshManager({super.key, required this.child});

  @override
  State<TokenRefreshManager> createState() => _TokenRefreshManagerState();
}

class _TokenRefreshManagerState extends State<TokenRefreshManager> {
  @override
  void initState() {
    super.initState();
    // Start auto refresh when widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        TokenRefreshService.instance.startAutoRefresh(context);
      }
    });
  }

  @override
  void dispose() {
    // Stop auto refresh when widget is disposed
    TokenRefreshService.instance.stopAutoRefresh();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
