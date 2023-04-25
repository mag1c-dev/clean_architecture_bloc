part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  AuthenticationAuthenticated(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthenticationUnAuthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
