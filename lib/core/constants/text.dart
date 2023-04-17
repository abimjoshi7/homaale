import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/theme.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';

import '../../features/theme/presentation/bloc/theme_event.dart';

Color kDarkThemeColor = Colors.white;

const kTabBarTitle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: Color(
    0xff343A40,
  ),
);

const kLightBlueText12 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Color(0xff3eaeff),
);

const kLightBlueText14 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Color(0xff3eaeff),
);

const kTealText18 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18,
  color: kColorTeal,
);
const kPurpleText12 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: kColorDarkPurple,
);
const kPurpleText13 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 13,
  color: kColorDarkPurple,
);

const kPurpleText14 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Color(0xff2D2D66),
);

const kPurpleText16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0xff3D3F7D),
);

const kPurpleText17 = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w600,
  color: Color(0xff3D3F7D),
);

final kPurpleText19 = TextStyle(
  color: AppThemes.appThemeData == AppTheme.darkTheme
      ? kColorSecondary
      :
      Color(0xff3D3F7D),
  fontWeight: FontWeight.w600,
  fontSize: 19,
);

const kText13 = TextStyle(
  fontSize: 13,
  color: Color(0xff495057),
  fontWeight: FontWeight.normal,
);
const kText14 = TextStyle(
  fontSize: 14,
  color: Color(0xff495057),
  fontWeight: FontWeight.w500,
);

const kText15 = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: Color(0xff495057),
);

const kText17 = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w600,
  color: Color(0xff495057),
);

const kText20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const kLabelPrimary = TextStyle(
  color: kColorPrimary,
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

const kLabelPrimary2 = TextStyle(
  color: kColorPrimary,
  height: 16,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const kHeading1 = TextStyle(
  color: kColorPrimary,
  fontWeight: FontWeight.w600,
  fontSize: 32,
);

const kHeading3 = TextStyle(
  color: kColorPrimary,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

const kHelper13 = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: Color(0xff495057),
);

const kSkipHelper = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Color(0xff868E96),
);

const kHeading3seconday = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

const kSubHeading = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

const kInfo = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 10,
);

const kRequirements = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: kColorSilver,
);

const kBoldText = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Colors.black,
);

const kBodyText1 =
    TextStyle(color: Color(0xff5C6096), fontWeight: FontWeight.w500);

const kHighlightedText = TextStyle(color: Color(0xff3EAEFF), fontSize: 10);
