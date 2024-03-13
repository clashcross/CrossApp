import 'base/json_convert_content.dart';
import '../../bean/no_sub_scribe_entity.dart';

NoSubScribeEntity $NoSubScribeEntityFromJson(Map<String, dynamic> json) {
  final NoSubScribeEntity noSubScribeEntity = NoSubScribeEntity();
  final dynamic planId = json['plan_id'];
  if (planId != null) {
    noSubScribeEntity.planId = planId;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    noSubScribeEntity.token = token;
  }
  final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
  if (expiredAt != null) {
    noSubScribeEntity.expiredAt = expiredAt;
  }
  final int? u = jsonConvert.convert<int>(json['u']);
  if (u != null) {
    noSubScribeEntity.u = u;
  }
  final int? d = jsonConvert.convert<int>(json['d']);
  if (d != null) {
    noSubScribeEntity.d = d;
  }
  final int? transferEnable = jsonConvert.convert<int>(json['transfer_enable']);
  if (transferEnable != null) {
    noSubScribeEntity.transferEnable = transferEnable;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    noSubScribeEntity.email = email;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    noSubScribeEntity.uuid = uuid;
  }
  final String? subscribeUrl = jsonConvert.convert<String>(
      json['subscribe_url']);
  if (subscribeUrl != null) {
    noSubScribeEntity.subscribeUrl = subscribeUrl;
  }
  final dynamic plan = json['plan'];
  if (plan != null) {
    noSubScribeEntity.plan = plan;
  }
  final dynamic resetDay = json['reset_day'];
  if (resetDay != null) {
    noSubScribeEntity.resetDay = resetDay;
  }
  return noSubScribeEntity;
}

Map<String, dynamic> $NoSubScribeEntityToJson(NoSubScribeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['plan_id'] = entity.planId;
  data['token'] = entity.token;
  data['expired_at'] = entity.expiredAt;
  data['u'] = entity.u;
  data['d'] = entity.d;
  data['transfer_enable'] = entity.transferEnable;
  data['email'] = entity.email;
  data['uuid'] = entity.uuid;
  data['subscribe_url'] = entity.subscribeUrl;
  data['plan'] = entity.plan;
  data['reset_day'] = entity.resetDay;
  return data;
}

extension NoSubScribeEntityExtension on NoSubScribeEntity {
  NoSubScribeEntity copyWith({
    dynamic planId,
    String? token,
    int? expiredAt,
    int? u,
    int? d,
    int? transferEnable,
    String? email,
    String? uuid,
    String? subscribeUrl,
    dynamic plan,
    dynamic resetDay,
  }) {
    return NoSubScribeEntity()
      ..planId = planId ?? this.planId
      ..token = token ?? this.token
      ..expiredAt = expiredAt ?? this.expiredAt
      ..u = u ?? this.u
      ..d = d ?? this.d
      ..transferEnable = transferEnable ?? this.transferEnable
      ..email = email ?? this.email
      ..uuid = uuid ?? this.uuid
      ..subscribeUrl = subscribeUrl ?? this.subscribeUrl
      ..plan = plan ?? this.plan
      ..resetDay = resetDay ?? this.resetDay;
  }
}