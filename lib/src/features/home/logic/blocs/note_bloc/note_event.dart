import 'package:equatable/equatable.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetSelectedNote extends NoteEvent {
  const GetSelectedNote();
}

class GetNotes extends NoteEvent {
  const GetNotes();
}

class SelectNote extends NoteEvent {
  final String id;
  const SelectNote({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class ResetSelectedNote extends NoteEvent {
  const ResetSelectedNote();
}

class AddNote extends NoteEvent {
  final String title;
  final List<String> tags;
  final String note;
  const AddNote({
    required this.title,
    required this.tags,
    required this.note,
  });

  @override
  List<Object> get props => [title, tags, note];
}

class ArchiveNote extends NoteEvent {
  final String id;
  const ArchiveNote({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class UnarchiveNote extends NoteEvent {
  final String id;
  const UnarchiveNote({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class EditNote extends NoteEvent {
  final String id;
  final String title;
  final List<String> tags;
  final String note;
  const EditNote({
    required this.id,
    required this.title,
    required this.tags,
    required this.note,
  });

  @override
  List<Object> get props => [id, title, tags, note];
}

class DeleteNote extends NoteEvent {
  final String id;
  const DeleteNote({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
