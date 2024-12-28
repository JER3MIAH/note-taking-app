import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class EmptyStateContainer extends StatelessWidget {
  final String text;
  const EmptyStateContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(spacing100),
      decoration: BoxDecoration(
        color: theme.primaryFixed,
        border: Border.all(
          color: theme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppText(
        text,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
