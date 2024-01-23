import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/presentation/core/validation/form_validation.dart';
import 'package:his_mobile/presentation/core/widgets/app_button.dart';
import 'package:his_mobile/presentation/core/widgets/forms/custom_text_form_field.dart';
import 'package:his_mobile/presentation/modules/auth_page/bloc/auth_bloc.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> loginKey = GlobalKey();
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
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: Form(
              key: loginKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    title: 'Login',
                    controller: _loginController,
                    validator: (_) =>
                        FormValidation.validateInn(
                          _loginController.text,
                        ),
                  ),
                  CustomTextFormField(
                    title: 'Password',
                    controller: _passwordController,
                  ),
                  AppButton(
                    title: 'Login',
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        // BlocProvider.of<AuthBloc>(context).add(
                        //   LoginRequested(
                        //     // login: _loginController.text,
                        //     // password: _passwordController.text,
                        //   ),
                          print('Login');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
