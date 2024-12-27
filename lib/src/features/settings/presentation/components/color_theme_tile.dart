import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class ColorThemeTile extends StatelessWidget {
  final AppTheme appTheme;
  final bool isSelected;
  final VoidCallback onTap;
  const ColorThemeTile({
    super.key,
    required this.appTheme,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
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
          switch (appTheme) {
            AppTheme.light => iconSun,
            AppTheme.dark => iconMoon,
            AppTheme.system => iconSystemTheme,
          },
          color: theme.onSurface,
        ),
      ),
      title: AppText(
        switch (appTheme) {
          AppTheme.light => 'Light Mode',
          AppTheme.dark => 'Dark Mode',
          AppTheme.system => 'System',
        },
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      subtitle: AppText(
        switch (appTheme) {
          AppTheme.light => 'Pick a clean and classic light theme',
          AppTheme.dark => 'Select a sleek and modern dark theme',
          AppTheme.system => 'Adapts to your device’s theme',
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
