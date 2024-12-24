import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState()) {
    on<SelectNote>(_selectNote);
    on<ResetSelectedNote>(_resetSelectedNote);
    on<AddNote>(_addNote);
    on<ArchiveNote>(_archiveNote);
    on<UnarchiveNote>(_unarchiveNote);
    on<EditNote>(_editNote);
    on<DeleteNote>(_deleteNote);
  }

  void _selectNote(SelectNote event, Emitter<NoteState> emit) {}
  void _resetSelectedNote(ResetSelectedNote event, Emitter<NoteState> emit) {}
  void _addNote(AddNote event, Emitter<NoteState> emit) {}
  void _archiveNote(ArchiveNote event, Emitter<NoteState> emit) {}
  void _unarchiveNote(UnarchiveNote event, Emitter<NoteState> emit) {}
  void _editNote(EditNote event, Emitter<NoteState> emit) {}
  void _deleteNote(DeleteNote event, Emitter<NoteState> emit) {}
}
