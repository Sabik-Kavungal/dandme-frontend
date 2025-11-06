// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/clinic_doctor_links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicDoctorLinksResponseImpl _$$ClinicDoctorLinksResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicDoctorLinksResponseImpl(
  doctor: DoctorInfo.fromJson(json['doctor'] as Map<String, dynamic>),
  clinics: (json['clinics'] as List<dynamic>)
      .map((e) => ClinicLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalClinics: (json['total_clinics'] as num).toInt(),
);

Map<String, dynamic> _$$ClinicDoctorLinksResponseImplToJson(
  _$ClinicDoctorLinksResponseImpl instance,
) => <String, dynamic>{
  'doctor': instance.doctor.toJson(),
  'clinics': instance.clinics.map((e) => e.toJson()).toList(),
  'total_clinics': instance.totalClinics,
};

_$DoctorInfoImpl _$$DoctorInfoImplFromJson(Map<String, dynamic> json) =>
    _$DoctorInfoImpl(
      doctorId: json['doctor_id'] as String,
      doctorCode: json['doctor_code'] as String?,
      specialization: json['specialization'] as String?,
      licenseNumber: json['license_number'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$DoctorInfoImplToJson(_$DoctorInfoImpl instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      if (instance.doctorCode case final value?) 'doctor_code': value,
      if (instance.specialization case final value?) 'specialization': value,
      if (instance.licenseNumber case final value?) 'license_number': value,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
    };

_$ClinicLinkImpl _$$ClinicLinkImplFromJson(Map<String, dynamic> json) =>
    _$ClinicLinkImpl(
      linkId: json['link_id'] as String,
      isActive: json['is_active'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      clinic: ClinicInfo.fromJson(json['clinic'] as Map<String, dynamic>),
      fees: ClinicFees.fromJson(json['fees'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ClinicLinkImplToJson(_$ClinicLinkImpl instance) =>
    <String, dynamic>{
      'link_id': instance.linkId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'clinic': instance.clinic.toJson(),
      'fees': instance.fees.toJson(),
      if (instance.notes case final value?) 'notes': value,
    };

_$ClinicInfoImpl _$$ClinicInfoImplFromJson(Map<String, dynamic> json) =>
    _$ClinicInfoImpl(
      clinicId: json['clinic_id'] as String,
      name: json['name'] as String,
      clinicCode: json['clinic_code'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ClinicInfoImplToJson(_$ClinicInfoImpl instance) =>
    <String, dynamic>{
      'clinic_id': instance.clinicId,
      'name': instance.name,
      'clinic_code': instance.clinicCode,
      if (instance.phone case final value?) 'phone': value,
      if (instance.address case final value?) 'address': value,
      if (instance.email case final value?) 'email': value,
    };

_$ClinicFeesImpl _$$ClinicFeesImplFromJson(Map<String, dynamic> json) =>
    _$ClinicFeesImpl(
      consultationFeeOffline: (json['consultation_fee_offline'] as num?)
          ?.toDouble(),
      consultationFeeOnline: (json['consultation_fee_online'] as num?)
          ?.toDouble(),
      followUpFee: (json['follow_up_fee'] as num?)?.toDouble(),
      followUpDays: (json['follow_up_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ClinicFeesImplToJson(_$ClinicFeesImpl instance) =>
    <String, dynamic>{
      if (instance.consultationFeeOffline case final value?)
        'consultation_fee_offline': value,
      if (instance.consultationFeeOnline case final value?)
        'consultation_fee_online': value,
      if (instance.followUpFee case final value?) 'follow_up_fee': value,
      if (instance.followUpDays case final value?) 'follow_up_days': value,
    };
