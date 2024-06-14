import 'package:auto_route/auto_route.dart';
import 'package:his_mobile/core/routes/app_router.gr.dart';
import 'package:his_mobile/core/routes/auth_provider.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthProvider authProvider;

  AuthGuard(this.authProvider);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authProvider.isAuthenticated) {
      resolver.resolveNext(false);
      resolver.redirect(
        const HomeRoute(),
      );
      return;
    }
    resolver.next(true);
  }
}
