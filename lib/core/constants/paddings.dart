import 'package:flutter/material.dart';

const kPadding5 = EdgeInsets.all(5);
const kPadding10 = EdgeInsets.all(10);
const kPadding15 = EdgeInsets.all(15);
const kPadding20 = EdgeInsets.all(20);
const kPadding25 = EdgeInsets.all(25);

EdgeInsets addPadding(BuildContext context, double size) {
  return EdgeInsets.symmetric(
    vertical: MediaQuery.of(context).size.height * (size),
    horizontal: MediaQuery.of(context).size.height * (size),
  );
}
