import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/font_bloc/font_state.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_bloc.dart';

class SettingsInjectionContainer {
  static Future<void> init() async {
    //* Blocs
    getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
    getIt.registerLazySingleton<FontBloc>(() => FontBloc());
  }
}
