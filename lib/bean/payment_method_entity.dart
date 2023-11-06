
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/payment_method_entity.g.dart';

@JsonSerializable()
class PaymentMethodEntity {
	late double id;
	late String name = '';
	late String payment = '';
	dynamic icon;
	@JSONField(name: "handling_fee_fixed")
	dynamic handlingFeeFixed;
	@JSONField(name: "handling_fee_percent")
	dynamic handlingFeePercent;

	PaymentMethodEntity();

	factory PaymentMethodEntity.fromJson(Map<String, dynamic> json) => $PaymentMethodEntityFromJson(json);

	Map<String, dynamic> toJson() => $PaymentMethodEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}