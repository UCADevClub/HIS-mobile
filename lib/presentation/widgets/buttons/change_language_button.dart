import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language {
  final String code;
  final String countryCode;
  final String name;

  Language(this.code, this.countryCode, this.name);
}

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({super.key});

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  String dropdownValue = 'ru';

  @override
  void initState() {
    super.initState();
    loadLanguagePreference().then((language) {
      setState(() {
        dropdownValue = language;
      });
    });
  }

  Future<void> saveLanguagePreference(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }

  Future<String> loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    return languageCode ?? 'ru';
  }

  void changeLanguage(String languageCode, BuildContext context) {
    Map<String, Locale> languageCodeToLocale = {
      'en': const Locale('en', 'US'),
      'ru': const Locale('ru', 'RU'),
      'ky': const Locale('ky', 'KG'),
    };

    dropdownValue = languageCode;

    Locale locale = languageCodeToLocale[languageCode]!;
    context.setLocale(locale);
    saveLanguagePreference(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    List<Language> languages = [
      Language('en', 'us', context.l10n.english),
      Language('ru', 'ru', context.l10n.russian),
      Language('ky', 'kg', context.l10n.kyrgyz),
    ];
    final theme = Theme.of(context);
    return DropdownButton<String>(
      hint: Row(
        children: <Widget>[
          CountryFlag.fromCountryCode(
            languages
                .firstWhere((lang) => lang.code == dropdownValue)
                .countryCode,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(languages.firstWhere((lang) => lang.code == dropdownValue).name)
        ],
      ),
      iconSize: 0,
      elevation: 16,
      style: theme.textTheme.headlineSmall,
      onChanged: (String? newLanguage) {
        setState(() {
          dropdownValue = newLanguage!;

          var languageCode =
              languages.firstWhere((lang) => lang.name == newLanguage).code;

          changeLanguage(languageCode, context);
        });
      },
      items: languages.map<DropdownMenuItem<String>>((lang) {
        return DropdownMenuItem(
          value: lang.name,
          child: Row(
            children: <Widget>[
              CountryFlag.fromCountryCode(
                lang.countryCode,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 8),
              Text(lang.name),
            ],
          ),
        );
      }).toList(),
    );
  }
}
