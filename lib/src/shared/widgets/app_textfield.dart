import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool multiLine;
  final VoidCallback? onTapClear;
  final String? Function(String?)? validator;
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText = '',
    required this.hintText,
    this.multiLine = false,
    this.onTapClear,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final tStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: theme.onSurface,
    );
    final border = OutlineInputBorder(
      borderSide:
          BorderSide(color: theme.inversePrimary.withValues(alpha: .25)),
      borderRadius: BorderRadius.circular(4),
    );

    return TextFormField(
      controller: controller,
      cursorColor: theme.primary,
      style: tStyle,
      keyboardType: multiLine ? TextInputType.multiline : TextInputType.text,
      maxLines: multiLine ? 8 : null,
      validator: validator,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: .0001),
        hintText: hintText,
        hintStyle: tStyle.copyWith(
          color: theme.onSurface.withValues(alpha: .25),
        ),
        contentPadding: multiLine
            ? null
            : const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 12,
              ),
        constraints: BoxConstraints(
          minHeight: multiLine ? 112 : 40,
          maxHeight: multiLine ? 112 : 40,
        ),
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: theme.error),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: theme.error),
        ),
      ),
    );
  }
}
