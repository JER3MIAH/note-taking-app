import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class TagsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isDesktop;
  final bool isSelected;
  const TagsTile({
    super.key,
    required this.title,
    required this.onTap,
    this.isDesktop = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onTap,
          minTileHeight: 40,
          contentPadding: isDesktop
              ? EdgeInsets.symmetric(horizontal: 12)
              : EdgeInsets.zero,
          tileColor: isSelected ? theme.primaryFixed : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          leading: SvgAsset(
            iconTag,
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
        ),
        if (!isDesktop)
          Container(
            height: 1,
            color: theme.inversePrimary,
          ),
      ],
    );
  }
}
