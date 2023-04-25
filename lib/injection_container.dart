import 'package:fresh_dio/fresh_dio.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/cache.dart';
import 'feature/data/data_sources/local/impl/local_data_source.dart';
import 'feature/data/data_sources/local/local_data_source.dart';
import 'feature/data/data_sources/remote/impl/remote_data_source_impl.dart';
import 'feature/data/data_sources/remote/remote_data_source.dart';
import 'feature/data/repositories/user_repository.dart';
import 'feature/domain/repositories/user_repository.dart';
import 'feature/domain/usecases/get_login_status_usecase.dart';
import 'feature/domain/usecases/get_login_user_usecase.dart';
import 'feature/domain/usecases/login_usecase.dart';
import 'feature/domain/usecases/logout_usecase.dart';
import 'feature/presentation/blocs/authentication/authentication_bloc.dart';

final GetIt di = GetIt.instance;

Future<void> initDependency() async {
  di
    //blocs
    ..registerFactory(
      () => AuthenticationBloc(),
    )

    //Usecases
    ..registerLazySingleton(() => LoginUsecase(userRepository: di()))
    ..registerLazySingleton(() => LogoutUsecase(userRepository: di()))
    ..registerLazySingleton(() => GetLoginStatusUsecase(userRepository: di()))
    ..registerLazySingleton(() => GetLoginUserUsecase(userRepository: di()))

    //repositories
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: di(), localDataSource: di()),
    )

    //datasource
    ..registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(di()))
    ..registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(httpClient: di()),
    )

    //core
    ..registerLazySingleton(Cache.new)
    ..registerLazySingleton(Dio.new);
}
