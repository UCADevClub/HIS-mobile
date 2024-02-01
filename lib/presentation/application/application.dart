import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/core/routes/app_router.dart';
import 'package:his_mobile/core/styles/theme/app_theme.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/bloc/patient_info_bloc/patient_info_bloc.dart';

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
        BlocProvider<PatientInfoBloc>(
          create: (BuildContext context) => PatientInfoBloc(),
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
