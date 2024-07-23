import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/core/error/auth_error.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/core/network/network_info.dart';
import 'package:his_mobile/data/datasources/auth_datasource.dart';
import 'package:his_mobile/data/models/auth_model.dart';
import 'package:his_mobile/domain/repositories/auth_repository.dart';
import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String email,
  }) async {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = await authDataSource.logout();
      return Right(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthError, AuthModel>> signInWithEmailAndPassword(
    SignInParams signInParams,
  ) async {
    final networkConnection = await _checkNetworkConnection();
    return networkConnection.fold(
      (error) => Left(error),
      (_) => _attemptSignIn(signInParams),
    );
  }

  Future<Either<AuthError, Unit>> _checkNetworkConnection() async {
    if (await networkInfo.isConnected) {
      return const Right(unit);
    } else {
      return Left(AuthError('No internet connection'));
    }
  }

  Future<Either<AuthError, AuthModel>> _attemptSignIn(
      SignInParams signInParams) async {
    try {
      final response = await authDataSource.signInWithEmailAndPassword(
        email: signInParams.email,
        password: signInParams.password,
      );

      // Add token to header
      sl.get<Dio>().options.headers.addAll({
        'token': response,
      });

      return Right(response);
    } catch (e) {
      return Left(AuthError(e.toString()));
    }
  }
}
