import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/presentation/pages/home_page/widgets/booking_content.dart';
import 'package:his_mobile/presentation/pages/home_page/widgets/home_content.dart';
import 'package:his_mobile/presentation/pages/home_page/widgets/medical_record_content.dart';
import 'package:his_mobile/presentation/widgets/layout/app_bottom_bar.dart';
import 'package:his_mobile/presentation/widgets/layout/app_drawer.dart';
import 'package:his_mobile/presentation/widgets/layout/app_top_bar.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppTopBar(
        scaffoldKey: _scaffoldKey,
        title: context.l10n.home,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          BookingContent(),
          HomeContent(),
          MedicalRecordContent(),
        ],
      ),
      bottomNavigationBar: AppBottomBar(
        selectedIndex: selectedIndex,
        onItemTapped: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      drawer: const AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
