import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/data/models/note.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'All Notes',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        YBox(20),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            2,
            (index) {
              // final note = [index];
              return NoteTile(
                note: Note.testValues(),
              );
            },
          ),
        ),
      ],
    );
  }
}
