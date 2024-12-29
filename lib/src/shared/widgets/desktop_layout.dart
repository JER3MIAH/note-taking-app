import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class DesktopLayout extends HookWidget {
  final String topTitle;
  final Widget sideContent;
  final Widget body;

  const DesktopLayout({
    super.key,
    this.topTitle = '',
    required this.sideContent,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final searchController = useTextEditingController();
    final searchFilter = useState<String>('');

    return Expanded(
      child: Column(
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
                if (searchFilter.value.isNotEmpty)
                  Text.rich(
                    TextSpan(
                      text: 'Showing results for: ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: theme.onSurfaceVariant,
                      ),
                      children: [
                        TextSpan(
                          text: searchFilter.value,
                          style: TextStyle(
                            color: theme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  AppText(
                    topTitle,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: theme.onSurface,
                  ),
                Row(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      leadingIcon: iconSearch,
                      controller: searchController,
                      hintText: 'Search by title, content, or tags…',
                      onChanged: (value) {
                        searchFilter.value = searchController.text.trim();
                      },
                    ),
                    AppIconButton(
                      icon: iconSettings,
                      height: 28,
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
                  width: 290,
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
                  child: sideContent,
                ),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
