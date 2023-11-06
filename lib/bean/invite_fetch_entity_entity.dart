
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/invite_fetch_entity_entity.g.dart';

@JsonSerializable()
class InviteFetchEntityEntity {
	late List<InviteFetchEntityCodes> codes;
	late List<int> stat;

	InviteFetchEntityEntity();

	factory InviteFetchEntityEntity.fromJson(Map<String, dynamic> json) => $InviteFetchEntityEntityFromJson(json);

	Map<String, dynamic> toJson() => $InviteFetchEntityEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InviteFetchEntityCodes {
	late int id;
	@JSONField(name: "user_id")
	late int userId;
	late String code;
	late int status;
	late int pv;
	@JSONField(name: "created_at")
	late int createdAt;
	@JSONField(name: "updated_at")
	late int updatedAt;

	InviteFetchEntityCodes();

	factory InviteFetchEntityCodes.fromJson(Map<String, dynamic> json) => $InviteFetchEntityCodesFromJson(json);

	Map<String, dynamic> toJson() => $InviteFetchEntityCodesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}