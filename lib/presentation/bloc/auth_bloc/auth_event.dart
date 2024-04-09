part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final SignInParams signInParams;

  LoginRequested(this.signInParams);
}

class LogoutRequested extends AuthEvent {}
