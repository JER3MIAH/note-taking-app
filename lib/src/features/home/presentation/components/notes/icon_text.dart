import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class IconText extends StatelessWidget {
  final String icon;
  final String title;
  const IconText({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 140,
      child: Expanded(
        child: ListTile(
          minTileHeight: 40,
          contentPadding: EdgeInsets.zero,
          leading: SvgAsset(
            icon,
            color: theme.surfaceBright,
            height: 20,
            width: 20,
          ),
          title: AppText(
            title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: theme.surfaceBright,
          ),
        ),
      ),
    );
  }
}
