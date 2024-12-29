import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/settings/data/enums/app_theme.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, themeState) {
        return SvgAsset(switch (themeState.appTheme) {
          AppTheme.light => logo,
          AppTheme.dark => logoDark,
          AppTheme.system => isDarkMode ? logoDark : logo,
        });
      },
    );
  }
}
