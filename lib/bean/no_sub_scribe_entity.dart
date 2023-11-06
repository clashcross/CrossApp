
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/no_sub_scribe_entity.g.dart';

@JsonSerializable()
class NoSubScribeEntity {
	@JSONField(name: "plan_id")
	dynamic planId;
	late String token = '';
	@JSONField(name: "expired_at")
	late int expiredAt = 0;
	late int u = 0;
	late int d = 0;
	@JSONField(name: "transfer_enable")
	late int transferEnable = 0;
	late String email = '';
	late String uuid = '';
	@JSONField(name: "subscribe_url")
	late String subscribeUrl = '';
	dynamic plan;
	@JSONField(name: "reset_day")
	dynamic resetDay;

	NoSubScribeEntity();

	factory NoSubScribeEntity.fromJson(Map<String, dynamic> json) => $NoSubScribeEntityFromJson(json);

	Map<String, dynamic> toJson() => $NoSubScribeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}