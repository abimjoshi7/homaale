import 'dart:math';

import 'package:flutter/painting.dart';

import 'iterable.dart';

const kColorPrimary = Color(0xff211D4F);
const kColorPrimaryAccent = Color(0xff5C6096);
const kColorSecondary = Color(0xffFFCA6A);
const kColorBlue = Color(0xff3EAEFF);
const kColorAmber = Color(0xffFF9700);
const kColorGreen = Color(0xff38C675);
const kColorGrey = Color(0xffCED4DA);
const kColorDarkGrey = Color(0xff212529);
const kColorDarkGrey2 = Color(0xff495057);
const kColorSilver = Color(0xff9CA0C1);
const kColorTeal = Color(0xff227196);
const kColorLightSkyBlue = Color(0xffEDF4FF);
const kColorPurple = Color(0xffB187F2);
const kColorOrange = Color(0xffFF9700);
const kColorPink = Color(0xfffe5050);

Color randomColorGenerator() {
  return colorList[Random().nextInt(colorList.length)];
}
