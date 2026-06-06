import 'package:flutter/foundation.dart';

/// A global manager to handle loading states across the application.
/// Allows showing/hiding a beautiful health-themed loader from anywhere.
class LoadingManager {
  static final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  static final ValueNotifier<String?> _message = ValueNotifier<String?>(null);

  static ValueNotifier<bool> get isLoading => _isLoading;
  static ValueNotifier<String?> get message => _message;

  /// Show the global loading overlay
  /// [message] Optional message to display under the loader
  static void show({String? message}) {
    _message.value = message;
    _isLoading.value = true;
  }

  /// Hide the global loading overlay
  static void hide() {
    _isLoading.value = false;
    _message.value = null;
  }

  /// Execute an asynchronous task with automatic loading state management
  static Future<T> wrap<T>(Future<T> Function() task, {String? message}) async {
    try {
      show(message: message);
      return await task();
    } finally {
      hide();
    }
  }
}
