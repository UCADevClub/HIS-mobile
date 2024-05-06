import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class FormValidation {
  final BuildContext context;

  FormValidation(this.context);

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.email_required;
    }

    // Regular expression for basic email validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return context.l10n.email_invalid;
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return context.l10n.password_required;
    } else if (value.length < 6) {
      return context.l10n.password_min_length;
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Номер телефона не должен быть пустым';
    } else if (value.length < 10) {
      return 'Номер телефона должен состоять из более чем 10 символов';
    }
    return null;
  }
}
