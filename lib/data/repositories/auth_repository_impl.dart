import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:his_mobile/core/di/dependency_injection.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/core/network/network_info.dart';
import 'package:his_mobile/data/datasources/auth_data_source.dart';
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
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    SignInEntity signInEntity,
  ) async {
    final networkConnection = await _checkNetworkConnection();
    return networkConnection.fold(
      (failure) => Left(failure),
      (_) => _attemptSignIn(signInEntity),
    );
  }

  Future<Either<Failure, Unit>> _checkNetworkConnection() async {
    if (await networkInfo.isConnected) {
      return const Right(unit);
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, String>> _attemptSignIn(
      SignInEntity signInEntity) async {
    try {
      final token = await authDataSource.signInWithEmailAndPassword(
        email: signInEntity.email,
        password: signInEntity.password,
      );

      // Add token to header
      sl.get<Dio>().options.headers.addAll({
        'token': token,
      });

      return Right(token);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
