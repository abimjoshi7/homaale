import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    required this.heading,
    required this.content,
    required this.onTap,
  });

  final String heading;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Text(
              heading,
              style: kPurpleText19,
            ),
            kHeight10,
            Text(content),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  text: 'Continue',
                  voidCallback: onTap,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
