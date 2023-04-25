import 'package:clean_architecture_bloc/feature/data/data_sources/local/local_data_source.dart';
import 'package:clean_architecture_bloc/feature/domain/entities/user.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote/remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImpl({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;


  @override
  // TODO: implement authenticationStatus
  Stream<AuthenticationStatus> get authenticationStatus => throw UnimplementedError();

  @override
  Future<bool> changePassword({required String oldPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }


  @override
  Future<void> login({required String username, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Future<User> get user => throw UnimplementedError();


}
