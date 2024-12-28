import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool multiLine;
  final VoidCallback? onTapClear;
  final String? Function(String?)? validator;
  final String? leadingIcon;
  final void Function(String)? onChanged;
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText = '',
    required this.hintText,
    this.multiLine = false,
    this.onTapClear,
    this.validator,
    this.onChanged,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final tStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: theme.onSurface,
    );
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: theme.inverseSurface),
      borderRadius: BorderRadius.circular(8),
    );

    return TextFormField(
      controller: controller,
      cursorColor: theme.primary,
      style: tStyle,
      keyboardType: multiLine ? TextInputType.multiline : TextInputType.text,
      maxLines: multiLine ? 8 : null,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: leadingIcon == null ? null : SvgAsset(leadingIcon!),
        errorStyle: const TextStyle(height: .0001),
        hintText: hintText,
        hintStyle: tStyle.copyWith(
          color: theme.onSurfaceVariant,
        ),
        contentPadding: multiLine
            ? null
            : const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 12,
              ),
        constraints: BoxConstraints(
          minHeight: multiLine ? 112 : 44,
          maxHeight: multiLine ? 112 : 44,
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
