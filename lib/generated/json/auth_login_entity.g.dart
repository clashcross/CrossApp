

import '../../bean/auth_login_entity.dart';
import 'base/json_convert_content.dart';

AuthLoginEntity $AuthLoginEntityFromJson(Map<String, dynamic> json) {
  final AuthLoginEntity authLoginEntity = AuthLoginEntity();
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    authLoginEntity.token = token;
  }
  final int? isAdmin = jsonConvert.convert<int>(json['is_admin']);
  if (isAdmin != null) {
    authLoginEntity.isAdmin = isAdmin;
  }
  final String? authData = jsonConvert.convert<String>(json['auth_data']);
  if (authData != null) {
    authLoginEntity.authData = authData;
  }
  return authLoginEntity;
}

Map<String, dynamic> $AuthLoginEntityToJson(AuthLoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token'] = entity.token;
  data['is_admin'] = entity.isAdmin;
  data['auth_data'] = entity.authData;
  return data;
}

extension AuthLoginEntityExtension on AuthLoginEntity {
  AuthLoginEntity copyWith({
    String? token,
    int? isAdmin,
    String? authData,
  }) {
    return AuthLoginEntity()
      ..token = token ?? this.token
      ..isAdmin = isAdmin ?? this.isAdmin
      ..authData = authData ?? this.authData;
  }
}