import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/data/datasources/auth_data_source.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDataSource authDataSource;

  AuthBloc(this.authDataSource) : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<ChangePasswordRequested>(_onChangePasswordRequested);
  }

  Future<void> _onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final authModel = await authDataSource.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(authModel));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authDataSource.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onForgotPasswordRequested(
      ForgotPasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authDataSource.forgotPassword(email: event.email);
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onChangePasswordRequested(
      ChangePasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authDataSource.changePassword(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
