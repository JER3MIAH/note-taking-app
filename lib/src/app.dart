import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/settings/data/enums/app_font.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/font_bloc/font_state.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/shared/shared.dart';
import 'features/home/data/bloc_providers.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/settings/data/bloc_providers.dart';
import 'features/settings/data/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/settings/logic/blocs/theme_bloc/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...settingsBlocProviders,
        ...homeBlocProviders,
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          return BlocBuilder<FontBloc, FontState>(builder: (_, fontState) {
            final fontFamily = switch (fontState.appFont) {
              AppFont.serif => inter,
              AppFont.sanserif => sotoSerif,
              AppFont.monospace => sourceCodePro,
            };
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Note Taking App',
              theme: lightTheme.copyWith(
                textTheme: lightTheme.textTheme.apply(
                  fontFamily: fontFamily,
                ),
              ),
              darkTheme: darkTheme.copyWith(
                textTheme: darkTheme.textTheme.apply(
                  fontFamily: fontFamily,
                ),
              ),
              themeMode: switch (state.appTheme) {
                AppTheme.dark => ThemeMode.dark,
                AppTheme.light => ThemeMode.light,
                AppTheme.system => ThemeMode.system,
              },
              themeAnimationCurve: Curves.easeInCirc,
              themeAnimationDuration: Duration(milliseconds: 500),
              routes: {
                AppRoutes.home: (context) => HomeScreen(),
              },
              initialRoute: AppRoutes.home,
            );
          });
        },
      ),
    );
  }
}
