import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/appointment_model.freezed.dart';
part '../gen/appointment_model.g.dart';

@freezed
abstract class AppointmentDetails with _$AppointmentDetails {
  const factory AppointmentDetails({
    String? id,
    @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
    dynamic tokenNumber,
    @JsonKey(name: "mo_id") String? moId,
    @JsonKey(name: "booking_number") String? bookingNumber,
    @JsonKey(name: "consultation_type") String? consultationType,
    @JsonKey(name: "appointment_date_time") String? appointmentDateTime,
    @JsonKey(name: "duration_minutes") int? durationMinutes,
    @JsonKey(name: "session_type") String? sessionType,
    String? status,
    @JsonKey(name: "fee_amount") double? feeAmount,
    @JsonKey(name: "fee_status") String? feeStatus,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "payment_method") String? paymentMethod,
    String? notes,
    @JsonKey(name: "cancellation_reason") String? cancellationReason,
    @JsonKey(name: "slot_details") SlotDetails? slotDetails,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    // Flat structure from API
    @JsonKey(name: "patient_name") String? patientName,
    @JsonKey(name: "doctor_name") String? doctorName,
    String? department,
    @JsonKey(name: "clinic_patient_id") String? clinicPatientId,
    @JsonKey(name: "clinic_id") String? clinicId,
    @JsonKey(name: "display_token") String? displayToken,
    @JsonKey(name: "booking_mode") String? bookingMode,
    @JsonKey(name: "queue_position") int? queuePosition,
    // Nested objects (for compatibility)
    PatientDetails? patient,
    DoctorDetails? doctor,
    ClinicDetails? clinic,
  }) = _AppointmentDetails;

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailsFromJson(json);
}

@freezed
abstract class PatientDetails with _$PatientDetails {
  const factory PatientDetails({
    String? name,
    String? phone,
    String? email,
    int? age,
    String? gender,
  }) = _PatientDetails;

  factory PatientDetails.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailsFromJson(json);
}

@freezed
abstract class DoctorDetails with _$DoctorDetails {
  const factory DoctorDetails({String? id, String? name}) = _DoctorDetails;

  factory DoctorDetails.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsFromJson(json);
}

@freezed
abstract class DepartmentDetails with _$DepartmentDetails {
  const factory DepartmentDetails({String? id, String? name}) =
      _DepartmentDetails;

  factory DepartmentDetails.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDetailsFromJson(json);
}

@freezed
abstract class ClinicDetails with _$ClinicDetails {
  const factory ClinicDetails({String? id, String? name}) = _ClinicDetails;

  factory ClinicDetails.fromJson(Map<String, dynamic> json) =>
      _$ClinicDetailsFromJson(json);
}

@freezed
abstract class SlotDetails with _$SlotDetails {
  const factory SlotDetails({
    @JsonKey(name: "slot_id") String? slotId,
    @JsonKey(name: "slot_status") String? slotStatus,
    @JsonKey(name: "slot_start_time") String? slotStartTime,
    @JsonKey(name: "slot_end_time") String? slotEndTime,
    @JsonKey(name: "slot_date") String? slotDate,
    @JsonKey(name: "slot_full_time") String? slotFullTime,
    @JsonKey(name: "session_name") String? sessionName,
  }) = _SlotDetails;

  factory SlotDetails.fromJson(Map<String, dynamic> json) =>
      _$SlotDetailsFromJson(json);
}

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    String? id,
    @JsonKey(name: "token_number") int? tokenNumber,
    @JsonKey(name: "mo_id") String? moId,
    @JsonKey(name: "patient_name") String? patientName,
    @JsonKey(name: "doctor_name") String? doctorName,
    String? department,
    @JsonKey(name: "consultation_type") String? consultationType,
    @JsonKey(name: "appointment_date_time") String? appointmentDateTime,
    String? status,
    @JsonKey(name: "fee_status") String? feeStatus,
    @JsonKey(name: "fee_amount") double? feeAmount,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "booking_number") String? bookingNumber,
    @JsonKey(name: "created_at") String? createdAt,

    // Legacy fields for backward compatibility
    String? appointmentId,
    String? patientId,
    String? doctorId,
    String? appointmentDate,
    String? appointmentTime,
    String? bookedOn,
    String? reasonForVisit,
    String? notes,
    double? fee,
    String? paymentMethod,
    Patient? patient,
    Doctor? doctor,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}

@freezed
abstract class AppointmentListResponse with _$AppointmentListResponse {
  const factory AppointmentListResponse({
    required List<Appointment> appointments,
    @JsonKey(name: "total_count") int? totalCount,
  }) = _AppointmentListResponse;

  factory AppointmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListResponseFromJson(json);
}

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? mobileId,
    String? dateOfBirth,
    String? gender,
    String? bloodGroup,
    String? address1,
    String? address2,
    String? district,
    String? state,
    String? height,
    String? weight,
    String? smokingStatus,
    String? alcoholUse,
    VitalSigns? vitalSigns,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@freezed
abstract class Doctor with _$Doctor {
  const factory Doctor({
    String? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phone,
    String? department,
    String? specialization,
    String? qualification,
    String? experience,
    String? consultationFee,
    bool? isAvailable,
    List<TimeSlot>? availableSlots,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    String? id,
    String? time,
    String? date,
    bool? isAvailable,
    bool? isBooked,
    String? doctorId,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}

@freezed
abstract class VitalSigns with _$VitalSigns {
  const factory VitalSigns({
    String? bloodPressure,
    String? temperature,
    String? pulse,
    String? respiratoryRate,
    String? oxygenSaturation,
  }) = _VitalSigns;

  factory VitalSigns.fromJson(Map<String, dynamic> json) =>
      _$VitalSignsFromJson(json);
}

@freezed
abstract class AppointmentSummaryCounts with _$AppointmentSummaryCounts {
  const factory AppointmentSummaryCounts({
    int? total,
    int? confirmed,
    int? arrived,
    int? completed,
    int? cancelled,
    @JsonKey(name: 'no_show') int? noShow,
    int? pending,
  }) = _AppointmentSummaryCounts;

  factory AppointmentSummaryCounts.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSummaryCountsFromJson(json);
}

@freezed
abstract class AppointmentSummary with _$AppointmentSummary {
  const factory AppointmentSummary({
    bool? success,
    @JsonKey(name: 'clinic_id') String? clinicId,
    String? date,
    @JsonKey(name: 'doctor_id') String? doctorId,
    String? status,
    @JsonKey(name: 'summary') AppointmentSummaryCounts? counts,
  }) = _AppointmentSummary;

  factory AppointmentSummary.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSummaryFromJson(json);
}

@freezed
abstract class SimpleAppointment with _$SimpleAppointment {
  const factory SimpleAppointment({
    required String id,
    @JsonKey(name: 'clinic_patient_id') required String clinicPatientId,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'booking_number') required String bookingNumber,
    @JsonKey(name: 'token_number') required int tokenNumber,
    @JsonKey(name: 'appointment_date') required String appointmentDate,
    @JsonKey(name: 'appointment_time') required String appointmentTime,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'consultation_type') required String consultationType,
    String? reason,
    required String status,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SimpleAppointment;

  factory SimpleAppointment.fromJson(Map<String, dynamic> json) =>
      _$SimpleAppointmentFromJson(json);
}

@freezed
abstract class SimpleAppointmentResponse with _$SimpleAppointmentResponse {
  const factory SimpleAppointmentResponse({
    required String message,
    required SimpleAppointment appointment,

    // ✅ NEW: Follow-up information
    FollowUpInfo? followUp,
    @JsonKey(name: 'clinic_patient_update')
    ClinicPatientUpdate? clinicPatientUpdate,

    // ✅ NEW: Appointment type flags
    @JsonKey(name: 'is_regular_appointment') bool? isRegularAppointment,
    @JsonKey(name: 'followup_granted') bool? followupGranted,
    @JsonKey(name: 'followup_message') String? followupMessage,
    @JsonKey(name: 'followup_valid_until') String? followupValidUntil,

    // ✅ NEW: Free follow-up flags
    @JsonKey(name: 'is_free_followup') bool? isFreeFollowup,
    @JsonKey(name: 'followup_type') String? followupType,
    @JsonKey(name: 'follow_up_info') FollowUpInfo? followUpInfo,

    // ✅ NEW: Renewal options
    RenewalOptions? renewalOptions,
  }) = _SimpleAppointmentResponse;

  factory SimpleAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$SimpleAppointmentResponseFromJson(json);
}

/// ✅ NEW: Follow-up information model
@freezed
abstract class FollowUpInfo with _$FollowUpInfo {
  const factory FollowUpInfo({
    String? id,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'patient_name') String? patientName,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    @JsonKey(name: 'source_appointment_id') String? sourceAppointmentId,
    @JsonKey(name: 'follow_up_status') String? followUpStatus,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'valid_from') String? validFrom,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'used_appointment_id') String? usedAppointmentId,
    @JsonKey(name: 'used_at') String? usedAt,
    @JsonKey(name: 'renewed_at') String? renewedAt,
    @JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,
    @JsonKey(name: 'appointment_slot_type') String? appointmentSlotType,
    @JsonKey(name: 'follow_up_type') String? followUpType,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _FollowUpInfo;

  factory FollowUpInfo.fromJson(Map<String, dynamic> json) =>
      _$FollowUpInfoFromJson(json);
}

/// ✅ NEW: Clinic patient update information
@freezed
abstract class ClinicPatientUpdate with _$ClinicPatientUpdate {
  const factory ClinicPatientUpdate({
    @JsonKey(name: 'current_followup_status') String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') String? lastFollowupId,
  }) = _ClinicPatientUpdate;

  factory ClinicPatientUpdate.fromJson(Map<String, dynamic> json) =>
      _$ClinicPatientUpdateFromJson(json);
}

/// ✅ NEW: Renewal options
@freezed
abstract class RenewalOptions with _$RenewalOptions {
  const factory RenewalOptions({
    @JsonKey(name: 'can_renew') bool? canRenew,
    String? message,
    @JsonKey(name: 'previous_followup_id') String? previousFollowupId,
  }) = _RenewalOptions;

  factory RenewalOptions.fromJson(Map<String, dynamic> json) =>
      _$RenewalOptionsFromJson(json);
}

@freezed
abstract class Department with _$Department {
  const factory Department({
    String? id,
    String? name,
    String? description,
    List<Doctor>? doctors,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@freezed
abstract class ConsultationType with _$ConsultationType {
  const factory ConsultationType({
    String? id,
    String? name,
    String? description,
    double? baseFee,
  }) = _ConsultationType;

  factory ConsultationType.fromJson(Map<String, dynamic> json) =>
      _$ConsultationTypeFromJson(json);
}

@freezed
abstract class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    String? id,
    String? name,
    String? type,
    bool? isActive,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
abstract class MedicalRecord with _$MedicalRecord {
  const factory MedicalRecord({
    String? id,
    String? patientId,
    String? appointmentId,
    String? recordType,
    String? fileName,
    String? fileUrl,
    String? uploadDate,
    String? description,
  }) = _MedicalRecord;

  factory MedicalRecord.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordFromJson(json);
}

@freezed
abstract class Prescription with _$Prescription {
  const factory Prescription({
    String? id,
    String? patientId,
    String? appointmentId,
    String? medication,
    String? dosage,
    String? frequency,
    String? duration,
    String? instructions,
    String? prescribedDate,
  }) = _Prescription;

  factory Prescription.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionFromJson(json);
}

// ✅ Helper function to handle token_number as both int and string
dynamic _tokenNumberFromJson(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) {
    return int.tryParse(value) ??
        value; // Try to parse, return original if fails
  }
  return value;
}
