// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentListItem _$AppointmentListItemFromJson(Map<String, dynamic> json) =>
    _AppointmentListItem(
      id: json['id'] as String,
      tokenNumber: _tokenNumberToString(json['token_number']),
      tokenNumeric: (json['token_numeric'] as num?)?.toInt(),
      displayToken: json['display_token'] as String?,
      doctorPrefix: json['doctor_prefix'] as String?,
      queuePosition: (json['queue_position'] as num?)?.toInt(),
      moId: json['mo_id'] as String?,
      patientNumber: json['patient_number'] as String?,
      patientName: json['patient_name'] as String,
      doctorName: json['doctor_name'] as String,
      department: json['department'] as String?,
      clinicPatientId: json['clinic_patient_id'] as String?,
      patientId: json['patient_id'] as String?,
      consultationType: json['consultation_type'] as String,
      appointmentDateTime: json['appointment_date_time'] as String,
      status: json['status'] as String,
      feeStatus: json['fee_status'] as String,
      feeAmount: (json['fee_amount'] as num?)?.toDouble(),
      paymentStatus: json['payment_status'] as String,
      bookingNumber: json['booking_number'] as String,
      createdAt: json['created_at'] as String,
      doctorImage: json['doctor_image'] as String?,
      bookingMode: json['booking_mode'] as String?,
      paymentMode: json['payment_mode'] as String?,
    );

Map<String, dynamic> _$AppointmentListItemToJson(
  _AppointmentListItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'token_number': ?instance.tokenNumber,
  'token_numeric': ?instance.tokenNumeric,
  'display_token': ?instance.displayToken,
  'doctor_prefix': ?instance.doctorPrefix,
  'queue_position': ?instance.queuePosition,
  'mo_id': ?instance.moId,
  'patient_number': ?instance.patientNumber,
  'patient_name': instance.patientName,
  'doctor_name': instance.doctorName,
  'department': ?instance.department,
  'clinic_patient_id': ?instance.clinicPatientId,
  'patient_id': ?instance.patientId,
  'consultation_type': instance.consultationType,
  'appointment_date_time': instance.appointmentDateTime,
  'status': instance.status,
  'fee_status': instance.feeStatus,
  'fee_amount': ?instance.feeAmount,
  'payment_status': instance.paymentStatus,
  'booking_number': instance.bookingNumber,
  'created_at': instance.createdAt,
  'doctor_image': ?instance.doctorImage,
  'booking_mode': ?instance.bookingMode,
  'payment_mode': ?instance.paymentMode,
};

_SimpleAppointmentListResponse _$SimpleAppointmentListResponseFromJson(
  Map<String, dynamic> json,
) => _SimpleAppointmentListResponse(
  success: json['success'] as bool,
  clinicId: json['clinic_id'] as String,
  date: json['date'] as String?,
  total: (json['total'] as num).toInt(),
  appointments: (json['appointments'] as List<dynamic>)
      .map((e) => AppointmentListItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SimpleAppointmentListResponseToJson(
  _SimpleAppointmentListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'clinic_id': instance.clinicId,
  'date': ?instance.date,
  'total': instance.total,
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
};
