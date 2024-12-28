import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String title,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = Theme.of(context).colorScheme;

    final snackBar = SnackBar(
      backgroundColor: theme.surfaceContainerHigh,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(spacing100),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing100),
        side: BorderSide(color: theme.inversePrimary),
      ),
      content: Row(
        children: [
          SvgAsset(
            iconCheckMark,
            color: appColors.green500,
          ),
          XBox(12),
          Expanded(
            child: AppText(
              title,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: theme.onSurface,
            ),
          ),
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: SvgAsset(
              iconCross,
              color: theme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      duration: duration,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar() // Ensures only one snack bar is shown at a time
      ..showSnackBar(snackBar);
  }
}
