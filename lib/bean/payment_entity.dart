
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/payment_entity.g.dart';

@JsonSerializable()
class PaymentEntity {
	late int type;
	late String data;

	PaymentEntity();

	factory PaymentEntity.fromJson(Map<String, dynamic> json) => $PaymentEntityFromJson(json);

	Map<String, dynamic> toJson() => $PaymentEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}