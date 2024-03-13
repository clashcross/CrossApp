import 'base/json_convert_content.dart';
import '../../bean/payment_method_entity.dart';

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

extension PaymentMethodEntityExtension on PaymentMethodEntity {
  PaymentMethodEntity copyWith({
    double? id,
    String? name,
    String? payment,
    dynamic icon,
    dynamic handlingFeeFixed,
    dynamic handlingFeePercent,
  }) {
    return PaymentMethodEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..payment = payment ?? this.payment
      ..icon = icon ?? this.icon
      ..handlingFeeFixed = handlingFeeFixed ?? this.handlingFeeFixed
      ..handlingFeePercent = handlingFeePercent ?? this.handlingFeePercent;
  }
}