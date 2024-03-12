import 'package:dartz/dartz.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    SignInEntity signInEntity,
  );

  Future<Either<Failure, String>> forgotPassword({
    required String email,
  });

  Future<Either<Failure, String>> logout();
}