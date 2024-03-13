import 'base/json_convert_content.dart';
import '../../bean/guest_comm_config_entity.dart';

GuestCommConfigEntity $GuestCommConfigEntityFromJson(
    Map<String, dynamic> json) {
  final GuestCommConfigEntity guestCommConfigEntity = GuestCommConfigEntity();
  final dynamic tosUrl = json['tos_url'];
  if (tosUrl != null) {
    guestCommConfigEntity.tosUrl = tosUrl;
  }
  final int? isEmailVerify = jsonConvert.convert<int>(json['is_email_verify']);
  if (isEmailVerify != null) {
    guestCommConfigEntity.isEmailVerify = isEmailVerify;
  }
  final int? isInviteForce = jsonConvert.convert<int>(json['is_invite_force']);
  if (isInviteForce != null) {
    guestCommConfigEntity.isInviteForce = isInviteForce;
  }
  final int? emailWhitelistSuffix = jsonConvert.convert<int>(
      json['email_whitelist_suffix']);
  if (emailWhitelistSuffix != null) {
    guestCommConfigEntity.emailWhitelistSuffix = emailWhitelistSuffix;
  }
  final int? isRecaptcha = jsonConvert.convert<int>(json['is_recaptcha']);
  if (isRecaptcha != null) {
    guestCommConfigEntity.isRecaptcha = isRecaptcha;
  }
  final String? recaptchaSiteKey = jsonConvert.convert<String>(
      json['recaptcha_site_key']);
  if (recaptchaSiteKey != null) {
    guestCommConfigEntity.recaptchaSiteKey = recaptchaSiteKey;
  }
  final String? appDescription = jsonConvert.convert<String>(
      json['app_description']);
  if (appDescription != null) {
    guestCommConfigEntity.appDescription = appDescription;
  }
  final String? appUrl = jsonConvert.convert<String>(json['app_url']);
  if (appUrl != null) {
    guestCommConfigEntity.appUrl = appUrl;
  }
  final dynamic logo = json['logo'];
  if (logo != null) {
    guestCommConfigEntity.logo = logo;
  }
  return guestCommConfigEntity;
}

Map<String, dynamic> $GuestCommConfigEntityToJson(
    GuestCommConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tos_url'] = entity.tosUrl;
  data['is_email_verify'] = entity.isEmailVerify;
  data['is_invite_force'] = entity.isInviteForce;
  data['email_whitelist_suffix'] = entity.emailWhitelistSuffix;
  data['is_recaptcha'] = entity.isRecaptcha;
  data['recaptcha_site_key'] = entity.recaptchaSiteKey;
  data['app_description'] = entity.appDescription;
  data['app_url'] = entity.appUrl;
  data['logo'] = entity.logo;
  return data;
}

extension GuestCommConfigEntityExtension on GuestCommConfigEntity {
  GuestCommConfigEntity copyWith({
    dynamic tosUrl,
    int? isEmailVerify,
    int? isInviteForce,
    int? emailWhitelistSuffix,
    int? isRecaptcha,
    String? recaptchaSiteKey,
    String? appDescription,
    String? appUrl,
    dynamic logo,
  }) {
    return GuestCommConfigEntity()
      ..tosUrl = tosUrl ?? this.tosUrl
      ..isEmailVerify = isEmailVerify ?? this.isEmailVerify
      ..isInviteForce = isInviteForce ?? this.isInviteForce
      ..emailWhitelistSuffix = emailWhitelistSuffix ?? this.emailWhitelistSuffix
      ..isRecaptcha = isRecaptcha ?? this.isRecaptcha
      ..recaptchaSiteKey = recaptchaSiteKey ?? this.recaptchaSiteKey
      ..appDescription = appDescription ?? this.appDescription
      ..appUrl = appUrl ?? this.appUrl
      ..logo = logo ?? this.logo;
  }
}