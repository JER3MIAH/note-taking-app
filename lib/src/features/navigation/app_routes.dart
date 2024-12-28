import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/presentation/screens/screens.dart';
import 'package:note_taking_app/src/features/settings/presentation/screens/screens.dart';
import 'package:note_taking_app/src/shared/shared.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  ...authRoutes,
  ...homeRoutes,
  ...settingRoutes,
};

//* Auth Routes
final Map<String, Widget Function(BuildContext)> authRoutes = {};

//* Home Routes
final Map<String, Widget Function(BuildContext)> homeRoutes = {
  HomeRoutes.main: (context) =>
      DeviceType(context).isDesktop ? DesktopMainScreen() : MainScreen(),
  HomeRoutes.tagSelected: (context) => TagSelectedScreen(
        tag: ModalRoute.of(context)?.settings.arguments as String,
      ),
};

//* Setting Routes
final Map<String, Widget Function(BuildContext)> settingRoutes = {
  SettingRoutes.colorTheme: (context) => ColorThemeScreen(),
  SettingRoutes.fontTheme: (context) => FontThemeScreen(),
  SettingRoutes.changePassword: (context) => ChangePasswordScreen(),
};
