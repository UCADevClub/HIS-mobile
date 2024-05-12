import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/core/mixin/dialog_helper.dart';
import 'package:his_mobile/presentation/widgets/buttons/change_language_button.dart';

//TODO: add dark mode logic and update this page
@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with DialogHelper {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.settings,
          style: theme.textTheme.displayLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SettingsList(
        lightTheme:
            SettingsThemeData(settingsListBackground: Colors.transparent),
        sections: [
          SettingsSection(
            title: Text(context.l10n.general,
                style: theme.textTheme.displayMedium),
            tiles: [
              SettingsTile.switchTile(
                initialValue: _darkMode,
                onToggle: (newValue) => setState(() => _darkMode = newValue),
                title: Text(context.l10n.dark_mode),
              ),
              SettingsTile(
                title: Text(context.l10n.change_language),
                trailing: const Icon(Icons.language),
                onPressed: (BuildContext context) {
                  showMessageDialog(
                    context: context,
                    message: context.l10n.change_language,
                    content: context.l10n.chose_language,
                    actions: [
                      const ChangeLanguageButton(),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
