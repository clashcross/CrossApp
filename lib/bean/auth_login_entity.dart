
import 'dart:convert';

import '../generated/json/auth_login_entity.g.dart';
import '../generated/json/base/json_field.dart';

@JsonSerializable()
class AuthLoginEntity {
	late String token = '';
	@JSONField(name: "is_admin")
	late int isAdmin = 0;
	@JSONField(name: "auth_data")
	late String authData = '';

	AuthLoginEntity();

	factory AuthLoginEntity.fromJson(Map<String, dynamic> json) => $AuthLoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthLoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}