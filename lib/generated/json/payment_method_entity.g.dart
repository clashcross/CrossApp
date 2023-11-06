

import '../../bean/payment_method_entity.dart';
import 'base/json_convert_content.dart';

PaymentMethodEntity $PaymentMethodEntityFromJson(Map<String, dynamic> json) {
  final PaymentMethodEntity paymentMethodEntity = PaymentMethodEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    paymentMethodEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    paymentMethodEntity.name = name;
  }
  final String? payment = jsonConvert.convert<String>(json['payment']);
  if (payment != null) {
    paymentMethodEntity.payment = payment;
  }
  final dynamic icon = json['icon'];
  if (icon != null) {
    paymentMethodEntity.icon = icon;
  }
  final dynamic handlingFeeFixed = json['handling_fee_fixed'];
  if (handlingFeeFixed != null) {
    paymentMethodEntity.handlingFeeFixed = handlingFeeFixed;
  }
  final dynamic handlingFeePercent = json['handling_fee_percent'];
  if (handlingFeePercent != null) {
    paymentMethodEntity.handlingFeePercent = handlingFeePercent;
  }
  return paymentMethodEntity;
}

Map<String, dynamic> $PaymentMethodEntityToJson(PaymentMethodEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['payment'] = entity.payment;
  data['icon'] = entity.icon;
  data['handling_fee_fixed'] = entity.handlingFeeFixed;
  data['handling_fee_percent'] = entity.handlingFeePercent;
  return data;
}