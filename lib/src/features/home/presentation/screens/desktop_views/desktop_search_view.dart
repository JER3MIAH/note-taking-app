import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/cubits.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopSearchSideView extends HookWidget {
  const DesktopSearchSideView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<SearchFilterCubit, String>(
      builder: (_, searchFilter) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesktopCreateNewNoteButton(),
            YBox(5),
            Text.rich(
              TextSpan(
                text: 'All notes with the ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: theme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: '”$searchFilter”',
                    style: TextStyle(
                      color: theme.onPrimary,
                    ),
                  ),
                  TextSpan(
                    text: ' tag are shown here.',
                    style: TextStyle(
                      color: theme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            YBox(6),
            BlocBuilder<NoteBloc, NoteState>(
              builder: (_, state) {
                final filteredNotes = state.notes.where((note) {
                  final searchText = searchFilter.toLowerCase();
                  return note.title.toLowerCase().contains(searchText) ||
                      note.note.toLowerCase().contains(searchText) ||
                      note.tags
                          .any((tag) => tag.toLowerCase().contains(searchText));
                }).toList();

                if (filteredNotes.isEmpty && searchFilter.isNotEmpty) {
                  return EmptyStateContainer(
                    text:
                        'No notes match your search. Try a different keyword or ',
                    onCreateNewNote: () {
                      //TODO:
                    },
                  );
                }

                return Column(
                  children: List.generate(
                    searchFilter.isEmpty ? 0 : filteredNotes.length,
                    (index) {
                      final note = filteredNotes[index];
                      return NoteTile(
                        note: note,
                        onTap: () {
                          context.read<NoteBloc>().add(SelectNote(id: note.id));
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
