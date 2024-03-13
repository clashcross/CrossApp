

import '../../bean/corpus_entity.dart';
import 'base/json_convert_content.dart';

CorpusEntity $CorpusEntityFromJson(Map<String, dynamic> json) {
  final CorpusEntity corpusEntity = CorpusEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    corpusEntity.id = id;
  }
  final String? siteurl = jsonConvert.convert<String>(json['siteurl']);
  if (siteurl != null) {
    corpusEntity.siteurl = siteurl;
  }
  final String? sitename = jsonConvert.convert<String>(json['sitename']);
  if (sitename != null) {
    corpusEntity.sitename = sitename;
  }
  final dynamic description = json['description'];
  if (description != null) {
    corpusEntity.description = description;
  }
  final int? isRecommend = jsonConvert.convert<int>(json['is_recommend']);
  if (isRecommend != null) {
    corpusEntity.isRecommend = isRecommend;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    corpusEntity.views = views;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    corpusEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    corpusEntity.updatedAt = updatedAt;
  }
  return corpusEntity;
}

Map<String, dynamic> $CorpusEntityToJson(CorpusEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['siteurl'] = entity.siteurl;
  data['sitename'] = entity.sitename;
  data['description'] = entity.description;
  data['is_recommend'] = entity.isRecommend;
  data['views'] = entity.views;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension CorpusEntityExtension on CorpusEntity {
  CorpusEntity copyWith({
    int? id,
    String? siteurl,
    String? sitename,
    dynamic description,
    int? isRecommend,
    int? views,
    int? createdAt,
    int? updatedAt,
  }) {
    return CorpusEntity()
      ..id = id ?? this.id
      ..siteurl = siteurl ?? this.siteurl
      ..sitename = sitename ?? this.sitename
      ..description = description ?? this.description
      ..isRecommend = isRecommend ?? this.isRecommend
      ..views = views ?? this.views
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}