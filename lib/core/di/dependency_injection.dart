import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void injectAllDependencies() {
  GetIt.I.registerSingleton<String>(
    "",
    instanceName: 'baseUrl',
  );

  injectDio();
}

void injectDio({BaseOptions? dioOptions}) {

  var options = dioOptions ??
      BaseOptions(
        baseUrl: GetIt.I.get<String>(instanceName: 'baseUrl'),
      );

  final dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      return handler.next(options);
    },
  ));

  GetIt.I.registerSingleton<Dio>(Dio(options));
}
