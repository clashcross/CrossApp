import 'base/json_convert_content.dart';
import '../../bean/notice_entity.dart';

NoticeEntity $NoticeEntityFromJson(Map<String, dynamic> json) {
  final NoticeEntity noticeEntity = NoticeEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    noticeEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    noticeEntity.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    noticeEntity.content = content;
  }
  final int? xShow = jsonConvert.convert<int>(json['show']);
  if (xShow != null) {
    noticeEntity.xShow = xShow;
  }
  final dynamic imgUrl = json['img_url'];
  if (imgUrl != null) {
    noticeEntity.imgUrl = imgUrl;
  }
  final dynamic tags = json['tags'];
  if (tags != null) {
    noticeEntity.tags = tags;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    noticeEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    noticeEntity.updatedAt = updatedAt;
  }
  return noticeEntity;
}

Map<String, dynamic> $NoticeEntityToJson(NoticeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['show'] = entity.xShow;
  data['img_url'] = entity.imgUrl;
  data['tags'] = entity.tags;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension NoticeEntityExtension on NoticeEntity {
  NoticeEntity copyWith({
    int? id,
    String? title,
    String? content,
    int? xShow,
    dynamic imgUrl,
    dynamic tags,
    int? createdAt,
    int? updatedAt,
  }) {
    return NoticeEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..content = content ?? this.content
      ..xShow = xShow ?? this.xShow
      ..imgUrl = imgUrl ?? this.imgUrl
      ..tags = tags ?? this.tags
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}