abstract class AuthRepository {
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<dynamic> forgotPassword({
    required String email,
  });

  Future<dynamic> logout();
}
