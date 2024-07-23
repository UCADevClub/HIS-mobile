import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:his_mobile/core/constants/constants.dart';
import 'package:his_mobile/core/network/network_info.dart';
import 'package:his_mobile/core/routes/app_router.dart';
import 'package:his_mobile/core/routes/auth_provider.dart';
import 'package:his_mobile/core/routes/guards/auth_guard.dart';
import 'package:his_mobile/data/datasources/auth_datasource.dart';
import 'package:his_mobile/data/datasources/locally/user_data.dart';
import 'package:his_mobile/data/datasources/remote/auth_service.dart';
import 'package:his_mobile/data/datasources/remote/user_service.dart';
import 'package:his_mobile/data/datasources/user_datasource.dart';
import 'package:his_mobile/data/repositories/auth_repository_impl.dart';
import 'package:his_mobile/domain/repositories/auth_repository.dart';
import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> injectAllDependencies() async {
  sl.registerSingleton<String>(
    Constants.baseUrl,
    instanceName: 'baseUrl',
  );

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  injectDio();
  injectUseCases();
  injectBloc();
  injectRepositories();
  injectCore();
  injectServices();
  injectExternal();
}

void injectDio({BaseOptions? dioOptions}) {
  var options = dioOptions ??
      BaseOptions(
        baseUrl: sl.get<String>(instanceName: 'baseUrl'),
      );

  final dio = Dio(options);

  // dio.interceptors.add(InterceptorsWrapper(
  //   onRequest: (options, handler) {
  //     options.headers['Authorization'] =
  //         'Token ${sl<UserData>().getUser()?.token}';
  //     return handler.next(options);
  //   },
  // ));

  sl.registerSingleton<Dio>(Dio(options));
}

void injectBloc() {
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(sl()),
  );

  sl.registerLazySingleton<UserInfoBloc>(
    () => UserInfoBloc(sl()),
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
    () => AuthDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(sl()),
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

void injectServices() {
  sl.registerLazySingleton<UserData>(() => UserData(sl()));

  sl.registerLazySingleton<AuthService>(
    () => AuthService(
      sl<Dio>(),
    ),
  );

  sl.registerLazySingleton<UserService>(
    () => UserService(
      sl<Dio>(),
    ),
  );
}

void injectExternal() {
  sl.registerLazySingleton<AuthProvider>(
    () => AuthProvider(),
  );

  sl.registerLazySingleton<AuthGuard>(
    () => AuthGuard(
      sl<AuthProvider>(),
    ),
  );

  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(
      sl<AuthGuard>(),
    ),
  );
}
