import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/get_login_status_usecase.dart';
import '../../../domain/usecases/get_login_user_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _authenticationStatusSubscription =
        _getLoginStatusUsecase.call(NoParam()).listen(
              (status) => add(AuthenticationStatusChanged(status)),
            );
  }

  final GetLoginStatusUsecase _getLoginStatusUsecase =
      di<GetLoginStatusUsecase>();
  final GetLoginUserUsecase _getLoginUserUsecase = di<GetLoginUserUsecase>();
  final LogoutUsecase _logoutUsecase = di<LogoutUsecase>();

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        {
          try {
            final user = await _getLoginUserUsecase.call(NoParam());
            return emit(AuthenticationAuthenticated(user));
          } catch (_) {
            await _logoutUsecase.call(NoParam());
          }
        }
        break;
      case AuthenticationStatus.unauthenticated:
        return emit(AuthenticationUnAuthenticated());
      case AuthenticationStatus.initial:
        return emit(AuthenticationInitial());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _logoutUsecase.call(NoParam());
  }
}
