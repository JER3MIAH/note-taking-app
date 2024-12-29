import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final bool isSelected;
  const SettingTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.only(left: spacing100),
      minTileHeight: 36,
      tileColor: isSelected ? theme.primaryFixed : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      leading: SvgAsset(
        icon,
        color: isSelected ? theme.primary : theme.onSurface,
      ),
      title: AppText(
        title,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
