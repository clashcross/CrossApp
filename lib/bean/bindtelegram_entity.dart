
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/bindtelegram_entity.g.dart';

@JsonSerializable()
class BindtelegramEntity {
	String? username = '';
	String? bind = '';

	BindtelegramEntity();

	factory BindtelegramEntity.fromJson(Map<String, dynamic> json) => $BindtelegramEntityFromJson(json);

	Map<String, dynamic> toJson() => $BindtelegramEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}