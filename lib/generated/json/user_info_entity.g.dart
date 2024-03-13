import 'base/json_convert_content.dart';
import '../../bean/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userInfoEntity.email = email;
  }
  final int? transferEnable = jsonConvert.convert<int>(json['transfer_enable']);
  if (transferEnable != null) {
    userInfoEntity.transferEnable = transferEnable;
  }
  final dynamic lastLoginAt = json['last_login_at'];
  if (lastLoginAt != null) {
    userInfoEntity.lastLoginAt = lastLoginAt;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    userInfoEntity.createdAt = createdAt;
  }
  final int? banned = jsonConvert.convert<int>(json['banned']);
  if (banned != null) {
    userInfoEntity.banned = banned;
  }
  final int? remindExpire = jsonConvert.convert<int>(json['remind_expire']);
  if (remindExpire != null) {
    userInfoEntity.remindExpire = remindExpire;
  }
  final int? remindTraffic = jsonConvert.convert<int>(json['remind_traffic']);
  if (remindTraffic != null) {
    userInfoEntity.remindTraffic = remindTraffic;
  }
  final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
  if (expiredAt != null) {
    userInfoEntity.expiredAt = expiredAt;
  }
  final int? balance = jsonConvert.convert<int>(json['balance']);
  if (balance != null) {
    userInfoEntity.balance = balance;
  }
  final int? commissionBalance = jsonConvert.convert<int>(
      json['commission_balance']);
  if (commissionBalance != null) {
    userInfoEntity.commissionBalance = commissionBalance;
  }
  final int? planId = jsonConvert.convert<int>(json['plan_id']);
  if (planId != null) {
    userInfoEntity.planId = planId;
  }
  final dynamic discount = json['discount'];
  if (discount != null) {
    userInfoEntity.discount = discount;
  }
  final dynamic commissionRate = json['commission_rate'];
  if (commissionRate != null) {
    userInfoEntity.commissionRate = commissionRate;
  }
  final dynamic telegramId = json['telegram_id'];
  if (telegramId != null) {
    userInfoEntity.telegramId = telegramId;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    userInfoEntity.uuid = uuid;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    userInfoEntity.avatarUrl = avatarUrl;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = entity.email;
  data['transfer_enable'] = entity.transferEnable;
  data['last_login_at'] = entity.lastLoginAt;
  data['created_at'] = entity.createdAt;
  data['banned'] = entity.banned;
  data['remind_expire'] = entity.remindExpire;
  data['remind_traffic'] = entity.remindTraffic;
  data['expired_at'] = entity.expiredAt;
  data['balance'] = entity.balance;
  data['commission_balance'] = entity.commissionBalance;
  data['plan_id'] = entity.planId;
  data['discount'] = entity.discount;
  data['commission_rate'] = entity.commissionRate;
  data['telegram_id'] = entity.telegramId;
  data['uuid'] = entity.uuid;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

extension UserInfoEntityExtension on UserInfoEntity {
  UserInfoEntity copyWith({
    String? email,
    int? transferEnable,
    dynamic lastLoginAt,
    int? createdAt,
    int? banned,
    int? remindExpire,
    int? remindTraffic,
    int? expiredAt,
    int? balance,
    int? commissionBalance,
    int? planId,
    dynamic discount,
    dynamic commissionRate,
    dynamic telegramId,
    String? uuid,
    String? avatarUrl,
  }) {
    return UserInfoEntity()
      ..email = email ?? this.email
      ..transferEnable = transferEnable ?? this.transferEnable
      ..lastLoginAt = lastLoginAt ?? this.lastLoginAt
      ..createdAt = createdAt ?? this.createdAt
      ..banned = banned ?? this.banned
      ..remindExpire = remindExpire ?? this.remindExpire
      ..remindTraffic = remindTraffic ?? this.remindTraffic
      ..expiredAt = expiredAt ?? this.expiredAt
      ..balance = balance ?? this.balance
      ..commissionBalance = commissionBalance ?? this.commissionBalance
      ..planId = planId ?? this.planId
      ..discount = discount ?? this.discount
      ..commissionRate = commissionRate ?? this.commissionRate
      ..telegramId = telegramId ?? this.telegramId
      ..uuid = uuid ?? this.uuid
      ..avatarUrl = avatarUrl ?? this.avatarUrl;
  }
}