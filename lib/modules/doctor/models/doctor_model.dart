import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part '../gen/doctor_model.freezed.dart';
part '../gen/doctor_model.g.dart';

@freezed
abstract class DoctorModel with _$DoctorModel {
  const factory DoctorModel({
    @JsonKey(name: "id") String? drid,

    /// Existing user option
    @JsonKey(name: "user_id") String? userId,

    /// Create new user option
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "password") String? password,

    /// Doctor profile
    @JsonKey(name: "doctor_code") String? doctorCode,
    @JsonKey(name: "specialization") String? specialization,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "qualification") String? qualification,
    @JsonKey(name: "experience_years") int? experienceYears,
    @JsonKey(name: "bio") String? bio,
  }) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}
