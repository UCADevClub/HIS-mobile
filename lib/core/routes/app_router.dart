import 'package:auto_route/auto_route.dart';
import 'package:his_mobile/core/routes/guards/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthGuard authGuard;

  AppRouter(this.authGuard);

  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/auth",
          page: AuthRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: "/home",
          page: HomeRoute.page,
          // initial: true,
        ),
        AutoRoute(
          path: "/drawer",
          page: AppDrawer.page,
        ),
        AutoRoute(
          path: "/profile",
          page: ProfileRoute.page,
        ),
        AutoRoute(
          path: "/change-password",
          page: ChangePasswordRoute.page,
        ),
        AutoRoute(
          path: "/medical-data",
          page: MedicalDataRoute.page,
        ),
        AutoRoute(
          path: "/settings",
          page: SettingsRoute.page,
        ),
      ];
}
