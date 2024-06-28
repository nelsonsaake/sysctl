import 'package:commons/ui/colors_values.dart';
import 'package:flutter/material.dart';

const kcPrimary = kcRed800;

final theme = ThemeData(
  //...

  useMaterial3: true,

  primaryColor: kcPrimary,

  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: kcPrimary,
    ),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: kcSlate800,
  ),
);
