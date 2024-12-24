import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:note_taking_app/src/features/home/logic/services/note_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late NoteLocalService localService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = NoteLocalService(prefs: prefs);
  });

  group('Note Local Service -', () {
    final testNote = Note.testValues();
    final testNote2 = Note.testValues().copyWith(title: 'new title');

    test(
        'The initial values of [notes] and [selectedNotes] is [] and null respectively',
        () async {
      final notes = await localService.getNotes();
      final selectedNote = await localService.getSelectedNote();
      expect(notes, []);
      expect(selectedNote, null);
    });

    test('[changeSelectedNote] updates the selected note to the provided value',
        () async {
      localService.changeSelectedNote(testNote);
      final selectedNote = await localService.getSelectedNote();
      expect(selectedNote, testNote);

      localService.changeSelectedNote(null);
      final selectedNote2 = await localService.getSelectedNote();
      expect(selectedNote2, null);
    });

    test('[addNote] updates the note list with provided note', () async {
      await localService.addNote(testNote);
      final notes = await localService.getNotes();

      expect(notes, [testNote]);
    });

    test('[editNote] updates the note list with provided note', () async {
      await localService.addNote(testNote);
      await localService.editNote(testNote2);
      final notes = await localService.getNotes();

      expect(notes, [testNote2]);
    });

    test('[removeNote] removes provided note from the note list', () async {
      await localService.addNote(testNote);
      await localService.removeNote(testNote.id);
      final notes = await localService.getNotes();

      expect(notes, []);
    });
  });
}
