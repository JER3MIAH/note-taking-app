import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/font_bloc/font_state.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/services/theme_local_service.dart';

class SettingsInjectionContainer {
  static Future<void> init() async {
    //* Services
    getIt.registerLazySingleton<ThemeLocalService>(
      () => ThemeLocalService(prefs: getIt<SharedPreferences>()),
    );

    //* Blocs
    getIt.registerLazySingleton<ThemeBloc>(
      () => ThemeBloc(localService: getIt<ThemeLocalService>()),
    );
    getIt.registerLazySingleton<FontBloc>(() => FontBloc());
  }
}
