import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormText extends StatelessWidget {
  const CustomFormText({
    super.key,
    required this.name,
    required this.child,
  });

  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            name,
            style: kLabelPrimary,
          ),
        ),
        Flexible(child: child)
      ],
    );
  }
}
