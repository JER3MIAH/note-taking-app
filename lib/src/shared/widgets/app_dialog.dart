import 'package:flutter/material.dart';

class AppDialog {
  static void dialog(
    BuildContext context,
    Widget content, {
    Color? bgColor,
    bool dismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              backgroundColor: bgColor ?? Theme.of(context).colorScheme.tertiary,
              shadowColor: bgColor ?? Theme.of(context).colorScheme.tertiary,
              child: content,
            );
          }
        );
      },
    );
  }
}