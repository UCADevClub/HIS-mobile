import 'package:his_mobile/data/services/user_service.dart';

abstract class UserDataSource {
  Future<dynamic> getUserDetails();

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
  Future<dynamic> getUserDetails() async {
    try {
      final response = await userDetailsService.getUserDetails(inn: '1');
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
