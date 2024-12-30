import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopTagView extends StatelessWidget {
  final String tag;
  const DesktopTagView({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesktopCreateNewNoteButton(),
        YBox(5),
        Text.rich(
          TextSpan(
            text: 'All notes with the ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: theme.onSurfaceVariant,
            ),
            children: [
              TextSpan(
                text: '”$tag”',
                style: TextStyle(
                  color: theme.onPrimary,
                ),
              ),
              TextSpan(
                text: ' tag are shown here.',
                style: TextStyle(
                  color: theme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        YBox(5),
        BlocBuilder<NoteBloc, NoteState>(
          builder: (_, state) {
            final filteredNotes =
                state.notes.where((note) => note.tags.contains(tag)).toList();

            return Column(
              children: List.generate(
                filteredNotes.length,
                (index) {
                  final note = filteredNotes[index];
                  return NoteTile(
                    note: note,
                    isSelected: note == state.selectedNote,
                    onTap: () {
                      context.read<NoteBloc>().add(SelectNote(id: note.id));
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
