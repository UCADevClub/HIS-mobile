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
    var current = 0;
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
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ramil Salihar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ramilsalihar@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          // AnimatedToggleSwitch<int>.size(
          //   textDirection: TextDirection.rtl,
          //   current: current,
          //   values: const [0, 1],
          //   iconOpacity: 0.2,
          //   indicatorSize: const Size.fromWidth(100),
          //   iconBuilder: (index) => index == 0
          //       ? const Icon(
          //           Icons.home,
          //           size: 30,
          //           color: Colors.white,
          //         )
          //       : const Icon(
          //           Icons.settings,
          //           size: 30,
          //           color: Colors.white,
          //         ),
          //   borderWidth: 4.0,
          //   iconAnimationType: AnimationType.onHover,
          //   style: ToggleStyle(
          //     borderColor: Colors.transparent,
          //     borderRadius: BorderRadius.circular(10.0),
          //     boxShadow: [
          //       const BoxShadow(
          //         color: Colors.black26,
          //         spreadRadius: 1,
          //         blurRadius: 2,
          //         offset: Offset(0, 1.5),
          //       ),
          //     ],
          //   ),
          //   onChanged: (int i) => setState(() => current = i),
          //   onTap: (i) => print('Tapped on $i'),
          // ),
          AppTextButton(
            title: "Персональные данные",
            icon: Icons.person,
            onPressed: () {},
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
