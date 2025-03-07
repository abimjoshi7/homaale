// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    this.label,
    this.isRequired = false,
    this.child,
    this.rightSection,  this.textStyle,
  }) : super(key: key);

  final String? label;
  final bool? isRequired;
  final Widget? child;
  final Widget? rightSection;
  final TextStyle? textStyle;

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
                AutoSizeText(
                  label ?? '',
                  style: textStyle ??  Theme.of(context).textTheme.headlineSmall,
                  maxLines: 2,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
