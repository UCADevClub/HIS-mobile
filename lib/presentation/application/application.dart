import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/presentation/core/theme/app_theme.dart';
import 'package:his_mobile/presentation/modules/auth_page/bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/routes/app_router.dart';

class HisMobile extends StatelessWidget {
  const HisMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'His Mobile',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
