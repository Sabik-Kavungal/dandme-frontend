// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentPayment _$AppointmentPaymentFromJson(Map<String, dynamic> json) =>
    _AppointmentPayment(
      method: $enumDecode(_$PaymentMethodEnumMap, json['method']),
      type: $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AppointmentPaymentToJson(_AppointmentPayment instance) =>
    <String, dynamic>{
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'type': ?_$PaymentTypeEnumMap[instance.type],
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
