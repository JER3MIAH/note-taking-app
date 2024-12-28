import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class CreateOrViewNoteScreen extends HookWidget {
  final Note? note;
  const CreateOrViewNoteScreen({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final noteBloc = context.read<NoteBloc>();
    final titleController = useTextEditingController(text: note?.title);
    final tagsController =
        useTextEditingController(text: note?.tags.join(', '));
    final contentController = useTextEditingController(text: note?.note);

    return AppScaffold(
      body: AppColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBackButton(
                title: 'Go back',
              ),
              Row(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (note != null) ...[
                    AppIconButton(
                      icon: iconDelete,
                      onTap: () {
                        AppDialog.dialog(
                          context,
                          DeleteNoteDialog(note: note!),
                        );
                      },
                    ),
                    XBox(10),
                    AppIconButton(
                      icon: note!.isArchived ? iconRestore : iconArchive,
                      onTap: () {
                        if (note!.isArchived) {
                          noteBloc.add(UnarchiveNote(id: note!.id));
                          AppNavigator(context).popRoute();
                          AppSnackbar.show(context, title: noteUnarchived);
                        } else {
                          AppDialog.dialog(
                            context,
                            ArchiveNoteDialog(note: note!),
                          );
                        }
                      },
                    ),
                  ],
                  AppTextButton(
                    text: 'Cancel',
                    onTap: () {
                      AppNavigator(context).popRoute();
                    },
                  ),
                  AppTextButton(
                    text: 'Save note',
                    color: theme.primary,
                    onTap: () {
                      if (titleController.text.trim().isEmpty) {
                        //TODO: show toast
                        return;
                      }
                      if (tagsController.text.trim().isEmpty) {
                        return;
                      }
                      if (contentController.text.trim().isEmpty) {
                        return;
                      }
                      if (note == null) {
                        noteBloc.add(
                          AddNote(
                            title: titleController.text.trim(),
                            tags: parseTags(tagsController.text.trim()),
                            note: contentController.text.trim(),
                          ),
                        );
                      } else {
                        noteBloc.add(
                          EditNote(
                            id: note!.id,
                            title: titleController.text.trim(),
                            tags: parseTags(tagsController.text.trim()),
                            note: contentController.text.trim(),
                          ),
                        );
                      }
                      AppNavigator(context).popRoute();
                      AppSnackbar.show(context, title: noteSaved);
                    },
                  ),
                ],
              ),
            ],
          ),
          const HorizontalLine(hasMargin: true),
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
              Expanded(
                child: PlainTextField(
                  controller: tagsController,
                  keyboardType: TextInputType.text,
                  hintText:
                      'Add tags separated by commas (e.g. Work, Planning)',
                ),
              ),
            ],
          ),
          if (note != null && note!.isArchived)
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
                note != null
                    ? formatDate(note!.createdAt, format: 'dd MMM yyyy')
                    : 'Not yet saved',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: theme.onSurface,
              )
            ],
          ),
          const HorizontalLine(hasMargin: true),
          PlainTextField(
            controller: contentController,
            hintText: 'Start typing your note here…',
          ),
        ],
      ),
    );
  }
}
