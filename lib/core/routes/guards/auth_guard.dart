import 'package:auto_route/auto_route.dart';
import 'package:his_mobile/core/routes/app_router.gr.dart';
import 'package:his_mobile/core/routes/auth_provider.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthProvider authProvider;

  AuthGuard(this.authProvider);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    var currentRoute = router.current.name;

    final isAuthenticated = authProvider.state.status == AuthStatus.success;

    print('AuthGuard: isAuthenticated: $isAuthenticated');

    if (isAuthenticated) {
      if (currentRoute != HomeRoute.name) {
        router.replaceAll([const HomeRoute()]);
      }
    }
    resolver.next(true);
  }
}
