// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.child,
    required this.isRequired,
  });

  final String label;
  final Widget child;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: kLabelPrimary,
            ),
            kWidth5,
            if (isRequired == true)
              const Text(
                '*',
                style: TextStyle(
                  color: Color(0xffFE5050),
                ),
              )
            else
              const Text(''),
          ],
        ),
        child,
        addVerticalSpace(10),
      ],
    );
  }
}
