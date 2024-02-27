import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/core/validation/form_validation.dart';
import 'package:his_mobile/presentation/widgets/forms/custom_text_form_field.dart';

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
    final validation = FormValidation(context);
    return Column(
      children: [
        CustomTextFormField(
          title: context.i10n.email,
          hintText: context.i10n.enter_email,
          controller: login,
          validator: (_) => validation.validateEmail(
            login.text,
          ),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          title: context.i10n.password,
          hintText: context.i10n.enter_password,
          controller: password,
          validator: (_) => validation.validatePassword(
            password.text,
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
