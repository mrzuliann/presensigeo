import 'package:json_annotation/json_annotation.dart';

part 'global_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GlobalResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  GlobalResponse({this.success, this.message});

  factory GlobalResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalResponseFromJson(json);
}
