
import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/error_message_entity.g.dart';

@JsonSerializable()
class ErrorMessageEntity {
	String? message = '';
	ErrorMessageErrors? errors;

	ErrorMessageEntity();

	factory ErrorMessageEntity.fromJson(Map<String, dynamic> json) => $ErrorMessageEntityFromJson(json);

	Map<String, dynamic> toJson() => $ErrorMessageEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ErrorMessageErrors {
	List<String>? email = [];

	ErrorMessageErrors();

	factory ErrorMessageErrors.fromJson(Map<String, dynamic> json) => $ErrorMessageErrorsFromJson(json);

	Map<String, dynamic> toJson() => $ErrorMessageErrorsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}