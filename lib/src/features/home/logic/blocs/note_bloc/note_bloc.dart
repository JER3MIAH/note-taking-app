import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/services/note_local_service.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteLocalService localService;
  final TagBloc tagBloc;
  NoteBloc({
    required this.localService,
    required this.tagBloc,
  }) : super(NoteState()) {
    on<GetSelectedNote>(_getSelectedNote);
    on<GetNotes>(_getNotes);
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

  void _getSelectedNote(GetSelectedNote event, Emitter<NoteState> emit) async {
    final note = await localService.getSelectedNote();
    emit(state.copyWith(
      selectedNote: note,
    ));
  }

  void _getNotes(GetNotes event, Emitter<NoteState> emit) async {
    final notes = await localService.getNotes();
    emit(state.copyWith(
      notes: notes,
    ));
  }

  void _selectNote(SelectNote event, Emitter<NoteState> emit) {
    final note = _getNoteFromId(event.id);
    localService.changeSelectedNote(note);
    emit(state.copyWith(
      selectedNote: note,
    ));
  }

  void _resetSelectedNote(ResetSelectedNote event, Emitter<NoteState> emit) {
    localService.changeSelectedNote(null);
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
    localService.addNote(newNote);
    if (state.notes.isEmpty) {
      localService.changeSelectedNote(newNote);
    }
    emit(state.copyWith(
      selectedNote: state.notes.isEmpty ? newNote : null,
      notes: [newNote, ...state.notes],
    ));
    _addTags(event.tags);
  }

  void _archiveNote(ArchiveNote event, Emitter<NoteState> emit) {
    final archivedNote = _getNoteFromId(event.id).copyWith(
      isArchived: true,
    );
    final updateNotes = state.notes
        .map((note) => note.id == archivedNote.id ? archivedNote : note)
        .toList();

    localService.editNote(archivedNote);
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

    localService.editNote(unArchivedNote);
    emit(state.copyWith(
      selectedNote: event.id == state.selectedNote?.id ? unArchivedNote : null,
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
        .map((note) => note.id == event.id ? updatedNote : note)
        .toList();

    localService.editNote(updatedNote);
    emit(state.copyWith(
      selectedNote: event.id == state.selectedNote?.id ? updatedNote : null,
      notes: updatedNotes,
    ));

    _addTags(event.tags);
    _removeTags();
  }

  void _deleteNote(DeleteNote event, Emitter<NoteState> emit) {
    final noteToDelete = _getNoteFromId(event.id);
    final updatedNotes =
        state.notes.where((note) => note.id != noteToDelete.id).toList();

    localService.removeNote(noteToDelete.id);

    final newSelectedNote = state.selectedNote?.id == noteToDelete.id
        ? (updatedNotes.isNotEmpty ? updatedNotes.first : null)
        : state.selectedNote;

    emit(state.copyWith(
      selectedNote: newSelectedNote,
      resetSelectedNote: newSelectedNote == null,
      notes: updatedNotes,
    ));

    _removeTags();
  }

//*-------------------------------------------------------------
  void _addTags(List<String> tags) {
    final allTags = tagBloc.state.tags;
    List<String> newTags = [];
    for (var tag in tags) {
      if (!allTags.contains(tag)) {
        newTags.add(tag);
      }
    }
    tagBloc.add(AddTags(tags: newTags));
  }

  /// Remove unused tags
  void _removeTags() {
    final allTags = tagBloc.state.tags;
    List<String> tagsToDelete = [];

    bool noNoteHasThisTag(String tag) {
      return state.notes.every((note) => !(note.tags.contains(tag)));
    }

    for (var tag in allTags) {
      if (noNoteHasThisTag(tag)) {
        tagsToDelete.add(tag);
      }
    }
    tagBloc.add(DeleteTags(tags: tagsToDelete));
  }
}
