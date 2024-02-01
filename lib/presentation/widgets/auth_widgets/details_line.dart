import 'package:flutter/material.dart';

class DetailsLine extends StatelessWidget {
  const DetailsLine({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.onTap,
  });

  final String label;
  final bool value;
  final Function(bool?) onChanged;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(width: 70),
        TextButton(
          onPressed: onTap,
          child: Text(
            'Забыли пароль?',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
