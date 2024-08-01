import 'package:commons/commons.dart';
import 'package:commons/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kcPrimary = kcNeutral200;

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

  textTheme: GoogleFonts.nunitoTextTheme().copyWith(
    bodyLarge: const Text("").fsLG().fcNeutral200().style,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kcNeutral800,
    contentPadding: kp0,
    hintStyle: const TextStyle(color: kcNeutral600),
    labelStyle: const TextStyle(color: kcNeutral100),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: kcNeutral500, width: .5),
      // borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: kcNeutral500, width: .5),
      // borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: kcNeutral400, width: .5),
      // borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  ),

  iconTheme: const IconThemeData(
    size: 20.0,
  ),

  popupMenuTheme: PopupMenuThemeData(
    color: kcRed800,
    shape: b(color: kcAmber600),
    elevation: 1,
    iconColor: kcAmber300,
    textStyle: const TextStyle(color: kcNeutral300),
  ),
);
