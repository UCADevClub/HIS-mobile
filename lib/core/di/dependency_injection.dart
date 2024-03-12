import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:his_mobile/core/network/network_info.dart';
import 'package:his_mobile/core/routes/app_router.dart';
import 'package:his_mobile/core/routes/auth_provider.dart';
import 'package:his_mobile/core/routes/guards/auth_guard.dart';
import 'package:his_mobile/data/datasources/auth_data_source.dart';
import 'package:his_mobile/data/repositories/auth_repository_impl.dart';
import 'package:his_mobile/data/services/auth_service.dart';
import 'package:his_mobile/domain/repositories/auth_repository.dart';
import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final GetIt sl = GetIt.instance;

Future<void> injectAllDependencies() async {
  sl.registerSingleton<String>(
    "http://5.59.233.199:1337/",
    instanceName: 'baseUrl',
  );

  injectDio();
  injectUseCases();
  injectBloc();
  injectRepositories();
  injectCore();
  injectExternal();
}

void injectDio({BaseOptions? dioOptions}) {
  var options = dioOptions ??
      BaseOptions(
        baseUrl: sl.get<String>(instanceName: 'baseUrl'),
      );

  final dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      return handler.next(options);
    },
  ));

  sl.registerSingleton<Dio>(Dio(options));
}

void injectBloc() {
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(sl()),
  );
}

void injectUseCases() {
  sl.registerLazySingleton(
    () => SignInUseCase(
      sl(),
    ),
  );
}

void injectRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      sl(),
    ),
  );
}

void injectCore() {
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

void injectExternal() {
  sl.registerLazySingleton(
    () => AuthService(
      sl<Dio>(),
    ),
  );

  sl.registerLazySingleton(
    () => AuthGuard(sl()),
  );

  sl.registerLazySingleton(
    () => AuthProvider(),
  );

  sl.registerLazySingleton(
    () => AppRouter(),
  );
}
