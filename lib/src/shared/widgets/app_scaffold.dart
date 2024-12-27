import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const AppScaffold({
    super.key,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.inversePrimary,
        centerTitle: false,
        title: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) {
            return SvgAsset(switch (themeState.appTheme) {
              AppTheme.light => logo,
              AppTheme.dark => logoDark,
              AppTheme.system => isDarkMode ? logoDark : logo,
            });
          },
        ),
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
