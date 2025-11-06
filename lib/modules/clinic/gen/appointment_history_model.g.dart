// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentHistoryItemImpl _$$AppointmentHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentHistoryItemImpl(
  id: json['id'] as String,
  clinicId: json['clinic_id'] as String,
  clinicPatientId: json['clinic_patient_id'] as String?,
  appointmentDate: json['appointment_date'] as String,
  appointmentTime: json['appointment_time'] as String,
  consultationType: json['consultation_type'] as String,
  reason: json['reason'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String,
  feeAmount: (json['fee_amount'] as num?)?.toDouble(),
  paymentStatus: json['payment_status'] as String,
  bookingNumber: json['booking_number'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$AppointmentHistoryItemImplToJson(
  _$AppointmentHistoryItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinic_id': instance.clinicId,
  if (instance.clinicPatientId case final value?) 'clinic_patient_id': value,
  'appointment_date': instance.appointmentDate,
  'appointment_time': instance.appointmentTime,
  'consultation_type': instance.consultationType,
  if (instance.reason case final value?) 'reason': value,
  if (instance.notes case final value?) 'notes': value,
  'status': instance.status,
  if (instance.feeAmount case final value?) 'fee_amount': value,
  'payment_status': instance.paymentStatus,
  'booking_number': instance.bookingNumber,
  'created_at': instance.createdAt,
};

_$AppointmentHistoryResponseImpl _$$AppointmentHistoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentHistoryResponseImpl(
  success: json['success'] as bool,
  clinicPatientId: json['clinic_patient_id'] as String,
  clinicId: json['clinic_id'] as String?,
  total: (json['total'] as num).toInt(),
  appointments: (json['appointments'] as List<dynamic>)
      .map((e) => AppointmentHistoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AppointmentHistoryResponseImplToJson(
  _$AppointmentHistoryResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'clinic_patient_id': instance.clinicPatientId,
  if (instance.clinicId case final value?) 'clinic_id': value,
  'total': instance.total,
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
};
