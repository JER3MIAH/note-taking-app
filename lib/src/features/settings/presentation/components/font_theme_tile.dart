import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class FontThemeTile extends StatelessWidget {
  final AppFont appFont;
  final bool isSelected;
  final VoidCallback onTap;
  const FontThemeTile({
    super.key,
    required this.appFont,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
      tileColor: isSelected ? theme.primaryFixed : null,
      contentPadding: EdgeInsets.symmetric(horizontal: spacing200),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.inversePrimary),
        borderRadius: BorderRadius.circular(12),
      ),
      leading: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.inversePrimary),
        ),
        child: SvgAsset(
          switch (appFont) {
            AppFont.sanserif => iconFontSansSerif,
            AppFont.serif => iconFontSerif,
            AppFont.monospace => iconFontMonoSpace,
          },
          color: theme.onSurface,
        ),
      ),
      title: AppText(
        switch (appFont) {
          AppFont.sanserif => 'Sans-serif ',
          AppFont.serif => 'Serif',
          AppFont.monospace => 'Monospace',
        },
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      subtitle: AppText(
        switch (appFont) {
          AppFont.sanserif => 'Clean and modern, easy to read.',
          AppFont.serif => 'Classic and elegant for a timeless feel.',
          AppFont.monospace => 'Code-like, great for a technical vibe.',
        },
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: theme.surfaceBright,
      ),
      trailing: Radio<bool>(
        activeColor: isSelected ? theme.primary : theme.inversePrimary,
        value: isSelected,
        groupValue: true,
        onChanged: (value) {
          onTap();
        },
      ),
    );
  }
}
