import 'package:flutter/foundation.dart';
import 'package:a/models/appointment_model.dart';
import 'package:a/repositories/appointment_repository.dart';
import 'package:a/viewModels/authVM.dart';

class PaymentConfirmationViewModel extends ChangeNotifier {
  final AppointmentRepository _repository;
  final AuthViewModel _authViewModel;

  PaymentConfirmationViewModel(this._authViewModel)
    : _repository = AppointmentRepository();

  // State variables
  bool _isLoading = false;
  bool _isProcessing = false;
  bool _disposed = false;
  String _error = '';

  // Form data
  String _selectedPaymentMethod = 'UPI';
  double _amount = 900.0;

  // Data
  Appointment? _appointment;
  Patient? _patient;
  Doctor? _doctor;

  // Getters
  bool get isLoading => _isLoading;
  bool get isProcessing => _isProcessing;
  String get error => _error;
  String get selectedPaymentMethod => _selectedPaymentMethod;
  double get amount => _amount;
  Appointment? get appointment => _appointment;
  Patient? get patient => _patient;
  Doctor? get doctor => _doctor;

  // Initialize with appointment data
  void initialize(Appointment appointment, {Patient? patient, Doctor? doctor}) {
    _appointment = appointment;
    _patient = patient;
    _doctor = doctor;

    // Set amount from appointment fee
    if (appointment.fee != null) {
      _amount = appointment.fee!;
    }

    _safeNotifyListeners();
  }

  // Process payment
  Future<Map<String, dynamic>?> processPayment() async {
    if (_appointment?.id == null) {
      _setError('No appointment selected');
      return null;
    }

    try {
      _setProcessing(true);
      _clearError();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _setError('Authentication required');
        return null;
      }

      final result = await _repository.processPayment(
        appointmentId: _appointment!.id!,
        paymentMethod: _selectedPaymentMethod,
        amount: _amount,
        token: token,
      );

      if (result != null) {
        // Update appointment payment status
        _appointment = _appointment!.copyWith(feeStatus: 'Paid');
        _safeNotifyListeners();
        return result;
      } else {
        _setError('Failed to process payment');
        return null;
      }
    } catch (e) {
      _setError('Error processing payment: $e');
      return null;
    } finally {
      _setProcessing(false);
    }
  }

  // Set payment method
  void setPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    _safeNotifyListeners();
  }

  // Set amount
  void setAmount(double amount) {
    _amount = amount;
    _safeNotifyListeners();
  }

  // Calculate total with taxes and discounts
  double calculateTotal() {
    double total = _amount;

    // Add other charges (if any)
    // total += otherCharges;

    // Add tax (if any)
    // total += tax;

    // Apply discount (if any)
    // total -= discount;

    return total;
  }

  // Get available payment methods
  List<String> getAvailablePaymentMethods() {
    return ['UPI', 'Credit Card', 'Debit Card', 'Net Banking', 'Wallet'];
  }

  // Validate payment form
  bool validateForm() {
    if (_selectedPaymentMethod.isEmpty) {
      _setError('Please select a payment method');
      return false;
    }

    if (_amount <= 0) {
      _setError('Invalid amount');
      return false;
    }

    return true;
  }

  // Reset form
  void resetForm() {
    _selectedPaymentMethod = 'UPI';
    _amount = 900.0;
    _error = '';
    _safeNotifyListeners();
  }

  // Private helper methods
  void _setProcessing(bool processing) {
    if (_disposed) return;
    _isProcessing = processing;
    _safeNotifyListeners();
  }

  void _setError(String error) {
    if (_disposed) return;
    _error = error;
    _safeNotifyListeners();
  }

  void _clearError() {
    _error = '';
  }

  /// Safely notify listeners, checking if disposed
  void _safeNotifyListeners() {
    if (!_disposed) {
      _safeNotifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
