import 'base/json_convert_content.dart';
import '../../bean/invite_fetch_entity_entity.dart';

InviteFetchEntityEntity $InviteFetchEntityEntityFromJson(
    Map<String, dynamic> json) {
  final InviteFetchEntityEntity inviteFetchEntityEntity = InviteFetchEntityEntity();
  final List<InviteFetchEntityCodes>? codes = (json['codes'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<InviteFetchEntityCodes>(e) as InviteFetchEntityCodes)
      .toList();
  if (codes != null) {
    inviteFetchEntityEntity.codes = codes;
  }
  final List<int>? stat = (json['stat'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (stat != null) {
    inviteFetchEntityEntity.stat = stat;
  }
  return inviteFetchEntityEntity;
}

Map<String, dynamic> $InviteFetchEntityEntityToJson(
    InviteFetchEntityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['codes'] = entity.codes.map((v) => v.toJson()).toList();
  data['stat'] = entity.stat;
  return data;
}

extension InviteFetchEntityEntityExtension on InviteFetchEntityEntity {
  InviteFetchEntityEntity copyWith({
    List<InviteFetchEntityCodes>? codes,
    List<int>? stat,
  }) {
    return InviteFetchEntityEntity()
      ..codes = codes ?? this.codes
      ..stat = stat ?? this.stat;
  }
}

InviteFetchEntityCodes $InviteFetchEntityCodesFromJson(
    Map<String, dynamic> json) {
  final InviteFetchEntityCodes inviteFetchEntityCodes = InviteFetchEntityCodes();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    inviteFetchEntityCodes.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    inviteFetchEntityCodes.userId = userId;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    inviteFetchEntityCodes.code = code;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    inviteFetchEntityCodes.status = status;
  }
  final int? pv = jsonConvert.convert<int>(json['pv']);
  if (pv != null) {
    inviteFetchEntityCodes.pv = pv;
  }
  final int? createdAt = jsonConvert.convert<int>(json['created_at']);
  if (createdAt != null) {
    inviteFetchEntityCodes.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
  if (updatedAt != null) {
    inviteFetchEntityCodes.updatedAt = updatedAt;
  }
  return inviteFetchEntityCodes;
}

Map<String, dynamic> $InviteFetchEntityCodesToJson(
    InviteFetchEntityCodes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['code'] = entity.code;
  data['status'] = entity.status;
  data['pv'] = entity.pv;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension InviteFetchEntityCodesExtension on InviteFetchEntityCodes {
  InviteFetchEntityCodes copyWith({
    int? id,
    int? userId,
    String? code,
    int? status,
    int? pv,
    int? createdAt,
    int? updatedAt,
  }) {
    return InviteFetchEntityCodes()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..code = code ?? this.code
      ..status = status ?? this.status
      ..pv = pv ?? this.pv
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}