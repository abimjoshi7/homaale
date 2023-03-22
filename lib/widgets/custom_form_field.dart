import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.label,
    this.isRequired = false,
    this.child,
  });

  final String? label;
  final bool? isRequired;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
