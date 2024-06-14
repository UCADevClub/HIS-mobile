import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String title;
  final Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
          minimumSize: Size(
            width ?? 300,
            height ?? 40,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
