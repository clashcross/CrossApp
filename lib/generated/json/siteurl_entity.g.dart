import 'base/json_convert_content.dart';
import '../../bean/siteurl_entity.dart';

SiteurlEntity $SiteurlEntityFromJson(Map<String, dynamic> json) {
  final SiteurlEntity siteurlEntity = SiteurlEntity();
  final String? apiurl = jsonConvert.convert<String>(json['apiurl']);
  if (apiurl != null) {
    siteurlEntity.apiurl = apiurl;
  }
  final String? siteurl = jsonConvert.convert<String>(json['siteurl']);
  if (siteurl != null) {
    siteurlEntity.siteurl = siteurl;
  }
  return siteurlEntity;
}

Map<String, dynamic> $SiteurlEntityToJson(SiteurlEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['apiurl'] = entity.apiurl;
  data['siteurl'] = entity.siteurl;
  return data;
}

extension SiteurlEntityExtension on SiteurlEntity {
  SiteurlEntity copyWith({
    String? apiurl,
    String? siteurl,
  }) {
    return SiteurlEntity()
      ..apiurl = apiurl ?? this.apiurl
      ..siteurl = siteurl ?? this.siteurl;
  }
}