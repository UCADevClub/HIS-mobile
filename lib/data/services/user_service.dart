import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('patient/patient-detail/{inn}/')
  Future<String> signInWithEmailAndPassword({
    @Path('inn') required String inn,
  });
}
