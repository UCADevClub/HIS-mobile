import 'package:auto_route/auto_route.dart';
import 'package:his_mobile/core/di/dependency_injection.dart';
import 'package:his_mobile/core/routes/guards/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/auth",
          page: AuthRoute.page,
          guards: [sl<AuthGuard>()],
          children: [
            AutoRoute(
              path: "home",
              page: HomeRoute.page,
            ),
          ],
          initial: true,
        ),
        AutoRoute(path: "/home", page: HomeRoute.page),
        AutoRoute(path: "/drawer", page: AppDrawer.page),
      ];
}
