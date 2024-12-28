import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String title,
    Duration duration = const Duration(seconds: 4),
  }) {
    final snackBar = SnackBar(
      backgroundColor: appColors.white,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(spacing100),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing100),
        side: BorderSide(color: appColors.neutral200),
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
              color: appColors.neutral950,
            ),
          ),
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: SvgAsset(iconCross),
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
