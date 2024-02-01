import 'package:flutter/material.dart';
import 'package:his_mobile/core/styles/validation/form_validation.dart';
import 'package:his_mobile/core/styles/widgets/forms/custom_text_form_field.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.login,
    required this.password,
  });

  final TextEditingController login;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          title: 'Электронная почта',
          hintText: 'Введите ваш email',
          controller: login,
          validator: (_) => FormValidation.validateInn(
            login.text,
          ),
        ),
        const SizedBox(height: 30),
        CustomTextFormField(
          title: 'Пароль',
          hintText: 'Введите ваш пароль',
          controller: password,
          validator: (_) => FormValidation.validatePassword(
            password.text,
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
