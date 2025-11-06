// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentListItemImpl _$$AppointmentListItemImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentListItemImpl(
  id: json['id'] as String,
  tokenNumber: (json['token_number'] as num?)?.toInt(),
  moId: json['mo_id'] as String?,
  patientName: json['patient_name'] as String,
  doctorName: json['doctor_name'] as String,
  department: json['department'] as String?,
  clinicPatientId: json['clinic_patient_id'] as String?,
  consultationType: json['consultation_type'] as String,
  appointmentDateTime: json['appointment_date_time'] as String,
  status: json['status'] as String,
  feeStatus: json['fee_status'] as String,
  feeAmount: (json['fee_amount'] as num?)?.toDouble(),
  paymentStatus: json['payment_status'] as String,
  bookingNumber: json['booking_number'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$AppointmentListItemImplToJson(
  _$AppointmentListItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.tokenNumber case final value?) 'token_number': value,
  if (instance.moId case final value?) 'mo_id': value,
  'patient_name': instance.patientName,
  'doctor_name': instance.doctorName,
  if (instance.department case final value?) 'department': value,
  if (instance.clinicPatientId case final value?) 'clinic_patient_id': value,
  'consultation_type': instance.consultationType,
  'appointment_date_time': instance.appointmentDateTime,
  'status': instance.status,
  'fee_status': instance.feeStatus,
  if (instance.feeAmount case final value?) 'fee_amount': value,
  'payment_status': instance.paymentStatus,
  'booking_number': instance.bookingNumber,
  'created_at': instance.createdAt,
};

_$SimpleAppointmentListResponseImpl
_$$SimpleAppointmentListResponseImplFromJson(Map<String, dynamic> json) =>
    _$SimpleAppointmentListResponseImpl(
      success: json['success'] as bool,
      clinicId: json['clinic_id'] as String,
      date: json['date'] as String?,
      total: (json['total'] as num).toInt(),
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => AppointmentListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SimpleAppointmentListResponseImplToJson(
  _$SimpleAppointmentListResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'clinic_id': instance.clinicId,
  if (instance.date case final value?) 'date': value,
  'total': instance.total,
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
};
