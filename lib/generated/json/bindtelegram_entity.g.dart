

import '../../bean/bindtelegram_entity.dart';
import 'base/json_convert_content.dart';

BindtelegramEntity $BindtelegramEntityFromJson(Map<String, dynamic> json) {
  final BindtelegramEntity bindtelegramEntity = BindtelegramEntity();
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    bindtelegramEntity.username = username;
  }
  final String? bind = jsonConvert.convert<String>(json['bind']);
  if (bind != null) {
    bindtelegramEntity.bind = bind;
  }
  return bindtelegramEntity;
}

Map<String, dynamic> $BindtelegramEntityToJson(BindtelegramEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['username'] = entity.username;
  data['bind'] = entity.bind;
  return data;
}

extension BindtelegramEntityExtension on BindtelegramEntity {
  BindtelegramEntity copyWith({
    String? username,
    String? bind,
  }) {
    return BindtelegramEntity()
      ..username = username ?? this.username
      ..bind = bind ?? this.bind;
  }
}