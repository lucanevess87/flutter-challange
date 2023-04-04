import 'package:json_annotation/json_annotation.dart';
part "access_token_model.g.dart";

@JsonSerializable()
class AccessTokenModel {
  final String accessToken;

  AccessTokenModel(
    this.accessToken,
  );

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);
}
