import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/doctor_time_slot_model.freezed.dart';
part '../gen/doctor_time_slot_model.g.dart';

// ============================================================================
// SLOT MODELS
// ============================================================================

@freezed
class DoctorTimeSlotResponse with _$DoctorTimeSlotResponse {
  const factory DoctorTimeSlotResponse({
    required String id,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'date') required String date, // YYYY-MM-DD format - NEW
    @JsonKey(name: 'day_of_week')
    int? dayOfWeek, // Optional for backward compatibility
    @JsonKey(name: 'day_name')
    String? dayName, // Optional for backward compatibility
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'max_patients') required int maxPatients,
    @JsonKey(name: 'booked_patients') @Default(0) int bookedPatients,
    @JsonKey(name: 'available_spots') @Default(0) int availableSpots,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    @JsonKey(name: 'is_bookable')
    @Default(true)
    bool isBookable, // NEW: for past slots
    @Default('available') String status,
    @JsonKey(name: 'display_message')
    @Default('Available')
    String displayMessage, // NEW: for past slots message
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DoctorTimeSlotResponse;

  factory DoctorTimeSlotResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorTimeSlotResponseFromJson(json);
}

@freezed
class TimeSlotDefinition with _$TimeSlotDefinition {
  const factory TimeSlotDefinition({
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'max_patients') @Default(1) int maxPatients,
    String? notes,
  }) = _TimeSlotDefinition;

  factory TimeSlotDefinition.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotDefinitionFromJson(json);
}

@freezed
class CreateDoctorTimeSlotInput with _$CreateDoctorTimeSlotInput {
  const factory CreateDoctorTimeSlotInput({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'date') required String date, // YYYY-MM-DD format - NEW
    required List<TimeSlotDefinition> slots,
  }) = _CreateDoctorTimeSlotInput;

  factory CreateDoctorTimeSlotInput.fromJson(Map<String, dynamic> json) =>
      _$CreateDoctorTimeSlotInputFromJson(json);
}

@freezed
class BulkCreateDoctorTimeSlotsResponse
    with _$BulkCreateDoctorTimeSlotsResponse {
  const factory BulkCreateDoctorTimeSlotsResponse({
    required String message,
    @JsonKey(name: 'created_slots')
    @Default([])
    List<DoctorTimeSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots') @Default([]) List<dynamic> failedSlots,
    @JsonKey(name: 'total_created') required int totalCreated,
    @JsonKey(name: 'total_failed') required int totalFailed,
  }) = _BulkCreateDoctorTimeSlotsResponse;

  factory BulkCreateDoctorTimeSlotsResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$BulkCreateDoctorTimeSlotsResponseFromJson(json);
}

@freezed
class AvailableSlot with _$AvailableSlot {
  const factory AvailableSlot({
    required String id,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'clinic_name') String? clinicName,
    @JsonKey(name: 'day_of_week') required int dayOfWeek,
    @JsonKey(name: 'day_name') required String dayName,
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'max_patients') required int maxPatients,
    String? notes,
  }) = _AvailableSlot;

  factory AvailableSlot.fromJson(Map<String, dynamic> json) =>
      _$AvailableSlotFromJson(json);
}

@freezed
class DoctorTimeSlotsResponse with _$DoctorTimeSlotsResponse {
  const factory DoctorTimeSlotsResponse({
    @JsonKey(name: 'available_slots')
    required List<AvailableSlot> availableSlots,
  }) = _DoctorTimeSlotsResponse;

  factory DoctorTimeSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorTimeSlotsResponseFromJson(json);
}

// Grouped time slots response
@freezed
class DaySlotGroup with _$DaySlotGroup {
  const factory DaySlotGroup({
    @JsonKey(name: 'day_name') required String dayName,
    @JsonKey(name: 'day_of_week') required int dayOfWeek,
    @Default([]) List<DoctorTimeSlotResponse> slots,
    @JsonKey(name: 'has_slots') @Default(false) bool hasSlots,
    @JsonKey(name: 'total_slots') @Default(0) int totalSlots,
    @JsonKey(name: 'available_slots') @Default(0) int availableSlots,
    @JsonKey(name: 'is_available') @Default(false) bool isAvailable,
    @Default('unavailable') String status,
  }) = _DaySlotGroup;

  factory DaySlotGroup.fromJson(Map<String, dynamic> json) =>
      _$DaySlotGroupFromJson(json);
}

@freezed
class GroupedTimeSlotsResponse with _$GroupedTimeSlotsResponse {
  const factory GroupedTimeSlotsResponse({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
    @Default([]) List<DaySlotGroup> days,
  }) = _GroupedTimeSlotsResponse;

  factory GroupedTimeSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupedTimeSlotsResponseFromJson(json);
}

// List time slots response (flat structure)
@freezed
class ListTimeSlotsResponse with _$ListTimeSlotsResponse {
  const factory ListTimeSlotsResponse({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
    @Default([]) List<DoctorTimeSlotResponse> slots,
    @Default(0) int total,
  }) = _ListTimeSlotsResponse;

  factory ListTimeSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTimeSlotsResponseFromJson(json);
}

// New API models matching Go backend exactly
@freezed
class CreateDateSpecificSlotsInput with _$CreateDateSpecificSlotsInput {
  const factory CreateDateSpecificSlotsInput({
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'slot_type') required String slotType,
    String? date, // Optional: for specific date slots (YYYY-MM-DD)
    @JsonKey(name: 'day_of_week')
    int?
    dayOfWeek, // Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
    required List<SimpleTimeSlot> slots,
  }) = _CreateDateSpecificSlotsInput;

  factory CreateDateSpecificSlotsInput.fromJson(Map<String, dynamic> json) =>
      _$CreateDateSpecificSlotsInputFromJson(json);
}

@freezed
class SimpleTimeSlot with _$SimpleTimeSlot {
  const factory SimpleTimeSlot({
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'max_patients') int? maxPatients,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    String? notes,
  }) = _SimpleTimeSlot;

  factory SimpleTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$SimpleTimeSlotFromJson(json);
}

@freezed
class DateSpecificSlotResponse with _$DateSpecificSlotResponse {
  const factory DateSpecificSlotResponse({
    required String id,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    required String date,
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'max_patients') required int maxPatients,
    @JsonKey(name: 'booked_patients') int? bookedPatients,
    @JsonKey(name: 'available_spots') int? availableSpots,
    @JsonKey(name: 'is_available') bool? isAvailable,
    String? status,
    String? notes,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _DateSpecificSlotResponse;

  factory DateSpecificSlotResponse.fromJson(Map<String, dynamic> json) =>
      _$DateSpecificSlotResponseFromJson(json);
}

@freezed
class CreateSlotsResponse with _$CreateSlotsResponse {
  const factory CreateSlotsResponse({
    required String message,
    @JsonKey(name: 'created_slots')
    @Default([])
    List<DateSpecificSlotResponse> createdSlots,
    @JsonKey(name: 'failed_slots')
    @Default([])
    List<Map<String, dynamic>> failedSlots,
    @JsonKey(name: 'total_created') required int totalCreated,
    @JsonKey(name: 'total_failed') required int totalFailed,
  }) = _CreateSlotsResponse;

  factory CreateSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSlotsResponseFromJson(json);
}

@freezed
class ListSlotsResponse with _$ListSlotsResponse {
  const factory ListSlotsResponse({
    @Default([]) List<DateSpecificSlotResponse> slots,
    @Default(0) int total,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'slot_type') String? slotType,
    String? date,
  }) = _ListSlotsResponse;

  factory ListSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSlotsResponseFromJson(json);
}
