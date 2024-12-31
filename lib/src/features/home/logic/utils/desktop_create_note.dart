import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/shared/shared.dart';

void desktopCreateNewNote({
  required NoteBloc noteBloc,
  required BuildContext context,
}) {
  if (noteBloc.state.notes.any((note) => note.title.isEmpty)) {
    AppSnackbar.show(
      context,
      title: 'You still have an untitled note',
      isWarning: true,
    );
    return;
  }
  noteBloc.add(
    AddNote(
      title: '',
      tags: [],
      note: '',
    ),
  );
  Future.delayed(
    Duration(milliseconds: 300),
    () {
      noteBloc.add(
        SelectNote(id: noteBloc.state.notes.first.id),
      );
    },
  );
}
