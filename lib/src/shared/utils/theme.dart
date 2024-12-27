import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/utils/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.white,
  colorScheme: ColorScheme.light(
    surface: appColors.white,
    onSurface: appColors.black,
    onSurfaceVariant: appColors.neutral600,
    surfaceContainer: appColors.neutral600,
    primary: appColors.blue500,
    onPrimary: appColors.neutral950,
    inversePrimary: appColors.neutral200,
    secondary: appColors.blue50,
    tertiary: appColors.blue700,
    error: appColors.red500,
    errorContainer: appColors.red100,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.black,
  colorScheme: ColorScheme.dark(
    surface: appColors.black,
    onSurface: appColors.white,
    onSurfaceVariant: appColors.neutral400,
     surfaceContainer: appColors.white,
    primary: appColors.blue500,
    onPrimary: appColors.white,
    inversePrimary: appColors.neutral800,
    secondary: appColors.blue50,
    tertiary: appColors.blue700,
    error: appColors.red500,
    errorContainer: appColors.red100,
  ),
);
