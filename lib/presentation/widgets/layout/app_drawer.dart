import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_button.dart';

@RoutePage()
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
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
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print('Home');
            },
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () {
              print('Home');
            },
            child: const Text('Home'),
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
