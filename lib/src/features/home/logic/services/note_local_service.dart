import 'dart:developer';

import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteLocalService {
  final SharedPreferences prefs;

  NoteLocalService({required this.prefs});

  Future<List<Note>> getNotes() async {
    try {
      List<String>? jsonList = prefs.getStringList('note_list');
      if (jsonList == null) return [];

      return jsonList.map((json) => Note.fromJson(json)).toList();
    } catch (e, stack) {
      log('error getting notes: $e at $stack');
      return [];
    }
  }

  Future<Note?> getSelectedNote() async {
    try {
      String? json = prefs.getString('selected_note');
      if (json == null) return null;

      return Note.fromJson(json);
    } catch (e, stack) {
      log('error getting notes: $e at $stack');
      return null;
    }
  }


  void changeSelectedNote(Note? note) async {
    try {
      if (note == null) {
        prefs.remove('selected_note');
      } else {
        prefs.setString('selected_note', note.toJson());
      }
    } catch (e, stack) {
      log('error changing selected note: $e at $stack');
    }
  }

  Future<void> addNote(Note note) async {
    try {
      List<String>? existingJsonList = prefs.getStringList('note_list');

      List<Note> existing = existingJsonList != null
          ? existingJsonList.map((json) => Note.fromJson((json))).toList()
          : [];

      if (!existing.any((b) => b.id == note.id)) {
        existing.add(note);
      }

      List<String> updatedJsonList =
          existing.map((preset) => preset.toJson()).toList();
      await prefs.setStringList('note_list', updatedJsonList);
    } catch (e, stack) {
      log('error creating note: $e at $stack');
    }
  }

  Future<void> editNote(Note updatedNote) async {
    try {
      List<String>? jsonList = prefs.getStringList('note_list');

      if (jsonList != null) {
        List<Note> existing = jsonList.map((json) {
          return Note.fromJson(json);
        }).toList();

        int index = existing.indexWhere((timer) => timer.id == updatedNote.id);

        if (index != -1) {
          existing[index] = updatedNote;
        }

        List<String> updatedJsonList =
            existing.map((timer) => timer.toJson()).toList();
        await prefs.setStringList('note_list', updatedJsonList);
      }
    } catch (e, stack) {
      log('error editing note: $e at $stack');
    }
  }

  Future<void> removeNote(String id) async {
    try {
      List<String>? jsonList = prefs.getStringList('note_list');

      if (jsonList != null) {
        List<Note> existing =
            jsonList.map((json) => Note.fromJson(json)).toList();

        existing.removeWhere((note) => note.id == id);

        List<String> updatedjsonList =
            existing.map((note) => note.toJson()).toList();
        await prefs.setStringList('note_list', updatedjsonList);
      }
    } catch (e, stack) {
      log('error removing note: $e at $stack');
    }
  }
}
