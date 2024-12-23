import 'package:get_it/get_it.dart';
import 'package:note_taking_app/src/features/home/home_injection_container.dart';
import 'package:note_taking_app/src/features/settings/settings_injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppInjectionContainer {
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => prefs);
    //* -----

    await SettingsInjectionContainer.init();
    await HomeInjectionContainer.init();
  }
}
