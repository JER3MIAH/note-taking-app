import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/services/note_local_service.dart';
import 'package:note_taking_app/src/features/home/logic/services/tag_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late NoteBloc noteBloc;
  late TagBloc tagBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    tagBloc = TagBloc(localService: TagLocalService(prefs: prefs));
    noteBloc = NoteBloc(
      localService: NoteLocalService(prefs: prefs),
      tagBloc: tagBloc,
    );
  });

  tearDown(() {
    tagBloc.close();
    noteBloc.close();
  });

  group('Note Bloc -', () {
    final testNote = Note.testValues();
    final testNote2 = Note.testValues().copyWith(
      id: 'id2',
      title: 'title 2',
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteState] with an empty note list when [GetNotes] is added.',
      build: () => noteBloc,
      act: (bloc) => bloc.add(GetNotes()),
      expect: () => [
        isA<NoteState>().having(
          (state) => state.notes,
          'notes',
          [],
        ),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteState] with a null selected note when [GetSelectedNote] is added.',
      build: () => noteBloc,
      act: (bloc) => bloc.add(GetSelectedNote()),
      expect: () => [
        isA<NoteState>().having(
          (state) => state.selectedNote,
          'selected note',
          null,
        ),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteState] with update selectedNote when [SelectNote] is added.',
      build: () => noteBloc,
      seed: () => NoteState(notes: [testNote, testNote2]),
      act: (bloc) => bloc.add(SelectNote(id: testNote.id)),
      expect: () => [
        isA<NoteState>().having(
          (state) => state.selectedNote,
          'selected note',
          testNote,
        ),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteState] with null selectedNote value when [ResetSelectedNote] is added.',
      build: () => noteBloc,
      seed: () => NoteState(selectedNote: testNote2),
      act: (bloc) => bloc.add(ResetSelectedNote()),
      expect: () => [
        isA<NoteState>().having(
          (state) => state.selectedNote,
          'selected note',
          null,
        ),
      ],
    );

    group('Add Note -', () {
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with a ... when [AddNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(AddNote(
          title: 'new note',
          tags: ['tag1', 'tag2'],
          note: '...',
        )),
        expect: () => [
          isA<NoteState>()
              .having(
                (state) => state.notes,
                'notes',
                isNotEmpty,
              )
              .having(
                (state) => state.notes.first.title,
                'title',
                'new note',
              )
              .having(
            (state) => state.notes.first.tags,
            'tags',
            ['tag1', 'tag2'],
          ).having(
            (state) => state.notes.first.note,
            'note',
            '...',
          ),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with a selectedNote being the added note if notes was previously empty when [AddNote] is added.',
        build: () => noteBloc,
        act: (bloc) => bloc.add(AddNote(
          title: 'new note',
          tags: ['tag1', 'tag2'],
          note: '...',
        )),
        expect: () => [
          isA<NoteState>()
              .having(
            (state) => state.selectedNote?.title,
            'title',
            'new note',
          )
              .having(
            (state) => state.selectedNote?.tags,
            'tags',
            ['tag1', 'tag2'],
          ).having(
            (state) => state.selectedNote?.note,
            'note',
            '...',
          ),
        ],
      );
    });

    group('Archive Note -', () {
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with archived note when [ArchiveNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(ArchiveNote(id: testNote2.id)),
        expect: () => [
          isA<NoteState>().having(
            (state) => state.notes[1].isArchived,
            'note archive status',
            true,
          ),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with selectedNote set to archived if archived note is bring archived when [ArchiveNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(ArchiveNote(id: testNote.id)),
        expect: () => [
          isA<NoteState>().having(
            (state) => state.selectedNote?.isArchived,
            'selected note archive status',
            true,
          ),
        ],
      );
    });

    group('Unarchive Note -', () {
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with note unarchived when [UnarchiveNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: null,
          notes: [
            testNote.copyWith(isArchived: true),
            testNote2.copyWith(isArchived: true),
          ],
        ),
        act: (bloc) => bloc.add(UnarchiveNote(id: testNote2.id)),
        expect: () => [
          isA<NoteState>().having(
            (state) => state.notes[1].isArchived,
            'note archive status',
            false,
          ),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with selectedNote set to archived if archived note is bring archived when [UnarchiveNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote.copyWith(isArchived: true),
          notes: [
            testNote.copyWith(isArchived: true),
            testNote2,
          ],
        ),
        act: (bloc) => bloc.add(UnarchiveNote(id: testNote.id)),
        expect: () => [
          isA<NoteState>()
              .having(
                (state) => state.selectedNote?.isArchived,
                'selected note archive status',
                false,
              )
              .having(
                (state) => state.notes.first.isArchived,
                'note archive status',
                false,
              ),
        ],
      );
    });

    group('Edit Note -', () {
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with note edited when [EditNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(
          EditNote(
            id: testNote2.id,
            title: 'new title',
            tags: ['newTag1', 'newTag2'],
            note: 'new note',
          ),
        ),
        expect: () => [
          isA<NoteState>()
              .having(
            (state) => state.notes[1].title,
            'updated note title',
            'new title',
          )
              .having(
            (state) => state.notes[1].tags,
            'updated note tags',
            ['newTag1', 'newTag2'],
          ).having(
            (state) => state.notes[1].note,
            'updated note content',
            'new note',
          ),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with selected note edited(if selectedNote is being edited) when [EditNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(
          EditNote(
            id: testNote.id,
            title: 'new title',
            tags: ['newTag1', 'newTag2'],
            note: 'new note',
          ),
        ),
        expect: () => [
          isA<NoteState>()
              .having(
                (state) => state.selectedNote?.title,
                'updated selected note title',
                'new title',
              )
              .having(
                (state) => state.selectedNote?.tags,
                'updated selected note tags',
                ['newTag1', 'newTag2'],
              )
              .having(
                (state) => state.selectedNote?.note,
                'updated selected note content',
                'new note',
              )
              .having(
                (state) => state.notes.first.title,
                'updated note in list title',
                'new title',
              ),
        ],
      );
    });

    group('Delete Note -', () {
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with provided note deleted when [DeleteNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(
          DeleteNote(id: testNote2.id),
        ),
        expect: () => [
          isA<NoteState>().having(
            (state) => state.notes,
            'notes',
            [testNote],
          ),
        ],
      );
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with selected note changed to next note in the list(if selectedNote is deleted) when [DeleteNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote, testNote2],
        ),
        act: (bloc) => bloc.add(
          DeleteNote(id: testNote.id),
        ),
        expect: () => [
          isA<NoteState>().having(
            (state) => state.notes,
            'notes',
            [testNote2],
          ).having(
            (state) => state.selectedNote?.id,
            'selected note id',
            testNote2.id,
          ),
        ],
      );
      blocTest<NoteBloc, NoteState>(
        'emits [NoteState] with selected note reset to null(if deleted note was the only item in the list) when [DeleteNote] is added.',
        build: () => noteBloc,
        seed: () => NoteState(
          selectedNote: testNote,
          notes: [testNote],
        ),
        act: (bloc) => bloc.add(
          DeleteNote(id: testNote.id),
        ),
        expect: () => [
          NoteState(
            selectedNote: null,
            notes: [],
          )
        ],
      );
    });
  });
}
