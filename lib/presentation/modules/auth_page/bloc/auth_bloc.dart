import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:his_mobile/domain/auth_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.initial));

    try {
      // Authentication Logic
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(
      const AuthState(status: AuthStatus.unauthenticated),
    );
  }
}
