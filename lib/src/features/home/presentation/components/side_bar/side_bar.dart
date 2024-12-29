import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      width: 272,
      padding: EdgeInsets.symmetric(
        vertical: spacing150,
        horizontal: spacing200,
      ),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: theme.inversePrimary,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLogo(),
          YBox(20),
          SideBarTile(
            icon: iconHome,
            title: 'All Notes',
            isSelected: true,
            onTap: () {},
          ),
          YBox(10),
          SideBarTile(
            icon: iconArchive,
            title: 'Archived Notes',
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
