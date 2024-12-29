import 'package:flutter/material.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopMainScreen extends StatelessWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DesktopSidebar(),
          DesktopLayout(
            topContent: Row(
              children: [],
            ),
            sideContent: Column(
              children: [],
            ),
            body: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
