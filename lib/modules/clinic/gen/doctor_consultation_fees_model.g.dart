// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_consultation_fees_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorConsultationFees _$DoctorConsultationFeesFromJson(
  Map<String, dynamic> json,
) => _DoctorConsultationFees(
  clinicDoctorId: json['clinic_doctor_id'] as String,
  clinicId: json['clinic_id'] as String,
  clinicName: json['clinic_name'] as String?,
  doctorId: json['doctor_id'] as String,
  doctorName: json['doctor_name'] as String?,
  doctorCode: json['doctor_code'] as String?,
  specialization: json['specialization'] as String?,
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$DoctorConsultationFeesToJson(
  _DoctorConsultationFees instance,
) => <String, dynamic>{
  'clinic_doctor_id': instance.clinicDoctorId,
  'clinic_id': instance.clinicId,
  'clinic_name': ?instance.clinicName,
  'doctor_id': instance.doctorId,
  'doctor_name': ?instance.doctorName,
  'doctor_code': ?instance.doctorCode,
  'specialization': ?instance.specialization,
  'consultation_fee_offline': ?instance.consultationFeeOffline,
  'consultation_fee_online': ?instance.consultationFeeOnline,
  'follow_up_fee': ?instance.followUpFee,
  'follow_up_days': ?instance.followUpDays,
  'notes': ?instance.notes,
  'is_active': ?instance.isActive,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};

_AddConsultationFeesRequest _$AddConsultationFeesRequestFromJson(
  Map<String, dynamic> json,
) => _AddConsultationFeesRequest(
  clinicId: json['clinic_id'] as String,
  clinicDoctorId: json['clinic_doctor_id'] as String,
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$AddConsultationFeesRequestToJson(
  _AddConsultationFeesRequest instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'clinic_doctor_id': instance.clinicDoctorId,
  'consultation_fee_offline': ?instance.consultationFeeOffline,
  'consultation_fee_online': ?instance.consultationFeeOnline,
  'follow_up_fee': ?instance.followUpFee,
  'follow_up_days': ?instance.followUpDays,
  'notes': ?instance.notes,
};

_UpdateConsultationFeesRequest _$UpdateConsultationFeesRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateConsultationFeesRequest(
  clinicId: json['clinic_id'] as String,
  clinicDoctorId: json['clinic_doctor_id'] as String,
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$UpdateConsultationFeesRequestToJson(
  _UpdateConsultationFeesRequest instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'clinic_doctor_id': instance.clinicDoctorId,
  'consultation_fee_offline': ?instance.consultationFeeOffline,
  'consultation_fee_online': ?instance.consultationFeeOnline,
  'follow_up_fee': ?instance.followUpFee,
  'follow_up_days': ?instance.followUpDays,
  'notes': ?instance.notes,
};

_ConsultationFeesResponse _$ConsultationFeesResponseFromJson(
  Map<String, dynamic> json,
) => _ConsultationFeesResponse(
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : DoctorConsultationFees.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConsultationFeesResponseToJson(
  _ConsultationFeesResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': ?instance.data?.toJson(),
};
