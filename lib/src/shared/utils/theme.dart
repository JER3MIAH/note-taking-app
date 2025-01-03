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
    surfaceBright: appColors.neutral700,
    primary: appColors.blue500,
    primaryContainer: appColors.white,
    secondaryContainer: appColors.neutral100,
    surfaceContainerHigh: appColors.white,
    primaryFixed: appColors.neutral100,
    onPrimary: appColors.neutral950,
    inversePrimary: appColors.neutral200,
    inverseSurface: appColors.neutral300,
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
    surfaceBright: appColors.neutral300,
    primary: appColors.blue500,
    onPrimary: appColors.white,
    primaryContainer: appColors.neutral950,
    secondaryContainer: appColors.neutral500,
    surfaceContainerHigh: appColors.neutral700,
    primaryFixed: appColors.neutral800,
    inversePrimary: appColors.neutral700,
    inverseSurface: appColors.neutral600,
    secondary: appColors.blue50,
    tertiary: appColors.blue700,
    error: appColors.red500,
    errorContainer: appColors.red100,
  ),
);
