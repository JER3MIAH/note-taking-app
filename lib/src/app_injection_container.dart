import 'package:get_it/get_it.dart';
import 'package:note_taking_app/src/features/home/home_injection_container.dart';
import 'package:note_taking_app/src/features/theme/theme_injection_container.dart';

final getIt = GetIt.instance;

class AppInjectionContainer {
  static Future<void> init() async {
    //* -----

    await ThemeInjectionContainer.init();
    await HomeInjectionContainer.init();
  }
}
