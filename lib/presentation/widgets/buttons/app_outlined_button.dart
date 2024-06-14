import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: theme.primaryColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
