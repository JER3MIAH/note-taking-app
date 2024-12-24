import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  TagBloc() : super(TagState()) {
    on<SelectTag>(_selectTag);
    on<ResetSelectedTag>(_resetSelectedTags);
    on<AddTags>(_addTags);
    on<DeleteTags>(_deleteTags);
  }

  void _selectTag(SelectTag event, Emitter<TagState> emit) {}
  void _resetSelectedTags(ResetSelectedTag event, Emitter<TagState> emit) {}
  void _addTags(AddTags event, Emitter<TagState> emit) {}
  void _deleteTags(DeleteTags event, Emitter<TagState> emit) {}
}
