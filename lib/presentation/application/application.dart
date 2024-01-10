import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/core/theme/app_theme.dart';

class HisMobile extends StatelessWidget {
  const HisMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'His Mobile',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
