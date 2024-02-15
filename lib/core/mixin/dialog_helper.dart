import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_outlined_button.dart';

mixin DialogHelper {
  Future<T?> showMessageDialog<T>({
    required BuildContext context,
    required String message,
    required String content,
    Key? key,
    List<Widget>? actions,
  }) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      builder: (dCtx) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            key: key,
            content: Text(message),
            actions: actions ??
                [
                  AppOutlinedButton(
                    onPressed: Navigator.of(dCtx).pop,
                    title: "OK",
                  )
                ],
          );
        } else {
          return AlertDialog(
            key: key,
            alignment: Alignment.center,
            title: Text(message),
            titleTextStyle: theme.textTheme.displayMedium,
            content: Text(content),
            contentTextStyle: theme.textTheme.headlineSmall,
            actionsAlignment: MainAxisAlignment.center,
            actions: actions ??
                [
                  AppOutlinedButton(
                    onPressed: Navigator.of(dCtx).pop,
                    title: "OK",
                  )
                ],
          );
        }
      },
    );
  }
}
