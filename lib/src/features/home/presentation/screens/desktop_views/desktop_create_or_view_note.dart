import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_state.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/tag_hint_multiline_cubit.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopCreateOrViewNote extends HookWidget {
  const DesktopCreateOrViewNote({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final noteBloc = context.read<NoteBloc>();
    final note = noteBloc.state.selectedNote;
    var titleController = useTextEditingController(text: note?.title);
    var tagsController = useTextEditingController(text: note?.tags.join(', '));
    var contentController = useTextEditingController(text: note?.note);

    void showWarning(String title) {
      AppSnackbar.show(
        context,
        title: title,
        isWarning: true,
      );
    }

    return BlocBuilder<NoteBloc, NoteState>(
      builder: (_, noteState) {
        final note = noteState.selectedNote;
        if (note == null) {
          return Container();
        }

        titleController.text = note.title;
        tagsController.text = note.tags.join(', ');
        contentController.text = note.note;

        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(spacing200),
                child: Column(
                  children: [
                    PlainTextField(
                      isHeader: true,
                      controller: titleController,
                      hintText: 'Enter a title...',
                    ),
                    Row(
                      children: [
                        IconText(
                          icon: iconTag,
                          title: 'Tags',
                        ),
                        BlocProvider(
                          create: (context) => TagHintMultilineCubit(),
                          child: BlocBuilder<TagHintMultilineCubit, bool>(
                            builder: (context, tagHintMultiline) {
                              final cubit =
                                  context.read<TagHintMultilineCubit>();
                              return Expanded(
                                child: PlainTextField(
                                  controller: tagsController,
                                  keyboardType: TextInputType.text,
                                  hintMaxLines: tagHintMultiline ? 1 : null,
                                  hintText:
                                      'Add tags separated by commas (e.g. Work, Planning)',
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      cubit.setValue(true);
                                    } else {
                                      cubit.setValue(false);
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    if (note.isArchived)
                      Row(
                        children: [
                          IconText(
                            icon: iconStatus,
                            title: 'Status',
                          ),
                          AppText(
                            'Archived',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: theme.onSurface,
                          )
                        ],
                      ),
                    Row(
                      children: [
                        IconText(
                          icon: iconClock,
                          title: 'Last edited',
                        ),
                        AppText(
                          note.updatedAt != null
                              ? formatDate(note.updatedAt!)
                              : 'Not yet saved',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: theme.onSurface,
                        )
                      ],
                    ),
                    const HorizontalLine(hasMargin: true),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PlainTextField(
                              controller: contentController,
                              hintText: 'Start typing your note here…',
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const HorizontalLine(hasMargin: true),
                              YBox(5),
                              Row(
                                spacing: 10,
                                children: [
                                  AppButton(
                                    title: 'Save',
                                    bHeight: 41,
                                    onTap: () {
                                      if (titleController.text.trim().isEmpty) {
                                        showWarning(emptyTitle);
                                        return;
                                      }
                                      if (tagsController.text.trim().isEmpty) {
                                        showWarning(emptyTags);
                                        return;
                                      }
                                      if (contentController.text
                                          .trim()
                                          .isEmpty) {
                                        showWarning(emptyNoteContent);
                                        return;
                                      }
                                      noteBloc.add(
                                        EditNote(
                                          id: note.id,
                                          title: titleController.text.trim(),
                                          tags: parseTags(
                                              tagsController.text.trim()),
                                          note: contentController.text.trim(),
                                        ),
                                      );
                                      AppSnackbar.show(context,
                                          title: noteSaved);
                                    },
                                  ),
                                  AppButton(
                                    title: 'Cancel',
                                    bHeight: 41,
                                    color: theme.primaryFixed,
                                    onTap: () {
                                      if (note.title.isEmpty) {
                                        noteBloc.add(DeleteNote(id: note.id));
                                      }
                                      noteBloc.add(ResetSelectedNote());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: theme.inversePrimary),
                ),
              ),
              child: note.title.isEmpty
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(spacing200),
                      child: Column(
                        spacing: 10,
                        children: [
                          AppOutlinedButton(
                            title: note.isArchived
                                ? 'Restore Note'
                                : 'Archive Note',
                            icon: note.isArchived ? iconRestore : iconArchive,
                            onTap: () {
                              if (note.isArchived) {
                                noteBloc.add(UnarchiveNote(id: note.id));
                                AppSnackbar.show(context,
                                    title: noteUnarchived);
                              } else {
                                AppDialog.dialog(
                                  context,
                                  ArchiveNoteDialog(
                                    note: note,
                                    onArchive: () {
                                      noteBloc.add(ArchiveNote(id: note.id));
                                      AppSnackbar.show(context,
                                          title: noteArchived);
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          AppOutlinedButton(
                            title: 'Delete Note',
                            icon: iconDelete,
                            onTap: () {
                              AppDialog.dialog(
                                context,
                                DeleteNoteDialog(
                                  note: note,
                                  onDelete: () {
                                    noteBloc.add(DeleteNote(id: note.id));
                                    AppSnackbar.show(context,
                                        title: noteDeleted);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      )),
            ),
          ],
        );
      },
    );
  }
}
