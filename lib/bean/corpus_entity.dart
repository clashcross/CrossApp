
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/corpus_entity.g.dart';

@JsonSerializable()
class CorpusEntity {
	late int id = 0;
	late String siteurl = '';
	late String sitename = '';
	dynamic description;
	@JSONField(name: "is_recommend")
	late int isRecommend = 0;
	late int views = 0;
	@JSONField(name: "created_at")
	late int createdAt = 0;
	@JSONField(name: "updated_at")
	late int updatedAt = 0;

	CorpusEntity();

	factory CorpusEntity.fromJson(Map<String, dynamic> json) => $CorpusEntityFromJson(json);

	Map<String, dynamic> toJson() => $CorpusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}