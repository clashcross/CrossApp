import 'base/json_convert_content.dart';
import '../../bean/user_comm_config_entity.dart';

UserCommConfigEntity $UserCommConfigEntityFromJson(Map<String, dynamic> json) {
  final UserCommConfigEntity userCommConfigEntity = UserCommConfigEntity();
  final int? isTelegram = jsonConvert.convert<int>(json['is_telegram']);
  if (isTelegram != null) {
    userCommConfigEntity.isTelegram = isTelegram;
  }
  final String? telegramDiscussLink = jsonConvert.convert<String>(
      json['telegram_discuss_link']);
  if (telegramDiscussLink != null) {
    userCommConfigEntity.telegramDiscussLink = telegramDiscussLink;
  }
  final dynamic stripePk = json['stripe_pk'];
  if (stripePk != null) {
    userCommConfigEntity.stripePk = stripePk;
  }
  final List<String>? withdrawMethods = (json['withdraw_methods'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (withdrawMethods != null) {
    userCommConfigEntity.withdrawMethods = withdrawMethods;
  }
  final int? withdrawClose = jsonConvert.convert<int>(json['withdraw_close']);
  if (withdrawClose != null) {
    userCommConfigEntity.withdrawClose = withdrawClose;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    userCommConfigEntity.currency = currency;
  }
  final String? currencySymbol = jsonConvert.convert<String>(
      json['currency_symbol']);
  if (currencySymbol != null) {
    userCommConfigEntity.currencySymbol = currencySymbol;
  }
  final int? commissionDistributionEnable = jsonConvert.convert<int>(
      json['commission_distribution_enable']);
  if (commissionDistributionEnable != null) {
    userCommConfigEntity.commissionDistributionEnable =
        commissionDistributionEnable;
  }
  final dynamic commissionDistributionL1 = json['commission_distribution_l1'];
  if (commissionDistributionL1 != null) {
    userCommConfigEntity.commissionDistributionL1 = commissionDistributionL1;
  }
  final dynamic commissionDistributionL2 = json['commission_distribution_l2'];
  if (commissionDistributionL2 != null) {
    userCommConfigEntity.commissionDistributionL2 = commissionDistributionL2;
  }
  final dynamic commissionDistributionL3 = json['commission_distribution_l3'];
  if (commissionDistributionL3 != null) {
    userCommConfigEntity.commissionDistributionL3 = commissionDistributionL3;
  }
  return userCommConfigEntity;
}

Map<String, dynamic> $UserCommConfigEntityToJson(UserCommConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['is_telegram'] = entity.isTelegram;
  data['telegram_discuss_link'] = entity.telegramDiscussLink;
  data['stripe_pk'] = entity.stripePk;
  data['withdraw_methods'] = entity.withdrawMethods;
  data['withdraw_close'] = entity.withdrawClose;
  data['currency'] = entity.currency;
  data['currency_symbol'] = entity.currencySymbol;
  data['commission_distribution_enable'] = entity.commissionDistributionEnable;
  data['commission_distribution_l1'] = entity.commissionDistributionL1;
  data['commission_distribution_l2'] = entity.commissionDistributionL2;
  data['commission_distribution_l3'] = entity.commissionDistributionL3;
  return data;
}

extension UserCommConfigEntityExtension on UserCommConfigEntity {
  UserCommConfigEntity copyWith({
    int? isTelegram,
    String? telegramDiscussLink,
    dynamic stripePk,
    List<String>? withdrawMethods,
    int? withdrawClose,
    String? currency,
    String? currencySymbol,
    int? commissionDistributionEnable,
    dynamic commissionDistributionL1,
    dynamic commissionDistributionL2,
    dynamic commissionDistributionL3,
  }) {
    return UserCommConfigEntity()
      ..isTelegram = isTelegram ?? this.isTelegram
      ..telegramDiscussLink = telegramDiscussLink ?? this.telegramDiscussLink
      ..stripePk = stripePk ?? this.stripePk
      ..withdrawMethods = withdrawMethods ?? this.withdrawMethods
      ..withdrawClose = withdrawClose ?? this.withdrawClose
      ..currency = currency ?? this.currency
      ..currencySymbol = currencySymbol ?? this.currencySymbol
      ..commissionDistributionEnable = commissionDistributionEnable ??
          this.commissionDistributionEnable
      ..commissionDistributionL1 = commissionDistributionL1 ??
          this.commissionDistributionL1
      ..commissionDistributionL2 = commissionDistributionL2 ??
          this.commissionDistributionL2
      ..commissionDistributionL3 = commissionDistributionL3 ??
          this.commissionDistributionL3;
  }
}