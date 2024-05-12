import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class BookingContent extends StatelessWidget {
  const BookingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.booking),
    );
  }
}
