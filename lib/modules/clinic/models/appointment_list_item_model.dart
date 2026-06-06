import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/appointment_list_item_model.freezed.dart';
part '../gen/appointment_list_item_model.g.dart';

// ✅ Helper function to handle token_number as both int and string, converting to string
String? _tokenNumberToString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

/// Simple appointment list item model optimized for table display
/// Used with the /api/appointments/simple-list endpoint
@freezed
abstract class AppointmentListItem with _$AppointmentListItem {
  const factory AppointmentListItem({
    required String id,
    @JsonKey(name: 'token_number', fromJson: _tokenNumberToString)
    String? tokenNumber,
    @JsonKey(name: 'token_numeric') int? tokenNumeric,
    @JsonKey(name: 'display_token') String? displayToken,
    @JsonKey(name: 'doctor_prefix') String? doctorPrefix,
    @JsonKey(name: 'queue_position') int? queuePosition,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'patient_number') String? patientNumber,
    @JsonKey(name: 'patient_name') required String patientName,
    @JsonKey(name: 'doctor_name') required String doctorName,
    String? department,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'patient_id') String? patientId, // Legacy fallback
    @JsonKey(name: 'consultation_type') required String consultationType,
    @JsonKey(name: 'appointment_date_time') required String appointmentDateTime,
    required String status,
    @JsonKey(name: 'fee_status') required String feeStatus,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') required String paymentStatus,
    @JsonKey(name: 'booking_number') required String bookingNumber,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'doctor_image') String? doctorImage,
    @JsonKey(name: 'booking_mode') String? bookingMode,
    @JsonKey(name: 'payment_mode') String? paymentMode,
  }) = _AppointmentListItem;

  factory AppointmentListItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListItemFromJson(json);
}

/// Response model for simple appointment list API
@freezed
abstract class SimpleAppointmentListResponse with _$SimpleAppointmentListResponse {
  const factory SimpleAppointmentListResponse({
    required bool success,
    @JsonKey(name: 'clinic_id') required String clinicId,
    String? date,
    required int total,
    required List<AppointmentListItem> appointments,
  }) = _SimpleAppointmentListResponse;

  factory SimpleAppointmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$SimpleAppointmentListResponseFromJson(json);
}

// Extension for display helpers
extension AppointmentListItemExtension on AppointmentListItem {
  /// Get formatted date from appointment_date_time (extracts date part)
  String get appointmentDate {
    try {
      if (appointmentDateTime.contains(' ')) {
        return appointmentDateTime.split(' ')[0]; // Returns YYYY-MM-DD part
      }
      return appointmentDateTime;
    } catch (e) {
      return appointmentDateTime;
    }
  }

  /// Get formatted time from appointment_date_time (extracts time part)
  String get appointmentTime {
    try {
      if (appointmentDateTime.contains(' ')) {
        return appointmentDateTime.split(' ')[1]; // Returns HH:MM:SS part
      }
      return appointmentDateTime;
    } catch (e) {
      return appointmentDateTime;
    }
  }

  /// Get status color based on appointment status
  String get statusColor {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return 'green';
      case 'completed':
        return 'blue';
      case 'cancelled':
        return 'red';
      case 'no_show':
        return 'orange';
      default:
        return 'grey';
    }
  }

  /// Get payment status color
  String get paymentStatusColor {
    switch (paymentStatus.toLowerCase()) {
      case 'paid':
        return 'green';
      case 'pending':
        return 'orange';
      case 'waived':
        return 'blue';
      default:
        return 'grey';
    }
  }

  /// Check if consultation is online
  bool get isOnline => consultationType.toLowerCase() == 'online';

  /// Check if consultation is offline
  bool get isOffline => consultationType.toLowerCase() == 'offline';

  /// Check if appointment is walk-in
  bool get isWalkIn => bookingMode == 'walk_in';
}
