import 'base/json_convert_content.dart';
import '../../bean/payment_entity.dart';

PaymentEntity $PaymentEntityFromJson(Map<String, dynamic> json) {
  final PaymentEntity paymentEntity = PaymentEntity();
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    paymentEntity.type = type;
  }
  final String? data = jsonConvert.convert<String>(json['data']);
  if (data != null) {
    paymentEntity.data = data;
  }
  return paymentEntity;
}

Map<String, dynamic> $PaymentEntityToJson(PaymentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['data'] = entity.data;
  return data;
}

extension PaymentEntityExtension on PaymentEntity {
  PaymentEntity copyWith({
    int? type,
    String? data,
  }) {
    return PaymentEntity()
      ..type = type ?? this.type
      ..data = data ?? this.data;
  }
}