import 'base/json_convert_content.dart';
import '../../bean/sub_scribe_entity.dart';

SubScribeEntity $SubScribeEntityFromJson(Map<String, dynamic> json) {
  final SubScribeEntity subScribeEntity = SubScribeEntity();
  final int? planId = jsonConvert.convert<int>(json['plan_id']);
  if (planId != null) {
    subScribeEntity.planId = planId;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    subScribeEntity.token = token;
  }
  final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
  if (expiredAt != null) {
    subScribeEntity.expiredAt = expiredAt;
  }
  final int? u = jsonConvert.convert<int>(json['u']);
  if (u != null) {
    subScribeEntity.u = u;
  }
  final int? d = jsonConvert.convert<int>(json['d']);
  if (d != null) {
    subScribeEntity.d = d;
  }
  final int? transferEnable = jsonConvert.convert<int>(json['transfer_enable']);
  if (transferEnable != null) {
    subScribeEntity.transferEnable = transferEnable;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    subScribeEntity.email = email;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    subScribeEntity.uuid = uuid;
  }
  final SubScribePlan? plan = jsonConvert.convert<SubScribePlan>(json['plan']);
  if (plan != null) {
    subScribeEntity.plan = plan;
  }
  final String? subscribeUrl = jsonConvert.convert<String>(
      json['subscribe_url']);
  if (subscribeUrl != null) {
    subScribeEntity.subscribeUrl = subscribeUrl;
  }
  final int? resetDay = jsonConvert.convert<int>(json['reset_day']);
  if (resetDay != null) {
    subScribeEntity.resetDay = resetDay;
  }
  return subScribeEntity;
}

Map<String, dynamic> $SubScribeEntityToJson(SubScribeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['plan_id'] = entity.planId;
  data['token'] = entity.token;
  data['expired_at'] = entity.expiredAt;
  data['u'] = entity.u;
  data['d'] = entity.d;
  data['transfer_enable'] = entity.transferEnable;
  data['email'] = entity.email;
  data['uuid'] = entity.uuid;
  data['plan'] = entity.plan.toJson();
  data['subscribe_url'] = entity.subscribeUrl;
  data['reset_day'] = entity.resetDay;
  return data;
}

extension SubScribeEntityExtension on SubScribeEntity {
  SubScribeEntity copyWith({
    int? planId,
    String? token,
    int? expiredAt,
    int? u,
    int? d,
    int? transferEnable,
    String? email,
    String? uuid,
    SubScribePlan? plan,
    String? subscribeUrl,
    int? resetDay,
  }) {
    return SubScribeEntity()
      ..planId = planId ?? this.planId
      ..token = token ?? this.token
      ..expiredAt = expiredAt ?? this.expiredAt
      ..u = u ?? this.u
      ..d = d ?? this.d
      ..transferEnable = transferEnable ?? this.transferEnable
      ..email = email ?? this.email
      ..uuid = uuid ?? this.uuid
      ..plan = plan ?? this.plan
      ..subscribeUrl = subscribeUrl ?? this.subscribeUrl
      ..resetDay = resetDay ?? this.resetDay;
  }
}

SubScribePlan $SubScribePlanFromJson(Map<String, dynamic> json) {
  final SubScribePlan subScribePlan = SubScribePlan();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    subScribePlan.id = id;
  }
  final int? groupId = jsonConvert.convert<int>(json['group_id']);
  if (groupId != null) {
    subScribePlan.groupId = groupId;
  }
  final int? transferEnable = jsonConvert.convert<int>(json['transfer_enable']);
  if (transferEnable != null) {
    subScribePlan.transferEnable = transferEnable;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    subScribePlan.name = name;
  }
  final int? speedLimit = jsonConvert.convert<int>(json['speed_limit']);
  if (speedLimit != null) {
    subScribePlan.speedLimit = speedLimit;
  }
  final int? xShow = jsonConvert.convert<int>(json['show']);
  if (xShow != null) {
    subScribePlan.xShow = xShow;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    subScribePlan.sort = sort;
  }
  final int? renew = jsonConvert.convert<int>(json['renew']);
  if (renew != null) {
    subScribePlan.renew = renew;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    subScribePlan.content = content;
  }
  final int? monthPrice = jsonConvert.convert<int>(json['month_price']);
  if (monthPrice != null) {
    subScribePlan.monthPrice = monthPrice;
  }
  final dynamic quarterPrice = json['quarter_price'];
  if (quarterPrice != null) {
    subScribePlan.quarterPrice = quarterPrice;
  }
  final dynamic halfYearPrice = json['half_year_price'];
  if (halfYearPrice != null) {
    subScribePlan.halfYearPrice = halfYearPrice;
  }
  final dynamic yearPrice = json['year_price'];
  if (yearPrice != null) {
    subScribePlan.yearPrice = yearPrice;
  }
  final dynamic twoYearPrice = json['two_year_price'];
  if (twoYearPrice != null) {
    subScribePlan.twoYearPrice = twoYearPrice;
  }
  final dynamic threeYearPrice = json['three_year_price'];
  if (threeYearPrice != null) {
    subScribePlan.threeYearPrice = threeYearPrice;
  }
  final dynamic onetimePrice = json['onetime_price'];
  if (onetimePrice != null) {
    subScribePlan.onetimePrice = onetimePrice;
  }
  final dynamic resetPrice = json['reset_price'];
  if (resetPrice != null) {
    subScribePlan.resetPrice = resetPrice;
  }
  final int? resetTrafficMethod = jsonConvert.convert<int>(
      json['reset_traffic_method']);
  if (resetTrafficMethod != null) {
    subScribePlan.resetTrafficMethod = resetTrafficMethod;
  }
  final dynamic inventoryLimit = json['inventory_limit'];
  if (inventoryLimit != null) {
    subScribePlan.inventoryLimit = inventoryLimit;
  }
  final dynamic capacityLimit = json['capacity_limit'];
  if (capacityLimit != null) {
    subScribePlan.capacityLimit = capacityLimit;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    subScribePlan.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    subScribePlan.updatedAt = updatedAt;
  }
  return subScribePlan;
}

Map<String, dynamic> $SubScribePlanToJson(SubScribePlan entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['group_id'] = entity.groupId;
  data['transfer_enable'] = entity.transferEnable;
  data['name'] = entity.name;
  data['speed_limit'] = entity.speedLimit;
  data['show'] = entity.xShow;
  data['sort'] = entity.sort;
  data['renew'] = entity.renew;
  data['content'] = entity.content;
  data['month_price'] = entity.monthPrice;
  data['quarter_price'] = entity.quarterPrice;
  data['half_year_price'] = entity.halfYearPrice;
  data['year_price'] = entity.yearPrice;
  data['two_year_price'] = entity.twoYearPrice;
  data['three_year_price'] = entity.threeYearPrice;
  data['onetime_price'] = entity.onetimePrice;
  data['reset_price'] = entity.resetPrice;
  data['reset_traffic_method'] = entity.resetTrafficMethod;
  data['inventory_limit'] = entity.inventoryLimit;
  data['capacity_limit'] = entity.capacityLimit;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension SubScribePlanExtension on SubScribePlan {
  SubScribePlan copyWith({
    int? id,
    int? groupId,
    int? transferEnable,
    String? name,
    int? speedLimit,
    int? xShow,
    int? sort,
    int? renew,
    String? content,
    int? monthPrice,
    dynamic quarterPrice,
    dynamic halfYearPrice,
    dynamic yearPrice,
    dynamic twoYearPrice,
    dynamic threeYearPrice,
    dynamic onetimePrice,
    dynamic resetPrice,
    int? resetTrafficMethod,
    dynamic inventoryLimit,
    dynamic capacityLimit,
    int? createdAt,
    int? updatedAt,
  }) {
    return SubScribePlan()
      ..id = id ?? this.id
      ..groupId = groupId ?? this.groupId
      ..transferEnable = transferEnable ?? this.transferEnable
      ..name = name ?? this.name
      ..speedLimit = speedLimit ?? this.speedLimit
      ..xShow = xShow ?? this.xShow
      ..sort = sort ?? this.sort
      ..renew = renew ?? this.renew
      ..content = content ?? this.content
      ..monthPrice = monthPrice ?? this.monthPrice
      ..quarterPrice = quarterPrice ?? this.quarterPrice
      ..halfYearPrice = halfYearPrice ?? this.halfYearPrice
      ..yearPrice = yearPrice ?? this.yearPrice
      ..twoYearPrice = twoYearPrice ?? this.twoYearPrice
      ..threeYearPrice = threeYearPrice ?? this.threeYearPrice
      ..onetimePrice = onetimePrice ?? this.onetimePrice
      ..resetPrice = resetPrice ?? this.resetPrice
      ..resetTrafficMethod = resetTrafficMethod ?? this.resetTrafficMethod
      ..inventoryLimit = inventoryLimit ?? this.inventoryLimit
      ..capacityLimit = capacityLimit ?? this.capacityLimit
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}