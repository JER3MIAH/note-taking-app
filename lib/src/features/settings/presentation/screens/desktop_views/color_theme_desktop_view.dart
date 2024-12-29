import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';
import 'package:note_taking_app/src/features/settings/presentation/components/components.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class ColorThemeDesktopView extends HookWidget {
  const ColorThemeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final themeBloc = context.read<ThemeBloc>();
    final selectedTheme = useState<AppTheme>(themeBloc.state.appTheme);

    return Padding(
      padding: const EdgeInsets.all(spacing300),
      child: Align(
        alignment: Alignment.topLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Color Theme',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: theme.onPrimary,
              ),
              YBox(5),
              AppText(
                'Choose your color theme:',
                fontSize: 14,
                color: theme.surfaceBright,
              ),
              YBox(20),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 15,
                children: List.generate(
                  AppTheme.values.length,
                  (index) {
                    final item = AppTheme.values[index];
                    return ColorThemeTile(
                      appTheme: item,
                      isSelected: item == selectedTheme.value,
                      onTap: () {
                        selectedTheme.value = item;
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
                      themeBloc.add(
                        ChangeTheme(
                          theme: selectedTheme.value,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
