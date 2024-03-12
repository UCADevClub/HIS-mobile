import 'package:flutter/cupertino.dart';
import 'package:his_mobile/core/di/dependency_injection.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';

class AuthProvider extends ChangeNotifier {
  AuthState _state = const AuthState(status: AuthStatus.initial);

  AuthState get state => _state;

  final isAuthenticated = sl<AuthBloc>().state.status == AuthStatus.success;

  void _emit(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> login() async {
    _emit(
      const AuthState(
        status: AuthStatus.success,
      ),
    );
    notifyListeners();
  }

  void logout() {
    _emit(
      _state.copyWith(
        status: AuthStatus.unauthenticated,
      ),
    );
    notifyListeners();
  }
}
