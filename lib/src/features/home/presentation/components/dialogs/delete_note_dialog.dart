import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DeleteNoteDialog extends StatelessWidget {
  final Note note;
  const DeleteNoteDialog({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.secondaryContainer,
                ),
                child: SvgAsset(
                  iconDelete,
                  height: 25,
                  color: theme.onPrimary,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    AppText(
                      'Delete Note',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      'Are you sure you want to permanently delete this note? This action cannot be undone.',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: theme.surfaceBright,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: theme.onSurface.withValues(alpha: .4),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(right: 15),
          child: Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                bHeight: 41,
                title: 'Cancel',
                color: theme.secondaryContainer,
                onTap: () {
                  AppNavigator(context).popDialog();
                },
              ),
              AppButton(
                bHeight: 41,
                title: 'Delete Note',
                color: theme.error,
                onTap: () {
                  AppNavigator(context).popDialog();
                  context.read<NoteBloc>().add(DeleteNote(id: note.id));
                  AppNavigator(context).popDialog();
                  AppSnackbar.show(context, title: noteDeleted);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}