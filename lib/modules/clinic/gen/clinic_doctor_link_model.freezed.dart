// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_doctor_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClinicInfo _$ClinicInfoFromJson(Map<String, dynamic> json) {
  return _ClinicInfo.fromJson(json);
}

/// @nodoc
mixin _$ClinicInfo {
  @JsonKey(name: "clinic_code")
  String get clinicCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: "clinic_code") String clinicCode, String name});
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
  $Res call({Object? clinicCode = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            clinicCode: null == clinicCode
                ? _value.clinicCode
                : clinicCode // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
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
  $Res call({@JsonKey(name: "clinic_code") String clinicCode, String name});
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
  $Res call({Object? clinicCode = null, Object? name = null}) {
    return _then(
      _$ClinicInfoImpl(
        clinicCode: null == clinicCode
            ? _value.clinicCode
            : clinicCode // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicInfoImpl implements _ClinicInfo {
  const _$ClinicInfoImpl({
    @JsonKey(name: "clinic_code") required this.clinicCode,
    required this.name,
  });

  factory _$ClinicInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicInfoImplFromJson(json);

  @override
  @JsonKey(name: "clinic_code")
  final String clinicCode;
  @override
  final String name;

  @override
  String toString() {
    return 'ClinicInfo(clinicCode: $clinicCode, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicInfoImpl &&
            (identical(other.clinicCode, clinicCode) ||
                other.clinicCode == clinicCode) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clinicCode, name);

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
    @JsonKey(name: "clinic_code") required final String clinicCode,
    required final String name,
  }) = _$ClinicInfoImpl;

  factory _ClinicInfo.fromJson(Map<String, dynamic> json) =
      _$ClinicInfoImpl.fromJson;

  @override
  @JsonKey(name: "clinic_code")
  String get clinicCode;
  @override
  String get name;

  /// Create a copy of ClinicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicInfoImplCopyWith<_$ClinicInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) {
  return _DoctorInfo.fromJson(json);
}

/// @nodoc
mixin _$DoctorInfo {
  @JsonKey(name: "doctor_code")
  String get doctorCode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

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
    @JsonKey(name: "doctor_code") String doctorCode,
    String email,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String specialization,
    String username,
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
    Object? doctorCode = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? specialization = null,
    Object? username = null,
  }) {
    return _then(
      _value.copyWith(
            doctorCode: null == doctorCode
                ? _value.doctorCode
                : doctorCode // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            specialization: null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
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
    @JsonKey(name: "doctor_code") String doctorCode,
    String email,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String specialization,
    String username,
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
    Object? doctorCode = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? specialization = null,
    Object? username = null,
  }) {
    return _then(
      _$DoctorInfoImpl(
        doctorCode: null == doctorCode
            ? _value.doctorCode
            : doctorCode // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        specialization: null == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorInfoImpl implements _DoctorInfo {
  const _$DoctorInfoImpl({
    @JsonKey(name: "doctor_code") required this.doctorCode,
    required this.email,
    @JsonKey(name: "first_name") required this.firstName,
    @JsonKey(name: "last_name") required this.lastName,
    required this.specialization,
    required this.username,
  });

  factory _$DoctorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorInfoImplFromJson(json);

  @override
  @JsonKey(name: "doctor_code")
  final String doctorCode;
  @override
  final String email;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  final String specialization;
  @override
  final String username;

  @override
  String toString() {
    return 'DoctorInfo(doctorCode: $doctorCode, email: $email, firstName: $firstName, lastName: $lastName, specialization: $specialization, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorInfoImpl &&
            (identical(other.doctorCode, doctorCode) ||
                other.doctorCode == doctorCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    doctorCode,
    email,
    firstName,
    lastName,
    specialization,
    username,
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
    @JsonKey(name: "doctor_code") required final String doctorCode,
    required final String email,
    @JsonKey(name: "first_name") required final String firstName,
    @JsonKey(name: "last_name") required final String lastName,
    required final String specialization,
    required final String username,
  }) = _$DoctorInfoImpl;

  factory _DoctorInfo.fromJson(Map<String, dynamic> json) =
      _$DoctorInfoImpl.fromJson;

  @override
  @JsonKey(name: "doctor_code")
  String get doctorCode;
  @override
  String get email;
  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  String get specialization;
  @override
  String get username;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorInfoImplCopyWith<_$DoctorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicDoctorLinkModel _$ClinicDoctorLinkModelFromJson(
  Map<String, dynamic> json,
) {
  return _ClinicDoctorLinkModel.fromJson(json);
}

/// @nodoc
mixin _$ClinicDoctorLinkModel {
  ClinicInfo get clinic => throw _privateConstructorUsedError;
  DoctorInfo get doctor => throw _privateConstructorUsedError;

  /// Serializes this ClinicDoctorLinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicDoctorLinkModelCopyWith<ClinicDoctorLinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDoctorLinkModelCopyWith<$Res> {
  factory $ClinicDoctorLinkModelCopyWith(
    ClinicDoctorLinkModel value,
    $Res Function(ClinicDoctorLinkModel) then,
  ) = _$ClinicDoctorLinkModelCopyWithImpl<$Res, ClinicDoctorLinkModel>;
  @useResult
  $Res call({ClinicInfo clinic, DoctorInfo doctor});

  $ClinicInfoCopyWith<$Res> get clinic;
  $DoctorInfoCopyWith<$Res> get doctor;
}

/// @nodoc
class _$ClinicDoctorLinkModelCopyWithImpl<
  $Res,
  $Val extends ClinicDoctorLinkModel
>
    implements $ClinicDoctorLinkModelCopyWith<$Res> {
  _$ClinicDoctorLinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? clinic = null, Object? doctor = null}) {
    return _then(
      _value.copyWith(
            clinic: null == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as ClinicInfo,
            doctor: null == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as DoctorInfo,
          )
          as $Val,
    );
  }

  /// Create a copy of ClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicInfoCopyWith<$Res> get clinic {
    return $ClinicInfoCopyWith<$Res>(_value.clinic, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }

  /// Create a copy of ClinicDoctorLinkModel
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
abstract class _$$ClinicDoctorLinkModelImplCopyWith<$Res>
    implements $ClinicDoctorLinkModelCopyWith<$Res> {
  factory _$$ClinicDoctorLinkModelImplCopyWith(
    _$ClinicDoctorLinkModelImpl value,
    $Res Function(_$ClinicDoctorLinkModelImpl) then,
  ) = __$$ClinicDoctorLinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ClinicInfo clinic, DoctorInfo doctor});

  @override
  $ClinicInfoCopyWith<$Res> get clinic;
  @override
  $DoctorInfoCopyWith<$Res> get doctor;
}

/// @nodoc
class __$$ClinicDoctorLinkModelImplCopyWithImpl<$Res>
    extends
        _$ClinicDoctorLinkModelCopyWithImpl<$Res, _$ClinicDoctorLinkModelImpl>
    implements _$$ClinicDoctorLinkModelImplCopyWith<$Res> {
  __$$ClinicDoctorLinkModelImplCopyWithImpl(
    _$ClinicDoctorLinkModelImpl _value,
    $Res Function(_$ClinicDoctorLinkModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? clinic = null, Object? doctor = null}) {
    return _then(
      _$ClinicDoctorLinkModelImpl(
        clinic: null == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as ClinicInfo,
        doctor: null == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as DoctorInfo,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDoctorLinkModelImpl implements _ClinicDoctorLinkModel {
  const _$ClinicDoctorLinkModelImpl({
    required this.clinic,
    required this.doctor,
  });

  factory _$ClinicDoctorLinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDoctorLinkModelImplFromJson(json);

  @override
  final ClinicInfo clinic;
  @override
  final DoctorInfo doctor;

  @override
  String toString() {
    return 'ClinicDoctorLinkModel(clinic: $clinic, doctor: $doctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDoctorLinkModelImpl &&
            (identical(other.clinic, clinic) || other.clinic == clinic) &&
            (identical(other.doctor, doctor) || other.doctor == doctor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clinic, doctor);

  /// Create a copy of ClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDoctorLinkModelImplCopyWith<_$ClinicDoctorLinkModelImpl>
  get copyWith =>
      __$$ClinicDoctorLinkModelImplCopyWithImpl<_$ClinicDoctorLinkModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDoctorLinkModelImplToJson(this);
  }
}

abstract class _ClinicDoctorLinkModel implements ClinicDoctorLinkModel {
  const factory _ClinicDoctorLinkModel({
    required final ClinicInfo clinic,
    required final DoctorInfo doctor,
  }) = _$ClinicDoctorLinkModelImpl;

  factory _ClinicDoctorLinkModel.fromJson(Map<String, dynamic> json) =
      _$ClinicDoctorLinkModelImpl.fromJson;

  @override
  ClinicInfo get clinic;
  @override
  DoctorInfo get doctor;

  /// Create a copy of ClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicDoctorLinkModelImplCopyWith<_$ClinicDoctorLinkModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateClinicDoctorLinkModel _$CreateClinicDoctorLinkModelFromJson(
  Map<String, dynamic> json,
) {
  return _CreateClinicDoctorLinkModel.fromJson(json);
}

/// @nodoc
mixin _$CreateClinicDoctorLinkModel {
  List<ClinicDoctorLinkModel> get links => throw _privateConstructorUsedError;

  /// Serializes this CreateClinicDoctorLinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateClinicDoctorLinkModelCopyWith<CreateClinicDoctorLinkModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateClinicDoctorLinkModelCopyWith<$Res> {
  factory $CreateClinicDoctorLinkModelCopyWith(
    CreateClinicDoctorLinkModel value,
    $Res Function(CreateClinicDoctorLinkModel) then,
  ) =
      _$CreateClinicDoctorLinkModelCopyWithImpl<
        $Res,
        CreateClinicDoctorLinkModel
      >;
  @useResult
  $Res call({List<ClinicDoctorLinkModel> links});
}

/// @nodoc
class _$CreateClinicDoctorLinkModelCopyWithImpl<
  $Res,
  $Val extends CreateClinicDoctorLinkModel
>
    implements $CreateClinicDoctorLinkModelCopyWith<$Res> {
  _$CreateClinicDoctorLinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? links = null}) {
    return _then(
      _value.copyWith(
            links: null == links
                ? _value.links
                : links // ignore: cast_nullable_to_non_nullable
                      as List<ClinicDoctorLinkModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateClinicDoctorLinkModelImplCopyWith<$Res>
    implements $CreateClinicDoctorLinkModelCopyWith<$Res> {
  factory _$$CreateClinicDoctorLinkModelImplCopyWith(
    _$CreateClinicDoctorLinkModelImpl value,
    $Res Function(_$CreateClinicDoctorLinkModelImpl) then,
  ) = __$$CreateClinicDoctorLinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClinicDoctorLinkModel> links});
}

/// @nodoc
class __$$CreateClinicDoctorLinkModelImplCopyWithImpl<$Res>
    extends
        _$CreateClinicDoctorLinkModelCopyWithImpl<
          $Res,
          _$CreateClinicDoctorLinkModelImpl
        >
    implements _$$CreateClinicDoctorLinkModelImplCopyWith<$Res> {
  __$$CreateClinicDoctorLinkModelImplCopyWithImpl(
    _$CreateClinicDoctorLinkModelImpl _value,
    $Res Function(_$CreateClinicDoctorLinkModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? links = null}) {
    return _then(
      _$CreateClinicDoctorLinkModelImpl(
        links: null == links
            ? _value._links
            : links // ignore: cast_nullable_to_non_nullable
                  as List<ClinicDoctorLinkModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateClinicDoctorLinkModelImpl
    implements _CreateClinicDoctorLinkModel {
  const _$CreateClinicDoctorLinkModelImpl({
    required final List<ClinicDoctorLinkModel> links,
  }) : _links = links;

  factory _$CreateClinicDoctorLinkModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateClinicDoctorLinkModelImplFromJson(json);

  final List<ClinicDoctorLinkModel> _links;
  @override
  List<ClinicDoctorLinkModel> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'CreateClinicDoctorLinkModel(links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateClinicDoctorLinkModelImpl &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_links));

  /// Create a copy of CreateClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateClinicDoctorLinkModelImplCopyWith<_$CreateClinicDoctorLinkModelImpl>
  get copyWith =>
      __$$CreateClinicDoctorLinkModelImplCopyWithImpl<
        _$CreateClinicDoctorLinkModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateClinicDoctorLinkModelImplToJson(this);
  }
}

abstract class _CreateClinicDoctorLinkModel
    implements CreateClinicDoctorLinkModel {
  const factory _CreateClinicDoctorLinkModel({
    required final List<ClinicDoctorLinkModel> links,
  }) = _$CreateClinicDoctorLinkModelImpl;

  factory _CreateClinicDoctorLinkModel.fromJson(Map<String, dynamic> json) =
      _$CreateClinicDoctorLinkModelImpl.fromJson;

  @override
  List<ClinicDoctorLinkModel> get links;

  /// Create a copy of CreateClinicDoctorLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateClinicDoctorLinkModelImplCopyWith<_$CreateClinicDoctorLinkModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ClinicDoctorLinkResponse _$ClinicDoctorLinkResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ClinicDoctorLinkResponse.fromJson(json);
}

/// @nodoc
mixin _$ClinicDoctorLinkResponse {
  @JsonKey(name: "link_id")
  String? get linkId => throw _privateConstructorUsedError;
  ClinicInfo get clinic => throw _privateConstructorUsedError;
  DoctorFullInfo get doctor => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee_offline")
  double? get consultationFeeOffline => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee_online")
  double? get consultationFeeOnline => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int? get followUpDays => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this ClinicDoctorLinkResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicDoctorLinkResponseCopyWith<ClinicDoctorLinkResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDoctorLinkResponseCopyWith<$Res> {
  factory $ClinicDoctorLinkResponseCopyWith(
    ClinicDoctorLinkResponse value,
    $Res Function(ClinicDoctorLinkResponse) then,
  ) = _$ClinicDoctorLinkResponseCopyWithImpl<$Res, ClinicDoctorLinkResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "link_id") String? linkId,
    ClinicInfo clinic,
    DoctorFullInfo doctor,
    @JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
    String? notes,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
  });

  $ClinicInfoCopyWith<$Res> get clinic;
  $DoctorFullInfoCopyWith<$Res> get doctor;
}

/// @nodoc
class _$ClinicDoctorLinkResponseCopyWithImpl<
  $Res,
  $Val extends ClinicDoctorLinkResponse
>
    implements $ClinicDoctorLinkResponseCopyWith<$Res> {
  _$ClinicDoctorLinkResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linkId = freezed,
    Object? clinic = null,
    Object? doctor = null,
    Object? consultationFeeOffline = freezed,
    Object? consultationFeeOnline = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _value.copyWith(
            linkId: freezed == linkId
                ? _value.linkId
                : linkId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinic: null == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as ClinicInfo,
            doctor: null == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as DoctorFullInfo,
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
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicInfoCopyWith<$Res> get clinic {
    return $ClinicInfoCopyWith<$Res>(_value.clinic, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorFullInfoCopyWith<$Res> get doctor {
    return $DoctorFullInfoCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicDoctorLinkResponseImplCopyWith<$Res>
    implements $ClinicDoctorLinkResponseCopyWith<$Res> {
  factory _$$ClinicDoctorLinkResponseImplCopyWith(
    _$ClinicDoctorLinkResponseImpl value,
    $Res Function(_$ClinicDoctorLinkResponseImpl) then,
  ) = __$$ClinicDoctorLinkResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "link_id") String? linkId,
    ClinicInfo clinic,
    DoctorFullInfo doctor,
    @JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
    String? notes,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
  });

  @override
  $ClinicInfoCopyWith<$Res> get clinic;
  @override
  $DoctorFullInfoCopyWith<$Res> get doctor;
}

/// @nodoc
class __$$ClinicDoctorLinkResponseImplCopyWithImpl<$Res>
    extends
        _$ClinicDoctorLinkResponseCopyWithImpl<
          $Res,
          _$ClinicDoctorLinkResponseImpl
        >
    implements _$$ClinicDoctorLinkResponseImplCopyWith<$Res> {
  __$$ClinicDoctorLinkResponseImplCopyWithImpl(
    _$ClinicDoctorLinkResponseImpl _value,
    $Res Function(_$ClinicDoctorLinkResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linkId = freezed,
    Object? clinic = null,
    Object? doctor = null,
    Object? consultationFeeOffline = freezed,
    Object? consultationFeeOnline = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _$ClinicDoctorLinkResponseImpl(
        linkId: freezed == linkId
            ? _value.linkId
            : linkId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinic: null == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as ClinicInfo,
        doctor: null == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as DoctorFullInfo,
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
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDoctorLinkResponseImpl implements _ClinicDoctorLinkResponse {
  const _$ClinicDoctorLinkResponseImpl({
    @JsonKey(name: "link_id") this.linkId,
    required this.clinic,
    required this.doctor,
    @JsonKey(name: "consultation_fee_offline") this.consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") this.consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") this.followUpFee,
    @JsonKey(name: "follow_up_days") this.followUpDays,
    this.notes,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "updated_at") this.updatedAt,
    @JsonKey(name: "is_active") this.isActive,
  });

  factory _$ClinicDoctorLinkResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDoctorLinkResponseImplFromJson(json);

  @override
  @JsonKey(name: "link_id")
  final String? linkId;
  @override
  final ClinicInfo clinic;
  @override
  final DoctorFullInfo doctor;
  @override
  @JsonKey(name: "consultation_fee_offline")
  final double? consultationFeeOffline;
  @override
  @JsonKey(name: "consultation_fee_online")
  final double? consultationFeeOnline;
  @override
  @JsonKey(name: "follow_up_fee")
  final double? followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  final int? followUpDays;
  @override
  final String? notes;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;

  @override
  String toString() {
    return 'ClinicDoctorLinkResponse(linkId: $linkId, clinic: $clinic, doctor: $doctor, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDoctorLinkResponseImpl &&
            (identical(other.linkId, linkId) || other.linkId == linkId) &&
            (identical(other.clinic, clinic) || other.clinic == clinic) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.consultationFeeOffline, consultationFeeOffline) ||
                other.consultationFeeOffline == consultationFeeOffline) &&
            (identical(other.consultationFeeOnline, consultationFeeOnline) ||
                other.consultationFeeOnline == consultationFeeOnline) &&
            (identical(other.followUpFee, followUpFee) ||
                other.followUpFee == followUpFee) &&
            (identical(other.followUpDays, followUpDays) ||
                other.followUpDays == followUpDays) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    linkId,
    clinic,
    doctor,
    consultationFeeOffline,
    consultationFeeOnline,
    followUpFee,
    followUpDays,
    notes,
    createdAt,
    updatedAt,
    isActive,
  );

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDoctorLinkResponseImplCopyWith<_$ClinicDoctorLinkResponseImpl>
  get copyWith =>
      __$$ClinicDoctorLinkResponseImplCopyWithImpl<
        _$ClinicDoctorLinkResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDoctorLinkResponseImplToJson(this);
  }
}

abstract class _ClinicDoctorLinkResponse implements ClinicDoctorLinkResponse {
  const factory _ClinicDoctorLinkResponse({
    @JsonKey(name: "link_id") final String? linkId,
    required final ClinicInfo clinic,
    required final DoctorFullInfo doctor,
    @JsonKey(name: "consultation_fee_offline")
    final double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online")
    final double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") final double? followUpFee,
    @JsonKey(name: "follow_up_days") final int? followUpDays,
    final String? notes,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "updated_at") final String? updatedAt,
    @JsonKey(name: "is_active") final bool? isActive,
  }) = _$ClinicDoctorLinkResponseImpl;

  factory _ClinicDoctorLinkResponse.fromJson(Map<String, dynamic> json) =
      _$ClinicDoctorLinkResponseImpl.fromJson;

  @override
  @JsonKey(name: "link_id")
  String? get linkId;
  @override
  ClinicInfo get clinic;
  @override
  DoctorFullInfo get doctor;
  @override
  @JsonKey(name: "consultation_fee_offline")
  double? get consultationFeeOffline;
  @override
  @JsonKey(name: "consultation_fee_online")
  double? get consultationFeeOnline;
  @override
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  int? get followUpDays;
  @override
  String? get notes;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;

  /// Create a copy of ClinicDoctorLinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicDoctorLinkResponseImplCopyWith<_$ClinicDoctorLinkResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DoctorFullInfo _$DoctorFullInfoFromJson(Map<String, dynamic> json) {
  return _DoctorFullInfo.fromJson(json);
}

/// @nodoc
mixin _$DoctorFullInfo {
  @JsonKey(name: "doctor_id")
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_code")
  String get doctorCode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee")
  double? get consultationFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int? get followUpDays => throw _privateConstructorUsedError;

  /// Serializes this DoctorFullInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorFullInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorFullInfoCopyWith<DoctorFullInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorFullInfoCopyWith<$Res> {
  factory $DoctorFullInfoCopyWith(
    DoctorFullInfo value,
    $Res Function(DoctorFullInfo) then,
  ) = _$DoctorFullInfoCopyWithImpl<$Res, DoctorFullInfo>;
  @useResult
  $Res call({
    @JsonKey(name: "doctor_id") String? doctorId,
    @JsonKey(name: "doctor_code") String doctorCode,
    String email,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String specialization,
    String username,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  });
}

/// @nodoc
class _$DoctorFullInfoCopyWithImpl<$Res, $Val extends DoctorFullInfo>
    implements $DoctorFullInfoCopyWith<$Res> {
  _$DoctorFullInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorFullInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = freezed,
    Object? doctorCode = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? specialization = null,
    Object? username = null,
    Object? licenseNumber = freezed,
    Object? consultationFee = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _value.copyWith(
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorCode: null == doctorCode
                ? _value.doctorCode
                : doctorCode // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            specialization: null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$DoctorFullInfoImplCopyWith<$Res>
    implements $DoctorFullInfoCopyWith<$Res> {
  factory _$$DoctorFullInfoImplCopyWith(
    _$DoctorFullInfoImpl value,
    $Res Function(_$DoctorFullInfoImpl) then,
  ) = __$$DoctorFullInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "doctor_id") String? doctorId,
    @JsonKey(name: "doctor_code") String doctorCode,
    String email,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String specialization,
    String username,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  });
}

/// @nodoc
class __$$DoctorFullInfoImplCopyWithImpl<$Res>
    extends _$DoctorFullInfoCopyWithImpl<$Res, _$DoctorFullInfoImpl>
    implements _$$DoctorFullInfoImplCopyWith<$Res> {
  __$$DoctorFullInfoImplCopyWithImpl(
    _$DoctorFullInfoImpl _value,
    $Res Function(_$DoctorFullInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorFullInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = freezed,
    Object? doctorCode = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? specialization = null,
    Object? username = null,
    Object? licenseNumber = freezed,
    Object? consultationFee = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _$DoctorFullInfoImpl(
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorCode: null == doctorCode
            ? _value.doctorCode
            : doctorCode // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        specialization: null == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$DoctorFullInfoImpl implements _DoctorFullInfo {
  const _$DoctorFullInfoImpl({
    @JsonKey(name: "doctor_id") this.doctorId,
    @JsonKey(name: "doctor_code") required this.doctorCode,
    required this.email,
    @JsonKey(name: "first_name") required this.firstName,
    @JsonKey(name: "last_name") required this.lastName,
    required this.specialization,
    required this.username,
    @JsonKey(name: "license_number") this.licenseNumber,
    @JsonKey(name: "consultation_fee") this.consultationFee,
    @JsonKey(name: "follow_up_fee") this.followUpFee,
    @JsonKey(name: "follow_up_days") this.followUpDays,
  });

  factory _$DoctorFullInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorFullInfoImplFromJson(json);

  @override
  @JsonKey(name: "doctor_id")
  final String? doctorId;
  @override
  @JsonKey(name: "doctor_code")
  final String doctorCode;
  @override
  final String email;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  final String specialization;
  @override
  final String username;
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
    return 'DoctorFullInfo(doctorId: $doctorId, doctorCode: $doctorCode, email: $email, firstName: $firstName, lastName: $lastName, specialization: $specialization, username: $username, licenseNumber: $licenseNumber, consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorFullInfoImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorCode, doctorCode) ||
                other.doctorCode == doctorCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.username, username) ||
                other.username == username) &&
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
    doctorId,
    doctorCode,
    email,
    firstName,
    lastName,
    specialization,
    username,
    licenseNumber,
    consultationFee,
    followUpFee,
    followUpDays,
  );

  /// Create a copy of DoctorFullInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorFullInfoImplCopyWith<_$DoctorFullInfoImpl> get copyWith =>
      __$$DoctorFullInfoImplCopyWithImpl<_$DoctorFullInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorFullInfoImplToJson(this);
  }
}

abstract class _DoctorFullInfo implements DoctorFullInfo {
  const factory _DoctorFullInfo({
    @JsonKey(name: "doctor_id") final String? doctorId,
    @JsonKey(name: "doctor_code") required final String doctorCode,
    required final String email,
    @JsonKey(name: "first_name") required final String firstName,
    @JsonKey(name: "last_name") required final String lastName,
    required final String specialization,
    required final String username,
    @JsonKey(name: "license_number") final String? licenseNumber,
    @JsonKey(name: "consultation_fee") final double? consultationFee,
    @JsonKey(name: "follow_up_fee") final double? followUpFee,
    @JsonKey(name: "follow_up_days") final int? followUpDays,
  }) = _$DoctorFullInfoImpl;

  factory _DoctorFullInfo.fromJson(Map<String, dynamic> json) =
      _$DoctorFullInfoImpl.fromJson;

  @override
  @JsonKey(name: "doctor_id")
  String? get doctorId;
  @override
  @JsonKey(name: "doctor_code")
  String get doctorCode;
  @override
  String get email;
  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  String get specialization;
  @override
  String get username;
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

  /// Create a copy of DoctorFullInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorFullInfoImplCopyWith<_$DoctorFullInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateClinicDoctorLinkWithFees _$CreateClinicDoctorLinkWithFeesFromJson(
  Map<String, dynamic> json,
) {
  return _CreateClinicDoctorLinkWithFees.fromJson(json);
}

/// @nodoc
mixin _$CreateClinicDoctorLinkWithFees {
  @JsonKey(name: "clinic_id")
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_id")
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee_offline")
  double get consultationFeeOffline => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee_online")
  double get consultationFeeOnline => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int get followUpDays => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this CreateClinicDoctorLinkWithFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateClinicDoctorLinkWithFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateClinicDoctorLinkWithFeesCopyWith<CreateClinicDoctorLinkWithFees>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateClinicDoctorLinkWithFeesCopyWith<$Res> {
  factory $CreateClinicDoctorLinkWithFeesCopyWith(
    CreateClinicDoctorLinkWithFees value,
    $Res Function(CreateClinicDoctorLinkWithFees) then,
  ) =
      _$CreateClinicDoctorLinkWithFeesCopyWithImpl<
        $Res,
        CreateClinicDoctorLinkWithFees
      >;
  @useResult
  $Res call({
    @JsonKey(name: "clinic_id") String clinicId,
    @JsonKey(name: "doctor_id") String doctorId,
    @JsonKey(name: "consultation_fee_offline") double consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double followUpFee,
    @JsonKey(name: "follow_up_days") int followUpDays,
    String? notes,
  });
}

/// @nodoc
class _$CreateClinicDoctorLinkWithFeesCopyWithImpl<
  $Res,
  $Val extends CreateClinicDoctorLinkWithFees
>
    implements $CreateClinicDoctorLinkWithFeesCopyWith<$Res> {
  _$CreateClinicDoctorLinkWithFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateClinicDoctorLinkWithFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? doctorId = null,
    Object? consultationFeeOffline = null,
    Object? consultationFeeOnline = null,
    Object? followUpFee = null,
    Object? followUpDays = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            consultationFeeOffline: null == consultationFeeOffline
                ? _value.consultationFeeOffline
                : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
                      as double,
            consultationFeeOnline: null == consultationFeeOnline
                ? _value.consultationFeeOnline
                : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
                      as double,
            followUpFee: null == followUpFee
                ? _value.followUpFee
                : followUpFee // ignore: cast_nullable_to_non_nullable
                      as double,
            followUpDays: null == followUpDays
                ? _value.followUpDays
                : followUpDays // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateClinicDoctorLinkWithFeesImplCopyWith<$Res>
    implements $CreateClinicDoctorLinkWithFeesCopyWith<$Res> {
  factory _$$CreateClinicDoctorLinkWithFeesImplCopyWith(
    _$CreateClinicDoctorLinkWithFeesImpl value,
    $Res Function(_$CreateClinicDoctorLinkWithFeesImpl) then,
  ) = __$$CreateClinicDoctorLinkWithFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "clinic_id") String clinicId,
    @JsonKey(name: "doctor_id") String doctorId,
    @JsonKey(name: "consultation_fee_offline") double consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double followUpFee,
    @JsonKey(name: "follow_up_days") int followUpDays,
    String? notes,
  });
}

/// @nodoc
class __$$CreateClinicDoctorLinkWithFeesImplCopyWithImpl<$Res>
    extends
        _$CreateClinicDoctorLinkWithFeesCopyWithImpl<
          $Res,
          _$CreateClinicDoctorLinkWithFeesImpl
        >
    implements _$$CreateClinicDoctorLinkWithFeesImplCopyWith<$Res> {
  __$$CreateClinicDoctorLinkWithFeesImplCopyWithImpl(
    _$CreateClinicDoctorLinkWithFeesImpl _value,
    $Res Function(_$CreateClinicDoctorLinkWithFeesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateClinicDoctorLinkWithFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? doctorId = null,
    Object? consultationFeeOffline = null,
    Object? consultationFeeOnline = null,
    Object? followUpFee = null,
    Object? followUpDays = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$CreateClinicDoctorLinkWithFeesImpl(
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        consultationFeeOffline: null == consultationFeeOffline
            ? _value.consultationFeeOffline
            : consultationFeeOffline // ignore: cast_nullable_to_non_nullable
                  as double,
        consultationFeeOnline: null == consultationFeeOnline
            ? _value.consultationFeeOnline
            : consultationFeeOnline // ignore: cast_nullable_to_non_nullable
                  as double,
        followUpFee: null == followUpFee
            ? _value.followUpFee
            : followUpFee // ignore: cast_nullable_to_non_nullable
                  as double,
        followUpDays: null == followUpDays
            ? _value.followUpDays
            : followUpDays // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$CreateClinicDoctorLinkWithFeesImpl
    implements _CreateClinicDoctorLinkWithFees {
  const _$CreateClinicDoctorLinkWithFeesImpl({
    @JsonKey(name: "clinic_id") required this.clinicId,
    @JsonKey(name: "doctor_id") required this.doctorId,
    @JsonKey(name: "consultation_fee_offline")
    required this.consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online")
    required this.consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") required this.followUpFee,
    @JsonKey(name: "follow_up_days") required this.followUpDays,
    this.notes,
  });

  factory _$CreateClinicDoctorLinkWithFeesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateClinicDoctorLinkWithFeesImplFromJson(json);

  @override
  @JsonKey(name: "clinic_id")
  final String clinicId;
  @override
  @JsonKey(name: "doctor_id")
  final String doctorId;
  @override
  @JsonKey(name: "consultation_fee_offline")
  final double consultationFeeOffline;
  @override
  @JsonKey(name: "consultation_fee_online")
  final double consultationFeeOnline;
  @override
  @JsonKey(name: "follow_up_fee")
  final double followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  final int followUpDays;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CreateClinicDoctorLinkWithFees(clinicId: $clinicId, doctorId: $doctorId, consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateClinicDoctorLinkWithFeesImpl &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.consultationFeeOffline, consultationFeeOffline) ||
                other.consultationFeeOffline == consultationFeeOffline) &&
            (identical(other.consultationFeeOnline, consultationFeeOnline) ||
                other.consultationFeeOnline == consultationFeeOnline) &&
            (identical(other.followUpFee, followUpFee) ||
                other.followUpFee == followUpFee) &&
            (identical(other.followUpDays, followUpDays) ||
                other.followUpDays == followUpDays) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinicId,
    doctorId,
    consultationFeeOffline,
    consultationFeeOnline,
    followUpFee,
    followUpDays,
    notes,
  );

  /// Create a copy of CreateClinicDoctorLinkWithFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateClinicDoctorLinkWithFeesImplCopyWith<
    _$CreateClinicDoctorLinkWithFeesImpl
  >
  get copyWith =>
      __$$CreateClinicDoctorLinkWithFeesImplCopyWithImpl<
        _$CreateClinicDoctorLinkWithFeesImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateClinicDoctorLinkWithFeesImplToJson(this);
  }
}

abstract class _CreateClinicDoctorLinkWithFees
    implements CreateClinicDoctorLinkWithFees {
  const factory _CreateClinicDoctorLinkWithFees({
    @JsonKey(name: "clinic_id") required final String clinicId,
    @JsonKey(name: "doctor_id") required final String doctorId,
    @JsonKey(name: "consultation_fee_offline")
    required final double consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online")
    required final double consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") required final double followUpFee,
    @JsonKey(name: "follow_up_days") required final int followUpDays,
    final String? notes,
  }) = _$CreateClinicDoctorLinkWithFeesImpl;

  factory _CreateClinicDoctorLinkWithFees.fromJson(Map<String, dynamic> json) =
      _$CreateClinicDoctorLinkWithFeesImpl.fromJson;

  @override
  @JsonKey(name: "clinic_id")
  String get clinicId;
  @override
  @JsonKey(name: "doctor_id")
  String get doctorId;
  @override
  @JsonKey(name: "consultation_fee_offline")
  double get consultationFeeOffline;
  @override
  @JsonKey(name: "consultation_fee_online")
  double get consultationFeeOnline;
  @override
  @JsonKey(name: "follow_up_fee")
  double get followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  int get followUpDays;
  @override
  String? get notes;

  /// Create a copy of CreateClinicDoctorLinkWithFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateClinicDoctorLinkWithFeesImplCopyWith<
    _$CreateClinicDoctorLinkWithFeesImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

UpdateClinicDoctorLinkFees _$UpdateClinicDoctorLinkFeesFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateClinicDoctorLinkFees.fromJson(json);
}

/// @nodoc
mixin _$UpdateClinicDoctorLinkFees {
  @JsonKey(name: "consultation_fee_offline")
  double? get consultationFeeOffline => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee_online")
  double? get consultationFeeOnline => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int? get followUpDays => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this UpdateClinicDoctorLinkFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateClinicDoctorLinkFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateClinicDoctorLinkFeesCopyWith<UpdateClinicDoctorLinkFees>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateClinicDoctorLinkFeesCopyWith<$Res> {
  factory $UpdateClinicDoctorLinkFeesCopyWith(
    UpdateClinicDoctorLinkFees value,
    $Res Function(UpdateClinicDoctorLinkFees) then,
  ) =
      _$UpdateClinicDoctorLinkFeesCopyWithImpl<
        $Res,
        UpdateClinicDoctorLinkFees
      >;
  @useResult
  $Res call({
    @JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
    String? notes,
  });
}

/// @nodoc
class _$UpdateClinicDoctorLinkFeesCopyWithImpl<
  $Res,
  $Val extends UpdateClinicDoctorLinkFees
>
    implements $UpdateClinicDoctorLinkFeesCopyWith<$Res> {
  _$UpdateClinicDoctorLinkFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateClinicDoctorLinkFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationFeeOffline = freezed,
    Object? consultationFeeOnline = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
    Object? notes = freezed,
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
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateClinicDoctorLinkFeesImplCopyWith<$Res>
    implements $UpdateClinicDoctorLinkFeesCopyWith<$Res> {
  factory _$$UpdateClinicDoctorLinkFeesImplCopyWith(
    _$UpdateClinicDoctorLinkFeesImpl value,
    $Res Function(_$UpdateClinicDoctorLinkFeesImpl) then,
  ) = __$$UpdateClinicDoctorLinkFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "consultation_fee_offline") double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
    String? notes,
  });
}

/// @nodoc
class __$$UpdateClinicDoctorLinkFeesImplCopyWithImpl<$Res>
    extends
        _$UpdateClinicDoctorLinkFeesCopyWithImpl<
          $Res,
          _$UpdateClinicDoctorLinkFeesImpl
        >
    implements _$$UpdateClinicDoctorLinkFeesImplCopyWith<$Res> {
  __$$UpdateClinicDoctorLinkFeesImplCopyWithImpl(
    _$UpdateClinicDoctorLinkFeesImpl _value,
    $Res Function(_$UpdateClinicDoctorLinkFeesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateClinicDoctorLinkFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationFeeOffline = freezed,
    Object? consultationFeeOnline = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$UpdateClinicDoctorLinkFeesImpl(
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
class _$UpdateClinicDoctorLinkFeesImpl implements _UpdateClinicDoctorLinkFees {
  const _$UpdateClinicDoctorLinkFeesImpl({
    @JsonKey(name: "consultation_fee_offline") this.consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") this.consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") this.followUpFee,
    @JsonKey(name: "follow_up_days") this.followUpDays,
    this.notes,
  });

  factory _$UpdateClinicDoctorLinkFeesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdateClinicDoctorLinkFeesImplFromJson(json);

  @override
  @JsonKey(name: "consultation_fee_offline")
  final double? consultationFeeOffline;
  @override
  @JsonKey(name: "consultation_fee_online")
  final double? consultationFeeOnline;
  @override
  @JsonKey(name: "follow_up_fee")
  final double? followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  final int? followUpDays;
  @override
  final String? notes;

  @override
  String toString() {
    return 'UpdateClinicDoctorLinkFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateClinicDoctorLinkFeesImpl &&
            (identical(other.consultationFeeOffline, consultationFeeOffline) ||
                other.consultationFeeOffline == consultationFeeOffline) &&
            (identical(other.consultationFeeOnline, consultationFeeOnline) ||
                other.consultationFeeOnline == consultationFeeOnline) &&
            (identical(other.followUpFee, followUpFee) ||
                other.followUpFee == followUpFee) &&
            (identical(other.followUpDays, followUpDays) ||
                other.followUpDays == followUpDays) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    consultationFeeOffline,
    consultationFeeOnline,
    followUpFee,
    followUpDays,
    notes,
  );

  /// Create a copy of UpdateClinicDoctorLinkFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateClinicDoctorLinkFeesImplCopyWith<_$UpdateClinicDoctorLinkFeesImpl>
  get copyWith =>
      __$$UpdateClinicDoctorLinkFeesImplCopyWithImpl<
        _$UpdateClinicDoctorLinkFeesImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateClinicDoctorLinkFeesImplToJson(this);
  }
}

abstract class _UpdateClinicDoctorLinkFees
    implements UpdateClinicDoctorLinkFees {
  const factory _UpdateClinicDoctorLinkFees({
    @JsonKey(name: "consultation_fee_offline")
    final double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online")
    final double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") final double? followUpFee,
    @JsonKey(name: "follow_up_days") final int? followUpDays,
    final String? notes,
  }) = _$UpdateClinicDoctorLinkFeesImpl;

  factory _UpdateClinicDoctorLinkFees.fromJson(Map<String, dynamic> json) =
      _$UpdateClinicDoctorLinkFeesImpl.fromJson;

  @override
  @JsonKey(name: "consultation_fee_offline")
  double? get consultationFeeOffline;
  @override
  @JsonKey(name: "consultation_fee_online")
  double? get consultationFeeOnline;
  @override
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  int? get followUpDays;
  @override
  String? get notes;

  /// Create a copy of UpdateClinicDoctorLinkFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateClinicDoctorLinkFeesImplCopyWith<_$UpdateClinicDoctorLinkFeesImpl>
  get copyWith => throw _privateConstructorUsedError;
}
