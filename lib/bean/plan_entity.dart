
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/plan_entity.g.dart';

@JsonSerializable()
class PlanEntity {
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
  late int quarterPrice = 0;
  @JSONField(name: "half_year_price")
  late int halfYearPrice = 0;
  @JSONField(name: "year_price")
  late int yearPrice = 0;
  @JSONField(name: "two_year_price")
  late int twoYearPrice = 0;
  @JSONField(name: "three_year_price")
  late int threeYearPrice = 0;
  @JSONField(name: "onetime_price")
  late int onetimePrice = 0;
  @JSONField(name: "reset_price")
  late int resetPrice = 0;
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

  PlanEntity();

  factory PlanEntity.fromJson(Map<String, dynamic> json) =>
      $PlanEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlanEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
