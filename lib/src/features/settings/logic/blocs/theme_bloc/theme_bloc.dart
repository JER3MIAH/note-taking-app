import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/settings/logic/services/services.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeLocalService localService;
  ThemeBloc({
    required this.localService,
  }) : super(const ThemeState()) {
    on<GetSavedThemePrefs>((event, emit) async {
      final appTheme = localService.getThemePreference();
      emit(state.copyWith(
        appTheme: appTheme,
      ));
    });

    on<ChangeTheme>((event, emit) {
      emit(state.copyWith(appTheme: event.theme));
    });
  }
}
