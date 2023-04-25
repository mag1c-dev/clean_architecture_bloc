// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String? ?? 'bearer',
      refreshToken: json['refreshToken'] as String?,
      expiresIn: json['expiresIn'] as int?,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'scope': instance.scope,
    };
