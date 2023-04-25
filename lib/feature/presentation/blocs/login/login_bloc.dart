import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginUsecase loginUsecase})
      : _loginUsecase = loginUsecase,
        super(LoginState()) {
    // on<LoginUsernameChanged>(_onUsernameChanged);
    // on<LoginPasswordChanged>(_onPasswordChanged);
    // on<LoginSubmitted>(_onSubmitted);
    // on<LoginPasswordVisibleToggle>(_onLoginPasswordVisibleToggle);
  }

  final LoginUsecase _loginUsecase;
  //
  // void _onUsernameChanged(
  //   LoginUsernameChanged event,
  //   Emitter<LoginState> emit,
  // ) {
  //   final username = Username.dirty(event.username);
  //   emit(
  //     state.copyWith(
  //       username: username,
  //       status: Formz.validate([state.password, username]),
  //     ),
  //   );
  // }
  //
  // void _onPasswordChanged(
  //   LoginPasswordChanged event,
  //   Emitter<LoginState> emit,
  // ) {
  //   final password = Password.dirty(event.password);
  //   emit(
  //     state.copyWith(
  //       password: password,
  //       status: Formz.validate([password, state.username]),
  //     ),
  //   );
  // }
  //
  // Future<void> _onSubmitted(
  //   LoginSubmitted event,
  //   Emitter<LoginState> emit,
  // ) async {
  //   if (state.status.isValidated) {
  //     emit(state.copyWith(status: FormzStatus.submissionInProgress));
  //     try {
  //       await _loginUsecase.call(
  //         LoginParam(state.username.value, state.password.value),
  //       );
  //       emit(state.copyWith(status: FormzStatus.submissionSuccess));
  //     } catch (error) {
  //       var message = '';
  //
  //       if (error is DioError) {
  //         message = error.getDioMessage();
  //       }
  //
  //       emit(
  //         state.copyWith(
  //           status: FormzStatus.submissionFailure,
  //           errorMessage: message,
  //         ),
  //       );
  //     }
  //   }
  // }
  //
  // FutureOr<void> _onLoginPasswordVisibleToggle(
  //     LoginPasswordVisibleToggle event, Emitter<LoginState> emit) {
  //   emit(
  //     state.copyWith(showPassword: !state.showPassword),
  //   );
  // }
}
