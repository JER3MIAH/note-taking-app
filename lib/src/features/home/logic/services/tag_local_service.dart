import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class TagLocalService {
  final SharedPreferences prefs;

  TagLocalService({required this.prefs});

  Future<List<String>> getTags() async {
    try {
      List<String>? tagList = prefs.getStringList('tag_list');
      if (tagList == null) return [];
      return tagList;
    } catch (e, stack) {
      log('Error getting tags: $e at $stack');
      return [];
    }
  }

  Future<String?> getSelectedTag() async {
    try {
      String? tag = prefs.getString('selected_tag');
      if (tag == null) return null;
      return tag;
    } catch (e, stack) {
      log('Error getting selected tag: $e at $stack');
      return null;
    }
  }

  Future<void> createTags(List<String> tags) async {
    try {
      List<String>? currentTags = prefs.getStringList('tag_list') ?? [];
      final updatedTags = {...currentTags, ...tags}.toList();
      await prefs.setStringList('tag_list', updatedTags);
      log('Tags created successfully: $tags');
    } catch (e, stack) {
      log('Error creating tags: $e at $stack');
    }
  }

  Future<void> removeTags(List<String> tags) async {
    try {
      List<String>? currentTags = prefs.getStringList('tag_list');
      if (currentTags == null) return;

      final updatedTags =
          currentTags.where((tag) => !tags.contains(tag)).toList();
      await prefs.setStringList('tag_list', updatedTags);
      log('Tags removed successfully: $tags');
    } catch (e, stack) {
      log('Error removing tags: $e at $stack');
    }
  }

  Future<void> selectTag(String? tag) async {
    try {
      if (tag == null) {
        await prefs.remove('selected_tag');
        log('Selected tag reset to null');
      } else {
        await prefs.setString('selected_tag', tag);
        log('Selected tag saved: $tag');
      }
    } catch (e, stack) {
      log('Error saving selected tag: $e at $stack');
    }
  }
}
