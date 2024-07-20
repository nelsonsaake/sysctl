import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

const kcPrimary = kcRed800;

final theme = ThemeData(
  //...

  useMaterial3: true,

  colorSchemeSeed: kcPrimary,

  buttonTheme: ButtonThemeData(
    padding: kp4,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kcPrimary,
    ),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: kcSlate800,
  ),

  drawerTheme: DrawerThemeData(
    endShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: kcNeutral100,
    ),
  ),
);
