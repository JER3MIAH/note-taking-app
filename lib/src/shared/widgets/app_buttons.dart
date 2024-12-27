import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double fontSize;
  final double bHeight;
  final bool expanded;
  final Color? color;
  final Color? hoverColor;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.fontSize = 13,
    this.bHeight = 41,
    this.expanded = false,
    this.color,
    this.hoverColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BounceInAnimation(
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color ?? theme.primary),
          elevation: WidgetStatePropertyAll(0),
          overlayColor: WidgetStatePropertyAll(
            hoverColor ?? theme.primaryContainer,
          ),
          minimumSize: WidgetStatePropertyAll(
            expanded ? Size(double.infinity, bHeight) : null,
          ),
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(bHeight)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        child: AppText(
          title,
          fontSize: fontSize,
          color: textColor ?? theme.onPrimary,
        ),
      ),
    );
  }
}

class TextBackButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const TextBackButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap ?? () => AppNavigator(context).popRoute(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: [
              SvgAsset(
                iconArrowLeft,
                color: theme.surfaceContainer,
              ),
              AppText(
                title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: theme.surfaceContainer,
              )
            ],
          ),
        ),
      ),
    );
  }
}
