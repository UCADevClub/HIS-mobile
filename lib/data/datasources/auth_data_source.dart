import 'package:his_mobile/data/services/auth_service.dart';

abstract class AuthDataSource {
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<dynamic> forgotPassword({
    required String email,
  });

  Future<dynamic> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final AuthService authService;

  AuthDataSourceImpl(this.authService);

  @override
  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    try {
      final response = authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
