import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_state.dart';
import 'package:note_taking_app/src/features/home/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class TagsView extends StatelessWidget {
  const TagsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<TagBloc, TagState>(
      builder: (_, state) {
        return AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Tags',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            YBox(20),
            if (state.tags.isEmpty)
              AppText(
                'Your tags will show here',
                color: theme.surfaceBright,
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.tags.length,
                  (index) {
                    final tag = state.tags[index];
                    return TagsTile(
                      title: tag,
                      onTap: () {
                        AppNavigator(context).pushNamed(
                          HomeRoutes.tagSelected,
                          args: tag,
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
