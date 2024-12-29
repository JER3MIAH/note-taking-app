import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/utils/utils.dart';

class DesktopLayout extends StatelessWidget {
  final Widget topContent;
  final Widget sideContent;
  final Widget body;

  const DesktopLayout({
    super.key,
    required this.topContent,
    required this.sideContent,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Expanded(
      child: Column(
        children: [
          Container(
            height: 81,
            // width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: spacing400),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.inversePrimary,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 290,
                  padding: EdgeInsets.symmetric(
                    vertical: spacing250,
                    horizontal: spacing200,
                  ).copyWith(left: spacing400),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: theme.inversePrimary,
                      ),
                    ),
                  ),
                  child: sideContent,
                ),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
