import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/data/datasources/locally/user_data.dart';
import 'package:his_mobile/presentation/application/application.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_event.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_text_button.dart';
import 'package:his_mobile/presentation/widgets/buttons/change_language_button.dart';

@RoutePage()
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(context),
          const ChangeLanguageButton(),
          _buildDrawerButtons(context),
          const Spacer(),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    final userData = sl<UserData>().getUser()!;
    final name = '${userData.first_name} ${userData.last_name}';
    final email = userData.email;
    return SizedBox(
      height: 250,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButtons(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          title: context.l10n.personal_information,
          icon: Icons.person,
          onPressed: () {
            context.read<UserInfoBloc>().add(UserInfoLoad());
            context.router.pushNamed('/profile');
          },
        ),
        AppTextButton(
          title: context.l10n.medical_data,
          icon: Icons.medical_information_outlined,
          onPressed: () => context.router.pushNamed('/medical-data'),
        ),
        AppTextButton(
          title: context.l10n.insurance,
          icon: Icons.safety_check,
          onPressed: () {},
        ),
        AppTextButton(
          title: context.l10n.change_password,
          icon: Icons.lock,
          onPressed: () => context.router.pushNamed('/change-password'),
        ),
        AppTextButton(
          title: context.l10n.settings,
          icon: Icons.settings,
          onPressed: () => context.router.pushNamed('/settings'),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AppButton(
        title: context.l10n.logout,
        onPressed: () {
          HisMobile.of(context).setLocale(const Locale('ru'));
        },
      ),
    );
  }
}
