
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/guest_comm_config_entity.g.dart';

@JsonSerializable()
class GuestCommConfigEntity {
	@JSONField(name: "tos_url")
	dynamic tosUrl;
	@JSONField(name: "is_email_verify")
	late int isEmailVerify = 0;
	@JSONField(name: "is_invite_force")
	late int isInviteForce = 0;
	@JSONField(name: "email_whitelist_suffix")
	late int emailWhitelistSuffix = 0;
	@JSONField(name: "is_recaptcha")
	late int isRecaptcha = 0;
	@JSONField(name: "recaptcha_site_key")
	late String recaptchaSiteKey = '';
	@JSONField(name: "app_description")
	late String appDescription = '';
	@JSONField(name: "app_url")
	late String appUrl = '';
	dynamic logo;

	GuestCommConfigEntity();

	factory GuestCommConfigEntity.fromJson(Map<String, dynamic> json) => $GuestCommConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $GuestCommConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}