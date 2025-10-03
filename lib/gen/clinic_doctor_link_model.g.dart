// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_doctor_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicInfoImpl _$$ClinicInfoImplFromJson(Map<String, dynamic> json) =>
    _$ClinicInfoImpl(
      clinicCode: json['clinic_code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ClinicInfoImplToJson(_$ClinicInfoImpl instance) =>
    <String, dynamic>{
      'clinic_code': instance.clinicCode,
      'name': instance.name,
    };

_$DoctorInfoImpl _$$DoctorInfoImplFromJson(Map<String, dynamic> json) =>
    _$DoctorInfoImpl(
      doctorCode: json['doctor_code'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      specialization: json['specialization'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$DoctorInfoImplToJson(_$DoctorInfoImpl instance) =>
    <String, dynamic>{
      'doctor_code': instance.doctorCode,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'specialization': instance.specialization,
      'username': instance.username,
    };

_$ClinicDoctorLinkModelImpl _$$ClinicDoctorLinkModelImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicDoctorLinkModelImpl(
  clinic: ClinicInfo.fromJson(json['clinic'] as Map<String, dynamic>),
  doctor: DoctorInfo.fromJson(json['doctor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ClinicDoctorLinkModelImplToJson(
  _$ClinicDoctorLinkModelImpl instance,
) => <String, dynamic>{
  'clinic': instance.clinic.toJson(),
  'doctor': instance.doctor.toJson(),
};

_$CreateClinicDoctorLinkModelImpl _$$CreateClinicDoctorLinkModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateClinicDoctorLinkModelImpl(
  links: (json['links'] as List<dynamic>)
      .map((e) => ClinicDoctorLinkModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateClinicDoctorLinkModelImplToJson(
  _$CreateClinicDoctorLinkModelImpl instance,
) => <String, dynamic>{'links': instance.links.map((e) => e.toJson()).toList()};

_$ClinicDoctorLinkResponseImpl _$$ClinicDoctorLinkResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicDoctorLinkResponseImpl(
  linkId: json['link_id'] as String?,
  clinic: ClinicInfo.fromJson(json['clinic'] as Map<String, dynamic>),
  doctor: DoctorFullInfo.fromJson(json['doctor'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$$ClinicDoctorLinkResponseImplToJson(
  _$ClinicDoctorLinkResponseImpl instance,
) => <String, dynamic>{
  if (instance.linkId case final value?) 'link_id': value,
  'clinic': instance.clinic.toJson(),
  'doctor': instance.doctor.toJson(),
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.isActive case final value?) 'is_active': value,
};

_$DoctorFullInfoImpl _$$DoctorFullInfoImplFromJson(Map<String, dynamic> json) =>
    _$DoctorFullInfoImpl(
      doctorId: json['doctor_id'] as String?,
      doctorCode: json['doctor_code'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      specialization: json['specialization'] as String,
      username: json['username'] as String,
      licenseNumber: json['license_number'] as String?,
      consultationFee: (json['consultation_fee'] as num?)?.toDouble(),
      followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
      followUpDays: (json['follow_up_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DoctorFullInfoImplToJson(
  _$DoctorFullInfoImpl instance,
) => <String, dynamic>{
  if (instance.doctorId case final value?) 'doctor_id': value,
  'doctor_code': instance.doctorCode,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'specialization': instance.specialization,
  'username': instance.username,
  if (instance.licenseNumber case final value?) 'license_number': value,
  if (instance.consultationFee case final value?) 'consultation_fee': value,
  if (instance.followUpFee case final value?) 'follow_up_fee': value,
  if (instance.followUpDays case final value?) 'follow_up_days': value,
};
