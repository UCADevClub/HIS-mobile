import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class SwipeBar extends StatelessWidget {
  const SwipeBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30), // Creates border
            color: theme.primaryColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 2.5,
          ),
          tabs: [
            Tab(
              child: Text(context.l10n.analysis),
            ),
            Tab(
              child: Text(context.l10n.history),
            ),
          ],
        ),
      ),
    );
  }
}
