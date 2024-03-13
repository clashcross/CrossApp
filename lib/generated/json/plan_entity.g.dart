import 'base/json_convert_content.dart';
import '../../bean/plan_entity.dart';

PlanEntity $PlanEntityFromJson(Map<String, dynamic> json) {
  final PlanEntity planEntity = PlanEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    planEntity.id = id;
  }
  final int? groupId = jsonConvert.convert<int>(json['group_id']);
  if (groupId != null) {
    planEntity.groupId = groupId;
  }
  final int? transferEnable = jsonConvert.convert<int>(json['transfer_enable']);
  if (transferEnable != null) {
    planEntity.transferEnable = transferEnable;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    planEntity.name = name;
  }
  final int? speedLimit = jsonConvert.convert<int>(json['speed_limit']);
  if (speedLimit != null) {
    planEntity.speedLimit = speedLimit;
  }
  final int? xShow = jsonConvert.convert<int>(json['show']);
  if (xShow != null) {
    planEntity.xShow = xShow;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    planEntity.sort = sort;
  }
  final int? renew = jsonConvert.convert<int>(json['renew']);
  if (renew != null) {
    planEntity.renew = renew;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    planEntity.content = content;
  }
  final int? monthPrice = jsonConvert.convert<int>(json['month_price']);
  if (monthPrice != null) {
    planEntity.monthPrice = monthPrice;
  }
  final int? quarterPrice = jsonConvert.convert<int>(json['quarter_price']);
  if (quarterPrice != null) {
    planEntity.quarterPrice = quarterPrice;
  }
  final int? halfYearPrice = jsonConvert.convert<int>(json['half_year_price']);
  if (halfYearPrice != null) {
    planEntity.halfYearPrice = halfYearPrice;
  }
  final int? yearPrice = jsonConvert.convert<int>(json['year_price']);
  if (yearPrice != null) {
    planEntity.yearPrice = yearPrice;
  }
  final int? twoYearPrice = jsonConvert.convert<int>(json['two_year_price']);
  if (twoYearPrice != null) {
    planEntity.twoYearPrice = twoYearPrice;
  }
  final int? threeYearPrice = jsonConvert.convert<int>(
      json['three_year_price']);
  if (threeYearPrice != null) {
    planEntity.threeYearPrice = threeYearPrice;
  }
  final int? onetimePrice = jsonConvert.convert<int>(json['onetime_price']);
  if (onetimePrice != null) {
    planEntity.onetimePrice = onetimePrice;
  }
  final int? resetPrice = jsonConvert.convert<int>(json['reset_price']);
  if (resetPrice != null) {
    planEntity.resetPrice = resetPrice;
  }
  final int? resetTrafficMethod = jsonConvert.convert<int>(
      json['reset_traffic_method']);
  if (resetTrafficMethod != null) {
    planEntity.resetTrafficMethod = resetTrafficMethod;
  }
  final dynamic inventoryLimit = json['inventory_limit'];
  if (inventoryLimit != null) {
    planEntity.inventoryLimit = inventoryLimit;
  }
  final dynamic capacityLimit = json['capacity_limit'];
  if (capacityLimit != null) {
    planEntity.capacityLimit = capacityLimit;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    planEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    planEntity.updatedAt = updatedAt;
  }
  return planEntity;
}

Map<String, dynamic> $PlanEntityToJson(PlanEntity entity) {
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

extension PlanEntityExtension on PlanEntity {
  PlanEntity copyWith({
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
    int? quarterPrice,
    int? halfYearPrice,
    int? yearPrice,
    int? twoYearPrice,
    int? threeYearPrice,
    int? onetimePrice,
    int? resetPrice,
    int? resetTrafficMethod,
    dynamic inventoryLimit,
    dynamic capacityLimit,
    int? createdAt,
    int? updatedAt,
  }) {
    return PlanEntity()
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