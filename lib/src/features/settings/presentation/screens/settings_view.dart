import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/features/settings/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Settings',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        YBox(20),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            SettingTile(
              title: 'Color Theme',
              icon: iconSun,
              onTap: () {
                AppNavigator(context).pushNamed(SettingRoutes.colorTheme);
              },
            ),
            SettingTile(
              title: 'Font Theme',
              icon: iconFont,
              onTap: () {
                AppNavigator(context).pushNamed(SettingRoutes.fontTheme);
              },
            ),
            Container(
              color: theme.inversePrimary,
              height: 1,
            ),
            SettingTile(
              title: 'Logout',
              icon: iconLogout,
              onTap: () {
                AppDialog.dialog(context, LogoutDialog());
              },
            ),
          ],
        ),
      ],
    );
  }
}
