import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class SideBarTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const SideBarTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      minTileHeight: 40,
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      tileColor: isSelected ? theme.primaryFixed : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      leading: SvgAsset(
        icon,
        color: isSelected ? theme.primary : theme.surfaceBright,
      ),
      title: AppText(
        title,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: theme.surfaceBright,
      ),
      trailing: isSelected
          ? Icon(
              Icons.keyboard_arrow_right,
              color: theme.onSurface,
              size: 18,
            )
          : null,
    );
  }
}
