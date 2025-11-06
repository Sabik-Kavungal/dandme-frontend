// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FollowUpEligibilityResponse _$FollowUpEligibilityResponseFromJson(
  Map<String, dynamic> json,
) {
  return _FollowUpEligibilityResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowUpEligibilityResponse {
  @JsonKey(name: 'is_free')
  bool get isFree => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_eligible')
  bool get isEligible => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'followup_details')
  FollowUpDetails? get followupDetails => throw _privateConstructorUsedError;

  /// Serializes this FollowUpEligibilityResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpEligibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpEligibilityResponseCopyWith<FollowUpEligibilityResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpEligibilityResponseCopyWith<$Res> {
  factory $FollowUpEligibilityResponseCopyWith(
    FollowUpEligibilityResponse value,
    $Res Function(FollowUpEligibilityResponse) then,
  ) =
      _$FollowUpEligibilityResponseCopyWithImpl<
        $Res,
        FollowUpEligibilityResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'is_free') bool isFree,
    @JsonKey(name: 'is_eligible') bool isEligible,
    String message,
    @JsonKey(name: 'followup_details') FollowUpDetails? followupDetails,
  });

  $FollowUpDetailsCopyWith<$Res>? get followupDetails;
}

/// @nodoc
class _$FollowUpEligibilityResponseCopyWithImpl<
  $Res,
  $Val extends FollowUpEligibilityResponse
>
    implements $FollowUpEligibilityResponseCopyWith<$Res> {
  _$FollowUpEligibilityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpEligibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFree = null,
    Object? isEligible = null,
    Object? message = null,
    Object? followupDetails = freezed,
  }) {
    return _then(
      _value.copyWith(
            isFree: null == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool,
            isEligible: null == isEligible
                ? _value.isEligible
                : isEligible // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            followupDetails: freezed == followupDetails
                ? _value.followupDetails
                : followupDetails // ignore: cast_nullable_to_non_nullable
                      as FollowUpDetails?,
          )
          as $Val,
    );
  }

  /// Create a copy of FollowUpEligibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpDetailsCopyWith<$Res>? get followupDetails {
    if (_value.followupDetails == null) {
      return null;
    }

    return $FollowUpDetailsCopyWith<$Res>(_value.followupDetails!, (value) {
      return _then(_value.copyWith(followupDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowUpEligibilityResponseImplCopyWith<$Res>
    implements $FollowUpEligibilityResponseCopyWith<$Res> {
  factory _$$FollowUpEligibilityResponseImplCopyWith(
    _$FollowUpEligibilityResponseImpl value,
    $Res Function(_$FollowUpEligibilityResponseImpl) then,
  ) = __$$FollowUpEligibilityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'is_free') bool isFree,
    @JsonKey(name: 'is_eligible') bool isEligible,
    String message,
    @JsonKey(name: 'followup_details') FollowUpDetails? followupDetails,
  });

  @override
  $FollowUpDetailsCopyWith<$Res>? get followupDetails;
}

/// @nodoc
class __$$FollowUpEligibilityResponseImplCopyWithImpl<$Res>
    extends
        _$FollowUpEligibilityResponseCopyWithImpl<
          $Res,
          _$FollowUpEligibilityResponseImpl
        >
    implements _$$FollowUpEligibilityResponseImplCopyWith<$Res> {
  __$$FollowUpEligibilityResponseImplCopyWithImpl(
    _$FollowUpEligibilityResponseImpl _value,
    $Res Function(_$FollowUpEligibilityResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpEligibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFree = null,
    Object? isEligible = null,
    Object? message = null,
    Object? followupDetails = freezed,
  }) {
    return _then(
      _$FollowUpEligibilityResponseImpl(
        isFree: null == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool,
        isEligible: null == isEligible
            ? _value.isEligible
            : isEligible // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        followupDetails: freezed == followupDetails
            ? _value.followupDetails
            : followupDetails // ignore: cast_nullable_to_non_nullable
                  as FollowUpDetails?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpEligibilityResponseImpl
    implements _FollowUpEligibilityResponse {
  const _$FollowUpEligibilityResponseImpl({
    @JsonKey(name: 'is_free') required this.isFree,
    @JsonKey(name: 'is_eligible') required this.isEligible,
    required this.message,
    @JsonKey(name: 'followup_details') this.followupDetails,
  });

  factory _$FollowUpEligibilityResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$FollowUpEligibilityResponseImplFromJson(json);

  @override
  @JsonKey(name: 'is_free')
  final bool isFree;
  @override
  @JsonKey(name: 'is_eligible')
  final bool isEligible;
  @override
  final String message;
  @override
  @JsonKey(name: 'followup_details')
  final FollowUpDetails? followupDetails;

  @override
  String toString() {
    return 'FollowUpEligibilityResponse(isFree: $isFree, isEligible: $isEligible, message: $message, followupDetails: $followupDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpEligibilityResponseImpl &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.followupDetails, followupDetails) ||
                other.followupDetails == followupDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isFree, isEligible, message, followupDetails);

  /// Create a copy of FollowUpEligibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpEligibilityResponseImplCopyWith<_$FollowUpEligibilityResponseImpl>
  get copyWith =>
      __$$FollowUpEligibilityResponseImplCopyWithImpl<
        _$FollowUpEligibilityResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpEligibilityResponseImplToJson(this);
  }
}

abstract class _FollowUpEligibilityResponse
    implements FollowUpEligibilityResponse {
  const factory _FollowUpEligibilityResponse({
    @JsonKey(name: 'is_free') required final bool isFree,
    @JsonKey(name: 'is_eligible') required final bool isEligible,
    required final String message,
    @JsonKey(name: 'followup_details') final FollowUpDetails? followupDetails,
  }) = _$FollowUpEligibilityResponseImpl;

  factory _FollowUpEligibilityResponse.fromJson(Map<String, dynamic> json) =
      _$FollowUpEligibilityResponseImpl.fromJson;

  @override
  @JsonKey(name: 'is_free')
  bool get isFree;
  @override
  @JsonKey(name: 'is_eligible')
  bool get isEligible;
  @override
  String get message;
  @override
  @JsonKey(name: 'followup_details')
  FollowUpDetails? get followupDetails;

  /// Create a copy of FollowUpEligibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpEligibilityResponseImplCopyWith<_$FollowUpEligibilityResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FollowUpDetails _$FollowUpDetailsFromJson(Map<String, dynamic> json) {
  return _FollowUpDetails.fromJson(json);
}

/// @nodoc
mixin _$FollowUpDetails {
  @JsonKey(name: 'followup_id')
  String? get followupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until')
  String? get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;

  /// Serializes this FollowUpDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpDetailsCopyWith<FollowUpDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpDetailsCopyWith<$Res> {
  factory $FollowUpDetailsCopyWith(
    FollowUpDetails value,
    $Res Function(FollowUpDetails) then,
  ) = _$FollowUpDetailsCopyWithImpl<$Res, FollowUpDetails>;
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'department_id') String? departmentId,
  });
}

/// @nodoc
class _$FollowUpDetailsCopyWithImpl<$Res, $Val extends FollowUpDetails>
    implements $FollowUpDetailsCopyWith<$Res> {
  _$FollowUpDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = freezed,
    Object? validUntil = freezed,
    Object? daysRemaining = freezed,
    Object? doctorId = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            followupId: freezed == followupId
                ? _value.followupId
                : followupId // ignore: cast_nullable_to_non_nullable
                      as String?,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
            daysRemaining: freezed == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int?,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowUpDetailsImplCopyWith<$Res>
    implements $FollowUpDetailsCopyWith<$Res> {
  factory _$$FollowUpDetailsImplCopyWith(
    _$FollowUpDetailsImpl value,
    $Res Function(_$FollowUpDetailsImpl) then,
  ) = __$$FollowUpDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'department_id') String? departmentId,
  });
}

/// @nodoc
class __$$FollowUpDetailsImplCopyWithImpl<$Res>
    extends _$FollowUpDetailsCopyWithImpl<$Res, _$FollowUpDetailsImpl>
    implements _$$FollowUpDetailsImplCopyWith<$Res> {
  __$$FollowUpDetailsImplCopyWithImpl(
    _$FollowUpDetailsImpl _value,
    $Res Function(_$FollowUpDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = freezed,
    Object? validUntil = freezed,
    Object? daysRemaining = freezed,
    Object? doctorId = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(
      _$FollowUpDetailsImpl(
        followupId: freezed == followupId
            ? _value.followupId
            : followupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
        daysRemaining: freezed == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int?,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpDetailsImpl implements _FollowUpDetails {
  const _$FollowUpDetailsImpl({
    @JsonKey(name: 'followup_id') this.followupId,
    @JsonKey(name: 'valid_until') this.validUntil,
    @JsonKey(name: 'days_remaining') this.daysRemaining,
    @JsonKey(name: 'doctor_id') this.doctorId,
    @JsonKey(name: 'department_id') this.departmentId,
  });

  factory _$FollowUpDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'followup_id')
  final String? followupId;
  @override
  @JsonKey(name: 'valid_until')
  final String? validUntil;
  @override
  @JsonKey(name: 'days_remaining')
  final int? daysRemaining;
  @override
  @JsonKey(name: 'doctor_id')
  final String? doctorId;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;

  @override
  String toString() {
    return 'FollowUpDetails(followupId: $followupId, validUntil: $validUntil, daysRemaining: $daysRemaining, doctorId: $doctorId, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpDetailsImpl &&
            (identical(other.followupId, followupId) ||
                other.followupId == followupId) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followupId,
    validUntil,
    daysRemaining,
    doctorId,
    departmentId,
  );

  /// Create a copy of FollowUpDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpDetailsImplCopyWith<_$FollowUpDetailsImpl> get copyWith =>
      __$$FollowUpDetailsImplCopyWithImpl<_$FollowUpDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpDetailsImplToJson(this);
  }
}

abstract class _FollowUpDetails implements FollowUpDetails {
  const factory _FollowUpDetails({
    @JsonKey(name: 'followup_id') final String? followupId,
    @JsonKey(name: 'valid_until') final String? validUntil,
    @JsonKey(name: 'days_remaining') final int? daysRemaining,
    @JsonKey(name: 'doctor_id') final String? doctorId,
    @JsonKey(name: 'department_id') final String? departmentId,
  }) = _$FollowUpDetailsImpl;

  factory _FollowUpDetails.fromJson(Map<String, dynamic> json) =
      _$FollowUpDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'followup_id')
  String? get followupId;
  @override
  @JsonKey(name: 'valid_until')
  String? get validUntil;
  @override
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining;
  @override
  @JsonKey(name: 'doctor_id')
  String? get doctorId;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;

  /// Create a copy of FollowUpDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpDetailsImplCopyWith<_$FollowUpDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActiveFollowUpsResponse _$ActiveFollowUpsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ActiveFollowUpsResponse.fromJson(json);
}

/// @nodoc
mixin _$ActiveFollowUpsResponse {
  @JsonKey(name: 'active_followups')
  List<ActiveFollowUp> get activeFollowups =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this ActiveFollowUpsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveFollowUpsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveFollowUpsResponseCopyWith<ActiveFollowUpsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveFollowUpsResponseCopyWith<$Res> {
  factory $ActiveFollowUpsResponseCopyWith(
    ActiveFollowUpsResponse value,
    $Res Function(ActiveFollowUpsResponse) then,
  ) = _$ActiveFollowUpsResponseCopyWithImpl<$Res, ActiveFollowUpsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'active_followups') List<ActiveFollowUp> activeFollowups,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class _$ActiveFollowUpsResponseCopyWithImpl<
  $Res,
  $Val extends ActiveFollowUpsResponse
>
    implements $ActiveFollowUpsResponseCopyWith<$Res> {
  _$ActiveFollowUpsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveFollowUpsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeFollowups = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            activeFollowups: null == activeFollowups
                ? _value.activeFollowups
                : activeFollowups // ignore: cast_nullable_to_non_nullable
                      as List<ActiveFollowUp>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActiveFollowUpsResponseImplCopyWith<$Res>
    implements $ActiveFollowUpsResponseCopyWith<$Res> {
  factory _$$ActiveFollowUpsResponseImplCopyWith(
    _$ActiveFollowUpsResponseImpl value,
    $Res Function(_$ActiveFollowUpsResponseImpl) then,
  ) = __$$ActiveFollowUpsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'active_followups') List<ActiveFollowUp> activeFollowups,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class __$$ActiveFollowUpsResponseImplCopyWithImpl<$Res>
    extends
        _$ActiveFollowUpsResponseCopyWithImpl<
          $Res,
          _$ActiveFollowUpsResponseImpl
        >
    implements _$$ActiveFollowUpsResponseImplCopyWith<$Res> {
  __$$ActiveFollowUpsResponseImplCopyWithImpl(
    _$ActiveFollowUpsResponseImpl _value,
    $Res Function(_$ActiveFollowUpsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActiveFollowUpsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeFollowups = null, Object? totalCount = null}) {
    return _then(
      _$ActiveFollowUpsResponseImpl(
        activeFollowups: null == activeFollowups
            ? _value._activeFollowups
            : activeFollowups // ignore: cast_nullable_to_non_nullable
                  as List<ActiveFollowUp>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveFollowUpsResponseImpl implements _ActiveFollowUpsResponse {
  const _$ActiveFollowUpsResponseImpl({
    @JsonKey(name: 'active_followups')
    required final List<ActiveFollowUp> activeFollowups,
    @JsonKey(name: 'total_count') required this.totalCount,
  }) : _activeFollowups = activeFollowups;

  factory _$ActiveFollowUpsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveFollowUpsResponseImplFromJson(json);

  final List<ActiveFollowUp> _activeFollowups;
  @override
  @JsonKey(name: 'active_followups')
  List<ActiveFollowUp> get activeFollowups {
    if (_activeFollowups is EqualUnmodifiableListView) return _activeFollowups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeFollowups);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  String toString() {
    return 'ActiveFollowUpsResponse(activeFollowups: $activeFollowups, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveFollowUpsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._activeFollowups,
              _activeFollowups,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_activeFollowups),
    totalCount,
  );

  /// Create a copy of ActiveFollowUpsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveFollowUpsResponseImplCopyWith<_$ActiveFollowUpsResponseImpl>
  get copyWith =>
      __$$ActiveFollowUpsResponseImplCopyWithImpl<
        _$ActiveFollowUpsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveFollowUpsResponseImplToJson(this);
  }
}

abstract class _ActiveFollowUpsResponse implements ActiveFollowUpsResponse {
  const factory _ActiveFollowUpsResponse({
    @JsonKey(name: 'active_followups')
    required final List<ActiveFollowUp> activeFollowups,
    @JsonKey(name: 'total_count') required final int totalCount,
  }) = _$ActiveFollowUpsResponseImpl;

  factory _ActiveFollowUpsResponse.fromJson(Map<String, dynamic> json) =
      _$ActiveFollowUpsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'active_followups')
  List<ActiveFollowUp> get activeFollowups;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;

  /// Create a copy of ActiveFollowUpsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveFollowUpsResponseImplCopyWith<_$ActiveFollowUpsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ActiveFollowUp _$ActiveFollowUpFromJson(Map<String, dynamic> json) {
  return _ActiveFollowUp.fromJson(json);
}

/// @nodoc
mixin _$ActiveFollowUp {
  @JsonKey(name: 'followup_id')
  String get followupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_id')
  String get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_date')
  String get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until')
  String get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int get daysRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_free')
  bool get isFree => throw _privateConstructorUsedError;

  /// Serializes this ActiveFollowUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveFollowUpCopyWith<ActiveFollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveFollowUpCopyWith<$Res> {
  factory $ActiveFollowUpCopyWith(
    ActiveFollowUp value,
    $Res Function(ActiveFollowUp) then,
  ) = _$ActiveFollowUpCopyWithImpl<$Res, ActiveFollowUp>;
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String followupId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String departmentId,
    @JsonKey(name: 'department_name') String departmentName,
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'valid_until') String validUntil,
    @JsonKey(name: 'days_remaining') int daysRemaining,
    @JsonKey(name: 'is_free') bool isFree,
  });
}

/// @nodoc
class _$ActiveFollowUpCopyWithImpl<$Res, $Val extends ActiveFollowUp>
    implements $ActiveFollowUpCopyWith<$Res> {
  _$ActiveFollowUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = null,
    Object? departmentName = null,
    Object? appointmentId = null,
    Object? appointmentDate = null,
    Object? validUntil = null,
    Object? daysRemaining = null,
    Object? isFree = null,
  }) {
    return _then(
      _value.copyWith(
            followupId: null == followupId
                ? _value.followupId
                : followupId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: null == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentName: null == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentDate: null == appointmentDate
                ? _value.appointmentDate
                : appointmentDate // ignore: cast_nullable_to_non_nullable
                      as String,
            validUntil: null == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String,
            daysRemaining: null == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
            isFree: null == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActiveFollowUpImplCopyWith<$Res>
    implements $ActiveFollowUpCopyWith<$Res> {
  factory _$$ActiveFollowUpImplCopyWith(
    _$ActiveFollowUpImpl value,
    $Res Function(_$ActiveFollowUpImpl) then,
  ) = __$$ActiveFollowUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String followupId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String departmentId,
    @JsonKey(name: 'department_name') String departmentName,
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'valid_until') String validUntil,
    @JsonKey(name: 'days_remaining') int daysRemaining,
    @JsonKey(name: 'is_free') bool isFree,
  });
}

/// @nodoc
class __$$ActiveFollowUpImplCopyWithImpl<$Res>
    extends _$ActiveFollowUpCopyWithImpl<$Res, _$ActiveFollowUpImpl>
    implements _$$ActiveFollowUpImplCopyWith<$Res> {
  __$$ActiveFollowUpImplCopyWithImpl(
    _$ActiveFollowUpImpl _value,
    $Res Function(_$ActiveFollowUpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActiveFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = null,
    Object? departmentName = null,
    Object? appointmentId = null,
    Object? appointmentDate = null,
    Object? validUntil = null,
    Object? daysRemaining = null,
    Object? isFree = null,
  }) {
    return _then(
      _$ActiveFollowUpImpl(
        followupId: null == followupId
            ? _value.followupId
            : followupId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: null == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentName: null == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentDate: null == appointmentDate
            ? _value.appointmentDate
            : appointmentDate // ignore: cast_nullable_to_non_nullable
                  as String,
        validUntil: null == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String,
        daysRemaining: null == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
        isFree: null == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveFollowUpImpl implements _ActiveFollowUp {
  const _$ActiveFollowUpImpl({
    @JsonKey(name: 'followup_id') required this.followupId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_name') required this.doctorName,
    @JsonKey(name: 'department_id') required this.departmentId,
    @JsonKey(name: 'department_name') required this.departmentName,
    @JsonKey(name: 'appointment_id') required this.appointmentId,
    @JsonKey(name: 'appointment_date') required this.appointmentDate,
    @JsonKey(name: 'valid_until') required this.validUntil,
    @JsonKey(name: 'days_remaining') required this.daysRemaining,
    @JsonKey(name: 'is_free') required this.isFree,
  });

  factory _$ActiveFollowUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveFollowUpImplFromJson(json);

  @override
  @JsonKey(name: 'followup_id')
  final String followupId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @override
  @JsonKey(name: 'department_id')
  final String departmentId;
  @override
  @JsonKey(name: 'department_name')
  final String departmentName;
  @override
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @override
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  @override
  @JsonKey(name: 'valid_until')
  final String validUntil;
  @override
  @JsonKey(name: 'days_remaining')
  final int daysRemaining;
  @override
  @JsonKey(name: 'is_free')
  final bool isFree;

  @override
  String toString() {
    return 'ActiveFollowUp(followupId: $followupId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, appointmentId: $appointmentId, appointmentDate: $appointmentDate, validUntil: $validUntil, daysRemaining: $daysRemaining, isFree: $isFree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveFollowUpImpl &&
            (identical(other.followupId, followupId) ||
                other.followupId == followupId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.isFree, isFree) || other.isFree == isFree));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followupId,
    doctorId,
    doctorName,
    departmentId,
    departmentName,
    appointmentId,
    appointmentDate,
    validUntil,
    daysRemaining,
    isFree,
  );

  /// Create a copy of ActiveFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveFollowUpImplCopyWith<_$ActiveFollowUpImpl> get copyWith =>
      __$$ActiveFollowUpImplCopyWithImpl<_$ActiveFollowUpImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveFollowUpImplToJson(this);
  }
}

abstract class _ActiveFollowUp implements ActiveFollowUp {
  const factory _ActiveFollowUp({
    @JsonKey(name: 'followup_id') required final String followupId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_name') required final String doctorName,
    @JsonKey(name: 'department_id') required final String departmentId,
    @JsonKey(name: 'department_name') required final String departmentName,
    @JsonKey(name: 'appointment_id') required final String appointmentId,
    @JsonKey(name: 'appointment_date') required final String appointmentDate,
    @JsonKey(name: 'valid_until') required final String validUntil,
    @JsonKey(name: 'days_remaining') required final int daysRemaining,
    @JsonKey(name: 'is_free') required final bool isFree,
  }) = _$ActiveFollowUpImpl;

  factory _ActiveFollowUp.fromJson(Map<String, dynamic> json) =
      _$ActiveFollowUpImpl.fromJson;

  @override
  @JsonKey(name: 'followup_id')
  String get followupId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String get doctorName;
  @override
  @JsonKey(name: 'department_id')
  String get departmentId;
  @override
  @JsonKey(name: 'department_name')
  String get departmentName;
  @override
  @JsonKey(name: 'appointment_id')
  String get appointmentId;
  @override
  @JsonKey(name: 'appointment_date')
  String get appointmentDate;
  @override
  @JsonKey(name: 'valid_until')
  String get validUntil;
  @override
  @JsonKey(name: 'days_remaining')
  int get daysRemaining;
  @override
  @JsonKey(name: 'is_free')
  bool get isFree;

  /// Create a copy of ActiveFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveFollowUpImplCopyWith<_$ActiveFollowUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicPatient _$ClinicPatientFromJson(Map<String, dynamic> json) {
  return _ClinicPatient.fromJson(json);
}

/// @nodoc
mixin _$ClinicPatient {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'mo_id')
  String? get moId => throw _privateConstructorUsedError;
  @JsonKey(name: 'medical_history')
  String? get medicalHistory => throw _privateConstructorUsedError;
  String? get allergies => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'smoking_status')
  String? get smokingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'alcohol_use')
  String? get alcoholUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_cm')
  int? get heightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_kg')
  int? get weightKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'global_patient_id')
  String? get globalPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError; // ✅ NEW: Status fields from clinic_patients table
  @JsonKey(name: 'current_followup_status')
  String? get currentFollowupStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_appointment_id')
  String? get lastAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_followup_id')
  String? get lastFollowupId => throw _privateConstructorUsedError; // ✅ NEW: Full appointments array with all fields
  @JsonKey(name: 'appointments')
  List<AppointmentDetail> get appointments =>
      throw _privateConstructorUsedError; // ✅ NEW: Full follow-ups array with all fields
  @JsonKey(name: 'follow_ups')
  List<FollowUpDetail> get followUps => throw _privateConstructorUsedError; // ✅ LEGACY: Appointment history fields (for backward compatibility)
  @JsonKey(name: 'last_appointment')
  LastAppointmentInfo? get lastAppointment =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_eligibility')
  FollowUpEligibility? get followUpEligibility =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_appointments')
  int get totalAppointments => throw _privateConstructorUsedError; // ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
  @JsonKey(name: 'appointments_history')
  List<AppointmentHistoryItem> get appointmentsHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'eligible_follow_ups')
  List<EligibleFollowUp> get eligibleFollowUps =>
      throw _privateConstructorUsedError; // ✅ LEGACY: Expired follow-ups that need renewal
  @JsonKey(name: 'expired_followups')
  List<ExpiredFollowUp> get expiredFollowups =>
      throw _privateConstructorUsedError;

  /// Serializes this ClinicPatient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicPatientCopyWith<ClinicPatient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicPatientCopyWith<$Res> {
  factory $ClinicPatientCopyWith(
    ClinicPatient value,
    $Res Function(ClinicPatient) then,
  ) = _$ClinicPatientCopyWithImpl<$Res, ClinicPatient>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,
    @JsonKey(name: 'alcohol_use') String? alcoholUse,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'global_patient_id') String? globalPatientId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'current_followup_status') String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') String? lastFollowupId,
    @JsonKey(name: 'appointments') List<AppointmentDetail> appointments,
    @JsonKey(name: 'follow_ups') List<FollowUpDetail> followUps,
    @JsonKey(name: 'last_appointment') LastAppointmentInfo? lastAppointment,
    @JsonKey(name: 'follow_up_eligibility')
    FollowUpEligibility? followUpEligibility,
    @JsonKey(name: 'total_appointments') int totalAppointments,
    @JsonKey(name: 'appointments_history')
    List<AppointmentHistoryItem> appointmentsHistory,
    @JsonKey(name: 'eligible_follow_ups')
    List<EligibleFollowUp> eligibleFollowUps,
    @JsonKey(name: 'expired_followups') List<ExpiredFollowUp> expiredFollowups,
  });

  $LastAppointmentInfoCopyWith<$Res>? get lastAppointment;
  $FollowUpEligibilityCopyWith<$Res>? get followUpEligibility;
}

/// @nodoc
class _$ClinicPatientCopyWithImpl<$Res, $Val extends ClinicPatient>
    implements $ClinicPatientCopyWith<$Res> {
  _$ClinicPatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? moId = freezed,
    Object? medicalHistory = freezed,
    Object? allergies = freezed,
    Object? bloodGroup = freezed,
    Object? smokingStatus = freezed,
    Object? alcoholUse = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? isActive = null,
    Object? globalPatientId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? currentFollowupStatus = freezed,
    Object? lastAppointmentId = freezed,
    Object? lastFollowupId = freezed,
    Object? appointments = null,
    Object? followUps = null,
    Object? lastAppointment = freezed,
    Object? followUpEligibility = freezed,
    Object? totalAppointments = null,
    Object? appointmentsHistory = null,
    Object? eligibleFollowUps = null,
    Object? expiredFollowups = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            address1: freezed == address1
                ? _value.address1
                : address1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            address2: freezed == address2
                ? _value.address2
                : address2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            district: freezed == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            moId: freezed == moId
                ? _value.moId
                : moId // ignore: cast_nullable_to_non_nullable
                      as String?,
            medicalHistory: freezed == medicalHistory
                ? _value.medicalHistory
                : medicalHistory // ignore: cast_nullable_to_non_nullable
                      as String?,
            allergies: freezed == allergies
                ? _value.allergies
                : allergies // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodGroup: freezed == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            smokingStatus: freezed == smokingStatus
                ? _value.smokingStatus
                : smokingStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            alcoholUse: freezed == alcoholUse
                ? _value.alcoholUse
                : alcoholUse // ignore: cast_nullable_to_non_nullable
                      as String?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as int?,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as int?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            globalPatientId: freezed == globalPatientId
                ? _value.globalPatientId
                : globalPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentFollowupStatus: freezed == currentFollowupStatus
                ? _value.currentFollowupStatus
                : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastAppointmentId: freezed == lastAppointmentId
                ? _value.lastAppointmentId
                : lastAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastFollowupId: freezed == lastFollowupId
                ? _value.lastFollowupId
                : lastFollowupId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentDetail>,
            followUps: null == followUps
                ? _value.followUps
                : followUps // ignore: cast_nullable_to_non_nullable
                      as List<FollowUpDetail>,
            lastAppointment: freezed == lastAppointment
                ? _value.lastAppointment
                : lastAppointment // ignore: cast_nullable_to_non_nullable
                      as LastAppointmentInfo?,
            followUpEligibility: freezed == followUpEligibility
                ? _value.followUpEligibility
                : followUpEligibility // ignore: cast_nullable_to_non_nullable
                      as FollowUpEligibility?,
            totalAppointments: null == totalAppointments
                ? _value.totalAppointments
                : totalAppointments // ignore: cast_nullable_to_non_nullable
                      as int,
            appointmentsHistory: null == appointmentsHistory
                ? _value.appointmentsHistory
                : appointmentsHistory // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentHistoryItem>,
            eligibleFollowUps: null == eligibleFollowUps
                ? _value.eligibleFollowUps
                : eligibleFollowUps // ignore: cast_nullable_to_non_nullable
                      as List<EligibleFollowUp>,
            expiredFollowups: null == expiredFollowups
                ? _value.expiredFollowups
                : expiredFollowups // ignore: cast_nullable_to_non_nullable
                      as List<ExpiredFollowUp>,
          )
          as $Val,
    );
  }

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LastAppointmentInfoCopyWith<$Res>? get lastAppointment {
    if (_value.lastAppointment == null) {
      return null;
    }

    return $LastAppointmentInfoCopyWith<$Res>(_value.lastAppointment!, (value) {
      return _then(_value.copyWith(lastAppointment: value) as $Val);
    });
  }

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpEligibilityCopyWith<$Res>? get followUpEligibility {
    if (_value.followUpEligibility == null) {
      return null;
    }

    return $FollowUpEligibilityCopyWith<$Res>(_value.followUpEligibility!, (
      value,
    ) {
      return _then(_value.copyWith(followUpEligibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicPatientImplCopyWith<$Res>
    implements $ClinicPatientCopyWith<$Res> {
  factory _$$ClinicPatientImplCopyWith(
    _$ClinicPatientImpl value,
    $Res Function(_$ClinicPatientImpl) then,
  ) = __$$ClinicPatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,
    @JsonKey(name: 'alcohol_use') String? alcoholUse,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'global_patient_id') String? globalPatientId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'current_followup_status') String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') String? lastFollowupId,
    @JsonKey(name: 'appointments') List<AppointmentDetail> appointments,
    @JsonKey(name: 'follow_ups') List<FollowUpDetail> followUps,
    @JsonKey(name: 'last_appointment') LastAppointmentInfo? lastAppointment,
    @JsonKey(name: 'follow_up_eligibility')
    FollowUpEligibility? followUpEligibility,
    @JsonKey(name: 'total_appointments') int totalAppointments,
    @JsonKey(name: 'appointments_history')
    List<AppointmentHistoryItem> appointmentsHistory,
    @JsonKey(name: 'eligible_follow_ups')
    List<EligibleFollowUp> eligibleFollowUps,
    @JsonKey(name: 'expired_followups') List<ExpiredFollowUp> expiredFollowups,
  });

  @override
  $LastAppointmentInfoCopyWith<$Res>? get lastAppointment;
  @override
  $FollowUpEligibilityCopyWith<$Res>? get followUpEligibility;
}

/// @nodoc
class __$$ClinicPatientImplCopyWithImpl<$Res>
    extends _$ClinicPatientCopyWithImpl<$Res, _$ClinicPatientImpl>
    implements _$$ClinicPatientImplCopyWith<$Res> {
  __$$ClinicPatientImplCopyWithImpl(
    _$ClinicPatientImpl _value,
    $Res Function(_$ClinicPatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? moId = freezed,
    Object? medicalHistory = freezed,
    Object? allergies = freezed,
    Object? bloodGroup = freezed,
    Object? smokingStatus = freezed,
    Object? alcoholUse = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? isActive = null,
    Object? globalPatientId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? currentFollowupStatus = freezed,
    Object? lastAppointmentId = freezed,
    Object? lastFollowupId = freezed,
    Object? appointments = null,
    Object? followUps = null,
    Object? lastAppointment = freezed,
    Object? followUpEligibility = freezed,
    Object? totalAppointments = null,
    Object? appointmentsHistory = null,
    Object? eligibleFollowUps = null,
    Object? expiredFollowups = null,
  }) {
    return _then(
      _$ClinicPatientImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        address1: freezed == address1
            ? _value.address1
            : address1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        address2: freezed == address2
            ? _value.address2
            : address2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        district: freezed == district
            ? _value.district
            : district // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        moId: freezed == moId
            ? _value.moId
            : moId // ignore: cast_nullable_to_non_nullable
                  as String?,
        medicalHistory: freezed == medicalHistory
            ? _value.medicalHistory
            : medicalHistory // ignore: cast_nullable_to_non_nullable
                  as String?,
        allergies: freezed == allergies
            ? _value.allergies
            : allergies // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodGroup: freezed == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        smokingStatus: freezed == smokingStatus
            ? _value.smokingStatus
            : smokingStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        alcoholUse: freezed == alcoholUse
            ? _value.alcoholUse
            : alcoholUse // ignore: cast_nullable_to_non_nullable
                  as String?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as int?,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as int?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        globalPatientId: freezed == globalPatientId
            ? _value.globalPatientId
            : globalPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentFollowupStatus: freezed == currentFollowupStatus
            ? _value.currentFollowupStatus
            : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastAppointmentId: freezed == lastAppointmentId
            ? _value.lastAppointmentId
            : lastAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastFollowupId: freezed == lastFollowupId
            ? _value.lastFollowupId
            : lastFollowupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentDetail>,
        followUps: null == followUps
            ? _value._followUps
            : followUps // ignore: cast_nullable_to_non_nullable
                  as List<FollowUpDetail>,
        lastAppointment: freezed == lastAppointment
            ? _value.lastAppointment
            : lastAppointment // ignore: cast_nullable_to_non_nullable
                  as LastAppointmentInfo?,
        followUpEligibility: freezed == followUpEligibility
            ? _value.followUpEligibility
            : followUpEligibility // ignore: cast_nullable_to_non_nullable
                  as FollowUpEligibility?,
        totalAppointments: null == totalAppointments
            ? _value.totalAppointments
            : totalAppointments // ignore: cast_nullable_to_non_nullable
                  as int,
        appointmentsHistory: null == appointmentsHistory
            ? _value._appointmentsHistory
            : appointmentsHistory // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentHistoryItem>,
        eligibleFollowUps: null == eligibleFollowUps
            ? _value._eligibleFollowUps
            : eligibleFollowUps // ignore: cast_nullable_to_non_nullable
                  as List<EligibleFollowUp>,
        expiredFollowups: null == expiredFollowups
            ? _value._expiredFollowups
            : expiredFollowups // ignore: cast_nullable_to_non_nullable
                  as List<ExpiredFollowUp>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicPatientImpl implements _ClinicPatient {
  const _$ClinicPatientImpl({
    required this.id,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    required this.phone,
    this.email,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.age,
    this.gender,
    this.address1,
    this.address2,
    this.district,
    this.state,
    @JsonKey(name: 'mo_id') this.moId,
    @JsonKey(name: 'medical_history') this.medicalHistory,
    this.allergies,
    @JsonKey(name: 'blood_group') this.bloodGroup,
    @JsonKey(name: 'smoking_status') this.smokingStatus,
    @JsonKey(name: 'alcohol_use') this.alcoholUse,
    @JsonKey(name: 'height_cm') this.heightCm,
    @JsonKey(name: 'weight_kg') this.weightKg,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'global_patient_id') this.globalPatientId,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'current_followup_status') this.currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') this.lastAppointmentId,
    @JsonKey(name: 'last_followup_id') this.lastFollowupId,
    @JsonKey(name: 'appointments')
    final List<AppointmentDetail> appointments = const [],
    @JsonKey(name: 'follow_ups')
    final List<FollowUpDetail> followUps = const [],
    @JsonKey(name: 'last_appointment') this.lastAppointment,
    @JsonKey(name: 'follow_up_eligibility') this.followUpEligibility,
    @JsonKey(name: 'total_appointments') this.totalAppointments = 0,
    @JsonKey(name: 'appointments_history')
    final List<AppointmentHistoryItem> appointmentsHistory = const [],
    @JsonKey(name: 'eligible_follow_ups')
    final List<EligibleFollowUp> eligibleFollowUps = const [],
    @JsonKey(name: 'expired_followups')
    final List<ExpiredFollowUp> expiredFollowups = const [],
  }) : _appointments = appointments,
       _followUps = followUps,
       _appointmentsHistory = appointmentsHistory,
       _eligibleFollowUps = eligibleFollowUps,
       _expiredFollowups = expiredFollowups;

  factory _$ClinicPatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicPatientImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? district;
  @override
  final String? state;
  @override
  @JsonKey(name: 'mo_id')
  final String? moId;
  @override
  @JsonKey(name: 'medical_history')
  final String? medicalHistory;
  @override
  final String? allergies;
  @override
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @override
  @JsonKey(name: 'smoking_status')
  final String? smokingStatus;
  @override
  @JsonKey(name: 'alcohol_use')
  final String? alcoholUse;
  @override
  @JsonKey(name: 'height_cm')
  final int? heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  final int? weightKg;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'global_patient_id')
  final String? globalPatientId;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  // ✅ NEW: Status fields from clinic_patients table
  @override
  @JsonKey(name: 'current_followup_status')
  final String? currentFollowupStatus;
  @override
  @JsonKey(name: 'last_appointment_id')
  final String? lastAppointmentId;
  @override
  @JsonKey(name: 'last_followup_id')
  final String? lastFollowupId;
  // ✅ NEW: Full appointments array with all fields
  final List<AppointmentDetail> _appointments;
  // ✅ NEW: Full appointments array with all fields
  @override
  @JsonKey(name: 'appointments')
  List<AppointmentDetail> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  // ✅ NEW: Full follow-ups array with all fields
  final List<FollowUpDetail> _followUps;
  // ✅ NEW: Full follow-ups array with all fields
  @override
  @JsonKey(name: 'follow_ups')
  List<FollowUpDetail> get followUps {
    if (_followUps is EqualUnmodifiableListView) return _followUps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followUps);
  }

  // ✅ LEGACY: Appointment history fields (for backward compatibility)
  @override
  @JsonKey(name: 'last_appointment')
  final LastAppointmentInfo? lastAppointment;
  @override
  @JsonKey(name: 'follow_up_eligibility')
  final FollowUpEligibility? followUpEligibility;
  @override
  @JsonKey(name: 'total_appointments')
  final int totalAppointments;
  // ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
  final List<AppointmentHistoryItem> _appointmentsHistory;
  // ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
  @override
  @JsonKey(name: 'appointments_history')
  List<AppointmentHistoryItem> get appointmentsHistory {
    if (_appointmentsHistory is EqualUnmodifiableListView)
      return _appointmentsHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointmentsHistory);
  }

  final List<EligibleFollowUp> _eligibleFollowUps;
  @override
  @JsonKey(name: 'eligible_follow_ups')
  List<EligibleFollowUp> get eligibleFollowUps {
    if (_eligibleFollowUps is EqualUnmodifiableListView)
      return _eligibleFollowUps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eligibleFollowUps);
  }

  // ✅ LEGACY: Expired follow-ups that need renewal
  final List<ExpiredFollowUp> _expiredFollowups;
  // ✅ LEGACY: Expired follow-ups that need renewal
  @override
  @JsonKey(name: 'expired_followups')
  List<ExpiredFollowUp> get expiredFollowups {
    if (_expiredFollowups is EqualUnmodifiableListView)
      return _expiredFollowups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expiredFollowups);
  }

  @override
  String toString() {
    return 'ClinicPatient(id: $id, clinicId: $clinicId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, address1: $address1, address2: $address2, district: $district, state: $state, moId: $moId, medicalHistory: $medicalHistory, allergies: $allergies, bloodGroup: $bloodGroup, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, heightCm: $heightCm, weightKg: $weightKg, isActive: $isActive, globalPatientId: $globalPatientId, createdAt: $createdAt, updatedAt: $updatedAt, currentFollowupStatus: $currentFollowupStatus, lastAppointmentId: $lastAppointmentId, lastFollowupId: $lastFollowupId, appointments: $appointments, followUps: $followUps, lastAppointment: $lastAppointment, followUpEligibility: $followUpEligibility, totalAppointments: $totalAppointments, appointmentsHistory: $appointmentsHistory, eligibleFollowUps: $eligibleFollowUps, expiredFollowups: $expiredFollowups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicPatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.moId, moId) || other.moId == moId) &&
            (identical(other.medicalHistory, medicalHistory) ||
                other.medicalHistory == medicalHistory) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.smokingStatus, smokingStatus) ||
                other.smokingStatus == smokingStatus) &&
            (identical(other.alcoholUse, alcoholUse) ||
                other.alcoholUse == alcoholUse) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.globalPatientId, globalPatientId) ||
                other.globalPatientId == globalPatientId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currentFollowupStatus, currentFollowupStatus) ||
                other.currentFollowupStatus == currentFollowupStatus) &&
            (identical(other.lastAppointmentId, lastAppointmentId) ||
                other.lastAppointmentId == lastAppointmentId) &&
            (identical(other.lastFollowupId, lastFollowupId) ||
                other.lastFollowupId == lastFollowupId) &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ) &&
            const DeepCollectionEquality().equals(
              other._followUps,
              _followUps,
            ) &&
            (identical(other.lastAppointment, lastAppointment) ||
                other.lastAppointment == lastAppointment) &&
            (identical(other.followUpEligibility, followUpEligibility) ||
                other.followUpEligibility == followUpEligibility) &&
            (identical(other.totalAppointments, totalAppointments) ||
                other.totalAppointments == totalAppointments) &&
            const DeepCollectionEquality().equals(
              other._appointmentsHistory,
              _appointmentsHistory,
            ) &&
            const DeepCollectionEquality().equals(
              other._eligibleFollowUps,
              _eligibleFollowUps,
            ) &&
            const DeepCollectionEquality().equals(
              other._expiredFollowups,
              _expiredFollowups,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    clinicId,
    firstName,
    lastName,
    phone,
    email,
    dateOfBirth,
    age,
    gender,
    address1,
    address2,
    district,
    state,
    moId,
    medicalHistory,
    allergies,
    bloodGroup,
    smokingStatus,
    alcoholUse,
    heightCm,
    weightKg,
    isActive,
    globalPatientId,
    createdAt,
    updatedAt,
    currentFollowupStatus,
    lastAppointmentId,
    lastFollowupId,
    const DeepCollectionEquality().hash(_appointments),
    const DeepCollectionEquality().hash(_followUps),
    lastAppointment,
    followUpEligibility,
    totalAppointments,
    const DeepCollectionEquality().hash(_appointmentsHistory),
    const DeepCollectionEquality().hash(_eligibleFollowUps),
    const DeepCollectionEquality().hash(_expiredFollowups),
  ]);

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicPatientImplCopyWith<_$ClinicPatientImpl> get copyWith =>
      __$$ClinicPatientImplCopyWithImpl<_$ClinicPatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicPatientImplToJson(this);
  }
}

abstract class _ClinicPatient implements ClinicPatient {
  const factory _ClinicPatient({
    required final String id,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    required final String phone,
    final String? email,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final int? age,
    final String? gender,
    final String? address1,
    final String? address2,
    final String? district,
    final String? state,
    @JsonKey(name: 'mo_id') final String? moId,
    @JsonKey(name: 'medical_history') final String? medicalHistory,
    final String? allergies,
    @JsonKey(name: 'blood_group') final String? bloodGroup,
    @JsonKey(name: 'smoking_status') final String? smokingStatus,
    @JsonKey(name: 'alcohol_use') final String? alcoholUse,
    @JsonKey(name: 'height_cm') final int? heightCm,
    @JsonKey(name: 'weight_kg') final int? weightKg,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'global_patient_id') final String? globalPatientId,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    @JsonKey(name: 'current_followup_status')
    final String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') final String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') final String? lastFollowupId,
    @JsonKey(name: 'appointments') final List<AppointmentDetail> appointments,
    @JsonKey(name: 'follow_ups') final List<FollowUpDetail> followUps,
    @JsonKey(name: 'last_appointment')
    final LastAppointmentInfo? lastAppointment,
    @JsonKey(name: 'follow_up_eligibility')
    final FollowUpEligibility? followUpEligibility,
    @JsonKey(name: 'total_appointments') final int totalAppointments,
    @JsonKey(name: 'appointments_history')
    final List<AppointmentHistoryItem> appointmentsHistory,
    @JsonKey(name: 'eligible_follow_ups')
    final List<EligibleFollowUp> eligibleFollowUps,
    @JsonKey(name: 'expired_followups')
    final List<ExpiredFollowUp> expiredFollowups,
  }) = _$ClinicPatientImpl;

  factory _ClinicPatient.fromJson(Map<String, dynamic> json) =
      _$ClinicPatientImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get address1;
  @override
  String? get address2;
  @override
  String? get district;
  @override
  String? get state;
  @override
  @JsonKey(name: 'mo_id')
  String? get moId;
  @override
  @JsonKey(name: 'medical_history')
  String? get medicalHistory;
  @override
  String? get allergies;
  @override
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @override
  @JsonKey(name: 'smoking_status')
  String? get smokingStatus;
  @override
  @JsonKey(name: 'alcohol_use')
  String? get alcoholUse;
  @override
  @JsonKey(name: 'height_cm')
  int? get heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  int? get weightKg;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'global_patient_id')
  String? get globalPatientId;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt; // ✅ NEW: Status fields from clinic_patients table
  @override
  @JsonKey(name: 'current_followup_status')
  String? get currentFollowupStatus;
  @override
  @JsonKey(name: 'last_appointment_id')
  String? get lastAppointmentId;
  @override
  @JsonKey(name: 'last_followup_id')
  String? get lastFollowupId; // ✅ NEW: Full appointments array with all fields
  @override
  @JsonKey(name: 'appointments')
  List<AppointmentDetail> get appointments; // ✅ NEW: Full follow-ups array with all fields
  @override
  @JsonKey(name: 'follow_ups')
  List<FollowUpDetail> get followUps; // ✅ LEGACY: Appointment history fields (for backward compatibility)
  @override
  @JsonKey(name: 'last_appointment')
  LastAppointmentInfo? get lastAppointment;
  @override
  @JsonKey(name: 'follow_up_eligibility')
  FollowUpEligibility? get followUpEligibility;
  @override
  @JsonKey(name: 'total_appointments')
  int get totalAppointments; // ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
  @override
  @JsonKey(name: 'appointments_history')
  List<AppointmentHistoryItem> get appointmentsHistory;
  @override
  @JsonKey(name: 'eligible_follow_ups')
  List<EligibleFollowUp> get eligibleFollowUps; // ✅ LEGACY: Expired follow-ups that need renewal
  @override
  @JsonKey(name: 'expired_followups')
  List<ExpiredFollowUp> get expiredFollowups;

  /// Create a copy of ClinicPatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicPatientImplCopyWith<_$ClinicPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LastAppointmentInfo _$LastAppointmentInfoFromJson(Map<String, dynamic> json) {
  return _LastAppointmentInfo.fromJson(json);
}

/// @nodoc
mixin _$LastAppointmentInfo {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_since')
  int get daysSince => throw _privateConstructorUsedError;

  /// Serializes this LastAppointmentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LastAppointmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LastAppointmentInfoCopyWith<LastAppointmentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastAppointmentInfoCopyWith<$Res> {
  factory $LastAppointmentInfoCopyWith(
    LastAppointmentInfo value,
    $Res Function(LastAppointmentInfo) then,
  ) = _$LastAppointmentInfoCopyWithImpl<$Res, LastAppointmentInfo>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String? department,
    String date,
    String? status,
    @JsonKey(name: 'days_since') int daysSince,
  });
}

/// @nodoc
class _$LastAppointmentInfoCopyWithImpl<$Res, $Val extends LastAppointmentInfo>
    implements $LastAppointmentInfoCopyWith<$Res> {
  _$LastAppointmentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LastAppointmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? department = freezed,
    Object? date = null,
    Object? status = freezed,
    Object? daysSince = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            daysSince: null == daysSince
                ? _value.daysSince
                : daysSince // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LastAppointmentInfoImplCopyWith<$Res>
    implements $LastAppointmentInfoCopyWith<$Res> {
  factory _$$LastAppointmentInfoImplCopyWith(
    _$LastAppointmentInfoImpl value,
    $Res Function(_$LastAppointmentInfoImpl) then,
  ) = __$$LastAppointmentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String? department,
    String date,
    String? status,
    @JsonKey(name: 'days_since') int daysSince,
  });
}

/// @nodoc
class __$$LastAppointmentInfoImplCopyWithImpl<$Res>
    extends _$LastAppointmentInfoCopyWithImpl<$Res, _$LastAppointmentInfoImpl>
    implements _$$LastAppointmentInfoImplCopyWith<$Res> {
  __$$LastAppointmentInfoImplCopyWithImpl(
    _$LastAppointmentInfoImpl _value,
    $Res Function(_$LastAppointmentInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LastAppointmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? department = freezed,
    Object? date = null,
    Object? status = freezed,
    Object? daysSince = null,
  }) {
    return _then(
      _$LastAppointmentInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        daysSince: null == daysSince
            ? _value.daysSince
            : daysSince // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LastAppointmentInfoImpl implements _LastAppointmentInfo {
  const _$LastAppointmentInfoImpl({
    required this.id,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_name') required this.doctorName,
    @JsonKey(name: 'department_id') this.departmentId,
    this.department,
    required this.date,
    this.status,
    @JsonKey(name: 'days_since') required this.daysSince,
  });

  factory _$LastAppointmentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastAppointmentInfoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;
  @override
  final String? department;
  @override
  final String date;
  @override
  final String? status;
  @override
  @JsonKey(name: 'days_since')
  final int daysSince;

  @override
  String toString() {
    return 'LastAppointmentInfo(id: $id, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, date: $date, status: $status, daysSince: $daysSince)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastAppointmentInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.daysSince, daysSince) ||
                other.daysSince == daysSince));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    doctorId,
    doctorName,
    departmentId,
    department,
    date,
    status,
    daysSince,
  );

  /// Create a copy of LastAppointmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LastAppointmentInfoImplCopyWith<_$LastAppointmentInfoImpl> get copyWith =>
      __$$LastAppointmentInfoImplCopyWithImpl<_$LastAppointmentInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LastAppointmentInfoImplToJson(this);
  }
}

abstract class _LastAppointmentInfo implements LastAppointmentInfo {
  const factory _LastAppointmentInfo({
    required final String id,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_name') required final String doctorName,
    @JsonKey(name: 'department_id') final String? departmentId,
    final String? department,
    required final String date,
    final String? status,
    @JsonKey(name: 'days_since') required final int daysSince,
  }) = _$LastAppointmentInfoImpl;

  factory _LastAppointmentInfo.fromJson(Map<String, dynamic> json) =
      _$LastAppointmentInfoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String get doctorName;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;
  @override
  String? get department;
  @override
  String get date;
  @override
  String? get status;
  @override
  @JsonKey(name: 'days_since')
  int get daysSince;

  /// Create a copy of LastAppointmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LastAppointmentInfoImplCopyWith<_$LastAppointmentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowUpEligibility _$FollowUpEligibilityFromJson(Map<String, dynamic> json) {
  return _FollowUpEligibility.fromJson(json);
}

/// @nodoc
mixin _$FollowUpEligibility {
  bool get eligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_free')
  bool get isFree => throw _privateConstructorUsedError; // ✅ NEW: Is follow-up free?
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this FollowUpEligibility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpEligibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpEligibilityCopyWith<FollowUpEligibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpEligibilityCopyWith<$Res> {
  factory $FollowUpEligibilityCopyWith(
    FollowUpEligibility value,
    $Res Function(FollowUpEligibility) then,
  ) = _$FollowUpEligibilityCopyWithImpl<$Res, FollowUpEligibility>;
  @useResult
  $Res call({
    bool eligible,
    @JsonKey(name: 'is_free') bool isFree,
    String? reason,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    String? message,
  });
}

/// @nodoc
class _$FollowUpEligibilityCopyWithImpl<$Res, $Val extends FollowUpEligibility>
    implements $FollowUpEligibilityCopyWith<$Res> {
  _$FollowUpEligibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpEligibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eligible = null,
    Object? isFree = null,
    Object? reason = freezed,
    Object? daysRemaining = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            eligible: null == eligible
                ? _value.eligible
                : eligible // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFree: null == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            daysRemaining: freezed == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowUpEligibilityImplCopyWith<$Res>
    implements $FollowUpEligibilityCopyWith<$Res> {
  factory _$$FollowUpEligibilityImplCopyWith(
    _$FollowUpEligibilityImpl value,
    $Res Function(_$FollowUpEligibilityImpl) then,
  ) = __$$FollowUpEligibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool eligible,
    @JsonKey(name: 'is_free') bool isFree,
    String? reason,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    String? message,
  });
}

/// @nodoc
class __$$FollowUpEligibilityImplCopyWithImpl<$Res>
    extends _$FollowUpEligibilityCopyWithImpl<$Res, _$FollowUpEligibilityImpl>
    implements _$$FollowUpEligibilityImplCopyWith<$Res> {
  __$$FollowUpEligibilityImplCopyWithImpl(
    _$FollowUpEligibilityImpl _value,
    $Res Function(_$FollowUpEligibilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpEligibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eligible = null,
    Object? isFree = null,
    Object? reason = freezed,
    Object? daysRemaining = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$FollowUpEligibilityImpl(
        eligible: null == eligible
            ? _value.eligible
            : eligible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFree: null == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        daysRemaining: freezed == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpEligibilityImpl implements _FollowUpEligibility {
  const _$FollowUpEligibilityImpl({
    required this.eligible,
    @JsonKey(name: 'is_free') this.isFree = false,
    this.reason,
    @JsonKey(name: 'days_remaining') this.daysRemaining,
    this.message,
  });

  factory _$FollowUpEligibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpEligibilityImplFromJson(json);

  @override
  final bool eligible;
  @override
  @JsonKey(name: 'is_free')
  final bool isFree;
  // ✅ NEW: Is follow-up free?
  @override
  final String? reason;
  @override
  @JsonKey(name: 'days_remaining')
  final int? daysRemaining;
  @override
  final String? message;

  @override
  String toString() {
    return 'FollowUpEligibility(eligible: $eligible, isFree: $isFree, reason: $reason, daysRemaining: $daysRemaining, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpEligibilityImpl &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eligible,
    isFree,
    reason,
    daysRemaining,
    message,
  );

  /// Create a copy of FollowUpEligibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpEligibilityImplCopyWith<_$FollowUpEligibilityImpl> get copyWith =>
      __$$FollowUpEligibilityImplCopyWithImpl<_$FollowUpEligibilityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpEligibilityImplToJson(this);
  }
}

abstract class _FollowUpEligibility implements FollowUpEligibility {
  const factory _FollowUpEligibility({
    required final bool eligible,
    @JsonKey(name: 'is_free') final bool isFree,
    final String? reason,
    @JsonKey(name: 'days_remaining') final int? daysRemaining,
    final String? message,
  }) = _$FollowUpEligibilityImpl;

  factory _FollowUpEligibility.fromJson(Map<String, dynamic> json) =
      _$FollowUpEligibilityImpl.fromJson;

  @override
  bool get eligible;
  @override
  @JsonKey(name: 'is_free')
  bool get isFree; // ✅ NEW: Is follow-up free?
  @override
  String? get reason;
  @override
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining;
  @override
  String? get message;

  /// Create a copy of FollowUpEligibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpEligibilityImplCopyWith<_$FollowUpEligibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentHistoryItem _$AppointmentHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _AppointmentHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$AppointmentHistoryItem {
  @JsonKey(name: 'appointment_id')
  String get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_date')
  String get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_since')
  int get daysSince => throw _privateConstructorUsedError;
  @JsonKey(name: 'validity_days')
  int get validityDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_days')
  int? get remainingDays => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // active, expired, future
  @JsonKey(name: 'follow_up_eligible')
  bool get followUpEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_follow_up_used')
  bool get freeFollowUpUsed => throw _privateConstructorUsedError; // ✅ NEW: Enhanced renewal tracking fields
  @JsonKey(name: 'follow_up_status')
  String? get followUpStatus => throw _privateConstructorUsedError; // active, expired, used, waiting
  @JsonKey(name: 'renewal_status')
  String? get renewalStatus => throw _privateConstructorUsedError; // valid, waiting, renewed
  @JsonKey(name: 'next_followup_expiry')
  String? get nextFollowupExpiry => throw _privateConstructorUsedError; // ISO date
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this AppointmentHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentHistoryItemCopyWith<AppointmentHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentHistoryItemCopyWith<$Res> {
  factory $AppointmentHistoryItemCopyWith(
    AppointmentHistoryItem value,
    $Res Function(AppointmentHistoryItem) then,
  ) = _$AppointmentHistoryItemCopyWithImpl<$Res, AppointmentHistoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String department,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'days_since') int daysSince,
    @JsonKey(name: 'validity_days') int validityDays,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    String status,
    @JsonKey(name: 'follow_up_eligible') bool followUpEligible,
    @JsonKey(name: 'free_follow_up_used') bool freeFollowUpUsed,
    @JsonKey(name: 'follow_up_status') String? followUpStatus,
    @JsonKey(name: 'renewal_status') String? renewalStatus,
    @JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry,
    String? note,
  });
}

/// @nodoc
class _$AppointmentHistoryItemCopyWithImpl<
  $Res,
  $Val extends AppointmentHistoryItem
>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  _$AppointmentHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? department = null,
    Object? appointmentDate = null,
    Object? daysSince = null,
    Object? validityDays = null,
    Object? remainingDays = freezed,
    Object? status = null,
    Object? followUpEligible = null,
    Object? freeFollowUpUsed = null,
    Object? followUpStatus = freezed,
    Object? renewalStatus = freezed,
    Object? nextFollowupExpiry = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: null == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentDate: null == appointmentDate
                ? _value.appointmentDate
                : appointmentDate // ignore: cast_nullable_to_non_nullable
                      as String,
            daysSince: null == daysSince
                ? _value.daysSince
                : daysSince // ignore: cast_nullable_to_non_nullable
                      as int,
            validityDays: null == validityDays
                ? _value.validityDays
                : validityDays // ignore: cast_nullable_to_non_nullable
                      as int,
            remainingDays: freezed == remainingDays
                ? _value.remainingDays
                : remainingDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            followUpEligible: null == followUpEligible
                ? _value.followUpEligible
                : followUpEligible // ignore: cast_nullable_to_non_nullable
                      as bool,
            freeFollowUpUsed: null == freeFollowUpUsed
                ? _value.freeFollowUpUsed
                : freeFollowUpUsed // ignore: cast_nullable_to_non_nullable
                      as bool,
            followUpStatus: freezed == followUpStatus
                ? _value.followUpStatus
                : followUpStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            renewalStatus: freezed == renewalStatus
                ? _value.renewalStatus
                : renewalStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextFollowupExpiry: freezed == nextFollowupExpiry
                ? _value.nextFollowupExpiry
                : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentHistoryItemImplCopyWith<$Res>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  factory _$$AppointmentHistoryItemImplCopyWith(
    _$AppointmentHistoryItemImpl value,
    $Res Function(_$AppointmentHistoryItemImpl) then,
  ) = __$$AppointmentHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String department,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'days_since') int daysSince,
    @JsonKey(name: 'validity_days') int validityDays,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    String status,
    @JsonKey(name: 'follow_up_eligible') bool followUpEligible,
    @JsonKey(name: 'free_follow_up_used') bool freeFollowUpUsed,
    @JsonKey(name: 'follow_up_status') String? followUpStatus,
    @JsonKey(name: 'renewal_status') String? renewalStatus,
    @JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry,
    String? note,
  });
}

/// @nodoc
class __$$AppointmentHistoryItemImplCopyWithImpl<$Res>
    extends
        _$AppointmentHistoryItemCopyWithImpl<$Res, _$AppointmentHistoryItemImpl>
    implements _$$AppointmentHistoryItemImplCopyWith<$Res> {
  __$$AppointmentHistoryItemImplCopyWithImpl(
    _$AppointmentHistoryItemImpl _value,
    $Res Function(_$AppointmentHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? department = null,
    Object? appointmentDate = null,
    Object? daysSince = null,
    Object? validityDays = null,
    Object? remainingDays = freezed,
    Object? status = null,
    Object? followUpEligible = null,
    Object? freeFollowUpUsed = null,
    Object? followUpStatus = freezed,
    Object? renewalStatus = freezed,
    Object? nextFollowupExpiry = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$AppointmentHistoryItemImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: null == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentDate: null == appointmentDate
            ? _value.appointmentDate
            : appointmentDate // ignore: cast_nullable_to_non_nullable
                  as String,
        daysSince: null == daysSince
            ? _value.daysSince
            : daysSince // ignore: cast_nullable_to_non_nullable
                  as int,
        validityDays: null == validityDays
            ? _value.validityDays
            : validityDays // ignore: cast_nullable_to_non_nullable
                  as int,
        remainingDays: freezed == remainingDays
            ? _value.remainingDays
            : remainingDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpEligible: null == followUpEligible
            ? _value.followUpEligible
            : followUpEligible // ignore: cast_nullable_to_non_nullable
                  as bool,
        freeFollowUpUsed: null == freeFollowUpUsed
            ? _value.freeFollowUpUsed
            : freeFollowUpUsed // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpStatus: freezed == followUpStatus
            ? _value.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        renewalStatus: freezed == renewalStatus
            ? _value.renewalStatus
            : renewalStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextFollowupExpiry: freezed == nextFollowupExpiry
            ? _value.nextFollowupExpiry
            : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentHistoryItemImpl implements _AppointmentHistoryItem {
  const _$AppointmentHistoryItemImpl({
    @JsonKey(name: 'appointment_id') required this.appointmentId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_name') required this.doctorName,
    @JsonKey(name: 'department_id') this.departmentId,
    required this.department,
    @JsonKey(name: 'appointment_date') required this.appointmentDate,
    @JsonKey(name: 'days_since') required this.daysSince,
    @JsonKey(name: 'validity_days') this.validityDays = 5,
    @JsonKey(name: 'remaining_days') this.remainingDays,
    required this.status,
    @JsonKey(name: 'follow_up_eligible') this.followUpEligible = false,
    @JsonKey(name: 'free_follow_up_used') this.freeFollowUpUsed = false,
    @JsonKey(name: 'follow_up_status') this.followUpStatus,
    @JsonKey(name: 'renewal_status') this.renewalStatus,
    @JsonKey(name: 'next_followup_expiry') this.nextFollowupExpiry,
    this.note,
  });

  factory _$AppointmentHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentHistoryItemImplFromJson(json);

  @override
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;
  @override
  final String department;
  @override
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  @override
  @JsonKey(name: 'days_since')
  final int daysSince;
  @override
  @JsonKey(name: 'validity_days')
  final int validityDays;
  @override
  @JsonKey(name: 'remaining_days')
  final int? remainingDays;
  @override
  final String status;
  // active, expired, future
  @override
  @JsonKey(name: 'follow_up_eligible')
  final bool followUpEligible;
  @override
  @JsonKey(name: 'free_follow_up_used')
  final bool freeFollowUpUsed;
  // ✅ NEW: Enhanced renewal tracking fields
  @override
  @JsonKey(name: 'follow_up_status')
  final String? followUpStatus;
  // active, expired, used, waiting
  @override
  @JsonKey(name: 'renewal_status')
  final String? renewalStatus;
  // valid, waiting, renewed
  @override
  @JsonKey(name: 'next_followup_expiry')
  final String? nextFollowupExpiry;
  // ISO date
  @override
  final String? note;

  @override
  String toString() {
    return 'AppointmentHistoryItem(appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, appointmentDate: $appointmentDate, daysSince: $daysSince, validityDays: $validityDays, remainingDays: $remainingDays, status: $status, followUpEligible: $followUpEligible, freeFollowUpUsed: $freeFollowUpUsed, followUpStatus: $followUpStatus, renewalStatus: $renewalStatus, nextFollowupExpiry: $nextFollowupExpiry, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentHistoryItemImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.daysSince, daysSince) ||
                other.daysSince == daysSince) &&
            (identical(other.validityDays, validityDays) ||
                other.validityDays == validityDays) &&
            (identical(other.remainingDays, remainingDays) ||
                other.remainingDays == remainingDays) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.followUpEligible, followUpEligible) ||
                other.followUpEligible == followUpEligible) &&
            (identical(other.freeFollowUpUsed, freeFollowUpUsed) ||
                other.freeFollowUpUsed == freeFollowUpUsed) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.renewalStatus, renewalStatus) ||
                other.renewalStatus == renewalStatus) &&
            (identical(other.nextFollowupExpiry, nextFollowupExpiry) ||
                other.nextFollowupExpiry == nextFollowupExpiry) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    doctorId,
    doctorName,
    departmentId,
    department,
    appointmentDate,
    daysSince,
    validityDays,
    remainingDays,
    status,
    followUpEligible,
    freeFollowUpUsed,
    followUpStatus,
    renewalStatus,
    nextFollowupExpiry,
    note,
  );

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentHistoryItemImplCopyWith<_$AppointmentHistoryItemImpl>
  get copyWith =>
      __$$AppointmentHistoryItemImplCopyWithImpl<_$AppointmentHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentHistoryItemImplToJson(this);
  }
}

abstract class _AppointmentHistoryItem implements AppointmentHistoryItem {
  const factory _AppointmentHistoryItem({
    @JsonKey(name: 'appointment_id') required final String appointmentId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_name') required final String doctorName,
    @JsonKey(name: 'department_id') final String? departmentId,
    required final String department,
    @JsonKey(name: 'appointment_date') required final String appointmentDate,
    @JsonKey(name: 'days_since') required final int daysSince,
    @JsonKey(name: 'validity_days') final int validityDays,
    @JsonKey(name: 'remaining_days') final int? remainingDays,
    required final String status,
    @JsonKey(name: 'follow_up_eligible') final bool followUpEligible,
    @JsonKey(name: 'free_follow_up_used') final bool freeFollowUpUsed,
    @JsonKey(name: 'follow_up_status') final String? followUpStatus,
    @JsonKey(name: 'renewal_status') final String? renewalStatus,
    @JsonKey(name: 'next_followup_expiry') final String? nextFollowupExpiry,
    final String? note,
  }) = _$AppointmentHistoryItemImpl;

  factory _AppointmentHistoryItem.fromJson(Map<String, dynamic> json) =
      _$AppointmentHistoryItemImpl.fromJson;

  @override
  @JsonKey(name: 'appointment_id')
  String get appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String get doctorName;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;
  @override
  String get department;
  @override
  @JsonKey(name: 'appointment_date')
  String get appointmentDate;
  @override
  @JsonKey(name: 'days_since')
  int get daysSince;
  @override
  @JsonKey(name: 'validity_days')
  int get validityDays;
  @override
  @JsonKey(name: 'remaining_days')
  int? get remainingDays;
  @override
  String get status; // active, expired, future
  @override
  @JsonKey(name: 'follow_up_eligible')
  bool get followUpEligible;
  @override
  @JsonKey(name: 'free_follow_up_used')
  bool get freeFollowUpUsed; // ✅ NEW: Enhanced renewal tracking fields
  @override
  @JsonKey(name: 'follow_up_status')
  String? get followUpStatus; // active, expired, used, waiting
  @override
  @JsonKey(name: 'renewal_status')
  String? get renewalStatus; // valid, waiting, renewed
  @override
  @JsonKey(name: 'next_followup_expiry')
  String? get nextFollowupExpiry; // ISO date
  @override
  String? get note;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentHistoryItemImplCopyWith<_$AppointmentHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

EligibleFollowUp _$EligibleFollowUpFromJson(Map<String, dynamic> json) {
  return _EligibleFollowUp.fromJson(json);
}

/// @nodoc
mixin _$EligibleFollowUp {
  // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
  @JsonKey(name: 'followup_id')
  String? get followupId => throw _privateConstructorUsedError; // ✅ LEGACY: Source appointment ID (for backward compatibility)
  @JsonKey(name: 'appointment_id')
  String? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;
  String get department =>
      throw _privateConstructorUsedError; // ✅ NEW TABLE-BASED: Valid from/until dates
  @JsonKey(name: 'valid_from')
  String? get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until')
  String? get validUntil => throw _privateConstructorUsedError; // ✅ LEGACY: Appointment date (for backward compatibility)
  @JsonKey(name: 'appointment_date')
  String? get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_days')
  int? get remainingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining => throw _privateConstructorUsedError; // ✅ NEW: Alternative field name
  // ✅ NEW TABLE-BASED: Status tracking
  String? get status =>
      throw _privateConstructorUsedError; // active, used, expired, renewed
  @JsonKey(name: 'is_free')
  bool? get isFree => throw _privateConstructorUsedError; // ✅ NEW: Explicitly track if free
  // ✅ Enhanced renewal tracking
  @JsonKey(name: 'next_followup_expiry')
  String? get nextFollowupExpiry => throw _privateConstructorUsedError; // ISO date
  String? get note => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this EligibleFollowUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EligibleFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EligibleFollowUpCopyWith<EligibleFollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibleFollowUpCopyWith<$Res> {
  factory $EligibleFollowUpCopyWith(
    EligibleFollowUp value,
    $Res Function(EligibleFollowUp) then,
  ) = _$EligibleFollowUpCopyWithImpl<$Res, EligibleFollowUp>;
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String department,
    @JsonKey(name: 'valid_from') String? validFrom,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'appointment_date') String? appointmentDate,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    String? status,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry,
    String? note,
    String? message,
  });
}

/// @nodoc
class _$EligibleFollowUpCopyWithImpl<$Res, $Val extends EligibleFollowUp>
    implements $EligibleFollowUpCopyWith<$Res> {
  _$EligibleFollowUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EligibleFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = freezed,
    Object? appointmentId = freezed,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? department = null,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? appointmentDate = freezed,
    Object? remainingDays = freezed,
    Object? daysRemaining = freezed,
    Object? status = freezed,
    Object? isFree = freezed,
    Object? nextFollowupExpiry = freezed,
    Object? note = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            followupId: freezed == followupId
                ? _value.followupId
                : followupId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: null == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String,
            validFrom: freezed == validFrom
                ? _value.validFrom
                : validFrom // ignore: cast_nullable_to_non_nullable
                      as String?,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentDate: freezed == appointmentDate
                ? _value.appointmentDate
                : appointmentDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            remainingDays: freezed == remainingDays
                ? _value.remainingDays
                : remainingDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            daysRemaining: freezed == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFree: freezed == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool?,
            nextFollowupExpiry: freezed == nextFollowupExpiry
                ? _value.nextFollowupExpiry
                : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EligibleFollowUpImplCopyWith<$Res>
    implements $EligibleFollowUpCopyWith<$Res> {
  factory _$$EligibleFollowUpImplCopyWith(
    _$EligibleFollowUpImpl value,
    $Res Function(_$EligibleFollowUpImpl) then,
  ) = __$$EligibleFollowUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String department,
    @JsonKey(name: 'valid_from') String? validFrom,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'appointment_date') String? appointmentDate,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    String? status,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'next_followup_expiry') String? nextFollowupExpiry,
    String? note,
    String? message,
  });
}

/// @nodoc
class __$$EligibleFollowUpImplCopyWithImpl<$Res>
    extends _$EligibleFollowUpCopyWithImpl<$Res, _$EligibleFollowUpImpl>
    implements _$$EligibleFollowUpImplCopyWith<$Res> {
  __$$EligibleFollowUpImplCopyWithImpl(
    _$EligibleFollowUpImpl _value,
    $Res Function(_$EligibleFollowUpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EligibleFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = freezed,
    Object? appointmentId = freezed,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? department = null,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? appointmentDate = freezed,
    Object? remainingDays = freezed,
    Object? daysRemaining = freezed,
    Object? status = freezed,
    Object? isFree = freezed,
    Object? nextFollowupExpiry = freezed,
    Object? note = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$EligibleFollowUpImpl(
        followupId: freezed == followupId
            ? _value.followupId
            : followupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: null == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String,
        validFrom: freezed == validFrom
            ? _value.validFrom
            : validFrom // ignore: cast_nullable_to_non_nullable
                  as String?,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentDate: freezed == appointmentDate
            ? _value.appointmentDate
            : appointmentDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        remainingDays: freezed == remainingDays
            ? _value.remainingDays
            : remainingDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        daysRemaining: freezed == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFree: freezed == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool?,
        nextFollowupExpiry: freezed == nextFollowupExpiry
            ? _value.nextFollowupExpiry
            : nextFollowupExpiry // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EligibleFollowUpImpl implements _EligibleFollowUp {
  const _$EligibleFollowUpImpl({
    @JsonKey(name: 'followup_id') this.followupId,
    @JsonKey(name: 'appointment_id') this.appointmentId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_name') required this.doctorName,
    @JsonKey(name: 'department_id') this.departmentId,
    required this.department,
    @JsonKey(name: 'valid_from') this.validFrom,
    @JsonKey(name: 'valid_until') this.validUntil,
    @JsonKey(name: 'appointment_date') this.appointmentDate,
    @JsonKey(name: 'remaining_days') this.remainingDays,
    @JsonKey(name: 'days_remaining') this.daysRemaining,
    this.status,
    @JsonKey(name: 'is_free') this.isFree,
    @JsonKey(name: 'next_followup_expiry') this.nextFollowupExpiry,
    this.note,
    this.message,
  });

  factory _$EligibleFollowUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$EligibleFollowUpImplFromJson(json);

  // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
  @override
  @JsonKey(name: 'followup_id')
  final String? followupId;
  // ✅ LEGACY: Source appointment ID (for backward compatibility)
  @override
  @JsonKey(name: 'appointment_id')
  final String? appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;
  @override
  final String department;
  // ✅ NEW TABLE-BASED: Valid from/until dates
  @override
  @JsonKey(name: 'valid_from')
  final String? validFrom;
  @override
  @JsonKey(name: 'valid_until')
  final String? validUntil;
  // ✅ LEGACY: Appointment date (for backward compatibility)
  @override
  @JsonKey(name: 'appointment_date')
  final String? appointmentDate;
  @override
  @JsonKey(name: 'remaining_days')
  final int? remainingDays;
  @override
  @JsonKey(name: 'days_remaining')
  final int? daysRemaining;
  // ✅ NEW: Alternative field name
  // ✅ NEW TABLE-BASED: Status tracking
  @override
  final String? status;
  // active, used, expired, renewed
  @override
  @JsonKey(name: 'is_free')
  final bool? isFree;
  // ✅ NEW: Explicitly track if free
  // ✅ Enhanced renewal tracking
  @override
  @JsonKey(name: 'next_followup_expiry')
  final String? nextFollowupExpiry;
  // ISO date
  @override
  final String? note;
  @override
  final String? message;

  @override
  String toString() {
    return 'EligibleFollowUp(followupId: $followupId, appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, department: $department, validFrom: $validFrom, validUntil: $validUntil, appointmentDate: $appointmentDate, remainingDays: $remainingDays, daysRemaining: $daysRemaining, status: $status, isFree: $isFree, nextFollowupExpiry: $nextFollowupExpiry, note: $note, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EligibleFollowUpImpl &&
            (identical(other.followupId, followupId) ||
                other.followupId == followupId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.remainingDays, remainingDays) ||
                other.remainingDays == remainingDays) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.nextFollowupExpiry, nextFollowupExpiry) ||
                other.nextFollowupExpiry == nextFollowupExpiry) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followupId,
    appointmentId,
    doctorId,
    doctorName,
    departmentId,
    department,
    validFrom,
    validUntil,
    appointmentDate,
    remainingDays,
    daysRemaining,
    status,
    isFree,
    nextFollowupExpiry,
    note,
    message,
  );

  /// Create a copy of EligibleFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EligibleFollowUpImplCopyWith<_$EligibleFollowUpImpl> get copyWith =>
      __$$EligibleFollowUpImplCopyWithImpl<_$EligibleFollowUpImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EligibleFollowUpImplToJson(this);
  }
}

abstract class _EligibleFollowUp implements EligibleFollowUp {
  const factory _EligibleFollowUp({
    @JsonKey(name: 'followup_id') final String? followupId,
    @JsonKey(name: 'appointment_id') final String? appointmentId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_name') required final String doctorName,
    @JsonKey(name: 'department_id') final String? departmentId,
    required final String department,
    @JsonKey(name: 'valid_from') final String? validFrom,
    @JsonKey(name: 'valid_until') final String? validUntil,
    @JsonKey(name: 'appointment_date') final String? appointmentDate,
    @JsonKey(name: 'remaining_days') final int? remainingDays,
    @JsonKey(name: 'days_remaining') final int? daysRemaining,
    final String? status,
    @JsonKey(name: 'is_free') final bool? isFree,
    @JsonKey(name: 'next_followup_expiry') final String? nextFollowupExpiry,
    final String? note,
    final String? message,
  }) = _$EligibleFollowUpImpl;

  factory _EligibleFollowUp.fromJson(Map<String, dynamic> json) =
      _$EligibleFollowUpImpl.fromJson;

  // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
  @override
  @JsonKey(name: 'followup_id')
  String? get followupId; // ✅ LEGACY: Source appointment ID (for backward compatibility)
  @override
  @JsonKey(name: 'appointment_id')
  String? get appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String get doctorName;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;
  @override
  String get department; // ✅ NEW TABLE-BASED: Valid from/until dates
  @override
  @JsonKey(name: 'valid_from')
  String? get validFrom;
  @override
  @JsonKey(name: 'valid_until')
  String? get validUntil; // ✅ LEGACY: Appointment date (for backward compatibility)
  @override
  @JsonKey(name: 'appointment_date')
  String? get appointmentDate;
  @override
  @JsonKey(name: 'remaining_days')
  int? get remainingDays;
  @override
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining; // ✅ NEW: Alternative field name
  // ✅ NEW TABLE-BASED: Status tracking
  @override
  String? get status; // active, used, expired, renewed
  @override
  @JsonKey(name: 'is_free')
  bool? get isFree; // ✅ NEW: Explicitly track if free
  // ✅ Enhanced renewal tracking
  @override
  @JsonKey(name: 'next_followup_expiry')
  String? get nextFollowupExpiry; // ISO date
  @override
  String? get note;
  @override
  String? get message;

  /// Create a copy of EligibleFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EligibleFollowUpImplCopyWith<_$EligibleFollowUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpiredFollowUp _$ExpiredFollowUpFromJson(Map<String, dynamic> json) {
  return _ExpiredFollowUp.fromJson(json);
}

/// @nodoc
mixin _$ExpiredFollowUp {
  // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
  @JsonKey(name: 'followup_id')
  String? get followupId => throw _privateConstructorUsedError; // ✅ LEGACY: Source appointment ID (for backward compatibility)
  @JsonKey(name: 'appointment_id')
  String? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String? get departmentName => throw _privateConstructorUsedError; // ✅ NEW: Alternative field name
  String get department =>
      throw _privateConstructorUsedError; // ✅ NEW TABLE-BASED: Expiration tracking
  @JsonKey(name: 'valid_until')
  String? get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_on')
  String? get expiredOn => throw _privateConstructorUsedError; // Date when follow-up expired
  String? get status =>
      throw _privateConstructorUsedError; // ✅ NEW: Status from follow_ups table
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this ExpiredFollowUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiredFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiredFollowUpCopyWith<ExpiredFollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiredFollowUpCopyWith<$Res> {
  factory $ExpiredFollowUpCopyWith(
    ExpiredFollowUp value,
    $Res Function(ExpiredFollowUp) then,
  ) = _$ExpiredFollowUpCopyWithImpl<$Res, ExpiredFollowUp>;
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    String department,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'expired_on') String? expiredOn,
    String? status,
    String? note,
  });
}

/// @nodoc
class _$ExpiredFollowUpCopyWithImpl<$Res, $Val extends ExpiredFollowUp>
    implements $ExpiredFollowUpCopyWith<$Res> {
  _$ExpiredFollowUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiredFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = freezed,
    Object? appointmentId = freezed,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? department = null,
    Object? validUntil = freezed,
    Object? expiredOn = freezed,
    Object? status = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            followupId: freezed == followupId
                ? _value.followupId
                : followupId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentName: freezed == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: null == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiredOn: freezed == expiredOn
                ? _value.expiredOn
                : expiredOn // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExpiredFollowUpImplCopyWith<$Res>
    implements $ExpiredFollowUpCopyWith<$Res> {
  factory _$$ExpiredFollowUpImplCopyWith(
    _$ExpiredFollowUpImpl value,
    $Res Function(_$ExpiredFollowUpImpl) then,
  ) = __$$ExpiredFollowUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'doctor_name') String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    String department,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'expired_on') String? expiredOn,
    String? status,
    String? note,
  });
}

/// @nodoc
class __$$ExpiredFollowUpImplCopyWithImpl<$Res>
    extends _$ExpiredFollowUpCopyWithImpl<$Res, _$ExpiredFollowUpImpl>
    implements _$$ExpiredFollowUpImplCopyWith<$Res> {
  __$$ExpiredFollowUpImplCopyWithImpl(
    _$ExpiredFollowUpImpl _value,
    $Res Function(_$ExpiredFollowUpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpiredFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followupId = freezed,
    Object? appointmentId = freezed,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? department = null,
    Object? validUntil = freezed,
    Object? expiredOn = freezed,
    Object? status = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$ExpiredFollowUpImpl(
        followupId: freezed == followupId
            ? _value.followupId
            : followupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentName: freezed == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: null == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiredOn: freezed == expiredOn
            ? _value.expiredOn
            : expiredOn // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpiredFollowUpImpl implements _ExpiredFollowUp {
  const _$ExpiredFollowUpImpl({
    @JsonKey(name: 'followup_id') this.followupId,
    @JsonKey(name: 'appointment_id') this.appointmentId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'doctor_name') required this.doctorName,
    @JsonKey(name: 'department_id') this.departmentId,
    @JsonKey(name: 'department_name') this.departmentName,
    required this.department,
    @JsonKey(name: 'valid_until') this.validUntil,
    @JsonKey(name: 'expired_on') this.expiredOn,
    this.status,
    this.note,
  });

  factory _$ExpiredFollowUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiredFollowUpImplFromJson(json);

  // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
  @override
  @JsonKey(name: 'followup_id')
  final String? followupId;
  // ✅ LEGACY: Source appointment ID (for backward compatibility)
  @override
  @JsonKey(name: 'appointment_id')
  final String? appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;
  @override
  @JsonKey(name: 'department_name')
  final String? departmentName;
  // ✅ NEW: Alternative field name
  @override
  final String department;
  // ✅ NEW TABLE-BASED: Expiration tracking
  @override
  @JsonKey(name: 'valid_until')
  final String? validUntil;
  @override
  @JsonKey(name: 'expired_on')
  final String? expiredOn;
  // Date when follow-up expired
  @override
  final String? status;
  // ✅ NEW: Status from follow_ups table
  @override
  final String? note;

  @override
  String toString() {
    return 'ExpiredFollowUp(followupId: $followupId, appointmentId: $appointmentId, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, department: $department, validUntil: $validUntil, expiredOn: $expiredOn, status: $status, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiredFollowUpImpl &&
            (identical(other.followupId, followupId) ||
                other.followupId == followupId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.expiredOn, expiredOn) ||
                other.expiredOn == expiredOn) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followupId,
    appointmentId,
    doctorId,
    doctorName,
    departmentId,
    departmentName,
    department,
    validUntil,
    expiredOn,
    status,
    note,
  );

  /// Create a copy of ExpiredFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiredFollowUpImplCopyWith<_$ExpiredFollowUpImpl> get copyWith =>
      __$$ExpiredFollowUpImplCopyWithImpl<_$ExpiredFollowUpImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiredFollowUpImplToJson(this);
  }
}

abstract class _ExpiredFollowUp implements ExpiredFollowUp {
  const factory _ExpiredFollowUp({
    @JsonKey(name: 'followup_id') final String? followupId,
    @JsonKey(name: 'appointment_id') final String? appointmentId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'doctor_name') required final String doctorName,
    @JsonKey(name: 'department_id') final String? departmentId,
    @JsonKey(name: 'department_name') final String? departmentName,
    required final String department,
    @JsonKey(name: 'valid_until') final String? validUntil,
    @JsonKey(name: 'expired_on') final String? expiredOn,
    final String? status,
    final String? note,
  }) = _$ExpiredFollowUpImpl;

  factory _ExpiredFollowUp.fromJson(Map<String, dynamic> json) =
      _$ExpiredFollowUpImpl.fromJson;

  // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
  @override
  @JsonKey(name: 'followup_id')
  String? get followupId; // ✅ LEGACY: Source appointment ID (for backward compatibility)
  @override
  @JsonKey(name: 'appointment_id')
  String? get appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String get doctorName;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;
  @override
  @JsonKey(name: 'department_name')
  String? get departmentName; // ✅ NEW: Alternative field name
  @override
  String get department; // ✅ NEW TABLE-BASED: Expiration tracking
  @override
  @JsonKey(name: 'valid_until')
  String? get validUntil;
  @override
  @JsonKey(name: 'expired_on')
  String? get expiredOn; // Date when follow-up expired
  @override
  String? get status; // ✅ NEW: Status from follow_ups table
  @override
  String? get note;

  /// Create a copy of ExpiredFollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiredFollowUpImplCopyWith<_$ExpiredFollowUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateClinicPatientInput _$CreateClinicPatientInputFromJson(
  Map<String, dynamic> json,
) {
  return _CreateClinicPatientInput.fromJson(json);
}

/// @nodoc
mixin _$CreateClinicPatientInput {
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'mo_id')
  String? get moId => throw _privateConstructorUsedError;
  @JsonKey(name: 'medical_history')
  String? get medicalHistory => throw _privateConstructorUsedError;
  String? get allergies => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'smoking_status')
  String? get smokingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'alcohol_use')
  String? get alcoholUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_cm')
  int? get heightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_kg')
  int? get weightKg => throw _privateConstructorUsedError;

  /// Serializes this CreateClinicPatientInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateClinicPatientInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateClinicPatientInputCopyWith<CreateClinicPatientInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateClinicPatientInputCopyWith<$Res> {
  factory $CreateClinicPatientInputCopyWith(
    CreateClinicPatientInput value,
    $Res Function(CreateClinicPatientInput) then,
  ) = _$CreateClinicPatientInputCopyWithImpl<$Res, CreateClinicPatientInput>;
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,
    @JsonKey(name: 'alcohol_use') String? alcoholUse,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
  });
}

/// @nodoc
class _$CreateClinicPatientInputCopyWithImpl<
  $Res,
  $Val extends CreateClinicPatientInput
>
    implements $CreateClinicPatientInputCopyWith<$Res> {
  _$CreateClinicPatientInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateClinicPatientInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? moId = freezed,
    Object? medicalHistory = freezed,
    Object? allergies = freezed,
    Object? bloodGroup = freezed,
    Object? smokingStatus = freezed,
    Object? alcoholUse = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
  }) {
    return _then(
      _value.copyWith(
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            address1: freezed == address1
                ? _value.address1
                : address1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            address2: freezed == address2
                ? _value.address2
                : address2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            district: freezed == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            moId: freezed == moId
                ? _value.moId
                : moId // ignore: cast_nullable_to_non_nullable
                      as String?,
            medicalHistory: freezed == medicalHistory
                ? _value.medicalHistory
                : medicalHistory // ignore: cast_nullable_to_non_nullable
                      as String?,
            allergies: freezed == allergies
                ? _value.allergies
                : allergies // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodGroup: freezed == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            smokingStatus: freezed == smokingStatus
                ? _value.smokingStatus
                : smokingStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            alcoholUse: freezed == alcoholUse
                ? _value.alcoholUse
                : alcoholUse // ignore: cast_nullable_to_non_nullable
                      as String?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as int?,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateClinicPatientInputImplCopyWith<$Res>
    implements $CreateClinicPatientInputCopyWith<$Res> {
  factory _$$CreateClinicPatientInputImplCopyWith(
    _$CreateClinicPatientInputImpl value,
    $Res Function(_$CreateClinicPatientInputImpl) then,
  ) = __$$CreateClinicPatientInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,
    @JsonKey(name: 'alcohol_use') String? alcoholUse,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
  });
}

/// @nodoc
class __$$CreateClinicPatientInputImplCopyWithImpl<$Res>
    extends
        _$CreateClinicPatientInputCopyWithImpl<
          $Res,
          _$CreateClinicPatientInputImpl
        >
    implements _$$CreateClinicPatientInputImplCopyWith<$Res> {
  __$$CreateClinicPatientInputImplCopyWithImpl(
    _$CreateClinicPatientInputImpl _value,
    $Res Function(_$CreateClinicPatientInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateClinicPatientInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? moId = freezed,
    Object? medicalHistory = freezed,
    Object? allergies = freezed,
    Object? bloodGroup = freezed,
    Object? smokingStatus = freezed,
    Object? alcoholUse = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
  }) {
    return _then(
      _$CreateClinicPatientInputImpl(
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        address1: freezed == address1
            ? _value.address1
            : address1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        address2: freezed == address2
            ? _value.address2
            : address2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        district: freezed == district
            ? _value.district
            : district // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        moId: freezed == moId
            ? _value.moId
            : moId // ignore: cast_nullable_to_non_nullable
                  as String?,
        medicalHistory: freezed == medicalHistory
            ? _value.medicalHistory
            : medicalHistory // ignore: cast_nullable_to_non_nullable
                  as String?,
        allergies: freezed == allergies
            ? _value.allergies
            : allergies // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodGroup: freezed == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        smokingStatus: freezed == smokingStatus
            ? _value.smokingStatus
            : smokingStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        alcoholUse: freezed == alcoholUse
            ? _value.alcoholUse
            : alcoholUse // ignore: cast_nullable_to_non_nullable
                  as String?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as int?,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateClinicPatientInputImpl implements _CreateClinicPatientInput {
  const _$CreateClinicPatientInputImpl({
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    required this.phone,
    this.email,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.age,
    this.gender,
    this.address1,
    this.address2,
    this.district,
    this.state,
    @JsonKey(name: 'mo_id') this.moId,
    @JsonKey(name: 'medical_history') this.medicalHistory,
    this.allergies,
    @JsonKey(name: 'blood_group') this.bloodGroup,
    @JsonKey(name: 'smoking_status') this.smokingStatus,
    @JsonKey(name: 'alcohol_use') this.alcoholUse,
    @JsonKey(name: 'height_cm') this.heightCm,
    @JsonKey(name: 'weight_kg') this.weightKg,
  });

  factory _$CreateClinicPatientInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateClinicPatientInputImplFromJson(json);

  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? district;
  @override
  final String? state;
  @override
  @JsonKey(name: 'mo_id')
  final String? moId;
  @override
  @JsonKey(name: 'medical_history')
  final String? medicalHistory;
  @override
  final String? allergies;
  @override
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @override
  @JsonKey(name: 'smoking_status')
  final String? smokingStatus;
  @override
  @JsonKey(name: 'alcohol_use')
  final String? alcoholUse;
  @override
  @JsonKey(name: 'height_cm')
  final int? heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  final int? weightKg;

  @override
  String toString() {
    return 'CreateClinicPatientInput(clinicId: $clinicId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, address1: $address1, address2: $address2, district: $district, state: $state, moId: $moId, medicalHistory: $medicalHistory, allergies: $allergies, bloodGroup: $bloodGroup, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, heightCm: $heightCm, weightKg: $weightKg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateClinicPatientInputImpl &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.moId, moId) || other.moId == moId) &&
            (identical(other.medicalHistory, medicalHistory) ||
                other.medicalHistory == medicalHistory) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.smokingStatus, smokingStatus) ||
                other.smokingStatus == smokingStatus) &&
            (identical(other.alcoholUse, alcoholUse) ||
                other.alcoholUse == alcoholUse) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    clinicId,
    firstName,
    lastName,
    phone,
    email,
    dateOfBirth,
    age,
    gender,
    address1,
    address2,
    district,
    state,
    moId,
    medicalHistory,
    allergies,
    bloodGroup,
    smokingStatus,
    alcoholUse,
    heightCm,
    weightKg,
  ]);

  /// Create a copy of CreateClinicPatientInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateClinicPatientInputImplCopyWith<_$CreateClinicPatientInputImpl>
  get copyWith =>
      __$$CreateClinicPatientInputImplCopyWithImpl<
        _$CreateClinicPatientInputImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateClinicPatientInputImplToJson(this);
  }
}

abstract class _CreateClinicPatientInput implements CreateClinicPatientInput {
  const factory _CreateClinicPatientInput({
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    required final String phone,
    final String? email,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final int? age,
    final String? gender,
    final String? address1,
    final String? address2,
    final String? district,
    final String? state,
    @JsonKey(name: 'mo_id') final String? moId,
    @JsonKey(name: 'medical_history') final String? medicalHistory,
    final String? allergies,
    @JsonKey(name: 'blood_group') final String? bloodGroup,
    @JsonKey(name: 'smoking_status') final String? smokingStatus,
    @JsonKey(name: 'alcohol_use') final String? alcoholUse,
    @JsonKey(name: 'height_cm') final int? heightCm,
    @JsonKey(name: 'weight_kg') final int? weightKg,
  }) = _$CreateClinicPatientInputImpl;

  factory _CreateClinicPatientInput.fromJson(Map<String, dynamic> json) =
      _$CreateClinicPatientInputImpl.fromJson;

  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get address1;
  @override
  String? get address2;
  @override
  String? get district;
  @override
  String? get state;
  @override
  @JsonKey(name: 'mo_id')
  String? get moId;
  @override
  @JsonKey(name: 'medical_history')
  String? get medicalHistory;
  @override
  String? get allergies;
  @override
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @override
  @JsonKey(name: 'smoking_status')
  String? get smokingStatus;
  @override
  @JsonKey(name: 'alcohol_use')
  String? get alcoholUse;
  @override
  @JsonKey(name: 'height_cm')
  int? get heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  int? get weightKg;

  /// Create a copy of CreateClinicPatientInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateClinicPatientInputImplCopyWith<_$CreateClinicPatientInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateClinicPatientResponse _$CreateClinicPatientResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateClinicPatientResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateClinicPatientResponse {
  String get message => throw _privateConstructorUsedError;
  ClinicPatient get patient => throw _privateConstructorUsedError;

  /// Serializes this CreateClinicPatientResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateClinicPatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateClinicPatientResponseCopyWith<CreateClinicPatientResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateClinicPatientResponseCopyWith<$Res> {
  factory $CreateClinicPatientResponseCopyWith(
    CreateClinicPatientResponse value,
    $Res Function(CreateClinicPatientResponse) then,
  ) =
      _$CreateClinicPatientResponseCopyWithImpl<
        $Res,
        CreateClinicPatientResponse
      >;
  @useResult
  $Res call({String message, ClinicPatient patient});

  $ClinicPatientCopyWith<$Res> get patient;
}

/// @nodoc
class _$CreateClinicPatientResponseCopyWithImpl<
  $Res,
  $Val extends CreateClinicPatientResponse
>
    implements $CreateClinicPatientResponseCopyWith<$Res> {
  _$CreateClinicPatientResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateClinicPatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? patient = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as ClinicPatient,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateClinicPatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicPatientCopyWith<$Res> get patient {
    return $ClinicPatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateClinicPatientResponseImplCopyWith<$Res>
    implements $CreateClinicPatientResponseCopyWith<$Res> {
  factory _$$CreateClinicPatientResponseImplCopyWith(
    _$CreateClinicPatientResponseImpl value,
    $Res Function(_$CreateClinicPatientResponseImpl) then,
  ) = __$$CreateClinicPatientResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ClinicPatient patient});

  @override
  $ClinicPatientCopyWith<$Res> get patient;
}

/// @nodoc
class __$$CreateClinicPatientResponseImplCopyWithImpl<$Res>
    extends
        _$CreateClinicPatientResponseCopyWithImpl<
          $Res,
          _$CreateClinicPatientResponseImpl
        >
    implements _$$CreateClinicPatientResponseImplCopyWith<$Res> {
  __$$CreateClinicPatientResponseImplCopyWithImpl(
    _$CreateClinicPatientResponseImpl _value,
    $Res Function(_$CreateClinicPatientResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateClinicPatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? patient = null}) {
    return _then(
      _$CreateClinicPatientResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as ClinicPatient,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateClinicPatientResponseImpl
    implements _CreateClinicPatientResponse {
  const _$CreateClinicPatientResponseImpl({
    required this.message,
    required this.patient,
  });

  factory _$CreateClinicPatientResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateClinicPatientResponseImplFromJson(json);

  @override
  final String message;
  @override
  final ClinicPatient patient;

  @override
  String toString() {
    return 'CreateClinicPatientResponse(message: $message, patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateClinicPatientResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, patient);

  /// Create a copy of CreateClinicPatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateClinicPatientResponseImplCopyWith<_$CreateClinicPatientResponseImpl>
  get copyWith =>
      __$$CreateClinicPatientResponseImplCopyWithImpl<
        _$CreateClinicPatientResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateClinicPatientResponseImplToJson(this);
  }
}

abstract class _CreateClinicPatientResponse
    implements CreateClinicPatientResponse {
  const factory _CreateClinicPatientResponse({
    required final String message,
    required final ClinicPatient patient,
  }) = _$CreateClinicPatientResponseImpl;

  factory _CreateClinicPatientResponse.fromJson(Map<String, dynamic> json) =
      _$CreateClinicPatientResponseImpl.fromJson;

  @override
  String get message;
  @override
  ClinicPatient get patient;

  /// Create a copy of CreateClinicPatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateClinicPatientResponseImplCopyWith<_$CreateClinicPatientResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ListClinicPatientsResponse _$ListClinicPatientsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ListClinicPatientsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListClinicPatientsResponse {
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<ClinicPatient> get patients => throw _privateConstructorUsedError;

  /// Serializes this ListClinicPatientsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListClinicPatientsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListClinicPatientsResponseCopyWith<ListClinicPatientsResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListClinicPatientsResponseCopyWith<$Res> {
  factory $ListClinicPatientsResponseCopyWith(
    ListClinicPatientsResponse value,
    $Res Function(ListClinicPatientsResponse) then,
  ) =
      _$ListClinicPatientsResponseCopyWithImpl<
        $Res,
        ListClinicPatientsResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_id') String clinicId,
    int total,
    List<ClinicPatient> patients,
  });
}

/// @nodoc
class _$ListClinicPatientsResponseCopyWithImpl<
  $Res,
  $Val extends ListClinicPatientsResponse
>
    implements $ListClinicPatientsResponseCopyWith<$Res> {
  _$ListClinicPatientsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListClinicPatientsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? total = null,
    Object? patients = null,
  }) {
    return _then(
      _value.copyWith(
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            patients: null == patients
                ? _value.patients
                : patients // ignore: cast_nullable_to_non_nullable
                      as List<ClinicPatient>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListClinicPatientsResponseImplCopyWith<$Res>
    implements $ListClinicPatientsResponseCopyWith<$Res> {
  factory _$$ListClinicPatientsResponseImplCopyWith(
    _$ListClinicPatientsResponseImpl value,
    $Res Function(_$ListClinicPatientsResponseImpl) then,
  ) = __$$ListClinicPatientsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'clinic_id') String clinicId,
    int total,
    List<ClinicPatient> patients,
  });
}

/// @nodoc
class __$$ListClinicPatientsResponseImplCopyWithImpl<$Res>
    extends
        _$ListClinicPatientsResponseCopyWithImpl<
          $Res,
          _$ListClinicPatientsResponseImpl
        >
    implements _$$ListClinicPatientsResponseImplCopyWith<$Res> {
  __$$ListClinicPatientsResponseImplCopyWithImpl(
    _$ListClinicPatientsResponseImpl _value,
    $Res Function(_$ListClinicPatientsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListClinicPatientsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? total = null,
    Object? patients = null,
  }) {
    return _then(
      _$ListClinicPatientsResponseImpl(
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        patients: null == patients
            ? _value._patients
            : patients // ignore: cast_nullable_to_non_nullable
                  as List<ClinicPatient>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ListClinicPatientsResponseImpl implements _ListClinicPatientsResponse {
  const _$ListClinicPatientsResponseImpl({
    @JsonKey(name: 'clinic_id') required this.clinicId,
    required this.total,
    required final List<ClinicPatient> patients,
  }) : _patients = patients;

  factory _$ListClinicPatientsResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ListClinicPatientsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  final int total;
  final List<ClinicPatient> _patients;
  @override
  List<ClinicPatient> get patients {
    if (_patients is EqualUnmodifiableListView) return _patients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  String toString() {
    return 'ListClinicPatientsResponse(clinicId: $clinicId, total: $total, patients: $patients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListClinicPatientsResponseImpl &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._patients, _patients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clinicId,
    total,
    const DeepCollectionEquality().hash(_patients),
  );

  /// Create a copy of ListClinicPatientsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListClinicPatientsResponseImplCopyWith<_$ListClinicPatientsResponseImpl>
  get copyWith =>
      __$$ListClinicPatientsResponseImplCopyWithImpl<
        _$ListClinicPatientsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListClinicPatientsResponseImplToJson(this);
  }
}

abstract class _ListClinicPatientsResponse
    implements ListClinicPatientsResponse {
  const factory _ListClinicPatientsResponse({
    @JsonKey(name: 'clinic_id') required final String clinicId,
    required final int total,
    required final List<ClinicPatient> patients,
  }) = _$ListClinicPatientsResponseImpl;

  factory _ListClinicPatientsResponse.fromJson(Map<String, dynamic> json) =
      _$ListClinicPatientsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  int get total;
  @override
  List<ClinicPatient> get patients;

  /// Create a copy of ListClinicPatientsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListClinicPatientsResponseImplCopyWith<_$ListClinicPatientsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AppointmentDetail _$AppointmentDetailFromJson(Map<String, dynamic> json) {
  return _AppointmentDetail.fromJson(json);
}

/// @nodoc
mixin _$AppointmentDetail {
  @JsonKey(name: 'appointment_id')
  String get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_time')
  String get appointmentTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot_type')
  String get slotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'consultation_type')
  String get consultationType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount')
  double get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_mode')
  String? get paymentMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_priority')
  bool get isPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppointmentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentDetailCopyWith<AppointmentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDetailCopyWith<$Res> {
  factory $AppointmentDetailCopyWith(
    AppointmentDetail value,
    $Res Function(AppointmentDetail) then,
  ) = _$AppointmentDetailCopyWithImpl<$Res, AppointmentDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'department_id') String departmentId,
    @JsonKey(name: 'appointment_time') String appointmentTime,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'consultation_type') String consultationType,
    String status,
    @JsonKey(name: 'fee_amount') double feeAmount,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'is_priority') bool isPriority,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class _$AppointmentDetailCopyWithImpl<$Res, $Val extends AppointmentDetail>
    implements $AppointmentDetailCopyWith<$Res> {
  _$AppointmentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? doctorId = null,
    Object? departmentId = null,
    Object? appointmentTime = null,
    Object? slotType = null,
    Object? consultationType = null,
    Object? status = null,
    Object? feeAmount = null,
    Object? paymentStatus = null,
    Object? paymentMode = freezed,
    Object? isPriority = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: null == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentTime: null == appointmentTime
                ? _value.appointmentTime
                : appointmentTime // ignore: cast_nullable_to_non_nullable
                      as String,
            slotType: null == slotType
                ? _value.slotType
                : slotType // ignore: cast_nullable_to_non_nullable
                      as String,
            consultationType: null == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            feeAmount: null == feeAmount
                ? _value.feeAmount
                : feeAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            paymentStatus: null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentMode: freezed == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPriority: null == isPriority
                ? _value.isPriority
                : isPriority // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentDetailImplCopyWith<$Res>
    implements $AppointmentDetailCopyWith<$Res> {
  factory _$$AppointmentDetailImplCopyWith(
    _$AppointmentDetailImpl value,
    $Res Function(_$AppointmentDetailImpl) then,
  ) = __$$AppointmentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'department_id') String departmentId,
    @JsonKey(name: 'appointment_time') String appointmentTime,
    @JsonKey(name: 'slot_type') String slotType,
    @JsonKey(name: 'consultation_type') String consultationType,
    String status,
    @JsonKey(name: 'fee_amount') double feeAmount,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'is_priority') bool isPriority,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class __$$AppointmentDetailImplCopyWithImpl<$Res>
    extends _$AppointmentDetailCopyWithImpl<$Res, _$AppointmentDetailImpl>
    implements _$$AppointmentDetailImplCopyWith<$Res> {
  __$$AppointmentDetailImplCopyWithImpl(
    _$AppointmentDetailImpl _value,
    $Res Function(_$AppointmentDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? doctorId = null,
    Object? departmentId = null,
    Object? appointmentTime = null,
    Object? slotType = null,
    Object? consultationType = null,
    Object? status = null,
    Object? feeAmount = null,
    Object? paymentStatus = null,
    Object? paymentMode = freezed,
    Object? isPriority = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AppointmentDetailImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: null == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentTime: null == appointmentTime
            ? _value.appointmentTime
            : appointmentTime // ignore: cast_nullable_to_non_nullable
                  as String,
        slotType: null == slotType
            ? _value.slotType
            : slotType // ignore: cast_nullable_to_non_nullable
                  as String,
        consultationType: null == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        feeAmount: null == feeAmount
            ? _value.feeAmount
            : feeAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        paymentStatus: null == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMode: freezed == paymentMode
            ? _value.paymentMode
            : paymentMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPriority: null == isPriority
            ? _value.isPriority
            : isPriority // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentDetailImpl implements _AppointmentDetail {
  const _$AppointmentDetailImpl({
    @JsonKey(name: 'appointment_id') required this.appointmentId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'department_id') required this.departmentId,
    @JsonKey(name: 'appointment_time') required this.appointmentTime,
    @JsonKey(name: 'slot_type') required this.slotType,
    @JsonKey(name: 'consultation_type') required this.consultationType,
    required this.status,
    @JsonKey(name: 'fee_amount') this.feeAmount = 0.0,
    @JsonKey(name: 'payment_status') this.paymentStatus = 'pending',
    @JsonKey(name: 'payment_mode') this.paymentMode,
    @JsonKey(name: 'is_priority') this.isPriority = false,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$AppointmentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentDetailImplFromJson(json);

  @override
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'department_id')
  final String departmentId;
  @override
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  @override
  @JsonKey(name: 'slot_type')
  final String slotType;
  @override
  @JsonKey(name: 'consultation_type')
  final String consultationType;
  @override
  final String status;
  @override
  @JsonKey(name: 'fee_amount')
  final double feeAmount;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @JsonKey(name: 'payment_mode')
  final String? paymentMode;
  @override
  @JsonKey(name: 'is_priority')
  final bool isPriority;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'AppointmentDetail(appointmentId: $appointmentId, doctorId: $doctorId, departmentId: $departmentId, appointmentTime: $appointmentTime, slotType: $slotType, consultationType: $consultationType, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, paymentMode: $paymentMode, isPriority: $isPriority, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentDetailImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.slotType, slotType) ||
                other.slotType == slotType) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.isPriority, isPriority) ||
                other.isPriority == isPriority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    doctorId,
    departmentId,
    appointmentTime,
    slotType,
    consultationType,
    status,
    feeAmount,
    paymentStatus,
    paymentMode,
    isPriority,
    createdAt,
  );

  /// Create a copy of AppointmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentDetailImplCopyWith<_$AppointmentDetailImpl> get copyWith =>
      __$$AppointmentDetailImplCopyWithImpl<_$AppointmentDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentDetailImplToJson(this);
  }
}

abstract class _AppointmentDetail implements AppointmentDetail {
  const factory _AppointmentDetail({
    @JsonKey(name: 'appointment_id') required final String appointmentId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'department_id') required final String departmentId,
    @JsonKey(name: 'appointment_time') required final String appointmentTime,
    @JsonKey(name: 'slot_type') required final String slotType,
    @JsonKey(name: 'consultation_type') required final String consultationType,
    required final String status,
    @JsonKey(name: 'fee_amount') final double feeAmount,
    @JsonKey(name: 'payment_status') final String paymentStatus,
    @JsonKey(name: 'payment_mode') final String? paymentMode,
    @JsonKey(name: 'is_priority') final bool isPriority,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$AppointmentDetailImpl;

  factory _AppointmentDetail.fromJson(Map<String, dynamic> json) =
      _$AppointmentDetailImpl.fromJson;

  @override
  @JsonKey(name: 'appointment_id')
  String get appointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'department_id')
  String get departmentId;
  @override
  @JsonKey(name: 'appointment_time')
  String get appointmentTime;
  @override
  @JsonKey(name: 'slot_type')
  String get slotType;
  @override
  @JsonKey(name: 'consultation_type')
  String get consultationType;
  @override
  String get status;
  @override
  @JsonKey(name: 'fee_amount')
  double get feeAmount;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @JsonKey(name: 'payment_mode')
  String? get paymentMode;
  @override
  @JsonKey(name: 'is_priority')
  bool get isPriority;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of AppointmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentDetailImplCopyWith<_$AppointmentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowUpDetail _$FollowUpDetailFromJson(Map<String, dynamic> json) {
  return _FollowUpDetail.fromJson(json);
}

/// @nodoc
mixin _$FollowUpDetail {
  @JsonKey(name: 'follow_up_id')
  String get followUpId => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_appointment_id')
  String get sourceAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String get departmentId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_free')
  bool get isFree => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_from')
  String get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until')
  String get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_appointment_id')
  String? get usedAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'renewed_by_appointment_id')
  String? get renewedByAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FollowUpDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpDetailCopyWith<FollowUpDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpDetailCopyWith<$Res> {
  factory $FollowUpDetailCopyWith(
    FollowUpDetail value,
    $Res Function(FollowUpDetail) then,
  ) = _$FollowUpDetailCopyWithImpl<$Res, FollowUpDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'follow_up_id') String followUpId,
    @JsonKey(name: 'source_appointment_id') String sourceAppointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'department_id') String departmentId,
    String status,
    @JsonKey(name: 'is_free') bool isFree,
    @JsonKey(name: 'valid_from') String validFrom,
    @JsonKey(name: 'valid_until') String validUntil,
    @JsonKey(name: 'used_appointment_id') String? usedAppointmentId,
    @JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$FollowUpDetailCopyWithImpl<$Res, $Val extends FollowUpDetail>
    implements $FollowUpDetailCopyWith<$Res> {
  _$FollowUpDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followUpId = null,
    Object? sourceAppointmentId = null,
    Object? doctorId = null,
    Object? departmentId = null,
    Object? status = null,
    Object? isFree = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? usedAppointmentId = freezed,
    Object? renewedByAppointmentId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            followUpId: null == followUpId
                ? _value.followUpId
                : followUpId // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceAppointmentId: null == sourceAppointmentId
                ? _value.sourceAppointmentId
                : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            departmentId: null == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            isFree: null == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool,
            validFrom: null == validFrom
                ? _value.validFrom
                : validFrom // ignore: cast_nullable_to_non_nullable
                      as String,
            validUntil: null == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String,
            usedAppointmentId: freezed == usedAppointmentId
                ? _value.usedAppointmentId
                : usedAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            renewedByAppointmentId: freezed == renewedByAppointmentId
                ? _value.renewedByAppointmentId
                : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowUpDetailImplCopyWith<$Res>
    implements $FollowUpDetailCopyWith<$Res> {
  factory _$$FollowUpDetailImplCopyWith(
    _$FollowUpDetailImpl value,
    $Res Function(_$FollowUpDetailImpl) then,
  ) = __$$FollowUpDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'follow_up_id') String followUpId,
    @JsonKey(name: 'source_appointment_id') String sourceAppointmentId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'department_id') String departmentId,
    String status,
    @JsonKey(name: 'is_free') bool isFree,
    @JsonKey(name: 'valid_from') String validFrom,
    @JsonKey(name: 'valid_until') String validUntil,
    @JsonKey(name: 'used_appointment_id') String? usedAppointmentId,
    @JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$FollowUpDetailImplCopyWithImpl<$Res>
    extends _$FollowUpDetailCopyWithImpl<$Res, _$FollowUpDetailImpl>
    implements _$$FollowUpDetailImplCopyWith<$Res> {
  __$$FollowUpDetailImplCopyWithImpl(
    _$FollowUpDetailImpl _value,
    $Res Function(_$FollowUpDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followUpId = null,
    Object? sourceAppointmentId = null,
    Object? doctorId = null,
    Object? departmentId = null,
    Object? status = null,
    Object? isFree = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? usedAppointmentId = freezed,
    Object? renewedByAppointmentId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$FollowUpDetailImpl(
        followUpId: null == followUpId
            ? _value.followUpId
            : followUpId // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceAppointmentId: null == sourceAppointmentId
            ? _value.sourceAppointmentId
            : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        departmentId: null == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        isFree: null == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool,
        validFrom: null == validFrom
            ? _value.validFrom
            : validFrom // ignore: cast_nullable_to_non_nullable
                  as String,
        validUntil: null == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String,
        usedAppointmentId: freezed == usedAppointmentId
            ? _value.usedAppointmentId
            : usedAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        renewedByAppointmentId: freezed == renewedByAppointmentId
            ? _value.renewedByAppointmentId
            : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpDetailImpl implements _FollowUpDetail {
  const _$FollowUpDetailImpl({
    @JsonKey(name: 'follow_up_id') required this.followUpId,
    @JsonKey(name: 'source_appointment_id') required this.sourceAppointmentId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'department_id') required this.departmentId,
    required this.status,
    @JsonKey(name: 'is_free') this.isFree = true,
    @JsonKey(name: 'valid_from') required this.validFrom,
    @JsonKey(name: 'valid_until') required this.validUntil,
    @JsonKey(name: 'used_appointment_id') this.usedAppointmentId,
    @JsonKey(name: 'renewed_by_appointment_id') this.renewedByAppointmentId,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$FollowUpDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpDetailImplFromJson(json);

  @override
  @JsonKey(name: 'follow_up_id')
  final String followUpId;
  @override
  @JsonKey(name: 'source_appointment_id')
  final String sourceAppointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'department_id')
  final String departmentId;
  @override
  final String status;
  @override
  @JsonKey(name: 'is_free')
  final bool isFree;
  @override
  @JsonKey(name: 'valid_from')
  final String validFrom;
  @override
  @JsonKey(name: 'valid_until')
  final String validUntil;
  @override
  @JsonKey(name: 'used_appointment_id')
  final String? usedAppointmentId;
  @override
  @JsonKey(name: 'renewed_by_appointment_id')
  final String? renewedByAppointmentId;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'FollowUpDetail(followUpId: $followUpId, sourceAppointmentId: $sourceAppointmentId, doctorId: $doctorId, departmentId: $departmentId, status: $status, isFree: $isFree, validFrom: $validFrom, validUntil: $validUntil, usedAppointmentId: $usedAppointmentId, renewedByAppointmentId: $renewedByAppointmentId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpDetailImpl &&
            (identical(other.followUpId, followUpId) ||
                other.followUpId == followUpId) &&
            (identical(other.sourceAppointmentId, sourceAppointmentId) ||
                other.sourceAppointmentId == sourceAppointmentId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.usedAppointmentId, usedAppointmentId) ||
                other.usedAppointmentId == usedAppointmentId) &&
            (identical(other.renewedByAppointmentId, renewedByAppointmentId) ||
                other.renewedByAppointmentId == renewedByAppointmentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followUpId,
    sourceAppointmentId,
    doctorId,
    departmentId,
    status,
    isFree,
    validFrom,
    validUntil,
    usedAppointmentId,
    renewedByAppointmentId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of FollowUpDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpDetailImplCopyWith<_$FollowUpDetailImpl> get copyWith =>
      __$$FollowUpDetailImplCopyWithImpl<_$FollowUpDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpDetailImplToJson(this);
  }
}

abstract class _FollowUpDetail implements FollowUpDetail {
  const factory _FollowUpDetail({
    @JsonKey(name: 'follow_up_id') required final String followUpId,
    @JsonKey(name: 'source_appointment_id')
    required final String sourceAppointmentId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'department_id') required final String departmentId,
    required final String status,
    @JsonKey(name: 'is_free') final bool isFree,
    @JsonKey(name: 'valid_from') required final String validFrom,
    @JsonKey(name: 'valid_until') required final String validUntil,
    @JsonKey(name: 'used_appointment_id') final String? usedAppointmentId,
    @JsonKey(name: 'renewed_by_appointment_id')
    final String? renewedByAppointmentId,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$FollowUpDetailImpl;

  factory _FollowUpDetail.fromJson(Map<String, dynamic> json) =
      _$FollowUpDetailImpl.fromJson;

  @override
  @JsonKey(name: 'follow_up_id')
  String get followUpId;
  @override
  @JsonKey(name: 'source_appointment_id')
  String get sourceAppointmentId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'department_id')
  String get departmentId;
  @override
  String get status;
  @override
  @JsonKey(name: 'is_free')
  bool get isFree;
  @override
  @JsonKey(name: 'valid_from')
  String get validFrom;
  @override
  @JsonKey(name: 'valid_until')
  String get validUntil;
  @override
  @JsonKey(name: 'used_appointment_id')
  String? get usedAppointmentId;
  @override
  @JsonKey(name: 'renewed_by_appointment_id')
  String? get renewedByAppointmentId;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of FollowUpDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpDetailImplCopyWith<_$FollowUpDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
