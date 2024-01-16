part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final AuthModel authModel;

  LoginRequested(this.authModel);
}

class LogoutRequested extends AuthEvent {}
