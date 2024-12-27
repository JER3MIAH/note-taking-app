import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/font_bloc/font_state.dart';
import 'package:note_taking_app/src/features/settings/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class FontThemeScreen extends HookWidget {
  const FontThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final fontBloc = context.read<FontBloc>();
    final selectedFont = useState<AppFont>(fontBloc.state.appFont);

    return AppScaffold(
      body: AppColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBackButton(title: 'Setting'),
          YBox(10),
          AppText(
            'Font Theme',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: theme.onPrimary,
          ),
          YBox(5),
          AppText(
            'Choose your font theme:',
            fontSize: 14,
            color: theme.surfaceBright,
          ),
          YBox(20),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: List.generate(
              AppFont.values.length,
              (index) {
                final item = AppFont.values[index];
                return FontThemeTile(
                  appFont: item,
                  isSelected: item == selectedFont.value,
                  onTap: () {
                    selectedFont.value = item;
                  },
                );
              },
            ),
          ),
          YBox(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                title: 'Apply changes',
                onTap: () {
                  fontBloc.add(
                    ChangeFont(
                      font: selectedFont.value,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
