import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kDarkTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  brightness: Brightness.dark,
  radioTheme: RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
    fillColor: MaterialStateColor.resolveWith(
      (states) => kColorSecondary,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelPadding: EdgeInsets.all(15),
    labelColor: kColorSecondary,
    indicatorColor: kColorSecondary,
    unselectedLabelColor: kColorGrey,
  ),
);

final kLightTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  brightness: Brightness.light,
  radioTheme: RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
    fillColor: MaterialStateColor.resolveWith(
      (states) => kColorSecondary,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: kColorSecondary,
    unselectedLabelColor: kColorGrey,
  ),
  indicatorColor: kColorSecondary,
);
