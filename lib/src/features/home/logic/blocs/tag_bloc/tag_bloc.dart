import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/logic/services/tag_local_service.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagLocalService localService;
  TagBloc({
    required this.localService,
  }) : super(TagState()) {
    on<GetSelectedTag>(_getSelectedTag);
    on<SelectTag>(_selectTag);
    on<ResetSelectedTag>(_resetSelectedTag);
    on<AddTags>(_addTags);
    on<DeleteTags>(_deleteTags);
  }

  void _getSelectedTag(GetSelectedTag event, Emitter<TagState> emit) async {
    final selectedTag = await localService.getSelectedTag();
    emit(state.copyWith(
      selectedTag: selectedTag,
    ));
  }

  void _selectTag(SelectTag event, Emitter<TagState> emit) {
    localService.selectTag(event.tag);
    emit(state.copyWith(
      selectedTag: event.tag,
    ));
  }

  void _resetSelectedTag(ResetSelectedTag event, Emitter<TagState> emit) {
    localService.selectTag(null);
    emit(state.copyWith(resetSelectedTag: true));
  }

  void _addTags(AddTags event, Emitter<TagState> emit) {
    final updatedTags = {...state.tags, ...event.tags}.toList();
    localService.createTags(event.tags);
    emit(state.copyWith(tags: updatedTags));
  }

  void _deleteTags(DeleteTags event, Emitter<TagState> emit) {
    final updatedTags =
        state.tags.where((tag) => !event.tags.contains(tag)).toList();
    localService.removeTags(event.tags);
    emit(state.copyWith(tags: updatedTags));
  }
}
