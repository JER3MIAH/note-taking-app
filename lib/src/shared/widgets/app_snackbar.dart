import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String title,
    Duration duration = const Duration(seconds: 4),
    bool isWarning = false,
  }) {
    final theme = Theme.of(context).colorScheme;

    final snackBar = SnackBar(
      width: DeviceType(context).isMobile ? null : 440,
      backgroundColor: theme.surfaceContainerHigh,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(spacing100),
      margin: DeviceType(context).isMobile
          ? EdgeInsets.symmetric(horizontal: 10)
          : null,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing100),
        side: BorderSide(
            color: isWarning ? appColors.red500 : theme.inversePrimary),
      ),
      content: Row(
        children: [
          SvgAsset(
            isWarning ? iconInfo : iconCheckMark,
            color: isWarning ? appColors.red500 : appColors.green500,
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
              color: isWarning ? appColors.red500 : theme.onSurfaceVariant,
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
