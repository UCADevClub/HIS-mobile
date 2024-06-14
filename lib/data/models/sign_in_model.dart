import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel extends SignInParams {
  const SignInModel({
    required super.email,
    required super.password,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}
