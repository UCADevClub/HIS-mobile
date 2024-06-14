import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // AuthState _state = AuthInitial();
  // StreamSubscription? _authBlocSubscription;
  bool _isAuthenticated = false;
  //
  // AuthProvider() {
  //   _initialize();
  // }
  //
  bool get isAuthenticated => _isAuthenticated;
  //
  // void _initialize() {
  //   final authBloc = sl<AuthBloc>();
  //   _authBlocSubscription = authBloc.stream.listen((newState) {
  //     _emit(newState);
  //   });
  //
  //   _checkAuthorization();
  // }
  //
  // void _checkAuthorization() {}
  //
  // void _emit(AuthState newState) {
  //   if (_state != newState) {
  //     _state = newState;
  //     if (newState.status == AuthStatus.success) _isAuthenticated = true;
  //     _isAuthenticated = false;
  //     notifyListeners();
  //   }
  // }
  //
  // Future<void> login(SignInParams signInParams) async {
  //   sl<AuthBloc>().add(
  //     LoginRequested(signInParams),
  //   );
  //   _isAuthenticated = true;
  // }
  //
  // void logout() {
  //   sl<AuthBloc>().add(LogoutRequested());
  //   _isAuthenticated = false;
  // }
  //
  // @override
  // void dispose() {
  //   _authBlocSubscription?.cancel();
  //   super.dispose();
  // }
}
