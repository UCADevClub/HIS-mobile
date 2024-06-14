import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/core/validation/form_validation.dart';
import 'package:his_mobile/presentation/widgets/forms/custom_text_form_field.dart';

class LoginField extends StatefulWidget {
  const LoginField({
    super.key,
    required this.login,
    required this.password,
  });

  final TextEditingController login;
  final TextEditingController password;

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  late FormValidation validation;

  @override
  void initState() {
    super.initState();
    validation = FormValidation(context);
  }

  @override
  void dispose() {
    widget.login.dispose();
    widget.password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          title: context.l10n.email,
          hintText: context.l10n.enter_email,
          controller: widget.login,
          validator: (_) => validation.validateEmail(
            widget.login.text,
          ),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          title: context.l10n.password,
          hintText: context.l10n.enter_password,
          controller: widget.password,
          // validator: (_) => validation.validatePassword(
          //   password.text,
          // ),
          obscureText: true,
        ),
      ],
    );
  }
}
