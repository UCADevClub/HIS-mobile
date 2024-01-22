import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(widget.title),
    );
  }
}
