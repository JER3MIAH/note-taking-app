import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopArchivedNotesSideView extends StatelessWidget {
  const DesktopArchivedNotesSideView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<NoteBloc, NoteState>(
      builder: (_, state) {
        final archivedNotes =
            state.notes.where((note) => note.isArchived).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              title: '+ Create New Note',
              expanded: true,
              onTap: () {},
            ),
            YBox(5),
            AppText(
              'All your archived notes are stored here. You can restore or delete them anytime.',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: theme.onSurfaceVariant,
            ),
            HorizontalLine(hasMargin: true),
            if (archivedNotes.isEmpty)
              EmptyStateContainer(
                text:
                    'No notes have been archived yet. Move notes here for safekeeping, or create a new note.',
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  archivedNotes.length,
                  (index) {
                    final note = archivedNotes[index];
                    return NoteTile(
                      note: note,
                      isSelected: note == state.selectedNote,
                      onTap: () {
                        context.read<NoteBloc>().add(SelectNote(id: note.id));
                      },
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
