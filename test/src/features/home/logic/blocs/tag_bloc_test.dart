import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/logic/services/tag_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late TagBloc tagBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    tagBloc = TagBloc(localService: TagLocalService(prefs: prefs));
  });

  tearDown(() {
    tagBloc.close();
  });

  group('Tag Bloc -', () {
    final testTag = 'TestTag';
    final testTag2 = 'TestTag2';

    blocTest<TagBloc, TagState>(
      'emits [TagState] with an empty tag list when [GetTags] is added.',
      build: () => tagBloc,
      act: (bloc) => bloc.add(GetTags()),
      expect: () => [
        isA<TagState>().having(
          (state) => state.tags,
          'tags',
          [],
        ),
      ],
    );

    blocTest<TagBloc, TagState>(
      'emits [TagState] with a null selected tag when [GetSelectedTag] is added.',
      build: () => tagBloc,
      act: (bloc) => bloc.add(GetSelectedTag()),
      expect: () => [
        isA<TagState>().having(
          (state) => state.selectedTag,
          'selected tag',
          null,
        ),
      ],
    );

    blocTest<TagBloc, TagState>(
      'emits [TagState] with updated selected tag when [SelectTag] is added.',
      build: () => tagBloc,
      act: (bloc) => bloc.add(SelectTag(tag: testTag)),
      expect: () => [
        isA<TagState>().having(
          (state) => state.selectedTag,
          'selected tag',
          testTag,
        ),
      ],
    );

    blocTest<TagBloc, TagState>(
      'emits [TagState] with null selected tag when [ResetSelectedTag] is added.',
      build: () => tagBloc,
      act: (bloc) => bloc.add(ResetSelectedTag()),
      expect: () => [
        isA<TagState>().having(
          (state) => state.selectedTag,
          'selected tag',
          null,
        ),
      ],
    );

    blocTest<TagBloc, TagState>(
      'emits [TagState] with null selected tag when [AddTags] is added.',
      build: () => tagBloc,
      act: (bloc) => bloc.add(AddTags(tags: [testTag, testTag2])),
      expect: () => [
        isA<TagState>().having(
          (state) => state.tags,
          'tags',
          [testTag, testTag2],
        ),
      ],
    );

    blocTest<TagBloc, TagState>(
      'emits [TagState] with provided tags deleted from tag list when [DeleteTags] is added.',
      build: () => tagBloc,
      seed: () => TagState(tags: [testTag, testTag2]),
      act: (bloc) => bloc.add(DeleteTags(tags: [testTag])),
      expect: () => [
        isA<TagState>().having(
          (state) => state.tags,
          'tags',
          [testTag2],
        ),
      ],
    );
  });
}
