// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentPaymentImpl _$$AppointmentPaymentImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentPaymentImpl(
  method: $enumDecode(_$PaymentMethodEnumMap, json['method']),
  type: $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$AppointmentPaymentImplToJson(
  _$AppointmentPaymentImpl instance,
) => <String, dynamic>{
  'method': _$PaymentMethodEnumMap[instance.method]!,
  if (_$PaymentTypeEnumMap[instance.type] case final value?) 'type': value,
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.payNow: 'pay_now',
  PaymentMethod.payLater: 'pay_later',
  PaymentMethod.wayOff: 'way_off',
};

const _$PaymentTypeEnumMap = {
  PaymentType.cash: 'cash',
  PaymentType.card: 'card',
  PaymentType.upi: 'upi',
};
