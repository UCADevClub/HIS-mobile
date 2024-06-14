import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.scaffoldKey,
    required this.title,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
    );
  }
}
