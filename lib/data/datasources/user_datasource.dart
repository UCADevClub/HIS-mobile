import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/data/datasources/locally/user_data.dart';
import 'package:his_mobile/data/datasources/remote/user_service.dart';
import 'package:his_mobile/data/models/user_models/user_model.dart';

abstract class UserDataSource {
  Future<User> getUserDetails();

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

class UserDataSourceImpl implements UserDataSource {
  final UserService userDetailsService;

  UserDataSourceImpl(this.userDetailsService);

  @override
  Future<User> getUserDetails() async {
    try {
      final userData = sl<UserData>().getUser()!;
      final response = await userDetailsService.getUserDetails(
        user_id: userData.id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
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
  }) async {
    try {
      final response = await userDetailsService.updateUserDetails(
        email: email,
        phoneNumber: phoneNumber,
        country: country,
        region: region,
        city: city,
        street: street,
        house: house,
        postalCode: postalCode,
        apartment: apartment,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
