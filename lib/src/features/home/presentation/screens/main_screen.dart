import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/features/settings/presentation/screens/settings_view.dart';
import 'package:note_taking_app/src/shared/shared.dart';
import 'views/views.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    List<Widget> pages = const [
      HomeView(),
      Placeholder(),
      ArchivedNotesView(),
      TagsView(),
      SettingsView(),
    ];

    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return AppScaffold(
          backgroundColor: theme.inversePrimary,
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
