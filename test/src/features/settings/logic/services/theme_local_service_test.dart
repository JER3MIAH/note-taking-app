import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late ThemeLocalService themeLocalService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    themeLocalService = ThemeLocalService(prefs: prefs);
  });

  group('Theme Local Service', () {
    test('saveThemePreference saves the theme to shared preferences', () async {
      await themeLocalService.saveThemePreference(AppTheme.dark);
      expect(
        prefs.getString('theme_pref'),
        AppTheme.dark.toStringg(),
      );
    });

    test('getThemePreference retrieves the saved theme preference', () async {
      await themeLocalService.saveThemePreference(AppTheme.dark);
      expect(
        themeLocalService.getThemePreference(),
        AppTheme.dark,
      );
    });

    test('getThemePreference returns null for invalid theme', () async {
      await prefs.setString('theme_pref', 'invalid_theme');
      expect(
        themeLocalService.getThemePreference(),
        null,
      );
    });
  });
}
