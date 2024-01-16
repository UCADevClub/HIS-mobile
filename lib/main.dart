import 'package:flutter/material.dart';
import 'package:his_mobile/core/di/dependency_injection.dart';
import 'package:his_mobile/presentation/application/application.dart';

void main() {
  injectAllDependencies();

  runApp(const HisMobile());
}
