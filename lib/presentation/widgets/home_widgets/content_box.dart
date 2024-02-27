import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({
    super.key,
    required this.description,
    this.onTap,
  });

  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: const EdgeInsets.all(10),
            width: width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.dimens.borderRadius),
              color: theme.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 25,
                left: 10,
                right: 10,
              ),
              child: Text(
                description,
              ),
            )),
      ),
    );
  }
}
