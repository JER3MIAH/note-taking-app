import 'dart:developer';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalService {
  final SharedPreferences prefs;

  ThemeLocalService({required this.prefs});

  Future<void> saveThemePreference(AppTheme value) async {
    try {
      await prefs.setString('theme_pref', value.toStringg());
    } catch (e) {
      log('save theme preference error: $e');
    }
  }

  AppTheme? getThemePreference() {
    try {
      final themePref = prefs.getString('theme_pref');
      if (themePref != null) {
        try {
          return themePref.toAppTheme();
        } catch (e) {
          log('Invalid theme string: $themePref');
          return null;
        }
      }
      return null;
    } catch (e) {
      log('get theme preference error: $e');
      return null;
    }
  }
}
