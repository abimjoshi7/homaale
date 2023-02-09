import 'package:flutter/material.dart';

// Different SizedBoxes
const kHeight5 = SizedBox(
  height: 5,
);
const kHeight10 = SizedBox(
  height: 10,
);
const kHeight15 = SizedBox(
  height: 15,
);
const kHeight20 = SizedBox(
  height: 20,
);
const kHeight50 = SizedBox(
  height: 50,
);
const kWidth5 = SizedBox(
  width: 5,
);
const kWidth10 = SizedBox(
  width: 10,
);
const kWidth15 = SizedBox(
  width: 15,
);
const kWidth20 = SizedBox(
  width: 20,
);

Widget addVerticalSpace(double size) {
  return SizedBox(
    height: size,
  );
}

Widget addHorizontalSpace(double size) {
  return SizedBox(
    width: size,
  );
}
