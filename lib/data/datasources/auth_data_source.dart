import 'package:his_mobile/data/services/auth_service.dart';

abstract class AuthDataSource {
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<dynamic> forgotPassword({
    required String email,
  });

  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<dynamic> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final AuthService authService;

  AuthDataSourceImpl(this.authService);

  @override
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.signInWithEmailAndPassword(
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
  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await authService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future logout() {
    try {
      final response = authService.logout();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
