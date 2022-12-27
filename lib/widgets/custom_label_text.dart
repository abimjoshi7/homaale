import 'package:cipher/core/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: kLabelPrimary,
    );
  }
}
