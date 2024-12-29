import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/side_bar_nav_cubit.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final tagBloc = context.read<TagBloc>();
    final noteBloc = context.read<NoteBloc>();
    final sideBarCubit = context.read<SideBarNavCubit>();

    return BlocBuilder<SideBarNavCubit, SideBarItem>(
      builder: (_, selectedItem) {
        return Container(
          width: 272,
          padding: EdgeInsets.symmetric(
            vertical: spacing150,
            horizontal: spacing200,
          ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: theme.inversePrimary,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLogo(),
              YBox(20),
              SideBarTile(
                icon: iconHome,
                title: 'All Notes',
                isSelected: selectedItem == SideBarItem.allNotes,
                onTap: () {
                  sideBarCubit.setSideBarItem(SideBarItem.allNotes);
                },
              ),
              YBox(10),
              SideBarTile(
                icon: iconArchive,
                title: 'Archived Notes',
                isSelected: selectedItem == SideBarItem.archivedNotes,
                onTap: () {
                  sideBarCubit.setSideBarItem(SideBarItem.archivedNotes);
                },
              ),
              HorizontalLine(hasMargin: true),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 5),
                child: AppText(
                  'Tags',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: appColors.neutral500,
                ),
              ),
              BlocBuilder<TagBloc, TagState>(
                builder: (_, tagState) {
                  return Column(
                    spacing: 5,
                    children: List.generate(
                      tagState.tags.length,
                      (index) {
                        final tag = tagState.tags[index];
                        return TagsTile(
                          title: tag,
                          isSelected: tag == tagState.selectedTag &&
                              selectedItem == SideBarItem.tag,
                          isDesktop: true,
                          onTap: () {
                            sideBarCubit.setSideBarItem(SideBarItem.tag);
                            tagBloc.add(SelectTag(tag: tag));
                            noteBloc.add(ResetSelectedNote());
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
      },
    );
  }
}
