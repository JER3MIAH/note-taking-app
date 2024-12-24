import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/font_bloc/font_state.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';

final List<BlocProvider> settingsBlocProviders = [
  BlocProvider<ThemeBloc>(
    create: (_) => getIt<ThemeBloc>()..add(GetSavedThemePrefs()),
  ),
  BlocProvider<FontBloc>(
    create: (_) => getIt<FontBloc>()..add(GetSavedFontPrefs()),
  ),
];
