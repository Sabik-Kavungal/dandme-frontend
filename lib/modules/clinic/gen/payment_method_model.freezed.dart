// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentPayment {

 PaymentMethod get method; PaymentType? get type;
/// Create a copy of AppointmentPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentPaymentCopyWith<AppointmentPayment> get copyWith => _$AppointmentPaymentCopyWithImpl<AppointmentPayment>(this as AppointmentPayment, _$identity);

  /// Serializes this AppointmentPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,type);

@override
String toString() {
  return 'AppointmentPayment(method: $method, type: $type)';
}


}

/// @nodoc
abstract mixin class $AppointmentPaymentCopyWith<$Res>  {
  factory $AppointmentPaymentCopyWith(AppointmentPayment value, $Res Function(AppointmentPayment) _then) = _$AppointmentPaymentCopyWithImpl;
@useResult
$Res call({
 PaymentMethod method, PaymentType? type
});




}
/// @nodoc
class _$AppointmentPaymentCopyWithImpl<$Res>
    implements $AppointmentPaymentCopyWith<$Res> {
  _$AppointmentPaymentCopyWithImpl(this._self, this._then);

  final AppointmentPayment _self;
  final $Res Function(AppointmentPayment) _then;

/// Create a copy of AppointmentPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PaymentType?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentPayment].
extension AppointmentPaymentPatterns on AppointmentPayment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentPayment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentPayment value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentPayment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentPayment value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentPayment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentMethod method,  PaymentType? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentPayment() when $default != null:
return $default(_that.method,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentMethod method,  PaymentType? type)  $default,) {final _that = this;
switch (_that) {
case _AppointmentPayment():
return $default(_that.method,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentMethod method,  PaymentType? type)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentPayment() when $default != null:
return $default(_that.method,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentPayment extends AppointmentPayment {
  const _AppointmentPayment({required this.method, this.type}): super._();
  factory _AppointmentPayment.fromJson(Map<String, dynamic> json) => _$AppointmentPaymentFromJson(json);

@override final  PaymentMethod method;
@override final  PaymentType? type;

/// Create a copy of AppointmentPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentPaymentCopyWith<_AppointmentPayment> get copyWith => __$AppointmentPaymentCopyWithImpl<_AppointmentPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,type);

@override
String toString() {
  return 'AppointmentPayment(method: $method, type: $type)';
}


}

/// @nodoc
abstract mixin class _$AppointmentPaymentCopyWith<$Res> implements $AppointmentPaymentCopyWith<$Res> {
  factory _$AppointmentPaymentCopyWith(_AppointmentPayment value, $Res Function(_AppointmentPayment) _then) = __$AppointmentPaymentCopyWithImpl;
@override @useResult
$Res call({
 PaymentMethod method, PaymentType? type
});




}
/// @nodoc
class __$AppointmentPaymentCopyWithImpl<$Res>
    implements _$AppointmentPaymentCopyWith<$Res> {
  __$AppointmentPaymentCopyWithImpl(this._self, this._then);

  final _AppointmentPayment _self;
  final $Res Function(_AppointmentPayment) _then;

/// Create a copy of AppointmentPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? type = freezed,}) {
  return _then(_AppointmentPayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PaymentType?,
  ));
}


}

// dart format on
