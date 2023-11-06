
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/notice_entity.g.dart';

@JsonSerializable()
class NoticeEntity {
	late int id = 0;
	late String title = '';
	late String content = '';
	@JSONField(name: "show")
	late int xShow = 0;
	@JSONField(name: "img_url")
	dynamic imgUrl;
	dynamic tags;
	@JSONField(name: "created_at")
	late int createdAt = 0;
	@JSONField(name: "updated_at")
	late int updatedAt = 0;

	NoticeEntity();

	factory NoticeEntity.fromJson(Map<String, dynamic> json) => $NoticeEntityFromJson(json);

	Map<String, dynamic> toJson() => $NoticeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}