import 'package:cipher/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class CustomImageTextBox extends StatelessWidget {
  const CustomImageTextBox({
    super.key,
    this.text,
    this.image,
  });

  final String? text;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image ??
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
            ),
        kHeight5,
        Flexible(
          child: Text(
            text ?? '',
          ),
        ),
      ],
    );
  }
}
