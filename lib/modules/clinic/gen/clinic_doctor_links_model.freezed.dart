// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_doctor_links_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClinicDoctorLinksResponse _$ClinicDoctorLinksResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ClinicDoctorLinksResponse.fromJson(json);
}

/// @nodoc
mixin _$ClinicDoctorLinksResponse {
  DoctorInfo get doctor => throw _privateConstructorUsedError;
  List<ClinicLink> get clinics => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_clinics')
  int get totalClinics => throw _privateConstructorUsedError;

  /// Serializes this ClinicDoctorLinksResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicDoctorLinksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicDoctorLinksResponseCopyWith<ClinicDoctorLinksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDoctorLinksResponseCopyWith<$Res> {
  factory $ClinicDoctorLinksResponseCopyWith(
    ClinicDoctorLinksResponse value,
    $Res Function(ClinicDoctorLinksResponse) then,
  ) = _$ClinicDoctorLinksResponseCopyWithImpl<$Res, ClinicDoctorLinksResponse>;
  @useResult
  $Res call({
    DoctorInfo doctor,
    List<ClinicLink> clinics,
    @JsonKey(name: 'total_clinics') int totalClinics,
  });

  $DoctorInfoCopyWith<$Res> get doctor;
}

/// @nodoc
class _$ClinicDoctorLinksResponseCopyWithImpl<
  $Res,
  $Val extends ClinicDoctorLinksResponse
>
    implements $ClinicDoctorLinksResponseCopyWith<$Res> {
  _$ClinicDoctorLinksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicDoctorLinksResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctor = null,
    Object? clinics = null,
    Object? totalClinics = null,
  }) {
    return _then(
      _value.copyWith(
            doctor: null == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as DoctorInfo,
            clinics: null == clinics
                ? _value.clinics
                : clinics // ignore: cast_nullable_to_non_nullable
                      as List<ClinicLink>,
            totalClinics: null == totalClinics
                ? _value.totalClinics
                : totalClinics // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of ClinicDoctorLinksResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorInfoCopyWith<$Res> get doctor {
    return $DoctorInfoCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicDoctorLinksResponseImplCopyWith<$Res>
    implements $ClinicDoctorLinksResponseCopyWith<$Res> {
  factory _$$ClinicDoctorLinksResponseImplCopyWith(
    _$ClinicDoctorLinksResponseImpl value,
    $Res Function(_$ClinicDoctorLinksResponseImpl) then,
  ) = __$$ClinicDoctorLinksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DoctorInfo doctor,
    List<ClinicLink> clinics,
    @JsonKey(name: 'total_clinics') int totalClinics,
  });

  @override
  $DoctorInfoCopyWith<$Res> get doctor;
}

/// @nodoc
class __$$ClinicDoctorLinksResponseImplCopyWithImpl<$Res>
    extends
        _$ClinicDoctorLinksResponseCopyWithImpl<
          $Res,
          _$ClinicDoctorLinksResponseImpl
        >
    implements _$$ClinicDoctorLinksResponseImplCopyWith<$Res> {
  __$$ClinicDoctorLinksResponseImplCopyWithImpl(
    _$ClinicDoctorLinksResponseImpl _value,
    $Res Function(_$ClinicDoctorLinksResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicDoctorLinksResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctor = null,
    Object? clinics = null,
    Object? totalClinics = null,
  }) {
    return _then(
      _$ClinicDoctorLinksResponseImpl(
        doctor: null == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as DoctorInfo,
        clinics: null == clinics
            ? _value._clinics
            : clinics // ignore: cast_nullable_to_non_nullable
                  as List<ClinicLink>,
        totalClinics: null == totalClinics
            ? _value.totalClinics
            : totalClinics // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDoctorLinksResponseImpl implements _ClinicDoctorLinksResponse {
  const _$ClinicDoctorLinksResponseImpl({
    required this.doctor,
    required final List<ClinicLink> clinics,
    @JsonKey(name: 'total_clinics') required this.totalClinics,
  }) : _clinics = clinics;

  factory _$ClinicDoctorLinksResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDoctorLinksResponseImplFromJson(json);

  @override
  final DoctorInfo doctor;
  final List<ClinicLink> _clinics;
  @override
  List<ClinicLink> get clinics {
    if (_clinics is EqualUnmodifiableListView) return _clinics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clinics);
  }

  @override
  @JsonKey(name: 'total_clinics')
  final int totalClinics;

  @override
  String toString() {
    return 'ClinicDoctorLinksResponse(doctor: $doctor, clinics: $clinics, totalClinics: $totalClinics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDoctorLinksResponseImpl &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            const DeepCollectionEquality().equals(other._clinics, _clinics) &&
            (identical(other.totalClinics, totalClinics) ||
                other.totalClinics == totalClinics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctor,
    const DeepCollectionEquality().hash(_clinics),
    totalClinics,
  );

  /// Create a copy of ClinicDoctorLinksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDoctorLinksResponseImplCopyWith<_$ClinicDoctorLinksResponseImpl>
  get copyWith =>
      __$$ClinicDoctorLinksResponseImplCopyWithImpl<
        _$ClinicDoctorLinksResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDoctorLinksResponseImplToJson(this);
  }
}

abstract class _ClinicDoctorLinksResponse implements ClinicDoctorLinksResponse {
  const factory _ClinicDoctorLinksResponse({
    required final DoctorInfo doctor,
    required final List<ClinicLink> clinics,
    @JsonKey(name: 'total_clinics') required final int totalClinics,
  }) = _$ClinicDoctorLinksResponseImpl;

  factory _ClinicDoctorLinksResponse.fromJson(Map<String, dynamic> json) =
      _$ClinicDoctorLinksResponseImpl.fromJson;

  @override
  DoctorInfo get doctor;
  @override
  List<ClinicLink> get clinics;
  @override
  @JsonKey(name: 'total_clinics')
  int get totalClinics;

  /// Create a copy of ClinicDoctorLinksResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicDoctorLinksResponseImplCopyWith<_$ClinicDoctorLinksResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) {
  return _DoctorInfo.fromJson(json);
}

/// @nodoc
mixin _$DoctorInfo {
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_code')
  String? get doctorCode => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this DoctorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorInfoCopyWith<DoctorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorInfoCopyWith<$Res> {
  factory $DoctorInfoCopyWith(
    DoctorInfo value,
    $Res Function(DoctorInfo) then,
  ) = _$DoctorInfoCopyWithImpl<$Res, DoctorInfo>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_code') String? doctorCode,
    String? specialization,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? email,
    String? phone,
  });
}

/// @nodoc
class _$DoctorInfoCopyWithImpl<$Res, $Val extends DoctorInfo>
    implements $DoctorInfoCopyWith<$Res> {
  _$DoctorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? doctorCode = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _value.copyWith(
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
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
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorInfoImplCopyWith<$Res>
    implements $DoctorInfoCopyWith<$Res> {
  factory _$$DoctorInfoImplCopyWith(
    _$DoctorInfoImpl value,
    $Res Function(_$DoctorInfoImpl) then,
  ) = __$$DoctorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_code') String? doctorCode,
    String? specialization,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String? email,
    String? phone,
  });
}

/// @nodoc
class __$$DoctorInfoImplCopyWithImpl<$Res>
    extends _$DoctorInfoCopyWithImpl<$Res, _$DoctorInfoImpl>
    implements _$$DoctorInfoImplCopyWith<$Res> {
  __$$DoctorInfoImplCopyWithImpl(
    _$DoctorInfoImpl _value,
    $Res Function(_$DoctorInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? doctorCode = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _$DoctorInfoImpl(
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
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
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorInfoImpl implements _DoctorInfo {
  const _$DoctorInfoImpl({
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_code') this.doctorCode,
    this.specialization,
    @JsonKey(name: 'license_number') this.licenseNumber,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    this.email,
    this.phone,
  });

  factory _$DoctorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorInfoImplFromJson(json);

  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_code')
  final String? doctorCode;
  @override
  final String? specialization;
  @override
  @JsonKey(name: 'license_number')
  final String? licenseNumber;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String? email;
  @override
  final String? phone;

  @override
  String toString() {
    return 'DoctorInfo(doctorId: $doctorId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorInfoImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorCode, doctorCode) ||
                other.doctorCode == doctorCode) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorId,
    doctorCode,
    specialization,
    licenseNumber,
    firstName,
    lastName,
    email,
    phone,
  );

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorInfoImplCopyWith<_$DoctorInfoImpl> get copyWith =>
      __$$DoctorInfoImplCopyWithImpl<_$DoctorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorInfoImplToJson(this);
  }
}

abstract class _DoctorInfo implements DoctorInfo {
  const factory _DoctorInfo({
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_code') final String? doctorCode,
    final String? specialization,
    @JsonKey(name: 'license_number') final String? licenseNumber,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    final String? email,
    final String? phone,
  }) = _$DoctorInfoImpl;

  factory _DoctorInfo.fromJson(Map<String, dynamic> json) =
      _$DoctorInfoImpl.fromJson;

  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_code')
  String? get doctorCode;
  @override
  String? get specialization;
  @override
  @JsonKey(name: 'license_number')
  String? get licenseNumber;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String? get email;
  @override
  String? get phone;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorInfoImplCopyWith<_$DoctorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicLink _$ClinicLinkFromJson(Map<String, dynamic> json) {
  return _ClinicLink.fromJson(json);
}

/// @nodoc
mixin _$ClinicLink {
  @JsonKey(name: 'link_id')
  String get linkId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  ClinicInfo get clinic => throw _privateConstructorUsedError;
  ClinicFees get fees => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ClinicLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicLinkCopyWith<ClinicLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicLinkCopyWith<$Res> {
  factory $ClinicLinkCopyWith(
    ClinicLink value,
    $Res Function(ClinicLink) then,
  ) = _$ClinicLinkCopyWithImpl<$Res, ClinicLink>;
  @useResult
  $Res call({
    @JsonKey(name: 'link_id') String linkId,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    ClinicInfo clinic,
    ClinicFees fees,
    String? notes,
  });

  $ClinicInfoCopyWith<$Res> get clinic;
  $ClinicFeesCopyWith<$Res> get fees;
}

/// @nodoc
class _$ClinicLinkCopyWithImpl<$Res, $Val extends ClinicLink>
    implements $ClinicLinkCopyWith<$Res> {
  _$ClinicLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linkId = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? clinic = null,
    Object? fees = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            linkId: null == linkId
                ? _value.linkId
                : linkId // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            clinic: null == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as ClinicInfo,
            fees: null == fees
                ? _value.fees
                : fees // ignore: cast_nullable_to_non_nullable
                      as ClinicFees,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicInfoCopyWith<$Res> get clinic {
    return $ClinicInfoCopyWith<$Res>(_value.clinic, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicFeesCopyWith<$Res> get fees {
    return $ClinicFeesCopyWith<$Res>(_value.fees, (value) {
      return _then(_value.copyWith(fees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicLinkImplCopyWith<$Res>
    implements $ClinicLinkCopyWith<$Res> {
  factory _$$ClinicLinkImplCopyWith(
    _$ClinicLinkImpl value,
    $Res Function(_$ClinicLinkImpl) then,
  ) = __$$ClinicLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'link_id') String linkId,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    ClinicInfo clinic,
    ClinicFees fees,
    String? notes,
  });

  @override
  $ClinicInfoCopyWith<$Res> get clinic;
  @override
  $ClinicFeesCopyWith<$Res> get fees;
}

/// @nodoc
class __$$ClinicLinkImplCopyWithImpl<$Res>
    extends _$ClinicLinkCopyWithImpl<$Res, _$ClinicLinkImpl>
    implements _$$ClinicLinkImplCopyWith<$Res> {
  __$$ClinicLinkImplCopyWithImpl(
    _$ClinicLinkImpl _value,
    $Res Function(_$ClinicLinkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linkId = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? clinic = null,
    Object? fees = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$ClinicLinkImpl(
        linkId: null == linkId
            ? _value.linkId
            : linkId // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        clinic: null == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as ClinicInfo,
        fees: null == fees
            ? _value.fees
            : fees // ignore: cast_nullable_to_non_nullable
                  as ClinicFees,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicLinkImpl implements _ClinicLink {
  const _$ClinicLinkImpl({
    @JsonKey(name: 'link_id') required this.linkId,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    required this.clinic,
    required this.fees,
    this.notes,
  });

  factory _$ClinicLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicLinkImplFromJson(json);

  @override
  @JsonKey(name: 'link_id')
  final String linkId;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final ClinicInfo clinic;
  @override
  final ClinicFees fees;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ClinicLink(linkId: $linkId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, clinic: $clinic, fees: $fees, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicLinkImpl &&
            (identical(other.linkId, linkId) || other.linkId == linkId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.clinic, clinic) || other.clinic == clinic) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    linkId,
    isActive,
    createdAt,
    updatedAt,
    clinic,
    fees,
    notes,
  );

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicLinkImplCopyWith<_$ClinicLinkImpl> get copyWith =>
      __$$ClinicLinkImplCopyWithImpl<_$ClinicLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicLinkImplToJson(this);
  }
}

abstract class _ClinicLink implements ClinicLink {
  const factory _ClinicLink({
    @JsonKey(name: 'link_id') required final String linkId,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
    required final ClinicInfo clinic,
    required final ClinicFees fees,
    final String? notes,
  }) = _$ClinicLinkImpl;

  factory _ClinicLink.fromJson(Map<String, dynamic> json) =
      _$ClinicLinkImpl.fromJson;

  @override
  @JsonKey(name: 'link_id')
  String get linkId;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  ClinicInfo get clinic;
  @override
  ClinicFees get fees;
  @override
  String? get notes;

  /// Create a copy of ClinicLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicLinkImplCopyWith<_$ClinicLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicInfo _$ClinicInfoFromJson(Map<String, dynamic> json) {
  return _ClinicInfo.fromJson(json);
}

/// @nodoc
mixin _$ClinicInfo {
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_code')
  String get clinicCode => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this ClinicInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicInfoCopyWith<ClinicInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicInfoCopyWith<$Res> {
  factory $ClinicInfoCopyWith(
    ClinicInfo value,
    $Res Function(ClinicInfo) then,
  ) = _$ClinicInfoCopyWithImpl<$Res, ClinicInfo>;
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_id') String clinicId,
    String name,
    @JsonKey(name: 'clinic_code') String clinicCode,
    String? phone,
    String? address,
    String? email,
  });
}

/// @nodoc
class _$ClinicInfoCopyWithImpl<$Res, $Val extends ClinicInfo>
    implements $ClinicInfoCopyWith<$Res> {
  _$ClinicInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? name = null,
    Object? clinicCode = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _value.copyWith(
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicCode: null == clinicCode
                ? _value.clinicCode
                : clinicCode // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicInfoImplCopyWith<$Res>
    implements $ClinicInfoCopyWith<$Res> {
  factory _$$ClinicInfoImplCopyWith(
    _$ClinicInfoImpl value,
    $Res Function(_$ClinicInfoImpl) then,
  ) = __$$ClinicInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_id') String clinicId,
    String name,
    @JsonKey(name: 'clinic_code') String clinicCode,
    String? phone,
    String? address,
    String? email,
  });
}

/// @nodoc
class __$$ClinicInfoImplCopyWithImpl<$Res>
    extends _$ClinicInfoCopyWithImpl<$Res, _$ClinicInfoImpl>
    implements _$$ClinicInfoImplCopyWith<$Res> {
  __$$ClinicInfoImplCopyWithImpl(
    _$ClinicInfoImpl _value,
    $Res Function(_$ClinicInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? name = null,
    Object? clinicCode = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _$ClinicInfoImpl(
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicCode: null == clinicCode
            ? _value.clinicCode
            : clinicCode // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicInfoImpl implements _ClinicInfo {
  const _$ClinicInfoImpl({
    @JsonKey(name: 'clinic_id') required this.clinicId,
    required this.name,
    @JsonKey(name: 'clinic_code') required this.clinicCode,
    this.phone,
    this.address,
    this.email,
  });

  factory _$ClinicInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicInfoImplFromJson(json);

  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  final String name;
  @override
  @JsonKey(name: 'clinic_code')
  final String clinicCode;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? email;

  @override
  String toString() {
    return 'ClinicInfo(clinicId: $clinicId, name: $name, clinicCode: $clinicCode, phone: $phone, address: $address, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicInfoImpl &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.clinicCode, clinicCode) ||
                other.clinicCode == clinicCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinicId,
    name,
    clinicCode,
    phone,
    address,
    email,
  );

  /// Create a copy of ClinicInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicInfoImplCopyWith<_$ClinicInfoImpl> get copyWith =>
      __$$ClinicInfoImplCopyWithImpl<_$ClinicInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicInfoImplToJson(this);
  }
}

abstract class _ClinicInfo implements ClinicInfo {
  const factory _ClinicInfo({
    @JsonKey(name: 'clinic_id') required final String clinicId,
    required final String name,
    @JsonKey(name: 'clinic_code') required final String clinicCode,
    final String? phone,
    final String? address,
    final String? email,
  }) = _$ClinicInfoImpl;

  factory _ClinicInfo.fromJson(Map<String, dynamic> json) =
      _$ClinicInfoImpl.fromJson;

  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  String get name;
  @override
  @JsonKey(name: 'clinic_code')
  String get clinicCode;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  String? get email;

  /// Create a copy of ClinicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicInfoImplCopyWith<_$ClinicInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicFees _$ClinicFeesFromJson(Map<String, dynamic> json) {
  return _ClinicFees.fromJson(json);
}

/// @nodoc
mixin _$ClinicFees {
  @JsonKey(name: 'consultation_fee_offline')
  double? get consultationFeeOffline => throw _privateConstructorUsedError;
  @JsonKey(name: 'consultation_fee_online')
  double? get consultationFeeOnline => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_fee')
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_days')
  int? get followUpDays => throw _privateConstructorUsedError;

  /// Serializes this ClinicFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicFeesCopyWith<ClinicFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicFeesCopyWith<$Res> {
  factory $ClinicFeesCopyWith(
    ClinicFees value,
    $Res Function(ClinicFees) then,
  ) = _$ClinicFeesCopyWithImpl<$Res, ClinicFees>;
  @useResult
  $Res call({
    @JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') double? followUpFee,
    @JsonKey(name: 'follow_up_days') int? followUpDays,
  });
}

/// @nodoc
class _$ClinicFeesCopyWithImpl<$Res, $Val extends ClinicFees>
    implements $ClinicFeesCopyWith<$Res> {
  _$ClinicFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationFeeOffline = freezed,
    Object? consultationFeeOnline = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _value.copyWith(
            consultationFeeOffline: freezed == consultationFeeOffline
                ? _value.consultationFeeOffline
                : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
                      as double?,
            consultationFeeOnline: freezed == consultationFeeOnline
                ? _value.consultationFeeOnline
                : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ClinicFeesImplCopyWith<$Res>
    implements $ClinicFeesCopyWith<$Res> {
  factory _$$ClinicFeesImplCopyWith(
    _$ClinicFeesImpl value,
    $Res Function(_$ClinicFeesImpl) then,
  ) = __$$ClinicFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'consultation_fee_offline') double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') double? followUpFee,
    @JsonKey(name: 'follow_up_days') int? followUpDays,
  });
}

/// @nodoc
class __$$ClinicFeesImplCopyWithImpl<$Res>
    extends _$ClinicFeesCopyWithImpl<$Res, _$ClinicFeesImpl>
    implements _$$ClinicFeesImplCopyWith<$Res> {
  __$$ClinicFeesImplCopyWithImpl(
    _$ClinicFeesImpl _value,
    $Res Function(_$ClinicFeesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationFeeOffline = freezed,
    Object? consultationFeeOnline = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _$ClinicFeesImpl(
        consultationFeeOffline: freezed == consultationFeeOffline
            ? _value.consultationFeeOffline
            : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
                  as double?,
        consultationFeeOnline: freezed == consultationFeeOnline
            ? _value.consultationFeeOnline
            : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
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
class _$ClinicFeesImpl implements _ClinicFees {
  const _$ClinicFeesImpl({
    @JsonKey(name: 'consultation_fee_offline') this.consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online') this.consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') this.followUpFee,
    @JsonKey(name: 'follow_up_days') this.followUpDays,
  });

  factory _$ClinicFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicFeesImplFromJson(json);

  @override
  @JsonKey(name: 'consultation_fee_offline')
  final double? consultationFeeOffline;
  @override
  @JsonKey(name: 'consultation_fee_online')
  final double? consultationFeeOnline;
  @override
  @JsonKey(name: 'follow_up_fee')
  final double? followUpFee;
  @override
  @JsonKey(name: 'follow_up_days')
  final int? followUpDays;

  @override
  String toString() {
    return 'ClinicFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicFeesImpl &&
            (identical(other.consultationFeeOffline, consultationFeeOffline) ||
                other.consultationFeeOffline == consultationFeeOffline) &&
            (identical(other.consultationFeeOnline, consultationFeeOnline) ||
                other.consultationFeeOnline == consultationFeeOnline) &&
            (identical(other.followUpFee, followUpFee) ||
                other.followUpFee == followUpFee) &&
            (identical(other.followUpDays, followUpDays) ||
                other.followUpDays == followUpDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    consultationFeeOffline,
    consultationFeeOnline,
    followUpFee,
    followUpDays,
  );

  /// Create a copy of ClinicFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicFeesImplCopyWith<_$ClinicFeesImpl> get copyWith =>
      __$$ClinicFeesImplCopyWithImpl<_$ClinicFeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicFeesImplToJson(this);
  }
}

abstract class _ClinicFees implements ClinicFees {
  const factory _ClinicFees({
    @JsonKey(name: 'consultation_fee_offline')
    final double? consultationFeeOffline,
    @JsonKey(name: 'consultation_fee_online')
    final double? consultationFeeOnline,
    @JsonKey(name: 'follow_up_fee') final double? followUpFee,
    @JsonKey(name: 'follow_up_days') final int? followUpDays,
  }) = _$ClinicFeesImpl;

  factory _ClinicFees.fromJson(Map<String, dynamic> json) =
      _$ClinicFeesImpl.fromJson;

  @override
  @JsonKey(name: 'consultation_fee_offline')
  double? get consultationFeeOffline;
  @override
  @JsonKey(name: 'consultation_fee_online')
  double? get consultationFeeOnline;
  @override
  @JsonKey(name: 'follow_up_fee')
  double? get followUpFee;
  @override
  @JsonKey(name: 'follow_up_days')
  int? get followUpDays;

  /// Create a copy of ClinicFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicFeesImplCopyWith<_$ClinicFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
