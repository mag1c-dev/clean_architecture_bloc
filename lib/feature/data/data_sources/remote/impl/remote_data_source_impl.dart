import 'dart:async';

import 'package:clean_architecture_bloc/config/base_url_config.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../../../../../core/utils/token_preferences_storage.dart';
import '../../../models/token_model.dart';
import '../../../models/user_model.dart';
import '../remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({Dio? httpClient, Dio? downloadClient})
      : _httpClient = ((httpClient ?? Dio())
          ..options.baseUrl = BaseUrlConfig().baseUrlProduction
          ..options.connectTimeout = 60000
          ..options.sendTimeout = 60000
          ..options.receiveTimeout = 60000
          ..interceptors.add(_fresh));

  final Dio _httpClient;

  static final _fresh = Fresh.oAuth2(
    tokenStorage: TokenPreferencesStorage(),
    refreshToken: (token, client) async {
      final result = await Dio().post<Map<String, dynamic>>(
        '${BaseUrlConfig().baseUrlProduction}oauth-service/oauth/token',
        data: {
          'refresh_token': token?.refreshToken,
          'grant_type': 'refresh_token'
        },
      );
      return TokenModel.fromJson(result.data!);
    },
    shouldRefresh: (response) {
      return response?.statusCode == 401;
    },
  );

  @override
  Stream<AuthenticationStatus> get authenticationStatus =>
      _fresh.authenticationStatus;

  @override
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final result = await _httpClient.post<Map<String, dynamic>>(
      'oauth-service/oauth/token',
      data: {
        'username': username,
        'password': password,
      },
    );
    final token = TokenModel.fromJson(result.data!);
    await _fresh.setToken(
      token,
    );
  }

  @override
  Future<void> logout() async {
    await _fresh.setToken(null);
  }

  @override
  Future<UserModel> getUserLogin() async {
    final result = await _httpClient.get<Map<String, dynamic>>(
      'oauth-service/user',
    );
    return UserModel.fromJson(result.data!);
  }

  @override
  Future<TokenModel> getToken() async {
    final token = await _fresh.token;
    return token! as TokenModel;
  }
}
