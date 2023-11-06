import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/coupon_entity.g.dart';

@JsonSerializable()
class CouponEntity {
	late int id = 0;
	late String code = '';
	late String name = '';
	late int type = 0;
	late int value = 0;
	@JSONField(name: "show")
	late int xShow = 0;
	@JSONField(name: "limit_use")
	dynamic limitUse;
	@JSONField(name: "limit_use_with_user")
	late int limitUseWithUser = 0;
	@JSONField(name: "limit_plan_ids")
	dynamic limitPlanIds;
	@JSONField(name: "limit_period")
	dynamic limitPeriod;
	@JSONField(name: "started_at")
	late int startedAt = 0;
	@JSONField(name: "ended_at")
	late int endedAt = 0;
	@JSONField(name: "created_at")
	late int createdAt = 0;
	@JSONField(name: "updated_at")
	late int updatedAt = 0;

	CouponEntity();

	factory CouponEntity.fromJson(Map<String, dynamic> json) => $CouponEntityFromJson(json);

	Map<String, dynamic> toJson() => $CouponEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}