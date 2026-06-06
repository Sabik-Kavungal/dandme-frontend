// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClinicSpecificFees _$ClinicSpecificFeesFromJson(Map<String, dynamic> json) =>
    _ClinicSpecificFees(
      consultationFeeOffline: (json['consultation_fee_offline'] as num?)
          ?.toDouble(),
      consultationFeeOnline: (json['consultation_fee_online'] as num?)
          ?.toDouble(),
      followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
      followUpDays: (json['follow_up_days'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ClinicSpecificFeesToJson(_ClinicSpecificFees instance) =>
    <String, dynamic>{
      'consultation_fee_offline': ?instance.consultationFeeOffline,
      'consultation_fee_online': ?instance.consultationFeeOnline,
      'follow_up_fee': ?instance.followUpFee,
      'follow_up_days': ?instance.followUpDays,
      'notes': ?instance.notes,
    };

_DefaultFees _$DefaultFeesFromJson(Map<String, dynamic> json) => _DefaultFees(
  consultationFee: (json['consultation_fee'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
);

Map<String, dynamic> _$DefaultFeesToJson(_DefaultFees instance) =>
    <String, dynamic>{
      'consultation_fee': ?instance.consultationFee,
      'follow_up_fee': ?instance.followUpFee,
      'follow_up_days': ?instance.followUpDays,
    };

_ClinicDoctorModel _$ClinicDoctorModelFromJson(Map<String, dynamic> json) =>
    _ClinicDoctorModel(
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
      profileImage: json['profile_image'] as String?,
      qualification: json['qualification'] as String?,
      experienceYears: (json['experience_years'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      clinicSpecificFees: json['clinic_specific_fees'] == null
          ? null
          : ClinicSpecificFees.fromJson(
              json['clinic_specific_fees'] as Map<String, dynamic>,
            ),
      defaultFees: json['default_fees'] == null
          ? null
          : DefaultFees.fromJson(json['default_fees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClinicDoctorModelToJson(_ClinicDoctorModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'link_id': ?instance.linkId,
      'doctor_id': ?instance.doctorId,
      'user_id': ?instance.userId,
      'doctor_code': ?instance.doctorCode,
      'specialization': ?instance.specialization,
      'license_number': ?instance.licenseNumber,
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'full_name': ?instance.fullName,
      'email': ?instance.email,
      'username': ?instance.username,
      'phone': ?instance.phone,
      'is_active': instance.isActive,
      'profile_image': ?instance.profileImage,
      'qualification': ?instance.qualification,
      'experience_years': ?instance.experienceYears,
      'bio': ?instance.bio,
      'clinic_specific_fees': ?instance.clinicSpecificFees?.toJson(),
      'default_fees': ?instance.defaultFees?.toJson(),
    };

_ClinicDoctorsResponse _$ClinicDoctorsResponseFromJson(
  Map<String, dynamic> json,
) => _ClinicDoctorsResponse(
  clinicId: json['clinic_id'] as String?,
  doctors: (json['doctors'] as List<dynamic>)
      .map((e) => ClinicDoctorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDoctors: (json['total_doctors'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClinicDoctorsResponseToJson(
  _ClinicDoctorsResponse instance,
) => <String, dynamic>{
  'clinic_id': ?instance.clinicId,
  'doctors': instance.doctors.map((e) => e.toJson()).toList(),
  'total_doctors': ?instance.totalDoctors,
};
