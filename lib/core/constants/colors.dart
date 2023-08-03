import 'dart:math';

import 'package:flutter/painting.dart';

import 'constants.dart';
import 'iterable.dart';

const kColorPrimary = Color(0xff211D4F);
const kColorPrimarydark = Color(0xff212529);
const kColorPrimaryAccent = Color(0xff5C6096);
const kColorSecondary = Color(0xffFFCA6A);
const kColorBlue = Color(0xff3EAEFF);
const kColorAmber = Color(0xffFF9700);
const kColorAmber50 = Color(0xffecd7bd);
const kColorGreen = Color(0xff38C675);
const kColorGreen50 = Color(0xffc5f5e0);
const kColorDarkBlue = Color(0xff1CADEF);
const kColorGrey = Color(0xffCED4DA);
const kColorLightGrey = Color(0xff8F8F8F);
const kColorDarkGrey = Color(0xff212529);
const kColorDarkGrey2 = Color(0xff495057);
const kColorDark = Color(0xff343A40);
const kColorGreyDark = Color(0xff495057);
const kColorSilver = Color(0xff9CA0C1);
const kColorTeal = Color(0xff227196);
const kColorLightSkyBlue = Color.fromARGB(255, 169, 197, 243);
const kColorLightSkyBluedark = Color(0xffEDF5FF);
const kColorPurple = Color(0xffB187F2);
const kColorDarkPurple = Color(0xff3D3F7D);
const kColorOrange = Color(0xffFF9700);
const kColorPink = Color(0xfffe5050);
const kColorPink50 = Color(0xfff5aeae);

Color randomColorGenerator() {
  return colorList[Random().nextInt(colorList.length)];
}
