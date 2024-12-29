import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class EmptyStateContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onCreateNewNote;
  const EmptyStateContainer({
    super.key,
    required this.text,
    this.onCreateNewNote,
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
      child: Wrap(
        children: [
          AppText(
            text,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          if (onCreateNewNote != null)
            GestureDetector(
              onTap: onCreateNewNote,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.onSurface,
                      ),
                    ),
                  ),
                  child: AppText(
                    'create a new note.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
