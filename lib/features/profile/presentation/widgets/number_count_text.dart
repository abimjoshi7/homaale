import 'package:flutter/material.dart';

class NumberCountText extends StatelessWidget {
  const NumberCountText({
    super.key,
    required this.numberText,
    required this.textColor,
  });

  final String numberText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      numberText,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
    );
  }
}
