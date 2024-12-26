import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/features/home/presentation/screens/home_view.dart';
import 'package:note_taking_app/src/features/settings/data/enums/app_theme.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    List<Widget> pages = const [
      HomeView(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
    ];

    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return Scaffold(
          backgroundColor: theme.inversePrimary,
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
          body: Container(
            decoration: BoxDecoration(
              color: theme.surface,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
          ),
          bottomNavigationBar: AppBottomNavBar(),
        );
      },
    );
  }
}
