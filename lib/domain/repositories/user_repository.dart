import 'package:dartz/dartz.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/data/models/user_models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserDetails();

  Future<dynamic> updateUserDetails({
    required String name,
    required String email,
    required String phoneNumber,
    required String country,
    required String region,
    required String city,
    required String street,
    required String house,
    required String postalCode,
    String? apartment,
  });
}
