
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/order_detail_entity.g.dart';

@JsonSerializable()
class OrderDetailEntity {
	late int id = 0;
	@JSONField(name: "invite_user_id")
	dynamic inviteUserId;
	@JSONField(name: "user_id")
	late int userId = 0;
	@JSONField(name: "plan_id")
	late int planId = 0;
	@JSONField(name: "coupon_id")
	late int couponId = 0;
	@JSONField(name: "payment_id")
	dynamic paymentId;
	late int type = 0;
	late String period = '';
	@JSONField(name: "trade_no")
	late String tradeNo = '';
	@JSONField(name: "callback_no")
	dynamic callbackNo;
	@JSONField(name: "total_amount")
	late int totalAmount = 0;
	@JSONField(name: "handling_amount")
	dynamic handlingAmount;
	@JSONField(name: "discount_amount")
	late int discountAmount = 0;
	@JSONField(name: "surplus_amount")
	dynamic surplusAmount;
	@JSONField(name: "refund_amount")
	dynamic refundAmount;
	@JSONField(name: "balance_amount")
	dynamic balanceAmount;
	@JSONField(name: "surplus_order_ids")
	dynamic surplusOrderIds;
	late int status = 0;
	@JSONField(name: "commission_status")
	late int commissionStatus = 0;
	@JSONField(name: "commission_balance")
	late int commissionBalance = 0;
	@JSONField(name: "actual_commission_balance")
	dynamic actualCommissionBalance;
	@JSONField(name: "paid_at")
	dynamic paidAt;
	@JSONField(name: "created_at")
	late int createdAt = 0;
	@JSONField(name: "updated_at")
	late int updatedAt = 0;
	late OrderDetailPlan plan;
	@JSONField(name: "try_out_plan_id")
	late int tryOutPlanId = 0;

	OrderDetailEntity();

	factory OrderDetailEntity.fromJson(Map<String, dynamic> json) => $OrderDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailPlan {
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

	OrderDetailPlan();

	factory OrderDetailPlan.fromJson(Map<String, dynamic> json) => $OrderDetailPlanFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailPlanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}