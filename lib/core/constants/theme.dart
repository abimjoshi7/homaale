import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

final kDarkTheme = ThemeData(
  textTheme: TextTheme(
    labelSmall: kLabelPrimary2,
    labelMedium: kLabelPrimary,
    displaySmall: kText13dark,
    displayMedium: kText14dark,
    displayLarge: kText17,
    headlineSmall: kHeading3,
    headlineMedium: kHelper13,
    headlineLarge: kHeading1,
    bodyMedium: kText14,
    bodySmall: kBodyText1,
    bodyLarge: kBoldText),
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
  textTheme: TextTheme(
      labelSmall: kLabelPrimary2,
      labelMedium: kLabelPrimary,
      displaySmall: kText13,
      displayMedium: kText14,
      displayLarge: kText17,
      headlineSmall: kHeading3,
      headlineMedium: kHelper13,
      headlineLarge: kHeading1,
      bodyMedium: kText14,
      bodySmall: kBodyText1,
      bodyLarge: kBoldText),
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
