import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/widgets/layout/app_bottom_bar.dart';
import 'package:his_mobile/presentation/widgets/layout/app_drawer.dart';
import 'package:his_mobile/presentation/widgets/layout/app_top_bar.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppTopBar(
        scaffoldKey: _scaffoldKey,
        title: 'Home',
      ),
      bottomNavigationBar: const AppBottomBar(),
      drawer: const AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
