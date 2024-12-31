import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/side_bar_nav_cubit.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/features/settings/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class SettingsDesktopSideView extends StatelessWidget {
  const SettingsDesktopSideView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final sideBarCubit = context.read<SideBarNavCubit>();

    return BlocBuilder<SideBarNavCubit, SideBarItem>(
      builder: (_, selectedItem) {
        return Column(
          spacing: 5,
          children: [
            SettingTile(
              title: 'Color Theme',
              icon: iconSun,
              isSelected: selectedItem == SideBarItem.colorTheme,
              onTap: () {
                sideBarCubit.setSideBarItem(SideBarItem.colorTheme);
              },
            ),
            SettingTile(
              title: 'Font Theme',
              icon: iconFont,
              isSelected: selectedItem == SideBarItem.fontTheme,
              onTap: () {
                sideBarCubit.setSideBarItem(SideBarItem.fontTheme);
              },
            ),
            Container(
              color: theme.inversePrimary,
              height: 1,
            ),
            SettingTile(
              title: 'Logout',
              icon: iconLogout,
              onTap: () {
                AppDialog.dialog(context, LogoutDialog());
              },
            ),
          ],
        );
      },
    );
  }
}
