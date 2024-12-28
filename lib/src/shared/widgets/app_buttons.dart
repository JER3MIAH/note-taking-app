import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double fontSize;
  final double bHeight;
  final bool expanded;
  final Color? color;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.fontSize = 14,
    this.bHeight = 41,
    this.expanded = false,
    this.color,
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
          minimumSize: WidgetStatePropertyAll(
            expanded ? Size(double.infinity, bHeight) : null,
          ),
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(bHeight)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: AppText(
          title,
          fontSize: fontSize,
          color: textColor ?? appColors.white,
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onTap;
  const AppTextButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onTap,
      // style: ButtonStyle(
      //   backgroundColor: WidgetStatePropertyAll(
      //     (color ?? theme.surfaceBright),
      //   ),
      // ),
      child: AppText(
        text,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? theme.surfaceBright,
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  const AppIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          color: Colors.transparent,
          child: SvgAsset(
            icon,
            height: 20,
            color: Theme.of(context).colorScheme.surfaceBright,
          ),
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
                height: 20,
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
