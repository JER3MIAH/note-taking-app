import 'package:equatable/equatable.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';

class NoteState extends Equatable {
  final Note? selectedNote;
  final List<Note> notes;
  const NoteState({
    this.selectedNote,
    this.notes = const [],
  });

  @override
  List<Object> get props => [selectedNote ?? '', notes];

  NoteState copyWith({
    Note? selectedNote,
    List<Note>? notes,
  }) {
    return NoteState(
      selectedNote: selectedNote ?? this.selectedNote,
      notes: notes ?? this.notes,
    );
  }
}