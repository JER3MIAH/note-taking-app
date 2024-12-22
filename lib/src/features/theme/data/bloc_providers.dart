import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/theme/logic/bloc/theme_state.dart';

final List<BlocProvider> themeBlocProviders = [
  BlocProvider<ThemeBloc>( create: (_) => getIt<ThemeBloc>(),),
];
