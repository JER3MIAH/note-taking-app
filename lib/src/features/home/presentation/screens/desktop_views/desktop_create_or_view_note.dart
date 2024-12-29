import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopCreateOrViewNote extends HookWidget {
  final Note? note;
  const DesktopCreateOrViewNote({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final noteBloc = context.read<NoteBloc>();
    final titleController = useTextEditingController(text: note?.title);
    final tagsController =
        useTextEditingController(text: note?.tags.join(', '));
    final contentController = useTextEditingController(text: note?.note);

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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlainTextField(
                        controller: contentController,
                        hintText: 'Start typing your note here…',
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
                                onTap: () {},
                              ),
                              AppButton(
                                title: 'Cancel',
                                bHeight: 41,
                                color: theme.primaryFixed,
                                onTap: () {},
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
          child: Padding(
            padding: const EdgeInsets.all(spacing200),
            child: Column(
              spacing: 10,
              children: [
                AppOutlinedButton(
                  onTap: () {},
                  title: 'Archive Note',
                  icon: iconArchive,
                ),
                AppOutlinedButton(
                  onTap: () {},
                  title: 'Delete Note',
                  icon: iconDelete,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
