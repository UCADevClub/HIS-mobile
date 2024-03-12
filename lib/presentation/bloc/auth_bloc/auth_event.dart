part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final SignInEntity signInEntity;

  LoginRequested(this.signInEntity);
}

class LogoutRequested extends AuthEvent {}
