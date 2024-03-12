import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:his_mobile/core/di/dependency_injection.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/core/network/network_info.dart';
import 'package:his_mobile/core/routes/auth_provider.dart';
import 'package:his_mobile/data/datasources/auth_data_source.dart';
import 'package:his_mobile/data/models/sign_in_model.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';
import 'package:his_mobile/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String email,
  }) async {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    SignInEntity signInEntity,
  ) async {
    final AuthProvider authProvider = sl.get<AuthProvider>();
    if (await networkInfo.isConnected) {
      try {
        final signInModel = SignInModel(
          email: signInEntity.email,
          password: signInEntity.password,
        );
        final token = await authDataSource.signInWithEmailAndPassword(
          signInModel,
        );

        sl.get<Dio>().options.headers.addAll({
          'token': token,
        });

        authProvider.login();

        return Right(token);
      } catch (e) {
        rethrow;
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
