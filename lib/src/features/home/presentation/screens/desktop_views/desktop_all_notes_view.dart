import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopAllNotesSideView extends StatelessWidget {
  const DesktopAllNotesSideView({super.key});

  @override
  Widget build(BuildContext context) {
    final noteBloc = context.read<NoteBloc>();

    return BlocBuilder<NoteBloc, NoteState>(
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              title: '+ Create New Note',
              expanded: true,
              onTap: () {},
            ),
            YBox(5),
            if (state.notes.isEmpty)
              EmptyStateContainer(
                text:
                    'You don’t have any notes yet. Start a new note to capture your thoughts and ideas.',
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.notes.length,
                  (index) {
                    final note = state.notes[index];
                    return NoteTile(
                      note: note,
                      isSelected: note == state.selectedNote,
                      onTap: () {
                        noteBloc.add(SelectNote(id: note.id));
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
