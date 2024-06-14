import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOutRequested extends AuthEvent {}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  const ForgotPasswordRequested(this.email);

  @override
  List<Object> get props => [email];
}

class ChangePasswordRequested extends AuthEvent {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordRequested(this.currentPassword, this.newPassword);

  @override
  List<Object> get props => [currentPassword, newPassword];
}
