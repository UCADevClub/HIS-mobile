import 'package:flutter/material.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/presentation/application/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectAllDependencies();

  runApp(
    const HisMobile(),
  );
}
