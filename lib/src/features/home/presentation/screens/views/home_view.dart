import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (_, state) {
        return AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'All Notes',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            YBox(20),
            if (state.notes.isEmpty)
              EmptyStateContainer(
                text:
                    'You don’t have any notes yet. Start a new note to capture your thoughts and ideas.',
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.notes.length,
                  (index) {
                    final note = state.notes[index];
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
              ),
          ],
        );
      },
    );
  }
}
