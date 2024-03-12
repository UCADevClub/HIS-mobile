import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('user_authentication/auth/token/login/')
  Future<String> signInWithEmailAndPassword({
    @Field('email') required String email,
    @Field('password') required String password,
  });
}
