import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/core/routes/app_router.dart';
import 'package:his_mobile/core/routes/auth_provider.dart';
import 'package:his_mobile/core/styles/theme/app_theme.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';

class HisMobile extends StatefulWidget {
  const HisMobile({
    super.key,
    required this.initialLanguageCode,
  });

  final String initialLanguageCode;

  @override
  State<HisMobile> createState() => _HisMobileState();

  //TODO: update this
  static _HisMobileState of(BuildContext context) =>
      context.findAncestorStateOfType<_HisMobileState>()!;
}

class _HisMobileState extends State<HisMobile> {
  final authProvider = sl<AuthProvider>();
  final appRouter = sl<AppRouter>();

  Locale _locale = const Locale('ru', 'RU');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  initState() {
    _locale = Locale(widget.initialLanguageCode, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => sl<AuthBloc>(),
        ),
        BlocProvider<UserInfoBloc>(
          create: (BuildContext context) => sl<UserInfoBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'His Mobile',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // route stack will be re-evaluated when authProvider changes
        routerConfig: appRouter.config(
          reevaluateListenable: authProvider,
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: _locale,
        builder: EasyLoading.init(),
      ),
    );
  }
}
