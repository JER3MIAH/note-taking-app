import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final bool isSelected;
  const NoteTile({
    super.key,
    required this.note,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(spacing100),
      decoration: BoxDecoration(
        borderRadius: isSelected ? BorderRadius.circular(spacing75) : null,
        border: !isSelected
            ? Border(
                bottom: BorderSide(
                  color: theme.inversePrimary,
                ),
              )
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            note.title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          YBox(10),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(
              note.tags.length,
              (index) {
                final tag = note.tags[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: theme.inversePrimary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AppText(
                    tag,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
            ),
          ),
          YBox(10),
          AppText(
            '28 Oct 2024', //TODO:
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: theme.surfaceBright,
          ),
        ],
      ),
    );
  }
}
