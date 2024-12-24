import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/services/note_local_service.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteLocalService localService;
  final TagBloc tagBloc;
  NoteBloc({
    required this.localService,
    required this.tagBloc,
  }) : super(NoteState()) {
    on<SelectNote>(_selectNote);
    on<ResetSelectedNote>(_resetSelectedNote);
    on<AddNote>(_addNote);
    on<ArchiveNote>(_archiveNote);
    on<UnarchiveNote>(_unarchiveNote);
    on<EditNote>(_editNote);
    on<DeleteNote>(_deleteNote);
  }

  Note _getNoteFromId(String id) {
    return state.notes.firstWhere(
      (note) => note.id == id,
      orElse: () {
        throw ArgumentError('A note with this id does not exist');
      },
    );
  }

  void _selectNote(SelectNote event, Emitter<NoteState> emit) {
    final note = _getNoteFromId(event.id);
    emit(state.copyWith(
      selectedNote: note,
    ));
  }

  void _resetSelectedNote(ResetSelectedNote event, Emitter<NoteState> emit) {
    emit(state.copyWith(resetSelectedNote: true));
  }

  void _addNote(AddNote event, Emitter<NoteState> emit) {
    final newNote = Note(
      id: getUniqueId(),
      createdAt: DateTime.now(),
      title: event.title,
      tags: event.tags,
      note: event.note,
    );
    emit(state.copyWith(
      selectedNote: state.notes.isEmpty ? newNote : null,
      notes: [newNote, ...state.notes],
    ));
  }

  void _archiveNote(ArchiveNote event, Emitter<NoteState> emit) {
    final archivedNote = _getNoteFromId(event.id).copyWith(
      isArchived: true,
    );
    final updateNotes = state.notes
        .map((note) => note.id == archivedNote.id ? archivedNote : note)
        .toList();

    emit(state.copyWith(
      selectedNote:
          archivedNote.id == state.selectedNote?.id ? archivedNote : null,
      notes: updateNotes,
    ));
  }

  void _unarchiveNote(UnarchiveNote event, Emitter<NoteState> emit) {
    final unArchivedNote = _getNoteFromId(event.id).copyWith(
      isArchived: false,
    );
    final updateNotes = state.notes
        .map((note) => note.id == unArchivedNote.id ? unArchivedNote : note)
        .toList();

    emit(state.copyWith(
      selectedNote:
          unArchivedNote.id == state.selectedNote?.id ? unArchivedNote : null,
      notes: updateNotes,
    ));
  }

  void _editNote(EditNote event, Emitter<NoteState> emit) {
    final noteToEdit = _getNoteFromId(event.id);

    final updatedNote = noteToEdit.copyWith(
      updatedAt: DateTime.now(),
      title: event.title,
      tags: event.tags,
      note: event.note,
    );

    final updatedNotes = state.notes
        .map((note) => note.id == noteToEdit.id ? updatedNote : note)
        .toList();

    emit(state.copyWith(
      selectedNote: noteToEdit.id == state.selectedNote?.id ? noteToEdit : null,
      notes: updatedNotes,
    ));
  }

  void _deleteNote(DeleteNote event, Emitter<NoteState> emit) {
    final noteToDelete = _getNoteFromId(event.id);
    final updatedNotes =
        state.notes.where((note) => note.id != noteToDelete.id).toList();

    emit(state.copyWith(
      resetSelectedNote: noteToDelete.id == state.selectedNote?.id,
      notes: updatedNotes,
    ));
  }
}
