import 'package:clean_architecture_bloc/feature/domain/entities/user.dart';
import 'package:fresh_dio/fresh_dio.dart';

abstract class UserRepository {
  Stream<AuthenticationStatus> get authenticationStatus;

  Future<User> get user;

  Future<void> login({
    required String username,
    required String password,
  });

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<void> logout();

}
