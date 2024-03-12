import 'package:his_mobile/data/models/sign_in_model.dart';
import 'package:his_mobile/data/services/auth_service.dart';

abstract class AuthDataSource {
  Future<String> signInWithEmailAndPassword(SignInModel signInModel);

  Future<dynamic> forgotPassword({
    required String email,
  });

  Future<dynamic> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final AuthService authService;

  AuthDataSourceImpl(this.authService);

  @override
  Future<String> signInWithEmailAndPassword(SignInModel signInModel) {
    try {
      final response = authService.signInWithEmailAndPassword(
        email: signInModel.email,
        password: signInModel.password,
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
