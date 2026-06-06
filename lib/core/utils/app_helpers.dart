// ============================================================================
// SHARED APPLICATION HELPERS
// ============================================================================
// This file contains helper functions that can be shared across all modules.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_constants.dart';
import '../widgets/app_loader.dart';
import 'loading_manager.dart';

class AppHelpers {
  /// Ensures that an image path is a full URL.
  /// If it starts with 'http', it's returned as is.
  /// Otherwise, it prepends the server's base URL.
  static String ensureImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http')) return path;

    // Remove leading slash if present
    final cleanPath = path.startsWith('/') ? path.substring(1) : path;
    return '${AppConstants.serverUrl}/$cleanPath';
  }

  // Responsive Design Helpers
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;
  }

  // Text Formatting Helpers
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatTime(String time) {
    return time; // Already formatted as "HH:MM AM/PM"
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(symbol: '₹', decimalDigits: 2).format(amount);
  }

  // Name Helpers
  static String getInitials(String? firstName, String? lastName) {
    String first = firstName?.isNotEmpty == true
        ? firstName![0].toUpperCase()
        : 'U';
    String last = lastName?.isNotEmpty == true
        ? lastName![0].toUpperCase()
        : 'N';
    return '$first$last';
  }

  static String getFullName(String? firstName, String? lastName) {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    } else if (firstName != null) {
      return firstName;
    } else if (lastName != null) {
      return lastName;
    } else {
      return 'Unknown';
    }
  }

  // Color Helpers
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
      case 'upcoming':
        return AppConstants.upcomingColor;
      case 'confirmed':
      case 'in progress':
        return AppConstants.infoColor;
      case 'completed':
        return AppConstants.completedColor;
      case 'cancelled':
      case 'no show':
        return AppConstants.dangerColor;
      default:
        return AppConstants.secondaryColor;
    }
  }

  static Color getPaymentStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return AppConstants.completedColor;
      case 'pending':
        return AppConstants.warningColor;
      case 'failed':
        return AppConstants.dangerColor;
      default:
        return AppConstants.secondaryColor;
    }
  }

  // Date and Time Helpers
  static DateTime parseAppointmentDate(String dateString) {
    try {
      return DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static String getTimeSlotLabel(String timeSlot) {
    final hour = int.tryParse(timeSlot.split(':')[0]);
    if (hour == null) return timeSlot;

    if (hour < 12) {
      return 'Morning Slot';
    } else if (hour < 17) {
      return 'Afternoon Slot';
    } else {
      return 'Evening Slot';
    }
  }

  static bool isTimeSlotAvailable(String timeSlot, List<String> bookedSlots) {
    return !bookedSlots.contains(timeSlot);
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  static String getRelativeDateString(DateTime date) {
    if (isToday(date)) return 'Today';
    if (isTomorrow(date)) return 'Tomorrow';
    return formatDate(date);
  }

  // Validation Helpers
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phone);
  }

  static bool isValidPatientId(String id) {
    return RegExp(r'^[A-Z0-9]+$').hasMatch(id);
  }

  // Form Validation Helpers
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (!isValidPhone(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // UI Helpers
  static Widget buildStatusChip(String status, {bool isSmall = false}) {
    final color = getStatusColor(status);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6 : 8,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          isSmall ? AppConstants.radiusS : AppConstants.radiusM,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isSmall ? 4 : 6,
            height: isSmall ? 4 : 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: isSmall ? 2 : 4),
          Text(
            status,
            style: TextStyle(
              color: color,
              fontSize: isSmall ? 10 : 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildPaymentChip(String status, {bool isSmall = false}) {
    final color = getPaymentStatusColor(status);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6 : 8,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          isSmall ? AppConstants.radiusS : AppConstants.radiusM,
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: isSmall ? 10 : 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Search and Filter Helpers
  static List<T> filterList<T>(
    List<T> items,
    String query,
    String Function(T) getSearchableText,
  ) {
    if (query.isEmpty) return items;

    final lowerQuery = query.toLowerCase();
    return items.where((item) {
      final searchableText = getSearchableText(item).toLowerCase();
      return searchableText.contains(lowerQuery);
    }).toList();
  }

  // Error Handling Helpers
  static String getErrorMessage(dynamic error) {
    if (error is String) return error;
    if (error.toString().contains('SocketException')) {
      return 'Network connection error. Please check your internet connection.';
    }
    if (error.toString().contains('TimeoutException')) {
      return 'Request timeout. Please try again.';
    }
    return 'An unexpected error occurred. Please try again.';
  }

  // Loading State Helpers
  static Widget buildLoadingIndicator({double size = 20.0, Color? color}) {
    return AppLoader(
      size: size,
      strokeWidth: 2,
      color: color ?? AppConstants.primaryColor,
    );
  }

  static void showLoading({String? message}) {
    LoadingManager.show(message: message);
  }

  static void hideLoading() {
    LoadingManager.hide();
  }

  static Widget buildErrorWidget(String error, VoidCallback onRetry) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: AppConstants.dangerColor),
          const SizedBox(height: AppConstants.spacingL),
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppConstants.darkColor,
            ),
          ),
          const SizedBox(height: AppConstants.spacingS),
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: AppConstants.secondaryColor),
          ),
          const SizedBox(height: AppConstants.spacingL),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
