// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';
import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.signInUseCase,
  ) : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final SignInUseCase signInUseCase;

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(status: AuthStatus.loading),
    );

    final failureOrSignIn = await signInUseCase(event.signInEntity);
    return failureOrSignIn.fold(
      (failure) => emit(
        AuthState(
          status: AuthStatus.failure,
          error: failure.message,
        ),
      ),
      (signIn) {
        emit(
          const AuthState(
            status: AuthStatus.success,
            error: '',
          ),
        );
      },
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(
        status: AuthStatus.unauthenticated,
      ),
    );
  }
}
