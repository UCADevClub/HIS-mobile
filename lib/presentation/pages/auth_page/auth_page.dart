import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/domain/entities/sign_in_entity.dart';
import 'package:his_mobile/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:his_mobile/presentation/widgets/auth_widgets/login_field.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> loginKey = GlobalKey();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // bool _checked = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _buildBlocListener(context),
    );
  }

  Widget _buildBlocListener(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          context.router.replaceNamed("/home");
        }
      },
      child: SafeArea(child: _buildForm(context)),
    );
  }

  Widget _buildForm(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: loginKey,
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    context.i10n.welcome,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SvgPicture.asset(
                      'assets/vectors/doctor.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: LoginField(
                    login: _loginController,
                    password: _passwordController,
                  ),
                ),
                //TODO: Apply functionality of this
                // DetailsLine(
                //   label: context.i10n.remember_me,
                //   value: _checked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _checked = value!;
                //       HisMobile.of(context).setLocale(const Locale('ru'));
                //       print('Запомнил');
                //     });
                //   },
                //   onTap: () {
                //     HisMobile.of(context).setLocale(const Locale('ky'));
                //     print('Не забывай больше');
                //   },
                // ),
                Flexible(
                  flex: 0,
                  child: AppButton(
                    title: context.i10n.enter,
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              LoginRequested(
                                SignInEntity(
                                  email: _loginController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
