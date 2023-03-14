import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    super.key,
    required this.label,
    required this.widget,
  });

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
          style: kHelper13,
        ),
      ],
    );
  }
}
