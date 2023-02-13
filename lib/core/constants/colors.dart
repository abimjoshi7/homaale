import 'dart:math';

import 'package:cipher/core/constants/lists.dart';
import 'package:flutter/painting.dart';

const kColorPrimary = Color(0xff3D3F7D);
const kColorPrimaryAccent = Color(0xff646597);
const kColorSecondary = Color(0xffFFCA6A);
const kColorBlue = Color(0xff3EAEFF);
const kColorAmber = Color(0xffFF9700);
const kColorGreen = Color(0xff38C675);
const kColorGrey = Color(0xffCED4DA);
const kColorTeal = Color(0xff227196);

Color randomColorGenerator() {
  return colorList[Random().nextInt(colorList.length)];
}
