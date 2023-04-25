import 'package:fresh_dio/fresh_dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenModel extends OAuth2Token {
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel({
    required super.accessToken,
    super.tokenType,
    super.refreshToken,
    super.expiresIn,
    super.scope,
  });
}
