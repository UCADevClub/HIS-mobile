import 'package:dio/dio.dart';
import 'package:his_mobile/data/models/user_models/user_model.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @GET('patient/patient-detail/{user_id}')
  Future<User> getUserDetails({
    @Path('user_id') required int user_id,
  });

  @PATCH('patient/patient-detail/{inn}/')
  Future<String> updateUserDetails({
    @Field('email') required String email,
    @Field('phone_number') required String phoneNumber,
    @Field('address') required String country,
    @Field('city') required String region,
    @Field('state') required String city,
    @Field('zip') required String street,
    @Field('house') required String house,
    @Field('postal_code') required String postalCode,
    @Field('apartment') String? apartment,
  });
}
