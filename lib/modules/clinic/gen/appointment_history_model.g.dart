// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentHistoryItem _$AppointmentHistoryItemFromJson(
  Map<String, dynamic> json,
) => _AppointmentHistoryItem(
  id: json['id'] as String,
  clinicId: json['clinic_id'] as String,
  clinicPatientId: json['clinic_patient_id'] as String?,
  appointmentDate: json['appointment_date'] as String,
  appointmentTime: json['appointment_time'] as String,
  consultationType: json['consultation_type'] as String,
  doctorName: json['doctor_name'] as String?,
  doctorPrefix: json['doctor_prefix'] as String?,
  reason: json['reason'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String,
  feeAmount: (json['fee_amount'] as num?)?.toDouble(),
  paymentStatus: json['payment_status'] as String,
  bookingNumber: json['booking_number'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$AppointmentHistoryItemToJson(
  _AppointmentHistoryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_id': instance.clinicId,
  'clinic_patient_id': ?instance.clinicPatientId,
  'appointment_date': instance.appointmentDate,
  'appointment_time': instance.appointmentTime,
  'consultation_type': instance.consultationType,
  'doctor_name': ?instance.doctorName,
  'doctor_prefix': ?instance.doctorPrefix,
  'reason': ?instance.reason,
  'notes': ?instance.notes,
  'status': instance.status,
  'fee_amount': ?instance.feeAmount,
  'payment_status': instance.paymentStatus,
  'booking_number': instance.bookingNumber,
  'created_at': instance.createdAt,
};

_AppointmentHistoryResponse _$AppointmentHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentHistoryResponse(
  success: json['success'] as bool,
  clinicPatientId: json['clinic_patient_id'] as String,
  clinicId: json['clinic_id'] as String?,
  total: (json['total'] as num).toInt(),
  appointments: (json['appointments'] as List<dynamic>)
      .map((e) => AppointmentHistoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppointmentHistoryResponseToJson(
  _AppointmentHistoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'clinic_patient_id': instance.clinicPatientId,
  'clinic_id': ?instance.clinicId,
  'total': instance.total,
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
};
