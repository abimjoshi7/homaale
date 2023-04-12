// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    Key? key,
    required this.widget,
    required this.label,
    this.callback,
  }) : super(key: key);

  final Widget widget;
  final String label;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        children: [
          widget,
          kWidth5,
          Text(
            label,
            // style: kHelper13,
          ),
        ],
      ),
    );
  }
}
