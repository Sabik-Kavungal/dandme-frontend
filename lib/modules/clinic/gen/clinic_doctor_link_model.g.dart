// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_doctor_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClinicInfo _$ClinicInfoFromJson(Map<String, dynamic> json) => _ClinicInfo(
  clinicCode: json['clinic_code'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$ClinicInfoToJson(_ClinicInfo instance) =>
    <String, dynamic>{
      'clinic_code': instance.clinicCode,
      'name': instance.name,
    };

_DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) => _DoctorInfo(
  doctorCode: json['doctor_code'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  specialization: json['specialization'] as String,
  username: json['username'] as String,
  profileImage: json['profile_image'] as String?,
);

Map<String, dynamic> _$DoctorInfoToJson(_DoctorInfo instance) =>
    <String, dynamic>{
      'doctor_code': instance.doctorCode,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'specialization': instance.specialization,
      'username': instance.username,
      'profile_image': ?instance.profileImage,
    };

_ClinicDoctorLinkModel _$ClinicDoctorLinkModelFromJson(
  Map<String, dynamic> json,
) => _ClinicDoctorLinkModel(
  clinic: ClinicInfo.fromJson(json['clinic'] as Map<String, dynamic>),
  doctor: DoctorInfo.fromJson(json['doctor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ClinicDoctorLinkModelToJson(
  _ClinicDoctorLinkModel instance,
) => <String, dynamic>{
  'clinic': instance.clinic.toJson(),
  'doctor': instance.doctor.toJson(),
};

_CreateClinicDoctorLinkModel _$CreateClinicDoctorLinkModelFromJson(
  Map<String, dynamic> json,
) => _CreateClinicDoctorLinkModel(
  links: (json['links'] as List<dynamic>)
      .map((e) => ClinicDoctorLinkModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateClinicDoctorLinkModelToJson(
  _CreateClinicDoctorLinkModel instance,
) => <String, dynamic>{'links': instance.links.map((e) => e.toJson()).toList()};

_ClinicDoctorLinkResponse _$ClinicDoctorLinkResponseFromJson(
  Map<String, dynamic> json,
) => _ClinicDoctorLinkResponse(
  linkId: json['link_id'] as String?,
  clinic: ClinicInfo.fromJson(json['clinic'] as Map<String, dynamic>),
  doctor: DoctorFullInfo.fromJson(json['doctor'] as Map<String, dynamic>),
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$ClinicDoctorLinkResponseToJson(
  _ClinicDoctorLinkResponse instance,
) => <String, dynamic>{
  'link_id': ?instance.linkId,
  'clinic': instance.clinic.toJson(),
  'doctor': instance.doctor.toJson(),
  'consultation_fee_offline': ?instance.consultationFeeOffline,
  'consultation_fee_online': ?instance.consultationFeeOnline,
  'follow_up_fee': ?instance.followUpFee,
  'follow_up_days': ?instance.followUpDays,
  'notes': ?instance.notes,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'is_active': ?instance.isActive,
};

_DoctorFullInfo _$DoctorFullInfoFromJson(Map<String, dynamic> json) =>
    _DoctorFullInfo(
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
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$DoctorFullInfoToJson(_DoctorFullInfo instance) =>
    <String, dynamic>{
      'doctor_id': ?instance.doctorId,
      'doctor_code': instance.doctorCode,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'specialization': instance.specialization,
      'username': instance.username,
      'license_number': ?instance.licenseNumber,
      'consultation_fee': ?instance.consultationFee,
      'follow_up_fee': ?instance.followUpFee,
      'follow_up_days': ?instance.followUpDays,
      'profile_image': ?instance.profileImage,
    };

_CreateClinicDoctorLinkWithFees _$CreateClinicDoctorLinkWithFeesFromJson(
  Map<String, dynamic> json,
) => _CreateClinicDoctorLinkWithFees(
  clinicId: json['clinic_id'] as String,
  doctorId: json['doctor_id'] as String,
  consultationFeeOffline: (json['consultation_fee_offline'] as num).toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num).toDouble(),
  followUpFee: (json['follow_up_fee'] as num).toDouble(),
  followUpDays: (json['follow_up_days'] as num).toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateClinicDoctorLinkWithFeesToJson(
  _CreateClinicDoctorLinkWithFees instance,
) => <String, dynamic>{
  'clinic_id': instance.clinicId,
  'doctor_id': instance.doctorId,
  'consultation_fee_offline': instance.consultationFeeOffline,
  'consultation_fee_online': instance.consultationFeeOnline,
  'follow_up_fee': instance.followUpFee,
  'follow_up_days': instance.followUpDays,
  'notes': ?instance.notes,
};

_UpdateClinicDoctorLinkFees _$UpdateClinicDoctorLinkFeesFromJson(
  Map<String, dynamic> json,
) => _UpdateClinicDoctorLinkFees(
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$UpdateClinicDoctorLinkFeesToJson(
  _UpdateClinicDoctorLinkFees instance,
) => <String, dynamic>{
  'consultation_fee_offline': ?instance.consultationFeeOffline,
  'consultation_fee_online': ?instance.consultationFeeOnline,
  'follow_up_fee': ?instance.followUpFee,
  'follow_up_days': ?instance.followUpDays,
  'notes': ?instance.notes,
};
