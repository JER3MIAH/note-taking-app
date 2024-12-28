import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class CreateOrViewNoteScreen extends HookWidget {
  final Note? note;
  const CreateOrViewNoteScreen({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final viewingNote = note != null;

    return AppScaffold(
      body: AppColumn(
        children: [
          Row(
            children: [
              TextBackButton(
                title: 'Go back',
              ),
              Spacer(),
              Row(
                spacing: 5,
                children: [
                  if (viewingNote) ...[
                    AppIconButton(
                      icon: iconDelete,
                      onTap: () {},
                    ),
                    AppIconButton(
                      icon: note!.isArchived ? iconRestore : iconArchive,
                      onTap: () {},
                    ),
                  ],
                  AppTextButton(
                    text: 'Cancel',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Save note',
                    color: theme.primary,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          const HorizontalLine(
            hasMargin: true,
          ),
        ],
      ),
    );
  }
}
