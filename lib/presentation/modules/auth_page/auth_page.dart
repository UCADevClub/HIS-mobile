import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/core/widgets/app_button.dart';
import 'package:his_mobile/presentation/core/widgets/forms/custom_text_form_field.dart';


@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              CustomTextFormField(
                title: 'Login',
                controller: _loginController,
              ),
              CustomTextFormField(
                title: 'Password',
                controller: _passwordController,
              ),
              AppButton(title: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}
