import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/core/theme/app_theme.dart';
import 'package:his_mobile/presentation/routes/app_router.dart';

class HisMobile extends StatelessWidget {
  const HisMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      title: 'His Mobile',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
