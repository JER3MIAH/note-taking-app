import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final searchController = useTextEditingController();
    final searchFilter = useState<String>('');

    return AppColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Search',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        YBox(20),
        AppTextField(
          controller: searchController,
          hintText: 'Search by title, content, or tags…',
          onChanged: (value) {
            searchFilter.value = searchController.text.trim();
          },
        ),
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
                text: '”${searchFilter.value}”',
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
        YBox(20),
        BlocBuilder<NoteBloc, NoteState>(
          builder: (_, state) {
            final filteredNotes = state.notes.where((note) {
              final searchText = searchFilter.value.toLowerCase();
              return note.title.toLowerCase().contains(searchText) ||
                  note.note.toLowerCase().contains(searchText) ||
                  note.tags
                      .any((tag) => tag.toLowerCase().contains(searchText));
            }).toList();

            if (filteredNotes.isEmpty && searchFilter.value.isNotEmpty) {
              return EmptyStateContainer(
                text:
                    'No notes match your search. Try a different keyword or create a new note.',
              );
            }

            return Column(
              children: List.generate(
                filteredNotes.length,
                (index) {
                  final note = filteredNotes[index];
                  return NoteTile(note: note);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
