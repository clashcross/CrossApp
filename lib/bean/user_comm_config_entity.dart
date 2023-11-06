
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/user_comm_config_entity.g.dart';

@JsonSerializable()
class UserCommConfigEntity {
	@JSONField(name: "is_telegram")
	late int isTelegram = 0;
	@JSONField(name: "telegram_discuss_link")
	late String telegramDiscussLink = '';
	@JSONField(name: "stripe_pk")
	dynamic stripePk;
	@JSONField(name: "withdraw_methods")
	late List<String> withdrawMethods;
	@JSONField(name: "withdraw_close")
	late int withdrawClose = 0;
	late String currency = '';
	@JSONField(name: "currency_symbol")
	late String currencySymbol = '';
	@JSONField(name: "commission_distribution_enable")
	late int commissionDistributionEnable = 0;
	@JSONField(name: "commission_distribution_l1")
	dynamic commissionDistributionL1;
	@JSONField(name: "commission_distribution_l2")
	dynamic commissionDistributionL2;
	@JSONField(name: "commission_distribution_l3")
	dynamic commissionDistributionL3;

	UserCommConfigEntity();

	factory UserCommConfigEntity.fromJson(Map<String, dynamic> json) => $UserCommConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserCommConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}