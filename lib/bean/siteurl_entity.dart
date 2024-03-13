
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/siteurl_entity.g.dart';

@JsonSerializable()
class SiteurlEntity {
	String? apiurl = '';
	String? siteurl = '';

	SiteurlEntity();

	factory SiteurlEntity.fromJson(Map<String, dynamic> json) => $SiteurlEntityFromJson(json);

	Map<String, dynamic> toJson() => $SiteurlEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}