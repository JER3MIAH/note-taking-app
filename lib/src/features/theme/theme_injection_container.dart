import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/theme/logic/bloc/theme_bloc.dart';

class ThemeInjectionContainer {
  static Future<void> init() async {
    //* Blocs
    getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  }
}
