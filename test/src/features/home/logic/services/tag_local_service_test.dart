import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/logic/services/tag_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late TagLocalService localService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = TagLocalService(prefs: prefs);
  });

  group('Tag Local Service -', () {
    final testTag = 'TestTag';
    final testTag2 = 'TestTag2';

    test(
        'The initial values of [tags] and [selectedTags] is [] and null respectively',
        () async {
      final tags = await localService.getTags();
      final selectedTag = await localService.getSelectedTag();
      expect(tags, []);
      expect(selectedTag, null);
    });
    test('[selectTag] updates the selectedTag value with provided tag',
        () async {
      await localService.selectTag(testTag);
      final selectedTag = await localService.getSelectedTag();
      expect(selectedTag, testTag);
    });

    test('created tags are added to the tag list', () async {
      await localService.createTags([testTag]);
      final tags = await localService.getTags();
      expect(tags, [testTag]);
    });

    test('[removeTags] removes provided tags from the tag list', () async {
      await localService.createTags([testTag, testTag2]);
      await localService.removeTags([testTag]);
      final tags = await localService.getTags();
      expect(tags, [testTag2]);
    });
  });
}
