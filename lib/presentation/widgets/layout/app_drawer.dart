import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/application/application.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_text_button.dart';

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
          AppTextButton(
            title: "Персональные данные",
            icon: Icons.person,
            onPressed: () {
              context.router.pushNamed('/profile');
            },
          ),
          AppTextButton(
            title: "Медицинские данные",
            icon: Icons.medical_information_outlined,
            onPressed: () {
              context.router.pushNamed('/medical-data');
            },
          ),
          AppTextButton(
            title: "Страхование",
            icon: Icons.safety_check,
            onPressed: () {},
          ),
          AppTextButton(
            title: "Изменить Пароль",
            icon: Icons.lock,
            onPressed: () {
              context.router.pushNamed('/change-password');
            },
          ),
          AppTextButton(
            title: "Настройки",
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
              title: 'Logout',
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
