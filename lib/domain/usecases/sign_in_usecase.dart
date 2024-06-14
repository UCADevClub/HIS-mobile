import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:his_mobile/core/error/auth_error.dart';
import 'package:his_mobile/core/usecases/usecase.dart';
import 'package:his_mobile/data/models/auth_model.dart';
import 'package:his_mobile/domain/repositories/auth_repository.dart';

class SignInUseCase
    extends UseCase<Either<AuthError, AuthModel>, SignInParams> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<AuthError, AuthModel>> call(SignInParams params) async {
    return await _repository.signInWithEmailAndPassword(params);
  }
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
