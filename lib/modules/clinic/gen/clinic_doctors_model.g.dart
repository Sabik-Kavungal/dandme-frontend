// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicSpecificFeesImpl _$$ClinicSpecificFeesImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicSpecificFeesImpl(
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$ClinicSpecificFeesImplToJson(
  _$ClinicSpecificFeesImpl instance,
) => <String, dynamic>{
  if (instance.consultationFeeOffline case final value?)
    'consultation_fee_offline': value,
  if (instance.consultationFeeOnline case final value?)
    'consultation_fee_online': value,
  if (instance.followUpFee case final value?) 'follow_up_fee': value,
  if (instance.followUpDays case final value?) 'follow_up_days': value,
  if (instance.notes case final value?) 'notes': value,
};

_$DefaultFeesImpl _$$DefaultFeesImplFromJson(Map<String, dynamic> json) =>
    _$DefaultFeesImpl(
      consultationFee: (json['consultation_fee'] as num?)?.toDouble(),
      followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
      followUpDays: (json['follow_up_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DefaultFeesImplToJson(_$DefaultFeesImpl instance) =>
    <String, dynamic>{
      if (instance.consultationFee case final value?) 'consultation_fee': value,
      if (instance.followUpFee case final value?) 'follow_up_fee': value,
      if (instance.followUpDays case final value?) 'follow_up_days': value,
    };

_$ClinicDoctorModelImpl _$$ClinicDoctorModelImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicDoctorModelImpl(
  id: json['id'] as String?,
  linkId: json['link_id'] as String?,
  doctorId: json['doctor_id'] as String?,
  userId: json['user_id'] as String?,
  doctorCode: json['doctor_code'] as String?,
  specialization: json['specialization'] as String?,
  licenseNumber: json['license_number'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  fullName: json['full_name'] as String?,
  email: json['email'] as String?,
  username: json['username'] as String?,
  phone: json['phone'] as String?,
  isActive: json['is_active'] as bool? ?? true,
  clinicSpecificFees: json['clinic_specific_fees'] == null
      ? null
      : ClinicSpecificFees.fromJson(
          json['clinic_specific_fees'] as Map<String, dynamic>,
        ),
  defaultFees: json['default_fees'] == null
      ? null
      : DefaultFees.fromJson(json['default_fees'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ClinicDoctorModelImplToJson(
  _$ClinicDoctorModelImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.linkId case final value?) 'link_id': value,
  if (instance.doctorId case final value?) 'doctor_id': value,
  if (instance.userId case final value?) 'user_id': value,
  if (instance.doctorCode case final value?) 'doctor_code': value,
  if (instance.specialization case final value?) 'specialization': value,
  if (instance.licenseNumber case final value?) 'license_number': value,
  if (instance.firstName case final value?) 'first_name': value,
  if (instance.lastName case final value?) 'last_name': value,
  if (instance.fullName case final value?) 'full_name': value,
  if (instance.email case final value?) 'email': value,
  if (instance.username case final value?) 'username': value,
  if (instance.phone case final value?) 'phone': value,
  'is_active': instance.isActive,
  if (instance.clinicSpecificFees?.toJson() case final value?)
    'clinic_specific_fees': value,
  if (instance.defaultFees?.toJson() case final value?) 'default_fees': value,
};

_$ClinicDoctorsResponseImpl _$$ClinicDoctorsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicDoctorsResponseImpl(
  clinicId: json['clinic_id'] as String?,
  doctors: (json['doctors'] as List<dynamic>)
      .map((e) => ClinicDoctorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDoctors: (json['total_doctors'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ClinicDoctorsResponseImplToJson(
  _$ClinicDoctorsResponseImpl instance,
) => <String, dynamic>{
  if (instance.clinicId case final value?) 'clinic_id': value,
  'doctors': instance.doctors.map((e) => e.toJson()).toList(),
  if (instance.totalDoctors case final value?) 'total_doctors': value,
};
