import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/logic/services/tag_local_service.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagLocalService localService;
  TagBloc({
    required this.localService,
  }) : super(TagState()) {
    on<SelectTag>(_selectTag);
    on<ResetSelectedTag>(_resetSelectedTags);
    on<AddTags>(_addTags);
    on<DeleteTags>(_deleteTags);
  }

  void _selectTag(SelectTag event, Emitter<TagState> emit) {
    emit(state.copyWith(
      selectedTag: event.tag,
    ));
  }

  void _resetSelectedTags(ResetSelectedTag event, Emitter<TagState> emit) {
    emit(state.copyWith(resetSelectedTag: true));
  }

  void _addTags(AddTags event, Emitter<TagState> emit) {
    final updatedTags = {...state.tags, ...event.tags}.toList();
    emit(state.copyWith(tags: updatedTags));
  }

  void _deleteTags(DeleteTags event, Emitter<TagState> emit) {
    final updatedTags =
        state.tags.where((tag) => !event.tags.contains(tag)).toList();
    emit(state.copyWith(tags: updatedTags));
  }
}
