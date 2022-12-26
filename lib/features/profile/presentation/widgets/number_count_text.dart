import 'package:flutter/material.dart';

class NumberCountText extends StatelessWidget {
  const NumberCountText({
    Key? key,
    required this.numberText,
    required this.textColor,
  }) : super(key: key);

  final String numberText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      numberText,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}
