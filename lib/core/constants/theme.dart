import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

final kDarkTheme = ThemeData(
  primaryColor: kColorPrimarydark,
  canvasColor: kColorLightSkyBluedark,

  // useMaterial3: true,

  appBarTheme: AppBarTheme(
      backgroundColor: kColorPrimarydark,
      iconTheme: IconThemeData(
        color: Colors.white,
      )),

  textTheme: GoogleFonts.poppinsTextTheme(
    TextTheme(
      labelSmall: kLabelPrimarydark,
      labelMedium: kLabelPrimary2dak,
      displaySmall: kText13dark,
      displayMedium: kText14dark,
      displayLarge: kText17dark,
      headlineSmall: kPurpleText16dark,
      headlineMedium: kPurpleText17dark,
      headlineLarge: kPurpleText19dark,
      bodyMedium: kText15dark,
      bodySmall: kText14dark,
      bodyLarge: kBoldTextdark,
    ),
  ),
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
  colorScheme: ColorScheme.dark(),
  cardColor: Color(0xff000000),
);

final kLightTheme = ThemeData(
  canvasColor: kColorLightSkyBlue,
  primaryColor: kColorPrimary,
  fontFamily: "Poppins",
  cardColor: Colors.white,
  colorScheme: ColorScheme.light(),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
  textTheme: GoogleFonts.poppinsTextTheme(
    TextTheme(
        labelSmall: kLabelPrimary,
        labelMedium: kLabelPrimary2,
        displaySmall: kText13,
        displayMedium: kBoldText,
        displayLarge: kText17,
        headlineSmall: kPurpleText16,
        headlineMedium: kPurpleText17,
        headlineLarge: kPurpleText19,
        bodyMedium: kText15,
        bodySmall: kText14,
        bodyLarge: kBoldText),
  ),
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
