import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/presentation/application/application.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_text_button.dart';
import 'package:his_mobile/presentation/widgets/buttons/change_language_button.dart';

@RoutePage()
class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
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
                  const Center(
                    child: Text(
                      'Ramil Salihar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'ramilsalihar@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const ChangeLanguageButton(),
          AppTextButton(
            title: context.l10n.personal_information,
            icon: Icons.person,
            onPressed: () {
              context.router.pushNamed('/profile');
            },
          ),
          AppTextButton(
            title: context.l10n.medical_data,
            icon: Icons.medical_information_outlined,
            onPressed: () {
              context.router.pushNamed('/medical-data');
            },
          ),
          AppTextButton(
            title: context.l10n.insurance,
            icon: Icons.safety_check,
            onPressed: () {},
          ),
          AppTextButton(
            title: context.l10n.change_password,
            icon: Icons.lock,
            onPressed: () {
              context.router.pushNamed('/change-password');
            },
          ),
          AppTextButton(
            title: context.l10n.settings,
            icon: Icons.settings,
            onPressed: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 10,
              right: 10,
            ),
            child: AppButton(
              title: context.l10n.logout,
              onPressed: () {
                HisMobile.of(context).setLocale(const Locale('ru'));
              },
            ),
          )
        ],
      ),
    );
  }
}
