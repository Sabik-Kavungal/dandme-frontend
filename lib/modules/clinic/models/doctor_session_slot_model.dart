import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/doctor_session_slot_model.freezed.dart';
part '../gen/doctor_session_slot_model.g.dart';

// ============================================================================
// SESSION-BASED SLOT MODELS (3-Tier Architecture)
// ============================================================================

/// Individual slot (Level 3)
@freezed
abstract class IndividualSlot with _$IndividualSlot {
  const factory IndividualSlot({
    required String id,
    @JsonKey(name: 'session_id') String? sessionId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_start') String? slotStart,
    @JsonKey(name: 'slot_end') String? slotEnd,
    @JsonKey(name: 'start_datetime') String? startDatetime,
    @JsonKey(name: 'end_datetime') String? endDatetime,
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
abstract class SessionDefinition with _$SessionDefinition {
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
abstract class DoctorSlotSession with _$DoctorSlotSession {
  const factory DoctorSlotSession({
    required String id,
    @JsonKey(name: 'time_slot_id') String? timeSlotId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'session_name') String? sessionName,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'start_datetime') String? startDatetime,
    @JsonKey(name: 'end_datetime') String? endDatetime,
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
abstract class DoctorSessionSlot with _$DoctorSessionSlot {
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
/// Supports both recurring weekly slots (weekdays) and single date slots (date)
/// Either weekdays OR date must be provided, but not both
@freezed
abstract class CreateSessionSlotsInput with _$CreateSessionSlotsInput {
  const factory CreateSessionSlotsInput({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'slot_duration') @Default(5) int slotDuration,
    String? date, // For single date slots
    @Default([])
    List<int>
    weekdays, // For recurring slots: [0-6] where 0=Sunday, 1=Monday, ..., 6=Saturday
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    String? notes,
    required List<SessionDefinition> sessions,
  }) = _CreateSessionSlotsInput;

  factory CreateSessionSlotsInput.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionSlotsInputFromJson(json);
}

/// Create session slots response
/// For recurring slots, data is a list of slots (one per weekday)
/// For single date slots, data is a single slot
@freezed
abstract class CreateSessionSlotsResponse with _$CreateSessionSlotsResponse {
  const factory CreateSessionSlotsResponse({
    required bool success,
    required String message,
    DoctorSessionSlot? data, // Single slot (for single date mode)
    @Default([])
    List<DoctorSessionSlot> dataList, // Multiple slots (for recurring mode)
    @JsonKey(name: 'total_created')
    @Default(0)
    int totalCreated, // Number of slots created
  }) = _CreateSessionSlotsResponse;

  factory CreateSessionSlotsResponse.fromJson(Map<String, dynamic> json) {
    // Handle both single slot and multiple slots response formats
    if (json['data'] != null) {
      if (json['data'] is List) {
        // Recurring slots response - multiple slots
        return CreateSessionSlotsResponse(
          success: json['success'] as bool? ?? false,
          message: json['message'] as String? ?? '',
          dataList: (json['data'] as List)
              .map((e) => DoctorSessionSlot.fromJson(e as Map<String, dynamic>))
              .toList(),
          totalCreated: json['total_created'] as int? ?? 0,
        );
      } else {
        // Single date slot response
        return CreateSessionSlotsResponse(
          success: json['success'] as bool? ?? false,
          message: json['message'] as String? ?? '',
          data: DoctorSessionSlot.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
          totalCreated: 1,
        );
      }
    }
    // Fallback
    return CreateSessionSlotsResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      totalCreated: json['total_created'] as int? ?? 0,
    );
  }
}

/// List session slots response
@freezed
abstract class ListSessionSlotsResponse with _$ListSessionSlotsResponse {
  const factory ListSessionSlotsResponse({
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'slot_type') String? slotType,
    @Default(0) int total,
    @Default([]) List<DoctorSessionSlot> slots,
    @JsonKey(name: 'walkin_available') @Default(false) bool walkinAvailable,
    @JsonKey(name: 'walkin_reason') String? walkinReason,
  }) = _ListSessionSlotsResponse;

  factory ListSessionSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSessionSlotsResponseFromJson(json);
}
