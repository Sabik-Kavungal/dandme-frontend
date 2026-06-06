// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => _DoctorModel(
  drid: json['id'] as String?,
  userId: json['user_id'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  email: json['email'] as String?,
  username: json['username'] as String?,
  phone: json['phone'] as String?,
  password: json['password'] as String?,
  doctorCode: json['doctor_code'] as String?,
  specialization: json['specialization'] as String?,
  licenseNumber: json['license_number'] as String?,
  consultationFee: (json['consultation_fee'] as num?)?.toDouble(),
  followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
  followUpDays: (json['follow_up_days'] as num?)?.toInt(),
  profileImage: json['profile_image'] as String?,
  qualification: json['qualification'] as String?,
  experienceYears: (json['experience_years'] as num?)?.toInt(),
  bio: json['bio'] as String?,
);

Map<String, dynamic> _$DoctorModelToJson(_DoctorModel instance) =>
    <String, dynamic>{
      'id': ?instance.drid,
      'user_id': ?instance.userId,
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'email': ?instance.email,
      'username': ?instance.username,
      'phone': ?instance.phone,
      'password': ?instance.password,
      'doctor_code': ?instance.doctorCode,
      'specialization': ?instance.specialization,
      'license_number': ?instance.licenseNumber,
      'consultation_fee': ?instance.consultationFee,
      'follow_up_fee': ?instance.followUpFee,
      'follow_up_days': ?instance.followUpDays,
      'profile_image': ?instance.profileImage,
      'qualification': ?instance.qualification,
      'experience_years': ?instance.experienceYears,
      'bio': ?instance.bio,
    };
