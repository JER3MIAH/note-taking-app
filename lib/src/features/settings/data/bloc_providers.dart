import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/font/logic/font_bloc/font_bloc.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';

final List<BlocProvider> settingsBlocProviders = [
  BlocProvider<ThemeBloc>(
    create: (_) => getIt<ThemeBloc>(),
  ),
  BlocProvider<FontBloc>(
    create: (_) => getIt<FontBloc>(),
  ),
];
