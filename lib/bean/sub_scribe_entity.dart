
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/sub_scribe_entity.g.dart';

@JsonSerializable()
class SubScribeEntity {
	@JSONField(name: "plan_id")
	late int planId = 0;
	late String token = '';
	@JSONField(name: "expired_at")
	late int expiredAt = 0;
	late int u = 0;
	late int d = 0;
	@JSONField(name: "transfer_enable")
	late int transferEnable = 0;
	late String email = '';
	late String uuid = '';
	late SubScribePlan plan = SubScribePlan();
	@JSONField(name: "subscribe_url")
	late String subscribeUrl = '';
	@JSONField(name: "reset_day")
	late int resetDay = 0;

	SubScribeEntity();

	factory SubScribeEntity.fromJson(Map<String, dynamic> json) => $SubScribeEntityFromJson(json);

	Map<String, dynamic> toJson() => $SubScribeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SubScribePlan {
	late int id = 0;
	@JSONField(name: "group_id")
	late int groupId = 0;
	@JSONField(name: "transfer_enable")
	late int transferEnable = 0;
	late String name = '';
	@JSONField(name: "speed_limit")
	late int speedLimit = 0;
	@JSONField(name: "show")
	late int xShow = 0;
	late int sort = 0;
	late int renew = 0;
	late String content = '';
	@JSONField(name: "month_price")
	late int monthPrice = 0;
	@JSONField(name: "quarter_price")
	dynamic quarterPrice;
	@JSONField(name: "half_year_price")
	dynamic halfYearPrice;
	@JSONField(name: "year_price")
	dynamic yearPrice;
	@JSONField(name: "two_year_price")
	dynamic twoYearPrice;
	@JSONField(name: "three_year_price")
	dynamic threeYearPrice;
	@JSONField(name: "onetime_price")
	dynamic onetimePrice;
	@JSONField(name: "reset_price")
	dynamic resetPrice;
	@JSONField(name: "reset_traffic_method")
	late int resetTrafficMethod = 0;
	@JSONField(name: "inventory_limit")
	dynamic inventoryLimit;
	@JSONField(name: "capacity_limit")
	dynamic capacityLimit;
	@JSONField(name: "created_at")
	late int createdAt = 0;
	@JSONField(name: "updated_at")
	late int updatedAt = 0;

	SubScribePlan();

	factory SubScribePlan.fromJson(Map<String, dynamic> json) => $SubScribePlanFromJson(json);

	Map<String, dynamic> toJson() => $SubScribePlanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}