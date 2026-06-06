// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_doctor_links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClinicDoctorLinksResponse _$ClinicDoctorLinksResponseFromJson(
  Map<String, dynamic> json,
) => _ClinicDoctorLinksResponse(
  doctor: DoctorInfo.fromJson(json['doctor'] as Map<String, dynamic>),
  clinics: (json['clinics'] as List<dynamic>)
      .map((e) => ClinicLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalClinics: (json['total_clinics'] as num).toInt(),
);

Map<String, dynamic> _$ClinicDoctorLinksResponseToJson(
  _ClinicDoctorLinksResponse instance,
) => <String, dynamic>{
  'doctor': instance.doctor.toJson(),
  'clinics': instance.clinics.map((e) => e.toJson()).toList(),
  'total_clinics': instance.totalClinics,
};

_DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) => _DoctorInfo(
  doctorId: json['doctor_id'] as String,
  doctorCode: json['doctor_code'] as String?,
  specialization: json['specialization'] as String?,
  licenseNumber: json['license_number'] as String?,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  profileImage: json['profile_image'] as String?,
  qualification: json['qualification'] as String?,
  experienceYears: (json['experience_years'] as num?)?.toInt(),
  experience: json['experience'] as String?,
  bio: json['bio'] as String?,
);

Map<String, dynamic> _$DoctorInfoToJson(_DoctorInfo instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'doctor_code': ?instance.doctorCode,
      'specialization': ?instance.specialization,
      'license_number': ?instance.licenseNumber,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'profile_image': ?instance.profileImage,
      'qualification': ?instance.qualification,
      'experience_years': ?instance.experienceYears,
      'experience': ?instance.experience,
      'bio': ?instance.bio,
    };

_ClinicLink _$ClinicLinkFromJson(Map<String, dynamic> json) => _ClinicLink(
  linkId: json['link_id'] as String,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  clinic: ClinicInfo.fromJson(json['clinic'] as Map<String, dynamic>),
  fees: ClinicFees.fromJson(json['fees'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ClinicLinkToJson(_ClinicLink instance) =>
    <String, dynamic>{
      'link_id': instance.linkId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'clinic': instance.clinic.toJson(),
      'fees': instance.fees.toJson(),
      'notes': ?instance.notes,
    };

_ClinicInfo _$ClinicInfoFromJson(Map<String, dynamic> json) => _ClinicInfo(
  clinicId: json['clinic_id'] as String,
  name: json['name'] as String,
  clinicCode: json['clinic_code'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$ClinicInfoToJson(_ClinicInfo instance) =>
    <String, dynamic>{
      'clinic_id': instance.clinicId,
      'name': instance.name,
      'clinic_code': instance.clinicCode,
      'phone': ?instance.phone,
      'address': ?instance.address,
      'email': ?instance.email,
    };

_ClinicFees _$ClinicFeesFromJson(Map<String, dynamic> json) => _ClinicFees(
  consultationFeeOffline: (json['consultation_fee_offline'] as num?)
      ?.toDouble(),
  consultationFeeOnline: (json['consultation_fee_online'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClinicFeesToJson(_ClinicFees instance) =>
    <String, dynamic>{
      'consultation_fee_offline': ?instance.consultationFeeOffline,
      'consultation_fee_online': ?instance.consultationFeeOnline,
      'follow_up_fee': ?instance.followUpFee,
      'follow_up_days': ?instance.followUpDays,
    };
