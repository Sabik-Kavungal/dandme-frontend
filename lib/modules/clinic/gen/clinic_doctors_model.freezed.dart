// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_doctors_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClinicSpecificFees _$ClinicSpecificFeesFromJson(Map<String, dynamic> json) {
  return _ClinicSpecificFees.fromJson(json);
}

/// @nodoc
mixin _$ClinicSpecificFees {
  @JsonKey(name: "consultation_fee_offline")
  double? get consultationFeeOffline => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_fee_online")
  double? get consultationFeeOnline => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int? get followUpDays => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ClinicSpecificFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicSpecificFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicSpecificFeesCopyWith<ClinicSpecificFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicSpecificFeesCopyWith<$Res> {
  factory $ClinicSpecificFeesCopyWith(
    ClinicSpecificFees value,
    $Res Function(ClinicSpecificFees) then,
  ) = _$ClinicSpecificFeesCopyWithImpl<$Res, ClinicSpecificFees>;
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
class _$ClinicSpecificFeesCopyWithImpl<$Res, $Val extends ClinicSpecificFees>
    implements $ClinicSpecificFeesCopyWith<$Res> {
  _$ClinicSpecificFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicSpecificFees
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
abstract class _$$ClinicSpecificFeesImplCopyWith<$Res>
    implements $ClinicSpecificFeesCopyWith<$Res> {
  factory _$$ClinicSpecificFeesImplCopyWith(
    _$ClinicSpecificFeesImpl value,
    $Res Function(_$ClinicSpecificFeesImpl) then,
  ) = __$$ClinicSpecificFeesImplCopyWithImpl<$Res>;
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
class __$$ClinicSpecificFeesImplCopyWithImpl<$Res>
    extends _$ClinicSpecificFeesCopyWithImpl<$Res, _$ClinicSpecificFeesImpl>
    implements _$$ClinicSpecificFeesImplCopyWith<$Res> {
  __$$ClinicSpecificFeesImplCopyWithImpl(
    _$ClinicSpecificFeesImpl _value,
    $Res Function(_$ClinicSpecificFeesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicSpecificFees
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
      _$ClinicSpecificFeesImpl(
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
class _$ClinicSpecificFeesImpl implements _ClinicSpecificFees {
  const _$ClinicSpecificFeesImpl({
    @JsonKey(name: "consultation_fee_offline") this.consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online") this.consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") this.followUpFee,
    @JsonKey(name: "follow_up_days") this.followUpDays,
    this.notes,
  });

  factory _$ClinicSpecificFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicSpecificFeesImplFromJson(json);

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
    return 'ClinicSpecificFees(consultationFeeOffline: $consultationFeeOffline, consultationFeeOnline: $consultationFeeOnline, followUpFee: $followUpFee, followUpDays: $followUpDays, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicSpecificFeesImpl &&
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

  /// Create a copy of ClinicSpecificFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicSpecificFeesImplCopyWith<_$ClinicSpecificFeesImpl> get copyWith =>
      __$$ClinicSpecificFeesImplCopyWithImpl<_$ClinicSpecificFeesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicSpecificFeesImplToJson(this);
  }
}

abstract class _ClinicSpecificFees implements ClinicSpecificFees {
  const factory _ClinicSpecificFees({
    @JsonKey(name: "consultation_fee_offline")
    final double? consultationFeeOffline,
    @JsonKey(name: "consultation_fee_online")
    final double? consultationFeeOnline,
    @JsonKey(name: "follow_up_fee") final double? followUpFee,
    @JsonKey(name: "follow_up_days") final int? followUpDays,
    final String? notes,
  }) = _$ClinicSpecificFeesImpl;

  factory _ClinicSpecificFees.fromJson(Map<String, dynamic> json) =
      _$ClinicSpecificFeesImpl.fromJson;

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

  /// Create a copy of ClinicSpecificFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicSpecificFeesImplCopyWith<_$ClinicSpecificFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DefaultFees _$DefaultFeesFromJson(Map<String, dynamic> json) {
  return _DefaultFees.fromJson(json);
}

/// @nodoc
mixin _$DefaultFees {
  @JsonKey(name: "consultation_fee")
  double? get consultationFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee => throw _privateConstructorUsedError;
  @JsonKey(name: "follow_up_days")
  int? get followUpDays => throw _privateConstructorUsedError;

  /// Serializes this DefaultFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultFeesCopyWith<DefaultFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultFeesCopyWith<$Res> {
  factory $DefaultFeesCopyWith(
    DefaultFees value,
    $Res Function(DefaultFees) then,
  ) = _$DefaultFeesCopyWithImpl<$Res, DefaultFees>;
  @useResult
  $Res call({
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  });
}

/// @nodoc
class _$DefaultFeesCopyWithImpl<$Res, $Val extends DefaultFees>
    implements $DefaultFeesCopyWith<$Res> {
  _$DefaultFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationFee = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _value.copyWith(
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
abstract class _$$DefaultFeesImplCopyWith<$Res>
    implements $DefaultFeesCopyWith<$Res> {
  factory _$$DefaultFeesImplCopyWith(
    _$DefaultFeesImpl value,
    $Res Function(_$DefaultFeesImpl) then,
  ) = __$$DefaultFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "consultation_fee") double? consultationFee,
    @JsonKey(name: "follow_up_fee") double? followUpFee,
    @JsonKey(name: "follow_up_days") int? followUpDays,
  });
}

/// @nodoc
class __$$DefaultFeesImplCopyWithImpl<$Res>
    extends _$DefaultFeesCopyWithImpl<$Res, _$DefaultFeesImpl>
    implements _$$DefaultFeesImplCopyWith<$Res> {
  __$$DefaultFeesImplCopyWithImpl(
    _$DefaultFeesImpl _value,
    $Res Function(_$DefaultFeesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DefaultFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationFee = freezed,
    Object? followUpFee = freezed,
    Object? followUpDays = freezed,
  }) {
    return _then(
      _$DefaultFeesImpl(
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
class _$DefaultFeesImpl implements _DefaultFees {
  const _$DefaultFeesImpl({
    @JsonKey(name: "consultation_fee") this.consultationFee,
    @JsonKey(name: "follow_up_fee") this.followUpFee,
    @JsonKey(name: "follow_up_days") this.followUpDays,
  });

  factory _$DefaultFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultFeesImplFromJson(json);

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
    return 'DefaultFees(consultationFee: $consultationFee, followUpFee: $followUpFee, followUpDays: $followUpDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultFeesImpl &&
            (identical(other.consultationFee, consultationFee) ||
                other.consultationFee == consultationFee) &&
            (identical(other.followUpFee, followUpFee) ||
                other.followUpFee == followUpFee) &&
            (identical(other.followUpDays, followUpDays) ||
                other.followUpDays == followUpDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, consultationFee, followUpFee, followUpDays);

  /// Create a copy of DefaultFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultFeesImplCopyWith<_$DefaultFeesImpl> get copyWith =>
      __$$DefaultFeesImplCopyWithImpl<_$DefaultFeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultFeesImplToJson(this);
  }
}

abstract class _DefaultFees implements DefaultFees {
  const factory _DefaultFees({
    @JsonKey(name: "consultation_fee") final double? consultationFee,
    @JsonKey(name: "follow_up_fee") final double? followUpFee,
    @JsonKey(name: "follow_up_days") final int? followUpDays,
  }) = _$DefaultFeesImpl;

  factory _DefaultFees.fromJson(Map<String, dynamic> json) =
      _$DefaultFeesImpl.fromJson;

  @override
  @JsonKey(name: "consultation_fee")
  double? get consultationFee;
  @override
  @JsonKey(name: "follow_up_fee")
  double? get followUpFee;
  @override
  @JsonKey(name: "follow_up_days")
  int? get followUpDays;

  /// Create a copy of DefaultFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultFeesImplCopyWith<_$DefaultFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicDoctorModel _$ClinicDoctorModelFromJson(Map<String, dynamic> json) {
  return _ClinicDoctorModel.fromJson(json);
}

/// @nodoc
mixin _$ClinicDoctorModel {
  String? get id => throw _privateConstructorUsedError; // Add direct id field
  @JsonKey(name: "link_id")
  String? get linkId => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_id")
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_code")
  String? get doctorCode => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "clinic_specific_fees")
  ClinicSpecificFees? get clinicSpecificFees =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "default_fees")
  DefaultFees? get defaultFees => throw _privateConstructorUsedError;

  /// Serializes this ClinicDoctorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicDoctorModelCopyWith<ClinicDoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDoctorModelCopyWith<$Res> {
  factory $ClinicDoctorModelCopyWith(
    ClinicDoctorModel value,
    $Res Function(ClinicDoctorModel) then,
  ) = _$ClinicDoctorModelCopyWithImpl<$Res, ClinicDoctorModel>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: "link_id") String? linkId,
    @JsonKey(name: "doctor_id") String? doctorId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "doctor_code") String? doctorCode,
    String? specialization,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "full_name") String? fullName,
    String? email,
    String? username,
    String? phone,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "clinic_specific_fees")
    ClinicSpecificFees? clinicSpecificFees,
    @JsonKey(name: "default_fees") DefaultFees? defaultFees,
  });

  $ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees;
  $DefaultFeesCopyWith<$Res>? get defaultFees;
}

/// @nodoc
class _$ClinicDoctorModelCopyWithImpl<$Res, $Val extends ClinicDoctorModel>
    implements $ClinicDoctorModelCopyWith<$Res> {
  _$ClinicDoctorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? linkId = freezed,
    Object? doctorId = freezed,
    Object? userId = freezed,
    Object? doctorCode = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? isActive = null,
    Object? clinicSpecificFees = freezed,
    Object? defaultFees = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkId: freezed == linkId
                ? _value.linkId
                : linkId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
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
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
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
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            clinicSpecificFees: freezed == clinicSpecificFees
                ? _value.clinicSpecificFees
                : clinicSpecificFees // ignore: cast_nullable_to_non_nullable
                      as ClinicSpecificFees?,
            defaultFees: freezed == defaultFees
                ? _value.defaultFees
                : defaultFees // ignore: cast_nullable_to_non_nullable
                      as DefaultFees?,
          )
          as $Val,
    );
  }

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees {
    if (_value.clinicSpecificFees == null) {
      return null;
    }

    return $ClinicSpecificFeesCopyWith<$Res>(_value.clinicSpecificFees!, (
      value,
    ) {
      return _then(_value.copyWith(clinicSpecificFees: value) as $Val);
    });
  }

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DefaultFeesCopyWith<$Res>? get defaultFees {
    if (_value.defaultFees == null) {
      return null;
    }

    return $DefaultFeesCopyWith<$Res>(_value.defaultFees!, (value) {
      return _then(_value.copyWith(defaultFees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicDoctorModelImplCopyWith<$Res>
    implements $ClinicDoctorModelCopyWith<$Res> {
  factory _$$ClinicDoctorModelImplCopyWith(
    _$ClinicDoctorModelImpl value,
    $Res Function(_$ClinicDoctorModelImpl) then,
  ) = __$$ClinicDoctorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: "link_id") String? linkId,
    @JsonKey(name: "doctor_id") String? doctorId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "doctor_code") String? doctorCode,
    String? specialization,
    @JsonKey(name: "license_number") String? licenseNumber,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "full_name") String? fullName,
    String? email,
    String? username,
    String? phone,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "clinic_specific_fees")
    ClinicSpecificFees? clinicSpecificFees,
    @JsonKey(name: "default_fees") DefaultFees? defaultFees,
  });

  @override
  $ClinicSpecificFeesCopyWith<$Res>? get clinicSpecificFees;
  @override
  $DefaultFeesCopyWith<$Res>? get defaultFees;
}

/// @nodoc
class __$$ClinicDoctorModelImplCopyWithImpl<$Res>
    extends _$ClinicDoctorModelCopyWithImpl<$Res, _$ClinicDoctorModelImpl>
    implements _$$ClinicDoctorModelImplCopyWith<$Res> {
  __$$ClinicDoctorModelImplCopyWithImpl(
    _$ClinicDoctorModelImpl _value,
    $Res Function(_$ClinicDoctorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? linkId = freezed,
    Object? doctorId = freezed,
    Object? userId = freezed,
    Object? doctorCode = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? isActive = null,
    Object? clinicSpecificFees = freezed,
    Object? defaultFees = freezed,
  }) {
    return _then(
      _$ClinicDoctorModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkId: freezed == linkId
            ? _value.linkId
            : linkId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
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
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
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
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        clinicSpecificFees: freezed == clinicSpecificFees
            ? _value.clinicSpecificFees
            : clinicSpecificFees // ignore: cast_nullable_to_non_nullable
                  as ClinicSpecificFees?,
        defaultFees: freezed == defaultFees
            ? _value.defaultFees
            : defaultFees // ignore: cast_nullable_to_non_nullable
                  as DefaultFees?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDoctorModelImpl implements _ClinicDoctorModel {
  const _$ClinicDoctorModelImpl({
    this.id,
    @JsonKey(name: "link_id") this.linkId,
    @JsonKey(name: "doctor_id") this.doctorId,
    @JsonKey(name: "user_id") this.userId,
    @JsonKey(name: "doctor_code") this.doctorCode,
    this.specialization,
    @JsonKey(name: "license_number") this.licenseNumber,
    @JsonKey(name: "first_name") this.firstName,
    @JsonKey(name: "last_name") this.lastName,
    @JsonKey(name: "full_name") this.fullName,
    this.email,
    this.username,
    this.phone,
    @JsonKey(name: "is_active") this.isActive = true,
    @JsonKey(name: "clinic_specific_fees") this.clinicSpecificFees,
    @JsonKey(name: "default_fees") this.defaultFees,
  });

  factory _$ClinicDoctorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDoctorModelImplFromJson(json);

  @override
  final String? id;
  // Add direct id field
  @override
  @JsonKey(name: "link_id")
  final String? linkId;
  @override
  @JsonKey(name: "doctor_id")
  final String? doctorId;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "doctor_code")
  final String? doctorCode;
  @override
  final String? specialization;
  @override
  @JsonKey(name: "license_number")
  final String? licenseNumber;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? phone;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  @override
  @JsonKey(name: "clinic_specific_fees")
  final ClinicSpecificFees? clinicSpecificFees;
  @override
  @JsonKey(name: "default_fees")
  final DefaultFees? defaultFees;

  @override
  String toString() {
    return 'ClinicDoctorModel(id: $id, linkId: $linkId, doctorId: $doctorId, userId: $userId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, username: $username, phone: $phone, isActive: $isActive, clinicSpecificFees: $clinicSpecificFees, defaultFees: $defaultFees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDoctorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.linkId, linkId) || other.linkId == linkId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.clinicSpecificFees, clinicSpecificFees) ||
                other.clinicSpecificFees == clinicSpecificFees) &&
            (identical(other.defaultFees, defaultFees) ||
                other.defaultFees == defaultFees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    linkId,
    doctorId,
    userId,
    doctorCode,
    specialization,
    licenseNumber,
    firstName,
    lastName,
    fullName,
    email,
    username,
    phone,
    isActive,
    clinicSpecificFees,
    defaultFees,
  );

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDoctorModelImplCopyWith<_$ClinicDoctorModelImpl> get copyWith =>
      __$$ClinicDoctorModelImplCopyWithImpl<_$ClinicDoctorModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDoctorModelImplToJson(this);
  }
}

abstract class _ClinicDoctorModel implements ClinicDoctorModel {
  const factory _ClinicDoctorModel({
    final String? id,
    @JsonKey(name: "link_id") final String? linkId,
    @JsonKey(name: "doctor_id") final String? doctorId,
    @JsonKey(name: "user_id") final String? userId,
    @JsonKey(name: "doctor_code") final String? doctorCode,
    final String? specialization,
    @JsonKey(name: "license_number") final String? licenseNumber,
    @JsonKey(name: "first_name") final String? firstName,
    @JsonKey(name: "last_name") final String? lastName,
    @JsonKey(name: "full_name") final String? fullName,
    final String? email,
    final String? username,
    final String? phone,
    @JsonKey(name: "is_active") final bool isActive,
    @JsonKey(name: "clinic_specific_fees")
    final ClinicSpecificFees? clinicSpecificFees,
    @JsonKey(name: "default_fees") final DefaultFees? defaultFees,
  }) = _$ClinicDoctorModelImpl;

  factory _ClinicDoctorModel.fromJson(Map<String, dynamic> json) =
      _$ClinicDoctorModelImpl.fromJson;

  @override
  String? get id; // Add direct id field
  @override
  @JsonKey(name: "link_id")
  String? get linkId;
  @override
  @JsonKey(name: "doctor_id")
  String? get doctorId;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "doctor_code")
  String? get doctorCode;
  @override
  String? get specialization;
  @override
  @JsonKey(name: "license_number")
  String? get licenseNumber;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  String? get email;
  @override
  String? get username;
  @override
  String? get phone;
  @override
  @JsonKey(name: "is_active")
  bool get isActive;
  @override
  @JsonKey(name: "clinic_specific_fees")
  ClinicSpecificFees? get clinicSpecificFees;
  @override
  @JsonKey(name: "default_fees")
  DefaultFees? get defaultFees;

  /// Create a copy of ClinicDoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicDoctorModelImplCopyWith<_$ClinicDoctorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicDoctorsResponse _$ClinicDoctorsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ClinicDoctorsResponse.fromJson(json);
}

/// @nodoc
mixin _$ClinicDoctorsResponse {
  @JsonKey(name: "clinic_id")
  String? get clinicId => throw _privateConstructorUsedError; // Changed to nullable
  List<ClinicDoctorModel> get doctors => throw _privateConstructorUsedError;
  @JsonKey(name: "total_doctors")
  int? get totalDoctors => throw _privateConstructorUsedError;

  /// Serializes this ClinicDoctorsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicDoctorsResponseCopyWith<ClinicDoctorsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDoctorsResponseCopyWith<$Res> {
  factory $ClinicDoctorsResponseCopyWith(
    ClinicDoctorsResponse value,
    $Res Function(ClinicDoctorsResponse) then,
  ) = _$ClinicDoctorsResponseCopyWithImpl<$Res, ClinicDoctorsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "clinic_id") String? clinicId,
    List<ClinicDoctorModel> doctors,
    @JsonKey(name: "total_doctors") int? totalDoctors,
  });
}

/// @nodoc
class _$ClinicDoctorsResponseCopyWithImpl<
  $Res,
  $Val extends ClinicDoctorsResponse
>
    implements $ClinicDoctorsResponseCopyWith<$Res> {
  _$ClinicDoctorsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = freezed,
    Object? doctors = null,
    Object? totalDoctors = freezed,
  }) {
    return _then(
      _value.copyWith(
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctors: null == doctors
                ? _value.doctors
                : doctors // ignore: cast_nullable_to_non_nullable
                      as List<ClinicDoctorModel>,
            totalDoctors: freezed == totalDoctors
                ? _value.totalDoctors
                : totalDoctors // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicDoctorsResponseImplCopyWith<$Res>
    implements $ClinicDoctorsResponseCopyWith<$Res> {
  factory _$$ClinicDoctorsResponseImplCopyWith(
    _$ClinicDoctorsResponseImpl value,
    $Res Function(_$ClinicDoctorsResponseImpl) then,
  ) = __$$ClinicDoctorsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "clinic_id") String? clinicId,
    List<ClinicDoctorModel> doctors,
    @JsonKey(name: "total_doctors") int? totalDoctors,
  });
}

/// @nodoc
class __$$ClinicDoctorsResponseImplCopyWithImpl<$Res>
    extends
        _$ClinicDoctorsResponseCopyWithImpl<$Res, _$ClinicDoctorsResponseImpl>
    implements _$$ClinicDoctorsResponseImplCopyWith<$Res> {
  __$$ClinicDoctorsResponseImplCopyWithImpl(
    _$ClinicDoctorsResponseImpl _value,
    $Res Function(_$ClinicDoctorsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = freezed,
    Object? doctors = null,
    Object? totalDoctors = freezed,
  }) {
    return _then(
      _$ClinicDoctorsResponseImpl(
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctors: null == doctors
            ? _value._doctors
            : doctors // ignore: cast_nullable_to_non_nullable
                  as List<ClinicDoctorModel>,
        totalDoctors: freezed == totalDoctors
            ? _value.totalDoctors
            : totalDoctors // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDoctorsResponseImpl implements _ClinicDoctorsResponse {
  const _$ClinicDoctorsResponseImpl({
    @JsonKey(name: "clinic_id") this.clinicId,
    required final List<ClinicDoctorModel> doctors,
    @JsonKey(name: "total_doctors") this.totalDoctors,
  }) : _doctors = doctors;

  factory _$ClinicDoctorsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDoctorsResponseImplFromJson(json);

  @override
  @JsonKey(name: "clinic_id")
  final String? clinicId;
  // Changed to nullable
  final List<ClinicDoctorModel> _doctors;
  // Changed to nullable
  @override
  List<ClinicDoctorModel> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey(name: "total_doctors")
  final int? totalDoctors;

  @override
  String toString() {
    return 'ClinicDoctorsResponse(clinicId: $clinicId, doctors: $doctors, totalDoctors: $totalDoctors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDoctorsResponseImpl &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.totalDoctors, totalDoctors) ||
                other.totalDoctors == totalDoctors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinicId,
    const DeepCollectionEquality().hash(_doctors),
    totalDoctors,
  );

  /// Create a copy of ClinicDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDoctorsResponseImplCopyWith<_$ClinicDoctorsResponseImpl>
  get copyWith =>
      __$$ClinicDoctorsResponseImplCopyWithImpl<_$ClinicDoctorsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDoctorsResponseImplToJson(this);
  }
}

abstract class _ClinicDoctorsResponse implements ClinicDoctorsResponse {
  const factory _ClinicDoctorsResponse({
    @JsonKey(name: "clinic_id") final String? clinicId,
    required final List<ClinicDoctorModel> doctors,
    @JsonKey(name: "total_doctors") final int? totalDoctors,
  }) = _$ClinicDoctorsResponseImpl;

  factory _ClinicDoctorsResponse.fromJson(Map<String, dynamic> json) =
      _$ClinicDoctorsResponseImpl.fromJson;

  @override
  @JsonKey(name: "clinic_id")
  String? get clinicId; // Changed to nullable
  @override
  List<ClinicDoctorModel> get doctors;
  @override
  @JsonKey(name: "total_doctors")
  int? get totalDoctors;

  /// Create a copy of ClinicDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicDoctorsResponseImplCopyWith<_$ClinicDoctorsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
