
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/server_entity.g.dart';

@JsonSerializable()
class ServerEntity {
	late int id;
	@JSONField(name: "group_id")
	late List<String> groupId;
	@JSONField(name: "route_id")
	dynamic routeId;
	@JSONField(name: "parent_id")
	dynamic parentId;
	late List<String> tags;
	late String name;
	late String rate;
	late String host;
	late int port;
	@JSONField(name: "server_port")
	late int serverPort;
	@JSONField(name: "allow_insecure")
	late int allowInsecure;
	@JSONField(name: "server_name")
	dynamic serverName;
	@JSONField(name: "show")
	late int xShow;
	late int sort;
	@JSONField(name: "created_at")
	late int createdAt;
	@JSONField(name: "updated_at")
	late int updatedAt;
	late String type;
	@JSONField(name: "last_check_at")
	late String lastCheckAt;
	@JSONField(name: "is_online")
	late int isOnline;
	@JSONField(name: "cache_key")
	late String cacheKey;

	ServerEntity();

	factory ServerEntity.fromJson(Map<String, dynamic> json) => $ServerEntityFromJson(json);

	Map<String, dynamic> toJson() => $ServerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}