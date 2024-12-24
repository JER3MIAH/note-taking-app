import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/utils/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: appColors.blue500,
    secondary: appColors.blue50,
    tertiary: appColors.blue700,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: appColors.blue500,
    secondary: appColors.blue50,
    tertiary: appColors.blue700,
  ),
);
