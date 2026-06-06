import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'dart:convert';

class SessionManagementWidget extends StatefulWidget {
  const SessionManagementWidget({super.key});

  @override
  State<SessionManagementWidget> createState() =>
      _SessionManagementWidgetState();
}

class _SessionManagementWidgetState extends State<SessionManagementWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, AuthViewModel, child) {
        if (!AuthViewModel.isAuthenticated) {
          return const SizedBox.shrink();
        }

        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.security, color: Colors.blue),
                    const SizedBox(width: 8),
                    const Text(
                      'Session Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    if (AuthViewModel.isRefreshing)
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTokenStatus(AuthViewModel),
                const SizedBox(height: 16),
                _buildTokenDetails(AuthViewModel),
                const SizedBox(height: 16),
                _buildActionButtons(AuthViewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTokenStatus(AuthViewModel AuthViewModel) {
    final tokens = AuthViewModel.tokens;
    if (tokens == null) return const SizedBox.shrink();

    final accessExpired = tokens.isAccessTokenExpired;
    final refreshExpired = tokens.isRefreshTokenExpired;
    final accessTimeLeft = tokens.timeUntilAccessTokenExpires;
    final refreshTimeLeft = tokens.timeUntilRefreshTokenExpires;

    return Column(
      children: [
        _buildStatusRow(
          'Access Token',
          accessExpired ? 'Expired' : 'Valid',
          accessExpired ? Colors.red : Colors.green,
          accessTimeLeft != null ? _formatDuration(accessTimeLeft) : null,
        ),
        const SizedBox(height: 8),
        _buildStatusRow(
          'Refresh Token',
          refreshExpired ? 'Expired' : 'Valid',
          refreshExpired ? Colors.red : Colors.green,
          refreshTimeLeft != null ? _formatDuration(refreshTimeLeft) : null,
        ),
      ],
    );
  }

  Widget _buildStatusRow(
    String label,
    String status,
    Color statusColor,
    String? timeLeft,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: statusColor.withOpacity(0.3)),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (timeLeft != null) ...[
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              timeLeft,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTokenDetails(AuthViewModel AuthViewModel) {
    final tokens = AuthViewModel.tokens;
    if (tokens == null) return const SizedBox.shrink();

    return ExpansionTile(
      title: const Text(
        'Token Details',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      children: [
        _buildDetailRow('User ID', tokens.userIdFromToken ?? 'N/A'),
        _buildDetailRow(
          'Access Token Expires',
          _formatDateTime(tokens.accessTokenExpiration),
        ),
        _buildDetailRow(
          'Refresh Token Expires',
          _formatDateTime(tokens.refreshTokenExpiration),
        ),
        _buildDetailRow('Token Type', 'JWT (HS256)'),
        _buildDetailRow(
          'Issued At',
          _formatDateTime(_getIssuedAt(tokens.accessToken)),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(AuthViewModel AuthViewModel) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: AuthViewModel.isRefreshing
                ? null
                : () async {
                    final success = await AuthViewModel.refreshAccessToken();
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            success
                                ? 'Token refreshed successfully'
                                : 'Token refresh failed',
                          ),
                          backgroundColor: success ? Colors.green : Colors.red,
                        ),
                      );
                    }
                  },
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('Refresh Token'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final confirmed = await _showLogoutConfirmation(context);
              if (confirmed && mounted) {
                await AuthViewModel.logout(context);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged out successfully'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                }
              }
            },
            icon: const Icon(Icons.logout, size: 16),
            label: const Text('Logout'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    return DateFormat('MMM dd, yyyy HH:mm:ss').format(dateTime);
  }

  DateTime? _getIssuedAt(String? token) {
    if (token == null || token.isEmpty) return null;

    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final paddedPayload = payload + '=' * (4 - payload.length % 4);
      final decoded = utf8.decode(base64.decode(paddedPayload));
      final payloadMap = json.decode(decoded) as Map<String, dynamic>;

      final iat = payloadMap['iat'];
      if (iat == null) return null;

      return DateTime.fromMillisecondsSinceEpoch(iat * 1000);
    } catch (e) {
      return null;
    }
  }

  Future<bool> _showLogoutConfirmation(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text(
              'Are you sure you want to logout? This will end your current session.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Logout'),
              ),
            ],
          ),
        ) ??
        false;
  }
}

/// Compact session status widget for app bars or headers
class CompactSessionStatus extends StatelessWidget {
  const CompactSessionStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, AuthViewModel, child) {
        if (!AuthViewModel.isAuthenticated) {
          return const SizedBox.shrink();
        }

        final tokens = AuthViewModel.tokens;
        if (tokens == null) return const SizedBox.shrink();

        final accessExpired = tokens.isAccessTokenExpired;
        final timeLeft = tokens.timeUntilAccessTokenExpires;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: accessExpired
                ? Colors.red.withOpacity(0.1)
                : Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: accessExpired
                  ? Colors.red.withOpacity(0.3)
                  : Colors.green.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                accessExpired ? Icons.warning : Icons.check_circle,
                size: 12,
                color: accessExpired ? Colors.red : Colors.green,
              ),
              const SizedBox(width: 4),
              Text(
                accessExpired ? 'Session Expired' : 'Session Active',
                style: TextStyle(
                  fontSize: 10,
                  color: accessExpired ? Colors.red : Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (timeLeft != null && !accessExpired) ...[
                const SizedBox(width: 4),
                Text(
                  _formatCompactDuration(timeLeft),
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _formatCompactDuration(Duration duration) {
    if (duration.inMinutes > 0) {
      return '(${duration.inMinutes}m)';
    } else {
      return '(${duration.inSeconds}s)';
    }
  }
}
