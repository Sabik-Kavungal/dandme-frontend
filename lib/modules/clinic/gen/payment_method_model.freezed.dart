// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppointmentPayment _$AppointmentPaymentFromJson(Map<String, dynamic> json) {
  return _AppointmentPayment.fromJson(json);
}

/// @nodoc
mixin _$AppointmentPayment {
  PaymentMethod get method => throw _privateConstructorUsedError;
  PaymentType? get type => throw _privateConstructorUsedError;

  /// Serializes this AppointmentPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentPaymentCopyWith<AppointmentPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentPaymentCopyWith<$Res> {
  factory $AppointmentPaymentCopyWith(
    AppointmentPayment value,
    $Res Function(AppointmentPayment) then,
  ) = _$AppointmentPaymentCopyWithImpl<$Res, AppointmentPayment>;
  @useResult
  $Res call({PaymentMethod method, PaymentType? type});
}

/// @nodoc
class _$AppointmentPaymentCopyWithImpl<$Res, $Val extends AppointmentPayment>
    implements $AppointmentPaymentCopyWith<$Res> {
  _$AppointmentPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? method = null, Object? type = freezed}) {
    return _then(
      _value.copyWith(
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as PaymentMethod,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PaymentType?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentPaymentImplCopyWith<$Res>
    implements $AppointmentPaymentCopyWith<$Res> {
  factory _$$AppointmentPaymentImplCopyWith(
    _$AppointmentPaymentImpl value,
    $Res Function(_$AppointmentPaymentImpl) then,
  ) = __$$AppointmentPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentMethod method, PaymentType? type});
}

/// @nodoc
class __$$AppointmentPaymentImplCopyWithImpl<$Res>
    extends _$AppointmentPaymentCopyWithImpl<$Res, _$AppointmentPaymentImpl>
    implements _$$AppointmentPaymentImplCopyWith<$Res> {
  __$$AppointmentPaymentImplCopyWithImpl(
    _$AppointmentPaymentImpl _value,
    $Res Function(_$AppointmentPaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? method = null, Object? type = freezed}) {
    return _then(
      _$AppointmentPaymentImpl(
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as PaymentMethod,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PaymentType?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentPaymentImpl extends _AppointmentPayment {
  const _$AppointmentPaymentImpl({required this.method, this.type}) : super._();

  factory _$AppointmentPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentPaymentImplFromJson(json);

  @override
  final PaymentMethod method;
  @override
  final PaymentType? type;

  @override
  String toString() {
    return 'AppointmentPayment(method: $method, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentPaymentImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, type);

  /// Create a copy of AppointmentPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentPaymentImplCopyWith<_$AppointmentPaymentImpl> get copyWith =>
      __$$AppointmentPaymentImplCopyWithImpl<_$AppointmentPaymentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentPaymentImplToJson(this);
  }
}

abstract class _AppointmentPayment extends AppointmentPayment {
  const factory _AppointmentPayment({
    required final PaymentMethod method,
    final PaymentType? type,
  }) = _$AppointmentPaymentImpl;
  const _AppointmentPayment._() : super._();

  factory _AppointmentPayment.fromJson(Map<String, dynamic> json) =
      _$AppointmentPaymentImpl.fromJson;

  @override
  PaymentMethod get method;
  @override
  PaymentType? get type;

  /// Create a copy of AppointmentPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentPaymentImplCopyWith<_$AppointmentPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
