
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
	late String email = '';
	@JSONField(name: "transfer_enable")
	late int transferEnable = 0;
	@JSONField(name: "last_login_at")
	dynamic lastLoginAt;
	@JSONField(name: "created_at")
	late int createdAt = 0;
	late int banned = 0;
	@JSONField(name: "remind_expire")
	late int remindExpire = 0;
	@JSONField(name: "remind_traffic")
	late int remindTraffic = 0;
	@JSONField(name: "expired_at")
	late int expiredAt = 0;
	late int balance = 0;
	@JSONField(name: "commission_balance")
	late int commissionBalance = 0;
	@JSONField(name: "plan_id")
	late int planId = 0;
	dynamic discount;
	@JSONField(name: "commission_rate")
	dynamic commissionRate;
	@JSONField(name: "telegram_id")
	dynamic telegramId;
	late String uuid = '';
	@JSONField(name: "avatar_url")
	late String avatarUrl = '';

	UserInfoEntity();

	factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}