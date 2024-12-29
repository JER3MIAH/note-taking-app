import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/side_bar_nav_cubit.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopMainScreen extends HookWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      body: BlocBuilder<SideBarNavCubit, SideBarItem>(
        builder: (_, selectedItem) {
          return Row(
            children: [
              DesktopSidebar(),
              BlocBuilder<TagBloc, TagState>(
                builder: (_, tagState) {
                  return DesktopLayout(
                    searchController: searchController,
                    topTitle: switch (selectedItem) {
                      SideBarItem.allNotes => 'All Notes',
                      SideBarItem.archivedNotes => 'Archived Notes',
                      SideBarItem.tag => '',
                      SideBarItem.colorTheme => 'Settings',
                      SideBarItem.fontTheme => 'Settings',
                      SideBarItem.changePassword => 'Settings',
                    },
                    tag: selectedItem == SideBarItem.tag &&
                            tagState.selectedTag != null
                        ? tagState.selectedTag!
                        : '',
                    sideContent: switch (selectedItem) {
                      SideBarItem.allNotes => Placeholder(),
                      SideBarItem.archivedNotes => Placeholder(),
                      SideBarItem.tag => Placeholder(),
                      SideBarItem.colorTheme => Placeholder(),
                      SideBarItem.fontTheme => Placeholder(),
                      SideBarItem.changePassword => Placeholder(),
                    },
                    body: switch (selectedItem) {
                      SideBarItem.allNotes => Placeholder(),
                      SideBarItem.archivedNotes => Placeholder(),
                      SideBarItem.tag => Placeholder(),
                      SideBarItem.colorTheme => Placeholder(),
                      SideBarItem.fontTheme => Placeholder(),
                      SideBarItem.changePassword => Placeholder(),
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
