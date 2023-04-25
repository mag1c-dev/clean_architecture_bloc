import 'package:fresh_dio/fresh_dio.dart';

import '../../models/token_model.dart';
import '../../models/user_model.dart';

abstract class RemoteDataSource {
  Stream<AuthenticationStatus> get authenticationStatus;

  Future<void> login({
    required String username,
    required String password,
  });

  Future<void> logout();

  Future<UserModel> getUserLogin();

  Future<TokenModel> getToken();
}
