import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late FontLocalService fontLocalService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    fontLocalService = FontLocalService(prefs: prefs);
  });

  group('Font Local Service', () {
    test('saveFontPreference saves the font to shared preferences', () async {
      await fontLocalService.saveFontPreference(AppFont.monospace);
      expect(
        prefs.getString('font_pref'),
        AppFont.monospace.toStringg(),
      );
    });

    test('getFontPreference retrieves the saved font preference', () async {
      await fontLocalService.saveFontPreference(AppFont.monospace);
      expect(
        fontLocalService.getFontPreference(),
        AppFont.monospace,
      );
    });

    test('getFontPreference returns null for invalid font', () async {
      await prefs.setString('font_pref', 'invalid_font');
      expect(
        fontLocalService.getFontPreference(),
        null,
      );
    });
  });
}
