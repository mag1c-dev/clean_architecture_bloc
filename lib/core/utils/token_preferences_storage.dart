import 'package:fresh_dio/fresh_dio.dart';

import '../../feature/data/models/token_model.dart';

class TokenPreferencesStorage implements TokenStorage<TokenModel> {
  TokenPreferencesStorage();

  static const tokenStoreKey = '__token_store_key__';

  @override
  Future<void> delete() async {}

  @override
  Future<TokenModel?> read() async {
    //Todo: Get token from SharePreferencesStorage
    return TokenModel(accessToken: '');
  }

  @override
  Future<void> write(TokenModel token) async {
    //Todo: Save token to SharePreferencesStorage
  }
}
