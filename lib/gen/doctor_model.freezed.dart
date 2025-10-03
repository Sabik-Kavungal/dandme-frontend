// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) {
  return _DoctorModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorModel {
  @JsonKey(name: "id")
  String? get drid => throw _privateConstructorUsedError;

  /// Existing user option
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;

  /// Create new user option
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;

  /// Doctor profile
  @JsonKey(name: "doctor_code")
  String? get doctorCode => throw _privateConstructorUsedError;
  @JsonKey(name: "specialization")
  String? get specialization => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee")
  double? get consultationFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int? get followUpDays => throw _privateConstructorUsedError;

  /// Serializes this DoctorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorModelCopyWith<DoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorModelCopyWith<$Res> {
  factory $DoctorModelCopyWith(
    DoctorModel value,
    $Res Function(DoctorModel) then,
  ) = _$DoctorModelCopyWithImpl<$Res, DoctorModel>;
  @useResult
  $Res call({
    @JsonKey(name: "id") String? drid,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "doctor_code") String? doctorCode,
    @JsonKey(name: "specialization") String? specialization,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  });
}

/// @nodoc
class _$DoctorModelCopyWithImpl<$Res, $Val extends DoctorModel>
    implements $DoctorModelCopyWith<$Res> {
  _$DoctorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drid = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? doctorCode = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
    Object? consultationFee = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _value.copyWith(
            drid: freezed == drid
                ? _value.drid
                : drid // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorCode: freezed == doctorCode
                ? _value.doctorCode
                : doctorCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialization: freezed == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String?,
            licenseNumber: freezed == licenseNumber
                ? _value.licenseNumber
                : licenseNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationFee: freezed == consultationFee
                ? _value.consultationFee
                : consultationFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            followUpFee: freezed == followUpFee
                ? _value.followUpFee
                : followUpFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            followUpDays: freezed == followUpDays
                ? _value.followUpDays
                : followUpDays // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorModelImplCopyWith<$Res>
    implements $DoctorModelCopyWith<$Res> {
  factory _$$DoctorModelImplCopyWith(
    _$DoctorModelImpl value,
    $Res Function(_$DoctorModelImpl) then,
  ) = __$$DoctorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") String? drid,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "doctor_code") String? doctorCode,
    @JsonKey(name: "specialization") String? specialization,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  });
}

/// @nodoc
class __$$DoctorModelImplCopyWithImpl<$Res>
    extends _$DoctorModelCopyWithImpl<$Res, _$DoctorModelImpl>
    implements _$$DoctorModelImplCopyWith<$Res> {
  __$$DoctorModelImplCopyWithImpl(
    _$DoctorModelImpl _value,
    $Res Function(_$DoctorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drid = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? doctorCode = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
    Object? consultationFee = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _$DoctorModelImpl(
        drid: freezed == drid
            ? _value.drid
            : drid // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorCode: freezed == doctorCode
            ? _value.doctorCode
            : doctorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialization: freezed == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String?,
        licenseNumber: freezed == licenseNumber
            ? _value.licenseNumber
            : licenseNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationFee: freezed == consultationFee
            ? _value.consultationFee
            : consultationFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        followUpFee: freezed == followUpFee
            ? _value.followUpFee
            : followUpFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        followUpDays: freezed == followUpDays
            ? _value.followUpDays
            : followUpDays // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorModelImpl implements _DoctorModel {
  const _$DoctorModelImpl({
    @JsonKey(name: "id") this.drid,
    @JsonKey(name: "user_id") this.userId,
    @JsonKey(name: "first_name") this.firstName,
    @JsonKey(name: "last_name") this.lastName,
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "username") this.username,
    @JsonKey(name: "phone") this.phone,
    @JsonKey(name: "password") this.password,
    @JsonKey(name: "doctor_code") this.doctorCode,
    @JsonKey(name: "specialization") this.specialization,
    @JsonKey(name: "license_number") this.licenseNumber,
    @JsonKey(name: "consultation_fee") this.consultationFee,
    @JsonKey(name: "follow_up_fee") this.followUpFee,
    @JsonKey(name: "follow_up_days") this.followUpDays,
  });

  factory _$DoctorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? drid;

  /// Existing user option
  @override
  @JsonKey(name: "user_id")
  final String? userId;

  /// Create new user option
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "password")
  final String? password;

  /// Doctor profile
  @override
  @JsonKey(name: "doctor_code")
  final String? doctorCode;
  @override
  @JsonKey(name: "specialization")
  final String? specialization;
  @override
  @JsonKey(name: "license_number")
  final String? licenseNumber;
  @override
  @JsonKey(name: "consultation_fee")
  final double? consultationFee;
  @override
  @JsonKey(name: "follow_up_fee")
  final double? followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  final int? followUpDays;

  @override
  String toString() {
    return 'DoctorModel(drid: $drid, userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, username: $username, phone: $phone, password: $password, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorModelImpl &&
            (identical(other.drid, drid) || other.drid == drid) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.doctorCode, doctorCode) ||
                other.doctorCode == doctorCode) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.consultationFee, consultationFee) ||
                other.consultationFee == consultationFee) &&
            (identical(other.followUpFee, followUpFee) ||
                other.followUpFee == followUpFee) &&
            (identical(other.followUpDays, followUpDays) ||
                other.followUpDays == followUpDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    drid,
    userId,
    firstName,
    lastName,
    email,
    username,
    phone,
    password,
    doctorCode,
    specialization,
    licenseNumber,
    consultationFee,
    followUpFee,
    followUpDays,
  );

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorModelImplCopyWith<_$DoctorModelImpl> get copyWith =>
      __$$DoctorModelImplCopyWithImpl<_$DoctorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorModelImplToJson(this);
  }
}

abstract class _DoctorModel implements DoctorModel {
  const factory _DoctorModel({
    @JsonKey(name: "id") final String? drid,
    @JsonKey(name: "user_id") final String? userId,
    @JsonKey(name: "first_name") final String? firstName,
    @JsonKey(name: "last_name") final String? lastName,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "username") final String? username,
    @JsonKey(name: "phone") final String? phone,
    @JsonKey(name: "password") final String? password,
    @JsonKey(name: "doctor_code") final String? doctorCode,
    @JsonKey(name: "specialization") final String? specialization,
    @JsonKey(name: "license_number") final String? licenseNumber,
    @JsonKey(name: "consultation_fee") final double? consultationFee,
    @JsonKey(name: "follow_up_fee") final double? followUpFee,
    @JsonKey(name: "follow_up_days") final int? followUpDays,
  }) = _$DoctorModelImpl;

  factory _DoctorModel.fromJson(Map<String, dynamic> json) =
      _$DoctorModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get drid;

  /// Existing user option
  @override
  @JsonKey(name: "user_id")
  String? get userId;

  /// Create new user option
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "password")
  String? get password;

  /// Doctor profile
  @override
  @JsonKey(name: "doctor_code")
  String? get doctorCode;
  @override
  @JsonKey(name: "specialization")
  String? get specialization;
  @override
  @JsonKey(name: "license_number")
  String? get licenseNumber;
  @override
  @JsonKey(name: "consultation_fee")
  double? get consultationFee;
  @override
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  int? get followUpDays;

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorModelImplCopyWith<_$DoctorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
