import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({super.key});

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  String dropdownValue = 'Russian';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        String languageCode = Localizations.localeOf(context).languageCode;
        String language = languageCodes[languageCode] ?? 'Russian';

        dropdownValue = language;
      });
    });
    super.initState();
  }

  //TODO: Add localization to this
  Map<String, String> languageCodes = {
    'us': 'English',
    'ru': 'Russian',
    'kg': 'Kyrgyz',
  };

  void changeLanguage(String languageCode) {
    Locale locale;
    switch (languageCode) {
      case 'English':
        locale = const Locale('en', 'US');
        break;
      case 'Russian':
        locale = const Locale('ru', 'RU');
        break;
      case 'Kyrgyz':
        locale = const Locale('ky', 'KG');
        break;
      default:
        locale = Locale('en', 'US');
    }
    context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue,
        iconSize: 0,
        elevation: 16,
        style: theme.textTheme.headlineSmall,
        onChanged: (String? newLanguage) {
          setState(() {
            dropdownValue = newLanguage!;
            changeLanguage(newLanguage);
          });
        },
        items: languageCodes.entries.map<DropdownMenuItem<String>>((entry) {
          String language = entry.value;
          String countryCode = entry.key;
          return DropdownMenuItem<String>(
            value: language,
            child: Row(
              children: <Widget>[
                Flag.fromString(
                  countryCode,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 8),
                Text(language),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
