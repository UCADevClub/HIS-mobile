import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/core/routes/app_router.gr.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/widgets/auth_widgets/details_line.dart';
import 'package:his_mobile/presentation/widgets/auth_widgets/login_field.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';

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
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: SafeArea(
          child: Form(
            key: loginKey,
            child: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoginField(
                      login: _loginController,
                      password: _passwordController,
                    ),
                    DetailsLine(
                      label: 'Запомнить меня',
                      value: _checked,
                      onChanged: (bool? value) {
                        setState(() {
                          _checked = value!;
                          print('Запомнил');
                        });
                      },
                      onTap: () {
                        print('Не забывай больше');
                      },
                    ),
                    const SizedBox(height: 10),
                    AppButton(
                      title: 'Войти',
                      onPressed: () {
                        // if (loginKey.currentState!.validate()) {
                        context.router.push(const HomeRoute());
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
