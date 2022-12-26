import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final Widget widget;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget,
        kWidth5,
        Text(
          label,
          style: kBodyText2,
        ),
      ],
    );
  }
}
