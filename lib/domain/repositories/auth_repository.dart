import 'package:dartz/dartz.dart';
import 'package:his_mobile/core/error/auth_error.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';

abstract class AuthRepository {
  Future<Either<AuthError, String>> signInWithEmailAndPassword(
    SignInEntity signInEntity,
  );

  Future<Either<Failure, String>> forgotPassword({
    required String email,
  });

  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, String>> logout();
}
