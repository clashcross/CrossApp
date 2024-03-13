import 'base/json_convert_content.dart';
import '../../bean/server_entity.dart';

ServerEntity $ServerEntityFromJson(Map<String, dynamic> json) {
  final ServerEntity serverEntity = ServerEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    serverEntity.id = id;
  }
  final List<String>? groupId = (json['group_id'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (groupId != null) {
    serverEntity.groupId = groupId;
  }
  final dynamic routeId = json['route_id'];
  if (routeId != null) {
    serverEntity.routeId = routeId;
  }
  final dynamic parentId = json['parent_id'];
  if (parentId != null) {
    serverEntity.parentId = parentId;
  }
  final List<String>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (tags != null) {
    serverEntity.tags = tags;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    serverEntity.name = name;
  }
  final String? rate = jsonConvert.convert<String>(json['rate']);
  if (rate != null) {
    serverEntity.rate = rate;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    serverEntity.host = host;
  }
  final int? port = jsonConvert.convert<int>(json['port']);
  if (port != null) {
    serverEntity.port = port;
  }
  final int? serverPort = jsonConvert.convert<int>(json['server_port']);
  if (serverPort != null) {
    serverEntity.serverPort = serverPort;
  }
  final int? allowInsecure = jsonConvert.convert<int>(json['allow_insecure']);
  if (allowInsecure != null) {
    serverEntity.allowInsecure = allowInsecure;
  }
  final dynamic serverName = json['server_name'];
  if (serverName != null) {
    serverEntity.serverName = serverName;
  }
  final int? xShow = jsonConvert.convert<int>(json['show']);
  if (xShow != null) {
    serverEntity.xShow = xShow;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    serverEntity.sort = sort;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    serverEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    serverEntity.updatedAt = updatedAt;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    serverEntity.type = type;
  }
  final String? lastCheckAt = jsonConvert.convert<String>(
      json['last_check_at']);
  if (lastCheckAt != null) {
    serverEntity.lastCheckAt = lastCheckAt;
  }
  final int? isOnline = jsonConvert.convert<int>(json['is_online']);
  if (isOnline != null) {
    serverEntity.isOnline = isOnline;
  }
  final String? cacheKey = jsonConvert.convert<String>(json['cache_key']);
  if (cacheKey != null) {
    serverEntity.cacheKey = cacheKey;
  }
  return serverEntity;
}

Map<String, dynamic> $ServerEntityToJson(ServerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['group_id'] = entity.groupId;
  data['route_id'] = entity.routeId;
  data['parent_id'] = entity.parentId;
  data['tags'] = entity.tags;
  data['name'] = entity.name;
  data['rate'] = entity.rate;
  data['host'] = entity.host;
  data['port'] = entity.port;
  data['server_port'] = entity.serverPort;
  data['allow_insecure'] = entity.allowInsecure;
  data['server_name'] = entity.serverName;
  data['show'] = entity.xShow;
  data['sort'] = entity.sort;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['type'] = entity.type;
  data['last_check_at'] = entity.lastCheckAt;
  data['is_online'] = entity.isOnline;
  data['cache_key'] = entity.cacheKey;
  return data;
}

extension ServerEntityExtension on ServerEntity {
  ServerEntity copyWith({
    int? id,
    List<String>? groupId,
    dynamic routeId,
    dynamic parentId,
    List<String>? tags,
    String? name,
    String? rate,
    String? host,
    int? port,
    int? serverPort,
    int? allowInsecure,
    dynamic serverName,
    int? xShow,
    int? sort,
    int? createdAt,
    int? updatedAt,
    String? type,
    String? lastCheckAt,
    int? isOnline,
    String? cacheKey,
  }) {
    return ServerEntity()
      ..id = id ?? this.id
      ..groupId = groupId ?? this.groupId
      ..routeId = routeId ?? this.routeId
      ..parentId = parentId ?? this.parentId
      ..tags = tags ?? this.tags
      ..name = name ?? this.name
      ..rate = rate ?? this.rate
      ..host = host ?? this.host
      ..port = port ?? this.port
      ..serverPort = serverPort ?? this.serverPort
      ..allowInsecure = allowInsecure ?? this.allowInsecure
      ..serverName = serverName ?? this.serverName
      ..xShow = xShow ?? this.xShow
      ..sort = sort ?? this.sort
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..type = type ?? this.type
      ..lastCheckAt = lastCheckAt ?? this.lastCheckAt
      ..isOnline = isOnline ?? this.isOnline
      ..cacheKey = cacheKey ?? this.cacheKey;
  }
}