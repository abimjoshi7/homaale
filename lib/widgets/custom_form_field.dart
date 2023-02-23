// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.isRequired,
    required this.child,
  });

  final String label;
  final bool isRequired;
  final Widget child;

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
              style: kPurpleText16,
            ),
            kWidth5,
            if (isRequired == true)
              const Text(
                '*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
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
