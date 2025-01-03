import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/cubits.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/features/home/presentation/screens/desktop_views/desktop_views.dart';
import 'package:note_taking_app/src/features/settings/presentation/screens/desktop_views/desktop_views.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopMainScreen extends HookWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      body: BlocConsumer<SideBarNavCubit, SideBarItem>(
        listener: (_, selectedItem) {
          if (selectedItem != SideBarItem.search) {
            searchController.clear();
            context.read<SearchFilterCubit>().setFilter('');
          }
        },
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
                      SideBarItem.search => '',
                      SideBarItem.colorTheme => 'Settings',
                      SideBarItem.fontTheme => 'Settings',
                    },
                    tag: selectedItem == SideBarItem.tag &&
                            tagState.selectedTag != null
                        ? tagState.selectedTag!
                        : '',
                    sideContent: switch (selectedItem) {
                      SideBarItem.allNotes => DesktopAllNotesSideView(),
                      SideBarItem.archivedNotes =>
                        DesktopArchivedNotesSideView(),
                      SideBarItem.tag => tagState.selectedTag == null
                          ? Container()
                          : DesktopTagView(
                              tag: tagState.selectedTag!,
                            ),
                      SideBarItem.search => DesktopSearchSideView(),
                      SideBarItem.colorTheme => SettingsDesktopSideView(),
                      SideBarItem.fontTheme => SettingsDesktopSideView(),
                    },
                    body: switch (selectedItem) {
                      SideBarItem.allNotes ||
                      SideBarItem.archivedNotes ||
                      SideBarItem.tag ||
                      SideBarItem.search =>
                        DesktopCreateOrViewNote(),
                      SideBarItem.colorTheme => ColorThemeDesktopView(),
                      SideBarItem.fontTheme => FontThemeDesktopView(),
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
