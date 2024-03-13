import 'base/json_convert_content.dart';
import '../../bean/order_detail_entity.dart';

OrderDetailEntity $OrderDetailEntityFromJson(Map<String, dynamic> json) {
  final OrderDetailEntity orderDetailEntity = OrderDetailEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailEntity.id = id;
  }
  final dynamic inviteUserId = json['invite_user_id'];
  if (inviteUserId != null) {
    orderDetailEntity.inviteUserId = inviteUserId;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    orderDetailEntity.userId = userId;
  }
  final int? planId = jsonConvert.convert<int>(json['plan_id']);
  if (planId != null) {
    orderDetailEntity.planId = planId;
  }
  final int? couponId = jsonConvert.convert<int>(json['coupon_id']);
  if (couponId != null) {
    orderDetailEntity.couponId = couponId;
  }
  final dynamic paymentId = json['payment_id'];
  if (paymentId != null) {
    orderDetailEntity.paymentId = paymentId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    orderDetailEntity.type = type;
  }
  final String? period = jsonConvert.convert<String>(json['period']);
  if (period != null) {
    orderDetailEntity.period = period;
  }
  final String? tradeNo = jsonConvert.convert<String>(json['trade_no']);
  if (tradeNo != null) {
    orderDetailEntity.tradeNo = tradeNo;
  }
  final dynamic callbackNo = json['callback_no'];
  if (callbackNo != null) {
    orderDetailEntity.callbackNo = callbackNo;
  }
  final int? totalAmount = jsonConvert.convert<int>(json['total_amount']);
  if (totalAmount != null) {
    orderDetailEntity.totalAmount = totalAmount;
  }
  final dynamic handlingAmount = json['handling_amount'];
  if (handlingAmount != null) {
    orderDetailEntity.handlingAmount = handlingAmount;
  }
  final int? discountAmount = jsonConvert.convert<int>(json['discount_amount']);
  if (discountAmount != null) {
    orderDetailEntity.discountAmount = discountAmount;
  }
  final dynamic surplusAmount = json['surplus_amount'];
  if (surplusAmount != null) {
    orderDetailEntity.surplusAmount = surplusAmount;
  }
  final dynamic refundAmount = json['refund_amount'];
  if (refundAmount != null) {
    orderDetailEntity.refundAmount = refundAmount;
  }
  final dynamic balanceAmount = json['balance_amount'];
  if (balanceAmount != null) {
    orderDetailEntity.balanceAmount = balanceAmount;
  }
  final dynamic surplusOrderIds = json['surplus_order_ids'];
  if (surplusOrderIds != null) {
    orderDetailEntity.surplusOrderIds = surplusOrderIds;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderDetailEntity.status = status;
  }
  final int? commissionStatus = jsonConvert.convert<int>(
      json['commission_status']);
  if (commissionStatus != null) {
    orderDetailEntity.commissionStatus = commissionStatus;
  }
  final int? commissionBalance = jsonConvert.convert<int>(
      json['commission_balance']);
  if (commissionBalance != null) {
    orderDetailEntity.commissionBalance = commissionBalance;
  }
  final dynamic actualCommissionBalance = json['actual_commission_balance'];
  if (actualCommissionBalance != null) {
    orderDetailEntity.actualCommissionBalance = actualCommissionBalance;
  }
  final dynamic paidAt = json['paid_at'];
  if (paidAt != null) {
    orderDetailEntity.paidAt = paidAt;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    orderDetailEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    orderDetailEntity.updatedAt = updatedAt;
  }
  final OrderDetailPlan? plan = jsonConvert.convert<OrderDetailPlan>(
      json['plan']);
  if (plan != null) {
    orderDetailEntity.plan = plan;
  }
  final int? tryOutPlanId = jsonConvert.convert<int>(json['try_out_plan_id']);
  if (tryOutPlanId != null) {
    orderDetailEntity.tryOutPlanId = tryOutPlanId;
  }
  return orderDetailEntity;
}

Map<String, dynamic> $OrderDetailEntityToJson(OrderDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['invite_user_id'] = entity.inviteUserId;
  data['user_id'] = entity.userId;
  data['plan_id'] = entity.planId;
  data['coupon_id'] = entity.couponId;
  data['payment_id'] = entity.paymentId;
  data['type'] = entity.type;
  data['period'] = entity.period;
  data['trade_no'] = entity.tradeNo;
  data['callback_no'] = entity.callbackNo;
  data['total_amount'] = entity.totalAmount;
  data['handling_amount'] = entity.handlingAmount;
  data['discount_amount'] = entity.discountAmount;
  data['surplus_amount'] = entity.surplusAmount;
  data['refund_amount'] = entity.refundAmount;
  data['balance_amount'] = entity.balanceAmount;
  data['surplus_order_ids'] = entity.surplusOrderIds;
  data['status'] = entity.status;
  data['commission_status'] = entity.commissionStatus;
  data['commission_balance'] = entity.commissionBalance;
  data['actual_commission_balance'] = entity.actualCommissionBalance;
  data['paid_at'] = entity.paidAt;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['plan'] = entity.plan.toJson();
  data['try_out_plan_id'] = entity.tryOutPlanId;
  return data;
}

extension OrderDetailEntityExtension on OrderDetailEntity {
  OrderDetailEntity copyWith({
    int? id,
    dynamic inviteUserId,
    int? userId,
    int? planId,
    int? couponId,
    dynamic paymentId,
    int? type,
    String? period,
    String? tradeNo,
    dynamic callbackNo,
    int? totalAmount,
    dynamic handlingAmount,
    int? discountAmount,
    dynamic surplusAmount,
    dynamic refundAmount,
    dynamic balanceAmount,
    dynamic surplusOrderIds,
    int? status,
    int? commissionStatus,
    int? commissionBalance,
    dynamic actualCommissionBalance,
    dynamic paidAt,
    int? createdAt,
    int? updatedAt,
    OrderDetailPlan? plan,
    int? tryOutPlanId,
  }) {
    return OrderDetailEntity()
      ..id = id ?? this.id
      ..inviteUserId = inviteUserId ?? this.inviteUserId
      ..userId = userId ?? this.userId
      ..planId = planId ?? this.planId
      ..couponId = couponId ?? this.couponId
      ..paymentId = paymentId ?? this.paymentId
      ..type = type ?? this.type
      ..period = period ?? this.period
      ..tradeNo = tradeNo ?? this.tradeNo
      ..callbackNo = callbackNo ?? this.callbackNo
      ..totalAmount = totalAmount ?? this.totalAmount
      ..handlingAmount = handlingAmount ?? this.handlingAmount
      ..discountAmount = discountAmount ?? this.discountAmount
      ..surplusAmount = surplusAmount ?? this.surplusAmount
      ..refundAmount = refundAmount ?? this.refundAmount
      ..balanceAmount = balanceAmount ?? this.balanceAmount
      ..surplusOrderIds = surplusOrderIds ?? this.surplusOrderIds
      ..status = status ?? this.status
      ..commissionStatus = commissionStatus ?? this.commissionStatus
      ..commissionBalance = commissionBalance ?? this.commissionBalance
      ..actualCommissionBalance = actualCommissionBalance ??
          this.actualCommissionBalance
      ..paidAt = paidAt ?? this.paidAt
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..plan = plan ?? this.plan
      ..tryOutPlanId = tryOutPlanId ?? this.tryOutPlanId;
  }
}

OrderDetailPlan $OrderDetailPlanFromJson(Map<String, dynamic> json) {
  final OrderDetailPlan orderDetailPlan = OrderDetailPlan();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailPlan.id = id;
  }
  final int? groupId = jsonConvert.convert<int>(json['group_id']);
  if (groupId != null) {
    orderDetailPlan.groupId = groupId;
  }
  final int? transferEnable = jsonConvert.convert<int>(json['transfer_enable']);
  if (transferEnable != null) {
    orderDetailPlan.transferEnable = transferEnable;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailPlan.name = name;
  }
  final int? speedLimit = jsonConvert.convert<int>(json['speed_limit']);
  if (speedLimit != null) {
    orderDetailPlan.speedLimit = speedLimit;
  }
  final int? xShow = jsonConvert.convert<int>(json['show']);
  if (xShow != null) {
    orderDetailPlan.xShow = xShow;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    orderDetailPlan.sort = sort;
  }
  final int? renew = jsonConvert.convert<int>(json['renew']);
  if (renew != null) {
    orderDetailPlan.renew = renew;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    orderDetailPlan.content = content;
  }
  final int? monthPrice = jsonConvert.convert<int>(json['month_price']);
  if (monthPrice != null) {
    orderDetailPlan.monthPrice = monthPrice;
  }
  final dynamic quarterPrice = json['quarter_price'];
  if (quarterPrice != null) {
    orderDetailPlan.quarterPrice = quarterPrice;
  }
  final dynamic halfYearPrice = json['half_year_price'];
  if (halfYearPrice != null) {
    orderDetailPlan.halfYearPrice = halfYearPrice;
  }
  final dynamic yearPrice = json['year_price'];
  if (yearPrice != null) {
    orderDetailPlan.yearPrice = yearPrice;
  }
  final dynamic twoYearPrice = json['two_year_price'];
  if (twoYearPrice != null) {
    orderDetailPlan.twoYearPrice = twoYearPrice;
  }
  final dynamic threeYearPrice = json['three_year_price'];
  if (threeYearPrice != null) {
    orderDetailPlan.threeYearPrice = threeYearPrice;
  }
  final dynamic onetimePrice = json['onetime_price'];
  if (onetimePrice != null) {
    orderDetailPlan.onetimePrice = onetimePrice;
  }
  final dynamic resetPrice = json['reset_price'];
  if (resetPrice != null) {
    orderDetailPlan.resetPrice = resetPrice;
  }
  final int? resetTrafficMethod = jsonConvert.convert<int>(
      json['reset_traffic_method']);
  if (resetTrafficMethod != null) {
    orderDetailPlan.resetTrafficMethod = resetTrafficMethod;
  }
  final dynamic inventoryLimit = json['inventory_limit'];
  if (inventoryLimit != null) {
    orderDetailPlan.inventoryLimit = inventoryLimit;
  }
  final dynamic capacityLimit = json['capacity_limit'];
  if (capacityLimit != null) {
    orderDetailPlan.capacityLimit = capacityLimit;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    orderDetailPlan.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    orderDetailPlan.updatedAt = updatedAt;
  }
  return orderDetailPlan;
}

Map<String, dynamic> $OrderDetailPlanToJson(OrderDetailPlan entity) {
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

extension OrderDetailPlanExtension on OrderDetailPlan {
  OrderDetailPlan copyWith({
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
    return OrderDetailPlan()
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