import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

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
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
            Text(
              label,
              style: theme.textTheme.displaySmall,
            ),
          ],
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            context.l10n.forgot_password,
            style: theme.textTheme.displaySmall!.copyWith(
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
