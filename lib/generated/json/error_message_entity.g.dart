import 'base/json_convert_content.dart';
import '../../bean/error_message_entity.dart';

ErrorMessageEntity $ErrorMessageEntityFromJson(Map<String, dynamic> json) {
  final ErrorMessageEntity errorMessageEntity = ErrorMessageEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    errorMessageEntity.message = message;
  }
  final ErrorMessageErrors? errors = jsonConvert.convert<ErrorMessageErrors>(
      json['errors']);
  if (errors != null) {
    errorMessageEntity.errors = errors;
  }
  return errorMessageEntity;
}

Map<String, dynamic> $ErrorMessageEntityToJson(ErrorMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  data['errors'] = entity.errors?.toJson();
  return data;
}

extension ErrorMessageEntityExtension on ErrorMessageEntity {
  ErrorMessageEntity copyWith({
    String? message,
    ErrorMessageErrors? errors,
  }) {
    return ErrorMessageEntity()
      ..message = message ?? this.message
      ..errors = errors ?? this.errors;
  }
}

ErrorMessageErrors $ErrorMessageErrorsFromJson(Map<String, dynamic> json) {
  final ErrorMessageErrors errorMessageErrors = ErrorMessageErrors();
  final List<String>? email = (json['email'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (email != null) {
    errorMessageErrors.email = email;
  }
  return errorMessageErrors;
}

Map<String, dynamic> $ErrorMessageErrorsToJson(ErrorMessageErrors entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = entity.email;
  return data;
}

extension ErrorMessageErrorsExtension on ErrorMessageErrors {
  ErrorMessageErrors copyWith({
    List<String>? email,
  }) {
    return ErrorMessageErrors()
      ..email = email ?? this.email;
  }
}