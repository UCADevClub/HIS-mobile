class FormValidation {
  FormValidation();

  static String? validateInn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите ИНН';
    }

    final numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericValue.length != 14) {
      return 'Значение состоит из 14 цифр';
    }

    if (!numericValue.startsWith(RegExp(r'[1-2]'))) {
      return 'Значение начинается с 1 или 2';
    }

    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Почта не должна быть пустой';
    } else if (!value.contains('@')) {
      return 'Почта не верна';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Пароль не должен быть пустым';
    } else if (value.length < 6) {
      return 'Пароль должен состоять из более чем 6 символов';
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
