import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormContainer extends StatelessWidget {
  const CustomFormContainer({
    super.key,
    this.hintText = '',
    this.trailingWidget = const SizedBox.shrink(),
    this.leadingWidget = const SizedBox.shrink(),
  });

  final String hintText;
  final Widget trailingWidget;
  final Widget leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(
            0xffDEE2E6,
          ),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leadingWidget,
                kWidth10,
                Text(
                  hintText,
                  style: kHelper13,
                ),
              ],
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }
}
