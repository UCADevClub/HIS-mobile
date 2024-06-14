import 'package:dio/dio.dart';
import 'package:his_mobile/data/models/auth_model.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('user_authentication/login')
  Future<AuthModel> signInWithEmailAndPassword({
    @Field('email') required String email,
    @Field('password') required String password,
  });

  @POST('user_authentication/auth/token/logout/')
  Future<String> logout();

  @POST('user_authentication/auth/users/reset_password/')
  Future<String> forgotPassword({
    @Field('email') required String email,
  });

  @POST('user_authentication/auth/users/set_password/')
  Future<String> changePassword({
    @Field('current_password') required String currentPassword,
    @Field('new_password') required String newPassword,
  });
}
