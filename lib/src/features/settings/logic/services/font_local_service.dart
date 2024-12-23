import 'dart:developer';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontLocalService {
  final SharedPreferences prefs;

  FontLocalService({required this.prefs});

  Future<void> saveFontPreference(AppFont value) async {
    try {
      await prefs.setString('font_pref', value.toStringg());
    } catch (e) {
      log('save font preference error: $e');
    }
  }

  AppFont? getFontPreference() {
    try {
      final fontPref = prefs.getString('font_pref');
      if (fontPref != null) {
        try {
          return fontPref.toAppFont();
        } catch (e) {
          log('Invalid font string: $fontPref');
          return null;
        }
      }
      return null;
    } catch (e) {
      log('get font preference error: $e');
      return null;
    }
  }
}
