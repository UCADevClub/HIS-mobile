import 'package:flutter/material.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/presentation/application/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? languageCode = sharedPreferences.getString('languageCode');

  await injectAllDependencies();

  runApp(
    HisMobile(
      initialLanguageCode: languageCode ?? 'ru',
    ),
  );
}
