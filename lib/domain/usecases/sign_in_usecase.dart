import 'package:dartz/dartz.dart';
import 'package:his_mobile/core/error/failures.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';
import 'package:his_mobile/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<Either<Failure, String>> call(SignInEntity signInEntity) async {
    return await _repository.signInWithEmailAndPassword(signInEntity);
  }
}
