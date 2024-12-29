import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppDialog {
  static void dialog(
    BuildContext context,
    Widget content, {
    Color? bgColor,
    bool dismissible = true,
  }) {
    final theme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: theme.inversePrimary,
              ),
              borderRadius: BorderRadius.circular(spacing150),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: bgColor ?? theme.surfaceContainerHigh,
            shadowColor: bgColor ?? theme.surfaceContainerHigh,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 440,
              ),
              child: content,
            ),
          );
        });
      },
    );
  }
}
