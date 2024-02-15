import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppTopBar(
        scaffoldKey: _scaffoldKey,
        title: 'Home',
      ),
      body: Center(
        child: _getBody(selectedIndex),
      ),
      bottomNavigationBar: AppBottomBar(
        selectedIndex: selectedIndex,
        onItemTapped: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      drawer: const AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const BookingContent();
      case 1:
        return const HomeContent();
      case 2:
        return const MedicalRecordContent();
      default:
        return const HomeContent();
    }
  }
}
