// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorModelImpl _$$DoctorModelImplFromJson(Map<String, dynamic> json) =>
    _$DoctorModelImpl(
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
    );

Map<String, dynamic> _$$DoctorModelImplToJson(_$DoctorModelImpl instance) =>
    <String, dynamic>{
      if (instance.drid case final value?) 'id': value,
      if (instance.userId case final value?) 'user_id': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.email case final value?) 'email': value,
      if (instance.username case final value?) 'username': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.password case final value?) 'password': value,
      if (instance.doctorCode case final value?) 'doctor_code': value,
      if (instance.specialization case final value?) 'specialization': value,
      if (instance.licenseNumber case final value?) 'license_number': value,
      if (instance.consultationFee case final value?) 'consultation_fee': value,
      if (instance.followUpFee case final value?) 'follow_up_fee': value,
      if (instance.followUpDays case final value?) 'follow_up_days': value,
    };
