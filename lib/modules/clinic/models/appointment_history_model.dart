import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/appointment_history_model.freezed.dart';
part '../gen/appointment_history_model.g.dart';

/// Appointment history item model
@freezed
abstract class AppointmentHistoryItem with _$AppointmentHistoryItem {
  const factory AppointmentHistoryItem({
    required String id,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'appointment_date') required String appointmentDate,
    @JsonKey(name: 'appointment_time') required String appointmentTime,
    @JsonKey(name: 'consultation_type') required String consultationType,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'doctor_prefix') String? doctorPrefix,
    String? reason,
    String? notes,
    required String status,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') required String paymentStatus,
    @JsonKey(name: 'booking_number') required String bookingNumber,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _AppointmentHistoryItem;

  factory AppointmentHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHistoryItemFromJson(json);
}

/// Appointment history response model
@freezed
abstract class AppointmentHistoryResponse with _$AppointmentHistoryResponse {
  const factory AppointmentHistoryResponse({
    required bool success,
    @JsonKey(name: 'clinic_patient_id') required String clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    required int total,
    required List<AppointmentHistoryItem> appointments,
  }) = _AppointmentHistoryResponse;

  factory AppointmentHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHistoryResponseFromJson(json);
}

