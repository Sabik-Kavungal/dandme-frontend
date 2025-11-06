import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/doctor_session_slot_model.freezed.dart';
part '../gen/doctor_session_slot_model.g.dart';

// ============================================================================
// SESSION-BASED SLOT MODELS (3-Tier Architecture)
// ============================================================================

/// Individual slot (Level 3)
@freezed
class IndividualSlot with _$IndividualSlot {
  const factory IndividualSlot({
    required String id,
    @JsonKey(name: 'session_id') String? sessionId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_start') String? slotStart,
    @JsonKey(name: 'slot_end') String? slotEnd,
    @JsonKey(name: 'max_patients') @Default(1) int maxPatients,
    @JsonKey(name: 'available_count') @Default(1) int availableCount,
    @JsonKey(name: 'booked_count') @Default(0) int bookedCount,
    @JsonKey(name: 'is_booked') @Default(false) bool isBooked,
    @JsonKey(name: 'is_bookable') @Default(true) bool isBookable,
    @JsonKey(name: 'booked_patient_id') String? bookedPatientId,
    @JsonKey(name: 'booked_appointment_id') String? bookedAppointmentId,
    @Default('available') String status,
    @JsonKey(name: 'display_message')
    @Default('Available')
    String displayMessage,
    String? notes,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _IndividualSlot;

  factory IndividualSlot.fromJson(Map<String, dynamic> json) =>
      _$IndividualSlotFromJson(json);
}

/// Session definition for creating (input)
@freezed
class SessionDefinition with _$SessionDefinition {
  const factory SessionDefinition({
    @JsonKey(name: 'session_name') required String sessionName,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'max_patients') required int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') @Default(5) int slotIntervalMinutes,
    String? notes,
  }) = _SessionDefinition;

  factory SessionDefinition.fromJson(Map<String, dynamic> json) =>
      _$SessionDefinitionFromJson(json);
}

/// Session with slots (Level 2)
@freezed
class DoctorSlotSession with _$DoctorSlotSession {
  const factory DoctorSlotSession({
    required String id,
    @JsonKey(name: 'time_slot_id') String? timeSlotId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'session_name') String? sessionName,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'max_patients') @Default(0) int maxPatients,
    @JsonKey(name: 'slot_interval_minutes') @Default(5) int slotIntervalMinutes,
    @JsonKey(name: 'generated_slots') @Default(0) int generatedSlots,
    @JsonKey(name: 'available_slots') @Default(0) int availableSlots,
    @JsonKey(name: 'booked_slots') @Default(0) int bookedSlots,
    String? notes,
    @Default([]) List<IndividualSlot> slots,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DoctorSlotSession;

  factory DoctorSlotSession.fromJson(Map<String, dynamic> json) =>
      _$DoctorSlotSessionFromJson(json);
}

/// Doctor time slot with sessions (Level 1)
@freezed
class DoctorSessionSlot with _$DoctorSessionSlot {
  const factory DoctorSessionSlot({
    required String id,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'slot_type') String? slotType,
    @JsonKey(name: 'slot_duration') @Default(5) int slotDuration,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    String? notes,
    @Default([]) List<DoctorSlotSession> sessions,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DoctorSessionSlot;

  factory DoctorSessionSlot.fromJson(Map<String, dynamic> json) =>
      _$DoctorSessionSlotFromJson(json);
}

/// Create session slots input
@freezed
class CreateSessionSlotsInput with _$CreateSessionSlotsInput {
  const factory CreateSessionSlotsInput({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'slot_duration') @Default(5) int slotDuration,
    required String date,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    String? notes,
    required List<SessionDefinition> sessions,
  }) = _CreateSessionSlotsInput;

  factory CreateSessionSlotsInput.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionSlotsInputFromJson(json);
}

/// Create session slots response
@freezed
class CreateSessionSlotsResponse with _$CreateSessionSlotsResponse {
  const factory CreateSessionSlotsResponse({
    required bool success,
    required String message,
    required DoctorSessionSlot data,
  }) = _CreateSessionSlotsResponse;

  factory CreateSessionSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionSlotsResponseFromJson(json);
}

/// List session slots response
@freezed
class ListSessionSlotsResponse with _$ListSessionSlotsResponse {
  const factory ListSessionSlotsResponse({
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'slot_type') String? slotType,
    @Default(0) int total,
    @Default([]) List<DoctorSessionSlot> slots,
  }) = _ListSessionSlotsResponse;

  factory ListSessionSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSessionSlotsResponseFromJson(json);
}
