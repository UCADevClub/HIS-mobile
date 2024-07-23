import 'package:his_mobile/data/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final SharedPreferences sharedPreferences;

  UserData(this.sharedPreferences);

  Future<void> saveUser(AuthModel user) async {
    await sharedPreferences.setString('token', user.token);
    await sharedPreferences.setInt('id', user.id);
    await sharedPreferences.setString('email', user.email);
    await sharedPreferences.setString('first_name', user.first_name);
    await sharedPreferences.setString('last_name', user.last_name);
    await sharedPreferences.setString('middle_name', user.middle_name);
  }

  AuthModel? getUser() {
    final token = sharedPreferences.getString('token');
    final id = sharedPreferences.getInt('id');
    final email = sharedPreferences.getString('email');
    final firstName = sharedPreferences.getString('first_name');
    final lastName = sharedPreferences.getString('last_name');
    final middleName = sharedPreferences.getString('middle_name');

    if (token != null &&
        id != null &&
        email != null &&
        firstName != null &&
        lastName != null &&
        middleName != null) {
      return AuthModel(
        token: token,
        id: id,
        email: email,
        first_name: firstName,
        last_name: lastName,
        middle_name: middleName,
      );
    }
    return null;
  }

  Future<void> clearUser() async {
    await sharedPreferences.remove('token');
    await sharedPreferences.remove('id');
    await sharedPreferences.remove('email');
    await sharedPreferences.remove('first_name');
    await sharedPreferences.remove('last_name');
    await sharedPreferences.remove('middle_name');
  }
}
