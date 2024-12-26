import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: [
        AppText('Home View')
      ],
    );
  }
}
