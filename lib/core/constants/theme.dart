import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  indicatorColor: kColorSecondary,
);

final kLightTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
  ),
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
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1.2,
  ),
);
