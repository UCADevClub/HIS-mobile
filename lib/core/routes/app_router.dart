import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
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
        ),
        AutoRoute(
          path: "/drawer",
          page: AppDrawer.page,
        ),
        AutoRoute(
          path: "/change-password",
          page: ChangePasswordRoute.page,
        )
      ];
}
