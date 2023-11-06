

import '../../bean/coupon_entity.dart';
import 'base/json_convert_content.dart';

CouponEntity $CouponEntityFromJson(Map<String, dynamic> json) {
  final CouponEntity couponEntity = CouponEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    couponEntity.id = id;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    couponEntity.code = code;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    couponEntity.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    couponEntity.type = type;
  }
  final int? value = jsonConvert.convert<int>(json['value']);
  if (value != null) {
    couponEntity.value = value;
  }
  final int? xShow = jsonConvert.convert<int>(json['show']);
  if (xShow != null) {
    couponEntity.xShow = xShow;
  }
  final dynamic limitUse = json['limit_use'];
  if (limitUse != null) {
    couponEntity.limitUse = limitUse;
  }
  final int? limitUseWithUser = jsonConvert.convert<int>(
      json['limit_use_with_user']);
  if (limitUseWithUser != null) {
    couponEntity.limitUseWithUser = limitUseWithUser;
  }
  final dynamic limitPlanIds = json['limit_plan_ids'];
  if (limitPlanIds != null) {
    couponEntity.limitPlanIds = limitPlanIds;
  }
  final dynamic limitPeriod = json['limit_period'];
  if (limitPeriod != null) {
    couponEntity.limitPeriod = limitPeriod;
  }
  final int? startedAt = jsonConvert.convert<int>(json['started_at']);
  if (startedAt != null) {
    couponEntity.startedAt = startedAt;
  }
  final int? endedAt = jsonConvert.convert<int>(json['ended_at']);
  if (endedAt != null) {
    couponEntity.endedAt = endedAt;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    couponEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    couponEntity.updatedAt = updatedAt;
  }
  return couponEntity;
}

Map<String, dynamic> $CouponEntityToJson(CouponEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['code'] = entity.code;
  data['name'] = entity.name;
  data['type'] = entity.type;
  data['value'] = entity.value;
  data['show'] = entity.xShow;
  data['limit_use'] = entity.limitUse;
  data['limit_use_with_user'] = entity.limitUseWithUser;
  data['limit_plan_ids'] = entity.limitPlanIds;
  data['limit_period'] = entity.limitPeriod;
  data['started_at'] = entity.startedAt;
  data['ended_at'] = entity.endedAt;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}