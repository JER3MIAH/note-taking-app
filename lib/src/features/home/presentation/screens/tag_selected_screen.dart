import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class TagSelectedScreen extends StatelessWidget {
  final String tag;
  const TagSelectedScreen({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppScaffold(
      body: AppColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBackButton(title: 'All Tags'),
          YBox(10),
          Text.rich(
            TextSpan(
              text: 'Notes Tagged: ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: theme.onSurfaceVariant,
              ),
              children: [
                TextSpan(
                  text: tag,
                  style: TextStyle(
                    color: theme.onPrimary,
                  ),
                ),
              ],
            ),
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
                  text: '”$tag”',
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
              final filteredNotes =
                  state.notes.where((note) => note.tags.contains(tag)).toList();

              return Column(
                children: List.generate(
                  filteredNotes.length,
                  (index) {
                    final note = filteredNotes[index];
                    return NoteTile(
                      note: note,
                      onTap: () {
                        AppNavigator(context).pushNamed(
                          HomeRoutes.createOrViewNote,
                          args: note,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
