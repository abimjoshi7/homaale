// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    this.label,
    this.isRequired = false,
    this.child,
    this.rightSection,
  }) : super(key: key);

  final String? label;
  final bool? isRequired;
  final Widget? child;
  final Widget? rightSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  label ?? '',
                  style: kPurpleText16,
                ),
                if (isRequired == true)
                  const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  )
                else
                  const Text(''),
              ],
            ),
            rightSection ?? SizedBox.shrink(),
          ],
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
