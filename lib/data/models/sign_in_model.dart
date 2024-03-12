import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel extends SignInEntity {
  const SignInModel({
    required String email,
    required String password,
  }) : super(email: email, password: password);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}
