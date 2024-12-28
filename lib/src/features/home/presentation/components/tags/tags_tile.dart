import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class TagsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TagsTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: SvgAsset(
        iconTag,
        color: theme.surfaceBright,
      ),
      title: AppText(
        title,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: theme.surfaceBright,
      ),
    );
  }
}
