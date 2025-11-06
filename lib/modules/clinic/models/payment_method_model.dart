import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/payment_method_model.freezed.dart';
part '../gen/payment_method_model.g.dart';

/// Payment Method Enum
enum PaymentMethod {
  @JsonValue('pay_now')
  payNow,
  @JsonValue('pay_later')
  payLater,
  @JsonValue('way_off')
  wayOff,
}

/// Payment Type Enum (required only for payNow)
enum PaymentType {
  @JsonValue('cash')
  cash,
  @JsonValue('card')
  card,
  @JsonValue('upi')
  upi,
}

/// Payment Type Extension
extension PaymentTypeExtension on PaymentType {
  /// Get display name for payment type
  String get typeDisplayName {
    switch (this) {
      case PaymentType.cash:
        return 'Cash';
      case PaymentType.card:
        return 'Card';
      case PaymentType.upi:
        return 'UPI';
    }
  }

  /// Get icon for payment type
  String get typeIcon {
    switch (this) {
      case PaymentType.cash:
        return '💵';
      case PaymentType.card:
        return '💳';
      case PaymentType.upi:
        return '📱';
    }
  }
}

/// Payment Method Extension
extension PaymentMethodExtension on PaymentMethod {
  /// Get display name for payment method
  String get displayName {
    switch (this) {
      case PaymentMethod.payNow:
        return 'Pay Now';
      case PaymentMethod.payLater:
        return 'Pay Later';
      case PaymentMethod.wayOff:
        return 'Way Off (Free)';
    }
  }

  /// Get icon for payment method
  String get methodIcon {
    switch (this) {
      case PaymentMethod.payNow:
        return '💳';
      case PaymentMethod.payLater:
        return '⏰';
      case PaymentMethod.wayOff:
        return '🆓';
    }
  }
}

/// Payment Configuration Model
@freezed
class AppointmentPayment with _$AppointmentPayment {
  const factory AppointmentPayment({
    required PaymentMethod method,
    PaymentType? type, // Required only for payNow
  }) = _AppointmentPayment;

  factory AppointmentPayment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPaymentFromJson(json);

  const AppointmentPayment._();

  /// Validation: payment_type is required only for pay_now
  bool get isValid {
    if (method == PaymentMethod.payNow) {
      return type != null;
    }
    return true;
  }

  /// Get validation error message
  String? get validationError {
    if (method == PaymentMethod.payNow && type == null) {
      return 'Payment type is required for Pay Now';
    }
    return null;
  }

  /// Convert to API request format
  Map<String, dynamic> toApiJson() {
    final json = {
      'payment_method': method.name.toLowerCase().replaceAll('_', '_'),
    };

    if (type != null) {
      json['payment_type'] = type!.name;
    }

    return json;
  }

  /// Get payment status based on method
  String get paymentStatus {
    switch (method) {
      case PaymentMethod.payNow:
        return 'paid';
      case PaymentMethod.payLater:
        return 'pending';
      case PaymentMethod.wayOff:
        return 'waived';
    }
  }

  /// Get payment mode based on type
  String? get paymentMode {
    if (method == PaymentMethod.payNow && type != null) {
      return type!.name;
    }
    return null;
  }

  /// Get display name (uses extension methods)
  String get methodDisplayName => method.displayName;

  /// Get display name for payment type (uses extension methods)
  String? get typeDisplayName => type?.typeDisplayName;
}

/// Payment Method Options for UI
class PaymentMethodOptions {
  static const List<PaymentMethod> allMethods = [
    PaymentMethod.payNow,
    PaymentMethod.payLater,
    PaymentMethod.wayOff,
  ];

  static const List<PaymentType> allTypes = [
    PaymentType.cash,
    PaymentType.card,
    PaymentType.upi,
  ];

  /// Get payment types available for a given method
  static List<PaymentType> getTypesForMethod(PaymentMethod method) {
    if (method == PaymentMethod.payNow) {
      return allTypes;
    }
    return [];
  }
}
