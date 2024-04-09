import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';

class AuthProvider extends ChangeNotifier {
  AuthState _state = const AuthState(status: AuthStatus.initial);
  StreamSubscription? _authBlocSubscription;

  AuthProvider() {
    _initialize();
  }

  AuthState get state => _state;

  bool get isAuthenticated => _state.status == AuthStatus.success;

  void _initialize() {
    final authBloc = sl<AuthBloc>();
    _authBlocSubscription = authBloc.stream.listen((newState) {
      _emit(newState);
    });

    _checkAuthorization();
  }

  void _checkAuthorization() {}

  void _emit(AuthState newState) {
    if (_state != newState) {
      _state = newState;
      notifyListeners();
    }
  }

  Future<void> login(SignInParams signInParams) async {
    sl<AuthBloc>().add(
      LoginRequested(signInParams),
    );
  }

  void logout() {
    sl<AuthBloc>().add(LogoutRequested());
  }

  @override
  void dispose() {
    _authBlocSubscription?.cancel();
    super.dispose();
  }
}
