import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/appointment_model.freezed.dart';
part '../gen/appointment_model.g.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    String? id,
    String? appointmentId,
    String? patientId,
    String? doctorId,
    String? department,
    String? consultationType,
    String? status,
    String? feeStatus,
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
class Patient with _$Patient {
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
class Doctor with _$Doctor {
  const factory Doctor({
    String? id,
    String? firstName,
    String? lastName,
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
class TimeSlot with _$TimeSlot {
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
class VitalSigns with _$VitalSigns {
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
class AppointmentSummary with _$AppointmentSummary {
  const factory AppointmentSummary({
    int? todayAppointments,
    int? upcomingAppointments,
    int? completedAppointments,
    int? cancelledAppointments,
  }) = _AppointmentSummary;

  factory AppointmentSummary.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSummaryFromJson(json);
}

@freezed
class Department with _$Department {
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
class ConsultationType with _$ConsultationType {
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
class PaymentMethod with _$PaymentMethod {
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
class MedicalRecord with _$MedicalRecord {
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
class Prescription with _$Prescription {
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
