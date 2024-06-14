import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';
import 'package:his_mobile/presentation/widgets/forms/custom_text_form_field.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final existingPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  dispose() {
    existingPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //TODO: add snackbar and change password logic
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.change_password,
          style: theme.textTheme.displayLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                title: context.l10n.current_password,
                controller: existingPassword,
                hintText: context.l10n.enter_current_password,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                title: context.l10n.new_password,
                controller: newPassword,
                hintText: context.l10n.enter_new_password,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                title: context.l10n.confirm_password,
                controller: confirmPassword,
                hintText: context.l10n.enter_confirm_password,
                obscureText: true,
              ),
              const SizedBox(height: 40),
              AppButton(
                title: context.l10n.change,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
