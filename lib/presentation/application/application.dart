import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:his_mobile/core/di/dependency_injection.dart';
import 'package:his_mobile/core/routes/app_router.dart';
import 'package:his_mobile/core/styles/theme/app_theme.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/bloc/patient_info_bloc/patient_info_bloc.dart';

class HisMobile extends StatefulWidget {
  const HisMobile({super.key});

  @override
  State<HisMobile> createState() => _HisMobileState();

  //TODO: update this
  static _HisMobileState of(BuildContext context) =>
      context.findAncestorStateOfType<_HisMobileState>()!;
}

class _HisMobileState extends State<HisMobile> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => sl<AuthBloc>(),
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
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: _locale,
      ),
    );
  }
}
