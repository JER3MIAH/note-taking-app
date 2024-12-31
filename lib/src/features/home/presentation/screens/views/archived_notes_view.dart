import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class ArchivedNotesView extends StatelessWidget {
  const ArchivedNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<NoteBloc, NoteState>(
      builder: (_, state) {
        final archivedNotes =
            state.notes.where((note) => note.isArchived).toList();

        return AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Archived Notes',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            YBox(5),
            AppText(
              'All your archived notes are stored here. You can restore or delete them anytime.',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: theme.onSurfaceVariant,
            ),
            YBox(20),
            if (archivedNotes.isEmpty)
              EmptyStateContainer(
                text:
                    'No notes have been archived yet. Move notes here for safekeeping, or ',
                onCreateNewNote: () {
                  AppNavigator(context).pushNamed(
                    HomeRoutes.createOrViewNote,
                    args: null,
                  );
                },
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
                      onTap: () {
                        AppNavigator(context).pushNamed(
                          HomeRoutes.createOrViewNote,
                          args: note,
                        );
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
