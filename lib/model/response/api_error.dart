import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError {
  @JsonKey(name: "status_code")
  int? statusCode;
  bool? status;
  @JsonKey(name: "status_message")
  String? statusMessage;

  ApiError({this.statusCode, this.status, this.statusMessage});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
