import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

final kDarkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.white,
    )
  ),
  textTheme: TextTheme(
    labelSmall: kLabelPrimarydark,
    labelMedium: kLabelPrimary2dak,
    displaySmall: kHeading3dark,
    displayMedium: kText14dark,
    displayLarge: kText17dark,
    headlineSmall:kPurpleText16dark ,
    headlineMedium: kHelper13dark,
    headlineLarge: kHeading1dark,
    bodyMedium: kText14dark,
    bodySmall: kBoldTextdark,
    bodyLarge: kBoldTextdark),
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
  colorScheme:ColorScheme.dark() ,
  cardColor: Colors.black,

);

final kLightTheme = ThemeData(
  cardColor: Colors.white,
  colorScheme:ColorScheme.light() ,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      )
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
    labelColor: kColorOrange,
    unselectedLabelColor: kColorGrey,
  ),
  indicatorColor: kColorPrimary,
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1.2,
  ),
);
