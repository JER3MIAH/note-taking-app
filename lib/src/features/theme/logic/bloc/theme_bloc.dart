import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ChangeTheme>((event, emit) {
      emit(state.copyWith(appTheme: event.theme));
    });
  }
}
