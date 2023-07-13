import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

///this method is created for the sep digit
var numFormat = NumberFormat("###,###.0#", "en_US");

class ComaSeparatedOnDigit extends StatelessWidget {
  final String digitText;
  final TextStyle? style;
  const ComaSeparatedOnDigit({Key? key, required this.digitText, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      numFormat.format(int.parse(digitText)),
      style: style ?? Theme.of(context).textTheme.bodySmall,
    );
  }
}
