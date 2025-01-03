import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/cubits.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopLayout extends HookWidget {
  final String topTitle;
  final String tag;
  final Widget sideContent;
  final Widget body;
  final TextEditingController searchController;

  const DesktopLayout({
    super.key,
    this.topTitle = '',
    this.tag = '',
    required this.sideContent,
    required this.body,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final sideBarCubit = context.read<SideBarNavCubit>();

    return Expanded(
      child: BlocBuilder<SearchFilterCubit, String>(
        builder: (_, searchFilter) {
          return Column(
            children: [
              Container(
                height: 81,
                // width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: spacing400),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: theme.inversePrimary,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (searchFilter.isNotEmpty)
                      Expanded(
                        child: Text.rich(
                          overflow: TextOverflow.ellipsis,
                          TextSpan(
                            text: 'Showing results for: ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: theme.onSurfaceVariant,
                            ),
                            children: [
                              TextSpan(
                                text: searchFilter,
                                style: TextStyle(
                                  color: theme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (tag.isNotEmpty)
                      Expanded(
                        child: Text.rich(
                          overflow: TextOverflow.ellipsis,
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
                      )
                    else
                      AppText(
                        topTitle,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: theme.onSurface,
                      ),
                    XBox(20),
                    Row(
                      spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextField(
                          leadingIcon: iconSearch,
                          controller: searchController,
                          hintText: 'Search by title, content, or tags…',
                          onChanged: (value) {
                            context.read<NoteBloc>().add(ResetSelectedNote());
                            context.read<SearchFilterCubit>().setFilter(value);
                            if (value.isNotEmpty) {
                              sideBarCubit.setSideBarItem(SideBarItem.search);
                            } else {
                              sideBarCubit.setSideBarItem(SideBarItem.allNotes);
                            }
                          },
                        ),
                        AppIconButton(
                          icon: iconSettings,
                          height: 28,
                          onTap: () {
                            if (sideBarCubit.state != SideBarItem.colorTheme &&
                                sideBarCubit.state != SideBarItem.fontTheme) {
                              sideBarCubit
                                  .setSideBarItem(SideBarItem.colorTheme);
                              searchController.clear();
                              searchFilter = '';
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 272,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(
                        vertical: spacing250,
                        horizontal: spacing200,
                      ).copyWith(left: spacing400),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: theme.inversePrimary,
                          ),
                        ),
                      ),
                      child: ScrollConfiguration(
                        behavior: NoThumbScrollBehavior(),
                        child: SingleChildScrollView(child: sideContent),
                      ),
                    ),
                    Expanded(child: body),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
