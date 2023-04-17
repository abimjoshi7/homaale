import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(),
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
      dividerTheme:
          DividerThemeData(space: 0, thickness: 1.2, color: Colors.grey),
    ),
    AppTheme.darkTheme: ThemeData(
      textTheme: TextTheme(
          labelSmall: kLabelPrimary2,
          labelMedium: kLabelPrimary,
          displaySmall: kText13,
          displayMedium: kText14,
          displayLarge: kText17,
          headlineSmall: kHeading3,
          headlineMedium: kHelper13,
          headlineLarge: kHeading1,
          bodyMedium: TextStyle(
            color: kDarkThemeColor,
            fontSize: 14,
          ),
          bodySmall: kBodyText1,
          bodyLarge: kBoldText),
      // textTheme: GoogleFonts.poppinsTextTheme(),
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
        labelStyle: kTabBarTitle,
        labelPadding: EdgeInsets.all(15),
        labelColor: kColorSecondary,
        indicatorColor: kColorSecondary,
        unselectedLabelColor: kColorGrey,
      ),
      indicatorColor: kColorSecondary,
    ),
  };
}
